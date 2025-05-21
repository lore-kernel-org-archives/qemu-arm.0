Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e5383sm9093212a12.37.2025.05.21.09.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 09:43:01 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 5D98E5FAF9;
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
	Yiwei Zhang <zzyiwei@gmail.com>,
	qemu-stable@nongnu.org
Subject: [PATCH v3 15/20] virtio-gpu: support context init multiple timeline
Date: Wed, 21 May 2025 17:42:45 +0100
Message-Id: <20250521164250.135776-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250521164250.135776-1-alex.bennee@linaro.org>
References: <20250521164250.135776-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Jb7UOoRaizgY

From: Yiwei Zhang <zzyiwei@gmail.com>

Venus and later native contexts have their own fence context along with
multiple timelines within. Fences wtih VIRTIO_GPU_FLAG_INFO_RING_IDX in
the flags must be dispatched to be created on the target context. Fence
signaling also has to be handled on the specific timeline within that
target context.

Before this change, venus fencing is completely broken if the host
driver doesn't support implicit fencing with external memory objects.
Frames can go backwards along with random artifacts on screen if the
host driver doesn't attach an implicit fence to the render target. The
symptom could be hidden by certain guest wsi backend that waits on a
venus native VkFence object for the actual payload with limited present
modes or under special configs. e.g. x11 mailbox or xwayland.

After this change, everything related to venus fencing starts making
sense. Confirmed this via guest and host side perfetto tracing.

Cc:  <qemu-stable@nongnu.org>
Fixes: 94d0ea1c1928 ("virtio-gpu: Support Venus context")
Signed-off-by: Yiwei Zhang <zzyiwei@gmail.com>
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Message-Id: <20250518152651.334115-1-zzyiwei@gmail.com>
[AJB: remove version history from commit message]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/display/virtio-gpu-virgl.c | 44 +++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 32a32879f7..900577a38c 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -978,6 +978,15 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
     }
 
     trace_virtio_gpu_fence_ctrl(cmd->cmd_hdr.fence_id, cmd->cmd_hdr.type);
+#if VIRGL_VERSION_MAJOR >= 1
+    if (cmd->cmd_hdr.flags & VIRTIO_GPU_FLAG_INFO_RING_IDX) {
+        virgl_renderer_context_create_fence(cmd->cmd_hdr.ctx_id,
+                                            VIRGL_RENDERER_FENCE_FLAG_MERGEABLE,
+                                            cmd->cmd_hdr.ring_idx,
+                                            cmd->cmd_hdr.fence_id);
+        return;
+    }
+#endif
     virgl_renderer_create_fence(cmd->cmd_hdr.fence_id, cmd->cmd_hdr.type);
 }
 
@@ -991,6 +1000,11 @@ static void virgl_write_fence(void *opaque, uint32_t fence)
          * the guest can end up emitting fences out of order
          * so we should check all fenced cmds not just the first one.
          */
+#if VIRGL_VERSION_MAJOR >= 1
+        if (cmd->cmd_hdr.flags & VIRTIO_GPU_FLAG_INFO_RING_IDX) {
+            continue;
+        }
+#endif
         if (cmd->cmd_hdr.fence_id > fence) {
             continue;
         }
@@ -1005,6 +1019,29 @@ static void virgl_write_fence(void *opaque, uint32_t fence)
     }
 }
 
+#if VIRGL_VERSION_MAJOR >= 1
+static void virgl_write_context_fence(void *opaque, uint32_t ctx_id,
+                                      uint32_t ring_idx, uint64_t fence_id) {
+    VirtIOGPU *g = opaque;
+    struct virtio_gpu_ctrl_command *cmd, *tmp;
+
+    QTAILQ_FOREACH_SAFE(cmd, &g->fenceq, next, tmp) {
+        if (cmd->cmd_hdr.flags & VIRTIO_GPU_FLAG_INFO_RING_IDX &&
+            cmd->cmd_hdr.ctx_id == ctx_id && cmd->cmd_hdr.ring_idx == ring_idx &&
+            cmd->cmd_hdr.fence_id <= fence_id) {
+            trace_virtio_gpu_fence_resp(cmd->cmd_hdr.fence_id);
+            virtio_gpu_ctrl_response_nodata(g, cmd, VIRTIO_GPU_RESP_OK_NODATA);
+            QTAILQ_REMOVE(&g->fenceq, cmd, next);
+            g_free(cmd);
+            g->inflight--;
+            if (virtio_gpu_stats_enabled(g->parent_obj.conf)) {
+                trace_virtio_gpu_dec_inflight_fences(g->inflight);
+            }
+        }
+    }
+}
+#endif
+
 static virgl_renderer_gl_context
 virgl_create_context(void *opaque, int scanout_idx,
                      struct virgl_renderer_gl_ctx_param *params)
@@ -1039,11 +1076,18 @@ static int virgl_make_context_current(void *opaque, int scanout_idx,
 }
 
 static struct virgl_renderer_callbacks virtio_gpu_3d_cbs = {
+#if VIRGL_VERSION_MAJOR >= 1
+    .version             = 3,
+#else
     .version             = 1,
+#endif
     .write_fence         = virgl_write_fence,
     .create_gl_context   = virgl_create_context,
     .destroy_gl_context  = virgl_destroy_context,
     .make_current        = virgl_make_context_current,
+#if VIRGL_VERSION_MAJOR >= 1
+    .write_context_fence = virgl_write_context_fence,
+#endif
 };
 
 static void virtio_gpu_print_stats(void *opaque)
-- 
2.39.5
