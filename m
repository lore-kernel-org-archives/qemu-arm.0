Received: by 10.182.105.169 with SMTP id gn9csp618926obb;
        Thu, 5 Nov 2015 10:16:05 -0800 (PST)
X-Received: by 10.66.162.73 with SMTP id xy9mr10964891pab.41.1446747364955;
        Thu, 05 Nov 2015 10:16:04 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id ph4si9572600pbb.177.2015.11.05.10.16.04
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Thu, 05 Nov 2015 10:16:04 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZuP4p-0004kl-90; Thu, 05 Nov 2015 18:15:59 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH 08/16] exec.c: Have one io_mem_watch per AddressSpace
Date: Thu,  5 Nov 2015 18:15:50 +0000
Message-Id: <1446747358-18214-9-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
X-TUID: MQLfvKFIfv+S

The io_mem_watch MemoryRegion's read and write callbacks pass the
accesses through to an underlying address space. Now that that
might be something other than address_space_memory, we need to
pass the correct AddressSpace in via the opaque pointer. That
means we need to have one io_mem_watch MemoryRegion per address
space, rather than sharing one between all address spaces.

This should also fix gdbstub watchpoints in x86 SMRAM, which would
previously not have worked correctly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 exec.c                | 40 +++++++++++++++++++++++-----------------
 include/exec/memory.h |  2 ++
 2 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/exec.c b/exec.c
index bc6ab8a..9998fa0 100644
--- a/exec.c
+++ b/exec.c
@@ -163,8 +163,6 @@ static void io_mem_init(void);
 static void memory_map_init(void);
 static void tcg_commit(MemoryListener *listener);
 
-static MemoryRegion io_mem_watch;
-
 /**
  * CPUAddressSpace: all the information a CPU needs about an AddressSpace
  * @cpu: the CPU whose AddressSpace this is
@@ -334,12 +332,6 @@ static MemoryRegionSection *phys_page_find(PhysPageEntry lp, hwaddr addr,
     }
 }
 
-bool memory_region_is_unassigned(MemoryRegion *mr)
-{
-    return mr != &io_mem_rom && mr != &io_mem_notdirty && !mr->rom_device
-        && mr != &io_mem_watch;
-}
-
 /* Called from RCU critical section */
 static MemoryRegionSection *address_space_lookup_region(AddressSpaceDispatch *d,
                                                         hwaddr addr,
@@ -2045,17 +2037,18 @@ static MemTxResult watch_mem_read(void *opaque, hwaddr addr, uint64_t *pdata,
 {
     MemTxResult res;
     uint64_t data;
+    AddressSpace *as = opaque;
 
     check_watchpoint(addr & ~TARGET_PAGE_MASK, size, attrs, BP_MEM_READ);
     switch (size) {
     case 1:
-        data = address_space_ldub(&address_space_memory, addr, attrs, &res);
+        data = address_space_ldub(as, addr, attrs, &res);
         break;
     case 2:
-        data = address_space_lduw(&address_space_memory, addr, attrs, &res);
+        data = address_space_lduw(as, addr, attrs, &res);
         break;
     case 4:
-        data = address_space_ldl(&address_space_memory, addr, attrs, &res);
+        data = address_space_ldl(as, addr, attrs, &res);
         break;
     default: abort();
     }
@@ -2068,17 +2061,18 @@ static MemTxResult watch_mem_write(void *opaque, hwaddr addr,
                                    MemTxAttrs attrs)
 {
     MemTxResult res;
+    AddressSpace *as = opaque;
 
     check_watchpoint(addr & ~TARGET_PAGE_MASK, size, attrs, BP_MEM_WRITE);
     switch (size) {
     case 1:
-        address_space_stb(&address_space_memory, addr, val, attrs, &res);
+        address_space_stb(as, addr, val, attrs, &res);
         break;
     case 2:
-        address_space_stw(&address_space_memory, addr, val, attrs, &res);
+        address_space_stw(as, addr, val, attrs, &res);
         break;
     case 4:
-        address_space_stl(&address_space_memory, addr, val, attrs, &res);
+        address_space_stl(as, addr, val, attrs, &res);
         break;
     default: abort();
     }
@@ -2091,6 +2085,15 @@ static const MemoryRegionOps watch_mem_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+bool memory_region_is_unassigned(MemoryRegion *mr)
+{
+    /* Checking the ops pointer of the MemoryRegion is strictly
+     * speaking looking at private information of the MemoryRegion :-(
+     */
+    return mr != &io_mem_rom && mr != &io_mem_notdirty && !mr->rom_device
+        && mr->ops != &watch_mem_ops;
+}
+
 static MemTxResult subpage_read(void *opaque, hwaddr addr, uint64_t *data,
                                 unsigned len, MemTxAttrs attrs)
 {
@@ -2251,8 +2254,6 @@ static void io_mem_init(void)
                           NULL, UINT64_MAX);
     memory_region_init_io(&io_mem_notdirty, NULL, &notdirty_mem_ops, NULL,
                           NULL, UINT64_MAX);
-    memory_region_init_io(&io_mem_watch, NULL, &watch_mem_ops, NULL,
-                          NULL, UINT64_MAX);
 }
 
 static void mem_begin(MemoryListener *listener)
@@ -2267,7 +2268,7 @@ static void mem_begin(MemoryListener *listener)
     assert(n == PHYS_SECTION_NOTDIRTY);
     n = dummy_section(&d->map, as, &io_mem_rom);
     assert(n == PHYS_SECTION_ROM);
-    n = dummy_section(&d->map, as, &io_mem_watch);
+    n = dummy_section(&d->map, as, as->io_mem_watch);
     assert(n == PHYS_SECTION_WATCH);
 
     d->phys_map  = (PhysPageEntry) { .ptr = PHYS_MAP_NODE_NIL, .skip = 1 };
@@ -2315,6 +2316,10 @@ static void tcg_commit(MemoryListener *listener)
 
 void address_space_init_dispatch(AddressSpace *as)
 {
+    as->io_mem_watch = g_new0(MemoryRegion, 1);
+    memory_region_init_io(as->io_mem_watch, NULL, &watch_mem_ops, as,
+                          NULL, UINT64_MAX);
+
     as->dispatch = NULL;
     as->dispatch_listener = (MemoryListener) {
         .begin = mem_begin,
@@ -2339,6 +2344,7 @@ void address_space_destroy_dispatch(AddressSpace *as)
     if (d) {
         call_rcu(d, address_space_dispatch_free, rcu);
     }
+    memory_region_unref(as->io_mem_watch);
 }
 
 static void memory_map_init(void)
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 0f07159..e5d98f8 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -246,6 +246,8 @@ struct AddressSpace {
     struct AddressSpaceDispatch *next_dispatch;
     MemoryListener dispatch_listener;
 
+    MemoryRegion *io_mem_watch;
+
     QTAILQ_ENTRY(AddressSpace) address_spaces_link;
 };
 
-- 
1.9.1
