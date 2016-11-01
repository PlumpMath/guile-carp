
build:
	guild compile ./lib/carp.scm

demo:
	guile -L ./lib ./examples/demo.scm
