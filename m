Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1884469njc;
        Tue, 11 Mar 2025 07:15:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXRqgjj4/lNgL7Lt6kIJpTndEbZcb/6o0m5sk8zboQoRSmdc/IQMsjdlweUpFYDBLZxXvtlzjB3EI/wWw==@linaro.org
X-Google-Smtp-Source: AGHT+IENAOAf2HymD8fku98SxljQQamjuOqqcGu0w7lnIdnFPdTk8YveI0zkbxVeqCoRR12GGKoT
X-Received: by 2002:a05:6000:1884:b0:390:df83:1f5d with SMTP id ffacd0b85a97d-39132dbb4efmr13872030f8f.35.1741702543922;
        Tue, 11 Mar 2025 07:15:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741702543; cv=none;
        d=google.com; s=arc-20240605;
        b=j0v+IJoZpCQR40hrv2MPKPDGnQzjwfThNcD+OUK01dsIqvPwXw5jNJeCBct8krP1Pr
         jCeBN3OQTM1x80lWLbxs5IBTXH/xu4qSwxAdP6U/7xxLDWZA0vTpbHqhYfpkl6KmDQMY
         Md5onz6rlJSgNUMfwGJ614RX9lqHLhBn4hSMcJVxkxEKbREiVtmGMIgQDTxo8QfO3PsS
         xQIwaJvfa9TzCER2P4v+j6rv/pdBS9X08w9fIZGYtM8a1Kg6lFMxXcdIMbuBUb2SKgMP
         /ksGWe3XPB1Q6uoEVbCTMw8xFWh4gfs/Nb7nOV1Xxh0v6/yeluFuo63LGXTFi/hyfg8r
         qoqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=G5z5zixkeY9kaY2v/YD+76iMvMlnGLuYBMP/HFXOIvY=;
        fh=PnSw404jJ+s1m+rSaKsD+X9lt69JOcV3ATg/BWbrXZg=;
        b=O7/X9hXdYSimqaA8nM6VPIGtX8DqtXrWNuLWFmLNtfOqngPASCb5Bt9h3gbYZcjesu
         05eye6/MbjYam9ONNxg/txzfM/LWcTZTAy53U0KRtN/sVfrbA6cPNithhmaLR7I6BmXW
         l46oIXihiuRxo/1+bkCcNhGIdDnJ6tW+blNzKLVDzVmpOM2T2s/7ok6S47s/a6EJ2qCM
         Jr7dnejJINUYHKhC3mSJ0bijJy+FvoF1RWo/KsWkqj3G5LxgcHH9r8SL0LXHt3f6HRBG
         vAYxI89Nty8/yjm50Zuw5yfxPvoubrAKWID8kza61BSfawXQ+xrtKKTwgloDeq7v7Gou
         trxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3913975dfc9si6918210f8f.317.2025.03.11.07.15.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 07:15:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ts0OB-0002oV-S6; Tue, 11 Mar 2025 10:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0Nc-0002RN-Ho; Tue, 11 Mar 2025 10:14:49 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0NZ-0007Gi-5T; Tue, 11 Mar 2025 10:14:48 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZBwfw4b6sz6D9b5;
 Tue, 11 Mar 2025 22:11:36 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 7D2B71404F5;
 Tue, 11 Mar 2025 22:14:43 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Mar 2025 15:14:36 +0100
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [RFC PATCH v2 18/20] hw/arm/smmu-common: Bypass emulated IOTLB for a
 accel SMMUv3
Date: Tue, 11 Mar 2025 14:10:43 +0000
Message-ID: <20250311141045.66620-19-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nCkPZIvibtBu

From: Nicolin Chen <nicolinc@nvidia.com>

If a vSMMU is configured as a accelerated one, HW IOTLB will be used
and all cache invalidation should be done to the HW IOTLB too, v.s.
the emulated iotlb. In this case, an iommu notifier isn't registered,
as the devices behind a SMMUv3-accel would stay in the system address
space for stage-2 mappings.

However, the KVM code still requests an iommu address space to translate
an MSI doorbell gIOVA via get_msi_address_space() and translate().

Since a SMMUv3-accel doesn't register an iommu notifier to flush emulated
iotlb, bypass the emulated IOTLB and always walk through the guest-level
IO page table.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/smmu-common.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 9fd455baa0..fd10df8866 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -77,6 +77,17 @@ static SMMUTLBEntry *smmu_iotlb_lookup_all_levels(SMMUState *bs,
     uint8_t level = 4 - (inputsize - 4) / stride;
     SMMUTLBEntry *entry = NULL;
 
+    /*
+     * Stage-1 translation with a accel SMMU in general uses HW IOTLB. However,
+     * KVM still requests for an iommu address space for an MSI fixup by looking
+     * up stage-1 page table. Make sure we don't go through the emulated pathway
+     * so that the emulated iotlb will not need any invalidation.
+     */
+
+    if (bs->accel) {
+        return NULL;
+    }
+
     while (level <= 3) {
         uint64_t subpage_size = 1ULL << level_shift(level, tt->granule_sz);
         uint64_t mask = subpage_size - 1;
@@ -142,6 +153,16 @@ void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *new)
     SMMUIOTLBKey *key = g_new0(SMMUIOTLBKey, 1);
     uint8_t tg = (new->granule - 10) / 2;
 
+    /*
+     * Stage-1 translation with a accel SMMU in general uses HW IOTLB. However,
+     * KVM still requests for an iommu address space for an MSI fixup by looking
+     * up stage-1 page table. Make sure we don't go through the emulated pathway
+     * so that the emulated iotlb will not need any invalidation.
+     */
+    if (bs->accel) {
+        return;
+    }
+
     if (g_hash_table_size(bs->iotlb) >= SMMU_IOTLB_MAX_SIZE) {
         smmu_iotlb_inv_all(bs);
     }
-- 
2.34.1

