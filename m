Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp307742njc;
        Fri, 13 Jun 2025 07:48:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhN/I6zfHaFjLd77c4EP8KUv4d4bQVBJe3wouC+YlfRzX23IrI+IFMZ/0XrMOwA6gCAAGqs41ev9QJUg==@linaro.org
X-Google-Smtp-Source: AGHT+IGsG1LFNrXirQFKEdm4rvArhJynLVEWQtElxqgxFAOXQ3Q0EDUZiqAy+Z7PGQjjv1MiFprs
X-Received: by 2002:a05:620a:1b8f:b0:7d3:910e:4a76 with SMTP id af79cd13be357-7d3c67ccf52mr2063485a.7.1749826102681;
        Fri, 13 Jun 2025 07:48:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749826102; cv=none;
        d=google.com; s=arc-20240605;
        b=Rur2jxEB/EDD/NcuuA4BVpIIfjsEK4hgWm6QqN1CqL3/dS92SWS8d7PyuFdEIgXS+B
         cl/HeCh3dYqiQoDboPQHFKSvtUuY8coU0eA9Sy0FV83FALFb1oCRIHpad7K/rWX01x4r
         C6Dt7FbCseVOYcZRs/YHyvmiOxDiphvKGKMuyhuRaqgLQSZBiHC8ekq+cvZkRxttk960
         C1Dg5boKMi+uH4JxFJzYmUwnYr/WpFdgg5SFrkiosIq6wHKPIUzi5OYyldlvok7Cqt8b
         Km5tNziMt/dOg3UINaV0CS5BWiKVRFyEPw3otRsxteWpBH97jdsT3XaUQBE0NRG/mVEm
         sVlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=FCxxIk6MwWPBuDJBvVpwFdfwtrSzUbOx6XeMagfcXDI=;
        fh=12ij1D0xizeHJ+1WEqwo/9QFN2xwslWS8h/2oI6OPA8=;
        b=Wn19RMcehp8ZECors+4gcHnRfLaLclRg1Tm+me3w8zntMwJncskTEUO+wrg/l7FPo8
         ej0byM3h3JhXWcsDb+5OkLJ5e4tDOj0eA18OXct6Ps7x+Eg2k9nPkjmGVdCNJn/acztX
         z16bh0UWPcxdEsS/wKjT3gZn+6xaLX3tfhnSvxWBB7TR5Gp0ZdwFl/3U236Yqs4fI2KS
         X0y92YXI1JEkceYgw6ZmssVLvwvMNgC8XBpewqRFpGFnhqr2mgvEY9Mqkk/J4NYw52d6
         BPYL/uv7rUnF3YCAf8bjAHDCef0nf5Z2QGW6qPwX4rERZWjPcdlv+bVEniJtZXb317Wa
         yv4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8f0c011si309338885a.445.2025.06.13.07.48.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jun 2025 07:48:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uQ5gL-00084S-WC; Fri, 13 Jun 2025 10:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uQ5gK-000843-Bb; Fri, 13 Jun 2025 10:47:00 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uQ5gI-0006kn-LG; Fri, 13 Jun 2025 10:47:00 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bJhy226dlz6L4sN;
 Fri, 13 Jun 2025 22:44:58 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id C3AEA1400DB;
 Fri, 13 Jun 2025 22:46:56 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Jun 2025 16:46:48 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <imammedo@redhat.com>, <nathanc@nvidia.com>, <mochs@nvidia.com>,
 <smostafa@google.com>, <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <zhangfei.gao@linaro.org>
Subject: [PATCH v4 5/7] hw/arm/virt: Add an SMMU_IO_LEN macro
Date: Fri, 13 Jun 2025 15:44:47 +0100
Message-ID: <20250613144449.60156-6-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-TUID: c2c3h4far2Oi

From: Nicolin Chen <nicolinc@nvidia.com>

This is useful as the subsequent support for new SMMUv3 dev will also
use the same.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Donald Dutile <ddutile@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Nathan Chen <nathanc@nvidia.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 71b923f786..eeace4754d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -146,6 +146,9 @@ static void arm_virt_compat_set(MachineClass *mc)
 #define LEGACY_RAMLIMIT_GB 255
 #define LEGACY_RAMLIMIT_BYTES (LEGACY_RAMLIMIT_GB * GiB)
 
+/* MMIO region size for SMMUv3 */
+#define SMMU_IO_LEN 0x20000
+
 /* Addresses and sizes of our components.
  * 0..128MB is space for a flash device so we can run bootrom code such as UEFI.
  * 128MB..256MB is used for miscellaneous device I/O.
@@ -177,7 +180,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
     [VIRT_UART1] =              { 0x09040000, 0x00001000 },
-    [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
+    [VIRT_SMMU] =               { 0x09050000, SMMU_IO_LEN },
     [VIRT_PCDIMM_ACPI] =        { 0x09070000, MEMORY_HOTPLUG_IO_LEN },
     [VIRT_ACPI_GED] =           { 0x09080000, ACPI_GED_EVT_SEL_LEN },
     [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
@@ -1447,7 +1450,6 @@ static void create_smmu(const VirtMachineState *vms,
     int irq =  vms->irqmap[VIRT_SMMU];
     int i;
     hwaddr base = vms->memmap[VIRT_SMMU].base;
-    hwaddr size = vms->memmap[VIRT_SMMU].size;
     DeviceState *dev;
 
     if (vms->iommu != VIRT_IOMMU_SMMUV3 || !vms->iommu_phandle) {
@@ -1467,7 +1469,7 @@ static void create_smmu(const VirtMachineState *vms,
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
                            qdev_get_gpio_in(vms->gic, irq + i));
     }
-    create_smmuv3_dt_bindings(vms, base, size, irq);
+    create_smmuv3_dt_bindings(vms, base, SMMU_IO_LEN, irq);
 }
 
 static void create_virtio_iommu_dt_bindings(VirtMachineState *vms)
-- 
2.47.0

