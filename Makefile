obj-m := psee-video.o psee-csi2rxss.o psee-tkeep-handler.o psee-event-stream-smart-tracker.o psee-streamer.o
psee-video-objs += psee-dma.o psee-composite.o

SRC := $(shell pwd)
GIT_HASH = $(shell git rev-parse --short=8 HEAD) 
all:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) -DZYNQGIT_VER=$(GIT_HASH)

modules_install:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install

clean:
	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
	rm -f Module.markers Module.symvers modules.order
	rm -rf .tmp_versions Modules.symvers
