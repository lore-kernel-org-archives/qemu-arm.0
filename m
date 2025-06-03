Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff0dfsm946656466b.13.2025.06.03.04.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:02:08 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id BCFD75F9E3;
	Tue, 03 Jun 2025 12:02:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	qemu-stable@nongnu.org
Subject: [PATCH v4 09/17] hw/display: re-arrange memory region tracking
Date: Tue,  3 Jun 2025 12:01:56 +0100
Message-ID: <20250603110204.838117-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250603110204.838117-1-alex.bennee@linaro.org>
References: <20250603110204.838117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8uB25spH9tSD

QOM objects can be embedded in other QOM objects and managed as part
of their lifetime but this isn't the case for
virtio_gpu_virgl_hostmem_region. However before we can split it out we
need some other way of associating the wider data structure with the
memory region.

Fortunately MemoryRegion has an opaque pointer. This is passed down to
MemoryRegionOps for device type regions but is unused in the
memory_region_init_ram_ptr() case. Use the opaque to carry the
reference and allow the final MemoryRegion object to be reaped when
its reference count is cleared.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20250410122643.1747913-2-manos.pitsidianakis@linaro.org>
Cc: qemu-stable@nongnu.org
---
 include/system/memory.h       |  1 +
 hw/display/virtio-gpu-virgl.c | 23 ++++++++---------------
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/include/system/memory.h b/include/system/memory.h
index fc35a0dcad..90715ff44a 100644
--- a/include/system/memory.h
+++ b/include/system/memory.h
@@ -784,6 +784,7 @@ struct MemoryRegion {
     DeviceState *dev;
 
     const MemoryRegionOps *ops;
+    /* opaque data, used by backends like @ops */
     void *opaque;
     MemoryRegion *container;
     int mapped_via_alias; /* Mapped via an alias, container might be NULL */
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 145a0b3879..71a7500de9 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -52,17 +52,11 @@ virgl_get_egl_display(G_GNUC_UNUSED void *cookie)
 
 #if VIRGL_VERSION_MAJOR >= 1
 struct virtio_gpu_virgl_hostmem_region {
-    MemoryRegion mr;
+    MemoryRegion *mr;
     struct VirtIOGPU *g;
     bool finish_unmapping;
 };
 
-static struct virtio_gpu_virgl_hostmem_region *
-to_hostmem_region(MemoryRegion *mr)
-{
-    return container_of(mr, struct virtio_gpu_virgl_hostmem_region, mr);
-}
-
 static void virtio_gpu_virgl_resume_cmdq_bh(void *opaque)
 {
     VirtIOGPU *g = opaque;
@@ -73,14 +67,12 @@ static void virtio_gpu_virgl_resume_cmdq_bh(void *opaque)
 static void virtio_gpu_virgl_hostmem_region_free(void *obj)
 {
     MemoryRegion *mr = MEMORY_REGION(obj);
-    struct virtio_gpu_virgl_hostmem_region *vmr;
+    struct virtio_gpu_virgl_hostmem_region *vmr = mr->opaque;
     VirtIOGPUBase *b;
     VirtIOGPUGL *gl;
 
-    vmr = to_hostmem_region(mr);
-    vmr->finish_unmapping = true;
-
     b = VIRTIO_GPU_BASE(vmr->g);
+    vmr->finish_unmapping = true;
     b->renderer_blocked--;
 
     /*
@@ -118,8 +110,8 @@ virtio_gpu_virgl_map_resource_blob(VirtIOGPU *g,
 
     vmr = g_new0(struct virtio_gpu_virgl_hostmem_region, 1);
     vmr->g = g;
+    mr = g_new0(MemoryRegion, 1);
 
-    mr = &vmr->mr;
     memory_region_init_ram_ptr(mr, OBJECT(mr), "blob", size, data);
     memory_region_add_subregion(&b->hostmem, offset, mr);
     memory_region_set_enabled(mr, true);
@@ -131,7 +123,9 @@ virtio_gpu_virgl_map_resource_blob(VirtIOGPU *g,
      * command processing until MR is fully unreferenced and freed.
      */
     OBJECT(mr)->free = virtio_gpu_virgl_hostmem_region_free;
+    mr->opaque = vmr;
 
+    vmr->mr = mr;
     res->mr = mr;
 
     return 0;
@@ -142,16 +136,15 @@ virtio_gpu_virgl_unmap_resource_blob(VirtIOGPU *g,
                                      struct virtio_gpu_virgl_resource *res,
                                      bool *cmd_suspended)
 {
-    struct virtio_gpu_virgl_hostmem_region *vmr;
     VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
     MemoryRegion *mr = res->mr;
+    struct virtio_gpu_virgl_hostmem_region *vmr;
     int ret;
 
     if (!mr) {
         return 0;
     }
-
-    vmr = to_hostmem_region(res->mr);
+    vmr = mr->opaque;
 
     /*
      * Perform async unmapping in 3 steps:
-- 
2.47.2
