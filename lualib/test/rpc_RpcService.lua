--
-- Autogenerated by Thrift
--
-- DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
-- @generated
--


require 'Thrift'
require 'rpc_ttypes'

RpcServiceClient = __TObject.new(__TClient, {
  __type = 'RpcServiceClient'
})

function RpcServiceClient:funCall(argStruct, argByte, argI16, argI32, argI64, argDouble, argString, paramMapStrStr, paramMapI32Str, paramSetStr, paramSetI64, paramListStr, argBool)
  self:send_funCall(argStruct, argByte, argI16, argI32, argI64, argDouble, argString, paramMapStrStr, paramMapI32Str, paramSetStr, paramSetI64, paramListStr, argBool)
  return self:recv_funCall(argStruct, argByte, argI16, argI32, argI64, argDouble, argString, paramMapStrStr, paramMapI32Str, paramSetStr, paramSetI64, paramListStr, argBool)
end

function RpcServiceClient:send_funCall(argStruct, argByte, argI16, argI32, argI64, argDouble, argString, paramMapStrStr, paramMapI32Str, paramSetStr, paramSetI64, paramListStr, argBool)
  self.oprot:writeMessageBegin('funCall', TMessageType.CALL, self._seqid)
  local args = funCall_args:new{}
  args.argStruct = argStruct
  args.argByte = argByte
  args.argI16 = argI16
  args.argI32 = argI32
  args.argI64 = argI64
  args.argDouble = argDouble
  args.argString = argString
  args.paramMapStrStr = paramMapStrStr
  args.paramMapI32Str = paramMapI32Str
  args.paramSetStr = paramSetStr
  args.paramSetI64 = paramSetI64
  args.paramListStr = paramListStr
  args.argBool = argBool
  args:write(self.oprot)
  self.oprot:writeMessageEnd()
  self.oprot.trans:flush()
end

function RpcServiceClient:recv_funCall(argStruct, argByte, argI16, argI32, argI64, argDouble, argString, paramMapStrStr, paramMapI32Str, paramSetStr, paramSetI64, paramListStr, argBool)
  local fname, mtype, rseqid = self.iprot:readMessageBegin()
  if mtype == TMessageType.EXCEPTION then
    local x = TApplicationException:new{}
    x:read(self.iprot)
    self.iprot:readMessageEnd()
    error(x)
  end
  local result = funCall_result:new{}
  result:read(self.iprot)
  self.iprot:readMessageEnd()
  if result.success then
    return result.success
  end
  error(TApplicationException:new{errorCode = TApplicationException.MISSING_RESULT})
end
RpcServiceIface = __TObject:new{
  __type = 'RpcServiceIface'
}


RpcServiceProcessor = __TObject.new(__TProcessor
, {
 __type = 'RpcServiceProcessor'
})

function RpcServiceProcessor:process(iprot, oprot, server_ctx)
  local name, mtype, seqid = iprot:readMessageBegin()
  local func_name = 'process_' .. name
  if not self[func_name] or ttype(self[func_name]) ~= 'function' then
    iprot:skip(TType.STRUCT)
    iprot:readMessageEnd()
    x = TApplicationException:new{
      errorCode = TApplicationException.UNKNOWN_METHOD
    }
    oprot:writeMessageBegin(name, TMessageType.EXCEPTION, seqid)
    x:write(oprot)
    oprot:writeMessageEnd()
    oprot.trans:flush()
  else
    self[func_name](self, seqid, iprot, oprot, server_ctx)
  end
end

function RpcServiceProcessor:process_funCall(seqid, iprot, oprot, server_ctx)
  local args = funCall_args:new{}
  local reply_type = TMessageType.REPLY
  args:read(iprot)
  iprot:readMessageEnd()
  local result = funCall_result:new{}
  local status, res = pcall(self.handler.funCall, self.handler, args.argStruct, args.argByte, args.argI16, args.argI32, args.argI64, args.argDouble, args.argString, args.paramMapStrStr, args.paramMapI32Str, args.paramSetStr, args.paramSetI64, args.paramListStr, args.argBool)
  if not status then
    reply_type = TMessageType.EXCEPTION
    result = TApplicationException:new{message = res}
  else
    result.success = res
  end
  oprot:writeMessageBegin('funCall', reply_type, seqid)
  result:write(oprot)
  oprot:writeMessageEnd()
  oprot.trans:flush()
end

-- HELPER FUNCTIONS AND STRUCTURES

funCall_args = __TObject:new{
  argStruct,
  argByte,
  argI16,
  argI32,
  argI64,
  argDouble,
  argString,
  paramMapStrStr,
  paramMapI32Str,
  paramSetStr,
  paramSetI64,
  paramListStr,
  argBool
}

function funCall_args:read(iprot)
  iprot:readStructBegin()
  while true do
    local fname, ftype, fid = iprot:readFieldBegin()
    if ftype == TType.STOP then
      break
    elseif fid == 1 then
      if ftype == TType.STRUCT then
        self.argStruct = ArgStruct:new{}
        self.argStruct:read(iprot)
      else
        iprot:skip(ftype)
      end
    elseif fid == 2 then
      if ftype == TType.BYTE then
        self.argByte = iprot:readByte()
      else
        iprot:skip(ftype)
      end
    elseif fid == 3 then
      if ftype == TType.I16 then
        self.argI16 = iprot:readI16()
      else
        iprot:skip(ftype)
      end
    elseif fid == 4 then
      if ftype == TType.I32 then
        self.argI32 = iprot:readI32()
      else
        iprot:skip(ftype)
      end
    elseif fid == 5 then
      if ftype == TType.I64 then
        self.argI64 = iprot:readI64()
      else
        iprot:skip(ftype)
      end
    elseif fid == 6 then
      if ftype == TType.DOUBLE then
        self.argDouble = iprot:readDouble()
      else
        iprot:skip(ftype)
      end
    elseif fid == 7 then
      if ftype == TType.STRING then
        self.argString = iprot:readString()
      else
        iprot:skip(ftype)
      end
    elseif fid == 8 then
      if ftype == TType.MAP then
        self.paramMapStrStr = {}
        local _ktype1, _vtype2, _size0 = iprot:readMapBegin() 
        for _i=1,_size0 do
          _key4 = iprot:readString()
          _val5 = iprot:readString()
          self.paramMapStrStr[_key4] = _val5
        end
        iprot:readMapEnd()
      else
        iprot:skip(ftype)
      end
    elseif fid == 9 then
      if ftype == TType.MAP then
        self.paramMapI32Str = {}
        local _ktype7, _vtype8, _size6 = iprot:readMapBegin() 
        for _i=1,_size6 do
          _key10 = iprot:readI32()
          _val11 = iprot:readString()
          self.paramMapI32Str[_key10] = _val11
        end
        iprot:readMapEnd()
      else
        iprot:skip(ftype)
      end
    elseif fid == 10 then
      if ftype == TType.SET then
        self.paramSetStr = {}
        local _etype15, _size12 = iprot:readSetBegin()
        for _i=1,_size12 do
          _elem16 = iprot:readString()
          self.paramSetStr[_elem16] = _elem16
        end
        iprot:readSetEnd()
      else
        iprot:skip(ftype)
      end
    elseif fid == 11 then
      if ftype == TType.SET then
        self.paramSetI64 = {}
        local _etype20, _size17 = iprot:readSetBegin()
        for _i=1,_size17 do
          _elem21 = iprot:readI64()
          self.paramSetI64[_elem21] = _elem21
        end
        iprot:readSetEnd()
      else
        iprot:skip(ftype)
      end
    elseif fid == 12 then
      if ftype == TType.LIST then
        self.paramListStr = {}
        local _etype25, _size22 = iprot:readListBegin()
        for _i=1,_size22 do
          _elem26 = iprot:readString()
          table.insert(self.paramListStr, _elem26)
        end
        iprot:readListEnd()
      else
        iprot:skip(ftype)
      end
    elseif fid == 13 then
      if ftype == TType.BOOL then
        self.argBool = iprot:readBool()
      else
        iprot:skip(ftype)
      end
    else
      iprot:skip(ftype)
    end
    iprot:readFieldEnd()
  end
  iprot:readStructEnd()
end

function funCall_args:write(oprot)
  oprot:writeStructBegin('funCall_args')
  if self.argStruct then
    oprot:writeFieldBegin('argStruct', TType.STRUCT, 1)
    self.argStruct:write(oprot)
    oprot:writeFieldEnd()
  end
  if self.argByte then
    oprot:writeFieldBegin('argByte', TType.BYTE, 2)
    oprot:writeByte(self.argByte)
    oprot:writeFieldEnd()
  end
  if self.argI16 then
    oprot:writeFieldBegin('argI16', TType.I16, 3)
    oprot:writeI16(self.argI16)
    oprot:writeFieldEnd()
  end
  if self.argI32 then
    oprot:writeFieldBegin('argI32', TType.I32, 4)
    oprot:writeI32(self.argI32)
    oprot:writeFieldEnd()
  end
  if self.argI64 then
    oprot:writeFieldBegin('argI64', TType.I64, 5)
    oprot:writeI64(self.argI64)
    oprot:writeFieldEnd()
  end
  if self.argDouble then
    oprot:writeFieldBegin('argDouble', TType.DOUBLE, 6)
    oprot:writeDouble(self.argDouble)
    oprot:writeFieldEnd()
  end
  if self.argString then
    oprot:writeFieldBegin('argString', TType.STRING, 7)
    oprot:writeString(self.argString)
    oprot:writeFieldEnd()
  end
  if self.paramMapStrStr then
    oprot:writeFieldBegin('paramMapStrStr', TType.MAP, 8)
    oprot:writeMapBegin(TType.STRING, TType.STRING, ttable_size(self.paramMapStrStr))
    for kiter27,viter28 in pairs(self.paramMapStrStr) do
      oprot:writeString(kiter27)
      oprot:writeString(viter28)
    end
    oprot:writeMapEnd()
    oprot:writeFieldEnd()
  end
  if self.paramMapI32Str then
    oprot:writeFieldBegin('paramMapI32Str', TType.MAP, 9)
    oprot:writeMapBegin(TType.I32, TType.STRING, ttable_size(self.paramMapI32Str))
    for kiter29,viter30 in pairs(self.paramMapI32Str) do
      oprot:writeI32(kiter29)
      oprot:writeString(viter30)
    end
    oprot:writeMapEnd()
    oprot:writeFieldEnd()
  end
  if self.paramSetStr then
    oprot:writeFieldBegin('paramSetStr', TType.SET, 10)
    oprot:writeSetBegin(TType.STRING, ttable_size(self.paramSetStr))
    for iter31, _ in pairs(self.paramSetStr) do
      oprot:writeString(iter31)
    end
    oprot:writeSetEnd()
    oprot:writeFieldEnd()
  end
  if self.paramSetI64 then
    oprot:writeFieldBegin('paramSetI64', TType.SET, 11)
    oprot:writeSetBegin(TType.I64, ttable_size(self.paramSetI64))
    for iter32, _ in pairs(self.paramSetI64) do
      oprot:writeI64(iter32)
    end
    oprot:writeSetEnd()
    oprot:writeFieldEnd()
  end
  if self.paramListStr then
    oprot:writeFieldBegin('paramListStr', TType.LIST, 12)
    oprot:writeListBegin(TType.STRING, ttable_size(self.paramListStr))
    for _,iter33 in ipairs(self.paramListStr) do
      oprot:writeString(iter33)
    end
    oprot:writeListEnd()
    oprot:writeFieldEnd()
  end
  if self.argBool ~= nil then
    oprot:writeFieldBegin('argBool', TType.BOOL, 13)
    oprot:writeBool(self.argBool)
    oprot:writeFieldEnd()
  end
  oprot:writeFieldStop()
  oprot:writeStructEnd()
end

funCall_result = __TObject:new{
  success
}

function funCall_result:read(iprot)
  iprot:readStructBegin()
  while true do
    local fname, ftype, fid = iprot:readFieldBegin()
    if ftype == TType.STOP then
      break
    elseif fid == 0 then
      if ftype == TType.LIST then
        self.success = {}
        local _etype37, _size34 = iprot:readListBegin()
        for _i=1,_size34 do
          _elem38 = iprot:readString()
          table.insert(self.success, _elem38)
        end
        iprot:readListEnd()
      else
        iprot:skip(ftype)
      end
    else
      iprot:skip(ftype)
    end
    iprot:readFieldEnd()
  end
  iprot:readStructEnd()
end

function funCall_result:write(oprot)
  oprot:writeStructBegin('funCall_result')
  if self.success then
    oprot:writeFieldBegin('success', TType.LIST, 0)
    oprot:writeListBegin(TType.STRING, ttable_size(self.success))
    for _,iter39 in ipairs(self.success) do
      oprot:writeString(iter39)
    end
    oprot:writeListEnd()
    oprot:writeFieldEnd()
  end
  oprot:writeFieldStop()
  oprot:writeStructEnd()
end
