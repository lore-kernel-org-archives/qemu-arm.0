Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18914d067sm700737666b.3.2025.05.06.05.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:57:22 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 275705FADA;
	Tue,  6 May 2025 13:57:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	qemu-stable@nongnu.org
Subject: [PATCH v2 11/14] virtio-gpu: refactor async blob unmapping
Date: Tue,  6 May 2025 13:57:12 +0100
Message-Id: <20250506125715.232872-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250506125715.232872-1-alex.bennee@linaro.org>
References: <20250506125715.232872-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mIxtg9uLq8uB

From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Change the 3 part async cleanup of a blob memory mapping to check if the
unmapping has finished already after deleting the subregion; this
condition allows us to skip suspending the command and responding to the
guest right away.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20250410122643.1747913-4-manos.pitsidianakis@linaro.org>
Cc: qemu-stable@nongnu.org
---
 hw/display/virtio-gpu-virgl.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 8fbe4e70cc..32a32879f7 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -155,7 +155,32 @@ virtio_gpu_virgl_unmap_resource_blob(VirtIOGPU *g,
      *    asynchronously by virtio_gpu_virgl_hostmem_region_free().
      * 3. Finish the unmapping with final virgl_renderer_resource_unmap().
      */
+
+    /* 1. Check if we should start unmapping now */
+    if (!vmr->finish_unmapping) {
+        /* begin async unmapping. render will be unblocked once MR is freed */
+        b->renderer_blocked++;
+
+        memory_region_set_enabled(mr, false);
+        memory_region_del_subregion(&b->hostmem, mr);
+        object_unparent(OBJECT(mr));
+        /*
+         * The unmapping might have already finished at this point if no one
+         * else held a reference to the MR; if yes, we can skip suspending the
+         * command and unmap the resource right away.
+         */
+        *cmd_suspended = !vmr->finish_unmapping;
+    }
+
+    /*
+     * 2. if virtio_gpu_virgl_hostmem_region_free hasn't been executed yet, we
+     * have marked the command to be re-processed later by setting
+     * cmd_suspended to true. The freeing callback will be called from RCU
+     * context later.
+     */
+
     if (vmr->finish_unmapping) {
+        /* 3. MemoryRegion has been freed, so finish unmapping */
         res->mr = NULL;
         g_free(vmr);
 
@@ -166,16 +191,6 @@ virtio_gpu_virgl_unmap_resource_blob(VirtIOGPU *g,
                           __func__, strerror(-ret));
             return ret;
         }
-    } else {
-        *cmd_suspended = true;
-
-        /* render will be unblocked once MR is freed */
-        b->renderer_blocked++;
-
-        /* memory region owns self res->mr object and frees it by itself */
-        memory_region_set_enabled(mr, false);
-        memory_region_del_subregion(&b->hostmem, mr);
-        object_unparent(OBJECT(mr));
     }
 
     return 0;
-- 
2.39.5
