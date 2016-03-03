package main

import (
    "demo/rpc"
    "fmt"
    "git.apache.org/thrift.git/lib/go/thrift"
    "os"
)

const (
    NetworkAddr = ":8090"
)

type RpcServiceImpl struct {
}

func (this *RpcServiceImpl) FunCall(argStruct *rpc.ArgStruct,
    argByte int8, argI16 int16, argI32 int32,
    argI64 int64, argDouble float64, argString string,
    paramMapStrStr map[string]string, paramMapI32Str map[int32]string,
    paramSetStr map[string]bool, paramSetI64 map[int64]bool,
    paramListStr []string, argBool bool) (r []string, err error) {
    fmt.Println("-->FunCall:", argStruct)
    r = append(r, "return 1 by FunCall.")
    r = append(r, "return 2 by FunCall.")
    return
}

func main() {
    //transportFactory := thrift.NewTFramedTransportFactory(thrift.NewTTransportFactory())
    transportFactory := thrift.NewTTransportFactory()
    //protocolFactory := thrift.NewTBinaryProtocolFactoryDefault()
    //protocolFactory := thrift.NewTCompactProtocolFactory()
    protocolFactory := thrift.NewTJSONProtocolFactory()
    //protocolFactory := thrift.NewTSimpleJSONProtocolFactory()

    serverTransport, err := thrift.NewTServerSocket(NetworkAddr)
    if err != nil {
        fmt.Println("Error!", err)
        os.Exit(1)
    }

    handler := &RpcServiceImpl{}
    processor := rpc.NewRpcServiceProcessor(handler)

    server := thrift.NewTSimpleServer4(processor, serverTransport,transportFactory, protocolFactory)
    fmt.Println("thrift server in", NetworkAddr)
    server.Serve()
}
