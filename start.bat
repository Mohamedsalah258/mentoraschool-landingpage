@echo off
echo ===================================================
echo     Demarrage du Site Vitrine Mentora School
echo ===================================================
echo.

:: Check for Node/npx
where npx >nul 2>nul
if %errorlevel% equ 0 (
    echo [INFO] Serveur local Node.js detecte.
    echo [INFO] Demarrage du serveur local sur http://localhost:3000 ...
    echo [INFO] Le site va s'ouvrir automatiquement dans votre navigateur.
    echo.
    start http://localhost:3000
    npx -y serve -p 3000 .
    goto end
)

:: Check for Python
where python >nul 2>nul
if %errorlevel% equ 0 (
    echo [INFO] Python detecte.
    echo [INFO] Demarrage du serveur local HTTP sur http://localhost:8000 ...
    echo [INFO] Le site va s'ouvrir automatiquement dans votre navigateur.
    echo.
    start http://localhost:8000
    python -m http.server 8000
    goto end
)

:: Fallback directly to double-click index.html
echo [WARNING] Aucun serveur de developpement (Node.js/Python) detecte.
echo [INFO] Ouverture directe du fichier index.html dans votre navigateur...
echo.
start index.html

:end
pause
