Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp788156dye;
        Fri, 27 Jun 2025 02:58:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUwFMLnRdAtp3iwFWoaTmAj0i4qf1nO0Ena0b0/EMkpHI2tMe9OkhsASna0iOiYQZzEcnyNeE97jnNK3Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFJI+bDrNcrKmaGtTOkrtxZQ7DMfyT5B8Zn5cxPcH3qqpAL4XGfncfvwy1WyVZhR3BV1b2F
X-Received: by 2002:ac8:5fd2:0:b0:47a:e1b1:c6c9 with SMTP id d75a77b69052e-4a7fcae5de7mr39818221cf.42.1751018295826;
        Fri, 27 Jun 2025 02:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018295; cv=none;
        d=google.com; s=arc-20240605;
        b=KCtsVpmnrfDBmvKasCHFhQfB86zRcMw+oiwP4MHHMTa8Z7I3dHsuDesLbhhAeiVwuw
         mLe/gSiMgK8lSoFJox9sdX/guv1tuDkhzYTQITVTtMQjgFilqtLuYhDcAhqL7QiHM/YF
         Yn3T2jCGve1nZuDF22FkRaWF2/w3ZHoJXQvMVQS/XTn7d0bbn6ESD8XJLdBZ3+dymdG7
         UwiZ3zcYMuLfw0BlG75im5he7n+eSdRhnMjE4qtRwvnnUmECCJlqvZL0+IxapasNmEoq
         t+REw5+GV8HWORSBMRTCQCI/FkKfC2Fsqb/umjmSwKJ5/TlnFxbLXRdDwi/yBQlMSB5L
         jVKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=sm2bM+8cqCRH4BtCAxabEh2omERCplS5pCQo9etPPQA=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=h8IcJM4w8kGyCyUVoa2xEVOX0qW8UWFZs8hZBpyeavfELoUz8mRX8ZcUzT8Tro5cXa
         sjdvhl4qmDSLy1wMU6GLSWPucIAgwmSe7JpRk9O0aIyRRp1c4gjxKU6wDPpUm5S5sAwy
         7+F6x4oWA5pNcP5ZwQ6N7JV8/Ft/7DUpDSfG8QW0svKlOacNK/9HMdj45odEo9bGCOcP
         5UhZFVqYqEX/qvkOapoU4QX8TgFEAG++q4Az+jyzKhzkN52VyLFmmTUlRPbf0NK2psX4
         4Ce3BboW4GZdopmVNSbeQfzzLtQeaqPbM2jpXQ8WJRpFMJ40r8BTpzSERx5I+2HjtJzc
         f1Bg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q23KwkQu;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc554cc7si18383361cf.524.2025.06.27.02.58.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:58:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q23KwkQu;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sm2bM+8cqCRH4BtCAxabEh2omERCplS5pCQo9etPPQA=;
	b=Q23KwkQuG8mBgU6mt3S0VAIy1WZC8XwD3tIWuRiMrg5aiOOG/zIchKolReUPmJG/cS7syH
	N9WPutP6GnjRKz+ebi0TFWEQBcTNXn7jTkQBttHvI+fPPTm41HbiWokrBluYVVqo8K4/sR
	D+Jf8WmixtLzOKxYl6s+73ktLpNdhQw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-7-3VWrTRvCOrmVVnqTia1LCw-1; Fri,
 27 Jun 2025 05:58:10 -0400
X-MC-Unique: 3VWrTRvCOrmVVnqTia1LCw-1
X-Mimecast-MFC-AGG-ID: 3VWrTRvCOrmVVnqTia1LCw_1751018289
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2803B1801222;
	Fri, 27 Jun 2025 09:58:09 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B133119560A7;
	Fri, 27 Jun 2025 09:58:04 +0000 (UTC)
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
Subject: [PATCH v4 20/32] hw/arm/virt-acpi-build: Modify the DSDT ACPI table to enable ACPI PCI hotplug
Date: Fri, 27 Jun 2025 11:55:09 +0200
Message-ID: <20250627095620.3300028-21-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 6z0/eCiVS1DX

Modify the DSDT ACPI table to enable ACPI PCI hotplug.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v3 -> v4:
- use property accessor
- removed ACPI_PCIHP_SIZE which is already in the header
- make addition of EDSM unconditional

v2 -> v3:
- use ACPI_PCIHP_SIZE instead of 0x1000 (Igor)
- use cihp_state->use_acpi_hotplug_bridge
---
 include/hw/acpi/pcihp.h  |  2 ++
 include/hw/arm/virt.h    |  1 +
 hw/acpi/pcihp.c          |  1 -
 hw/arm/virt-acpi-build.c | 13 +++++++++++++
 hw/arm/virt.c            |  2 ++
 5 files changed, 18 insertions(+), 1 deletion(-)

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
index 9a1b0f53d2..0ed2e6b732 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -79,6 +79,7 @@ enum {
     VIRT_ACPI_GED,
     VIRT_NVDIMM_ACPI,
     VIRT_PVTIME,
+    VIRT_ACPI_PCIHP,
     VIRT_LOWMEMMAP_LAST,
 };
 
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index e79a24b821..36492aa0d9 100644
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
index 57847658a1..50bd559181 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -817,6 +817,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
     Aml *pci0_scope;
+    bool acpi_pcihp;
 
     acpi_table_begin(&table, table_data);
     dsdt = init_aml_allocator();
@@ -878,6 +879,18 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_pcihp_slots(pci0_scope, vms->bus);
     }
 
+    acpi_pcihp = object_property_get_bool(OBJECT(vms->acpi_dev),
+                                          ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, NULL);
+    if (acpi_pcihp) {
+        aml_append(pci0_scope, build_pci_bridge_edsm());
+        build_acpi_pci_hotplug(dsdt, AML_SYSTEM_MEMORY,
+                               memmap[VIRT_ACPI_PCIHP].base);
+        build_append_pcihp_resources(pci0_scope,
+                                     memmap[VIRT_ACPI_PCIHP].base,
+                                     memmap[VIRT_ACPI_PCIHP].size);
+
+        build_append_notification_callback(pci0_scope, vms->bus);
+    }
     aml_append(dsdt, pci0_scope);
 
     /* copy AML table into ACPI tables blob */
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 99fde5836c..d4e671617a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -75,6 +75,7 @@
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/pcihp.h"
 #include "target/arm/cpu-qom.h"
 #include "target/arm/internals.h"
 #include "target/arm/multiprocessing.h"
@@ -183,6 +184,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
     [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
     [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
+    [VIRT_ACPI_PCIHP] =         { 0x090c0000, ACPI_PCIHP_SIZE },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
-- 
2.49.0
