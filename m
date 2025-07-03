Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp505365dyc;
        Thu, 3 Jul 2025 05:38:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKHAiWVYSJMy45A9BhEkqXl3PyMNZj2d1G41MYyOqvxpgBC0hESCn17mfQa2V8ClP2E/CbJXJBnqGlFA==@linaro.org
X-Google-Smtp-Source: AGHT+IFlVq/D1Mm3Rl0ysi8Rrc2ELx1yTPDst/terthb1GCJZbK28PkcfUCZJu9NriN1/HlIhJgK
X-Received: by 2002:a05:6214:1d2b:b0:6fa:c67f:5e66 with SMTP id 6a1803df08f44-702bc949556mr50295116d6.39.1751546299197;
        Thu, 03 Jul 2025 05:38:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546299; cv=none;
        d=google.com; s=arc-20240605;
        b=dEkxTV4jnx5n6wJ6ixJcoy2PJslqwT7oxHWHPAJdzcOdd35l3ldYv8Vj7J2oXuIUW5
         WSGLgoBwa6+gRkalbBDL5T9s9d7/5LCm3AiCEpSakCA7TFR9vugE7rNzYeTStcdr3K89
         k8RGPvwSxYw0UyHjUkbsHf5gV1aiScY7BMeGfUa2R72WVcX3+wTur5+9/BTYDiVDfP8V
         XenhuqBVbFz2exMqtgGHiIE0Mfd6AjZhcorQwkhnuiyiRazg+QnXz3MHVPW+WWJggh5U
         1RHu1VXM6kydJC3DKjQYedMrIpLkE1bcM1AcdhWD1WmhUQyC+FCC84ZZqKV5FuC8eY4l
         h8aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qLaMDFzZjY+u32IAfNjad79BEhlHi5t75wvKla/0++E=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=bJ/YreIIhTP//hunGUp+ql+Ipu6rnn+c8eqPEgijgCTUMY4ZE6pn0IFJtlpOclIdCn
         c7kEqeb46DCcvU77LkoQ0B2xpR2CvioiI+BSy8CyvlKaVKWZQMneuPLvi2ghNkihzc4y
         6VaoMNF4gvkF6bMUbBa6reNAThj7TAlyEi9kLzzNFRuwvV0bEVHv5xsy4hrQ8loA1lc0
         h/AZDt/7ZIzqlCCxWcMUYxkFnb2QO3HM3mdEQiBIwsLbsOyby2imgg7y6ppymoLvrFG2
         eTTXM1Mt/Ny0t3sltOqsZ4EvS9Fx8Uwme1iH+Yw0fECJ4o2G+eXdhoWKHJnzPfI5mxbR
         V3qA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Y/bSEUlx";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d4432259b6si1369239285a.267.2025.07.03.05.38.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:38:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Y/bSEUlx";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qLaMDFzZjY+u32IAfNjad79BEhlHi5t75wvKla/0++E=;
	b=Y/bSEUlx8LePtaDV+Op90nEPyXC3KQyQPjALg8DJ9XcVtKH4jw2YHm7N7qX6s7dXAanxF0
	/FHMnbaJZ+B8P7c+RSPUPNWLWeKU1osIT4PRqrhx0Uh9Ypjrf5i0j1NFvwxYzQZEsD7J/r
	HQL5XVqoYV2r6jjpBdf8VH8womXmMjY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-ply-y_rsNhOiy-YRWybOWQ-1; Thu,
 03 Jul 2025 08:38:15 -0400
X-MC-Unique: ply-y_rsNhOiy-YRWybOWQ-1
X-Mimecast-MFC-AGG-ID: ply-y_rsNhOiy-YRWybOWQ_1751546294
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 517BC18002E4;
	Thu,  3 Jul 2025 12:38:14 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 59159180045C;
	Thu,  3 Jul 2025 12:38:09 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	Jonathan.Cameron@huawei.com,
	gustavo.romero@linaro.org,
	anisinha@redhat.com,
	mst@redhat.com,
	shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v5 07/36] hw/pci-host/gpex-acpi: Use GED acpi pcihp property
Date: Thu,  3 Jul 2025 14:35:07 +0200
Message-ID: <20250703123728.414386-8-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: LlYkXcvz3cLX

Retrieve the acpi pcihp property value from the ged. In case this latter
is not set, PCI native hotplug is used on pci0. For expander bridges we
keep pci native hotplug, as done on x86 q35.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

---
v4 -> v5:
- check vms->acpi_dev

v3 -> v4:
- Use object_property_get_bool (Igor)
- rework the commit description (Igor)

v2 -> v3:
- don'use the virt arm machine option anymore.
---
 include/hw/pci-host/gpex.h | 1 +
 hw/arm/virt-acpi-build.c   | 9 +++++++++
 hw/pci-host/gpex-acpi.c    | 3 ++-
 3 files changed, 12 insertions(+), 1 deletion(-)

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
index cd90c47976..a2f31be9ec 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -123,12 +123,21 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
                               uint32_t irq, VirtMachineState *vms)
 {
     int ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
+    bool acpi_pcihp = false;
+
+    if (vms->acpi_dev) {
+        acpi_pcihp = object_property_get_bool(OBJECT(vms->acpi_dev),
+                                              ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
+                                              NULL);
+    }
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
