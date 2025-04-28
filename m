Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5871329njd;
        Mon, 28 Apr 2025 03:30:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUi/vRDqI7NkpdueaKl3GFM101tVjjx2yIU2oYhiGGdS5aAoqFGtRV9hGW92EHpwmiMkQWRANdJi3FPVA==@linaro.org
X-Google-Smtp-Source: AGHT+IGee9ls8CiOPa5l0GjmUDwh0ZFCUQB/fdXhhqRURHL4ASa0Vcuiz/44+k67dZFkKSUL0DDA
X-Received: by 2002:a05:622a:46:b0:477:64b0:6a21 with SMTP id d75a77b69052e-48131de1816mr137220721cf.23.1745836236951;
        Mon, 28 Apr 2025 03:30:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745836236; cv=none;
        d=google.com; s=arc-20240605;
        b=kUsV5kU83PHviZSq6sOLGWmNGveWQzx9Qd6h6dCfNxQr2VawAN/m506PLWY4IKu1G1
         EfZgJdDujUuJ9K3A/7o9N9fnhhjnGOXmFlf+3MFO7tpdqrb7lJ7aNTTLm9HH+272sL0f
         n0xpAAGfpGGoLkRTjkcvRKl+qkrjYljjHs7CwsyHT/tvRY0HwdaJLhDem7yQlIVSVYXP
         EzWQTs6Q/1dpZJSW6WZNJixByWGTB2jPi4UP6M4CWmpvZn0yocltr44LXcPErFXkPyNi
         soOdC6VrxB96CU2ASD/QHn6wFByMhQ8nA2roM9o1LAC/vf2KfTJueit9ehTGy2euNiy1
         pc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FP1EDBkCtIzVpGewP8HTgOSv81F6EWJyR+4XPBO8K00=;
        fh=+sxB8NkS+xL+1QwPgIVnaMhN8Q9GX11v/uLdEosqQQA=;
        b=BZqG4JoEt720UZhBZFifVFjUjJREqPvvkRGMBKa6dgOPYUjzKyX9L/oEvhybLXONaI
         tFRkBFXYYgtJUppI53FAuPjB3SFXlXTOtQgDKaPmGEvJvDxuyj6uRjNj7NMc1ZNAbPPF
         zCfmz2xurAFGmUImHLz0Lp85z/j++Ar0JN5tQl+tJ3a67/b3byk1TMZij7RSSw37wj5R
         JQFzJhL39a6IiO2Hg+dn16XXn3jAZ3LQMfz6fMZZqTs6FMki9p/d6JvUnk9aXeBF6vrf
         XFr2t6O6lh0hi1oFMo9NfukTgoDStcWA/02c0pkbAP9eisqJmbWfekQFqIXX6BSpeKOL
         kKgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CgV2yruD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ea1986dc2si104964801cf.233.2025.04.28.03.30.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Apr 2025 03:30:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CgV2yruD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u9Ljh-0002oe-KI; Mon, 28 Apr 2025 06:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9Lie-0000LV-RB
 for qemu-devel@nongnu.org; Mon, 28 Apr 2025 06:28:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9LiX-0003Th-T4
 for qemu-devel@nongnu.org; Mon, 28 Apr 2025 06:28:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745836080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FP1EDBkCtIzVpGewP8HTgOSv81F6EWJyR+4XPBO8K00=;
 b=CgV2yruDZiLiFL4nIbHW2aLZsIYzczHEQWJOun8KUVe7K/LuUzE7qvx6rLqYS6LppG+Qc3
 lFtcavDF3FZbo6ON1xwG4Qz/wySr5j+oVkq368NP7Xa2wpAnwMGt902uZjpUl0xecZ0YHZ
 youhedCbYP2cTtOEARTEkxxOTmf1zyQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-657-0BQpCscRNNuaHNi_K9VeiQ-1; Mon,
 28 Apr 2025 06:27:58 -0400
X-MC-Unique: 0BQpCscRNNuaHNi_K9VeiQ-1
X-Mimecast-MFC-AGG-ID: 0BQpCscRNNuaHNi_K9VeiQ_1745836077
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 82D681800874; Mon, 28 Apr 2025 10:27:57 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.14])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CAB2A180045C; Mon, 28 Apr 2025 10:27:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com
Subject: [RFC 17/24] hw/arm/virt-acpi-build: Add DSDT additions for PCI hotplug
Date: Mon, 28 Apr 2025 12:25:43 +0200
Message-ID: <20250428102628.378046-18-eric.auger@redhat.com>
In-Reply-To: <20250428102628.378046-1-eric.auger@redhat.com>
References: <20250428102628.378046-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.492,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Sa/yLs6QBKhY

Generate additional DSDT description for ACPI PCI hotplug
support.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/arm/virt.h    |  1 +
 hw/arm/virt-acpi-build.c | 24 ++++++++++++++++++++++++
 hw/arm/virt.c            |  1 +
 hw/arm/Kconfig           |  2 ++
 4 files changed, 28 insertions(+)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 1e9d002880..b8ca753644 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -79,6 +79,7 @@ enum {
     VIRT_ACPI_GED,
     VIRT_NVDIMM_ACPI,
     VIRT_PVTIME,
+    VIRT_ACPI_PCIHP,
     VIRT_LOWMEMMAP_LAST,
 };
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 46c5a43d27..7bee57d489 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -34,6 +34,7 @@
 #include "hw/core/cpu.h"
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/pcihp.h"
 #include "hw/nvram/fw_cfg_acpi.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/acpi/aml-build.h"
@@ -840,6 +841,29 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                          (irqmap[VIRT_MMIO] + ARM_SPI_BASE),
                          0, NUM_VIRTIO_TRANSPORTS);
     acpi_dsdt_add_pci(scope, memmap, irqmap[VIRT_PCIE] + ARM_SPI_BASE, vms);
+
+    aml_append(dsdt, scope);
+
+    if (vms->acpi_pcihp) {
+        Aml *pci0_scope = aml_scope("\\_SB.PCI0");
+
+        build_acpi_pci_hotplug(dsdt, AML_SYSTEM_MEMORY,
+                               memmap[VIRT_ACPI_PCIHP].base);
+        build_append_pcihp_resources(pci0_scope,
+                                     memmap[VIRT_ACPI_PCIHP].base,
+                                     memmap[VIRT_ACPI_PCIHP].size);
+
+        /* Scan all PCI buses. Generate tables to support hotplug. */
+        build_append_pci_bus_devices(pci0_scope, vms->bus);
+        if (object_property_find(OBJECT(vms->bus), ACPI_PCIHP_PROP_BSEL)) {
+            build_append_pcihp_slots(pci0_scope, vms->bus);
+        }
+        build_append_notification_callback(pci0_scope, vms->bus);
+        aml_append(dsdt, pci0_scope);
+    }
+
+    scope = aml_scope("\\_SB");
+
     if (vms->acpi_dev) {
         build_ged_aml(scope, "\\_SB."GED_DEVICE,
                       HOTPLUG_HANDLER(vms->acpi_dev),
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1601750913..2790853927 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -183,6 +183,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
     [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
     [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
+    [VIRT_ACPI_PCIHP] =         { 0x090c0000, 0x00001000 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index a55b44d7bd..572b4dabd5 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -34,6 +34,8 @@ config ARM_VIRT
     select ACPI_HW_REDUCED
     select ACPI_APEI
     select ACPI_VIOT
+    select ACPI_PCIHP
+    select ACPI_PCI_BRIDGE
     select VIRTIO_MEM_SUPPORTED
     select ACPI_CXL
     select ACPI_HMAT
-- 
2.49.0

