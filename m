Received: by 10.25.159.19 with SMTP id i19csp1786342lfe;
        Thu, 14 Jan 2016 05:53:26 -0800 (PST)
X-Received: by 10.195.12.226 with SMTP id et2mr4045118wjd.34.1452779582155;
        Thu, 14 Jan 2016 05:53:02 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id jq5si9782250wjc.74.2016.01.14.05.53.01
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 05:53:02 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJiKd-0008UB-8k; Thu, 14 Jan 2016 13:52:55 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 03/19] exec-all.h: Document tlb_set_page_with_attrs, tlb_set_page
Date: Thu, 14 Jan 2016 13:52:39 +0000
Message-Id: <1452779575-32582-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
References: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
X-TUID: 0zH0RX52ZEtU

Add documentation comments for tlb_set_page_with_attrs()
and tlb_set_page().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 include/exec/exec-all.h | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 9be0165..caa78a9 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -144,12 +144,40 @@ void tlb_flush_page_by_mmuidx(CPUState *cpu, target_ulong addr, ...);
  * MMU indexes.
  */
 void tlb_flush_by_mmuidx(CPUState *cpu, ...);
-void tlb_set_page(CPUState *cpu, target_ulong vaddr,
-                  hwaddr paddr, int prot,
-                  int mmu_idx, target_ulong size);
+/**
+ * tlb_set_page_with_attrs:
+ * @cpu: CPU to add this TLB entry for
+ * @vaddr: virtual address of page to add entry for
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
+ */
 void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
                              hwaddr paddr, MemTxAttrs attrs,
                              int prot, int mmu_idx, target_ulong size);
+/* tlb_set_page:
+ *
+ * This function is equivalent to calling tlb_set_page_with_attrs()
+ * with an @attrs argument of MEMTXATTRS_UNSPECIFIED. It's provided
+ * as a convenience for CPUs which don't use memory transaction attributes.
+ */
+void tlb_set_page(CPUState *cpu, target_ulong vaddr,
+                  hwaddr paddr, int prot,
+                  int mmu_idx, target_ulong size);
 void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr);
 void probe_write(CPUArchState *env, target_ulong addr, int mmu_idx,
                  uintptr_t retaddr);
-- 
1.9.1
