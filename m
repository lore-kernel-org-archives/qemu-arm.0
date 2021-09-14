Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp746181lfp;
        Tue, 14 Sep 2021 07:38:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7sYZ6AoLzoWQsov62nxpqBexXHrzhHDq3FO5SHKMcHdnhIVWxKfqAx3QkaYe9CeW4t7qQ
X-Received: by 2002:a1c:c911:: with SMTP id f17mr2586970wmb.190.1631630304965;
        Tue, 14 Sep 2021 07:38:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631630304; cv=none;
        d=google.com; s=arc-20160816;
        b=eDEZeXR4uaN2C6c4Vu9x3/P/KdiAbF6sQXTu+0jHhDc6R80p0ZGuZMGD5dWUnapMd2
         XdbEI0jrCpqeEDJpQp5lAg0ys9C4chOis39xdiljS9n/P3R+Mxb8zaO537CARoxBzS4y
         m50FfZ5dDW1+YkWAjzcm3LGp+fgIvrHwvR8bdO11/TE6FzEnJNabc8BxUlBjUnEaXu6v
         pTMLBL64XBRvgznRifc1TjGl+UWysRg0UvPNpEQNvxHIKLn/9aDRx3qRKgCW13Slzd1a
         MccEeERJuQ7oZPCJJXmRL3HItnPyqBu86+PdtOzELo/07RP4LFn1poS8TftJ7KTvbhoB
         Futg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1Dpxbn0fDeE2pqHdIXbZlDNr3pHTinWoeKCEcb3F1QQ=;
        b=ZFjMXp+kCyCzNECF0gT5bKLBJDZhbWZ9ghEOursggE+WBfo/yGl4FmFKxXDqcipoMY
         5ynvl9f7oxQOMUzukxtbQku1pysCGa1THM8WZ9GBsmmKwYzSXXRqsRT9B4ZsBM28sRuU
         Riay6jJoz2/cWZRypqlh5lgJOwBOKnd8UBjT0AT9URPs+Q3hm/tKmWWNyLIWq04Je84Z
         mZ5dkLmeYODr8CU6pA5nzQwOZgPmtXYaM1m4mmt25y1SWdLe+p5SEoEHyjXgAiug6ki+
         XqN/l7ws6Q+Etq5CLOvmK5dXD5E20s8B5LIeh0VUj/fLGXA+OpMG60XCxbpN2kq0EFly
         A0Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H8s91u5B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7si12024481wrg.561.2021.09.14.07.38.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 07:38:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H8s91u5B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQ9Zn-0000yd-TY
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 10:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MU-0006F5-LS
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:39 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MK-0005Ot-95
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:38 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso2255407wms.3
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 07:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Dpxbn0fDeE2pqHdIXbZlDNr3pHTinWoeKCEcb3F1QQ=;
 b=H8s91u5BczSucpqTLQ1SYE9fL5U4Awdv64t52Gnx7AtDoXv3SLEg6zsTqBXDQbsJmE
 7FFoEpF3lr8grbeKVJ0xzixmmGLLWzrcmZwIf2p4c6QOn3jpqFPe+sEsvnFhhchUSuTb
 f4nDDcl811ailZ+lLb13hEgF/VaDxPhMc1HYR3d1R7YzJkL2nx/s74whmyt6lcfoMX/+
 jCEzHOmnHVvAdDaroaY/iqLttdIsgwx4wMjsRyChHSthfRHhIqKTEhHNAp7Bv6zsJzBA
 /Ms49VPYBv/Rjsc9cryDJojI4uZwHoN/r+cCMwIdHtuNaP2tEN7NQ3nqMKRlYzS6GPVv
 1ACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Dpxbn0fDeE2pqHdIXbZlDNr3pHTinWoeKCEcb3F1QQ=;
 b=kPqGUB0aCL1R8YqcCY8jQ02VyxuJcLN/14a6R7mIBlagFytgMkeKtarXDnKv4BWx8U
 y2v0V8P8V02rnWAfoei2RyQt0T61qblQ9dT9EPvD52UyOLZNJnyRR4LyuOl7iAF02gKX
 P8DyYyYAbYKPq4Ulf8aUVlcnJFZm+QhhYgP76Pq5SrQV+vpsvs1MDNkwEyztIV2PhAzg
 M685Va22rhnIsRMc7gqjvqVWdCoEkLOlEnwfTj5xrqtkCnd/JkyttRcNTwHzmwRXnCbm
 pQjV30h/fHG7StiuH7jkWdZGUfTiWxeVQNqjrSoRXFhrW1kGyopHf/Fm7Ajgp8G3JIiH
 TVow==
X-Gm-Message-State: AOAM532K3iPmLMtF5zFJJkcge9wGp+iGSIwLcrEkpWrvN8g7R10p4aif
 x8zy2bGnb+47DvU9e+Y9JvCfwA==
X-Received: by 2002:a1c:2351:: with SMTP id j78mr2538885wmj.40.1631629466390; 
 Tue, 14 Sep 2021 07:24:26 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k6sm184252wmo.37.2021.09.14.07.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 07:24:26 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v3 05/10] pc: Allow instantiating a virtio-iommu device
Date: Tue, 14 Sep 2021 15:20:00 +0100
Message-Id: <20210914142004.2433568-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914142004.2433568-1-jean-philippe@linaro.org>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D6rDpS5DJxBL

Allow instantiating a virtio-iommu device by adding an ACPI Virtual I/O
Translation table (VIOT), which describes the relation between the
virtio-iommu and the endpoints it manages.

Add a hotplug handler for virtio-iommu on x86 and set the necessary
reserved region property. On x86, the [0xfee00000, 0xfeefffff] DMA
region is reserved for MSIs. DMA transactions to this range either
trigger IRQ remapping in the IOMMU or bypasses IOMMU translation.

Although virtio-iommu does not support IRQ remapping it must be informed
of the reserved region so that it can forward DMA transactions targeting
this region.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/hw/i386/pc.h |  2 ++
 hw/i386/acpi-build.c |  5 +++++
 hw/i386/pc.c         | 28 +++++++++++++++++++++++++++-
 hw/i386/Kconfig      |  1 +
 4 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 82cf7b7e30..f3ba1ee4c0 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -45,6 +45,8 @@ typedef struct PCMachineState {
     bool pit_enabled;
     bool hpet_enabled;
     bool default_bus_bypass_iommu;
+    bool virtio_iommu;
+    uint16_t virtio_iommu_bdf;
     uint64_t max_fw_size;
 
     /* ACPI Memory hotplug IO base address */
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 547cd4ed9d..76845026d8 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -71,6 +71,7 @@
 
 #include "hw/acpi/ipmi.h"
 #include "hw/acpi/hmat.h"
+#include "hw/acpi/viot.h"
 
 /* These are used to size the ACPI tables for -M pc-i440fx-1.7 and
  * -M pc-i440fx-2.0.  Even if the actual amount of AML generated grows
@@ -2593,6 +2594,10 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
             build_dmar_q35(tables_blob, tables->linker, x86ms->oem_id,
                            x86ms->oem_table_id);
         }
+    } else if (pcms->virtio_iommu) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_viot(tables_blob, tables->linker, pcms->virtio_iommu_bdf,
+                   x86ms->oem_id, x86ms->oem_table_id);
     }
     if (machine->nvdimms_state->is_enabled) {
         nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7e523b913c..a31e950599 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -83,6 +83,7 @@
 #include "hw/i386/intel_iommu.h"
 #include "hw/net/ne2000-isa.h"
 #include "standard-headers/asm-x86/bootparam.h"
+#include "hw/virtio/virtio-iommu.h"
 #include "hw/virtio/virtio-pmem-pci.h"
 #include "hw/virtio/virtio-mem-pci.h"
 #include "hw/mem/memory-device.h"
@@ -798,6 +799,11 @@ void pc_machine_done(Notifier *notifier, void *data)
                      "irqchip support.");
         exit(EXIT_FAILURE);
     }
+
+    if (pcms->virtio_iommu && x86_iommu_get_default()) {
+        error_report("QEMU does not support multiple vIOMMUs for x86 yet.");
+        exit(EXIT_FAILURE);
+    }
 }
 
 void pc_guest_info_init(PCMachineState *pcms)
@@ -1368,6 +1374,14 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
                object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
         pc_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        /* Declare the reserved MSI region */
+        char *resv_prop_str = g_strdup_printf("0xfee00000:0xfeefffff:%d",
+                                              VIRTIO_IOMMU_RESV_MEM_T_MSI);
+
+        qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
+        qdev_prop_set_string(dev, "reserved-regions[0]", resv_prop_str);
+        g_free(resv_prop_str);
     }
 }
 
@@ -1381,6 +1395,17 @@ static void pc_machine_device_plug_cb(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
                object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
         pc_virtio_md_pci_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        PCMachineState *pcms = PC_MACHINE(hotplug_dev);
+        PCIDevice *pdev = PCI_DEVICE(dev);
+
+        if (pcms->virtio_iommu) {
+            error_setg(errp,
+                       "QEMU does not support multiple vIOMMUs for x86 yet.");
+            return;
+        }
+        pcms->virtio_iommu = true;
+        pcms->virtio_iommu_bdf = pci_get_bdf(pdev);
     }
 }
 
@@ -1422,7 +1447,8 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
         object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
-        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
         return HOTPLUG_HANDLER(machine);
     }
 
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index ddedcef0b2..13db05d557 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -54,6 +54,7 @@ config PC_ACPI
     select ACPI_X86
     select ACPI_CPU_HOTPLUG
     select ACPI_MEMORY_HOTPLUG
+    select ACPI_VIOT
     select SMBUS_EEPROM
     select PFLASH_CFI01
     depends on ACPI_SMBUS
-- 
2.33.0

