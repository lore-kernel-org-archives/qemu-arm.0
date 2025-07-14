Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F18CC83F1A
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 23:29:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubSKg-0008AM-8x; Mon, 14 Jul 2025 19:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubSIZ-0004IS-GM
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 19:09:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubSIT-0005qo-9y
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 19:09:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752534560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9MfyLI51ZGlhvFL7ll8x4gM+wsOFXmgTxRbWPYlHUXM=;
 b=V3iEuBai/RcB5Hz9ox5GpSTufLamM874Ra6lJKttmC3J9ldpFHEIW+WrZeQHKrPpxPx8N3
 KORLrtMd4O3ZAdPBJDBp/eP+DbsIP+wPb3HJtPu5m853aX0AqtoghiYTXADu1X6cnq6gsB
 3N1EhO0OzpKxdaSxWpH+wTusti+V/6Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-QwyD01aEOyCjQUadM6kpMQ-1; Mon, 14 Jul 2025 19:09:17 -0400
X-MC-Unique: QwyD01aEOyCjQUadM6kpMQ-1
X-Mimecast-MFC-AGG-ID: QwyD01aEOyCjQUadM6kpMQ_1752534556
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3b5fe97af5fso676990f8f.2
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 16:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752534556; x=1753139356;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9MfyLI51ZGlhvFL7ll8x4gM+wsOFXmgTxRbWPYlHUXM=;
 b=d6yHryWzQhgK3a/vp/GgaS71QFNO0bBM+KOUkyahKyxxK768jl3T+Ww0u0fzYOC2Ua
 0aUtE/c4pvEKatyWuqnjcATgk1fRWtl7InKv6OTciT04tDgWHELUV+gqzjrEST43uA/m
 gm1BchE0oaLFDIJ6kiN4wMtlTCeu7w/K1B8eGrte+zT86t3dxWNsD6PXYtjdVid8WvKC
 SQ+K4n2FT8SzXEnskUmPLQyKw1kmjBRW9Ul0YQ0cyYLzRLrk1E/SfGjYQwhMtJGp15wG
 BwTQOX2aIxotEGvnFjnZ8dJavRxVD+tLjddI1bY4rSSS1rXyP8/itQ/0KL2BZtb4TbYS
 rxgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2zR02vVfV6oYbob84RomOxMoB7wp+KTjqIDYHjy8aZS6BDprs3sNwEKUFAihNqOg/lh/JHzZnFA==@nongnu.org
X-Gm-Message-State: AOJu0YxopTDGmmmp3FWoSJ37OXuUeFyMIBxtSYGh1RKaimoaSKUwS3o8
 naJu5WH+4Mx+zo8NtcNjDUM0lgilti4msF8s5RfaEwi2yLh0VO05GxZV6e3WPJS1Q1502Eidspx
 liYswWbcFArrLRPnyYXHPIhyVjzy23QqH1oUycyC8P5AnHmSzab/4EQ==
X-Gm-Gg: ASbGncujPvEfIGw37jA25TF1MOl5y6g6tYVCQQ2xJhpfCtG1+3KsApfyGJykt/Jo0qQ
 EctLeKaDxGkOoB3lDBoeO/4APZLUNdAvzuhspzhw4zSW8TiSlALz0VtABgRk8sHfMqhn12OhcRy
 skMCUtRiGFQZvFypjadEftXZhC9kTsj9ny8XW9zvNFSB/M8YhEMrq48aMyIclljK26/xFZzLcXg
 Vbz5sybnRtHEb4/rqpeU80uOAEczvVV5CzAQwLgUxQ8QjgFOMO2AXufgqZmtA40XYZdZXgYyljS
 LBCa1rLCoy92SU5lfiJ7uE1yJrOQhaEU
X-Received: by 2002:a05:6000:42c2:b0:3a0:b84d:60cc with SMTP id
 ffacd0b85a97d-3b5f187ebeamr8569162f8f.2.1752534556184; 
 Mon, 14 Jul 2025 16:09:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUEGjaSD2MBq82qIyiEw6WuOil0WjACok4Kkj/HmQqiQA3O0wUmT/F++iD9VPvZPD0HZcMBg==
X-Received: by 2002:a05:6000:42c2:b0:3a0:b84d:60cc with SMTP id
 ffacd0b85a97d-3b5f187ebeamr8569145f8f.2.1752534555777; 
 Mon, 14 Jul 2025 16:09:15 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:150d:fc00:de3:4725:47c6:6809])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc3a62sm13380445f8f.40.2025.07.14.16.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 16:09:15 -0700 (PDT)
Date: Mon, 14 Jul 2025 19:09:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL 69/97] hw/arm/virt-acpi-build: Modify the DSDT ACPI table to
 enable ACPI PCI hotplug
Message-ID: <e48e0ababd51b8552a08bded786e0297c72a613c.1752534227.git.mst@redhat.com>
References: <cover.1752534227.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1752534227.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9gS7RLAiXdsiEszyQseXfAC4B5vDqVo-jKJ_1MAgErw_1752534556
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Eric Auger <eric.auger@redhat.com>

Modify the DSDT ACPI table to enable ACPI PCI hotplug.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20250714080639.2525563-24-eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/pcihp.h  |  2 ++
 include/hw/arm/virt.h    |  1 +
 hw/acpi/pcihp.c          |  1 -
 hw/arm/virt-acpi-build.c | 17 +++++++++++++++++
 hw/arm/virt.c            |  2 ++
 5 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index 5506a58862..9ff548650b 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -38,6 +38,8 @@
 #define ACPI_PCIHP_SEJ_BASE 0x8
 #define ACPI_PCIHP_BNMR_BASE 0x10
 
+#define ACPI_PCIHP_SIZE 0x0018
+
 typedef struct AcpiPciHpPciStatus {
     uint32_t up;
     uint32_t down;
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 4375819ea0..365a28b082 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -80,6 +80,7 @@ enum {
     VIRT_ACPI_GED,
     VIRT_NVDIMM_ACPI,
     VIRT_PVTIME,
+    VIRT_ACPI_PCIHP,
     VIRT_LOWMEMMAP_LAST,
 };
 
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 2db2f16940..f1594e664a 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -43,7 +43,6 @@
 #include "qobject/qnum.h"
 #include "trace.h"
 
-#define ACPI_PCIHP_SIZE 0x0018
 #define PCI_UP_BASE 0x0000
 #define PCI_DOWN_BASE 0x0004
 #define PCI_EJ_BASE 0x0008
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3dc1cfcd67..b01fc4f8ef 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -969,6 +969,23 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_pcihp_slots(pci0_scope, vms->bus);
     }
 
+    if (vms->acpi_dev) {
+        bool acpi_pcihp;
+
+        acpi_pcihp = object_property_get_bool(OBJECT(vms->acpi_dev),
+                                              ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
+                                              NULL);
+
+        if (acpi_pcihp) {
+            build_acpi_pci_hotplug(dsdt, AML_SYSTEM_MEMORY,
+                                   memmap[VIRT_ACPI_PCIHP].base);
+            build_append_pcihp_resources(pci0_scope,
+                                         memmap[VIRT_ACPI_PCIHP].base,
+                                         memmap[VIRT_ACPI_PCIHP].size);
+
+            build_append_notification_callback(pci0_scope, vms->bus);
+        }
+    }
     aml_append(dsdt, pci0_scope);
 
     /* copy AML table into ACPI tables blob */
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8070ff7b11..817adedb31 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -76,6 +76,7 @@
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/pcihp.h"
 #include "target/arm/cpu-qom.h"
 #include "target/arm/internals.h"
 #include "target/arm/multiprocessing.h"
@@ -186,6 +187,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
     [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
     [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
+    [VIRT_ACPI_PCIHP] =         { 0x090c0000, ACPI_PCIHP_SIZE },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
-- 
MST


