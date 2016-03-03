# ngx_lua_thrift

Steps of installing
======

    download https://openresty.org/download/openresty-x.y.z.a.tar.gz .
    install openresty.
    To copy all files in lualib to directory openresty/lualib/
    To cpoy all conf file to directory openresty/nginx/conf/
    compile source in directory openresty/lualib/libthrift/c
    Start openresty nginx server.

Testing
=======
    To access web url http://127.0.0.1:8000/v1/lua_thrift and get result.

          1.return 1 by FunCall.*
          2.return 2 by FunCall.*

