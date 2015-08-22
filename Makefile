VOLMGR_EXEC_FILE = ./bin/volmgr
VOLMGR_MOUNT_EXEC_FILE = ./bin/volmgr_mount

.PHONY: all clean

all: $(VOLMGR_EXEC_FILE) $(VOLMGR_MOUNT_EXEC_FILE)

FLAGS = -a -tags "netgo libdm_no_deferred_remove" \
	-ldflags "-linkmode external -extldflags -static" \
	--installsuffix netgo

$(VOLMGR_MOUNT_EXEC_FILE): ./tools/volmgr_mount.c
	gcc -o ./bin/volmgr_mount ./tools/volmgr_mount.c

$(VOLMGR_EXEC_FILE): ./api/devmapper.go ./api/response.go \
	./blockstores/blockstores.go ./vfsblockstore/vfsblockstore.go \
	./devmapper/devmapper.go \
 	./drivers/drivers.go \
	./metadata/devmapper.go ./metadata/metadata.go \
	./utils/utils.go ./utils/utils_test.go \
	./volume_cmds.go ./snapshot_cmds.go ./blockstore_cmds.go \
	./commands.go ./main.go ./main_blockstore.go ./main_devmapper.go
	go build $(FLAGS) -o ./bin/volmgr

clean:
	rm -f ./bin/volmgr*
