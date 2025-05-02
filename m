Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp745001njj;
        Fri, 2 May 2025 03:28:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVd90xpwEsRFP6pyi7ZmnyzRBJXwwK9E5P84HWPYrG3RPzfZB53b8uO9AjzcHnpKq9jZBMA3d4H+9HPOA==@linaro.org
X-Google-Smtp-Source: AGHT+IHr2NPPW2KgfqREeK/NjZ4W1NEbaLdzIVKaYTdvqzwrXEVtEeYoem/dROLxSo+6mRg3NEWs
X-Received: by 2002:a05:622a:6117:b0:475:19cc:a81a with SMTP id d75a77b69052e-48b1c0f9d99mr92965101cf.21.1746181719140;
        Fri, 02 May 2025 03:28:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746181719; cv=none;
        d=google.com; s=arc-20240605;
        b=RgASJz8pLvtvhucA14SokL4khBBVUNffooHV0TpEX7WowUQvkP7aadzvYJhCfrj7Zb
         cAEX3VMMXnlgdVmtz8D4H/Av1aKVFv+2R3U83Knqec2LPhRReoYDnnqSI8TdyIAmAbt5
         EvHASbzWalhKBnEJtRjhgd//yqlUvTxwIK3zJ7Hhm+4mGyOLPd1ceWiMpIpRpbUvN3yz
         i18b4VnkAIrav9+IxMfT8yvy9sprDZRRm5yGdphXr5AlXrBk1U20/zlB1Lc2IB93qvN5
         UW/Ni/SFrek/d1f6Gyk2XIllAX+BAt/0M2RjbW+IyInmP1+EY0LZNdZq0+vr5Z8ZwHxO
         aPcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=83TCblF6Uoe8FE9wnoVdW39lIrBeesfYzX9hwCUrtWc=;
        fh=PnSw404jJ+s1m+rSaKsD+X9lt69JOcV3ATg/BWbrXZg=;
        b=e2pvLVIZaO/tPgG4UHeySkjUQrq82plWE1WaCQrshOFHYJYWzOC8JS+SF6Fhoko4W5
         MDwKkvgChQ1lphVqbbJmS3uHvk50Fb83xTPV0nJWAxfiQYIPeaK/c+z8LyGcdep4nbOJ
         YTQPt69s33H1LjdnaPNfJr8r4dr1i/AeHFvj4+/X68Piu9eDiRwAhtjGgZdQvt1Gai3Z
         BiUScwlEjln15VFCoQKi0e/irUVxBFnkiYCz7rDXTOnC1YD8OnfhBezDd8VCoJqPmGNb
         /WV2JsHz73DgtsXYguPlGOYz46p1RThfLObCIf6QZEPPv/i8PhfXD+BN541HrL/DOTrm
         UFsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-48b98246dd9si26663121cf.270.2025.05.02.03.28.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 May 2025 03:28:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uAndG-0000RO-DN; Fri, 02 May 2025 06:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uAncy-0000DC-U0; Fri, 02 May 2025 06:28:22 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uAncu-00029B-KU; Fri, 02 May 2025 06:28:19 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Zpn8414Bwz67DpL;
 Fri,  2 May 2025 18:23:48 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id DA3E61402A4;
 Fri,  2 May 2025 18:28:10 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 May 2025 12:28:03 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [PATCH v2 5/6] hw/arm/virt: Add support for smmuv3 device
Date: Fri, 2 May 2025 11:27:06 +0100
Message-ID: <20250502102707.110516-6-shameerali.kolothum.thodi@huawei.com>
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
X-TUID: iRN000E/7Qgi

Allow cold-plug of smmuv3 device to virt if there is no machine
wide legacy smmuv3 or a virtio-iommu is specified.

Device tree support for new smmuv3 dev is limited to the case where
it is associated with the default pcie.0 RC.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt.c        | 48 ++++++++++++++++++++++++++++++++++++++++++++
 hw/core/sysbus-fdt.c |  3 +++
 2 files changed, 51 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e178282d71..f6ff584bac 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1449,6 +1449,31 @@ static void create_smmuv3_dt_bindings(const VirtMachineState *vms, hwaddr base,
     g_free(node);
 }
 
+static void create_smmuv3_dev_dtb(VirtMachineState *vms,
+                                  DeviceState *dev)
+{
+    PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
+    SysBusDevice *sbdev = SYS_BUS_DEVICE(dev);
+    int irq = platform_bus_get_irqn(pbus, sbdev, 0);
+    hwaddr base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
+    MachineState *ms = MACHINE(vms);
+    PCIBus *bus;
+
+    bus = PCI_BUS(object_property_get_link(OBJECT(dev), "primary-bus",
+                                           &error_abort));
+    if (strcmp("pcie.0", bus->qbus.name)) {
+        warn_report("SMMUv3 device only supported with pcie.0 for DT");
+        return;
+    }
+    base += vms->memmap[VIRT_PLATFORM_BUS].base;
+    irq += vms->irqmap[VIRT_PLATFORM_BUS];
+
+    vms->iommu_phandle = qemu_fdt_alloc_phandle(ms->fdt);
+    create_smmuv3_dt_bindings(vms, base, SMMU_IO_LEN, irq);
+    qemu_fdt_setprop_cells(ms->fdt, vms->pciehb_nodename, "iommu-map",
+                           0x0, vms->iommu_phandle, 0x0, 0x10000);
+}
+
 static void create_smmu(const VirtMachineState *vms,
                         PCIBus *bus)
 {
@@ -2949,6 +2974,13 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
         qlist_append_str(reserved_regions, resv_prop_str);
         qdev_prop_set_array(dev, "reserved-regions", reserved_regions);
         g_free(resv_prop_str);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_ARM_SMMUV3)) {
+        if (vms->legacy_smmuv3_present || vms->iommu == VIRT_IOMMU_VIRTIO) {
+            error_setg(errp, "virt machine already has %s set. "
+                       "Doesn't support incompatible iommus",
+                       (vms->legacy_smmuv3_present) ?
+                       "iommu=smmuv3" : "virtio-iommu");
+        }
     }
 }
 
@@ -2972,6 +3004,21 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
         virtio_md_pci_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
     }
 
+    if (object_dynamic_cast(OBJECT(dev), TYPE_ARM_SMMUV3)) {
+        if (!vms->legacy_smmuv3_present && vms->platform_bus_dev) {
+            VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
+
+            create_smmuv3_dev_dtb(vms, dev);
+            if (vms->iommu != VIRT_IOMMU_SMMUV3) {
+                vms->iommu = VIRT_IOMMU_SMMUV3;
+            }
+            if (!vmc->no_nested_smmu) {
+                object_property_set_str(OBJECT(dev), "stage", "nested",
+                                        &error_fatal);
+            }
+        }
+    }
+
     if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
         PCIDevice *pdev = PCI_DEVICE(dev);
 
@@ -3174,6 +3221,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_UEFI_VARS_SYSBUS);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_ARM_SMMUV3);
 #ifdef CONFIG_TPM
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
 #endif
diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
index c339a27875..d778c0f559 100644
--- a/hw/core/sysbus-fdt.c
+++ b/hw/core/sysbus-fdt.c
@@ -31,6 +31,7 @@
 #include "qemu/error-report.h"
 #include "system/device_tree.h"
 #include "system/tpm.h"
+#include "hw/arm/smmuv3.h"
 #include "hw/platform-bus.h"
 #include "hw/vfio/vfio-platform.h"
 #include "hw/vfio/vfio-calxeda-xgmac.h"
@@ -513,6 +514,8 @@ static const BindingEntry bindings[] = {
 #ifdef CONFIG_LINUX
     TYPE_BINDING(TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node),
     TYPE_BINDING(TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node),
+    /* No generic DT support for smmuv3 dev. Support added for arm virt only */
+    TYPE_BINDING(TYPE_ARM_SMMUV3, no_fdt_node),
     VFIO_PLATFORM_BINDING("amd,xgbe-seattle-v1a", add_amd_xgbe_fdt_node),
 #endif
 #ifdef CONFIG_TPM
-- 
2.34.1

