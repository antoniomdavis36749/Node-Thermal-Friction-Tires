#Requires -Version 5.1
param(
    [string]$OutDir = '',
    [string]$ZipName = 'TireWearThermalsReSpin_CompatTires.zip'
)

$ErrorActionPreference = 'Stop'
$ModRoot = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent
if (-not $OutDir) {
    $OutDir = Join-Path (Split-Path $PSScriptRoot -Parent) 'output'
}
New-Item -ItemType Directory -Force -Path $OutDir | Out-Null

function New-ZipFromStage {
    param([string]$StageDir, [string]$DestZip)
    $py = @'
import sys, zipfile
from pathlib import Path
stage = Path(sys.argv[1])
dest = Path(sys.argv[2])
if dest.exists():
    dest.unlink()
with zipfile.ZipFile(dest, "w", compression=zipfile.ZIP_DEFLATED) as zf:
    dirs = set()
    files = []
    for p in stage.rglob("*"):
        rel = p.relative_to(stage).as_posix()
        if p.is_dir():
            dirs.add(rel.rstrip("/") + "/")
            parts = rel.split("/")
            for i in range(1, len(parts)):
                dirs.add("/".join(parts[:i]) + "/")
        else:
            files.append(p)
            parts = rel.split("/")
            for i in range(1, len(parts)):
                dirs.add("/".join(parts[:i]) + "/")
    for d in sorted(dirs):
        zf.writestr(zipfile.ZipInfo(d), b"")
    for p in files:
        arc = p.relative_to(stage).as_posix()
        zf.write(p, arcname=arc)
print(dest)
'@
    $tmpPy = Join-Path $env:TEMP ('respin-tires-zip-' + [guid]::NewGuid().ToString('N') + '.py')
    Set-Content -Path $tmpPy -Value $py -Encoding UTF8
    try {
        python $tmpPy $StageDir $DestZip
        if ($LASTEXITCODE -ne 0) { throw "Python zip failed ($LASTEXITCODE)" }
    } finally {
        Remove-Item -Force $tmpPy -ErrorAction SilentlyContinue
    }
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $zip = [IO.Compression.ZipFile]::OpenRead($DestZip)
    try {
        $roots = $zip.Entries | ForEach-Object {
            ($_.FullName -replace '\\', '/').Split('/')[0]
        } | Select-Object -Unique | Sort-Object
        Write-Host ("Wrote $DestZip")
        Write-Host ("Zip root entries: " + ($roots -join ', '))
    } finally {
        $zip.Dispose()
    }
}

if ($ZipName -notmatch '\.zip$') { $ZipName = "$ZipName.zip" }
$zipPath = Join-Path $OutDir $ZipName
$vehicles = Join-Path $ModRoot 'vehicles'
if (-not (Test-Path $vehicles)) { throw "Missing vehicles/: $vehicles" }

$vstage = Join-Path $env:TEMP ("respin-tires-" + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Force -Path $vstage | Out-Null
try {
    Copy-Item -Recurse -Force $vehicles (Join-Path $vstage 'vehicles')
    foreach ($f in @('COMPAT_TIRES.md', 'license', 'NOTICE', 'CREDITS.md', 'README.md', 'LISTING.md')) {
        $src = Join-Path $ModRoot $f
        if (Test-Path $src) { Copy-Item -Force $src (Join-Path $vstage $f) }
    }
    $compatInfo = Join-Path $ModRoot 'mod_info\TWTRS_COMPAT'
    if (Test-Path $compatInfo) {
        New-Item -ItemType Directory -Force -Path (Join-Path $vstage 'mod_info') | Out-Null
        Copy-Item -Recurse -Force $compatInfo (Join-Path $vstage 'mod_info\TWTRS_COMPAT')
    }
    New-ZipFromStage -StageDir $vstage -DestZip $zipPath
    Write-Host 'Install alongside core ReSpin. Do not merge into the core zip.'
}
finally {
    if (Test-Path $vstage) { Remove-Item -Recurse -Force $vstage }
}
