CFLAGS = -g -Wall -std=c99
CFLAGS +=  -I urjtag/urjtag/include/ -L urjtag/urjtag/src/.libs/
#
STATIC_URJTAG = 1
ifeq ($(STATIC_URJTAG), 1)
	LIBURJTAG=-Wl,-Bstatic -lurjtag -Wl,-Bdynamic -lftdi1 -lusb-1.0 -lreadline
else
	LIBURJTAG=-lurjtag
endif

simple: simple.c
	$(CC) -o $@ $^ $(CFLAGS) $(LIBURJTAG)

all: mw_debug

mw_debug: mw_debug.c
	$(CC) -o $@ $^ $(CFLAGS) $(LIBURJTAG)

clean:
	rm -f mw_debug simple
distclean:
	rm -f *~

