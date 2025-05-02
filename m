Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp745337njj;
        Fri, 2 May 2025 03:29:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0uVG8W63k+o7A8QBUQJCXAd2NcpORar29WA2wAeRWw9M4JiKSxWrjxV4hfttRVpuUT5AJegfi6O1OAg==@linaro.org
X-Google-Smtp-Source: AGHT+IFPs9TazBmJ5uUgYUSntccCflq4elxrmgvOoUylPyxsiwI8wRjKbM857iHJbuaNrk2o5nR4
X-Received: by 2002:a05:620a:25ce:b0:7c9:13a3:a5fa with SMTP id af79cd13be357-7cad5b2cecbmr391574985a.5.1746181761129;
        Fri, 02 May 2025 03:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746181761; cv=none;
        d=google.com; s=arc-20240605;
        b=e/Diean4FJXPOyQhom4j84ULREj5SQNZFb7qrlqcdsZrO1Mc7T7KglIEAvY61AMmSC
         GO4B2KKmQcqbbRuOvw6KxFPD4m2tqvz+pnKs2Xfo7+UbG/LjLMk65/SzVKqB83ckb7YY
         LSPxNQLUUxn0bcCe89NiLSb75o/4n80jLKWZKHH5ZtB5s5+QhSGwp8sj4m2GQL0o0lCJ
         nDKyOTuKnDuGm01XUcUAREixB04pAaAp3XIzichEL8WdQWKrugRQCR7GMVboxFHh8r/Z
         WSBY0Opwk45Jz0bMJX1Pk99SamMfgfXfftrXuig3/ySG/Hpmd7EVfeeVPHJOUNZJmfhD
         kA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=rxXxNBeHSdKv1uZ1mtRJFukJt9iUGPOt4pRtRk0yO7Y=;
        fh=PnSw404jJ+s1m+rSaKsD+X9lt69JOcV3ATg/BWbrXZg=;
        b=IZdDajrepiB62g6r3qCQnwiSOai8uifJKC0kNerssLx3T8CgksszZ47TVcmpEzUQKx
         sZxJuf6eGGoYpH9r0gWSKnZp56ZwEsamDo/ryGGLl4V6iFhMRNfbtAseJrYpjzvKCclw
         TxMeFh6WmuGHsKXS6wEo/8c66/gzBFTDp7G6U7zcoBbbig91zMGaS7iHXTj0YMrYuaTh
         TKp7rLmPDqp7RbRcJQz+c1cfQyELnrYfwHRAJOdHbhIucDuGSoRgTcLCjS2q2mVoxWIF
         wUFRSNiyXz/oa7FWlOE45fp7Weezz9O9abl9G290R36btbQJWw+6u3Nrh4KCT6O/oHTQ
         3Znw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cad241ff27si270700185a.251.2025.05.02.03.29.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 May 2025 03:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uAnd4-0000Nc-JX; Fri, 02 May 2025 06:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uAncv-0000Bt-VO; Fri, 02 May 2025 06:28:21 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uAncr-000283-E1; Fri, 02 May 2025 06:28:17 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Zpn7v1mKPz6M4PY;
 Fri,  2 May 2025 18:23:39 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 008AD1400D9;
 Fri,  2 May 2025 18:28:02 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 May 2025 12:27:54 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [PATCH v2 4/6] hw/arm/virt: Add an SMMU_IO_LEN macro
Date: Fri, 2 May 2025 11:27:05 +0100
Message-ID: <20250502102707.110516-5-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
References: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
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
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3GWwPnNRU7bb

From: Nicolin Chen <nicolinc@nvidia.com>

This is useful as the subsequent support for new SMMUv3 dev will also
use the same.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 464e84ae67..e178282d71 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -147,6 +147,9 @@ static void arm_virt_compat_set(MachineClass *mc)
 #define LEGACY_RAMLIMIT_GB 255
 #define LEGACY_RAMLIMIT_BYTES (LEGACY_RAMLIMIT_GB * GiB)
 
+/* MMIO region size for SMMUv3 */
+#define SMMU_IO_LEN 0x20000
+
 /* Addresses and sizes of our components.
  * 0..128MB is space for a flash device so we can run bootrom code such as UEFI.
  * 128MB..256MB is used for miscellaneous device I/O.
@@ -178,7 +181,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
     [VIRT_UART1] =              { 0x09040000, 0x00001000 },
-    [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
+    [VIRT_SMMU] =               { 0x09050000, SMMU_IO_LEN },
     [VIRT_PCDIMM_ACPI] =        { 0x09070000, MEMORY_HOTPLUG_IO_LEN },
     [VIRT_ACPI_GED] =           { 0x09080000, ACPI_GED_EVT_SEL_LEN },
     [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
@@ -1453,7 +1456,6 @@ static void create_smmu(const VirtMachineState *vms,
     int irq =  vms->irqmap[VIRT_SMMU];
     int i;
     hwaddr base = vms->memmap[VIRT_SMMU].base;
-    hwaddr size = vms->memmap[VIRT_SMMU].size;
     DeviceState *dev;
 
     if (vms->iommu != VIRT_IOMMU_SMMUV3 || !vms->iommu_phandle) {
@@ -1473,7 +1475,7 @@ static void create_smmu(const VirtMachineState *vms,
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
                            qdev_get_gpio_in(vms->gic, irq + i));
     }
-    create_smmuv3_dt_bindings(vms, base, size, irq);
+    create_smmuv3_dt_bindings(vms, base, SMMU_IO_LEN, irq);
 }
 
 static void create_virtio_iommu_dt_bindings(VirtMachineState *vms)
-- 
2.34.1

