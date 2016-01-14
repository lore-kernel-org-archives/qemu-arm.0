Received: by 10.25.159.19 with SMTP id i19csp1802056lfe;
        Thu, 14 Jan 2016 06:17:58 -0800 (PST)
X-Received: by 10.28.128.215 with SMTP id b206mr5635248wmd.52.1452781073631;
        Thu, 14 Jan 2016 06:17:53 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id r186si46870455wmb.16.2016.01.14.06.17.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 06:17:53 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJiKd-0008UN-DE; Thu, 14 Jan 2016 13:52:55 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 06/19] cputlb.c: Use correct address space when looking up MemoryRegionSection
Date: Thu, 14 Jan 2016 13:52:42 +0000
Message-Id: <1452779575-32582-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
References: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
X-TUID: 49Zl6WEijdMI

When looking up the MemoryRegionSection for the new TLB entry in
tlb_set_page_with_attrs(), use cpu_asidx_from_attrs() to determine
the correct address space index for the lookup, and pass it into
address_space_translate_for_iotlb().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 cputlb.c                | 3 ++-
 exec.c                  | 7 ++++---
 include/exec/exec-all.h | 4 ++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/cputlb.c b/cputlb.c
index bf1d50a..f1c1082 100644
--- a/cputlb.c
+++ b/cputlb.c
@@ -356,6 +356,7 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
     CPUTLBEntry *te;
     hwaddr iotlb, xlat, sz;
     unsigned vidx = env->vtlb_index++ % CPU_VTLB_SIZE;
+    int asidx = cpu_asidx_from_attrs(cpu, attrs);
 
     assert(size >= TARGET_PAGE_SIZE);
     if (size != TARGET_PAGE_SIZE) {
@@ -363,7 +364,7 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
     }
 
     sz = size;
-    section = address_space_translate_for_iotlb(cpu, paddr, &xlat, &sz);
+    section = address_space_translate_for_iotlb(cpu, asidx, paddr, &xlat, &sz);
     assert(sz >= TARGET_PAGE_SIZE);
 
 #if defined(DEBUG_TLB)
diff --git a/exec.c b/exec.c
index 8bc3288..884586a 100644
--- a/exec.c
+++ b/exec.c
@@ -431,12 +431,13 @@ MemoryRegion *address_space_translate(AddressSpace *as, hwaddr addr,
 
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
index caa78a9..ee9757f 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -432,8 +432,8 @@ void tlb_set_dirty(CPUState *cpu, target_ulong vaddr);
 void tb_flush_jmp_cache(CPUState *cpu, target_ulong addr);
 
 MemoryRegionSection *
-address_space_translate_for_iotlb(CPUState *cpu, hwaddr addr, hwaddr *xlat,
-                                  hwaddr *plen);
+address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
+                                  hwaddr *xlat, hwaddr *plen);
 hwaddr memory_region_section_get_iotlb(CPUState *cpu,
                                        MemoryRegionSection *section,
                                        target_ulong vaddr,
-- 
1.9.1
