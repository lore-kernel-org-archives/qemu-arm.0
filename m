Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1518707lfp;
        Fri, 1 Oct 2021 11:02:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJym7mTXVqd2n+zIjbntY0/RLqfu012SdvtG2J7Bq/Qy75HhQ6YW55fFzDMuc+zI9Efa1U3c
X-Received: by 2002:a05:6808:2086:: with SMTP id s6mr4985171oiw.133.1633111376407;
        Fri, 01 Oct 2021 11:02:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633111376; cv=none;
        d=google.com; s=arc-20160816;
        b=WWDUAonsD+hsb74fOdQ/bLDAV4D5Y+2uJpnxCpcMe7U6jZY9mhSDjDAzoCGnCcZsEb
         1ofbVWDJcnQFpwmzj8tFmQWaVCsNwwkzE4BURSuEtxq5vUiehdhTFvS02s5FpKw0hg5U
         950+3nX3SiUV4Xfi4DonKdJMXX8AVUkPIQTC9Pcu7o3i4HWJLQLjwY38a8cF8yEwPyQg
         beBvrf/FjLDMxxM0fFoVGfO7GMVZ5cv/XmIgaWD+WyR7lHxgAqzojxgkR5Unb+49nJ9P
         39FU+G04uw1Ukoy+CWDJAS1peOdy7YuGuCVLft8oXFGSZuj5M7MK/slodi7wdh4uJkTm
         Xhkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3ZMT/fPQaI7mMrURnWk+8owajZ9ST42bm/R218dwfdI=;
        b=yJ2JdGTP+ao7geKX9anA1G82JbtG5wbTU+myqoyhhojyMFKH6l5fGh9sv8PUvrwfiN
         3o9GBieB7/2o5v+YrLAZ1YctTRorzVoF+ELtqO84MUKt2epUtIlgI0hFydh9lEQ6Doed
         xZxMbgLcdivobxmL/Xd8OLfh9M743OqVPekXVvyZHuOBLVKjks9bIZLzADLrBvqg7PnP
         MpJYQBQmOo9qpLYp3xnHGAd2IgHzlgnhfMFRulIIPCDT+lLUj8/UyvPIDeYW6zcEruCo
         d8EmdrnMIyXkD0Bdk4CBgdvnXQI3dGTfeFatcMQtr+4+31a/D5oAfroTxKYdm+3kp1mz
         ExaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OU0OdLER;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a16si605873uap.112.2021.10.01.11.02.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 11:02:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OU0OdLER;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mWMs3-0006ZT-NT
	for alex.bennee@linaro.org; Fri, 01 Oct 2021 14:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUK-0000Zc-GC
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 13:38:26 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUF-0000l9-PZ
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 13:38:22 -0400
Received: by mail-wr1-x42f.google.com with SMTP id w29so16648327wra.8
 for <qemu-arm@nongnu.org>; Fri, 01 Oct 2021 10:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3ZMT/fPQaI7mMrURnWk+8owajZ9ST42bm/R218dwfdI=;
 b=OU0OdLERdnfL4cZd4XU1LJBoB+7KHrZ/l641zlG7MT9eKYmX1Ac6+I4nYaLsU0XMtK
 mtpL2LEFVZk+FeX7Vsd0gtkR0kM6e2wOsr5fduKL3QWhZ2MLKeqDRuu36tLbQThwNXFU
 ENKbuGKnlfZFd3h/GB1kSkUjQqZ3v+XMMMucdlPtNifzhOdAypZ5J1zt7frRrVeUXzLI
 OyXST7ruWfTsvuCcKIOKQ0CubD4Dt9uv29KniksEhjQH4L3tFvPAyM5ZhfMM3+JmWkUv
 5I2EG/WClctTrSa0IxLKNZqNg8wpIX+lXri9Pn9rYjsXxv7kZKMzRDI2RsuAHE38hE62
 2xkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ZMT/fPQaI7mMrURnWk+8owajZ9ST42bm/R218dwfdI=;
 b=48OXtGvIFVfk6mAMZOGNhiJpLwjfIWl02uUeZ8AaDsYuHddOVf4Y8CCO5mEklhKklo
 MJuEZ4lEkBx7KgFYzTpJjEv2vHj+qKMiaw9amI1D3s9BZaMIWmNydmYI7jBwGrg4GT5J
 K53zbAKgifKpHwzxoNkdmLvoR1sOC97rX2qE6c6127cZ4pxQxQ2K4rH/fFiBy3aH39yw
 UWfmsfnspTizF7v6qwDHbXNyo5lnIMlSN3zPAdlaIcApjdbVnIZImNEUOgjrnK6KFLnI
 u/D53v3VgJb56oHLav2EwAEncmJAAuJu4P5J+0MUJ3dnjyc74iDi0wHZVM2PV5t142MQ
 fX7Q==
X-Gm-Message-State: AOAM531LfoduJza2OJlRThLpcwmVqa2chEZGihTuDzFYvlXLY0FZfPrx
 UpHkEPTuFbdj3r+a3BT+iCPOHw==
X-Received: by 2002:adf:e0cc:: with SMTP id m12mr14263403wri.62.1633109898222; 
 Fri, 01 Oct 2021 10:38:18 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k9sm6186592wrz.22.2021.10.01.10.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:38:17 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v4 07/11] pc: Allow instantiating a virtio-iommu device
Date: Fri,  1 Oct 2021 18:33:55 +0100
Message-Id: <20211001173358.863017-8-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001173358.863017-1-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y+TuEiBWchxt

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
 hw/i386/pc.c         | 24 ++++++++++++++++++++++--
 hw/i386/Kconfig      |  1 +
 4 files changed, 30 insertions(+), 2 deletions(-)

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
index d1c28440f4..4e46585709 100644
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
+        build_viot(machine, tables_blob, tables->linker, pcms->virtio_iommu_bdf,
+                   x86ms->oem_id, x86ms->oem_table_id);
     }
     if (machine->nvdimms_state->is_enabled) {
         nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 789ccb6ef4..31710bc4fb 100644
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
@@ -1367,8 +1368,11 @@ static void pc_virtio_md_pci_unplug(HotplugHandler *hotplug_dev,
 static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                           DeviceState *dev, Error **errp)
 {
-    if (object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE) &&
-        x86_iommu_get_default()) {
+    PCMachineState *pcms = PC_MACHINE(hotplug_dev);
+
+    if ((object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE) ||
+         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) &&
+        (x86_iommu_get_default() || pcms->virtio_iommu)) {
         error_setg(errp, "QEMU does not support multiple vIOMMUs "
                    "for x86 yet.");
         return;
@@ -1381,6 +1385,15 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
                object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
         pc_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        /* Declare the APIC range as the reserved MSI region */
+        char *resv_prop_str = g_strdup_printf("0xfee00000:0xfeefffff:%d",
+                                              VIRTIO_IOMMU_RESV_MEM_T_MSI);
+
+        object_property_set_uint(OBJECT(dev), "len-reserved-regions", 1, errp);
+        object_property_set_str(OBJECT(dev), "reserved-regions[0]",
+                                resv_prop_str, errp);
+        g_free(resv_prop_str);
     }
 }
 
@@ -1394,6 +1407,12 @@ static void pc_machine_device_plug_cb(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
                object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
         pc_virtio_md_pci_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        PCMachineState *pcms = PC_MACHINE(hotplug_dev);
+        PCIDevice *pdev = PCI_DEVICE(dev);
+
+        pcms->virtio_iommu = true;
+        pcms->virtio_iommu_bdf = pci_get_bdf(pdev);
     }
 }
 
@@ -1436,6 +1455,7 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
         object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI) ||
         object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
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

