Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1741282njc;
        Mon, 16 Jun 2025 02:50:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTJMJUr8dAz/klePl5uMybE5QHHwOJWTPTCZwJR0WIg+PEKUFKsGWMRRSQldtH1+xLlHN6wE535VUmcQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGcqoFqBApv8wMWa/soGU5TFJYskT0jHTGyQteiYqtOREc6TctcPFJ2nsKYR2Fd/tWFs7vr
X-Received: by 2002:a17:902:e881:b0:234:bca7:2926 with SMTP id d9443c01a7336-2366b3c5a98mr122825055ad.27.1750067448539;
        Mon, 16 Jun 2025 02:50:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067448; cv=none;
        d=google.com; s=arc-20240605;
        b=Z5gcZqmyn0BN5xNlGZyA0nU3psi9C6QQ2To9DkQ2H+c8RBEaS/uj3WRZbwbdaVhu3w
         8+DuK2tGnmfKL/lvuY61RwWWtsbaugUvDdqY51KTKYC3CJLj/llxZFaEeek7PJD0UxeZ
         kpDJOTLOdcKbgsDuxfdzOa46pDNBmk/1PYcYu0AHPiAD2sm9X0tugpDOAM+plsm741FN
         YtGKqyyRGe8aeLyXDhMwg+o//MKN0WHooedw7Cj2BY0KHYLORn2UICuadjQbyK+KdRLb
         r8fubZb2fC8cC5MNxMEJylvdAmJZT+sFo56CX/4OpMPUjG9wluzXZpVh7ZRZWn2KSqJB
         cw+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WKVQto9etgdCXb2rK2j5Eirh53KvrKCUvuuDnRbTpdg=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=QLrf+m7qGO1L2O6wgRFbsikcd7jfqSWw8FwlHyM5VOjqsCkB/kx3iaQn+M06B+mpSu
         F0x7iLf5UmasDxme1kaaXek7CHOpecAksVF4s5t/xgW6cOlfXTqXKsW3rx+413VZJmpW
         Uh703lR73hv/1hTN7ihI79cwgmqxDRn6dAZi3ELZU/eR+ElM54lYfNYKgzHl/lhm//vi
         fzwSKtgrKEIAgNDQGnN/7iAva9wBL8lFovxRR0GSJtcG+o4E0pLNrY0ksXp+5nvlhEqP
         SZ8wjDVR69K5W8rb5QuuUH46Xk2EfquhfJHAsaEKjt3pQEtiKJb1VSp+zS46DfQmPsKr
         1C/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i3NdOKV8;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 41be03b00d2f7-b2fe1691fffsi9220514a12.483.2025.06.16.02.50.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:50:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i3NdOKV8;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WKVQto9etgdCXb2rK2j5Eirh53KvrKCUvuuDnRbTpdg=;
	b=i3NdOKV8sWKYnZN3nFcK6KXEUFFkzWnFQTMfLZkhmbSYMYy/QN2DCJXeimxfAKVb9diqIs
	y0Q4uix9aurySayFfc1vXyLzzDc0Lcy4XOW5LtopzMfp9an2vx1V1nFJdC4Feuuzobkz8h
	UvaoYbseXel2WGaAd5U08SxPEfGFVTI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-300-R82PejqLM_WYNRw-0ZdAIg-1; Mon,
 16 Jun 2025 05:50:45 -0400
X-MC-Unique: R82PejqLM_WYNRw-0ZdAIg-1
X-Mimecast-MFC-AGG-ID: R82PejqLM_WYNRw-0ZdAIg_1750067443
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AA8BA19560B1;
	Mon, 16 Jun 2025 09:50:43 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5307919560AB;
	Mon, 16 Jun 2025 09:50:39 +0000 (UTC)
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
Subject: [PATCH v3 17/29] hw/arm/virt-acpi-build: Modify the DSDT ACPI table to enable ACPI PCI hotplug
Date: Mon, 16 Jun 2025 11:46:46 +0200
Message-ID: <20250616094903.885753-18-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 62d/pjcF6AqT

Modify the DSDT ACPI table to enable ACPI PCI hotplug.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v2 -> v3:
- use ACPI_PCIHP_SIZE instead of 0x1000 (Igor)
- use cihp_state->use_acpi_hotplug_bridge
---
 include/hw/acpi/pcihp.h  |  2 ++
 include/hw/arm/virt.h    |  1 +
 hw/arm/virt-acpi-build.c | 22 ++++++++++++++++++++++
 hw/arm/virt.c            |  2 ++
 hw/arm/Kconfig           |  2 ++
 5 files changed, 29 insertions(+)

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
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index d7547c8d3b..a2e58288f8 100644
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
@@ -809,6 +810,8 @@ static void
 build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
+    AcpiGedState *acpi_ged_state = ACPI_GED(vms->acpi_dev);
+    AcpiPciHpState *pcihp_state = &acpi_ged_state->pcihp_state;
     Aml *scope, *dsdt;
     MachineState *ms = MACHINE(vms);
     const MemMapEntry *memmap = vms->memmap;
@@ -868,6 +871,25 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     aml_append(dsdt, scope);
 
+    if (pcihp_state->use_acpi_hotplug_bridge) {
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
index 9a6cd085a3..08bd808499 100644
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
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index f543d944c3..dee4d6dd25 100644
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
