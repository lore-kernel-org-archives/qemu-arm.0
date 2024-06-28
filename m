Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58612c834ecsm984261a12.12.2024.06.28.05.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:43:00 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 577735F9F9;
	Fri, 28 Jun 2024 13:42:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 04/23] tracepoints: move physmem trace points
Date: Fri, 28 Jun 2024 13:42:39 +0100
Message-Id: <20240628124258.832466-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240628124258.832466-1-alex.bennee@linaro.org>
References: <20240628124258.832466-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: E/WqBanrq/gn

They don't need to be in the global trace-events file and can have a
local trace header. Also add address_space_map tracepoint for tracking
mapping behaviour.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 system/physmem.c    | 6 ++++--
 system/trace-events | 6 ++++++
 trace-events        | 5 -----
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/system/physmem.c b/system/physmem.c
index 33d09f7571..17c9c70f97 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -53,7 +53,7 @@
 #include "sysemu/hostmem.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/xen-mapcache.h"
-#include "trace/trace-root.h"
+#include "trace.h"
 
 #ifdef CONFIG_FALLOCATE_PUNCH_HOLE
 #include <linux/falloc.h>
@@ -1885,7 +1885,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
     } else { /* list is empty */
         QLIST_INSERT_HEAD_RCU(&ram_list.blocks, new_block, next);
     }
-    ram_list.mru_block = NULL;
+    qatomic_rcu_set(&ram_list.mru_block, NULL);
 
     /* Write list before version */
     smp_wmb();
@@ -3193,6 +3193,8 @@ void *address_space_map(AddressSpace *as,
     MemoryRegion *mr;
     FlatView *fv;
 
+    trace_address_space_map(as, addr, len, is_write, *(uint32_t *) &attrs);
+
     if (len == 0) {
         return NULL;
     }
diff --git a/system/trace-events b/system/trace-events
index 69c9044151..2ed1d59b1f 100644
--- a/system/trace-events
+++ b/system/trace-events
@@ -21,6 +21,12 @@ flatview_destroy(void *view, void *root) "%p (root %p)"
 flatview_destroy_rcu(void *view, void *root) "%p (root %p)"
 global_dirty_changed(unsigned int bitmask) "bitmask 0x%"PRIx32
 
+# physmem.c
+address_space_map(void *as, uint64_t addr, uint64_t len, bool is_write, uint32_t attrs) "as:%p addr 0x%"PRIx64":%"PRIx64" write:%d attrs:0x%x"
+find_ram_offset(uint64_t size, uint64_t offset) "size: 0x%" PRIx64 " @ 0x%" PRIx64
+find_ram_offset_loop(uint64_t size, uint64_t candidate, uint64_t offset, uint64_t next, uint64_t mingap) "trying size: 0x%" PRIx64 " @ 0x%" PRIx64 ", offset: 0x%" PRIx64" next: 0x%" PRIx64 " mingap: 0x%" PRIx64
+ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_madvise, bool need_fallocate, int ret) "%s@%p + 0x%zx: madvise: %d fallocate: %d ret: %d"
+
 # cpus.c
 vm_stop_flush_all(int ret) "ret %d"
 
diff --git a/trace-events b/trace-events
index dd318ed1af..9cb96f64c4 100644
--- a/trace-events
+++ b/trace-events
@@ -37,11 +37,6 @@ dma_complete(void *dbs, int ret, void *cb) "dbs=%p ret=%d cb=%p"
 dma_blk_cb(void *dbs, int ret) "dbs=%p ret=%d"
 dma_map_wait(void *dbs) "dbs=%p"
 
-# exec.c
-find_ram_offset(uint64_t size, uint64_t offset) "size: 0x%" PRIx64 " @ 0x%" PRIx64
-find_ram_offset_loop(uint64_t size, uint64_t candidate, uint64_t offset, uint64_t next, uint64_t mingap) "trying size: 0x%" PRIx64 " @ 0x%" PRIx64 ", offset: 0x%" PRIx64" next: 0x%" PRIx64 " mingap: 0x%" PRIx64
-ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_madvise, bool need_fallocate, int ret) "%s@%p + 0x%zx: madvise: %d fallocate: %d ret: %d"
-
 # job.c
 job_state_transition(void *job,  int ret, const char *legal, const char *s0, const char *s1) "job %p (ret: %d) attempting %s transition (%s-->%s)"
 job_apply_verb(void *job, const char *state, const char *verb, const char *legal) "job %p in state %s; applying verb %s (%s)"
-- 
2.39.2
