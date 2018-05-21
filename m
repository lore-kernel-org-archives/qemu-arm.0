Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp311367wme;
        Mon, 21 May 2018 07:04:15 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp/Y/JBoYhyeLzcFn3RQs7NHjTbyP57L43PaaZ99eqSxRLtkdzZpmKuVfAnyKdrawfv0iAF
X-Received: by 2002:adf:e1c1:: with SMTP id l1-v6mr2108804wri.111.1526911455608;
        Mon, 21 May 2018 07:04:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526911455; cv=none;
        d=google.com; s=arc-20160816;
        b=IesnmzDCQUk3nMQaWkXymxHzOnDGpOmsOBJEB4tzQx+h0ygneyRuqTtzqd97DuuNXF
         88A2lWy5ycOX8vpq7m5eR6xr8dGmYyGWTnRxr2hIM4NF6OL51z7ZJoJVqJUxlulorkf+
         M4/LsfChzL3wJ5rsG7nsDrHBkbSdPCeRylLY8fSlnFI2zN+i/2BObP4MQNanD7tYqCmS
         MuGue60YpsMYkjkD8+8y35znjtyyQUJt1ThEjHKGH12SAuIJQ7he5uP5tH8aLbjftwzR
         DyiZC8QnNrW+B6qFj0YClBl9UkNc16i6QheouDZ93ApBfeKpAHquRbFftqBsv+3Z6lR0
         cXjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=uTCu0VXJUG3wNJnxgHDeMIsCrGvMpL6L1MBJnZRyvFs=;
        b=EOVKnMp02HGtIlIOvy+W7rU7rECDgwQFqaCSXuLK1LXj0pi5ELVsgLqdCb8EJM8Ihd
         MsBq1GNULDOh1FtHRurysyYAYll2SYgmOZG0z8N6UfDm8nSYbH5dsNChA2volmvdpmp6
         b6QMZiUDHgDGAhJQVGubftcU94d9t10v8TT7LiBDCxJUGNn/bbIe1EatkHBDlbmMZdfq
         5RfCjoInve8h/srU4wTMrwBrBVNaCew86UyV8TA+0jhI2PqHZG+OS5npLixxiv+v5+MG
         dvUsELvuMIkv/v+2fG3BzW6WmJkFxTohseSl+f5QzTJP4z7JvubK3PwQ3TXCz9wWWveO
         DVdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id w2-v6si6803152wrp.144.2018.05.21.07.04.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 May 2018 07:04:15 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKlQ6-0007kF-RQ; Mon, 21 May 2018 15:04:14 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 16/27] iommu: Add IOMMU index argument to translate method
Date: Mon, 21 May 2018 15:03:51 +0100
Message-Id: <20180521140402.23318-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
X-TUID: xFW+H95cS+qT

Add an IOMMU index argument to the translate method of
IOMMUs. Since all of our current IOMMU implementations
support only a single IOMMU index, this has no effect
on the behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/memory.h    |  3 ++-
 exec.c                   | 11 +++++++++--
 hw/alpha/typhoon.c       |  3 ++-
 hw/arm/smmuv3.c          |  2 +-
 hw/dma/rc4030.c          |  2 +-
 hw/i386/amd_iommu.c      |  2 +-
 hw/i386/intel_iommu.c    |  2 +-
 hw/ppc/spapr_iommu.c     |  3 ++-
 hw/s390x/s390-pci-bus.c  |  2 +-
 hw/sparc/sun4m_iommu.c   |  3 ++-
 hw/sparc64/sun4u_iommu.c |  2 +-
 memory.c                 |  2 +-
 12 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 4e6b125add..b25cf527bb 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -252,9 +252,10 @@ typedef struct IOMMUMemoryRegionClass {
      * @iommu: the IOMMUMemoryRegion
      * @hwaddr: address to be translated within the memory region
      * @flag: requested access permissions
+     * @iommu_idx: IOMMU index for the translation
      */
     IOMMUTLBEntry (*translate)(IOMMUMemoryRegion *iommu, hwaddr addr,
-                               IOMMUAccessFlags flag);
+                               IOMMUAccessFlags flag, int iommu_idx);
     /* Returns minimum supported page size in bytes.
      * If this method is not provided then the minimum is assumed to
      * be TARGET_PAGE_SIZE.
diff --git a/exec.c b/exec.c
index c3baadc349..c9285c9c39 100644
--- a/exec.c
+++ b/exec.c
@@ -498,8 +498,15 @@ static MemoryRegionSection address_space_translate_iommu(IOMMUMemoryRegion *iomm
     do {
         hwaddr addr = *xlat;
         IOMMUMemoryRegionClass *imrc = memory_region_get_iommu_class_nocheck(iommu_mr);
-        IOMMUTLBEntry iotlb = imrc->translate(iommu_mr, addr, is_write ?
-                                              IOMMU_WO : IOMMU_RO);
+        int iommu_idx = 0;
+        IOMMUTLBEntry iotlb;
+
+        if (imrc->attrs_to_index) {
+            iommu_idx = imrc->attrs_to_index(iommu_mr, attrs);
+        }
+
+        iotlb = imrc->translate(iommu_mr, addr, is_write ?
+                                IOMMU_WO : IOMMU_RO, iommu_idx);
 
         if (!(iotlb.perm & (1 << is_write))) {
             goto unassigned;
diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index 6a40869488..d3ed7cdbe8 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -666,7 +666,8 @@ static bool window_translate(TyphoonWindow *win, hwaddr addr,
    Pchip and generate a machine check interrupt.  */
 static IOMMUTLBEntry typhoon_translate_iommu(IOMMUMemoryRegion *iommu,
                                              hwaddr addr,
-                                             IOMMUAccessFlags flag)
+                                             IOMMUAccessFlags flag,
+                                             int iommu_idx)
 {
     TyphoonPchip *pchip = container_of(iommu, TyphoonPchip, iommu);
     IOMMUTLBEntry ret;
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 42dc521c13..978330900d 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -538,7 +538,7 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
 }
 
 static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
-                                      IOMMUAccessFlags flag)
+                                      IOMMUAccessFlags flag, int iommu_idx)
 {
     SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
     SMMUv3State *s = sdev->smmu;
diff --git a/hw/dma/rc4030.c b/hw/dma/rc4030.c
index 5d4833eeca..ccd8612888 100644
--- a/hw/dma/rc4030.c
+++ b/hw/dma/rc4030.c
@@ -491,7 +491,7 @@ static const MemoryRegionOps jazzio_ops = {
 };
 
 static IOMMUTLBEntry rc4030_dma_translate(IOMMUMemoryRegion *iommu, hwaddr addr,
-                                          IOMMUAccessFlags flag)
+                                          IOMMUAccessFlags flag, int iommu_idx)
 {
     rc4030State *s = container_of(iommu, rc4030State, dma_mr);
     IOMMUTLBEntry ret = {
diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 63d46ff6ee..1fd669fef8 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -991,7 +991,7 @@ static inline bool amdvi_is_interrupt_addr(hwaddr addr)
 }
 
 static IOMMUTLBEntry amdvi_translate(IOMMUMemoryRegion *iommu, hwaddr addr,
-                                     IOMMUAccessFlags flag)
+                                     IOMMUAccessFlags flag, int iommu_idx)
 {
     AMDVIAddressSpace *as = container_of(iommu, AMDVIAddressSpace, iommu);
     AMDVIState *s = as->iommu_state;
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index b8c9354b0b..a4b9a254bd 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -2282,7 +2282,7 @@ static void vtd_mem_write(void *opaque, hwaddr addr,
 }
 
 static IOMMUTLBEntry vtd_iommu_translate(IOMMUMemoryRegion *iommu, hwaddr addr,
-                                         IOMMUAccessFlags flag)
+                                         IOMMUAccessFlags flag, int iommu_idx)
 {
     VTDAddressSpace *vtd_as = container_of(iommu, VTDAddressSpace, iommu);
     IntelIOMMUState *s = vtd_as->iommu_state;
diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
index 301708e45e..1b0880ac9e 100644
--- a/hw/ppc/spapr_iommu.c
+++ b/hw/ppc/spapr_iommu.c
@@ -112,7 +112,8 @@ static void spapr_tce_free_table(uint64_t *table, int fd, uint32_t nb_table)
 /* Called from RCU critical section */
 static IOMMUTLBEntry spapr_tce_translate_iommu(IOMMUMemoryRegion *iommu,
                                                hwaddr addr,
-                                               IOMMUAccessFlags flag)
+                                               IOMMUAccessFlags flag,
+                                               int iommu_idx)
 {
     sPAPRTCETable *tcet = container_of(iommu, sPAPRTCETable, iommu);
     uint64_t tce;
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 10da87458e..e3e0ebb7f6 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -484,7 +484,7 @@ uint16_t s390_guest_io_table_walk(uint64_t g_iota, hwaddr addr,
 }
 
 static IOMMUTLBEntry s390_translate_iommu(IOMMUMemoryRegion *mr, hwaddr addr,
-                                          IOMMUAccessFlags flag)
+                                          IOMMUAccessFlags flag, int iommu_idx)
 {
     S390PCIIOMMU *iommu = container_of(mr, S390PCIIOMMU, iommu_mr);
     S390IOTLBEntry *entry;
diff --git a/hw/sparc/sun4m_iommu.c b/hw/sparc/sun4m_iommu.c
index b677601fc6..7ca1e3fce4 100644
--- a/hw/sparc/sun4m_iommu.c
+++ b/hw/sparc/sun4m_iommu.c
@@ -282,7 +282,8 @@ static void iommu_bad_addr(IOMMUState *s, hwaddr addr,
 /* Called from RCU critical section */
 static IOMMUTLBEntry sun4m_translate_iommu(IOMMUMemoryRegion *iommu,
                                            hwaddr addr,
-                                           IOMMUAccessFlags flags)
+                                           IOMMUAccessFlags flags,
+                                           int iommu_idx)
 {
     IOMMUState *is = container_of(iommu, IOMMUState, iommu);
     hwaddr page, pa;
diff --git a/hw/sparc64/sun4u_iommu.c b/hw/sparc64/sun4u_iommu.c
index eb3aaa87e6..1ef7645ba5 100644
--- a/hw/sparc64/sun4u_iommu.c
+++ b/hw/sparc64/sun4u_iommu.c
@@ -73,7 +73,7 @@
 /* Called from RCU critical section */
 static IOMMUTLBEntry sun4u_translate_iommu(IOMMUMemoryRegion *iommu,
                                            hwaddr addr,
-                                           IOMMUAccessFlags flag)
+                                           IOMMUAccessFlags flag, int iommu_idx)
 {
     IOMMUState *is = container_of(iommu, IOMMUState, iommu);
     hwaddr baseaddr, offset;
diff --git a/memory.c b/memory.c
index accb28d694..ff6cbf5831 100644
--- a/memory.c
+++ b/memory.c
@@ -1835,7 +1835,7 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
     granularity = memory_region_iommu_get_min_page_size(iommu_mr);
 
     for (addr = 0; addr < memory_region_size(mr); addr += granularity) {
-        iotlb = imrc->translate(iommu_mr, addr, IOMMU_NONE);
+        iotlb = imrc->translate(iommu_mr, addr, IOMMU_NONE, n->iommu_idx);
         if (iotlb.perm != IOMMU_NONE) {
             n->notify(n, &iotlb);
         }
-- 
2.17.0
