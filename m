Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4108657lfm;
        Mon, 24 May 2021 20:53:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvjZr3pGIU0NNdUp5uNZ10kuf9h9kfEmkwYfLf0Jl75RwiyLSSXYSQ3ByEqZU4f4XS8rlG
X-Received: by 2002:a5e:a912:: with SMTP id c18mr10614732iod.74.1621914818009;
        Mon, 24 May 2021 20:53:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621914818; cv=none;
        d=google.com; s=arc-20160816;
        b=B50oxir5x3gTyBK5F7YTz6VrtYl0d5aPGrtvzmyBpTQvfeIWs5xWdDI5aOt531RZ5P
         7dpFaadSYe1wPBimG4e/vsyAhfpW2dvHjFDmz/P6luhz8RfdElVE4g68YHziy7m69JPZ
         sCBtkBAcpppz0ZCFq6Sg0Qy5YbjPRHGcfSh7Qf+1PhPjYzsbDkGdRVNnl6qMK3n/vX4F
         yvqCPljsXSwL7xzoPzrQOX4LqP8UeAViVYMC+sGHeOh+fZ56ToY6E/SQFzEI7yBE5u7m
         B/UUHg5/1kmyIyE4w2oPzb1bshk7P8sMAqOG/SrATFNq0E8V4qBqpJ7dvg+8AUkcvNyi
         lHsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=ttNxtPT9BPKx7pA/I6D2cYW8tNbSsUyYvafzz4gytkc=;
        b=MrH6aEdGPnr5/5Ie6fFlib0HMvBh5FGzrzMDmxxOoxnAP45H23mFCX3rCDja2xEMkV
         W2pikAVBDGxkTtkTWl1roxW/Keri+Kx5vw2VnpQnvwu6s9u2uA8/HZYLq2B9Xht3gDbz
         buHzChAk6lMq2sqUCoBlUVljoGfuSfPjoWiJzCLXPlZslxk+jKD+uZ/5yttssKZzwYur
         xcfNF69UxUM8Cyx929QosYGXx8jQ5pjksSpfBtfmFjjfeGmbJxGxc6ZAKW/OaoFbmoLD
         NgRHaR+ME1H2chNwiIqsiFJ7n6LdJDPFsnrtdS+7vfBRchxevu3rb8U+W/TxjfmaSM5U
         2V5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n5si19338017ilj.6.2021.05.24.20.53.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 20:53:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:53334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llO8P-0007jk-CW
	for alex.bennee@linaro.org; Mon, 24 May 2021 23:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1llO5N-0006RH-2q; Mon, 24 May 2021 23:50:29 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:4581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1llO5I-0001s8-3b; Mon, 24 May 2021 23:50:28 -0400
Received: from dggems704-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fq0R52CSZzmbJl;
 Tue, 25 May 2021 11:48:01 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggems704-chm.china.huawei.com (10.3.19.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 11:50:16 +0800
Received: from huawei.com (10.174.185.226) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 25 May
 2021 11:50:15 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH v4 7/8] hw/i386/acpi-build: Add explicit scope in DMAR table
Date: Tue, 25 May 2021 03:50:04 +0000
Message-ID: <1621914605-14724-8-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
References: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=wangxingang5@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: xieyingtai@huawei.com, wangxingang5@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gFV14fcYV1nk

From: Xingang Wang <wangxingang5@huawei.com>

In DMAR table, the drhd is set to cover all pci devices when intel_iommu
is on. This patch add explicit scope data, including only the pci devices
that go through iommu.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
---
 hw/i386/acpi-build.c | 68 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 66 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 80bee00da6..e839527184 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1991,6 +1991,56 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
                  x86ms->oem_table_id);
 }
 
+/*
+ * Insert DMAR scope for PCI bridges and endpoint devcie
+ */
+static void
+insert_scope(PCIBus *bus, PCIDevice *dev, void *opaque)
+{
+    GArray *scope_blob = opaque;
+    AcpiDmarDeviceScope *scope = NULL;
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_BRIDGE)) {
+        /* Dmar Scope Type: 0x02 for PCI Bridge */
+        build_append_int_noprefix(scope_blob, 0x02, 1);
+    } else {
+        /* Dmar Scope Type: 0x01 for PCI Endpoint Device */
+        build_append_int_noprefix(scope_blob, 0x01, 1);
+    }
+
+    /* length */
+    build_append_int_noprefix(scope_blob,
+                              sizeof(*scope) + sizeof(scope->path[0]), 1);
+    /* reserved */
+    build_append_int_noprefix(scope_blob, 0, 2);
+    /* enumeration_id */
+    build_append_int_noprefix(scope_blob, 0, 1);
+    /* bus */
+    build_append_int_noprefix(scope_blob, pci_bus_num(bus), 1);
+    /* device */
+    build_append_int_noprefix(scope_blob, PCI_SLOT(dev->devfn), 1);
+    /* function */
+    build_append_int_noprefix(scope_blob, PCI_FUNC(dev->devfn), 1);
+}
+
+/* For a given PCI host bridge, walk and insert DMAR scope */
+static int
+dmar_host_bridges(Object *obj, void *opaque)
+{
+    GArray *scope_blob = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
+        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
+
+        if (bus && !pci_bus_bypass_iommu(bus)) {
+            pci_for_each_device(bus, pci_bus_num(bus), insert_scope,
+                                scope_blob);
+        }
+    }
+
+    return 0;
+}
+
 /*
  * VT-d spec 8.1 DMA Remapping Reporting Structure
  * (version Oct. 2014 or later)
@@ -2010,6 +2060,15 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
     /* Root complex IOAPIC use one path[0] only */
     size_t ioapic_scope_size = sizeof(*scope) + sizeof(scope->path[0]);
     IntelIOMMUState *intel_iommu = INTEL_IOMMU_DEVICE(iommu);
+    GArray *scope_blob = g_array_new(false, true, 1);
+
+    /*
+     * A PCI bus walk, for each PCI host bridge.
+     * Insert scope for each PCI bridge and endpoint device which
+     * is attached to a bus with iommu enabled.
+     */
+    object_child_foreach_recursive(object_get_root(),
+                                   dmar_host_bridges, scope_blob);
 
     assert(iommu);
     if (x86_iommu_ir_supported(iommu)) {
@@ -2023,8 +2082,9 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
     /* DMAR Remapping Hardware Unit Definition structure */
     drhd = acpi_data_push(table_data, sizeof(*drhd) + ioapic_scope_size);
     drhd->type = cpu_to_le16(ACPI_DMAR_TYPE_HARDWARE_UNIT);
-    drhd->length = cpu_to_le16(sizeof(*drhd) + ioapic_scope_size);
-    drhd->flags = ACPI_DMAR_INCLUDE_PCI_ALL;
+    drhd->length =
+        cpu_to_le16(sizeof(*drhd) + ioapic_scope_size + scope_blob->len);
+    drhd->flags = 0;            /* Don't include all pci device */
     drhd->pci_segment = cpu_to_le16(0);
     drhd->address = cpu_to_le64(Q35_HOST_BRIDGE_IOMMU_ADDR);
 
@@ -2038,6 +2098,10 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
     scope->path[0].device = PCI_SLOT(Q35_PSEUDO_DEVFN_IOAPIC);
     scope->path[0].function = PCI_FUNC(Q35_PSEUDO_DEVFN_IOAPIC);
 
+    /* Add scope found above */
+    g_array_append_vals(table_data, scope_blob->data, scope_blob->len);
+    g_array_free(scope_blob, true);
+
     if (iommu->dt_supported) {
         atsr = acpi_data_push(table_data, sizeof(*atsr));
         atsr->type = cpu_to_le16(ACPI_DMAR_TYPE_ATSR);
-- 
2.19.1

