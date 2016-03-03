# ngx_lua_thrift
Steps of installing
    1. download https://openresty.org/download/openresty-x.y.z.a.tar.gz .
    2. install openresty.
    3. To copy all files in lualib to directory openresty/lualib/
    4. To cpoy all conf file to directory openresty/nginx/conf/
    5. compile source in directory openresty/lualib/libthrift/c
    6. Start openresty nginx server.

Test web
    To access web url http://127.0.0.1:8000/v1/lua_thrift and get result.
        1.return 1 by FunCall.
        2.return 2 by FunCall.
