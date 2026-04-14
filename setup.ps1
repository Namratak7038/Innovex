#!/usr/bin/env powershell
# SmartOPD Backend Setup Script for PowerShell

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "SmartOPD Backend Setup" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Check if Node.js is installed
$nodeCheck = try { node --version 2>&1 } catch { $null }
if ($null -eq $nodeCheck) {
    Write-Host "[!] Node.js not found!" -ForegroundColor Red
    Write-Host "Download from: https://nodejs.org/" -ForegroundColor Yellow
    Write-Host "Install Node.js v18+ LTS version" -ForegroundColor Yellow
    Write-Host "Then run this script again" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
} else {
    Write-Host "[OK] Node.js installed:" -ForegroundColor Green
    node --version
    npm --version
    Write-Host ""
}

# Check MongoDB
Write-Host ""
Write-Host "[*] MongoDB Configuration:" -ForegroundColor Cyan
Write-Host "MongoDB should be running locally or use MongoDB Atlas" -ForegroundColor Yellow
Write-Host "Update MongoDB URI in .env if needed" -ForegroundColor Yellow
Write-Host ""

# Install dependencies
Write-Host "[*] Installing npm dependencies..." -ForegroundColor Yellow
npm install
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] npm install failed" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "[OK] Dependencies installed successfully!" -ForegroundColor Green
Write-Host ""

# Create .env file
if (-not (Test-Path ".env")) {
    Write-Host "[*] Creating .env file..." -ForegroundColor Yellow
    @"
PORT=4000
MONGODB_URI=mongodb://127.0.0.1:27017/smartopd
"@ | Out-File -FilePath ".env" -Encoding UTF8
    Write-Host "[OK] .env file created with default values" -ForegroundColor Green
    Write-Host ""
}

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "[OK] Setup Complete!" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Starting backend server on http://localhost:4000" -ForegroundColor Cyan
Write-Host "Press Ctrl+C to stop" -ForegroundColor Yellow
Write-Host ""

# Start dev server
npm run dev
