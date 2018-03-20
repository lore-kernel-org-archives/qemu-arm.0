Received: by 10.28.91.67 with SMTP id p64csp3777622wmb;
        Tue, 20 Mar 2018 05:39:18 -0700 (PDT)
X-Google-Smtp-Source: AG47ELs8R8/sVfkcDMubXxZbX5Ir95jywb+aaar8daXZ65OnBlxMgONUI5LNxSEcj3xINFXVP7+L
X-Received: by 10.13.219.79 with SMTP id d76mr8779701ywe.182.1521549558431;
        Tue, 20 Mar 2018 05:39:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521549558; cv=none;
        d=google.com; s=arc-20160816;
        b=N+7XwnH1evID/lq2nJb4Z+UzehKA2H3gPfr/lchzpNt06/wKFZ4IZUgA3zNdUB4WME
         nF3B8RysxS7nlb9BWhBqpEGYk1uKA4sBLLnLWgNMo+NxX91v3h8IBJ5nBtdCB73di6EF
         QF0IyrkZfLV/5HmyhKVk/ivsWd0Zl0TuMwA4OyAVt0Y3l8FtJf5cqLKZ+5Bl4CuFJ9WS
         8gyavyLQx+4lqe2Tfxx65vVY8I3G1jqOMIa3LcXkTsB+OUOuQtjRHX0wKYKQMq5dbU0W
         9dwCN53/GCZpNS+Kir59P+y/kmGYrL9cQRHk1vYu9drhz/wcoPkXpxHDQgjdVb/7bj5+
         E60g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=acsXJDrJ4F4X9R8D4bbyH2KJpEWIxHhPuSNZ6scEkJ8=;
        b=LjFey1hYPsB6ObccXdDtkhH0/KeDJ6Tv1PGabINsz2erKLRwhEOWaNDzh4LcawTem2
         Yt4d4YbRM15oN7JxpKfHDqEMfu3FcFraUQ33C7YpeJHJgvhB/L0H8ngTGdbTlJApkvKN
         /qT5wYoSgXLR5p+c/3NQaXmDgZt1XjVL6g8GSHIQwwCSTlyNxDh3j4M3E1KmvGS/treu
         4A3yfbsSuOo/DhYiZ73S949vCbhotRQxlo5bSwmDG9gsr+zQYFAWPbVXg+xQY7usLJby
         k+5MRynNNRMUcFot/SsGej9i1cAKFKnqVXhyTT3+nsqHCMG3PwZfQ1nMZ1reDr6Or5qR
         Nd1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x10si420593qkl.96.2018.03.20.05.39.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 05:39:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48207 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyGXt-0007sc-PZ
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 08:39:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyGWw-0007Oq-Sw
	for qemu-devel@nongnu.org; Tue, 20 Mar 2018 08:38:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyGWt-0003Jf-D5
	for qemu-devel@nongnu.org; Tue, 20 Mar 2018 08:38:18 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44098 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eyGWo-0003DB-6d; Tue, 20 Mar 2018 08:38:10 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B4468163C52;
	Tue, 20 Mar 2018 12:38:09 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BB75394583;
	Tue, 20 Mar 2018 12:37:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Tue, 20 Mar 2018 13:37:25 +0100
Message-Id: <1521549456-14072-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1521549456-14072-1-git-send-email-eric.auger@redhat.com>
References: <1521549456-14072-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Tue, 20 Mar 2018 12:38:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Tue, 20 Mar 2018 12:38:09 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v10 03/14] hw/arm/smmu-common: VMSAv8-64 page
 table walk
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: cdall@kernel.org, mst@redhat.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, peterx@redhat.com, alex.williamson@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, jintack@cs.columbia.edu
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JHRypLCpFFGo

This patch implements the page table walk for VMSAv8-64.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>

---
v9 -> v10:
- Add 64b single-copy atomicity comment related to PTE fetch
- remove checks in get_block_pte_address and use formulae to compute
  block address offset
- remove check_perm
- fix select_tt
- in trace-events use PRIx64 instead of 0x%lx
- commented the fact we cannot discriminate between user and
  priviledged transactions

v8 -> v9:
- remove guest error log on PTE fetch fault
- rename  trace functions
- fix smmu_page_walk_level_res_invalid_pte last arg
- fix PTE_ADDRESS
- turn functions into macros
- make sure to return the actual pte access permission
  into tlbe->perm
- change proto of smmu_ptw*

v7 -> v8:
- rework get_pte
- use LOG_LEVEL_ERROR
- remove error checking in get_block_pte_address
- page table walk simplified (no VFIO replay anymore)
- handle PTW error events
- use dma_memory_read

v6 -> v7:
- fix wrong error handling in walk_page_table
- check perm in smmu_translate

v5 -> v6:
- use IOMMUMemoryRegion
- remove initial_lookup_level()
- fix block replay

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
- use error_report and trace events
- add aa64[] field in SMMUTransCfg
---
 hw/arm/smmu-common.c         | 209 +++++++++++++++++++++++++++++++++++++++++++
 hw/arm/smmu-internal.h       | 102 +++++++++++++++++++++
 hw/arm/trace-events          |   9 +-
 include/hw/arm/smmu-common.h |  14 +++
 4 files changed, 333 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/smmu-internal.h

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index fe0cd70..c7a9027 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -27,6 +27,215 @@
 
 #include "qemu/error-report.h"
 #include "hw/arm/smmu-common.h"
+#include "smmu-internal.h"
+
+/* VMSAv8-64 Translation */
+
+/**
+ * get_pte - Get the content of a page table entry located t
+ * @base_addr[@index]
+ */
+static int get_pte(dma_addr_t baseaddr, uint32_t index, uint64_t *pte,
+                   SMMUPTWEventInfo *info)
+{
+    int ret;
+    dma_addr_t addr = baseaddr + index * sizeof(*pte);
+
+    /* TODO: guarantee 64-bit single-copy atomicity */
+    ret = dma_memory_read(&address_space_memory, addr,
+                          (uint8_t *)pte, sizeof(*pte));
+
+    if (ret != MEMTX_OK) {
+        info->type = SMMU_PTW_ERR_WALK_EABT;
+        info->addr = addr;
+        return -EINVAL;
+    }
+    trace_smmu_get_pte(baseaddr, index, addr, *pte);
+    return 0;
+}
+
+/* VMSAv8-64 Translation Table Format Descriptor Decoding */
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
+static inline hwaddr get_block_pte_address(uint64_t pte, int level,
+                                           int granule_sz, uint64_t *bsz)
+{
+    int n = (granule_sz - 3) * (4 - level) + 3;
+
+    *bsz = 1 << n;
+    return PTE_ADDRESS(pte, n);
+}
+
+SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
+{
+    bool tbi = extract64(iova, 55, 1) ? TBI1(cfg->tbi) : TBI0(cfg->tbi);
+    uint8_t tbi_byte = tbi * 8;
+
+    if (!extract64(iova, 64 - cfg->tt[0].tsz, cfg->tt[0].tsz - tbi_byte)) {
+        return &cfg->tt[0];
+    } else if (!extract64(iova, 64 - cfg->tt[1].tsz,
+                          cfg->tt[1].tsz - tbi_byte)) {
+        return &cfg->tt[1];
+    }
+    return NULL;
+}
+
+/**
+ * smmu_ptw_64 - VMSAv8-64 Walk of the page tables for a given IOVA
+ * @cfg: translation config
+ * @iova: iova to translate
+ * @perm: access type
+ * @tlbe: IOMMUTLBEntry (out)
+ * @info: handle to an error info
+ *
+ * Return 0 on success, < 0 on error. In case of error, @info is filled
+ * and tlbe->perm is set to IOMMU_NONE.
+ * Upon success, @tlbe is filled with translated_addr and entry
+ * permission rights.
+ */
+static int smmu_ptw_64(SMMUTransCfg *cfg,
+                       dma_addr_t iova, IOMMUAccessFlags perm,
+                       IOMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
+{
+    dma_addr_t baseaddr;
+    int stage = cfg->stage;
+    SMMUTransTableInfo *tt = select_tt(cfg, iova);
+    uint8_t level;
+    uint8_t granule_sz;
+
+    if (!tt || tt->disabled) {
+        info->type = SMMU_PTW_ERR_TRANSLATION;
+        goto error;
+    }
+
+    level = tt->initial_level;
+    granule_sz = tt->granule_sz;
+    baseaddr = tt->ttb;
+
+    tlbe->iova = iova;
+    tlbe->addr_mask = (1 << granule_sz) - 1;
+
+    while (level <= 3) {
+        uint64_t subpage_size = 1ULL << level_shift(level, granule_sz);
+        uint64_t mask = subpage_size - 1;
+        uint32_t offset = iova_level_offset(iova, level, granule_sz);
+        uint64_t pte;
+        dma_addr_t pte_addr = baseaddr + offset * sizeof(pte);
+        uint8_t ap;
+
+        if (get_pte(baseaddr, offset, &pte, info)) {
+                goto error;
+        }
+        trace_smmu_ptw_level(level, iova, subpage_size,
+                             baseaddr, offset, pte);
+
+        if (is_invalid_pte(pte) || is_reserved_pte(pte, level)) {
+            trace_smmu_ptw_invalid_pte(stage, level, baseaddr,
+                                       pte_addr, offset, pte);
+            info->type = SMMU_PTW_ERR_TRANSLATION;
+            goto error;
+        }
+
+        if (is_page_pte(pte, level)) {
+            uint64_t gpa = get_page_pte_address(pte, granule_sz);
+
+            ap = PTE_AP(pte);
+            if (is_permission_fault(ap, perm)) {
+                info->type = SMMU_PTW_ERR_PERMISSION;
+                goto error;
+            }
+
+            tlbe->translated_addr = gpa + (iova & mask);
+            tlbe->perm = PTE_AP_TO_PERM(ap);
+            trace_smmu_ptw_page_pte(stage, level, iova,
+                                    baseaddr, pte_addr, pte, gpa);
+            return 0;
+        }
+        if (is_block_pte(pte, level)) {
+            uint64_t block_size;
+            hwaddr gpa = get_block_pte_address(pte, level, granule_sz,
+                                               &block_size);
+
+            ap = PTE_AP(pte);
+            if (is_permission_fault(ap, perm)) {
+                info->type = SMMU_PTW_ERR_PERMISSION;
+                goto error;
+            }
+
+            trace_smmu_ptw_block_pte(stage, level, baseaddr,
+                                     pte_addr, pte, iova, gpa,
+                                     block_size >> 20);
+
+            tlbe->translated_addr = gpa + (iova & mask);
+            tlbe->perm = PTE_AP_TO_PERM(ap);
+            return 0;
+        }
+
+        /* table pte */
+        ap = PTE_APTABLE(pte);
+
+        if (is_permission_fault(ap, perm)) {
+            info->type = SMMU_PTW_ERR_PERMISSION;
+            goto error;
+        }
+        baseaddr = get_table_pte_address(pte, granule_sz);
+        level++;
+    }
+
+    info->type = SMMU_PTW_ERR_TRANSLATION;
+
+error:
+    tlbe->perm = IOMMU_NONE;
+    return -EINVAL;
+}
+
+/**
+ * smmu_ptw - Walk the page tables for an IOVA, according to @cfg
+ *
+ * @cfg: translation configuration
+ * @iova: iova to translate
+ * @perm: tentative access type
+ * @tlbe: returned entry
+ * @info: ptw event handle
+ *
+ * return 0 on success
+ */
+inline int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
+             IOMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
+{
+    if (!cfg->aa64) {
+        /*
+         * This code path is not entered as we check this while decoding
+         * the configuration data in the derived SMMU model.
+         */
+        assert(0);
+    }
+
+    return smmu_ptw_64(cfg, iova, perm, tlbe, info);
+}
 
 /**
  * The bus number is used for lookup when SID based invalidatation occurs.
diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
new file mode 100644
index 0000000..3a3a9f8
--- /dev/null
+++ b/hw/arm/smmu-internal.h
@@ -0,0 +1,102 @@
+/*
+ * ARM SMMU support - Internal API
+ *
+ * Copyright (c) 2017 Red Hat, Inc.
+ * Copyright (C) 2014-2016 Broadcom Corporation
+ * Written by Prem Mallappa, Eric Auger
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
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
+#ifndef HW_ARM_SMMU_INTERNAL_H
+#define HW_ARM_SMMU_INTERNAL_H
+
+#define TBI0(tbi) ((tbi) & 0x1)
+#define TBI1(tbi) ((tbi) & 0x2 >> 1)
+
+/* PTE Manipulation */
+
+#define ARM_LPAE_PTE_TYPE_SHIFT         0
+#define ARM_LPAE_PTE_TYPE_MASK          0x3
+
+#define ARM_LPAE_PTE_TYPE_BLOCK         1
+#define ARM_LPAE_PTE_TYPE_TABLE         3
+
+#define ARM_LPAE_L3_PTE_TYPE_RESERVED   1
+#define ARM_LPAE_L3_PTE_TYPE_PAGE       3
+
+#define ARM_LPAE_PTE_VALID              (1 << 0)
+
+#define PTE_ADDRESS(pte, shift) \
+    (extract64(pte, shift, 47 - shift + 1) << shift)
+
+#define is_invalid_pte(pte) (!(pte & ARM_LPAE_PTE_VALID))
+
+#define is_reserved_pte(pte, level)                                      \
+    ((level == 3) &&                                                     \
+     ((pte & ARM_LPAE_PTE_TYPE_MASK) == ARM_LPAE_L3_PTE_TYPE_RESERVED))
+
+#define is_block_pte(pte, level)                                         \
+    ((level < 3) &&                                                      \
+     ((pte & ARM_LPAE_PTE_TYPE_MASK) == ARM_LPAE_PTE_TYPE_BLOCK))
+
+#define is_table_pte(pte, level)                                        \
+    ((level < 3) &&                                                     \
+     ((pte & ARM_LPAE_PTE_TYPE_MASK) == ARM_LPAE_PTE_TYPE_TABLE))
+
+#define is_page_pte(pte, level)                                         \
+    ((level == 3) &&                                                    \
+     ((pte & ARM_LPAE_PTE_TYPE_MASK) == ARM_LPAE_L3_PTE_TYPE_PAGE))
+
+/* access permissions */
+
+#define PTE_AP(pte) \
+    (extract64(pte, 6, 2))
+
+#define PTE_APTABLE(pte) \
+    (extract64(pte, 61, 2))
+
+/*
+ * TODO: At the moment all transactions are considered as priviledged (EL1)
+ * as IOMMU translation callback does not pass user/priv attributes.
+ */
+#define is_permission_fault(ap, perm) \
+    (((perm) & IOMMU_WO) && ((ap) & 0x2))
+
+#define PTE_AP_TO_PERM(ap) \
+    (IOMMU_ACCESS_FLAG(true, !((ap) & 0x2)))
+
+/* Level Indexing */
+
+static inline int level_shift(int level, int granule_sz)
+{
+    return granule_sz + (3 - level) * (granule_sz - 3);
+}
+
+static inline uint64_t level_page_mask(int level, int granule_sz)
+{
+    return ~(MAKE_64BIT_MASK(0, level_shift(level, granule_sz)));
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
+            MAKE_64BIT_MASK(0, granule_sz - 3);
+}
+
+#endif
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 8e8b53c..524964a 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -4,4 +4,11 @@
 virt_acpi_setup(void) "No fw cfg or ACPI disabled. Bailing out."
 
 # hw/arm/smmu-common.c
-smmu_add_mr(const char *name) "%s"
\ No newline at end of file
+smmu_add_mr(const char *name) "%s"
+smmu_page_walk(int stage, uint64_t baseaddr, int first_level, uint64_t start, uint64_t end) "stage=%d, baseaddr=0x%"PRIx64", first level=%d, start=0x%"PRIx64", end=0x%"PRIx64
+smmu_lookup_table(int level, uint64_t baseaddr, int granule_sz, uint64_t start, uint64_t end, int flags, uint64_t subpage_size) "level=%d baseaddr=0x%"PRIx64" granule=%d, start=0x%"PRIx64" end=0x%"PRIx64" flags=%d subpage_size=0x%"PRIx64
+smmu_ptw_level(int level, uint64_t iova, size_t subpage_size, uint64_t baseaddr, uint32_t offset, uint64_t pte) "level=%d iova=0x%"PRIx64" subpage_sz=0x%lx baseaddr=0x%"PRIx64" offset=%d => pte=0x%"PRIx64
+smmu_ptw_invalid_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, uint32_t offset, uint64_t pte) "stage=%d level=%d base@=0x%"PRIx64" pte@=0x%"PRIx64" offset=%d pte=0x%"PRIx64
+smmu_ptw_page_pte(int stage, int level,  uint64_t iova, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t address) "stage=%d level=%d iova=0x%"PRIx64" base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" page address = 0x%"PRIx64
+smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t iova, uint64_t gpa, int bsize_mb) "stage=%d level=%d base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" iova=0x%"PRIx64" block address = 0x%"PRIx64" block size = %d MiB"
+smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "baseaddr=0x%"PRIx64" index=0x%x, pteaddr=0x%"PRIx64", pte=0x%"PRIx64
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 76cf4aa..4ccd131 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -129,4 +129,18 @@ static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
 {
     return  ((pci_bus_num(sdev->bus) & 0xff) << 8) | sdev->devfn;
 }
+
+/**
+ * smmu_ptw - Perform the page table walk for a given iova / access flags
+ * pair, according to @cfg translation config
+ */
+int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
+             IOMMUTLBEntry *tlbe, SMMUPTWEventInfo *info);
+
+/**
+ * select_tt - compute which translation table shall be used according
+ * the input iova and tranlsation config and return the TT specific info
+ */
+SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova);
+
 #endif  /* HW_ARM_SMMU_COMMON */
-- 
2.5.5

