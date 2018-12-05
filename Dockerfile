FROM microsoft/dotnet-framework:4.7.2-sdk

ENV NODE_VERSION 10.14.1
ENV NODE_SHA256 3b471bba5b19ef58b65460b1f0b71d27bceeaa9218809f75dedc98a6f7a426be

RUN powershell -Command \
    wget -Uri "https://nodejs.org/dist/v$env:NODE_VERSION/node-v$env:NODE_VERSION-x64.msi" -OutFile node.msi -UseBasicParsing ; \
    if ((Get-FileHash node.msi -Algorithm sha256).Hash -ne $env:NODE_SHA256) {exit 1} ; \
    Start-Process -FilePath msiexec -ArgumentList /q, /i, node.msi -Wait ; \
    Remove-Item -Path node.msi