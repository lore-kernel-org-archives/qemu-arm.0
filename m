Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1352237lfb;
        Fri, 3 Sep 2021 07:33:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1U0WMfQbhjLbqJRrTz6NHuOeZ5Re5NSlHMWs2drUY9T3jIlClH9HH40yDdW08ZMKs/oYT
X-Received: by 2002:a02:cc53:: with SMTP id i19mr2860787jaq.124.1630679597778;
        Fri, 03 Sep 2021 07:33:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630679597; cv=none;
        d=google.com; s=arc-20160816;
        b=m+eDkyL7BxBOy4uPGn1Y21sBGRrczOYEmVuwI4GhebVhzGTp7msU7NQg/y8OavJ6H2
         kIyG5wqbzH0ACFrfWznvGMuQgr6V4XBnkiV3OpAdpbaFbGY36ezdF7ukTTmVF0eGq6An
         TbgGW2GVlEnMQ1ombZE51qPBdsAYrle9LQzMArLKvK44UyBT2w+JHatRfehd353UL/4e
         GYXJvUH5/9Ht8NvHtvC1rP7wTXxVxEpAHiimQrOoPBAHqSfUGAynw13BJMcYRbKA50HP
         8jWQbeBsHsfa98wy/h/sH0JGxkX5F7Vu5sB11mwc01hmEBSBL0lG+K1ahNxjKIxtEKLm
         UYyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=91/qGg18RB6/bn19u1deI7Dumr8/hl1/EFuBxe/LBsA=;
        b=K9EPGJzFhFxH5zXTu8aH/doXfF8Yq4XdxUPWN4Bb6o2Y6Hfdikv1ncetTJDKpeNxU1
         SL+VqM60BGzWOUkTki77dz+WNWy3mV8Wxw2vUlQls0c0JMIzxaAEEkZmbFOTJpXm11Pw
         de/MutYRRnzivfP8+D4EID4VOVF48/LwRoJ3X/indiuaw5YOm2kkC6AbkoBex9oWVnVi
         0qeAQyXzGwzBEYLEMWVhAF/uaejJGTUEOnLQf5Bpmw70hV9olnea/iOyjLOtKwWZaxl6
         pwt0Jupisnxi7RpBvdDYTITPsaluN4OeD8YOaFiTi0Kgcgc8guYJq4iK2/liX/aCIXbf
         /5eQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GYzpEXYD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p31si6940009jac.95.2021.09.03.07.33.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 07:33:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GYzpEXYD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMAFp-0004JM-2K
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 10:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFH-0004FW-Af
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 10:32:43 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFD-0005b9-85
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 10:32:42 -0400
Received: by mail-wr1-x433.google.com with SMTP id m9so8552731wrb.1
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 07:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=91/qGg18RB6/bn19u1deI7Dumr8/hl1/EFuBxe/LBsA=;
 b=GYzpEXYD14LgPeAS2AVPxL0UJp0+fE94q6djBrXIziIiVB/3UJrc5CizCtAB/yeq71
 6+JKIqk6NmhDIaeMS5ygx29mQ21jZsxuxfcncwlA0wWS0XWsbjvufpRxJs789or5YTWM
 2R1HnQywnUw7BJlg1/lP4sKwOVv5l7vdYLdJ364ORENJDnufNBMFvjLV+OA3k3ozp/I6
 7AgxcRKIDq/L29+lkmdYeH7rMLX+AP6UjwlnxFVYfVYcszMsF9bLA4x7dVNXdJ/xnvYT
 Evp7xhd0Atjsh66qZaqmKfCNHsHNlIR71k5h3+cO0wiOH81Hfmcp7zOBSXM9woXX0ce0
 fYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=91/qGg18RB6/bn19u1deI7Dumr8/hl1/EFuBxe/LBsA=;
 b=KDZpchJOqZsG3d6ekuE2nqJu9fnOO0oNWYS9ikWgVAFo8Y7TjvWIrkwWtZ4j46ltHx
 R47kV+MZvZTi0XypHxb719qrNp7WEMf2aJvvr5jcHCBHNaMeDwC3/SX8QoMd9PMy7j4K
 BB9l76EqhOfKXZB3woE2DG5GTv0pWZ7LUzl4tyqJcK2F9A3mAwBrRvgtDWvBEkGSuu0j
 wN0i97BBGAk3WLqggHt8Y/R0Id7VfdHYy2D/DWSN7g5oz5V2fekJ9z1hbbVpFouwF4qq
 bF9RaZ6vNoC9PcTSazqfan0IS0FKoE6eHVlBDaGj6Mi1TeqPcTy1Tc4KgKp4SEfpU1jb
 oFYw==
X-Gm-Message-State: AOAM532n2xgxzLhO/T0kydrMe82fAUE2/lVff5j5NCMzeiUKOL1XP02E
 vvpjvGQl2DhqGEMy1y1Wf4OgEQ==
X-Received: by 2002:a05:6000:1623:: with SMTP id
 v3mr4623938wrb.288.1630679557888; 
 Fri, 03 Sep 2021 07:32:37 -0700 (PDT)
Received: from localhost.localdomain (19.11.114.78.rev.sfr.net. [78.114.11.19])
 by smtp.gmail.com with ESMTPSA id z2sm4314843wma.45.2021.09.03.07.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 07:32:37 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v2 2/8] hw/acpi: Add VIOT table
Date: Fri,  3 Sep 2021 16:32:03 +0200
Message-Id: <20210903143208.2434284-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903143208.2434284-1-jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2Xiy86J58M8z

Add a function that generates a Virtual I/O Translation table (VIOT),
describing the topology of paravirtual IOMMUs. The table is created when
instantiating a virtio-iommu device. It contains a virtio-iommu node and
PCI Range nodes for endpoints managed by the IOMMU. By default, a single
node describes all PCI devices. When passing the "default_bus_bypass_iommu"
machine option and "bypass_iommu" PXB option, only buses that do not
bypass the IOMMU are described by PCI Range nodes.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/acpi/Kconfig     |   4 ++
 hw/acpi/viot.h      |  13 +++++
 hw/acpi/viot.c      | 112 ++++++++++++++++++++++++++++++++++++++++++++
 hw/acpi/meson.build |   1 +
 4 files changed, 130 insertions(+)
 create mode 100644 hw/acpi/viot.h
 create mode 100644 hw/acpi/viot.c

diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index cfc4ede8d9..abad79c103 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -41,6 +41,10 @@ config ACPI_VMGENID
     default y
     depends on PC
 
+config ACPI_VIOT
+    bool
+    depends on ACPI
+
 config ACPI_HW_REDUCED
     bool
     select ACPI
diff --git a/hw/acpi/viot.h b/hw/acpi/viot.h
new file mode 100644
index 0000000000..4cef29a640
--- /dev/null
+++ b/hw/acpi/viot.h
@@ -0,0 +1,13 @@
+/*
+ * ACPI Virtual I/O Translation Table implementation
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef VIOT_H
+#define VIOT_H
+
+void build_viot(GArray *table_data, BIOSLinker *linker,
+                uint16_t virtio_iommu_bdf, const char *oem_id,
+                const char *oem_table_id);
+
+#endif /* VIOT_H */
diff --git a/hw/acpi/viot.c b/hw/acpi/viot.c
new file mode 100644
index 0000000000..81bb2e93ff
--- /dev/null
+++ b/hw/acpi/viot.c
@@ -0,0 +1,112 @@
+/*
+ * ACPI Virtual I/O Translation table implementation
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "hw/acpi/acpi.h"
+#include "hw/acpi/aml-build.h"
+#include "hw/acpi/viot.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pci_host.h"
+
+struct viot_pci_ranges {
+    GArray *blob;
+    size_t count;
+    uint16_t output_node;
+};
+
+/* Build PCI range for a given PCI host bridge */
+static int viot_host_bridges(Object *obj, void *opaque)
+{
+    struct viot_pci_ranges *pci_ranges = opaque;
+    GArray *blob = pci_ranges->blob;
+
+    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
+        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
+
+        if (bus && !pci_bus_bypass_iommu(bus)) {
+            int min_bus, max_bus;
+
+            pci_bus_range(bus, &min_bus, &max_bus);
+
+            /* Type */
+            build_append_int_noprefix(blob, ACPI_VIOT_NODE_PCI_RANGE, 1);
+            /* Reserved */
+            build_append_int_noprefix(blob, 0, 1);
+            /* Length */
+            build_append_int_noprefix(blob, sizeof(AcpiViotPciRange), 2);
+            /* Endpoint start */
+            build_append_int_noprefix(blob, PCI_BUILD_BDF(min_bus, 0), 4);
+            /* PCI Segment start */
+            build_append_int_noprefix(blob, 0, 2);
+            /* PCI Segment end */
+            build_append_int_noprefix(blob, 0, 2);
+            /* PCI BDF start */
+            build_append_int_noprefix(blob, PCI_BUILD_BDF(min_bus, 0), 2);
+            /* PCI BDF end */
+            build_append_int_noprefix(blob, PCI_BUILD_BDF(max_bus, 0xff), 2);
+            /* Output node */
+            build_append_int_noprefix(blob, pci_ranges->output_node, 2);
+            /* Reserved */
+            build_append_int_noprefix(blob, 0, 6);
+
+            pci_ranges->count++;
+        }
+    }
+
+    return 0;
+}
+
+/*
+ * Generate a VIOT table with one PCI-based virtio-iommu that manages PCI
+ * endpoints.
+ */
+void build_viot(GArray *table_data, BIOSLinker *linker,
+                uint16_t virtio_iommu_bdf, const char *oem_id,
+                const char *oem_table_id)
+{
+    /* virtio-iommu node follows the header */
+    int viommu_off = sizeof(AcpiViot);
+    int viot_start = table_data->len;
+    struct viot_pci_ranges pci_ranges = {
+        .output_node = viommu_off,
+        .blob = g_array_new(false, true, 1),
+    };
+
+    /* Build the list of PCI ranges that this viommu manages */
+    object_child_foreach_recursive(object_get_root(), viot_host_bridges,
+                                   &pci_ranges);
+
+    /* VIOT header */
+    acpi_data_push(table_data, sizeof(AcpiTableHeader));
+    /* Node count */
+    build_append_int_noprefix(table_data, pci_ranges.count + 1, 2);
+    /* Node offset */
+    build_append_int_noprefix(table_data, viommu_off, 2);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 8);
+
+    /* Virtio-iommu based on virtio-pci */
+    /* Type */
+    build_append_int_noprefix(table_data, ACPI_VIOT_NODE_VIRTIO_IOMMU_PCI, 1);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 1);
+    /* Length */
+    build_append_int_noprefix(table_data, sizeof(AcpiViotVirtioIommuPci), 2);
+    /* PCI Segment */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* PCI BDF number */
+    build_append_int_noprefix(table_data, virtio_iommu_bdf, 2);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 8);
+
+    /* PCI ranges found above */
+    g_array_append_vals(table_data, pci_ranges.blob->data,
+                        pci_ranges.blob->len);
+    g_array_free(pci_ranges.blob, true);
+
+    build_header(linker, table_data, (void *)(table_data->data + viot_start),
+                 "VIOT", table_data->len - viot_start, 0, oem_id, oem_table_id);
+}
+
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index 29f804d13e..a510988b27 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -16,6 +16,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device
 acpi_ss.add(when: 'CONFIG_ACPI_HMAT', if_true: files('hmat.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false: files('ghes-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_X86', if_true: files('piix4.c', 'pcihp.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
 acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
 acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
-- 
2.33.0

