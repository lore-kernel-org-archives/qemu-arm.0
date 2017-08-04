Received: by 10.25.221.202 with SMTP id w71csp2358820lfi;
        Fri, 4 Aug 2017 10:33:39 -0700 (PDT)
X-Received: by 10.237.35.81 with SMTP id i17mr3965981qtc.19.1501868019668;
        Fri, 04 Aug 2017 10:33:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501868019; cv=none;
        d=google.com; s=arc-20160816;
        b=m8ogc7tqnHcKe1JFhgnKwj9v6YpMhBwlo6gs8ZlbHHqIyZAlWCu5DYqGcjWdD3Gln4
         dsNxiCJo7/QIGgZ+Y73sutMKC4SvJrJnHaHONHE+SBjecGkGxgIEaK3uj4aa+WRU4Plg
         V+DLgRuK+dLUsw9WvU2DudujRhVa3iU/ZwkED6Py+aIfk4XW37oY4hwjdUu9degAiqZ6
         aVmEa2zf6qx2qHYsQX1n13xx9UpRrYQCT5ezObJOp861WlDrJzUR9Uf9fitQAMb580Vx
         K20+k5ueENcj1Q6+V7CCQ7Fvy5s2yfDcBERJsO0ty8dXilRVUOUhJUB52r2QEi9euy6j
         zLfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=5VdTlYlBRRvSGYie19VYl+5jI4scl+4P5LWqWeEAcX8=;
        b=O7Xu83Cj6MEhEvC+XfOBPOaHWh1UP7kSSxB5PVJjtoL41zCNQyNpPPv1uRUlKLOKFq
         1y4j/U1cOsGePEiqY3T7jAWhCJym+4YUAskoGAfnt/zUXDpFmABN8zZ4WNbDCaKpZr4v
         HE/6rN8n+87iCr5O4POlDOENIqFhjEnTjcClSn/tXHghn7dAnr911j9nOLD3q06ZmLXK
         qAxGZUSWvhqJeH6+IHY56rwCW1uA0DXiGoL6tMGECrNgrBVJxCldEnF/pEaaQVcE3oLq
         +gOVe+wJwFWPkY627LJkHFS9zI6iZWl9yCZxS9TaY2s+E5IZvs+YH5SLeoM26EBqwaUJ
         c79A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f25si1992396qtc.256.2017.08.04.10.33.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 10:33:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40504 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddgTg-0007iS-Ug
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 13:33:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ddgTE-0007Tg-Vf
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 13:33:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ddgTD-0001ix-DT
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 13:33:08 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37805)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ddgTD-0001gy-6T; Fri, 04 Aug 2017 13:33:07 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ddgHL-0006si-N7; Fri, 04 Aug 2017 18:20:51 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  4 Aug 2017 18:20:44 +0100
Message-Id: <1501867249-1924-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 3/8] cputlb: Support generating CPU exceptions on
 memory transaction failures
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fQ2Sq3yqRhEn

Call the new cpu_transaction_failed() hook at the places where
CPU generated code interacts with the memory system:
 io_readx()
 io_writex()
 get_page_addr_code()

Any access from C code (eg via cpu_physical_memory_rw(),
address_space_rw(), ld/st_*_phys()) will *not* trigger CPU exceptions
via cpu_transaction_failed().  Handling for transactions failures for
this kind of call should be done by using a function which returns a
MemTxResult and treating the failure case appropriately in the
calling code.

In an ideal world we would not generate CPU exceptions for
instruction fetch failures in get_page_addr_code() but instead wait
until the code translation process tried a load and it failed;
however that change would require too great a restructuring and
redesign to attempt at this point.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 softmmu_template.h |  4 ++--
 accel/tcg/cputlb.c | 32 ++++++++++++++++++++++++++++++--
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/softmmu_template.h b/softmmu_template.h
index 4a2b665..d756329 100644
--- a/softmmu_template.h
+++ b/softmmu_template.h
@@ -101,7 +101,7 @@ static inline DATA_TYPE glue(io_read, SUFFIX)(CPUArchState *env,
                                               uintptr_t retaddr)
 {
     CPUIOTLBEntry *iotlbentry = &env->iotlb[mmu_idx][index];
-    return io_readx(env, iotlbentry, addr, retaddr, DATA_SIZE);
+    return io_readx(env, iotlbentry, mmu_idx, addr, retaddr, DATA_SIZE);
 }
 #endif
 
@@ -262,7 +262,7 @@ static inline void glue(io_write, SUFFIX)(CPUArchState *env,
                                           uintptr_t retaddr)
 {
     CPUIOTLBEntry *iotlbentry = &env->iotlb[mmu_idx][index];
-    return io_writex(env, iotlbentry, val, addr, retaddr, DATA_SIZE);
+    return io_writex(env, iotlbentry, mmu_idx, val, addr, retaddr, DATA_SIZE);
 }
 
 void helper_le_st_name(CPUArchState *env, target_ulong addr, DATA_TYPE val,
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 85635ae..e72415a 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -747,6 +747,7 @@ static inline ram_addr_t qemu_ram_addr_from_host_nofail(void *ptr)
 }
 
 static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
+                         int mmu_idx,
                          target_ulong addr, uintptr_t retaddr, int size)
 {
     CPUState *cpu = ENV_GET_CPU(env);
@@ -754,6 +755,7 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
     MemoryRegion *mr = iotlb_to_region(cpu, physaddr, iotlbentry->attrs);
     uint64_t val;
     bool locked = false;
+    MemTxResult r;
 
     physaddr = (physaddr & TARGET_PAGE_MASK) + addr;
     cpu->mem_io_pc = retaddr;
@@ -767,7 +769,12 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
         qemu_mutex_lock_iothread();
         locked = true;
     }
-    memory_region_dispatch_read(mr, physaddr, &val, size, iotlbentry->attrs);
+    r = memory_region_dispatch_read(mr, physaddr,
+                                    &val, size, iotlbentry->attrs);
+    if (r != MEMTX_OK) {
+        cpu_transaction_failed(cpu, physaddr, addr, size, MMU_DATA_LOAD,
+                               mmu_idx, iotlbentry->attrs, r, retaddr);
+    }
     if (locked) {
         qemu_mutex_unlock_iothread();
     }
@@ -776,6 +783,7 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
 }
 
 static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
+                      int mmu_idx,
                       uint64_t val, target_ulong addr,
                       uintptr_t retaddr, int size)
 {
@@ -783,6 +791,7 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
     hwaddr physaddr = iotlbentry->addr;
     MemoryRegion *mr = iotlb_to_region(cpu, physaddr, iotlbentry->attrs);
     bool locked = false;
+    MemTxResult r;
 
     physaddr = (physaddr & TARGET_PAGE_MASK) + addr;
     if (mr != &io_mem_rom && mr != &io_mem_notdirty && !cpu->can_do_io) {
@@ -795,7 +804,12 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
         qemu_mutex_lock_iothread();
         locked = true;
     }
-    memory_region_dispatch_write(mr, physaddr, val, size, iotlbentry->attrs);
+    r = memory_region_dispatch_write(mr, physaddr,
+                                     val, size, iotlbentry->attrs);
+    if (r != MEMTX_OK) {
+        cpu_transaction_failed(cpu, physaddr, addr, size, MMU_DATA_STORE,
+                               mmu_idx, iotlbentry->attrs, r, retaddr);
+    }
     if (locked) {
         qemu_mutex_unlock_iothread();
     }
@@ -845,6 +859,7 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
     MemoryRegion *mr;
     CPUState *cpu = ENV_GET_CPU(env);
     CPUIOTLBEntry *iotlbentry;
+    hwaddr physaddr;
 
     index = (addr >> TARGET_PAGE_BITS) & (CPU_TLB_SIZE - 1);
     mmu_idx = cpu_mmu_index(env, true);
@@ -868,6 +883,19 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
         }
         qemu_mutex_unlock_iothread();
 
+        /* Give the new-style cpu_transaction_failed() hook first chance
+         * to handle this.
+         * This is not the ideal place to detect and generate CPU
+         * exceptions for instruction fetch failure (for instance
+         * we don't know the length of the access that the CPU would
+         * use, and it would be better to go ahead and try the access
+         * and use the MemTXResult it produced). However it is the
+         * simplest place we have currently available for the check.
+         */
+        physaddr = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
+        cpu_transaction_failed(cpu, physaddr, addr, 0, MMU_INST_FETCH, mmu_idx,
+                               iotlbentry->attrs, MEMTX_DECODE_ERROR, 0);
+
         cpu_unassigned_access(cpu, addr, false, true, 0, 4);
         /* The CPU's unassigned access hook might have longjumped out
          * with an exception. If it didn't (or there was no hook) then
-- 
2.7.4

