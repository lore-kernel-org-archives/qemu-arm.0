Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140AC606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 09:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=y/wPW31c
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWW27-00083K-8q; Thu, 26 Nov 2026 04:44:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1xWW1o-0007yQ-5S
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 04:44:33 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1xWW1i-0001zL-7P
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 04:44:31 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4a68190a2a7so5660442f8f.1
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 01:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795686264; x=1796291064; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AFrkTTdU0uL1ydL3C0b22nVCVsxyrBmTvEDBgY2tI5w=;
 b=y/wPW31creOGKD+ZHibI7y8nzM0Fgi91WhkyXn0V/lqFbaKimOeYT1uK3cRJNqjc75
 UuQ4ddOBHWlAevJNvWDuMetPTqjVoPPm+GUYqjAChxX/X8xkJGoseLr/8i9O0eUwvyAg
 AEWz54nW6vyYAwG/Z3/05CqdvE9WJgSnjQ6mu7mWf2wWwQz+nCriO0UYiENNpaJpbhNA
 FH71b/Sh/CP8RefIVtl1g2E7XAm99rqi0TkdX2zzclLUr/uU+v8NjjlcFVUIHW9kqauL
 5NjC2SDY8Hnk0sPAuqwgqk31CTi9R0SlyWi2qOqplHuQnRrwmKkLXOrbRgVBwWKQFE+T
 TOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795686264; x=1796291064;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=AFrkTTdU0uL1ydL3C0b22nVCVsxyrBmTvEDBgY2tI5w=;
 b=Suo1kAN5kJUNwR8cI/u16tRgFFfypH4puNY1EdW9kbjdBgx2+kcHkUZ+hU/ag5OHON
 8VAVUD5sM13lBZ7UTZZ6iWNFO5DgKNfKXMbXgTZg8CMQZO89oBAxGJJR/5WMHRpNzDkD
 TCRpR3NvjyVEGIIWC6cMjZHGvYznTsQuQd6PRHEJVbwWhTiTxFOZD4TMhRsLszkLzhvy
 sgKxFgHPY6dqUVQs8DHXKixelzyYbt6PqI5qv8DxFlBNn+Wd7HTHIYjRzUiYJjzNkEkX
 2X6fc4TOMAK7qxJS+cTHYMVZtWEUFKR1nAmZRImm87Nww2u1FlycJInNoyNIL18zN94u
 g0Ng==
X-Forwarded-Encrypted: i=1;
 AL+hErEggD9G37tBRnwvANslz9kUxotrd7xPiJPn50nyRQaOrsscLixEhpo9Z3F46CzqfmOJzg+TVJ9tpg==@nongnu.org
X-Gm-Message-State: APuU4Z9DLFFnsYwWmkA5PkNkdREw3AcAeY8PwxCqj5u7+hGJ7MORan9H
 ZX7nIQEyQTp3swuEy3pphrw9XvSpMqk7vvM5IvdMxh7CgdSMDbwWtBNXYnSX2X9Vkm0=
X-Gm-Gg: AZFdTZdeooeQJS3gcvPwKOaDn7v0Ae/ip0L8w/oNJ+qX72GsWyO3q1z2FDV6MR4FpRY
 sxxUPWe957npv+ie+2fh+WfuJ7KevRNfXDPHhMR0mjaFEjGEGtBSO37oCpSKjvUqJw2rt8SzF3y
 +FXne3Bc2a+iDyJQ69SXsAzZBkCbl2lQEmv17GIuxk5XF4vvN/UIOyix3pc61vE6JyvzMxczXAP
 sdZxaNvMEyhqBP39qSMpxY4KLrbUScU+kCoDpGh0Rp14rnchjBwmA9pecmkNCxNLt0W+rH+gONE
 S2RlrTPCnI3MlEMujAofo3uGupPK9BFjGfWBwfQ/2ZWZyEt45+KZo8RG3l2loOZlWFWts+lVUXA
 TNrNVgDtP6BO50vXfk2DB8fqd1BsaReMg5HUCgVu/fY30PpOS1cb86zPI3kQazXQVWnGZVjqpPr
 ALGeZFXom+NlL8bHr/3feZ+bcWvaOLt1ynURq4j2sMxowTFnZYnOJiemwZz+Hc4dUNX9msVX5vI
 YXzp8btKvjTv4G4TeLpgM6rW7Mh8AhzNRvRSfXwhU7STc6Gm1eaY0CmpvAOyrwGzml4vp+feoI5
 0Ghif3jLWjbNihvODK7QOoqcUikAyPG8rQ==
X-Received: by 2002:a05:6000:2082:b0:4aa:ba0f:c24 with SMTP id
 ffacd0b85a97d-4abb3956754mr40047437f8f.40.1795686264254; 
 Thu, 26 Nov 2026 01:44:24 -0800 (PST)
Received: from [127.0.1.1] ([2a10:d582:31e:0:496e:5802:6210:8370])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b2050f1sm39023989f8f.38.2026.11.26.01.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 01:44:23 -0800 (PST)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Thu, 26 Nov 2026 09:44:19 +0000
Subject: [PATCH v3 1/2] hw/arm/smmuv3: define Root registers and x-root
 flag
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-jmac-smmu-root-registers-v3-1-b46a8ac59b6d@linaro.org>
References: <20261126-jmac-smmu-root-registers-v3-0-b46a8ac59b6d@linaro.org>
In-Reply-To: <20261126-jmac-smmu-root-registers-v3-0-b46a8ac59b6d@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, 
 Gustavo Romero <gromero@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Jim MacArthur <jim.macarthur@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-6be7c
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Adds all the non-optional SMMUv3.3 Root registers. These registers
do nothing at the moment, but accessors are provided for future
use.

The extra space will only be allocated if x-root is set to true. This
is off by default, and in most machines the Root registers will be
outside the SMMU register space and hence inaccessible.

Based on original work by Pierrick Bouvier <pierrick.bouvier@linaro.org>

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 hw/arm/smmuv3.c                | 241 ++++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/smmuv3-common.h |  30 +++++
 include/hw/arm/smmuv3.h        |  14 +++
 3 files changed, 284 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 2a9721b87e..70aecb92ea 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -316,6 +316,14 @@ static void smmuv3_init_id_regs(SMMUv3State *s)
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
     s->aidr = 0x1;
     smmuv3_accel_idr_override(s);
+
+    /*
+     * Initialize Root bank. This register is inaccessible if we don't have
+     * Root, so the value can be 1 in all cases.
+     */
+    s->root.idr0 = FIELD_DP32(s->root.idr0, ROOT_IDR0, ROOT_IMPL, 1);
+    /* Set this to 1 when SMMU Realms are implemented */
+    s->root.idr0 = FIELD_DP32(s->root.idr0, ROOT_IDR0, REALM_IMPL, 0);
 }
 
 bool smmuv3_ats_enabled(SMMUv3State *s)
@@ -343,6 +351,11 @@ static void smmuv3_reset(SMMUv3State *s)
     s->gerrorn = 0;
     s->statusr = 0;
     s->gbpa = SMMU_GBPA_RESET_VAL;
+
+    s->root.cr0 = 0;
+    s->root.cr0ack = 0;
+    s->root.gpf_far = 0;
+    s->root.gpt_cfg_far = 0;
 }
 
 static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
@@ -1769,6 +1782,110 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
     return MEMTX_OK;
 }
 
+/*
+ * Check we are from the Root PA space to read from or write to the
+ * SMMU Root register area.
+ */
+static bool smmu_check_root_access(SMMUv3State *s, MemTxAttrs attrs,
+                                   hwaddr offset, bool is_read)
+{
+    /* Check if the access is from Root PA */
+    if (attrs.space != ARMSS_Root) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "%s: Non-root %s attempt at offset 0x%" PRIx64 " (%s)\n",
+            __func__, is_read ? "read" : "write", offset,
+            is_read ? "RAZ" : "WI");
+        return false;
+    }
+    return true;
+}
+
+static MemTxResult smmu_root_writel(SMMUv3State *s, hwaddr offset,
+                                    uint64_t data, MemTxAttrs attrs)
+{
+    switch (offset) {
+    case A_ROOT_IDR0:
+    case A_ROOT_IIDR:
+    case A_ROOT_CR0ACK:
+        /* RO registers, write ignored */
+        return MEMTX_OK;
+    case A_ROOT_TLBI_CTRL:
+        /* Optional, not implemented. Present if IDR0.RGPTM == 1 */
+        return MEMTX_OK;
+    case A_ROOT_GPT_BASE_UPDATE:
+        /* Unimplemented at present; has side effects */
+        return MEMTX_OK;
+    case A_ROOT_CR0:
+        s->root.cr0 = data;
+        s->root.cr0ack = s->root.cr0;
+        return MEMTX_OK;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s unhandled 32-bit access at 0x%"PRIx64" (WI)\n",
+                      __func__, offset);
+        /*
+         * Locations not associated with a register (including registers that we
+         * have not implemented yet) are RES0, and will follow RAZ/WI behaviour.
+         */
+        return MEMTX_OK;
+    }
+}
+
+static MemTxResult smmu_root_writell(SMMUv3State *s, hwaddr offset,
+                                     uint64_t data, MemTxAttrs attrs)
+{
+    switch (offset) {
+    case A_ROOT_GPT_BASE:
+        s->root.gpt_base = data;
+        return MEMTX_OK;
+    case A_ROOT_GPT_BASE_CFG:
+        s->root.gpt_base_cfg = data;
+        return MEMTX_OK;
+    case A_ROOT_GPF_FAR:
+        s->root.gpf_far = data;
+        return MEMTX_OK;
+    case A_ROOT_GPT_CFG_FAR:
+        s->root.gpt_cfg_far = data;
+        return MEMTX_OK;
+    case A_ROOT_TLBI:
+        /* Optional, not implemented. Present if ROOT_IDR0.RGPTM == 1 */
+        return MEMTX_OK;
+    case A_ROOT_GPT_BASE2:
+        s->root.gpt_base2 = data;
+        return MEMTX_OK;
+    case A_ROOT_GPCBW:
+        /* Optional, not implemented. Present if ROOT_IDR0.GPTS == 1 */
+        return MEMTX_OK;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s unhandled 64-bit access at 0x%"PRIx64" (WI)\n",
+                      __func__, offset);
+        /* RES0; See smmu_root_writel */
+        return MEMTX_OK;
+    }
+}
+
+static MemTxResult smmu_write_root(SMMUv3State *s, hwaddr offset, uint64_t data,
+                                   unsigned size, MemTxAttrs attrs)
+{
+    MemTxResult r;
+
+    switch (size) {
+    case 8:
+        r = smmu_root_writell(s, offset, data, attrs);
+        break;
+    case 4:
+        r = smmu_root_writel(s, offset, data, attrs);
+        break;
+    default:
+        r = MEMTX_ERROR;
+        break;
+    }
+
+    trace_smmuv3_write_mmio(offset, data, size, r);
+    return r;
+}
+
 static MemTxResult smmu_write_mmio(void *opaque, hwaddr offset, uint64_t data,
                                    unsigned size, MemTxAttrs attrs)
 {
@@ -1776,6 +1893,18 @@ static MemTxResult smmu_write_mmio(void *opaque, hwaddr offset, uint64_t data,
     SMMUv3State *s = ARM_SMMUV3(sys);
     MemTxResult r;
 
+    if (offset >= SMMUV3_ROOT_REG_OFFSET) {
+        if (!smmu_check_root_access(s, attrs, offset, false)) {
+            /*
+             * As per 6.2.8, accesses in any PA space other
+             * than Root are completed as RAZ/WI.
+             */
+            trace_smmuv3_write_mmio(offset, data, size, MEMTX_OK);
+            return MEMTX_OK;
+        }
+        return smmu_write_root(s, offset, data, size, attrs);
+    }
+
     /* CONSTRAINED UNPREDICTABLE choice to have page0/1 be exact aliases */
     offset &= ~0x10000;
 
@@ -1918,6 +2047,99 @@ static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
     }
 }
 
+static MemTxResult smmu_root_readl(SMMUv3State *s, hwaddr offset,
+                                   uint64_t *data, MemTxAttrs attrs)
+{
+    switch (offset) {
+    case A_ROOT_IDR0:
+        *data = s->root.idr0;
+        return MEMTX_OK;
+    case A_ROOT_IIDR:
+        *data = s->root.iidr;
+        return MEMTX_OK;
+    case A_ROOT_TLBI_CTRL:
+        /* Optional, not implemented. Present if ROOT_IDR0.RGPTM == 1 */
+        *data = 0;
+        return MEMTX_OK;
+    case A_ROOT_GPT_BASE_UPDATE:
+        /* Not a regular register; reads as 0 once update is complete */
+        *data = 0;
+        return MEMTX_OK;
+    case A_ROOT_CR0:
+        *data = s->root.cr0;
+        return MEMTX_OK;
+    case A_ROOT_CR0ACK:
+        *data = s->root.cr0ack;
+        return MEMTX_OK;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s unhandled 32-bit access at 0x%"PRIx64" (RAZ)\n",
+                      __func__, offset);
+        *data = 0;
+        /* RES0; See smmu_root_writel */
+        return MEMTX_OK;
+    }
+}
+
+static MemTxResult smmu_root_readll(SMMUv3State *s, hwaddr offset,
+                                    uint64_t *data, MemTxAttrs attrs)
+{
+    switch (offset) {
+    case A_ROOT_GPT_BASE:
+        *data = s->root.gpt_base;
+        return MEMTX_OK;
+    case A_ROOT_GPT_BASE_CFG:
+        *data = s->root.gpt_base_cfg;
+        return MEMTX_OK;
+    case A_ROOT_GPF_FAR:
+        *data = s->root.gpf_far;
+        return MEMTX_OK;
+    case A_ROOT_GPT_CFG_FAR:
+        *data = s->root.gpt_cfg_far;
+        return MEMTX_OK;
+    case A_ROOT_TLBI:
+        /* Optional, not implemented. Present if ROOT_IDR0.RGPTM == 1 */
+        *data = 0;
+        return MEMTX_OK;
+    case A_ROOT_GPT_BASE2:
+        *data = s->root.gpt_base2;
+        return MEMTX_OK;
+    case A_ROOT_GPCBW:
+        /* Optional, not implemented. Present if ROOT_IDR0.GPTS == 1 */
+        *data = 0;
+        return MEMTX_OK;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s unhandled 64-bit access at 0x%"PRIx64" (RAZ)\n",
+                      __func__, offset);
+        *data = 0;
+        /* RES0; See smmu_root_writel */
+        return MEMTX_OK;
+    }
+}
+
+static MemTxResult smmu_read_root(SMMUv3State *s, hwaddr offset, uint64_t *data,
+                                  unsigned size, MemTxAttrs attrs)
+{
+    MemTxResult r;
+
+    switch (size) {
+    case 8:
+        r = smmu_root_readll(s, offset, data, attrs);
+        break;
+    case 4:
+        r = smmu_root_readl(s, offset, data, attrs);
+        break;
+    default:
+        r = MEMTX_ERROR;
+        break;
+    }
+
+    trace_smmuv3_read_mmio(offset, *data, size, r);
+    return r;
+}
+
+
 static MemTxResult smmu_read_mmio(void *opaque, hwaddr offset, uint64_t *data,
                                   unsigned size, MemTxAttrs attrs)
 {
@@ -1925,6 +2147,19 @@ static MemTxResult smmu_read_mmio(void *opaque, hwaddr offset, uint64_t *data,
     SMMUv3State *s = ARM_SMMUV3(sys);
     MemTxResult r;
 
+    if (offset >= SMMUV3_ROOT_REG_OFFSET) {
+        if (!smmu_check_root_access(s, attrs, offset, true)) {
+            /*
+             * As per 6.2.8, accesses in any PA space other
+             * than Root are completed as RAZ/WI.
+             */
+            trace_smmuv3_read_mmio(offset, *data, size, MEMTX_OK);
+            return MEMTX_OK;
+        }
+
+        return smmu_read_root(s, offset, data, size, attrs);
+    }
+
     /* CONSTRAINED UNPREDICTABLE choice to have page0/1 be exact aliases */
     offset &= ~0x10000;
 
@@ -2063,7 +2298,9 @@ static void smmu_realize(DeviceState *d, Error **errp)
     qemu_mutex_init(&s->mutex);
 
     memory_region_init_io(&sys->iomem, OBJECT(s),
-                          &smmu_mem_ops, sys, TYPE_ARM_SMMUV3, 0x20000);
+                          &smmu_mem_ops, sys, TYPE_ARM_SMMUV3,
+                          s->has_root ? SMMUV3_REGS_SIZE + SMMUV3_ROOT_PAGE_SIZE
+                                      : SMMUV3_REGS_SIZE);
 
     sys->mrtypename = TYPE_SMMUV3_IOMMU_MEMORY_REGION;
 
@@ -2153,6 +2390,8 @@ static const Property smmuv3_properties[] = {
     /* Identifier used for ACPI IORT SMMUv3 (and DSDT for CMDQV) generation */
     DEFINE_PROP_UINT8("identifier", SMMUv3State, identifier, 0),
     DEFINE_PROP_BOOL("accel", SMMUv3State, accel, false),
+    DEFINE_PROP_BOOL("x-root", SMMUv3State, has_root, false),
+
     /* GPA of MSI doorbell, for SMMUv3 accel use. */
     DEFINE_PROP_UINT64("msi-gpa", SMMUv3State, msi_gpa, 0),
     /*
diff --git a/include/hw/arm/smmuv3-common.h b/include/hw/arm/smmuv3-common.h
index 4609975edf..a8919d5be6 100644
--- a/include/hw/arm/smmuv3-common.h
+++ b/include/hw/arm/smmuv3-common.h
@@ -411,6 +411,36 @@ REG32(EVENTQ_IRQ_CFG2,     0xbc)
 
 #define A_IDREGS           0xfd0
 
+/*
+ * SMMUV3_ROOT_REG_OFFSET is implementation dependent. QEMU fixes this at one
+ * address for now, but this may need to vary at some point to suit actual
+ * hardware implementations.
+ */
+#define SMMUV3_PAGE_SIZE        0x10000
+#define SMMUV3_REGS_SIZE        (2 * SMMUV3_PAGE_SIZE) /* Page 0 and Page 1 */
+#define SMMUV3_ROOT_REG_OFFSET  0x20000
+#define SMMUV3_ROOT_PAGE_SIZE   SMMUV3_PAGE_SIZE
+
+REG32(ROOT_IDR0,            0x0)
+    FIELD(ROOT_IDR0, ROOT_IMPL,   0,  1)
+    FIELD(ROOT_IDR0, BGTPM,       1,  1)
+    FIELD(ROOT_IDR0, RGPTM,       2,  1)
+    FIELD(ROOT_IDR0, REALM_IMPL,  3,  1)
+    FIELD(ROOT_IDR0, BA_REALM,   22, 10)
+
+REG32(ROOT_IIDR,             0x8)
+REG32(ROOT_CR0,             0x20)
+REG32(ROOT_CR0ACK,          0x24)
+REG64(ROOT_GPT_BASE,        0x28)
+REG64(ROOT_GPT_BASE_CFG,    0x30)
+REG64(ROOT_GPF_FAR,         0x38)
+REG64(ROOT_GPT_CFG_FAR,     0x40)
+REG64(ROOT_TLBI,            0x50)
+REG32(ROOT_TLBI_CTRL,       0x58)
+REG64(ROOT_GPT_BASE2,       0x60)
+REG32(ROOT_GPT_BASE_UPDATE, 0x68)
+REG32(ROOT_GPCBW,           0x70)
+
 /* Commands */
 
 typedef enum SMMUCommandType {
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index d39fe8850b..a8b354438c 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -34,6 +34,18 @@ typedef struct SMMUQueue {
      uint8_t log2size;
 } SMMUQueue;
 
+typedef struct SMMUv3RootRegBank {
+    uint32_t idr0;
+    uint32_t iidr;
+    uint32_t cr0;
+    uint32_t cr0ack;
+    uint64_t gpt_base;
+    uint64_t gpt_base_cfg;
+    uint64_t gpf_far;
+    uint64_t gpt_cfg_far;
+    uint64_t gpt_base2;
+} SMMUv3RootRegBank;
+
 struct SMMUv3State {
     SMMUState     smmu_state;
 
@@ -80,6 +92,8 @@ struct SMMUv3State {
     OnOffAuto cmdqv;
 
     Notifier machine_done;
+    bool has_root;
+    SMMUv3RootRegBank root;
 };
 
 typedef enum {

-- 
2.43.0


