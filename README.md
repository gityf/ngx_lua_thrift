# ngx_lua_thrift [![MIT License][license-svg]][license-url]
    to access thrift by lua.
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
## demo of lua thrift client
```lua
    require "rpc_RpcService"
require "TFramedTransport"
require "TBinaryProtocol"
require "TJsonProtocol"
require "TCompactProtocol"
require "TSocket"
_M = {}
function _M.demoFunc()
    local socket = TSocket:new{
        host='127.0.0.1',
        port=8090
    }
    --local protocol = TBinaryProtocol:new{
    -- local protocol = TCompactProtocol:new{
        --trans = socket
    --}
    local protocol = TJSONProtocolFactory:getProtocol(socket)
    --local protocol = TCompactProtocolFactory:getProtocol(socket)
    client = RpcServiceClient:new{
        protocol = protocol
    }
    local argStruct = ArgStruct:new{
      argByte = 53,
      argString = "str 测试字符串\"\t\n\r\'\b\fvalue",
      argI16 = 54,
      argI32 = 12.3,
      argI64 = 43.32,
      argDouble = 11.22,
      argBool = true
    }
print("11")
    -- Open the socket  
    socket:open()
    pmap = {}
    pmap.name = "namess"
    pmap.pass = "vpass"
    pistrmap = {}
    pistrmap[10] = "val10"
    pistrmap[20] = "val20"
print("21")
    ret = client:funCall(argStruct, 53, 54, 12, 34, 11.22, "login", pmap,
        pistrmap,
        {"ele1", "ele2", "ele3"},
        {11,22,33},
        {"l1.","l2."}, false);
    res = ""
    for k,v in pairs(ret)
    do
        print(k, v)
        res = res .. k .."." .. v .. "<br>"
    end
    return res
end
return _M
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
