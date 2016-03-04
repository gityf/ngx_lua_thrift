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
