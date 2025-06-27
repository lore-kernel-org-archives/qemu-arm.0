Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp788093dye;
        Fri, 27 Jun 2025 02:58:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCn/xEkxjltR5Ea3r+HLK7/Oc5q6174tulkXDtvMraaZDt5K5aCFM85vqeOkI6/rLLJFXd/CPcjvCC4w==@linaro.org
X-Google-Smtp-Source: AGHT+IFTQ0r8hCc5T9depvaOqEpnaSK8x7BSfQdclawBzWrEGXL9nWrWL5Q3KpOsHvJMsUwhPRzh
X-Received: by 2002:a17:903:4b43:b0:234:11e2:f41 with SMTP id d9443c01a7336-238e9e19013mr89881435ad.6.1751018285249;
        Fri, 27 Jun 2025 02:58:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018285; cv=none;
        d=google.com; s=arc-20240605;
        b=Y6WlrcxcDSEazlNlIWTRaYjFzJky1T+emn4K09jcD+k+t8hraKBUTXxEU6dgVIi5fN
         NIkOmUQbsQlgNFrkPU7eGKDP8NQj0zLHAZKtYeCGgyPqyGWv9I64EERGPRtgFsw7v070
         B/YyY/WfVueMfGFPqxBpig7vtNgIIQBniXyV5lKwrHfhwumQQZCU590AU9icmzTXkw56
         brzVq/LhitsSF1QJ4IdubVkBTCGilspTN+jaZGXCzjwqEzlsZ7w0ExAqlrcmsjEDrG4x
         oU3CdG7nCVrbwyPU0dPEkGQi7rBP7hHoCmi8ReZ0HuD3tCH9nG7m/eO2iR8IwdO+Rcte
         96ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lth6kJchFUSL9cMC0qRxvViyBcwnbG983mQ8xInHP2I=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=ESgWhU0UiGPgZF37UP66sSX6I7UtAE7tBwvpiKQH0f/7O3KHFsjmOt1T4rMNkGzTX5
         GxHcl8Jq2fHk2H7RzsnRS7tCDMSYkXSH3Sw8VP8rCjJPj8CvoeUuiVy80QL+GT3WO1pQ
         tZFscBLbRqHCQ0hY0lpMhkA27mL+il8LeonqkbIIHTr78L0UJGK0FVgKo6azzzACQg44
         yhgks8Cy7ES37/kA8I+T11OlPSuK9+fEwciDQ/so6v80mDLSHXof9J3FzAtpSrN3K8da
         R4bSo6inIIcKmFLFiiewpnLsNjgWFe+NNq1C9i0DgGo9x9TvBiX8Wlg/pMZlsMJ7T/CB
         kpag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xtv1lG+2;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 41be03b00d2f7-b34e3014d07si1604312a12.134.2025.06.27.02.58.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:58:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xtv1lG+2;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lth6kJchFUSL9cMC0qRxvViyBcwnbG983mQ8xInHP2I=;
	b=Xtv1lG+2NGXTZzyLGRroKEf4xR+nH8DQ2R23kk+2Y66pKNrbejEXSWQmrLLY6EnInoWUhu
	TKW0TJPVFih8CC3Yn7e//lPIfXIB+F8vbkJMj5bmrF6M+pC/mnmIh5ASKvmAF9cEBPIVlS
	UwhwCKVi7bgKnKlPbQcWeRygCzDFRdo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-308-uWBOzjweMEWjFpCStt-3oQ-1; Fri,
 27 Jun 2025 05:58:00 -0400
X-MC-Unique: uWBOzjweMEWjFpCStt-3oQ-1
X-Mimecast-MFC-AGG-ID: uWBOzjweMEWjFpCStt-3oQ_1751018279
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3D35B1956096;
	Fri, 27 Jun 2025 09:57:59 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A953D19560A7;
	Fri, 27 Jun 2025 09:57:54 +0000 (UTC)
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
Subject: [PATCH v4 18/32] hw/arm/virt-acpi-build: Let non hotplug ports support static acpi-index
Date: Fri, 27 Jun 2025 11:55:07 +0200
Message-ID: <20250627095620.3300028-19-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: WgUFRKnzfL4R

hw/arm/virt-acpi-build: Let non hotplug ports support static acpi-index

Add the requested ACPI bits requested to support static acpi-index
for non hotplug ports.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt-acpi-build.c | 12 ++++++++++++
 hw/arm/Kconfig           |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 57634c1578..57847658a1 100644
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
@@ -815,6 +816,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     const int *irqmap = vms->irqmap;
     AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
+    Aml *pci0_scope;
 
     acpi_table_begin(&table, table_data);
     dsdt = init_aml_allocator();
@@ -868,6 +870,16 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     aml_append(dsdt, scope);
 
+    pci0_scope = aml_scope("\\_SB.PCI0");
+
+    aml_append(pci0_scope, build_pci_bridge_edsm());
+    build_append_pci_bus_devices(pci0_scope, vms->bus);
+    if (object_property_find(OBJECT(vms->bus), ACPI_PCIHP_PROP_BSEL)) {
+        build_append_pcihp_slots(pci0_scope, vms->bus);
+    }
+
+    aml_append(dsdt, pci0_scope);
+
     /* copy AML table into ACPI tables blob */
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
 
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
