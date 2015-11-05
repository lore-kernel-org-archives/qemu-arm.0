Received: by 10.182.105.169 with SMTP id gn9csp618908obb;
        Thu, 5 Nov 2015 10:16:04 -0800 (PST)
X-Received: by 10.107.150.196 with SMTP id y187mr11683440iod.13.1446747364823;
        Thu, 05 Nov 2015 10:16:04 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id 10si7647653igq.45.2015.11.05.10.16.03
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 05 Nov 2015 10:16:04 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZuP4p-0004kV-2Z; Thu, 05 Nov 2015 18:15:59 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH 04/16] exec.c: Add address space index to CPUIOTLBEntry
Date: Thu,  5 Nov 2015 18:15:46 +0000
Message-Id: <1446747358-18214-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
X-TUID: FtcnHgiwK4Dr

Add the address space index to CPUIOTLBEntry, and use this to pass it
to iotlb_to_region(), so that we use the correct AddressSpace when
doing IO path lookups.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 cputlb.c                | 7 +++++--
 exec.c                  | 4 ++--
 include/exec/cpu-defs.h | 1 +
 include/exec/exec-all.h | 2 +-
 softmmu_template.h      | 4 ++--
 5 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/cputlb.c b/cputlb.c
index e753083..ae55035 100644
--- a/cputlb.c
+++ b/cputlb.c
@@ -397,6 +397,7 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr, int asidx,
     /* refill the tlb */
     env->iotlb[mmu_idx][index].addr = iotlb - vaddr;
     env->iotlb[mmu_idx][index].attrs = attrs;
+    env->iotlb[mmu_idx][index].asidx = asidx;
     te->addend = addend - vaddr;
     if (prot & PAGE_READ) {
         te->addr_read = address;
@@ -448,6 +449,7 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env1, target_ulong addr)
     void *p;
     MemoryRegion *mr;
     CPUState *cpu = ENV_GET_CPU(env1);
+    CPUIOTLBEntry *iotlbentry;
 
     page_index = (addr >> TARGET_PAGE_BITS) & (CPU_TLB_SIZE - 1);
     mmu_idx = cpu_mmu_index(env1, true);
@@ -455,8 +457,9 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env1, target_ulong addr)
                  (addr & TARGET_PAGE_MASK))) {
         cpu_ldub_code(env1, addr);
     }
-    pd = env1->iotlb[mmu_idx][page_index].addr & ~TARGET_PAGE_MASK;
-    mr = iotlb_to_region(cpu, pd);
+    iotlbentry = &env1->iotlb[mmu_idx][page_index];
+    pd = iotlbentry->addr & ~TARGET_PAGE_MASK;
+    mr = iotlb_to_region(cpu, pd, iotlbentry->asidx);
     if (memory_region_is_unassigned(mr)) {
         CPUClass *cc = CPU_GET_CLASS(cpu);
 
diff --git a/exec.c b/exec.c
index 92e76fa..5e78d82 100644
--- a/exec.c
+++ b/exec.c
@@ -2228,9 +2228,9 @@ static uint16_t dummy_section(PhysPageMap *map, AddressSpace *as,
     return phys_section_add(map, &section);
 }
 
-MemoryRegion *iotlb_to_region(CPUState *cpu, hwaddr index)
+MemoryRegion *iotlb_to_region(CPUState *cpu, hwaddr index, int asidx)
 {
-    CPUAddressSpace *cpuas = &cpu->cpu_ases[0];
+    CPUAddressSpace *cpuas = &cpu->cpu_ases[asidx];
     AddressSpaceDispatch *d = atomic_rcu_read(&cpuas->memory_dispatch);
     MemoryRegionSection *sections = d->map.sections;
 
diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 5093be2..d102d79 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -129,6 +129,7 @@ QEMU_BUILD_BUG_ON(sizeof(CPUTLBEntry) != (1 << CPU_TLB_ENTRY_BITS));
 typedef struct CPUIOTLBEntry {
     hwaddr addr;
     MemTxAttrs attrs;
+    int asidx;
 } CPUIOTLBEntry;
 
 #define CPU_COMMON_TLB \
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 472d0fc..5dba8aa 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -398,7 +398,7 @@ extern uintptr_t tci_tb_ptr;
 #if !defined(CONFIG_USER_ONLY)
 
 struct MemoryRegion *iotlb_to_region(CPUState *cpu,
-                                     hwaddr index);
+                                     hwaddr index, int asidx);
 
 void tlb_fill(CPUState *cpu, target_ulong addr, int is_write, int mmu_idx,
               uintptr_t retaddr);
diff --git a/softmmu_template.h b/softmmu_template.h
index 6803890..31a0f62 100644
--- a/softmmu_template.h
+++ b/softmmu_template.h
@@ -150,7 +150,7 @@ static inline DATA_TYPE glue(io_read, SUFFIX)(CPUArchState *env,
     uint64_t val;
     CPUState *cpu = ENV_GET_CPU(env);
     hwaddr physaddr = iotlbentry->addr;
-    MemoryRegion *mr = iotlb_to_region(cpu, physaddr);
+    MemoryRegion *mr = iotlb_to_region(cpu, physaddr, iotlbentry->asidx);
 
     physaddr = (physaddr & TARGET_PAGE_MASK) + addr;
     cpu->mem_io_pc = retaddr;
@@ -357,7 +357,7 @@ static inline void glue(io_write, SUFFIX)(CPUArchState *env,
 {
     CPUState *cpu = ENV_GET_CPU(env);
     hwaddr physaddr = iotlbentry->addr;
-    MemoryRegion *mr = iotlb_to_region(cpu, physaddr);
+    MemoryRegion *mr = iotlb_to_region(cpu, physaddr, iotlbentry->asidx);
 
     physaddr = (physaddr & TARGET_PAGE_MASK) + addr;
     if (mr != &io_mem_rom && mr != &io_mem_notdirty && !cpu->can_do_io) {
-- 
1.9.1
