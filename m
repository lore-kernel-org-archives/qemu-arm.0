Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp367510lfg;
        Wed, 24 Mar 2021 06:19:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrpW2zn8gIX2dE2FPb9S+mDblRbEbuRCS2vP0nlbtpURM8JxdPCEymwLVtcUiByWT7M2zV
X-Received: by 2002:a02:a889:: with SMTP id l9mr2856488jam.1.1616591971699;
        Wed, 24 Mar 2021 06:19:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616591971; cv=none;
        d=google.com; s=arc-20160816;
        b=NOO05xE8/6AVabuWYLLwZNOhTeHeJ5UBp26GFqe0TsiyIn3Wr13IjFPBkp4gY934f5
         Icl3aVQ9n/SOx8QVcUaFGoPHx3eeAGekPqs0/ChGtmY2wbailzs4W3phzhBU9LpNFynE
         ayhgF4oFVkfNbBLaUD6lrXXiX5O7AYwgXTHSwYaFtOnzi8gtXZU/KjufSeYrMqrDEkF1
         G40bWygJMeJuR0DSKc/z2a34TeSo4k+6QLtcM7NdNS3tqANbbV+4JNfeeVTG5j0yLwJi
         DEj+utDm2vejy3rVWAwEfBcVe3kQfob4tgaZPZy0AZdTNe9Peot/2WQsi51J1WCCTqUk
         Gl1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=A1Zj8P19H+yChMTzcC76vcpUH5NnHhdi1HvwX3pCxtE=;
        b=HkYiQuUApK41cwMC7u4zkd+Gdm/3FWFYq6x0v30YQ1FBEZBh+EbsPTSOOo+5pSbuJs
         VFdHboohGeGcisEJg/hP9wEizyJTPLSi4ZKq/FYEy2z4/7JV0CfG2gCI07mhY69PjamU
         NBVwfNdMHmUC7eGPfz3SM9Yf/LqNt9Faut0Tu6jZbERiwprd4YxLqLDuPlo1aYTy7Fj2
         f1pc0cNRLZPFsnQzr1eg3X9HRhpbqp1PEkOx8jkrz6XNO+u2o/XtXMbyuqw5uvZ2h+ZR
         BvEJ2PM6z737PlrlILofvB+6OAVmAFWnBYrBdY9g81GRBNThzhw0bf/NYFCqTHOmBH22
         y1Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m16si1606336ilq.58.2021.03.24.06.19.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Mar 2021 06:19:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:40410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lP3Q2-0000Kq-S7
	for alex.bennee@linaro.org; Wed, 24 Mar 2021 09:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lP3Nn-0006XT-Hj; Wed, 24 Mar 2021 09:17:11 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lP3Nj-0005WZ-RS; Wed, 24 Mar 2021 09:17:11 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F57xG2B6yzPlqJ;
 Wed, 24 Mar 2021 21:14:26 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.498.0; Wed, 24 Mar 2021
 21:16:47 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>
Subject: [PATCH RFC v2 2/6] hw/pci: Add iommu option for pci root bus
Date: Wed, 24 Mar 2021 13:16:31 +0000
Message-ID: <1616591795-2056-3-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1616591795-2056-1-git-send-email-wangxingang5@huawei.com>
References: <1616591795-2056-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=wangxingang5@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, cenjiahui@huawei.com,
 ehabkost@redhat.com, mst@redhat.com, richard.henderson@linaro.org,
 shannon.zhaosl@gmail.com, pbonzini@redhat.com, imammedo@redhat.com,
 wangxingang5@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 19vHmTv14D77

From: Xingang Wang <wangxingang5@huawei.com>

This add iommu option for pci root bus, including primary bus
and pxb root bus. The option is valid only if there is a virtual
iommu device.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/arm/virt.c                       | 25 +++++++++++++++++++++++++
 hw/i386/pc.c                        | 19 +++++++++++++++++++
 hw/pci-bridge/pci_expander_bridge.c |  3 +++
 hw/pci-host/q35.c                   |  1 +
 include/hw/arm/virt.h               |  1 +
 include/hw/i386/pc.h                |  1 +
 6 files changed, 50 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index aa2bbd14e0..446b3b867f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1366,6 +1366,7 @@ static void create_pcie(VirtMachineState *vms)
     }
 
     pci = PCI_HOST_BRIDGE(dev);
+    pci->iommu = vms->primary_bus_iommu;
     vms->bus = pci->bus;
     if (vms->bus) {
         for (i = 0; i < nb_nics; i++) {
@@ -2319,6 +2320,20 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
     }
 }
 
+static bool virt_get_primary_bus_iommu(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->primary_bus_iommu;
+}
+
+static void virt_set_primary_bus_iommu(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->primary_bus_iommu = value;
+}
+
 static CpuInstanceProperties
 virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 {
@@ -2652,6 +2667,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set the IOMMU type. "
                                           "Valid values are none and smmuv3");
 
+    object_class_property_add_bool(oc, "primary_bus_iommu",
+                                  virt_get_primary_bus_iommu,
+                                  virt_set_primary_bus_iommu);
+    object_class_property_set_description(oc, "primary_bus_iommu",
+                                          "Set on/off to enable/disable "
+                                          "iommu for primary bus");
+
     object_class_property_add_bool(oc, "ras", virt_get_ras,
                                    virt_set_ras);
     object_class_property_set_description(oc, "ras",
@@ -2719,6 +2741,9 @@ static void virt_instance_init(Object *obj)
     /* Default disallows iommu instantiation */
     vms->iommu = VIRT_IOMMU_NONE;
 
+    /* The primary bus is attached to iommu by default */
+    vms->primary_bus_iommu = true;
+
     /* Default disallows RAS instantiation */
     vms->ras = false;
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 410db9ef96..3426cd9c3f 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1531,6 +1531,21 @@ static void pc_machine_set_hpet(Object *obj, bool value, Error **errp)
     pcms->hpet_enabled = value;
 }
 
+static bool pc_machine_get_primary_bus_iommu(Object *obj, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    return pcms->primary_bus_iommu;
+}
+
+static void pc_machine_set_primary_bus_iommu(Object *obj, bool value,
+                                             Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    pcms->primary_bus_iommu = value;
+}
+
 static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
                                             const char *name, void *opaque,
                                             Error **errp)
@@ -1675,6 +1690,7 @@ static void pc_machine_initfn(Object *obj)
 #ifdef CONFIG_HPET
     pcms->hpet_enabled = true;
 #endif
+    pcms->primary_bus_iommu = true;
 
     pc_system_flash_create(pcms);
     pcms->pcspk = isa_new(TYPE_PC_SPEAKER);
@@ -1799,6 +1815,9 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_add_bool(oc, "hpet",
         pc_machine_get_hpet, pc_machine_set_hpet);
 
+    object_class_property_add_bool(oc, "primary_bus_iommu",
+        pc_machine_get_primary_bus_iommu, pc_machine_set_primary_bus_iommu);
+
     object_class_property_add(oc, PC_MACHINE_MAX_FW_SIZE, "size",
         pc_machine_get_max_fw_size, pc_machine_set_max_fw_size,
         NULL, NULL);
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index aedded1064..f1a0eadc03 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -57,6 +57,7 @@ struct PXBDev {
 
     uint8_t bus_nr;
     uint16_t numa_node;
+    bool iommu;
 };
 
 static PXBDev *convert_to_pxb(PCIDevice *dev)
@@ -255,6 +256,7 @@ static void pxb_dev_realize_common(PCIDevice *dev, bool pcie, Error **errp)
     bus->map_irq = pxb_map_irq_fn;
 
     PCI_HOST_BRIDGE(ds)->bus = bus;
+    PCI_HOST_BRIDGE(ds)->iommu = pxb->iommu;
 
     pxb_register_bus(dev, bus, &local_err);
     if (local_err) {
@@ -301,6 +303,7 @@ static Property pxb_dev_properties[] = {
     /* Note: 0 is not a legal PXB bus number. */
     DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
     DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node, NUMA_NODE_UNASSIGNED),
+    DEFINE_PROP_BOOL("iommu", PXBDev, iommu, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 2eb729dff5..3b23fd0975 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -64,6 +64,7 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
                                 s->mch.address_space_io,
                                 0, TYPE_PCIE_BUS);
     PC_MACHINE(qdev_get_machine())->bus = pci->bus;
+    pci->iommu = PC_MACHINE(qdev_get_machine())->primary_bus_iommu;
     qdev_realize(DEVICE(&s->mch), BUS(pci->bus), &error_fatal);
 }
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 921416f918..1fbb19710f 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -147,6 +147,7 @@ struct VirtMachineState {
     OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
+    bool primary_bus_iommu;
     VirtMSIControllerType msi_controller;
     uint16_t virtio_iommu_bdf;
     struct arm_boot_info bootinfo;
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index d4c3d73c11..61137b3bd8 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -45,6 +45,7 @@ typedef struct PCMachineState {
     bool sata_enabled;
     bool pit_enabled;
     bool hpet_enabled;
+    bool primary_bus_iommu;
     uint64_t max_fw_size;
     char *oem_id;
     char *oem_table_id;
-- 
2.19.1

