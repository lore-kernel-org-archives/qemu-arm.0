Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp787803dye;
        Fri, 27 Jun 2025 02:57:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUxP+dfaFrXZSnFRqQVtRibt2yrGGrtw7wNsv38/d6zS+jX24KkNceGnTgj3zamAcGIZ1UlCVLqw0skmQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHN6Av8ebbgy5l2vPtjfef38SdJRQ3qAoU26TIVYReGG1hneaTzvjQcSOxvYl2ophpJIBbw
X-Received: by 2002:a05:6214:2f8c:b0:6fa:c81a:6231 with SMTP id 6a1803df08f44-7000174dcb0mr48670476d6.8.1751018231485;
        Fri, 27 Jun 2025 02:57:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018231; cv=none;
        d=google.com; s=arc-20240605;
        b=eGmr3W6ow9TFbPtLC6mTcp0BxivHVGIaqw3s82nvdBkPCFeabYUl0tJWTcRZACrn70
         VFrDituvvjpmR6wgs4P7LsPws0JbBOEjuZrtGj+2JVgksI91Jkc/d0PTGA4JJBI08l5w
         sevTn+i/xDDB0dvqecpTCHaKf0vPDmkn2+vkbeSOpoch/2feK0gy/vJFvfsoJmQQZ0SU
         LkM8Ls09M9zSdACaOTfHrdsHj3fMviF2ibPYQK8DjFp848KP/vddkwobD4FGZYScb5IA
         lOclV1EqHo/DlBu5cuDoD3whajxppgH0/2ip5kQ2VuA9Yw7oAzObYrb5dTTHb2puyFqd
         Esag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Y+rlDCMnDitVamDggHNlwynSmyTa7ogLb8c8cgKBN+g=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=AJ8muq0IoqxIXK15kcwL4lLMNuvKwt5lVYt7ZHv9o2sV9fpt1ImyptnDSdK+8Nz7tp
         +H7Ni7FPQTFJ9jEnFdahMYfZH1c1T3XP1zAhNhMgaS57aZdM+/duLR7I2ksBB+CRZq26
         +RJAifcxAgIxCRrV33UDHojh6gDcprH8Mr6ly/A3lps4pBzYkwVksqYCA7ZfDkWLIAlw
         Ukd9Dsot+nhjA18QN6Lib3lbe81nhSf9mbbATVC2bNxyxQHHykcNctkzvGNbObUvBIA5
         c9NeR4o2PpEFCmYlvKImpVIbBnSb43LA+VRYRcjNAM4N57PLlg+CAskBlmdaXTTSKsSj
         pfmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R6B5v9Ii;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77385fe3si36407426d6.350.2025.06.27.02.57.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:57:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R6B5v9Ii;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y+rlDCMnDitVamDggHNlwynSmyTa7ogLb8c8cgKBN+g=;
	b=R6B5v9IiDydEWh2a8X0Ag1UzH1Gb4UzCOPt7zvZWlQBjoSzrMzxYhESnkzHkn/fR+6Qmum
	JiTNlskmlj0v7aVMPjqgef1PlwP+/I+330uAS1dsFbzUVNVYJZja7aL1trC9d3iPLjdSfH
	7w1wB4AWfMMnXdP3FYakNZjovywKWzg=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-130-0aKbv2msMN6dqgoA5-CCqg-1; Fri,
 27 Jun 2025 05:57:05 -0400
X-MC-Unique: 0aKbv2msMN6dqgoA5-CCqg-1
X-Mimecast-MFC-AGG-ID: 0aKbv2msMN6dqgoA5-CCqg_1751018224
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2C9FF1955ED1;
	Fri, 27 Jun 2025 09:57:04 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8DBA519560A7;
	Fri, 27 Jun 2025 09:56:59 +0000 (UTC)
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
Subject: [PATCH v4 07/32] hw/pci-host/gpex-acpi: Use GED acpi pcihp property
Date: Fri, 27 Jun 2025 11:54:56 +0200
Message-ID: <20250627095620.3300028-8-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 7Mf+2kzyBSpe

Retrieve the acpi pcihp property value from the ged. In case this latter
is not set, PCI native hotplug is used on pci0. For expander bridges we
keep pci native hotplug, as done on x86 q35.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v3 -> v4:
- Use object_property_get_bool (Igor)
- rework the commit description (Igor)

v2 -> v3:
- don'use the virt arm machine option anymore.
---
 include/hw/pci-host/gpex.h | 1 +
 hw/arm/virt-acpi-build.c   | 5 +++++
 hw/pci-host/gpex-acpi.c    | 3 ++-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index 84471533af..feaf827474 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -45,6 +45,7 @@ struct GPEXConfig {
     MemMapEntry pio;
     int         irq;
     PCIBus      *bus;
+    bool        pci_native_hotplug;
 };
 
 typedef struct GPEXIrq GPEXIrq;
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 7e8e0f0298..57634c1578 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -123,12 +123,17 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
                               uint32_t irq, VirtMachineState *vms)
 {
     int ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
+    bool acpi_pcihp = object_property_get_bool(OBJECT(vms->acpi_dev),
+                                               ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
+                                               NULL);
+
     struct GPEXConfig cfg = {
         .mmio32 = memmap[VIRT_PCIE_MMIO],
         .pio    = memmap[VIRT_PCIE_PIO],
         .ecam   = memmap[ecam_id],
         .irq    = irq,
         .bus    = vms->bus,
+        .pci_native_hotplug = !acpi_pcihp,
     };
 
     if (vms->highmem_mmio) {
diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index 80fc2bf032..44737a8d81 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -203,6 +203,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
             if (is_cxl) {
                 build_cxl_osc_method(dev);
             } else {
+                /* pxb bridges do not have ACPI PCI Hot-plug enabled */
                 acpi_dsdt_add_host_bridge_methods(dev, true);
             }
 
@@ -278,7 +279,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
     }
     aml_append(dev, aml_name_decl("_CRS", rbuf));
 
-    acpi_dsdt_add_host_bridge_methods(dev, true);
+    acpi_dsdt_add_host_bridge_methods(dev, cfg->pci_native_hotplug);
 
     Aml *dev_res0 = aml_device("%s", "RES0");
     aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
-- 
2.49.0
