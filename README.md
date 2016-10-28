# ngx_lua_thrift to access thrift by lua. [![API Documentation]][![MIT License][license-svg]][license-url]
## protocol
```bash
    Support protocol: binary,compact and JSON.
    binary: TBinaryProtocol.lua
    compact: TCompactProtocol.lua
    JSON:TJsonProtocol.lua
    Support transport: RawSocket,Buffered,Framed and Http.
```
## socket
```bash
    socket: ngx.socket.tcp()
```
## Steps of installing
======
```
    download https://openresty.org/download/openresty-x.y.z.a.tar.gz .
    install openresty.
    To copy all files in lualib to directory openresty/lualib/
    To cpoy all conf file to directory openresty/nginx/conf/
    compile source in directory openresty/lualib/libthrift/c
    Start openresty nginx server.
```
## Testing
=======
    To access web url http://127.0.0.1:8000/v1/lua_thrift and get result.
```
          1.return 1 by FunCall.
          2.return 2 by FunCall.
```
[license-url]: https://github.com/deuill/go-php/blob/master/LICENSE
[license-svg]: https://img.shields.io/badge/license-MIT-blue.svg
