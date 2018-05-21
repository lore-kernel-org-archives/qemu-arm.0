Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp311083wme;
        Mon, 21 May 2018 07:04:06 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqSHmrsMCdT0wDZOkmZNp36XqPukLpBcnZDyXFtY7toKj8TGDWaK9Uti4Fyzf/TZFGYuv6X
X-Received: by 2002:adf:8124:: with SMTP id 33-v6mr14949324wrm.109.1526911446381;
        Mon, 21 May 2018 07:04:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526911446; cv=none;
        d=google.com; s=arc-20160816;
        b=v/KRyiuwEK+zbxSQjlTxLSjc19d4gg/Wnx5f6evlfMfav4tLOImkHOx8DVN78zJtcC
         TydKu18OxOrUCz6M7Ou4d/pxu/t5fNvrgBOhQevT8MBJSdNKTpZLJNi5sC8JSwC3xj8z
         1GoI0cmoBocJ0/vDLRf9al1xKYmOj2LlyS/JZJCYPLkOMxbwvvxOpVYXMgLTbSYEG28S
         0umOpisPhfkRPuDUL7r2A3VkWpkg50RcN1P2BpfJ056l8NDDvag//tApizB78CzrJaTT
         Xah1PLhyUxxsTxuRvet7kgA9TK7gtZlpGQfrKJQNrH7BX06aEap0dhjCmzIwDEFOYjLD
         TnXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=EcWKQwpckbPjSqgQoXxZK2f0szd3l33Q5RSzo6JMlqE=;
        b=kyR5MhzHCQaF+1hZsJT1iAiFJyLl+3IB5JDBbKTIsQiEfHXm/Uc+0L43a6ndaVgK0O
         3A4KtDg1VsMdCx87tg/auOvdKMaBdwHKPviQD2MCvMxSoMUbpEnzNcMALupNyUPaOp1i
         cL9Dr1pBDBpIoa43YqAwEflg7lOr3Cs+VzZTWORK9XC72VP+GUzXqu3rtVtl3bxDoLDu
         3WeTd2eNEGsGsUwvfMSuW0LS0UXucjg3AvWooz6gXbJ2EmrdcqljHsi0VywkuHOKiVgr
         amSYN/JmmmMeTBjq80nm4LJXqbwu+6uRm8iyMI/klCZdiz0jYOE+hhWQkcbPSTp+eZq7
         Ixkg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id c4-v6si9927721wmf.143.2018.05.21.07.04.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 May 2018 07:04:06 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKlPx-0007dc-EB; Mon, 21 May 2018 15:04:05 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 03/27] Make address_space_translate{,_cached}() take a MemTxAttrs argument
Date: Mon, 21 May 2018 15:03:38 +0100
Message-Id: <20180521140402.23318-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
X-TUID: WTAl/5mZJO7d

As part of plumbing MemTxAttrs down to the IOMMU translate method,
add MemTxAttrs as an argument to address_space_translate()
and address_space_translate_cached(). Callers either have an
attrs value to hand, or don't care and can use MEMTXATTRS_UNSPECIFIED.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/memory.h     |  4 +++-
 accel/tcg/translate-all.c |  2 +-
 exec.c                    | 14 +++++++++-----
 hw/vfio/common.c          |  3 ++-
 memory_ldst.inc.c         | 18 +++++++++---------
 target/riscv/helper.c     |  2 +-
 6 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index cce355d2d8..9a30a1bb9e 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1908,6 +1908,7 @@ IOMMUTLBEntry address_space_get_iotlb_entry(AddressSpace *as, hwaddr addr,
  * #MemoryRegion.
  * @len: pointer to length
  * @is_write: indicates the transfer direction
+ * @attrs: memory attributes
  */
 MemoryRegion *flatview_translate(FlatView *fv,
                                  hwaddr addr, hwaddr *xlat,
@@ -1915,7 +1916,8 @@ MemoryRegion *flatview_translate(FlatView *fv,
 
 static inline MemoryRegion *address_space_translate(AddressSpace *as,
                                                     hwaddr addr, hwaddr *xlat,
-                                                    hwaddr *len, bool is_write)
+                                                    hwaddr *len, bool is_write,
+                                                    MemTxAttrs attrs)
 {
     return flatview_translate(address_space_to_flatview(as),
                               addr, xlat, len, is_write);
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index f04a922ef7..52f7bd59a9 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1679,7 +1679,7 @@ void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs)
     hwaddr l = 1;
 
     rcu_read_lock();
-    mr = address_space_translate(as, addr, &addr, &l, false);
+    mr = address_space_translate(as, addr, &addr, &l, false, attrs);
     if (!(memory_region_is_ram(mr)
           || memory_region_is_romd(mr))) {
         rcu_read_unlock();
diff --git a/exec.c b/exec.c
index c3a197e67b..d314c7cc39 100644
--- a/exec.c
+++ b/exec.c
@@ -3322,7 +3322,8 @@ static inline void cpu_physical_memory_write_rom_internal(AddressSpace *as,
     rcu_read_lock();
     while (len > 0) {
         l = len;
-        mr = address_space_translate(as, addr, &addr1, &l, true);
+        mr = address_space_translate(as, addr, &addr1, &l, true,
+                                     MEMTXATTRS_UNSPECIFIED);
 
         if (!(memory_region_is_ram(mr) ||
               memory_region_is_romd(mr))) {
@@ -3699,7 +3700,7 @@ void address_space_cache_destroy(MemoryRegionCache *cache)
  */
 static inline MemoryRegion *address_space_translate_cached(
     MemoryRegionCache *cache, hwaddr addr, hwaddr *xlat,
-    hwaddr *plen, bool is_write)
+    hwaddr *plen, bool is_write, MemTxAttrs attrs)
 {
     MemoryRegionSection section;
     MemoryRegion *mr;
@@ -3733,7 +3734,8 @@ address_space_read_cached_slow(MemoryRegionCache *cache, hwaddr addr,
     MemoryRegion *mr;
 
     l = len;
-    mr = address_space_translate_cached(cache, addr, &addr1, &l, false);
+    mr = address_space_translate_cached(cache, addr, &addr1, &l, false,
+                                        MEMTXATTRS_UNSPECIFIED);
     flatview_read_continue(cache->fv,
                            addr, MEMTXATTRS_UNSPECIFIED, buf, len,
                            addr1, l, mr);
@@ -3750,7 +3752,8 @@ address_space_write_cached_slow(MemoryRegionCache *cache, hwaddr addr,
     MemoryRegion *mr;
 
     l = len;
-    mr = address_space_translate_cached(cache, addr, &addr1, &l, true);
+    mr = address_space_translate_cached(cache, addr, &addr1, &l, true,
+                                        MEMTXATTRS_UNSPECIFIED);
     flatview_write_continue(cache->fv,
                             addr, MEMTXATTRS_UNSPECIFIED, buf, len,
                             addr1, l, mr);
@@ -3848,7 +3851,8 @@ bool cpu_physical_memory_is_io(hwaddr phys_addr)
 
     rcu_read_lock();
     mr = address_space_translate(&address_space_memory,
-                                 phys_addr, &phys_addr, &l, false);
+                                 phys_addr, &phys_addr, &l, false,
+                                 MEMTXATTRS_UNSPECIFIED);
 
     res = !(memory_region_is_ram(mr) || memory_region_is_romd(mr));
     rcu_read_unlock();
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 07ffa0ba10..8e57265edf 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -324,7 +324,8 @@ static bool vfio_get_vaddr(IOMMUTLBEntry *iotlb, void **vaddr,
      */
     mr = address_space_translate(&address_space_memory,
                                  iotlb->translated_addr,
-                                 &xlat, &len, writable);
+                                 &xlat, &len, writable,
+                                 MEMTXATTRS_UNSPECIFIED);
     if (!memory_region_is_ram(mr)) {
         error_report("iommu map to non memory area %"HWADDR_PRIx"",
                      xlat);
diff --git a/memory_ldst.inc.c b/memory_ldst.inc.c
index 25d6125747..15483987fe 100644
--- a/memory_ldst.inc.c
+++ b/memory_ldst.inc.c
@@ -33,7 +33,7 @@ static inline uint32_t glue(address_space_ldl_internal, SUFFIX)(ARG1_DECL,
     bool release_lock = false;
 
     RCU_READ_LOCK();
-    mr = TRANSLATE(addr, &addr1, &l, false);
+    mr = TRANSLATE(addr, &addr1, &l, false, attrs);
     if (l < 4 || !IS_DIRECT(mr, false)) {
         release_lock |= prepare_mmio_access(mr);
 
@@ -109,7 +109,7 @@ static inline uint64_t glue(address_space_ldq_internal, SUFFIX)(ARG1_DECL,
     bool release_lock = false;
 
     RCU_READ_LOCK();
-    mr = TRANSLATE(addr, &addr1, &l, false);
+    mr = TRANSLATE(addr, &addr1, &l, false, attrs);
     if (l < 8 || !IS_DIRECT(mr, false)) {
         release_lock |= prepare_mmio_access(mr);
 
@@ -183,7 +183,7 @@ uint32_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
     bool release_lock = false;
 
     RCU_READ_LOCK();
-    mr = TRANSLATE(addr, &addr1, &l, false);
+    mr = TRANSLATE(addr, &addr1, &l, false, attrs);
     if (!IS_DIRECT(mr, false)) {
         release_lock |= prepare_mmio_access(mr);
 
@@ -219,7 +219,7 @@ static inline uint32_t glue(address_space_lduw_internal, SUFFIX)(ARG1_DECL,
     bool release_lock = false;
 
     RCU_READ_LOCK();
-    mr = TRANSLATE(addr, &addr1, &l, false);
+    mr = TRANSLATE(addr, &addr1, &l, false, attrs);
     if (l < 2 || !IS_DIRECT(mr, false)) {
         release_lock |= prepare_mmio_access(mr);
 
@@ -296,7 +296,7 @@ void glue(address_space_stl_notdirty, SUFFIX)(ARG1_DECL,
     bool release_lock = false;
 
     RCU_READ_LOCK();
-    mr = TRANSLATE(addr, &addr1, &l, true);
+    mr = TRANSLATE(addr, &addr1, &l, true, attrs);
     if (l < 4 || !IS_DIRECT(mr, true)) {
         release_lock |= prepare_mmio_access(mr);
 
@@ -333,7 +333,7 @@ static inline void glue(address_space_stl_internal, SUFFIX)(ARG1_DECL,
     bool release_lock = false;
 
     RCU_READ_LOCK();
-    mr = TRANSLATE(addr, &addr1, &l, true);
+    mr = TRANSLATE(addr, &addr1, &l, true, attrs);
     if (l < 4 || !IS_DIRECT(mr, true)) {
         release_lock |= prepare_mmio_access(mr);
 
@@ -405,7 +405,7 @@ void glue(address_space_stb, SUFFIX)(ARG1_DECL,
     bool release_lock = false;
 
     RCU_READ_LOCK();
-    mr = TRANSLATE(addr, &addr1, &l, true);
+    mr = TRANSLATE(addr, &addr1, &l, true, attrs);
     if (!IS_DIRECT(mr, true)) {
         release_lock |= prepare_mmio_access(mr);
         r = memory_region_dispatch_write(mr, addr1, val, 1, attrs);
@@ -438,7 +438,7 @@ static inline void glue(address_space_stw_internal, SUFFIX)(ARG1_DECL,
     bool release_lock = false;
 
     RCU_READ_LOCK();
-    mr = TRANSLATE(addr, &addr1, &l, true);
+    mr = TRANSLATE(addr, &addr1, &l, true, attrs);
     if (l < 2 || !IS_DIRECT(mr, true)) {
         release_lock |= prepare_mmio_access(mr);
 
@@ -511,7 +511,7 @@ static void glue(address_space_stq_internal, SUFFIX)(ARG1_DECL,
     bool release_lock = false;
 
     RCU_READ_LOCK();
-    mr = TRANSLATE(addr, &addr1, &l, true);
+    mr = TRANSLATE(addr, &addr1, &l, true, attrs);
     if (l < 8 || !IS_DIRECT(mr, true)) {
         release_lock |= prepare_mmio_access(mr);
 
diff --git a/target/riscv/helper.c b/target/riscv/helper.c
index 95889f23b9..29e1a603dc 100644
--- a/target/riscv/helper.c
+++ b/target/riscv/helper.c
@@ -210,7 +210,7 @@ restart:
                 MemoryRegion *mr;
                 hwaddr l = sizeof(target_ulong), addr1;
                 mr = address_space_translate(cs->as, pte_addr,
-                    &addr1, &l, false);
+                    &addr1, &l, false, MEMTXATTRS_UNSPECIFIED);
                 if (memory_access_is_direct(mr, true)) {
                     target_ulong *pte_pa =
                         qemu_map_ram_ptr(mr->ram_block, addr1);
-- 
2.17.0
