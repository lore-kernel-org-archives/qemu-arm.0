Received: by 10.182.105.169 with SMTP id gn9csp618978obb;
        Thu, 5 Nov 2015 10:16:11 -0800 (PST)
X-Received: by 10.68.173.5 with SMTP id bg5mr11011344pbc.104.1446747365273;
        Thu, 05 Nov 2015 10:16:05 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id sc1si9350269pbb.21.2015.11.05.10.16.04
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Thu, 05 Nov 2015 10:16:05 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZuP4p-0004kR-0q; Thu, 05 Nov 2015 18:15:59 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH 03/16] tlb_set_page_with_attrs: Take argument specifying AddressSpace to use
Date: Thu,  5 Nov 2015 18:15:45 +0000
Message-Id: <1446747358-18214-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
X-TUID: u3lOzhqluGVm

Add an argument to tlb_set_page_with_attrs which allows the target CPU code
to tell the core code which AddressSpace to use.

The AddressSpace is specified by the index into the array of ASes which
were registered with cpu_address_space_init().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 cputlb.c                |  6 +++---
 exec.c                  |  7 ++++---
 include/exec/exec-all.h | 33 ++++++++++++++++++++++++++++++---
 target-arm/helper.c     |  2 +-
 target-i386/helper.c    |  2 +-
 5 files changed, 39 insertions(+), 11 deletions(-)

diff --git a/cputlb.c b/cputlb.c
index bf1d50a..e753083 100644
--- a/cputlb.c
+++ b/cputlb.c
@@ -343,7 +343,7 @@ static void tlb_add_large_page(CPUArchState *env, target_ulong vaddr,
  * Called from TCG-generated code, which is under an RCU read-side
  * critical section.
  */
-void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
+void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr, int asidx,
                              hwaddr paddr, MemTxAttrs attrs, int prot,
                              int mmu_idx, target_ulong size)
 {
@@ -363,7 +363,7 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
     }
 
     sz = size;
-    section = address_space_translate_for_iotlb(cpu, paddr, &xlat, &sz);
+    section = address_space_translate_for_iotlb(cpu, asidx, paddr, &xlat, &sz);
     assert(sz >= TARGET_PAGE_SIZE);
 
 #if defined(DEBUG_TLB)
@@ -433,7 +433,7 @@ void tlb_set_page(CPUState *cpu, target_ulong vaddr,
                   hwaddr paddr, int prot,
                   int mmu_idx, target_ulong size)
 {
-    tlb_set_page_with_attrs(cpu, vaddr, paddr, MEMTXATTRS_UNSPECIFIED,
+    tlb_set_page_with_attrs(cpu, vaddr, 0, paddr, MEMTXATTRS_UNSPECIFIED,
                             prot, mmu_idx, size);
 }
 
diff --git a/exec.c b/exec.c
index 6a2a694..92e76fa 100644
--- a/exec.c
+++ b/exec.c
@@ -445,12 +445,13 @@ MemoryRegion *address_space_translate(AddressSpace *as, hwaddr addr,
 
 /* Called from RCU critical section */
 MemoryRegionSection *
-address_space_translate_for_iotlb(CPUState *cpu, hwaddr addr,
+address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
                                   hwaddr *xlat, hwaddr *plen)
 {
     MemoryRegionSection *section;
-    section = address_space_translate_internal(cpu->cpu_ases[0].memory_dispatch,
-                                               addr, xlat, plen, false);
+    AddressSpaceDispatch *d = cpu->cpu_ases[asidx].memory_dispatch;
+
+    section = address_space_translate_internal(d, addr, xlat, plen, false);
 
     assert(!section->mr->iommu_ops);
     return section;
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 90130ca..472d0fc 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -144,7 +144,34 @@ void tlb_flush_by_mmuidx(CPUState *cpu, ...);
 void tlb_set_page(CPUState *cpu, target_ulong vaddr,
                   hwaddr paddr, int prot,
                   int mmu_idx, target_ulong size);
-void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
+/**
+ * tlb_set_page_with_attrs:
+ * @cpu: CPU to add this TLB entry for
+ * @vaddr: virtual address of page to add entry for
+ * @asidx: index of the AddressSpace the physical address is in
+ * @paddr: physical address of the page
+ * @attrs: memory transaction attributes
+ * @prot: access permissions (PAGE_READ/PAGE_WRITE/PAGE_EXEC bits)
+ * @mmu_idx: MMU index to insert TLB entry for
+ * @size: size of the page in bytes
+ *
+ * Add an entry to this CPU's TLB (a mapping from virtual address
+ * @vaddr to physical address @paddr) with the specified memory
+ * transaction attributes. This is generally called by the target CPU
+ * specific code after it has been called through the tlb_fill()
+ * entry point and performed a successful page table walk to find
+ * the physical address and attributes for the virtual address
+ * which provoked the TLB miss.
+ *
+ * At most one entry for a given virtual address is permitted. Only a
+ * single TARGET_PAGE_SIZE region is mapped; the supplied @size is only
+ * used by tlb_flush_page.
+ *
+ * @asidx is the index of the AddressSpace in the cpu->ases array;
+ * if the CPU does not support multiple AddressSpaces then it will
+ * always be zero.
+ */
+void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr, int asidx,
                              hwaddr paddr, MemTxAttrs attrs,
                              int prot, int mmu_idx, target_ulong size);
 void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr);
@@ -400,8 +427,8 @@ void tlb_set_dirty(CPUState *cpu, target_ulong vaddr);
 void tb_flush_jmp_cache(CPUState *cpu, target_ulong addr);
 
 MemoryRegionSection *
-address_space_translate_for_iotlb(CPUState *cpu, hwaddr addr, hwaddr *xlat,
-                                  hwaddr *plen);
+address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
+                                  hwaddr *xlat, hwaddr *plen);
 hwaddr memory_region_section_get_iotlb(CPUState *cpu,
                                        MemoryRegionSection *section,
                                        target_ulong vaddr,
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 4ecae61..174371b 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -7315,7 +7315,7 @@ bool arm_tlb_fill(CPUState *cs, vaddr address,
         /* Map a single [sub]page.  */
         phys_addr &= TARGET_PAGE_MASK;
         address &= TARGET_PAGE_MASK;
-        tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
+        tlb_set_page_with_attrs(cs, address, 0, phys_addr, attrs,
                                 prot, mmu_idx, page_size);
         return 0;
     }
diff --git a/target-i386/helper.c b/target-i386/helper.c
index d18be95..1c43717 100644
--- a/target-i386/helper.c
+++ b/target-i386/helper.c
@@ -962,7 +962,7 @@ do_check_protect_pse36:
     page_offset = vaddr & (page_size - 1);
     paddr = pte + page_offset;
 
-    tlb_set_page_with_attrs(cs, vaddr, paddr, cpu_get_mem_attrs(env),
+    tlb_set_page_with_attrs(cs, vaddr, 0, paddr, cpu_get_mem_attrs(env),
                             prot, mmu_idx, page_size);
     return 0;
  do_fault_rsvd:
-- 
1.9.1
