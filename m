Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id v16sm120826wrr.6.2021.06.23.06.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 06:47:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1B7C91FF87;
	Wed, 23 Jun 2021 14:47:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Andrew Strauss <astrauss11@gmail.com>,
	Keith Packard <keithp@keithp.com>
Subject: [PATCH  v4 1/2] semihosting/arm-compat: replace heuristic for softmmu SYS_HEAPINFO
Date: Wed, 23 Jun 2021 14:47:55 +0100
Message-Id: <20210623134756.30930-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210623134756.30930-1-alex.bennee@linaro.org>
References: <20210623134756.30930-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: osiB0HSUrQtn

The previous numbers were a guess at best and rather arbitrary without
taking into account anything that might be loaded. Instead of using
guesses based on the state of registers implement a new function that:

 a) scans the MemoryRegions for the largest RAM block
 b) iterates through all "ROM" blobs looking for the biggest gap

The "ROM" blobs include all code loaded via -kernel and the various
-device loader techniques.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Andrew Strauss <astrauss11@gmail.com>
Cc: Keith Packard <keithp@keithp.com>
Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>

---
v2
  - report some known information (limits)
  - reword the commit message
v3
  - rework to use the ROM blob scanning suggested by Peter
  - drop arch specific wrappers
  - dropped rb/tb tags as it's a rework
v4
  - search for the largest RAM which should be the main RAM
  - implement the biggest gap algorithm
  - make stackbase the inverse of heap info
---
 include/hw/loader.h           |  16 +++++
 hw/core/loader.c              |  74 +++++++++++++++++++
 semihosting/arm-compat-semi.c | 129 ++++++++++++++++++----------------
 3 files changed, 158 insertions(+), 61 deletions(-)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index cbfc184873..f2cdb82b59 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -349,4 +349,20 @@ int rom_add_option(const char *file, int32_t bootindex);
  * overflow on real hardware too. */
 #define UBOOT_MAX_GUNZIP_BYTES (64 << 20)
 
+/**
+ * rom_find_largest_gap_between: return highest address of ROM in region
+ *
+ * This function is used to find the highest ROM address (or loaded
+ * blob) so we can advise where true heap memory may be.
+ *
+ * Returns: RomGap, describing the largest section not intersected by
+ * a ROM region.
+ */
+typedef struct RomGap {
+    hwaddr base;
+    size_t size;
+} RomGap;
+
+RomGap rom_find_largest_gap_between(hwaddr base, size_t size);
+
 #endif
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 5b34869a54..d4893fa8d8 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1310,6 +1310,80 @@ static Rom *find_rom(hwaddr addr, size_t size)
     return NULL;
 }
 
+typedef struct RomSec {
+    hwaddr base;
+    int se; /* start/end flag */
+} RomSec;
+
+
+static gint sort_secs(gconstpointer a, gconstpointer b)
+{
+    RomSec *ra = (RomSec *) a;
+    RomSec *rb = (RomSec *) b;
+
+    if (ra->base == rb->base) {
+        return ra->se > rb->se ? -1 : 1;
+    }
+    return ra->base > rb->base ? 1 : -1;
+}
+
+RomGap rom_find_largest_gap_between(hwaddr base, size_t size)
+{
+    Rom *rom;
+    RomSec *cand;
+    RomGap res = {0, 0};
+    hwaddr gapstart = base;
+    GList *it, *secs = NULL;
+    int count = 0;
+
+    QTAILQ_FOREACH(rom, &roms, next) {
+        /* ignore real rom blobs */
+        if (rom->mr || rom->fw_file) {
+            continue;
+        }
+        /* ignore anything finishing bellow base */
+        if (rom->addr + rom->romsize < base) {
+            continue;
+        }
+        /* ignore anything starting above the region */
+        if (rom->addr > base + size) {
+            continue;
+        }
+
+        /* Save the start and end of each relevant ROM */
+        cand = g_new(RomSec, 1);
+        cand->base = rom->addr;
+        cand->se = 1;
+        secs = g_list_append(secs, cand);
+
+        if (rom->addr + rom->romsize < base + size) {
+            cand = g_new(RomSec, 1);
+            cand->base = rom->addr + rom->romsize;
+            cand->se = -1;
+            secs = g_list_append(secs, cand);
+        }
+    }
+
+    secs = g_list_sort(secs, sort_secs);
+
+    for (it = g_list_first(secs); it; it = g_list_next(it)) {
+        cand = (RomSec *) it->data;
+        if (count == 0 && count + cand->se == 1) {
+            size_t gap = cand->base - gapstart;
+            if (gap > res.size) {
+                res.base = gapstart;
+                res.size = gap;
+            }
+        } else if (count == 1 && count + cand->se == 0) {
+            gapstart = cand->base;
+        }
+        count += cand->se;
+    }
+
+    g_list_free_full(secs, g_free);
+    return res;
+}
+
 /*
  * Copies memory from registered ROMs to dest. Any memory that is contained in
  * a ROM between addr and addr + size is copied. Note that this can involve
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 1c29146dcf..f50c1474bc 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -44,6 +44,7 @@
 #else
 #include "exec/gdbstub.h"
 #include "qemu/cutils.h"
+#include "hw/loader.h"
 #ifdef TARGET_ARM
 #include "hw/arm/boot.h"
 #endif
@@ -144,33 +145,69 @@ typedef struct GuestFD {
 static GArray *guestfd_array;
 
 #ifndef CONFIG_USER_ONLY
-#include "exec/address-spaces.h"
-/*
- * Find the base of a RAM region containing the specified address
+
+/**
+ * common_semi_find_bases: find information about ram and heap base
+ *
+ * This function attempts to provide meaningful numbers for RAM and
+ * HEAP base addresses. The rambase is simply the lowest addressable
+ * RAM position. For the heapbase we ask the loader to scan the
+ * address space and the largest available gap by querying the "ROM"
+ * regions.
+ *
+ * Returns: a structure with the numbers we need.
  */
-static inline hwaddr
-common_semi_find_region_base(hwaddr addr)
+
+typedef struct LayoutInfo {
+    target_ulong rambase;
+    size_t ramsize;
+    hwaddr heapbase;
+    hwaddr heaplimit;
+} LayoutInfo;
+
+static bool find_ram_cb(Int128 start, Int128 len, const MemoryRegion *mr,
+                        hwaddr offset_in_region, void *opaque)
+{
+    LayoutInfo *info = (LayoutInfo *) opaque;
+    uint64_t size = int128_get64(len);
+
+    if (!mr->ram || mr->readonly) {
+        return false;
+    }
+
+    if (size > info->ramsize) {
+        info->rambase = int128_get64(start);
+        info->ramsize = size;
+    }
+
+    /* search exhaustively for largest RAM */
+    return false;
+}
+
+static LayoutInfo common_semi_find_bases(CPUState *cs)
 {
-    MemoryRegion *subregion;
+    FlatView *fv;
+    LayoutInfo info = { 0, 0, 0, 0 };
+
+    RCU_READ_LOCK_GUARD();
+
+    fv = address_space_to_flatview(cs->as);
+    flatview_for_each_range(fv, find_ram_cb, &info);
 
     /*
-     * Find the chunk of R/W memory containing the address.  This is
-     * used for the SYS_HEAPINFO semihosting call, which should
-     * probably be using information from the loaded application.
+     * If we have found the RAM lets iterate through the ROM blobs to
+     * workout the best place for the remainder of RAM and split it
+     * equally between stack and heap.
      */
-    QTAILQ_FOREACH(subregion, &get_system_memory()->subregions,
-                   subregions_link) {
-        if (subregion->ram && !subregion->readonly) {
-            Int128 top128 = int128_add(int128_make64(subregion->addr),
-                                       subregion->size);
-            Int128 addr128 = int128_make64(addr);
-            if (subregion->addr <= addr && int128_lt(addr128, top128)) {
-                return subregion->addr;
-            }
-        }
+    if (info.rambase && info.ramsize) {
+        RomGap gap = rom_find_largest_gap_between(info.rambase, info.ramsize);
+        info.heapbase = gap.base;
+        info.heaplimit = gap.base + gap.size;
     }
-    return 0;
+
+    return info;
 }
+
 #endif
 
 #ifdef TARGET_ARM
@@ -204,28 +241,6 @@ common_semi_sys_exit_extended(CPUState *cs, int nr)
     return (nr == TARGET_SYS_EXIT_EXTENDED || is_a64(cs->env_ptr));
 }
 
-#ifndef CONFIG_USER_ONLY
-#include "hw/arm/boot.h"
-static inline target_ulong
-common_semi_rambase(CPUState *cs)
-{
-    CPUArchState *env = cs->env_ptr;
-    const struct arm_boot_info *info = env->boot_info;
-    target_ulong sp;
-
-    if (info) {
-        return info->loader_start;
-    }
-
-    if (is_a64(env)) {
-        sp = env->xregs[31];
-    } else {
-        sp = env->regs[13];
-    }
-    return common_semi_find_region_base(sp);
-}
-#endif
-
 #endif /* TARGET_ARM */
 
 #ifdef TARGET_RISCV
@@ -251,17 +266,6 @@ common_semi_sys_exit_extended(CPUState *cs, int nr)
     return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 8);
 }
 
-#ifndef CONFIG_USER_ONLY
-
-static inline target_ulong
-common_semi_rambase(CPUState *cs)
-{
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
-    return common_semi_find_region_base(env->gpr[xSP]);
-}
-#endif
-
 #endif
 
 /*
@@ -1165,12 +1169,12 @@ target_ulong do_common_semihosting(CPUState *cs)
     case TARGET_SYS_HEAPINFO:
         {
             target_ulong retvals[4];
-            target_ulong limit;
             int i;
 #ifdef CONFIG_USER_ONLY
             TaskState *ts = cs->opaque;
+            target_ulong limit;
 #else
-            target_ulong rambase = common_semi_rambase(cs);
+            LayoutInfo info = common_semi_find_bases(cs);
 #endif
 
             GET_ARG(0);
@@ -1201,12 +1205,15 @@ target_ulong do_common_semihosting(CPUState *cs)
             retvals[2] = ts->stack_base;
             retvals[3] = 0; /* Stack limit.  */
 #else
-            limit = current_machine->ram_size;
-            /* TODO: Make this use the limit of the loaded application.  */
-            retvals[0] = rambase + limit / 2;
-            retvals[1] = rambase + limit;
-            retvals[2] = rambase + limit; /* Stack base */
-            retvals[3] = rambase; /* Stack limit.  */
+            /*
+             * Reporting 0 indicates we couldn't calculate the real
+             * values which should force most software to fall back to
+             * using information it has.
+             */
+            retvals[0] = info.heapbase;  /* Heap Base */
+            retvals[1] = info.heaplimit; /* Heap Limit */
+            retvals[2] = info.heaplimit; /* Stack base */
+            retvals[3] = info.heapbase;  /* Stack limit.  */
 #endif
 
             for (i = 0; i < ARRAY_SIZE(retvals); i++) {
-- 
2.20.1
