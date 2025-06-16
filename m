Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1740958njc;
        Mon, 16 Jun 2025 02:49:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU/dTA83GGWV3ESwCwmPOGyZa0mbwv+C7ALh/Z8PRGDUi3QUtZEGSkC4lbe4vwYIoAxyu3mvTX/2z6ftQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE5f8K9b+k2l/fuiMMay9A7LdIIFR10N0qJzm/84ylL9gzyjeIhwR1mEYvo1UtUGyDX1Npi
X-Received: by 2002:a17:90b:3d11:b0:311:a314:c2cf with SMTP id 98e67ed59e1d1-313f1d1dd39mr13730334a91.30.1750067399074;
        Mon, 16 Jun 2025 02:49:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067399; cv=none;
        d=google.com; s=arc-20240605;
        b=chsED8GYGoDqvaxaS3pmcJQrs6/lXI7oGlekO2PsA3gqMoHNw+kBLZ9jPKStsV7/qz
         CVv0KRTBkPMYBTyAo7C0WBg68EeeP1jFNsWcWVId5MRgq9CmUvPLDvPlZ3IKS6igQAaO
         GP94i2+a5A9vlSBVx7f8+FX/FSwkLPCwuu06D5924KHrPk6ZX0qtrHfraqMNV0dwfiKz
         JS2QanWnm+4cOjIZ05OR0q398BMEpWfDDLenCrijQoYRD4N05nDezLTvC4UvNknUyLOr
         T9X2oLMoFqN9b5knTr553kYq8LK3UTPss28m4v9AscPEk1s5nQroWzid00gV3ko6X3yC
         TkUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EBDTlGkNPNB8YVIHXjnwTsNLhegE3noyWICEZuycgeQ=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=AWmMDQVjbPftNYpj2CjSWGjvtGyJ7lqOqgaIwu8DQOGL7h2ZZtl9e8Ikns0oboTF9b
         WNyGUqWvykFXSsJgBqVo2fyaD39WMMVzRLKV/YLj9OMvR4Y/poyV0hkyDIKcGQgtcxu/
         4l6HU8AAzEv85IFZ7iSV1o9fXqa9/A2a/5doAT2l47qYgATbYey9nKQwEGdNgkglEk3y
         DCScE7FtpmJ2UX+ID4cGaYyG0cE8zMQjBba4ijEeFEyRB0jFfSHiz03XMEScSRwvd7VT
         ltwUHV4ZvdIgHhfed4zqkM1mA/wwbXbl6TgKksRcJKpkpjjF83cHaqNfJidL1k636CCn
         yUCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EcM6FeWy;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-313c1a1c5aesi12788609a91.79.2025.06.16.02.49.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:49:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EcM6FeWy;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EBDTlGkNPNB8YVIHXjnwTsNLhegE3noyWICEZuycgeQ=;
	b=EcM6FeWy43YlVb08CRtJlzJ9ud0zi0gtScDq2t2MNUD3H4HtAzDsn7JIFZ3fQSbATb3CpE
	rzX4dNHq3/yW6Uef95npXcs905mrCsmodlRUX2vRJjkQ9u+rmX8Qo2VaU9lXSNd/V88V5m
	yI7sUSTuNRGseZ7uSdvjdU4oBQ44gO0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-488-Fnh2qS68PV2Irz1wgt8XeA-1; Mon,
 16 Jun 2025 05:49:53 -0400
X-MC-Unique: Fnh2qS68PV2Irz1wgt8XeA-1
X-Mimecast-MFC-AGG-ID: Fnh2qS68PV2Irz1wgt8XeA_1750067391
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BFD071944B12;
	Mon, 16 Jun 2025 09:49:51 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 23C8019560AB;
	Mon, 16 Jun 2025 09:49:45 +0000 (UTC)
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
Subject: [PATCH v3 07/29] hw/pci-host/gpex-acpi: retrieve and use GED acpi_pcihp setting
Date: Mon, 16 Jun 2025 11:46:36 +0200
Message-ID: <20250616094903.885753-8-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: n0V1JA/PRbxX

retrieve the acpi_pcihp option value from the ged. In
case acpi_pcihp is unset we configure pci native hotplug on
pci0. For expander bridges we keep legacy pci native hotplug,
as done on x86 q35.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

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
index 7e8e0f0298..d7547c8d3b 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -123,12 +123,17 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
                               uint32_t irq, VirtMachineState *vms)
 {
     int ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
+    AcpiGedState *acpi_ged_state = ACPI_GED(vms->acpi_dev);
+    AcpiPciHpState *pcihp_state = &acpi_ged_state->pcihp_state;
+
+
     struct GPEXConfig cfg = {
         .mmio32 = memmap[VIRT_PCIE_MMIO],
         .pio    = memmap[VIRT_PCIE_PIO],
         .ecam   = memmap[ecam_id],
         .irq    = irq,
         .bus    = vms->bus,
+        .pci_native_hotplug = !pcihp_state->use_acpi_hotplug_bridge,
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
