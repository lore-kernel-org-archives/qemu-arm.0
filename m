Received: by 10.25.44.15 with SMTP id s15csp2622278lfs;
        Sun, 9 Jul 2017 13:52:16 -0700 (PDT)
X-Received: by 10.200.4.7 with SMTP id v7mr662319qtg.166.1499633536303;
        Sun, 09 Jul 2017 13:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499633536; cv=none;
        d=google.com; s=arc-20160816;
        b=w75JtaNhSkk76fRpAqxbknxQ+TtP+FmIcjjAJtc5939E4hY/AtUMaf3rRxd0DZennw
         15OOez2lKwoxQy0CRCPHs1ygHMoINn9j9ucFl7ExT50OuciyQ5YXr854998hgoreWEyD
         beM+gDS2uQCscYYEEsp4WwkNPtvc/WvYhjPg4GP0WW6v1jooaOqpHkjvtD3fz5gutU+8
         TCS8yFcmviRq0Tk2Q0HddflSWCbfGqZbNP4PoBZ/od3O0bQz9tBGZecDfEDSDjt9xPhb
         fzNm7qRwvqBoyGtgySCiVv/KLq9qaDsnXMxZJlVueUdmlqrMtMB/3ShMj3hxgPx3ubSX
         nNWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=vqmHaZewg9bGoX1//p77XHeIaiJUfRoaCYR3w0rR01c=;
        b=F9fBT5kJFHhJZJGOVmogq6AIfAA/oZUSqFgJXfLT0YHkjFVcr5Xc79JWcKg5ZD/z1l
         DVgqoP8qjx6HC3d/h2dmGeWaXgNIHSNfg+9huesKBghAd6hgGjpmjqEw3qW62nXSP2vU
         JaCv2wSma3s+563IePTdoasZswoULutRBa3LCDSHS2D3OSUAtdA8GcY/WQIdVXH7e2Cf
         tnp2/+9LwF7qYEZKs0nN+SmVScPkosi2EPth9UHKWY6whWE0/xT+qccFCM7ykYGrn7SB
         QiMvieQx//Dd5HB0R4R9f8tF6pvjhmVNjSdmxougfl2XBAd56Gc5s9F4+NGEBOTvS9i9
         LT9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 21si9166699qke.235.2017.07.09.13.52.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 09 Jul 2017 13:52:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37421 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUJBd-0001eH-5C
	for alex.bennee@linaro.org; Sun, 09 Jul 2017 16:52:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dUJBU-0001bb-1O
	for qemu-arm@nongnu.org; Sun, 09 Jul 2017 16:52:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dUJBR-0005kl-B5
	for qemu-arm@nongnu.org; Sun, 09 Jul 2017 16:52:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35050)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dUJBR-0005ka-1N; Sun, 09 Jul 2017 16:52:01 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C53008553C;
	Sun,  9 Jul 2017 20:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C53008553C
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C53008553C
Received: from localhost.localdomain.com (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C0FBC17DC6;
	Sun,  9 Jul 2017 20:51:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	prem.mallappa@gmail.com
Date: Sun,  9 Jul 2017 22:51:26 +0200
Message-Id: <1499633493-19865-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
References: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Sun, 09 Jul 2017 20:52:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 1/8] hw/arm/smmu-common: smmu base class
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
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	will.deacon@arm.com, robin.murphy@arm.com, peterx@redhat.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: becoltwzs2T6

Introduces the base device and class for the ARM smmu.
Implements VMSAv8-64 table lookup and translation. VMSAv8-32
is not implemented.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>

---
v4 -> v5:
- add initial level in translation config
- implement block pte
- rename must_translate into nofail
- introduce call_entry_hook
- small changes to dynamic traces
- smmu_page_walk code moved from smmuv3.c to this file
- remove smmu_translate*

v3 -> v4:
- reworked page table walk to prepare for VFIO integration
  (capability to scan a range of IOVA). Same function is used
  for translate for a single iova. This is largely inspired
  from intel_iommu.c
- as the translate function was not straightforward to me,
  I tried to stick more closely to the VMSA spec.
- remove support of nested stage (kernel driver does not
  support it anyway)
- introduce smmu-internal.h to put page table definitions
- added smmu_find_as_from_bus_num
- SMMU_PCI_BUS_MAX and SMMU_PCI_DEVFN_MAX in smmu-common header
- new fields in SMMUState:
  - iommu_ops, smmu_as_by_busptr, smmu_as_by_bus_num
- use error_report and trace events
- add aa64[] field in SMMUTransCfg

v3:
- moved the base code in a separate patch to ease the review.
- clearer separation between base class and smmuv3 class
- translate_* only implemented as class methods
---
 default-configs/aarch64-softmmu.mak |   1 +
 hw/arm/Makefile.objs                |   1 +
 hw/arm/smmu-common.c                | 474 ++++++++++++++++++++++++++++++++++++
 hw/arm/smmu-internal.h              |  97 ++++++++
 hw/arm/trace-events                 |  14 ++
 include/hw/arm/smmu-common.h        | 127 ++++++++++
 6 files changed, 714 insertions(+)
 create mode 100644 hw/arm/smmu-common.c
 create mode 100644 hw/arm/smmu-internal.h
 create mode 100644 include/hw/arm/smmu-common.h

diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch64-softmmu.mak
index 2449483..83a2932 100644
--- a/default-configs/aarch64-softmmu.mak
+++ b/default-configs/aarch64-softmmu.mak
@@ -7,3 +7,4 @@ CONFIG_AUX=y
 CONFIG_DDC=y
 CONFIG_DPCD=y
 CONFIG_XLNX_ZYNQMP=y
+CONFIG_ARM_SMMUV3=y
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 4c5c4ee..6c7d4af 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -18,3 +18,4 @@ obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
+obj-$(CONFIG_ARM_SMMUV3) += smmu-common.o
diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
new file mode 100644
index 0000000..9f56232
--- /dev/null
+++ b/hw/arm/smmu-common.c
@@ -0,0 +1,474 @@
+/*
+ * Copyright (C) 2014-2016 Broadcom Corporation
+ * Copyright (c) 2017 Red Hat, Inc.
+ * Written by Prem Mallappa, Eric Auger
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+ *
+ * Author: Prem Mallappa <pmallapp@broadcom.com>
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "sysemu/sysemu.h"
+#include "exec/address-spaces.h"
+#include "trace.h"
+#include "qemu/error-report.h"
+#include "hw/arm/smmu-common.h"
+#include "smmu-internal.h"
+
+inline MemTxResult smmu_read_sysmem(dma_addr_t addr, void *buf, dma_addr_t len,
+                                    bool secure)
+{
+    MemTxAttrs attrs = {.unspecified = 1, .secure = secure};
+
+    switch (len) {
+    case 4:
+        *(uint32_t *)buf = ldl_le_phys(&address_space_memory, addr);
+        break;
+    case 8:
+        *(uint64_t *)buf = ldq_le_phys(&address_space_memory, addr);
+        break;
+    default:
+        return address_space_rw(&address_space_memory, addr,
+                                attrs, buf, len, false);
+    }
+    return MEMTX_OK;
+}
+
+inline void
+smmu_write_sysmem(dma_addr_t addr, void *buf, dma_addr_t len, bool secure)
+{
+    MemTxAttrs attrs = {.unspecified = 1, .secure = secure};
+
+    switch (len) {
+    case 4:
+        stl_le_phys(&address_space_memory, addr, *(uint32_t *)buf);
+        break;
+    case 8:
+        stq_le_phys(&address_space_memory, addr, *(uint64_t *)buf);
+        break;
+    default:
+        address_space_rw(&address_space_memory, addr,
+                         attrs, buf, len, true);
+    }
+}
+
+/*************************/
+/* VMSAv8-64 Translation */
+/*************************/
+
+/**
+ * get_pte - Get the content of a page table entry located in
+ * @base_addr[@index]
+ */
+static uint64_t get_pte(dma_addr_t baseaddr, uint32_t index)
+{
+    uint64_t pte;
+
+    if (smmu_read_sysmem(baseaddr + index * sizeof(pte),
+                         &pte, sizeof(pte), false)) {
+        error_report("can't read pte at address=0x%"PRIx64,
+                     baseaddr + index * sizeof(pte));
+        pte = (uint64_t)-1;
+        return pte;
+    }
+    trace_smmu_get_pte(baseaddr, index, baseaddr + index * sizeof(pte), pte);
+    /* TODO: handle endianness */
+    return pte;
+}
+
+/* VMSAv8-64 Translation Table Format Descriptor Decoding */
+
+#define PTE_ADDRESS(pte, shift) (extract64(pte, shift, 47 - shift) << shift)
+
+/**
+ * get_page_pte_address - returns the L3 descriptor output address,
+ * ie. the page frame
+ * ARM ARM spec: Figure D4-17 VMSAv8-64 level 3 descriptor format
+ */
+static inline hwaddr get_page_pte_address(uint64_t pte, int granule_sz)
+{
+    return PTE_ADDRESS(pte, granule_sz);
+}
+
+/**
+ * get_table_pte_address - return table descriptor output address,
+ * ie. address of next level table
+ * ARM ARM Figure D4-16 VMSAv8-64 level0, level1, and level 2 descriptor formats
+ */
+static inline hwaddr get_table_pte_address(uint64_t pte, int granule_sz)
+{
+    return PTE_ADDRESS(pte, granule_sz);
+}
+
+/**
+ * get_block_pte_address - return block descriptor output address and block size
+ * ARM ARM Figure D4-16 VMSAv8-64 level0, level1, and level 2 descriptor formats
+ */
+static hwaddr get_block_pte_address(uint64_t pte, int level, int granule_sz,
+                                    uint64_t *bsz)
+{
+    int n;
+
+    switch (granule_sz) {
+    case 12:
+        if (level == 1) {
+            n = 30;
+        } else if (level == 2) {
+            n = 21;
+        } else {
+            goto error_out;
+        }
+        break;
+    case 14:
+        if (level == 2) {
+            n = 25;
+        } else {
+            goto error_out;
+        }
+        break;
+    case 16:
+        if (level == 2) {
+            n = 29;
+        } else {
+            goto error_out;
+        }
+        break;
+    default:
+            goto error_out;
+    }
+    *bsz = 1 << n;
+    return PTE_ADDRESS(pte, n);
+
+error_out:
+
+    error_report("unexpected granule_sz=%d/level=%d for block pte",
+                 granule_sz, level);
+    *bsz = 0;
+    return (hwaddr)-1;
+}
+
+static int call_entry_hook(uint64_t iova, uint64_t mask, uint64_t gpa,
+                           int perm, smmu_page_walk_hook hook_fn, void *private)
+{
+    IOMMUTLBEntry entry;
+    int ret;
+
+    entry.target_as = &address_space_memory;
+    entry.iova = iova & mask;
+    entry.translated_addr = gpa;
+    entry.addr_mask = ~mask;
+    entry.perm = perm;
+
+    ret = hook_fn(&entry, private);
+    if (ret) {
+        error_report("%s hook returned %d", __func__, ret);
+    }
+    return ret;
+}
+
+/**
+ * smmu_page_walk_level_64 - Walk an IOVA range from a specific level
+ * @baseaddr: table base address corresponding to @level
+ * @level: level
+ * @cfg: translation config
+ * @start: end of the IOVA range
+ * @end: end of the IOVA range
+ * @hook_fn: the hook that to be called for each detected area
+ * @private: private data for the hook function
+ * @read: whether parent level has read permission
+ * @write: whether parent level has write permission
+ * @nofail: indicates whether each iova of the range
+ *  must be translated or whether failure is allowed
+ * @notify_unmap: whether we should notify invalid entries
+ *
+ * Return 0 on success, < 0 on errors not related to translation
+ * process, > 1 on errors related to translation process (only
+ * if nofail is set)
+ */
+static int
+smmu_page_walk_level_64(dma_addr_t baseaddr, int level,
+                        SMMUTransCfg *cfg, uint64_t start, uint64_t end,
+                        smmu_page_walk_hook hook_fn, void *private,
+                        bool read, bool write, bool nofail,
+                        bool notify_unmap)
+{
+    uint64_t subpage_size, subpage_mask, pte, iova = start;
+    bool read_cur, write_cur, entry_valid;
+    int ret, granule_sz, stage;
+    IOMMUTLBEntry entry;
+
+    granule_sz = cfg->granule_sz;
+    stage = cfg->stage;
+    subpage_size = 1ULL << level_shift(level, granule_sz);
+    subpage_mask = level_page_mask(level, granule_sz);
+
+    trace_smmu_page_walk_level_in(level, baseaddr, granule_sz,
+                                  start, end, subpage_size);
+
+    while (iova < end) {
+        dma_addr_t next_table_baseaddr;
+        uint64_t iova_next, pte_addr;
+        uint32_t offset;
+
+        iova_next = (iova & subpage_mask) + subpage_size;
+        offset = iova_level_offset(iova, level, granule_sz);
+        pte_addr = baseaddr + offset * sizeof(pte);
+        pte = get_pte(baseaddr, offset);
+
+        trace_smmu_page_walk_level(level, iova, subpage_size,
+                                   baseaddr, offset, pte);
+
+        if (pte == (uint64_t)-1) {
+            if (nofail) {
+                return SMMU_TRANS_ERR_WALK_EXT_ABRT;
+            }
+            goto next;
+        }
+        if (is_invalid_pte(pte) || is_reserved_pte(pte, level)) {
+            trace_smmu_page_walk_level_res_invalid_pte(stage, level, baseaddr,
+                                                       pte_addr, offset, pte);
+            if (nofail) {
+                return SMMU_TRANS_ERR_WALK_EXT_ABRT;
+            }
+            goto next;
+        }
+
+        read_cur = read; /* TODO */
+        write_cur = write; /* TODO */
+        entry_valid = read_cur | write_cur; /* TODO */
+
+        if (is_page_pte(pte, level)) {
+            uint64_t gpa = get_page_pte_address(pte, granule_sz);
+            int perm = IOMMU_ACCESS_FLAG(read_cur, write_cur);
+
+            trace_smmu_page_walk_level_page_pte(stage, level, entry.iova,
+                                                baseaddr, pte_addr, pte, gpa);
+            if (!entry_valid && !notify_unmap) {
+                printf("%s entry_valid=%d notify_unmap=%d\n", __func__,
+                       entry_valid, notify_unmap);
+                goto next;
+            }
+            ret = call_entry_hook(iova, subpage_mask, gpa, perm,
+                                  hook_fn, private);
+            if (ret) {
+                return ret;
+            }
+            goto next;
+        }
+        if (is_block_pte(pte, level)) {
+            uint64_t block_size;
+            hwaddr gpa = get_block_pte_address(pte, level, granule_sz,
+                                               &block_size);
+            int perm = IOMMU_ACCESS_FLAG(read_cur, write_cur);
+
+            if (gpa == -1) {
+                if (nofail) {
+                    return SMMU_TRANS_ERR_WALK_EXT_ABRT;
+                } else {
+                    goto next;
+                }
+            }
+            trace_smmu_page_walk_level_block_pte(stage, level, baseaddr,
+                                                 pte_addr, pte, iova, gpa,
+                                                 (int)(block_size >> 20));
+
+            ret = call_entry_hook(iova, subpage_mask, gpa, perm,
+                                  hook_fn, private);
+            if (ret) {
+                return ret;
+            }
+            goto next;
+        }
+        if (level  == 3) {
+            goto next;
+        }
+        /* table pte */
+        next_table_baseaddr = get_table_pte_address(pte, granule_sz);
+        trace_smmu_page_walk_level_table_pte(stage, level, baseaddr, pte_addr,
+                                             pte, next_table_baseaddr);
+        ret = smmu_page_walk_level_64(next_table_baseaddr, level + 1, cfg,
+                                      iova, MIN(iova_next, end),
+                                      hook_fn, private, read_cur, write_cur,
+                                      nofail, notify_unmap);
+        if (!ret) {
+            return ret;
+        }
+
+next:
+        iova = iova_next;
+    }
+
+    return SMMU_TRANS_ERR_NONE;
+}
+
+/**
+ * smmu_page_walk_64 - walk a specific IOVA range from the initial
+ * lookup level, and call the hook for each valid entry
+ *
+ * @cfg: translation config
+ * @start: start of the IOVA range
+ * @end: end of the IOVA range
+ * @nofail: indicates whether each iova of the range
+ *  must be translated or whether failure is allowed
+ * @hook_fn: the hook that to be called for each detected area
+ * @private: private data for the hook function
+ */
+static int
+smmu_page_walk_64(SMMUTransCfg *cfg, uint64_t start, uint64_t end,
+                  bool nofail, smmu_page_walk_hook hook_fn,
+                  void *private)
+{
+    dma_addr_t ttbr;
+    int stage = cfg->stage;
+    uint64_t roof = MIN(end, (1ULL << (64 - cfg->tsz)) - 1);
+
+    if (!hook_fn) {
+        return 0;
+    }
+
+    ttbr = extract64(cfg->ttbr, 0, 48);
+
+    trace_smmu_page_walk_64(stage, cfg->ttbr, cfg->initial_level, start, roof);
+
+    return smmu_page_walk_level_64(ttbr, cfg->initial_level, cfg, start, roof,
+                                   hook_fn, private,
+                                   true /* read */, true /* write */,
+                                   nofail, false /* notify_unmap */);
+}
+
+static int set_translated_address(IOMMUTLBEntry *entry, void *private)
+{
+    SMMUTransCfg *cfg = (SMMUTransCfg *)private;
+    size_t offset = cfg->input - entry->iova;
+
+    cfg->output = entry->translated_addr + offset;
+
+    trace_smmu_set_translated_address(cfg->input, cfg->output);
+    return 0;
+}
+
+/**
+ * smmu_page_walk - Walk the page table for a given
+ * config and a given entry
+ *
+ * tlbe->iova must have been populated
+ */
+int smmu_page_walk(SMMUState *sys, SMMUTransCfg *cfg,
+                   IOMMUTLBEntry *tlbe, bool is_write)
+{
+    uint32_t page_size = 0, perm = 0;
+    int ret = 0;
+
+    trace_smmu_walk_pgtable(tlbe->iova, is_write);
+
+    if (cfg->bypassed || cfg->disabled) {
+        return 0;
+    }
+
+    cfg->input = tlbe->iova;
+
+    if (cfg->aa64) {
+        ret = smmu_page_walk_64(cfg, cfg->input, cfg->input + 1,
+                            true /* nofail */,
+                            set_translated_address, cfg);
+        page_size = 1 << cfg->granule_sz;
+    } else {
+        error_report("VMSAv8-32 translation is not yet implemented");
+        abort();
+    }
+
+    if (ret) {
+        error_report("PTW failed for iova=0x%"PRIx64" is_write=%d (%d)",
+                     cfg->input, is_write, ret);
+        goto exit;
+    }
+    tlbe->translated_addr = cfg->output;
+    tlbe->addr_mask = page_size - 1;
+    tlbe->perm = perm;
+
+    trace_smmu_walk_pgtable_out(tlbe->translated_addr,
+                                tlbe->addr_mask, tlbe->perm);
+exit:
+    return ret;
+}
+
+/*************************/
+/* VMSAv8-32 Translation */
+/*************************/
+
+static int
+smmu_page_walk_32(SMMUTransCfg *cfg, uint64_t start, uint64_t end,
+                  bool nofail, smmu_page_walk_hook hook_fn,
+                  void *private)
+{
+    error_report("VMSAv8-32 translation is not yet implemented");
+    abort();
+}
+
+/******************/
+/* Infrastructure */
+/******************/
+
+SMMUPciBus *smmu_find_as_from_bus_num(SMMUState *s, uint8_t bus_num)
+{
+    SMMUPciBus *smmu_pci_bus = s->smmu_as_by_bus_num[bus_num];
+
+    if (!smmu_pci_bus) {
+        GHashTableIter iter;
+
+        g_hash_table_iter_init(&iter, s->smmu_as_by_busptr);
+        while (g_hash_table_iter_next(&iter, NULL, (void **)&smmu_pci_bus)) {
+            if (pci_bus_num(smmu_pci_bus->bus) == bus_num) {
+                s->smmu_as_by_bus_num[bus_num] = smmu_pci_bus;
+                return smmu_pci_bus;
+            }
+        }
+    }
+    return smmu_pci_bus;
+}
+
+static void smmu_base_instance_init(Object *obj)
+{
+     /* Nothing much to do here as of now */
+}
+
+static void smmu_base_class_init(ObjectClass *klass, void *data)
+{
+    SMMUBaseClass *sbc = SMMU_DEVICE_CLASS(klass);
+
+    sbc->page_walk_64 = smmu_page_walk_64;
+
+    sbc->page_walk_32 = smmu_page_walk_32;
+}
+
+static const TypeInfo smmu_base_info = {
+    .name          = TYPE_SMMU_DEV_BASE,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(SMMUState),
+    .instance_init = smmu_base_instance_init,
+    .class_data    = NULL,
+    .class_size    = sizeof(SMMUBaseClass),
+    .class_init    = smmu_base_class_init,
+    .abstract      = true,
+};
+
+static void smmu_base_register_types(void)
+{
+    type_register_static(&smmu_base_info);
+}
+
+type_init(smmu_base_register_types)
+
diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
new file mode 100644
index 0000000..5e890bb
--- /dev/null
+++ b/hw/arm/smmu-internal.h
@@ -0,0 +1,97 @@
+/*
+ * ARM SMMU support - Internal API
+ *
+ * Copyright (c) 2017 Red Hat, Inc.
+ * Written by Eric Auger
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define ARM_LPAE_MAX_ADDR_BITS          48
+#define ARM_LPAE_MAX_LEVELS             4
+
+/* Page table bits */
+
+#ifndef HW_ARM_SMMU_INTERNAL_H
+#define HW_ARM_SMMU_INTERNAL_H
+
+#define ARM_LPAE_PTE_TYPE_SHIFT         0
+#define ARM_LPAE_PTE_TYPE_MASK          0x3
+
+#define ARM_LPAE_PTE_TYPE_BLOCK         1
+#define ARM_LPAE_PTE_TYPE_RESERVED      1
+#define ARM_LPAE_PTE_TYPE_TABLE         3
+#define ARM_LPAE_PTE_TYPE_PAGE          3
+
+#define ARM_LPAE_PTE_VALID              (1 << 0)
+
+static inline bool is_invalid_pte(uint64_t pte)
+{
+    return !(pte & ARM_LPAE_PTE_VALID);
+}
+
+static inline bool is_reserved_pte(uint64_t pte, int level)
+{
+    return ((level == 3) &&
+            ((pte & ARM_LPAE_PTE_TYPE_MASK) == ARM_LPAE_PTE_TYPE_RESERVED));
+}
+
+static inline bool is_block_pte(uint64_t pte, int level)
+{
+    return ((level < 3) &&
+            ((pte & ARM_LPAE_PTE_TYPE_MASK) == ARM_LPAE_PTE_TYPE_BLOCK));
+}
+
+static inline bool is_table_pte(uint64_t pte, int level)
+{
+    return ((level < 3) &&
+            ((pte & ARM_LPAE_PTE_TYPE_MASK) == ARM_LPAE_PTE_TYPE_TABLE));
+}
+
+static inline bool is_page_pte(uint64_t pte, int level)
+{
+    return ((level == 3) &&
+            ((pte & ARM_LPAE_PTE_TYPE_MASK) == ARM_LPAE_PTE_TYPE_PAGE));
+}
+
+static inline int level_shift(int level, int granule_sz)
+{
+    return granule_sz + (3 - level) * (granule_sz - 3);
+}
+
+static inline uint64_t level_page_mask(int level, int granule_sz)
+{
+    return ~((1ULL << level_shift(level, granule_sz)) - 1);
+}
+
+/**
+ * TODO: handle the case where the level resolves less than
+ * granule_sz -3 IA bits.
+ */
+static inline
+uint64_t iova_level_offset(uint64_t iova, int level, int granule_sz)
+{
+    return (iova >> level_shift(level, granule_sz)) &
+            ((1ULL << (granule_sz - 3)) - 1);
+}
+
+/* TODO: check this for stage 2 and table concatenation */
+static inline int initial_lookup_level(int tnsz, int granule_sz)
+{
+    return 4 - (64 - tnsz - 4) / (granule_sz - 3);
+}
+
+
+
+#endif
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index d5f33a2..7a92f8c 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -2,3 +2,17 @@
 
 # hw/arm/virt-acpi-build.c
 virt_acpi_setup(void) "No fw cfg or ACPI disabled. Bailing out."
+
+# hw/arm/smmu-common.c
+
+smmu_page_walk_64(int stage, uint64_t baseaddr, int first_level, uint64_t start, uint64_t end) "stage=%d, baseaddr=0x%"PRIx64", first level=%d, start=0x%"PRIx64", end=0x%"PRIx64
+smmu_page_walk_level_in(int level, uint64_t baseaddr, int granule_sz, uint64_t start, uint64_t end, uint64_t subpage_size) "level=%d baseaddr=0x%"PRIx64" granule=%d, start=0x%"PRIx64" end=0x%"PRIx64", subpage_size=0x%lx"
+smmu_page_walk_level(int level, uint64_t iova, size_t subpage_size, uint64_t baseaddr, uint32_t offset, uint64_t pte) "level=%d iova=0x%lx subpage_sz=0x%lx baseaddr=0x%"PRIx64" offset=%d => pte=0x%lx"
+smmu_page_walk_level_res_invalid_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, uint32_t offset, uint64_t pte) "stage=%d level=%d base@=0x%"PRIx64" pte@=0x%"PRIx64" offset=%d pte=0x%lx"
+smmu_page_walk_level_page_pte(int stage, int level,  uint64_t iova, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t address) "stage=%d level=%d iova=0x%"PRIx64" base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" page address = 0x%"PRIx64
+smmu_page_walk_level_block_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t iova, uint64_t gpa, int bsize_mb) "stage=%d level=%d base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" iova=0x%"PRIx64" block address = 0x%"PRIx64" block size = %d MiB"
+smmu_page_walk_level_table_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t address) "stage=%d, level=%d base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" next table address = 0x%"PRIx64
+smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "baseaddr=0x%"PRIx64" index=0x%x, pteaddr=0x%"PRIx64", pte=0x%"PRIx64
+smmu_set_translated_address(hwaddr iova, hwaddr pa) "iova = 0x%"PRIx64" -> pa = 0x%"PRIx64
+smmu_walk_pgtable(hwaddr iova, bool is_write) "Input addr: 0x%"PRIx64", is_write=%d"
+smmu_walk_pgtable_out(hwaddr addr, uint32_t mask, int perm) "DONE: o/p addr:0x%"PRIx64" mask:0x%x perm:%d"
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
new file mode 100644
index 0000000..8d681e8
--- /dev/null
+++ b/include/hw/arm/smmu-common.h
@@ -0,0 +1,127 @@
+/*
+ * ARM SMMU Support
+ *
+ * Copyright (C) 2015-2016 Broadcom Corporation
+ * Copyright (c) 2017 Red Hat, Inc.
+ * Written by Prem Mallappa, Eric Auger
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_ARM_SMMU_COMMON_H
+#define HW_ARM_SMMU_COMMON_H
+
+#include <hw/sysbus.h>
+#include "hw/pci/pci.h"
+
+#define SMMU_PCI_BUS_MAX      256
+#define SMMU_PCI_DEVFN_MAX    256
+
+typedef enum {
+    SMMU_TRANS_ERR_NONE          = 0x0,
+    SMMU_TRANS_ERR_WALK_EXT_ABRT = 0x1,  /* Translation walk external abort */
+    SMMU_TRANS_ERR_TRANS         = 0x10, /* Translation fault */
+    SMMU_TRANS_ERR_ADDR_SZ,              /* Address Size fault */
+    SMMU_TRANS_ERR_ACCESS,               /* Access fault */
+    SMMU_TRANS_ERR_PERM,                 /* Permission fault */
+    SMMU_TRANS_ERR_TLB_CONFLICT  = 0x20, /* TLB Conflict */
+} SMMUTransErr;
+
+/*
+ * Generic structure populated by derived SMMU devices
+ * after decoding the configuration information and used as
+ * input to the page table walk
+ */
+typedef struct SMMUTransCfg {
+    hwaddr   input;            /* input address */
+    hwaddr   output;           /* Output address */
+    int      stage;            /* translation stage */
+    uint32_t oas;              /* output address width */
+    uint32_t tsz;              /* input range, ie. 2^(64 -tnsz)*/
+    uint64_t ttbr;             /* TTBR address */
+    uint32_t granule_sz;       /* granule page shift */
+    bool     aa64;             /* arch64 or aarch32 translation table */
+    int      initial_level;    /* initial lookup level */
+    bool     disabled;         /* smmu is disabled */
+    bool     bypassed;         /* stage is bypassed */
+} SMMUTransCfg;
+
+typedef struct SMMUDevice {
+    void         *smmu;
+    PCIBus       *bus;
+    int           devfn;
+    MemoryRegion  iommu;
+    AddressSpace  as;
+} SMMUDevice;
+
+typedef struct SMMUNotifierNode {
+    SMMUDevice *sdev;
+    QLIST_ENTRY(SMMUNotifierNode) next;
+} SMMUNotifierNode;
+
+typedef struct SMMUPciBus {
+    PCIBus       *bus;
+    SMMUDevice   *pbdev[0]; /* Parent array is sparse, so dynamically alloc */
+} SMMUPciBus;
+
+typedef struct SMMUState {
+    /* <private> */
+    SysBusDevice  dev;
+
+    MemoryRegion iomem;
+
+    MemoryRegionIOMMUOps iommu_ops;
+    GHashTable *smmu_as_by_busptr;
+    SMMUPciBus *smmu_as_by_bus_num[SMMU_PCI_BUS_MAX];
+    QLIST_HEAD(, SMMUNotifierNode) notifiers_list;
+
+} SMMUState;
+
+typedef int (*smmu_page_walk_hook)(IOMMUTLBEntry *entry, void *private);
+
+typedef struct {
+    /* <private> */
+    SysBusDeviceClass parent_class;
+
+    /* public */
+    int (*page_walk_32)(SMMUTransCfg *cfg, uint64_t start, uint64_t end,
+                        bool nofail, smmu_page_walk_hook hook_fn,
+                        void *private);
+    int (*page_walk_64)(SMMUTransCfg *cfg, uint64_t start, uint64_t end,
+                        bool nofail, smmu_page_walk_hook hook_fn,
+                        void *private);
+} SMMUBaseClass;
+
+#define TYPE_SMMU_DEV_BASE "smmu-base"
+#define SMMU_SYS_DEV(obj) OBJECT_CHECK(SMMUState, (obj), TYPE_SMMU_DEV_BASE)
+#define SMMU_DEVICE_GET_CLASS(obj)                              \
+    OBJECT_GET_CLASS(SMMUBaseClass, (obj), TYPE_SMMU_DEV_BASE)
+#define SMMU_DEVICE_CLASS(klass)                                    \
+    OBJECT_CLASS_CHECK(SMMUBaseClass, (klass), TYPE_SMMU_DEV_BASE)
+
+MemTxResult smmu_read_sysmem(dma_addr_t addr, void *buf,
+                             dma_addr_t len, bool secure);
+void smmu_write_sysmem(dma_addr_t addr, void *buf, dma_addr_t len, bool secure);
+
+SMMUPciBus *smmu_find_as_from_bus_num(SMMUState *s, uint8_t bus_num);
+
+static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
+{
+    return  ((pci_bus_num(sdev->bus) & 0xff) << 8) | sdev->devfn;
+}
+
+int smmu_page_walk(SMMUState *s, SMMUTransCfg *cfg,
+                   IOMMUTLBEntry *tlbe, bool is_write);
+
+#endif  /* HW_ARM_SMMU_COMMON */
-- 
2.5.5

