Received: by 10.182.158.201 with SMTP id ww9csp119148obb;
        Mon, 16 Nov 2015 06:05:42 -0800 (PST)
X-Received: by 10.25.161.16 with SMTP id k16mr17251677lfe.31.1447682729836;
        Mon, 16 Nov 2015 06:05:29 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id uq18si26177152lbb.70.2015.11.16.06.05.29
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Mon, 16 Nov 2015 06:05:29 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZyKPL-000134-I8; Mon, 16 Nov 2015 14:05:23 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH v2 07/19] exec.c: Pass MemTxAttrs to iotlb_to_region so it uses the right AS
Date: Mon, 16 Nov 2015 14:05:11 +0000
Message-Id: <1447682723-3977-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
References: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
X-TUID: g2qi5BqYPDiO

Pass the MemTxAttrs for the memory access to iotlb_to_region(); this
allows it to determine the correct AddressSpace to use for the lookup.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 cputlb.c                | 6 ++++--
 exec.c                  | 5 +++--
 include/exec/exec-all.h | 2 +-
 softmmu_template.h      | 4 ++--
 4 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/cputlb.c b/cputlb.c
index f1c1082..f6fb161 100644
--- a/cputlb.c
+++ b/cputlb.c
@@ -449,6 +449,7 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env1, target_ulong addr)
     void *p;
     MemoryRegion *mr;
     CPUState *cpu = ENV_GET_CPU(env1);
+    CPUIOTLBEntry *iotlbentry;
 
     page_index = (addr >> TARGET_PAGE_BITS) & (CPU_TLB_SIZE - 1);
     mmu_idx = cpu_mmu_index(env1, true);
@@ -456,8 +457,9 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env1, target_ulong addr)
                  (addr & TARGET_PAGE_MASK))) {
         cpu_ldub_code(env1, addr);
     }
-    pd = env1->iotlb[mmu_idx][page_index].addr & ~TARGET_PAGE_MASK;
-    mr = iotlb_to_region(cpu, pd);
+    iotlbentry = &env1->iotlb[mmu_idx][page_index];
+    pd = iotlbentry->addr & ~TARGET_PAGE_MASK;
+    mr = iotlb_to_region(cpu, pd, iotlbentry->attrs);
     if (memory_region_is_unassigned(mr)) {
         CPUClass *cc = CPU_GET_CLASS(cpu);
 
diff --git a/exec.c b/exec.c
index 92f9292..edcfde0 100644
--- a/exec.c
+++ b/exec.c
@@ -2283,9 +2283,10 @@ static uint16_t dummy_section(PhysPageMap *map, AddressSpace *as,
     return phys_section_add(map, &section);
 }
 
-MemoryRegion *iotlb_to_region(CPUState *cpu, hwaddr index)
+MemoryRegion *iotlb_to_region(CPUState *cpu, hwaddr index, MemTxAttrs attrs)
 {
-    CPUAddressSpace *cpuas = &cpu->cpu_ases[0];
+    int asidx = cpu_asidx_from_attrs(cpu, attrs);
+    CPUAddressSpace *cpuas = &cpu->cpu_ases[asidx];
     AddressSpaceDispatch *d = atomic_rcu_read(&cpuas->memory_dispatch);
     MemoryRegionSection *sections = d->map.sections;
 
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index ee9757f..587736e 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -403,7 +403,7 @@ extern uintptr_t tci_tb_ptr;
 #if !defined(CONFIG_USER_ONLY)
 
 struct MemoryRegion *iotlb_to_region(CPUState *cpu,
-                                     hwaddr index);
+                                     hwaddr index, MemTxAttrs attrs);
 
 void tlb_fill(CPUState *cpu, target_ulong addr, int is_write, int mmu_idx,
               uintptr_t retaddr);
diff --git a/softmmu_template.h b/softmmu_template.h
index 6803890..208f808 100644
--- a/softmmu_template.h
+++ b/softmmu_template.h
@@ -150,7 +150,7 @@ static inline DATA_TYPE glue(io_read, SUFFIX)(CPUArchState *env,
     uint64_t val;
     CPUState *cpu = ENV_GET_CPU(env);
     hwaddr physaddr = iotlbentry->addr;
-    MemoryRegion *mr = iotlb_to_region(cpu, physaddr);
+    MemoryRegion *mr = iotlb_to_region(cpu, physaddr, iotlbentry->attrs);
 
     physaddr = (physaddr & TARGET_PAGE_MASK) + addr;
     cpu->mem_io_pc = retaddr;
@@ -357,7 +357,7 @@ static inline void glue(io_write, SUFFIX)(CPUArchState *env,
 {
     CPUState *cpu = ENV_GET_CPU(env);
     hwaddr physaddr = iotlbentry->addr;
-    MemoryRegion *mr = iotlb_to_region(cpu, physaddr);
+    MemoryRegion *mr = iotlb_to_region(cpu, physaddr, iotlbentry->attrs);
 
     physaddr = (physaddr & TARGET_PAGE_MASK) + addr;
     if (mr != &io_mem_rom && mr != &io_mem_notdirty && !cpu->can_do_io) {
-- 
1.9.1
