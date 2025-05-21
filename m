Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ac32b53sm9207614a12.64.2025.05.21.09.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 09:42:56 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 265AC5FA1B;
	Wed, 21 May 2025 17:42:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	John Snow <jsnow@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	qemu-stable@nongnu.org
Subject: [PATCH v3 12/20] virtio-gpu: fix hang under TCG when unmapping blob
Date: Wed, 21 May 2025 17:42:42 +0100
Message-Id: <20250521164250.135776-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250521164250.135776-1-alex.bennee@linaro.org>
References: <20250521164250.135776-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hrwzs0BP0GgN

From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

This commit fixes an indefinite hang when using VIRTIO GPU blob objects
under TCG in certain conditions.

The VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB VIRTIO command creates a
MemoryRegion and attaches it to an offset on a PCI BAR of the
VirtIOGPUdevice. The VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB command unmaps
it.

Because virglrenderer commands are not thread-safe they are only
called on the main context and QEMU performs the cleanup in three steps
to prevent a use-after-free scenario where the guest can access the
region after it’s unmapped:

1. From the main context, the region’s field finish_unmapping is false
   by default, so it sets a variable cmd_suspended, increases the
   renderer_blocked variable, deletes the blob subregion, and unparents
   the blob subregion causing its reference count to decrement.

2. From an RCU context, the MemoryView gets freed, the FlatView gets
   recalculated, the free callback of the blob region
   virtio_gpu_virgl_hostmem_region_free is called which sets the
   region’s field finish_unmapping to true, allowing the main thread
   context to finish replying to the command

3. From the main context, the command is processed again, but this time
   finish_unmapping is true, so virgl_renderer_resource_unmap can be
   called and a response is sent to the guest.

It happens so that under TCG, if the guest has no timers configured (and
thus no interrupt will cause the CPU to exit), the RCU thread does not
have enough time to grab the locks and recalculate the FlatView.

That’s not a big problem in practice since most guests will assume a
response will happen later in time and go on to do different things,
potentially triggering interrupts and allowing the RCU context to run.
If the guest waits for the unmap command to complete though, it blocks
indefinitely. Attaching to the QEMU monitor and force quitting the guest
allows the cleanup to continue.

There's no reason why the FlatView recalculation can't occur right away
when we delete the blob subregion, however. It does not, because when we
create the subregion we set the object as its own parent:

    memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size, data);

The extra reference is what prevents freeing the memory region object in
the memory transaction of deleting the subregion.

This commit changes the owner object to the device, which removes the
extra owner reference in the memory region and causes the MR to be
freed right away in the main context.

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20250410122643.1747913-3-manos.pitsidianakis@linaro.org>
Cc: qemu-stable@nongnu.org
---
 hw/display/virtio-gpu-virgl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 71a7500de9..8fbe4e70cc 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -112,7 +112,7 @@ virtio_gpu_virgl_map_resource_blob(VirtIOGPU *g,
     vmr->g = g;
     mr = g_new0(MemoryRegion, 1);
 
-    memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size, data);
+    memory_region_init_ram_ptr(mr, OBJECT(g), "blob", size, data);
     memory_region_add_subregion(&b->hostmem, offset, mr);
     memory_region_set_enabled(mr, true);
 
-- 
2.39.5
