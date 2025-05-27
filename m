Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4647957njc;
        Tue, 27 May 2025 00:43:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQXiZmWYMDOjuDNCVRda8Vr5k6iEw1vFX83v+2ANHSXLl/KchCfPHjDee02RNZRN5zncajVvaV5u0PvA==@linaro.org
X-Google-Smtp-Source: AGHT+IHUw4pLbTJooSSIj2WcmYgSW/b1g7WJ2PAHnqB6hQ8p73XyPrxQQ2S0IFp9sFWCoBB1fqdA
X-Received: by 2002:a05:620a:4608:b0:7c5:4cb7:ac97 with SMTP id af79cd13be357-7ceecbad4famr1556936685a.1.1748331814467;
        Tue, 27 May 2025 00:43:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331814; cv=none;
        d=google.com; s=arc-20240605;
        b=VWr2/+cAEJ0AOW8CvaGZ2hoq/kIY//n4mL+FwT6kUQgBNHS0k8p7Q16LPdI6AfbVzj
         CzB/DuLegJYzq7/ZJrtmuuDLGUPfVx/BmDjU7nmE5ceJm+Zs5mJizulYBVmdZJFLUuvY
         IIIwLrmwTFCv9PaRDzdMSGLkaiuw2Bp6/Yxi2qsPUGv0CR5tJ5b67wamPIW/iqlRSYyW
         HXgd/vcdmI9mKfYg228niNnvThYZvkxi687qyJPJm9z87dUCRrC0m0SbFtQbOV/nml60
         1Qicxcn6g0OESIUPfg615IFXmdrICnCYeXdKO1hc4m5VZEXbCKt7rA+W91o0if6MsnA2
         nztg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=X8Mj7MYJB8/MBONKbNj0hDVBsT2BlLCyjWkBG0D62Kg=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=dcfdjXxjVpTTJKh5jqHoMYGoupvPHeA4/ChxkUpDReSCJdG8m9sDHFRhf6IiZDnSQT
         pI9zp8D23iZbPBdcj6AsH1edeofb4hiMW17B2AwjTg7uPj94XvBo8QNXDqd2A3DlN6bM
         kj+GYdx11a5K2fqueltWh7QAI+sjMjTih2IMScOlR/xouCHeF2eciRoPJDpMrp3KtYkd
         Q6sWlI1FFOl8az3Wqg1wyhMGsIXOz38fqkaBonJ4xLlwHqmPVTTYVMdaePHnig7LKuMn
         17IAYt9oJfAo0jJJJJYdLc1mUbmfvBacxpdmcR9fIdQHgRZt0+2WIVD7wWRe2TDASQmP
         jBHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gYkYRCWn;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cd467cf095si2587193785a.101.2025.05.27.00.43.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:43:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gYkYRCWn;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748331814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X8Mj7MYJB8/MBONKbNj0hDVBsT2BlLCyjWkBG0D62Kg=;
	b=gYkYRCWnd7OfNByFfDvJmO6cZ6LPmEvfUGUdSAqa7f46BRX7bsg/nWX/IA4EvgunRIe1OB
	tluhZeoim6az8Ny7/JkajbHxbCWa8sLN3eG4ynf5Lo2r8BSLyJ3ZMtroewOCcEKXVxl711
	nRIeqPdQwfUmdmEDh5bJE9awBzyPEKs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-121-jMiYvdYgNu2yHd33eTGYyg-1; Tue,
 27 May 2025 03:43:30 -0400
X-MC-Unique: jMiYvdYgNu2yHd33eTGYyg-1
X-Mimecast-MFC-AGG-ID: jMiYvdYgNu2yHd33eTGYyg_1748331809
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1F3091955E79;
	Tue, 27 May 2025 07:43:29 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AF7E719560AA;
	Tue, 27 May 2025 07:43:24 +0000 (UTC)
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
Subject: [PATCH v2 11/25] hw/i386/acpi-build: Introduce build_append_pcihp_resources() helper
Date: Tue, 27 May 2025 09:40:13 +0200
Message-ID: <20250527074224.1197793-12-eric.auger@redhat.com>
In-Reply-To: <20250527074224.1197793-1-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: kQ7aDknMY5Kp

Extract the code that reserves resources for ACPI PCI hotplug
into a new helper named build_append_pcihp_resources() and
move it to pcihp.c. We will reuse it on ARM.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 include/hw/acpi/pcihp.h |  2 ++
 hw/acpi/pcihp.c         | 20 ++++++++++++++++++++
 hw/i386/acpi-build.c    | 15 ++-------------
 3 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index 971451e8ea..8a46a414cc 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -75,6 +75,8 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
 
 void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr);
 void build_append_pci_dsm_func0_common(Aml *ctx, Aml *retvar);
+void build_append_pcihp_resources(Aml *table,
+                                  uint64_t io_addr, uint64_t io_len);
 
 /* Called on reset */
 void acpi_pcihp_reset(AcpiPciHpState *s);
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index e0260f67e6..fb54c31f77 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -685,6 +685,26 @@ void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
     aml_append(table, scope);
 }
 
+/* Reserve PCIHP resources */
+void build_append_pcihp_resources(Aml *scope /* \\_SB.PCI0 */,
+                                  uint64_t io_addr, uint64_t io_len)
+{
+    Aml *dev, *crs;
+
+    dev = aml_device("PHPR");
+    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A06")));
+    aml_append(dev,
+               aml_name_decl("_UID", aml_string("PCI Hotplug resources")));
+    /* device present, functioning, decoding, not shown in UI */
+    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
+    crs = aml_resource_template();
+    aml_append(crs,
+        aml_io(AML_DECODE16, io_addr, io_addr, 1, io_len)
+    );
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    aml_append(scope, dev);
+}
+
 const VMStateDescription vmstate_acpi_pcihp_pci_status = {
     .name = "acpi_pcihp_pci_status",
     .version_id = 1,
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 91945f716c..52cef834ed 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1432,19 +1432,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
     /* reserve PCIHP resources */
     if (pm->pcihp_io_len && (pm->pcihp_bridge_en || pm->pcihp_root_en)) {
-        dev = aml_device("PHPR");
-        aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A06")));
-        aml_append(dev,
-            aml_name_decl("_UID", aml_string("PCI Hotplug resources")));
-        /* device present, functioning, decoding, not shown in UI */
-        aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
-        crs = aml_resource_template();
-        aml_append(crs,
-            aml_io(AML_DECODE16, pm->pcihp_io_base, pm->pcihp_io_base, 1,
-                   pm->pcihp_io_len)
-        );
-        aml_append(dev, aml_name_decl("_CRS", crs));
-        aml_append(scope, dev);
+        build_append_pcihp_resources(scope,
+                                      pm->pcihp_io_base, pm->pcihp_io_len);
     }
     aml_append(dsdt, scope);
 
-- 
2.49.0
