# dev-tools

## Automated scripts
Copy keys into ~/.ssh/

### Ubuntu
```bash
$ sudo apt install curl
$ sudo curl -s https://raw.githubusercontent.com/kevnord/dev-tools/main/setup-ubuntu-19.04.sh | bash -s
```
### Fedora
```bash
$ sudo curl -s https://raw.githubusercontent.com/kevnord/dev-tools/main/setup-fedora.sh | bash -s
```
### Windows 10
RUN AS ADMINISTRATOR
```powershell
> iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/kevnord/dev-tools/main/windows-10.ps1'))
```
