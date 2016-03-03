LUAJIT_INC = ../../../luajit/include/luajit-2.1
LUAJIT_LIB = ../../../luajit/lib
all:
	gcc -o libluabitwise.so          -shared -fPIC -g luabitwise.c longnumberutils.c    -I$(LUAJIT_INC)
	gcc -o libluabpack.so  -D_LUA51_ -shared -fPIC -g luabpack.c longnumberutils.c      -I$(LUAJIT_INC)
	gcc -o liblualongnumber.so       -shared -fPIC -g lualongnumber.c longnumberutils.c -I$(LUAJIT_INC)

install:
	install libluabitwise.so    ../../../lualib
	install libluabpack.so      ../../../lualib
	install liblualongnumber.so ../../../lualib

clean:
	rm -rf liblualongnumber.so libluabpack.so libluabitwise.so
