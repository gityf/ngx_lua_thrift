---- Licensed to the Apache Software Foundation (ASF) under one
-- or more contributor license agreements. See the NOTICE file
-- distributed with this work for additional information
-- regarding copyright ownership. The ASF licenses this file
-- to you under the Apache License, Version 2.0 (the
-- "License"); you may not use this file except in compliance
-- with the License. You may obtain a copy of the License at
--
--   http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing,
-- software distributed under the License is distributed on an
-- "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
-- KIND, either express or implied. See the License for the
-- specific language governing permissions and limitations
-- under the License.
--

require 'TTransport'

local random = math.random
local strlen = string.len
local strsub = string.sub
local strbyte = string.byte

-- TSocketBase
TSocketBase = TTransportBase:new{
  __type = 'TSocketBase',
  timeout = 5000,
  connections = 10,
  host = 'localhost',
  port = 9090,
}

function TSocketBase:close()
  if self.handle then
    if ttype(self.connections) == 'number' and self.connections > 0 then
      self.handle:setkeepalive(60000, self.connections)
    else
      self.handle:close()
    end
    self.handle = nil
  end
end

-- TSocket
TSocket = TSocketBase:new{
  __type = 'TSocket'
}

local function split(str)
  str = str .. ","
  local last = 1
  local result = {}
  for cur, b in ipairs({strbyte(str,1,strlen(str))}) do
    if b == 44 then --[','(ascii == 44)]
      if cur - 1 >= last then
        result[#result + 1] = strsub(str, last, cur - 1) 
      end
      last = cur + 1
    end
  end

  return result 
end

function TSocket:new(opt)
    return __TObject.new(TSocket, {
        host = split(opt.host),
        port = opt.port,
        handle = ngx.socket.tcp() 
    })
end

function TSocket:isOpen()
  if self.handle then
    return true
  end
  return false
end

function TSocket:open()
  local sock = self.handle;

  if self.timeout and ttype(self.timeout) == 'number' then
    sock:settimeout(self.timeout)
  end
  local k = 1;
  if #self.host > 1 then
      k = random(1, #self.host);
  end 

  local ok, err = sock:connect(self.host[k], self.port)
  if not ok then
      terror(TTransportException:new{
          message = 'Could not connect to ' .. self.host[k] .. ':' .. self.port
          .. ' (' .. err .. ')'
      })
  end
end

function TSocket:read(len, tag)
  local buf, err, partial = self.handle:receive(len)
  if not buf or (tag == nil and string.len(buf) ~= len) then
    terror(TTransportException:new{errorCode = TTransportException.UNKNOWN, message=err})
  end
  return buf
end

function TSocket:write(buf)
  local bytes, err = self.handle:send(buf)
  if not bytes then
    terror(TTransportException:new{errorCode = TTransportException.UNKNOWN, message=err})
  end
end

function TSocket:flush()
end
