Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp2840748njh;
        Mon, 2 Jun 2025 08:42:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUBcCN5GsdOkuknOMLn2ylXVu4ixktxK8V1iiVqQf758znKPcb0i9ju3Ai283cZAo6QWM91s7pPaPwIaQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFY12IH4wqfAXqv3XlLmBbkRek9z3ziw+NgSev2h0oqLGB8ToK4Wa6zv+xycuD2DuJ6951U
X-Received: by 2002:a05:620a:468a:b0:7ce:d0cf:6213 with SMTP id af79cd13be357-7d0a1f91363mr1982167085a.3.1748878965622;
        Mon, 02 Jun 2025 08:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748878965; cv=none;
        d=google.com; s=arc-20240605;
        b=R0xm6TE6d6BLB/Rp6rWeVMBj1wH3CqMN4T0QDIgH6IICryM1pgVQDmht30SrBJbZKy
         pOJE0aXrrY55N3n+s35zFliyyRiByEUsHWzqkZoBcta+nVlrCnjBdq73jb4w2vUt9+4e
         qtLIeDf//kocUMMjumYkOgSkMH21wrYhzM8xpjmrn/iOH/tvOkk6aSvNEpzHLxP/R5LM
         wL6dk7gMwGV59Ml8EwKxb/VPwpDqgqOD3F5Mf9G3dKTvq+CVaBtYljJz2AmRTUT43v6b
         cNFZu0Zmh6864EyYS6YHaSDQHGbHVfQZsYNe1O/HvUuQZUJGHER2nXJ+tzn2ikZvS0hV
         hLKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=hb22Q56Rb3nhYwouoq9bmZ0y2AbXKSGVo9PS0aKf0Ho=;
        fh=PnSw404jJ+s1m+rSaKsD+X9lt69JOcV3ATg/BWbrXZg=;
        b=P35ZJr+26Qnu5nmiKW47ZoDuMYgsXGZr0Nlc3QaUVkz/6MJSe/iU6WMJdgNdAc/h7C
         jp92uK8HSJCTkGBWhC+nwYrByQw09cNbQiav5gs8wfGTwSM+n3uMQSqgI3/f0w25dimL
         edgDUJBF1xjVUpRMdYI6Gj7fKi45nzCMYxp+ro9T7Sie3xGfOMrNKx/QXAKUG1HKEWBu
         3XO3cmAe+orQjBQ2C7Gj+4mFO82ZnVBFxdg9PxxMHtFHyU4/1wlNIQp8w6Y03nRlfFBK
         bS5Ooey2DgZ55ENGAnQdh7j2tMspbhzDie36QJuvoQl/4FtlDl8UzpUeTSipszLZKeDn
         SWGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d09a30707bsi1035859085a.586.2025.06.02.08.42.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Jun 2025 08:42:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uM7J2-00031h-OE; Mon, 02 Jun 2025 11:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uM7J0-00030z-4h; Mon, 02 Jun 2025 11:42:30 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uM7Iy-0003IX-23; Mon, 02 Jun 2025 11:42:29 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b9yfs4wPCz6DKxd;
 Mon,  2 Jun 2025 23:38:29 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 4C76D14027A;
 Mon,  2 Jun 2025 23:42:19 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Jun 2025 17:42:11 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [PATCH v3 3/6] hw/arm/virt-acpi-build: Update IORT for multiple
 smmuv3 devices
Date: Mon, 2 Jun 2025 16:41:07 +0100
Message-ID: <20250602154110.48392-4-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250602154110.48392-1-shameerali.kolothum.thodi@huawei.com>
References: <20250602154110.48392-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
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
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: 1w7mJxnAJKye

With the soon to be introduced user-creatable SMMUv3 devices for
virt, it is possible to have multiple SMMUv3 devices associated
with different PCIe root complexes.

Update IORT nodes accordingly.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt-acpi-build.c | 54 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index bd26853ef6..b4ff71b8b7 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -43,6 +43,7 @@
 #include "hw/acpi/generic_event_device.h"
 #include "hw/acpi/tpm.h"
 #include "hw/acpi/hmat.h"
+#include "hw/arm/smmuv3.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
@@ -288,6 +289,54 @@ get_smmuv3_legacy_dev(VirtMachineState *vms, void *opaque)
     g_array_append_val(sdev_blob, sdev);
 }
 
+static int smmuv3_dev_idmap_compare(gconstpointer a, gconstpointer b)
+{
+    AcpiIortSMMUv3Dev *sdev_a = (AcpiIortSMMUv3Dev *)a;
+    AcpiIortSMMUv3Dev *sdev_b = (AcpiIortSMMUv3Dev *)b;
+    AcpiIortIdMapping *map_a = &g_array_index(sdev_a->idmaps,
+                                              AcpiIortIdMapping, 0);
+    AcpiIortIdMapping *map_b = &g_array_index(sdev_b->idmaps,
+                                              AcpiIortIdMapping, 0);
+    return map_a->input_base - map_b->input_base;
+}
+
+static int get_smmuv3_devices(Object *obj, void *opaque)
+{
+    VirtMachineState *vms = VIRT_MACHINE(qdev_get_machine());
+    GArray *sdev_blob = opaque;
+    AcpiIortIdMapping idmap;
+    PlatformBusDevice *pbus;
+    AcpiIortSMMUv3Dev sdev;
+    int min_bus, max_bus;
+    SysBusDevice *sbdev;
+    PCIBus *bus;
+
+    if (!object_dynamic_cast(obj, TYPE_ARM_SMMUV3)) {
+        return 0;
+    }
+
+    bus = PCI_BUS(object_property_get_link(obj, "primary-bus", &error_abort));
+    if (!bus) {
+        return 0;
+    }
+
+    pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
+    sbdev = SYS_BUS_DEVICE(obj);
+    sdev.base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
+    sdev.base += vms->memmap[VIRT_PLATFORM_BUS].base;
+    sdev.irq = platform_bus_get_irqn(pbus, sbdev, 0);
+    sdev.irq += vms->irqmap[VIRT_PLATFORM_BUS];
+    sdev.irq += ARM_SPI_BASE;
+
+    pci_bus_range(bus, &min_bus, &max_bus);
+    sdev.idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
+    idmap.input_base = min_bus << 8,
+    idmap.id_count = (max_bus - min_bus + 1) << 8,
+    g_array_append_val(sdev.idmaps, idmap);
+    g_array_append_val(sdev_blob, sdev);
+    return 0;
+}
+
 /*
  * Input Output Remapping Table (IORT)
  * Conforms to "IO Remapping Table System Software on ARM Platforms",
@@ -319,6 +368,11 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
          */
         sdev = &g_array_index(smmuv3_devs, AcpiIortSMMUv3Dev, 0);
         g_array_sort(sdev->idmaps, iort_idmap_compare);
+    } else {
+        object_child_foreach_recursive(object_get_root(),
+                                       get_smmuv3_devices, smmuv3_devs);
+        /* Sort the smmuv3 devices(if any) by smmu idmap input_base */
+        g_array_sort(smmuv3_devs, smmuv3_dev_idmap_compare);
     }
 
     num_smmus = smmuv3_devs->len;
-- 
2.34.1

