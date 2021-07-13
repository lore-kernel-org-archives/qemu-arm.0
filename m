Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp61677lfc;
        Tue, 13 Jul 2021 15:22:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwq7cXAPSoyQLsXW9iGA04QbCHxm77+TNBi6dZI3DQkI98fp28Wbq/GbzkggwBaQ/pF0/lO
X-Received: by 2002:a37:658c:: with SMTP id z134mr6685466qkb.310.1626214941169;
        Tue, 13 Jul 2021 15:22:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626214941; cv=none;
        d=google.com; s=arc-20160816;
        b=uNSf6Gjew1Cg1YenselFjtwdw22u536WfmB+Oci2tSe3TR8SN4Gg7r0+P7QJ7qqdJQ
         uWfutvpBVi43Db9ZuFoMg/uZlKE0iQ0szA1Q5S1kjniayzS0Ncgsw+k5oSJjHaited54
         43yWwxAN5SM5xQam89+FWx1tnWg1rZyJZYLIKlUp6JmJHVruY5oJyhtk9oPbatVY0EKF
         ZbUQmq5aE/MzTzNKK7Ts5L8jboGo35dBX1e8YWdnP1t3yMUc7ZItILChWZ+X/JWXsf5N
         duG+46UCszUwQQM/008KTN0qREzF0ngwXz0SQiyrWfzHH+DwZ1iYWQz+R3hkqkYwaWgx
         qYRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=2tkVF2ulgVK1I83asV+DkCniiWWlnhyo+M2eGWekklE=;
        b=wy+c2e8IyaR5oiP1P6S7XotbdBmxIB6O6KREDsDFO1B0CJNNraDZzUqWL4qcMwzLkB
         UbTUyNBjtvVVCgJjYlHtspJjULocTtBVfS/sLzBXG0w5GT/S1CfgFCgmuMMSCO0nXX83
         SUVAgg9glaCZMDtbbb4mSBYn3t59zRI4VsiZTD/Kf/dBsL1K3kvNmWjducBLOnOj/jzu
         6w/E/8Vomz7OPoqFUY4VnLS7jX07Yp0vlv8xG2HABmdJWGvHQLoAMW3OekC6HKR1TeOF
         Dt9WfobEtnkv2TDUytNM9/dWYgwjY8KImXyD4IBnYRKEbP+8uxIi93F+L00b5cM5ebXQ
         J67w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="AYm/4riV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g129si133516qkf.4.2021.07.13.15.22.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 15:22:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="AYm/4riV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3QnE-0007Kw-BZ
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 18:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QcV-0008Lz-Ul
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 18:11:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3QcT-0008FL-Em
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 18:11:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2tkVF2ulgVK1I83asV+DkCniiWWlnhyo+M2eGWekklE=;
 b=AYm/4riVC53MXycCzUhRiPvLiwCbzmVMQ5vPzkpqwO0RcNskUV9V8TTZp37lBgZLkKoXSV
 /iNIVs7y8Mz3mi95X7jX5sll65u/uOs0Uo8STOeo9qouc5lZg/C0duMlhrQWuLMm7+Zv0o
 A/Aqo6/3fQoSHK0yJlzJE5VJh5/VzPY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-viJ3fkfeMv6lFNseSMp0Lg-1; Tue, 13 Jul 2021 18:11:11 -0400
X-MC-Unique: viJ3fkfeMv6lFNseSMp0Lg-1
Received: by mail-wm1-f72.google.com with SMTP id
 l6-20020a05600c1d06b0290225338d8f53so148947wms.8
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 15:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2tkVF2ulgVK1I83asV+DkCniiWWlnhyo+M2eGWekklE=;
 b=TLP97d/VTZi8hGS2s+8z08PcmAp2EH+QH2pvpB3wBR5r8kSIWaQgYhMUfYIx5vXD0u
 zR0nnu+JCj1VruG/thPaxzan0YRLPj4RIW/Zof4iS3Z7u782CsUEIEaAa4jwPw06ztCx
 W0xCKxSysLEmLfdmCCAJ3bbMPHeZmNTacpwLfzjIJHshf8Jn1Qqxy47jFFOS6imBASnO
 C2l96YXrbnqpob3OJOPGpGhDkfnSI0YY9aSMuZ9af5fThNcCV/GFiRJUuss8e2DvTwil
 XxO8oV8Sc58oogBrVGrcNEvDjfeVhsNpJvZlXbWPyOlX+rLyotH2bnkYNqGIOUDzAdxP
 O/Fg==
X-Gm-Message-State: AOAM530KGDdpmthyjV4fpeowzyFEDz+/SddXJun7cSTu0Vnj7uVlpWBW
 6OiYacxV7gYUuUavAIcuWB0XskncCHX6Qxw3sFvt+UYdVE1kQTFuUfWtHsYq1W7NyUQ6qpabJDd
 FtaPxraglAZQ0
X-Received: by 2002:a1c:1dd4:: with SMTP id d203mr430970wmd.28.1626214270205; 
 Tue, 13 Jul 2021 15:11:10 -0700 (PDT)
X-Received: by 2002:a1c:1dd4:: with SMTP id d203mr430956wmd.28.1626214270020; 
 Tue, 13 Jul 2021 15:11:10 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id e11sm188985wrt.0.2021.07.13.15.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:11:09 -0700 (PDT)
Date: Tue, 13 Jul 2021 18:11:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/23] hw/arm/virt-acpi-build: Add IORT support to bypass SMMUv3
Message-ID: <20210713220946.212562-20-mst@redhat.com>
References: <20210713220946.212562-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210713220946.212562-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Xingang Wang <wangxingang5@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o8FVNY1Bv794

From: Xingang Wang <wangxingang5@huawei.com>

When we build IORT table with SMMUv3 and bypass iommu feature enabled,
we can no longer setup one map from RC to SMMUv3 covering the whole RIDs.
We need to walk the PCI bus and check whether the root bus will bypass
iommu, setup RC -> SMMUv3 -> ITS map for RC which will not bypass iommu.

When a SMMUv3 node exist, we setup the idmap from SMMUv3 to ITS
covering the whole RIDs, and only modify the map from RC to SMMUv3.
We build RC -> SMMUv3 -> ITS map for root bus with bypass_iommu
disabled, and build idmap from RC to ITS directly for the rest of
the whole RID space.

For example we run qemu with command line:

qemu/build/aarch64-softmmu/qemu-system-aarch64 \
 -kernel arch/arm64/boot/Image \
 -enable-kvm \
 -cpu host \
 -m 8G \
 -smp 8,sockets=2,cores=4,threads=1 \
 -machine virt,kernel_irqchip=on,gic-version=3,iommu=smmuv3,default_bus_bypass_iommu=true \
 -drive file=./QEMU_EFI-pflash.raw,if=pflash,format=raw,unit=0,readonly=on \
 -device pxb-pcie,bus_nr=0x10,id=pci.10,bus=pcie.0,addr=0x3.0x1 \
 -device pxb-pcie,bus_nr=0x20,id=pci.20,bus=pcie.0,addr=0x3.0x2,bypass_iommu=true \
 -device pcie-root-port,port=0x20,chassis=1,id=pci.1,bus=pcie.0,addr=0x2 \
 -device pcie-root-port,port=0x20,chassis=11,id=pci.11,bus=pci.10,addr=0x1 \
 -device pcie-root-port,port=0x20,chassis=21,id=pci.21,bus=pci.20,addr=0x1 \
 -device virtio-scsi-pci,id=scsi0,bus=pci.1,addr=0x1 \
 -device virtio-scsi-pci,id=scsi1,bus=pci.11,addr=0x1 \
 -device virtio-scsi-pci,id=scsi2,bus=pci.21,addr=0x1 \
 -initrd /mnt/davinci/wxg/kill-linux/rootfs/mfs.cpio.gz \
 -nographic \
 -append "rdinit=init console=ttyAMA0 earlycon=pl011,0x9000000 nokaslr" \

And we get guest configuration:

-+-[0000:20]---01.0-[21]--
 +-[0000:10]---01.0-[11]--
 \-[0000:00]-+-00.0  Device 1b36:0008
             +-01.0  Device 1af4:1000
             \-02.0-[01]--

With bypass_iommu enabled, the attached devices will bypass iommu.

/sys/class/iommu/smmu3.0x0000000009050000/
|-- device -> ../../../arm-smmu-v3.0.auto
|-- devices
|   `-- 0000:10:01.0 -> ../../../../../pci0000:10/0000:10:01.0

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Message-Id: <1625748919-52456-7-git-send-email-wangxingang5@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c | 114 +++++++++++++++++++++++++++++++++++----
 1 file changed, 103 insertions(+), 11 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f1024843dd..037cc1fd82 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -44,6 +44,7 @@
 #include "hw/acpi/tpm.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/pci_bus.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/arm/virt.h"
 #include "hw/mem/nvdimm.h"
@@ -239,23 +240,89 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
 }
 #endif
 
+/* Build the iort ID mapping to SMMUv3 for a given PCI host bridge */
+static int
+iort_host_bridges(Object *obj, void *opaque)
+{
+    GArray *idmap_blob = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
+        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
+
+        if (bus && !pci_bus_bypass_iommu(bus)) {
+            int min_bus, max_bus;
+
+            pci_bus_range(bus, &min_bus, &max_bus);
+
+            AcpiIortIdMapping idmap = {
+                .input_base = min_bus << 8,
+                .id_count = (max_bus - min_bus + 1) << 8,
+            };
+            g_array_append_val(idmap_blob, idmap);
+        }
+    }
+
+    return 0;
+}
+
+static int iort_idmap_compare(gconstpointer a, gconstpointer b)
+{
+    AcpiIortIdMapping *idmap_a = (AcpiIortIdMapping *)a;
+    AcpiIortIdMapping *idmap_b = (AcpiIortIdMapping *)b;
+
+    return idmap_a->input_base - idmap_b->input_base;
+}
+
 static void
 build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
-    int nb_nodes, iort_start = table_data->len;
+    int i, nb_nodes, rc_mapping_count, iort_start = table_data->len;
     AcpiIortIdMapping *idmap;
     AcpiIortItsGroup *its;
     AcpiIortTable *iort;
     AcpiIortSmmu3 *smmu;
     size_t node_size, iort_node_offset, iort_length, smmu_offset = 0;
     AcpiIortRC *rc;
+    GArray *smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
+    GArray *its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
 
     iort = acpi_data_push(table_data, sizeof(*iort));
 
     if (vms->iommu == VIRT_IOMMU_SMMUV3) {
+        AcpiIortIdMapping next_range = {0};
+
+        object_child_foreach_recursive(object_get_root(),
+                                       iort_host_bridges, smmu_idmaps);
+
+        /* Sort the smmu idmap by input_base */
+        g_array_sort(smmu_idmaps, iort_idmap_compare);
+
+        /*
+         * Split the whole RIDs by mapping from RC to SMMU,
+         * build the ID mapping from RC to ITS directly.
+         */
+        for (i = 0; i < smmu_idmaps->len; i++) {
+            idmap = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
+
+            if (next_range.input_base < idmap->input_base) {
+                next_range.id_count = idmap->input_base - next_range.input_base;
+                g_array_append_val(its_idmaps, next_range);
+            }
+
+            next_range.input_base = idmap->input_base + idmap->id_count;
+        }
+
+        /* Append the last RC -> ITS ID mapping */
+        if (next_range.input_base < 0xFFFF) {
+            next_range.id_count = 0xFFFF - next_range.input_base;
+            g_array_append_val(its_idmaps, next_range);
+        }
+
         nb_nodes = 3; /* RC, ITS, SMMUv3 */
+        rc_mapping_count = smmu_idmaps->len + its_idmaps->len;
     } else {
         nb_nodes = 2; /* RC, ITS */
+        rc_mapping_count = 1;
     }
 
     iort_length = sizeof(*iort);
@@ -307,13 +374,13 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     }
 
     /* Root Complex Node */
-    node_size = sizeof(*rc) + sizeof(*idmap);
+    node_size = sizeof(*rc) + sizeof(*idmap) * rc_mapping_count;
     iort_length += node_size;
     rc = acpi_data_push(table_data, node_size);
 
     rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
     rc->length = cpu_to_le16(node_size);
-    rc->mapping_count = cpu_to_le32(1);
+    rc->mapping_count = cpu_to_le32(rc_mapping_count);
     rc->mapping_offset = cpu_to_le32(sizeof(*rc));
 
     /* fully coherent device */
@@ -321,20 +388,45 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
     rc->pci_segment_number = 0; /* MCFG pci_segment */
 
-    /* Identity RID mapping covering the whole input RID range */
-    idmap = &rc->id_mapping_array[0];
-    idmap->input_base = 0;
-    idmap->id_count = cpu_to_le32(0xFFFF);
-    idmap->output_base = 0;
-
     if (vms->iommu == VIRT_IOMMU_SMMUV3) {
-        /* output IORT node is the smmuv3 node */
-        idmap->output_reference = cpu_to_le32(smmu_offset);
+        AcpiIortIdMapping *range;
+
+        /* translated RIDs connect to SMMUv3 node: RC -> SMMUv3 -> ITS */
+        for (i = 0; i < smmu_idmaps->len; i++) {
+            idmap = &rc->id_mapping_array[i];
+            range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
+
+            idmap->input_base = cpu_to_le32(range->input_base);
+            idmap->id_count = cpu_to_le32(range->id_count);
+            idmap->output_base = cpu_to_le32(range->input_base);
+            /* output IORT node is the smmuv3 node */
+            idmap->output_reference = cpu_to_le32(smmu_offset);
+        }
+
+        /* bypassed RIDs connect to ITS group node directly: RC -> ITS */
+        for (i = 0; i < its_idmaps->len; i++) {
+            idmap = &rc->id_mapping_array[smmu_idmaps->len + i];
+            range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
+
+            idmap->input_base = cpu_to_le32(range->input_base);
+            idmap->id_count = cpu_to_le32(range->id_count);
+            idmap->output_base = cpu_to_le32(range->input_base);
+            /* output IORT node is the ITS group node (the first node) */
+            idmap->output_reference = cpu_to_le32(iort_node_offset);
+        }
     } else {
+        /* Identity RID mapping covering the whole input RID range */
+        idmap = &rc->id_mapping_array[0];
+        idmap->input_base = cpu_to_le32(0);
+        idmap->id_count = cpu_to_le32(0xFFFF);
+        idmap->output_base = cpu_to_le32(0);
         /* output IORT node is the ITS group node (the first node) */
         idmap->output_reference = cpu_to_le32(iort_node_offset);
     }
 
+    g_array_free(smmu_idmaps, true);
+    g_array_free(its_idmaps, true);
+
     /*
      * Update the pointer address in case table_data->data moves during above
      * acpi_data_push operations.
-- 
MST

