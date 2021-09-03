Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1357927lfb;
        Fri, 3 Sep 2021 07:40:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdMjsuXyY+14kIROuzGoNsr+zpzh54qfkIAFrqKsiqAqtGAasusiZBpUOhNMCvsIxmg+Ak
X-Received: by 2002:a6b:f714:: with SMTP id k20mr3324301iog.148.1630680002791;
        Fri, 03 Sep 2021 07:40:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630680002; cv=none;
        d=google.com; s=arc-20160816;
        b=JCdrHIqkJ6/UW46kWHZ8BQGuQvsBtYzDF8IIJ+LFlUefujzHR9A3eUcQDzTurkbdul
         v/VfqtnKB7ctTNJ6FgpyPTkDki2IWelBg8M+uVmWikNJOLld6IEvPTpHCuQ2bwemLqpQ
         3+zFSRcGVivYeTOsvRR7kAiggIcQgvVqVxEoihcod9pkvs0Jp8RxnS1MNH229n9cvai1
         hpCBJPRFthqGIwl/80WcycKZd4japBGVsiD1c6/gQVzSkNQBYKxOviKsUs8iKYvVz5TB
         QU94hqgJ4cmPJRNpnVrgkqgJ8YMfqdzhmCdioNqAbE5yODI7RNPDobnZBYfu+IaeNYwU
         TzUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ML4iX6CFCZNHlVUqfCS6XVSF7GyOD2bEAeWn+nVwWZ4=;
        b=NPnwXRXQywkcG5oR8ZZElOjDpK9GjNTQOfb3vCFBd9PSs7GsDqu7AbVHuMuwXkFRXZ
         AIJNg+XphrY//jwXk4eRbOZKoNV7jufIwKHX5Mz/myJTKpDU54mjt4LtgG7S0NLGtMIE
         HlOy0DTswmVMlVRvh6sDTd/RAM0/eL5LHZU2fOJKAtm9sB47P/VZcMVfyEn0EgEp37Tw
         Umew8lZ0uYw+Dx6ITUW5OzBuGICm0qLals7lFLV1X8CWevbhdOqL+BNFpIn9a7deTqFu
         Fcb/bHayZ7B0F3TKq+obFnENefCldV+x6tvqn4D2i9teSb2T7XfwYbAQFIsGvAkqFMua
         xdsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jp3N57nQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e35si4938467jaa.106.2021.09.03.07.40.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 07:40:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jp3N57nQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMAMM-0001EF-0L
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 10:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFK-0004Mb-5f
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 10:32:48 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFI-0005gq-5b
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 10:32:45 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x6so8497196wrv.13
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 07:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ML4iX6CFCZNHlVUqfCS6XVSF7GyOD2bEAeWn+nVwWZ4=;
 b=Jp3N57nQeWK9FnE2qNloGy3jMZaRiAsKcWsu94VHm7GdypSuZhachsocQkSmJiKnH8
 jvHEE7iCIQQK5/SK6HSl8Fc5gSvSbOwnAHuAhJtFicQc4y2UNwrEaxpee0WDB4IudajO
 HE++DjngBdOfnjNQPP5ge2lTPef8MsK8UZYDIHghybqH9to5/Y1qptHua9pyVcJ96iyG
 jWU1ADgEZsuSsXs26YmHC47dMDpYkxbqLEbNdamxIyied9me3JNoES+FlavI6BnxTBeN
 Lc7i4K7u7opnKTBFrSkc+c5/jKgPW9Kw9Wfdyj1QOE1wmnMi8a8+aU2FJRoKi+NQpulE
 Gelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ML4iX6CFCZNHlVUqfCS6XVSF7GyOD2bEAeWn+nVwWZ4=;
 b=afPodoQbIdMvrFJzXpp+SOt3GlnJzPc7IUBjf9a9vv088cujwwjKjy+FyzhYbD3OIP
 enDvBhTMzkPE8AC7sSi6fotJqn0IyNcV6PZrtv1ermDrXxfFFEouCo2jNtT+Xy9Li8Lf
 afi7GTAUbw9OjK7n2UALxFcAIretY58Vv4bQEIhqPO8gWGRaNJd0rYlxvSCEvnnynXfU
 K6Cg2KY6gbMydtoNt6ws1SSeC0vPHQLcP9Y/2s8/kUlfpYpqmuPLtPRTJmfgVH9ExGX6
 PbepaJwDVXENKc26IQopihxGuOqx93EiitzFTDylrHUGhQkUuQ90ffwKJTD6k8v4ImKl
 DoFQ==
X-Gm-Message-State: AOAM532iBrddBdHyCHs9I7RGcO0OdvtkMwE8EqHU01qWxNTjqnuyMzxz
 JV1FoyRRc9DAK4eFFdzJHFK65A==
X-Received: by 2002:adf:b781:: with SMTP id s1mr4533749wre.165.1630679562704; 
 Fri, 03 Sep 2021 07:32:42 -0700 (PDT)
Received: from localhost.localdomain (19.11.114.78.rev.sfr.net. [78.114.11.19])
 by smtp.gmail.com with ESMTPSA id z2sm4314843wma.45.2021.09.03.07.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 07:32:42 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v2 6/8] pc: Add VIOT table for virtio-iommu
Date: Fri,  3 Sep 2021 16:32:07 +0200
Message-Id: <20210903143208.2434284-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903143208.2434284-1-jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
X-TUID: 52fBDuuj5QRh

The ACPI Virtual I/O Translation table (VIOT) describes the relation
between a virtio-iommu and the endpoints it manages. When a virtio-iommu
device is instantiated, add a VIOT table.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/i386/Kconfig      | 1 +
 include/hw/i386/pc.h | 2 ++
 hw/i386/acpi-build.c | 5 +++++
 hw/i386/pc.c         | 7 +++++++
 4 files changed, 15 insertions(+)

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
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 88dffe7517..979b8d0b7c 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -45,6 +45,8 @@ typedef struct PCMachineState {
     bool pit_enabled;
     bool hpet_enabled;
     bool default_bus_bypass_iommu;
+    bool virtio_iommu;
+    uint16_t virtio_iommu_bdf;
     uint64_t max_fw_size;
 
     /* NUMA information: */
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a33ac8b91e..078b7f5c6f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -71,6 +71,7 @@
 
 #include "hw/acpi/ipmi.h"
 #include "hw/acpi/hmat.h"
+#include "hw/acpi/viot.h"
 
 /* These are used to size the ACPI tables for -M pc-i440fx-1.7 and
  * -M pc-i440fx-2.0.  Even if the actual amount of AML generated grows
@@ -2559,6 +2560,10 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
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
index c2b9d62a35..694fc9ce07 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -84,6 +84,7 @@
 #include "hw/i386/intel_iommu.h"
 #include "hw/net/ne2000-isa.h"
 #include "standard-headers/asm-x86/bootparam.h"
+#include "hw/virtio/virtio-iommu.h"
 #include "hw/virtio/virtio-pmem-pci.h"
 #include "hw/virtio/virtio-mem-pci.h"
 #include "hw/mem/memory-device.h"
@@ -1388,6 +1389,12 @@ static void pc_machine_device_plug_cb(HotplugHandler *hotplug_dev,
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
 
-- 
2.33.0

