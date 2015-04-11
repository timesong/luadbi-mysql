package = "luadbi-mysql"
version = "0.5-2"

description = {
	summary = "Database abstraction layer",
	detailed = [[
		LuaDBI is a database interface library for Lua. It is designed 
		to provide a RDBMS agnostic API for handling database 
		operations. LuaDBI also provides support for prepared statement 
		handles, placeholders and bind parameters for all database 
		operations.
		
		This rock is the MySQL DBD module. You will also need the
		base DBI module to use this software.
	]],
	
	license = "MIT/X11",
	homepage = "http://luadbi.googlecode.com/"
}

source = {
	url = "https://github.com/timesong/luadbi-mysql/archive/master.zip",
	dir = "luadbi-mysql-0.5-2"
}

dependencies = {
	"lua >= 5.1",
	"luadbi = 0.5"
}

external_dependencies = {
	MYSQL = { header = "mysql.h" }
}

build = {
	type = "builtin",
	modules = {
		['dbd.mysql'] = {
			sources = {
				'dbd/common.c',
				'dbd/mysql/main.c',
				'dbd/mysql/statement.c',
				'dbd/mysql/connection.c'
			},
		
			libraries = {
				'mysqlclient'
			},
			
			incdirs = {
				"$(MYSQL_INCDIR)",
				'./'
			},
			
			libdirs = {
				"$(MYSQL_LIBDIR)"
			}
		}
	}
}
