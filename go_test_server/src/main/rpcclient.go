package main
 
import (
    "demo/rpc"
    "fmt"
    "git.apache.org/thrift.git/lib/go/thrift"
    "net"
    "os"
    "time"
)
 
func main() {
    startTime := currentTimeMillis()
    //transportFactory := thrift.NewTFramedTransportFactory(thrift.NewTTransportFactory())
    transportFactory := thrift.NewTTransportFactory()
   // protocolFactory := thrift.NewTBinaryProtocolFactoryDefault()
    //protocolFactory := thrift.NewTCompactProtocolFactory()
    protocolFactory := thrift.NewTJSONProtocolFactory()
    //protocolFactory := thrift.NewTSimpleJSONProtocolFactory()
 
    transport, err := thrift.NewTSocket(net.JoinHostPort("10.10.36.143", "8090"))
    if err != nil {
        fmt.Fprintln(os.Stderr, "error resolving address:", err)
        os.Exit(1)
    }
 
    useTransport := transportFactory.GetTransport(transport)
    client := rpc.NewRpcServiceClientFactory(useTransport, protocolFactory)
    if err := transport.Open(); err != nil {
        fmt.Fprintln(os.Stderr, "Error opening socket to 127.0.0.1:19090", " ", err)
        os.Exit(1)
    }
    defer transport.Close()
 
    for i := 0; i < 1000; i++ {
        argStruct := &rpc.ArgStruct{}
        argStruct.ArgByte = 53
        argStruct.ArgString = "str 测试字符串\"\t\n\r\b\f value"
        argStruct.ArgI16 = 54
        argStruct.ArgI32 = 12
        argStruct.ArgI64 = 43
        argStruct.ArgDouble = 11.22
        argStruct.ArgBool = true
        paramMap := make(map[string]string)
        paramMap["name"] = "namess"
        paramMap["pass"] = "vpass"
        paramMapI32Str := make(map[int32]string)
        paramMapI32Str[10] = "val10"
        paramMapI32Str[20] = "val20"
        paramSetStr := make(map[string]bool)
        paramSetStr["ele1"] = true
        paramSetStr["ele2"] = true
        paramSetStr["ele3"] = true
        paramSetI64 := make(map[int64]bool)
        paramSetI64[11] = true
        paramSetI64[22] = true
        paramSetI64[33] = true
        paramListStr := []string{"l1.","l2."}
        r1, e1 := client.FunCall(argStruct,
            53, 54, 12, 34, 11.22, "login", paramMap,paramMapI32Str,
            paramSetStr, paramSetI64, paramListStr, false)
        fmt.Println(i, "Call->", r1, e1)
        break
    }
 
    endTime := currentTimeMillis()
    fmt.Println("Program exit. time->", endTime, startTime, (endTime - startTime))
}
 
// 转换成毫秒
func currentTimeMillis() int64 {
    return time.Now().UnixNano() / 1000000
}
