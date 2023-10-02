# Define la ruta donde se instalará Redmine
$RedminePath = "D:\env\redmine"

# Descarga y verifica Ruby
if (-not (Test-Path "ruby.7z")) {
    Invoke-WebRequest -Uri "https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-3.2.2-1/rubyinstaller-3.2.2-1-x64.7z" -OutFile "ruby.7z"
}
if (-not (Test-Path "$RedminePath\ruby")) {
    & "D:\env\7-Zip\7z.exe" x "ruby.7z" -o"$RedminePath\ruby" -y
}
# if (-not (Test-Path "$RedminePath\ruby\bin\ruby.exe")) {
#     throw "No se pudo descargar o extraer Ruby"
# }

# Configura las variables de entorno para Ruby
$Env:Path += ";$RedminePath\ruby\bin"
[Environment]::SetEnvironmentVariable("RUBYOPT", "-Eutf-8")

# Descarga y verifica Redmine
if (-not (Test-Path "redmine.zip")) {
    Invoke-WebRequest -Uri "https://www.redmine.org/releases/redmine-5.0.5.zip" -OutFile "redmine.zip"
}
if (-not (Test-Path "$RedminePath\redmine")) {
    Expand-Archive -Path "redmine.zip" -DestinationPath "$RedminePath"
}
if (-not (Test-Path "$RedminePath\redmine\config\database.yml.example")) {
    throw "No se pudo descargar o extraer Redmine"
}

$Env:Path += ";$RedminePath\redmine\bin"


# Configura las variables de entorno para Redmine
[Environment]::SetEnvironmentVariable("REDMINE_HOME", "$RedminePath\redmine")
[Environment]::SetEnvironmentVariable("RAILS_ENV", "production")

# Instala las gemas requeridas para Redmine
cd "$RedminePath\redmine"
gem install bundler
bundle install --without development test

# Configura Redmine para usar SQLite
cp config\database.yml.example config\database.yml
(Get-Content config\database.yml) | ForEach-Object { $_ -replace "production:\s+adapter: mysql2", "production:\n  adapter: sqlite3\n  database: db\redmine.sqlite3" } | Set-Content config\database.yml

# Crea la base de datos SQLite
rake db:migrate RAILS_ENV=production

# Inicia Redmine
rails server -e production
