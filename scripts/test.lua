package.path = package.path  .. "./?.lua;/usr/local/etc/haproxy/scripts/?.lua;/usr/local/etc/haproxy/libs/?.lua"

function lua_test(applet)

	x = ""
	if applet.method == "POST" then
		print("before")
		x = applet.receive(applet)
		print(x)
		print("after")
	end

	applet:set_status(200)
	applet:add_header("content-type", "text/html; charset=utf-8")
	applet:add_header("content-length", string.len(x))
	applet:start_response()
	applet:send(x)

end

core.register_service("lua-test", "http", lua_test)
