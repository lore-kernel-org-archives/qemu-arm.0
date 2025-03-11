Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1885020njc;
        Tue, 11 Mar 2025 07:16:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/axadnn2eLBWSyS3k9CJHBxlud2J8iF4+PSRVzw7L8s9QOfMrAZqHRoiBXJdo1tWImb8qKMyQFypgog==@linaro.org
X-Google-Smtp-Source: AGHT+IGDIPKmvmRAZdnEXq/Gjn0EH+7strUnh0z4vFd2PbxhneVVA+gswBMPJqFQZFgXSgZ0LN35
X-Received: by 2002:a05:6000:2c7:b0:38f:451b:653c with SMTP id ffacd0b85a97d-39132d77a3bmr11147083f8f.7.1741702583319;
        Tue, 11 Mar 2025 07:16:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741702583; cv=none;
        d=google.com; s=arc-20240605;
        b=Qq8cJd1zdwfZjGPkuuGSIBsXEqBJmZ5cF5gpaDXh3Rz1eZiITsLOCkAPErf/fEp6bL
         XlclshXF1d04MUgwOUez6AMsUe8PGufgk2I4Ic4IwMQQ5v6tnnAOCrCASF+7dB6s1wMx
         Vz7+exHnV6QWJDxUsawjd5oNTU5hp0cGde2Cj4v7Dy5gFRF+K8vs9k2mF5petQjw/DfJ
         a4gb97PKZat8eoB5QZ6F+85yTHg9KzbCAK28g89be0jVBsumMtCJNZTBDKauXZ/50sdY
         cEt1l7AiT2s2crQwjt0nqyynm0EC9Vd5RR0zDGh6M762fR3rEaOaU6bTQvz4/V+66twQ
         2KhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=V+M/yDx9N2sYsh5+HxsTqs7QHJDX8m5rj1i79V2AmEk=;
        fh=PnSw404jJ+s1m+rSaKsD+X9lt69JOcV3ATg/BWbrXZg=;
        b=L5THy0hihImpNohXr1joQuD65ao54qUx+Q6AUSdg5R+uSzrS7zGSa+Ms1jmzCAUhu0
         CNtqzmuUe8EZTOzZ26aKPpSB1CZRhBy9p5g9SYuc+J4nU7rKcPLnstIeKMdcjehxtLwO
         iJnak7TfkL+tzvjjKVfweHXQq/d7MFeVn2fhQOMlNZdBBSpa2H7W41Y4kTEw3L4JEfzw
         87Ha3kf7JQ3MNi0UYtYxeVzFbWeo6zXdp24k7tnG382L07t9RMFfGbgXCuOxYaKZir7Z
         Usc2Haasn3GbgtmFda8kHnpMjxg5MjDOoglGdvroVBM5B5RFdOOBTV155Vqn+k8LFVhW
         F3ng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3912bfdaee4si8871834f8f.38.2025.03.11.07.16.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 07:16:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ts0OI-0002wE-14; Tue, 11 Mar 2025 10:15:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0Nm-0002UM-AR; Tue, 11 Mar 2025 10:15:05 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0Nj-0007IC-5O; Tue, 11 Mar 2025 10:14:58 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZBwg63KRZz6D9ln;
 Tue, 11 Mar 2025 22:11:46 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 526471404F5;
 Tue, 11 Mar 2025 22:14:53 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Mar 2025 15:14:46 +0100
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [RFC PATCH v2 19/20] hw/arm/virt-acpi-build: Update IORT with
 multiple smmuv3-accel nodes
Date: Tue, 11 Mar 2025 14:10:44 +0000
Message-ID: <20250311141045.66620-20-shameerali.kolothum.thodi@huawei.com>
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
X-TUID: 3cwI2ZmadcVI

Now that we can have multiple user-creatable smmuv3-accel devices,
each associated with different pci buses, update IORT ID mappings
accordingly.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt-acpi-build.c | 113 +++++++++++++++++++++++++++++++++------
 1 file changed, 97 insertions(+), 16 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3ac8f8e178..c232850e36 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -43,6 +43,7 @@
 #include "hw/acpi/generic_event_device.h"
 #include "hw/acpi/tpm.h"
 #include "hw/acpi/hmat.h"
+#include "hw/arm/smmuv3-accel.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
@@ -233,6 +234,51 @@ struct AcpiIortIdMapping {
 };
 typedef struct AcpiIortIdMapping AcpiIortIdMapping;
 
+struct SMMUv3Accel {
+    int irq;
+    hwaddr base;
+    AcpiIortIdMapping smmu_idmap;
+};
+typedef struct SMMUv3Accel SMMUv3Accel;
+
+static int smmuv3_accel_idmap_compare(gconstpointer a, gconstpointer b)
+{
+    SMMUv3Accel *accel_a = (SMMUv3Accel *)a;
+    SMMUv3Accel *accel_b = (SMMUv3Accel *)b;
+
+    return accel_a->smmu_idmap.input_base - accel_b->smmu_idmap.input_base;
+}
+
+static int get_smmuv3_accel(Object *obj, void *opaque)
+{
+    GArray *s_accel_blob = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_ARM_SMMUV3_ACCEL)) {
+        PCIBus *bus = (PCIBus *) object_property_get_link(obj, "primary-bus",
+                                                          &error_abort);
+        if (bus && !pci_bus_bypass_iommu(bus)) {
+            SMMUv3Accel accel;
+            int min_bus, max_bus;
+            VirtMachineState *v = VIRT_MACHINE(qdev_get_machine());
+            PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(v->platform_bus_dev);
+            SysBusDevice *sbdev = SYS_BUS_DEVICE(obj);
+            hwaddr base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
+            int irq = platform_bus_get_irqn(pbus, sbdev, 0);
+
+            base += v->memmap[VIRT_PLATFORM_BUS].base;
+            irq += v->irqmap[VIRT_PLATFORM_BUS];
+
+            pci_bus_range(bus, &min_bus, &max_bus);
+            accel.smmu_idmap.input_base = min_bus << 8;
+            accel.smmu_idmap.id_count = (max_bus - min_bus + 1) << 8;
+            accel.base = base;
+            accel.irq = irq + ARM_SPI_BASE;
+            g_array_append_val(s_accel_blob, accel);
+        }
+    }
+    return 0;
+}
+
 /* Build the iort ID mapping to SMMUv3 for a given PCI host bridge */
 static int
 iort_host_bridges(Object *obj, void *opaque)
@@ -275,30 +321,51 @@ static void
 build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     int i, nb_nodes, rc_mapping_count;
-    size_t node_size, smmu_offset = 0;
+    size_t node_size, *smmu_offset = NULL;
     AcpiIortIdMapping *idmap;
+    SMMUv3Accel *accel;
+    int num_smmus = 0;
     uint32_t id = 0;
     GArray *smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
     GArray *its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
+    GArray *smmuv3_accel = g_array_new(false, true, sizeof(SMMUv3Accel));
 
     AcpiTable table = { .sig = "IORT", .rev = 3, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
     /* Table 2 The IORT */
     acpi_table_begin(&table, table_data);
 
-    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
-        AcpiIortIdMapping next_range = {0};
-
+    nb_nodes = 2; /* RC, ITS */
+    if (vms->iommu == VIRT_IOMMU_SMMUV3_ACCEL) {
+        object_child_foreach_recursive(object_get_root(),
+                                       get_smmuv3_accel, smmuv3_accel);
+        /* Sort the smmuv3-accel by smmu idmap input_base */
+        g_array_sort(smmuv3_accel, smmuv3_accel_idmap_compare);
+
+        /*  Fill smmu idmap from sorted accel array */
+        for (i = 0; i < smmuv3_accel->len; i++) {
+            accel = &g_array_index(smmuv3_accel, SMMUv3Accel, i);
+            g_array_append_val(smmu_idmaps, accel->smmu_idmap);
+        }
+        num_smmus = smmuv3_accel->len;
+    } else if (vms->iommu == VIRT_IOMMU_SMMUV3) {
         object_child_foreach_recursive(object_get_root(),
                                        iort_host_bridges, smmu_idmaps);
 
         /* Sort the smmu idmap by input_base */
         g_array_sort(smmu_idmaps, iort_idmap_compare);
+        num_smmus = 1;
+    }
 
-        /*
-         * Split the whole RIDs by mapping from RC to SMMU,
-         * build the ID mapping from RC to ITS directly.
-         */
+    /*
+     * Split the whole RIDs by mapping from RC to SMMU,
+     * build the ID mapping from RC to ITS directly.
+     */
+    if (num_smmus) {
+        AcpiIortIdMapping next_range = {0};
+
+        smmu_offset = g_new0(size_t, num_smmus);
+        nb_nodes += num_smmus;
         for (i = 0; i < smmu_idmaps->len; i++) {
             idmap = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
 
@@ -316,10 +383,8 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
             g_array_append_val(its_idmaps, next_range);
         }
 
-        nb_nodes = 3; /* RC, ITS, SMMUv3 */
         rc_mapping_count = smmu_idmaps->len + its_idmaps->len;
     } else {
-        nb_nodes = 2; /* RC, ITS */
         rc_mapping_count = 1;
     }
     /* Number of IORT Nodes */
@@ -341,10 +406,19 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     /* GIC ITS Identifier Array */
     build_append_int_noprefix(table_data, 0 /* MADT translation_id */, 4);
 
-    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
-        int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
+    for (i = 0; i < num_smmus; i++) {
+        hwaddr base;
+        int irq;
+        if (vms->iommu == VIRT_IOMMU_SMMUV3_ACCEL) {
+            accel = &g_array_index(smmuv3_accel, SMMUv3Accel, i);
+            base = accel->base;
+            irq = accel->irq;
+        } else {
+            base = vms->memmap[VIRT_SMMU].base;
+            irq = vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
+        }
 
-        smmu_offset = table_data->len - table.table_offset;
+        smmu_offset[i] = table_data->len - table.table_offset;
         /* Table 9 SMMUv3 Format */
         build_append_int_noprefix(table_data, 4 /* SMMUv3 */, 1); /* Type */
         node_size =  SMMU_V3_ENTRY_SIZE + ID_MAPPING_ENTRY_SIZE;
@@ -355,7 +429,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         /* Reference to ID Array */
         build_append_int_noprefix(table_data, SMMU_V3_ENTRY_SIZE, 4);
         /* Base address */
-        build_append_int_noprefix(table_data, vms->memmap[VIRT_SMMU].base, 8);
+        build_append_int_noprefix(table_data, base, 8);
         /* Flags */
         build_append_int_noprefix(table_data, 1 /* COHACC Override */, 4);
         build_append_int_noprefix(table_data, 0, 4); /* Reserved */
@@ -404,15 +478,22 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     build_append_int_noprefix(table_data, 0, 3); /* Reserved */
 
     /* Output Reference */
-    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
+    if (num_smmus) {
         AcpiIortIdMapping *range;
+        size_t offset;
 
         /* translated RIDs connect to SMMUv3 node: RC -> SMMUv3 -> ITS */
         for (i = 0; i < smmu_idmaps->len; i++) {
+            if (vms->iommu == VIRT_IOMMU_SMMUV3_ACCEL) {
+                offset = smmu_offset[i];
+            } else {
+                offset = smmu_offset[0];
+            }
+
             range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
             /* output IORT node is the smmuv3 node */
             build_iort_id_mapping(table_data, range->input_base,
-                                  range->id_count, smmu_offset);
+                                  range->id_count, offset);
         }
 
         /* bypassed RIDs connect to ITS group node directly: RC -> ITS */
-- 
2.34.1

