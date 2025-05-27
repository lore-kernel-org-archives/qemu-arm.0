Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4648106njc;
        Tue, 27 May 2025 00:44:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUy4RwGKnDKCOg48gOq9jLiY7uvr4LO27fZ1K8TO0/nzCg1uuV4nJs+fLVEmtvIolpR9g+3zC0jFO5y2Q==@linaro.org
X-Google-Smtp-Source: AGHT+IG2x6xBAkwu/JLHinmhstKQtcUO0xP7AH0nKoLiZaYOVmZfBl5Wma+AY8DgtC4I5e2hMtwi
X-Received: by 2002:a05:6214:764:b0:6f2:b7cd:7cac with SMTP id 6a1803df08f44-6fa9d1745e4mr221862166d6.31.1748331841840;
        Tue, 27 May 2025 00:44:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331841; cv=none;
        d=google.com; s=arc-20240605;
        b=eV1boqUcD7B7o9zU1KsHyonf5/h8bCSj/DPuyCaa8jkuBzM3I6G6YI3EkJwmeiKC2A
         PrzuIjEvajNO0VFEO9FRHMYjuW/GtIjMGoI6DnzpykhHvSef+AfQ7FiQ7QOagDnBvbkJ
         zAle3rOLU9dFNL6LxrA4kZ80hgPOsY5F5n0wDeseondMoIdx2NRtgF+an9/dAk0o6V93
         J7heJuOxPp9Iq1niXxJJA022/jv7vC+kTJ7fJcn15Cedzf3gy5vO/roFgSj3nLsglWxX
         Ewj/bMBX9h3DwXnxRqBaZsEpdBS0w2W1qc1HB/JqEcOeu29k+zI3mywkvqCGK49LZtqX
         T05g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1eVB/3yTM8t3rU6zRyP8dyAWqxoevMw86hNW+Tlbtnw=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=D9iq8BQy/7sQkTfyUYSYuqCgN2ctUDouKO1jkDUfTO1OBG71XoSwuw0jN7/p70Icgw
         BrzJy0pGLx6aHMMmoez9TNxSBUPkoXd12PuITypucLFUxU08JdTZiHBKfjNeklpJ4Z85
         ClgGhTIcv9HHyau/enoBQu96l7jTpubGHZ8g8g9qiTi2q9vA+34zKK3487SeKapSnCPH
         /wWl6jglM8ETsXiuqgPPHr7Iq5s8Szb8d9haYuhC4JQjsIC1zJVaC3Na7zfhMFwWF+kD
         zLllSVxyPR4awLJEUB7Qvq2G2lZR2Up2kloxQZ7kQQaoUPCsup9jOKQPW5l/9inJUFsn
         70uA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cjhMFAwZ;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fab8db8750si552516d6.367.2025.05.27.00.44.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:44:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cjhMFAwZ;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748331841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1eVB/3yTM8t3rU6zRyP8dyAWqxoevMw86hNW+Tlbtnw=;
	b=cjhMFAwZM9tBKtD5QOyGbrmwlnc7z9tQsJaf61ox2P3GPo2oMaA429xahzK7/iTJmqS7lC
	9YDhZivFPIRNses1uvwM64ACGqhpI31DhWPCBQ144vVOF7v2VzFwYk6K/joNrb8fYj0cvT
	NnaXuRPkDJsiNNJ3b5EHsQKMSGPIpHM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-649-nZhXOfc-OpyNSiYgaQFN2w-1; Tue,
 27 May 2025 03:44:00 -0400
X-MC-Unique: nZhXOfc-OpyNSiYgaQFN2w-1
X-Mimecast-MFC-AGG-ID: nZhXOfc-OpyNSiYgaQFN2w_1748331839
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D660D18002A5;
	Tue, 27 May 2025 07:43:58 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 79DA11944DFF;
	Tue, 27 May 2025 07:43:54 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	gustavo.romero@linaro.org,
	anisinha@redhat.com,
	mst@redhat.com,
	shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 17/25] hw/arm/virt-acpi-build: Modify the DSDT ACPI table to enable ACPI PCI hotplug
Date: Tue, 27 May 2025 09:40:19 +0200
Message-ID: <20250527074224.1197793-18-eric.auger@redhat.com>
In-Reply-To: <20250527074224.1197793-1-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: olheN8d/GoT2

Modify the DSDT ACPI table to enable ACPI PCI hotplug.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/arm/virt.h    |  1 +
 hw/arm/virt-acpi-build.c | 21 +++++++++++++++++++++
 hw/arm/virt.c            |  1 +
 hw/arm/Kconfig           |  2 ++
 4 files changed, 25 insertions(+)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 10ea581f06..1b2e2e1284 100644
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
index be5e00a56e..9d88ffc318 100644
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
@@ -836,6 +837,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                          (irqmap[VIRT_MMIO] + ARM_SPI_BASE),
                          0, NUM_VIRTIO_TRANSPORTS);
     acpi_dsdt_add_pci(scope, memmap, irqmap[VIRT_PCIE] + ARM_SPI_BASE, vms);
+
     if (vms->acpi_dev) {
         build_ged_aml(scope, "\\_SB."GED_DEVICE,
                       HOTPLUG_HANDLER(vms->acpi_dev),
@@ -864,6 +866,25 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     aml_append(dsdt, scope);
 
+    if (vms->acpi_pcihp) {
+        Aml *pci0_scope = aml_scope("\\_SB.PCI0");
+
+        aml_append(pci0_scope, aml_pci_edsm());
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
     /* copy AML table into ACPI tables blob */
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a0deeaf2b3..4aa40c8e8b 100644
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
