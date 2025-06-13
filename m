Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp307060njc;
        Fri, 13 Jun 2025 07:47:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX5MKdyGrxWjVLNoThWSxHDqTZ18XjV3OxdWq0VZecv9PXZEPgMCv/+vnn4sIrml5gdD0rSobKNPN2pVg==@linaro.org
X-Google-Smtp-Source: AGHT+IFbpEHK2o3BQj7VURRw7hqRIxRzyIxRz5s8y4KlGrIA5gc3vB96jJjVIZHYUy5/K27M/IKB
X-Received: by 2002:a05:622a:1b0b:b0:4a4:2d36:51cc with SMTP id d75a77b69052e-4a72fec0162mr57653271cf.14.1749826027065;
        Fri, 13 Jun 2025 07:47:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749826027; cv=none;
        d=google.com; s=arc-20240605;
        b=PvZTWSnBWLSTbKS3YLRmwRrlOwbYjFsGjGP123CFkI1YpUsyNkbvXw9baMkXcyKqj9
         6yggCcDUyiIl8ohZPbKiSxnmPVvWi1oZI+8w6GuyNaxcqkQFESBnOO56YLxr1jS6x0e9
         JeiFlMjAd6pH2H14NI3mnQeXI3lvYXjHB+DJN8TZWI+ebtyxam0J8LW6Ekc5f/dKDTOp
         RwBkzBgz0PaVdr/+KKZWYNfObDPj29+g8U1czJYP+wVvk2Mu6G2mUWkvK9erz3LJAUwC
         PgvVwuYYsvn80Lu2yusgJA24vZxIbx3eXwJD4lZoJw/iTiFaJVOqdD5fzuL3MsxCxHAp
         hSpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=1EU3BajO+bFoJqj1zBm2XSyroBaR15C/dV3IKpMBih8=;
        fh=12ij1D0xizeHJ+1WEqwo/9QFN2xwslWS8h/2oI6OPA8=;
        b=IlMSJzPnF0EDqusbEoEh5vyU845aMRBV4pRzXfZ7jv0viIUFULPXOyJRHbUjW46klF
         ubEalLm4KBEev2wPfTI9WyXUOKqdMkHD4tbNYhV4PIO9lKCub/ky0e/BIMtOXQDwknhv
         5JHMGqCiGIRDL9hcLT3MgoN3OVAxm8Z79wIr1iRp+olP7jddmNjRAth919njyH1bccsH
         7+/oqje4EEWPguTFezMSFf3WupqKYC3as4moHOsWmfYsp5Gir0KZZXA941Z9VhxZCAy+
         yHhqDgIzKvZJWbp7sSTholMKqL/1paTc7AXDAXT0acuyfXVzQgOWDdEOwJY4h/p8/6A3
         YaBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a4b19f0si31802811cf.313.2025.06.13.07.47.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jun 2025 07:47:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uQ5g3-0007sd-QU; Fri, 13 Jun 2025 10:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uQ5g2-0007qo-3c; Fri, 13 Jun 2025 10:46:42 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uQ5g0-0006i6-EF; Fri, 13 Jun 2025 10:46:41 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bJhzM1Wdmz6M4dc;
 Fri, 13 Jun 2025 22:46:07 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 80D14140393;
 Fri, 13 Jun 2025 22:46:34 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Jun 2025 16:46:26 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <imammedo@redhat.com>, <nathanc@nvidia.com>, <mochs@nvidia.com>,
 <smostafa@google.com>, <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <zhangfei.gao@linaro.org>
Subject: [PATCH v4 3/7] hw/arm/virt-acpi-build: Update IORT for multiple
 smmuv3 devices
Date: Fri, 13 Jun 2025 15:44:45 +0100
Message-ID: <20250613144449.60156-4-shameerali.kolothum.thodi@huawei.com>
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
X-TUID: S25la2g/gLuu

With the soon to be introduced user-creatable SMMUv3 devices for
virt, it is possible to have multiple SMMUv3 devices associated
with different PCIe root complexes.

Update IORT nodes accordingly.

An example IORT Id mappings for a Qemu virt machine with two
PCIe Root Complexes each assocaited with a SMMUv3 will
be something like below,

  -device arm-smmuv3,primary-bus=pcie.0,id=smmuv3.0
  -device arm-smmuv3,primary-bus=pcie.1,id=smmuv3.1
  ...

  +--------------------+           +--------------------+
  |   Root Complex 0   |           |   Root Complex 1   |
  |                    |           |                    |
  |  Requestor IDs     |           |  Requestor IDs     |
  |  0x0000 - 0x00FF   |           |  0x0100 - 0x01FF   |
  +---------+----------+           +---------+----------+
            |                               |
            |                               |
            |       Stream ID Mapping       |
            v                               v
  +--------------------+          +--------------------+
  |    SMMUv3 Node 0   |          |    SMMUv3 Node 1   |
  |                    |          |                    |
  | Stream IDs 0x0000- |          | Stream IDs 0x0100- |
  | 0x00FF mapped from |          | 0x01FF mapped from |
  | RC0 Requestor IDs  |          | RC1 Requestor IDs  |
  +--------------------+          +--------------------+
            |                                |
            |                                |
            +----------------+---------------+
                             |
                             |Device ID Mapping
                             v
              +----------------------------+
              |       ITS Node 0           |
              |                            |
              | Device IDs:                |
              | 0x0000 - 0x00FF (from RC0) |
              | 0x0100 - 0x01FF (from RC1) |
              | 0x0200 - 0xFFFF (No SMMU)  |
              +----------------------------+

Tested-by: Nathan Chen <nathanc@nvidia.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt-acpi-build.c | 55 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index d39506179a..72b79100ce 100644
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
@@ -296,6 +297,58 @@ populate_smmuv3_legacy_dev(GArray *sdev_blob)
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
+static int iort_smmuv3_devices(Object *obj, void *opaque)
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
+static void populate_smmuv3_dev(GArray *sdev_blob)
+{
+    object_child_foreach_recursive(object_get_root(),
+                                   iort_smmuv3_devices, sdev_blob);
+    /* Sort the smmuv3 devices(if any) by smmu idmap input_base */
+    g_array_sort(sdev_blob, smmuv3_dev_idmap_compare);
+}
+
 /*
  * Input Output Remapping Table (IORT)
  * Conforms to "IO Remapping Table System Software on ARM Platforms",
@@ -320,6 +373,8 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     nb_nodes = 2; /* RC, ITS */
     if (vms->legacy_smmuv3_present) {
         populate_smmuv3_legacy_dev(smmuv3_devs);
+    } else {
+        populate_smmuv3_dev(smmuv3_devs);
     }
 
     num_smmus = smmuv3_devs->len;
-- 
2.47.0

