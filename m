Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4647780njc;
        Tue, 27 May 2025 00:43:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgD0t/MlicE/tIsoTyLRvmy0/3SUWJDzq+tmgAJPtBM8CUfn3R6ZqQ8hEKD9yqTCxr39OnXxHvyVWHdA==@linaro.org
X-Google-Smtp-Source: AGHT+IGhBYEsv6halHWQx8P3JKYFK43mDvaSchu9HKgxAt5yvhw4ExOFWdwsYJcfimy7EaCEuRIW
X-Received: by 2002:a05:620a:2849:b0:7c5:57b1:1fd1 with SMTP id af79cd13be357-7ceecc447fdmr1845134585a.47.1748331793740;
        Tue, 27 May 2025 00:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331793; cv=none;
        d=google.com; s=arc-20240605;
        b=UKsXeC1rhVTc5r7WnLkWG6xcDn6vxzhiKqNY3+T5+rfxGYAW6MW25/m9xgaLdjDPlO
         fFKDmZmIrdpPcKh8iahZfNMLVllcJjbrKOFiQOTAkyDkeMBJ9QGT1xgvruyb0vAZkpB9
         UFcHNufa0LI9ESJWxh2NTxujOmHQgN6c+U/RM13dB2lHt4s6tODV1ZsB0+29p4wsmmUf
         TTsh1e7SQLZjWvFeezOLOk3SmMVdffzmxcRwaRGLTr2cE69BGIHUzHl+QmzerTALhiuY
         dcBLn3+tJOllIzkEPJp09F/ffyCGSW2AIYbpI9RgLQIQt5q84tQ9/ytAd2a9W32trHZE
         rH7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ijiar7vSmLPiJk1gRfLBNWKmsMjdTJqON9KAMzrenFs=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=FAPrA6Y7wEtVuolyGZuOonCkFeXTKWvQBQRzUbP7ZOWYA96Wb0Z24BGn/7+F2qjvMb
         HMP8aJ2Ou7saUh0A4KG4tfDPGKSiwNjF7KqvSKJcvJ9ddk0n/T1L5HODcxn8l/20ES4N
         vzsu8YTZ0vadG68foO1mfdFlh5TnREVAIko03a7+ftc3pY0ks1nHFYZfGFcGnXpFeCLQ
         pSjaJVLW6WvTJDUu4WEcUHstvaTX2V3GKbvTnN7pQvsjI4XSDi8pgaeGWMfqGpCkwJUc
         UE9wvnxqmXKdTD6PksziWLvimnCWWCoaDjYBzrQm0Klwu0PH78D00+Ihla6LrOkCY0th
         EKzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hr3Z848Y;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cd468f1cfasi2645699985a.610.2025.05.27.00.43.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:43:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hr3Z848Y;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748331793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ijiar7vSmLPiJk1gRfLBNWKmsMjdTJqON9KAMzrenFs=;
	b=Hr3Z848YLVLwIQ1C1vYKfjxX+tg3r7F6E24FWh3bB4yfWzlEpw3/L4tx16+PvuRHZeWLI2
	7dgjw+7BfGXD5c/hxcE0OssXnozUnsrEtC2wHZNztcCWM346ltuOagyXoepYt8VvNcWArc
	yJ6QPYH4RFKvv0JEYNX2EbegujmX8Ps=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-571-Bmp5jlnUPPGVEreKXdg4kQ-1; Tue,
 27 May 2025 03:43:09 -0400
X-MC-Unique: Bmp5jlnUPPGVEreKXdg4kQ-1
X-Mimecast-MFC-AGG-ID: Bmp5jlnUPPGVEreKXdg4kQ_1748331788
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7EBC518004A7;
	Tue, 27 May 2025 07:43:08 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 09D2D19560AA;
	Tue, 27 May 2025 07:43:03 +0000 (UTC)
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
Subject: [PATCH v2 07/25] hw/i386/acpi-build: Turn build_q35_osc_method into a generic method
Date: Tue, 27 May 2025 09:40:09 +0200
Message-ID: <20250527074224.1197793-8-eric.auger@redhat.com>
In-Reply-To: <20250527074224.1197793-1-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: OuRDPIHtmZFn

GPEX acpi_dsdt_add_pci_osc() does basically the same as
build_q35_osc_method().

Rename build_q35_osc_method() into build_pci_host_bridge_osc_method()
and move it into hw/acpi/aml-build.c. In a subsequent patch we will
use this later in place of acpi_dsdt_add_pci_osc().

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 include/hw/acpi/aml-build.h |  2 ++
 hw/acpi/aml-build.c         | 50 ++++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c        | 54 ++-----------------------------------
 3 files changed, 54 insertions(+), 52 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index c18f681342..177d60b414 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -508,4 +508,6 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
 void build_spcr(GArray *table_data, BIOSLinker *linker,
                 const AcpiSpcrData *f, const uint8_t rev,
                 const char *oem_id, const char *oem_table_id, const char *name);
+
+Aml *build_pci_host_bridge_osc_method(bool enable_native_pcie_hotplug);
 #endif
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index f8f93a9f66..ba1dfe0b52 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2614,3 +2614,53 @@ Aml *aml_i2c_serial_bus_device(uint16_t address, const char *resource_source)
 
     return var;
 }
+
+Aml *build_pci_host_bridge_osc_method(bool enable_native_pcie_hotplug)
+{
+    Aml *if_ctx;
+    Aml *if_ctx2;
+    Aml *else_ctx;
+    Aml *method;
+    Aml *a_cwd1 = aml_name("CDW1");
+    Aml *a_ctrl = aml_local(0);
+
+    method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
+    aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
+
+    if_ctx = aml_if(aml_equal(
+        aml_arg(0), aml_touuid("33DB4D5B-1FF7-401C-9657-7441C03DD766")));
+    aml_append(if_ctx, aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
+    aml_append(if_ctx, aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
+
+    aml_append(if_ctx, aml_store(aml_name("CDW3"), a_ctrl));
+
+    /*
+     * Always allow native PME, AER (no dependencies)
+     * Allow SHPC (PCI bridges can have SHPC controller)
+     * Disable PCIe Native Hot-plug if ACPI PCI Hot-plug is enabled.
+     */
+    aml_append(if_ctx, aml_and(a_ctrl,
+        aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)), a_ctrl));
+
+    if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
+    /* Unknown revision */
+    aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x08), a_cwd1));
+    aml_append(if_ctx, if_ctx2);
+
+    if_ctx2 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), a_ctrl)));
+    /* Capabilities bits were masked */
+    aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x10), a_cwd1));
+    aml_append(if_ctx, if_ctx2);
+
+    /* Update DWORD3 in the buffer */
+    aml_append(if_ctx, aml_store(a_ctrl, aml_name("CDW3")));
+    aml_append(method, if_ctx);
+
+    else_ctx = aml_else();
+    /* Unrecognized UUID */
+    aml_append(else_ctx, aml_or(a_cwd1, aml_int(4), a_cwd1));
+    aml_append(method, else_ctx);
+
+    aml_append(method, aml_return(aml_arg(3)));
+    return method;
+}
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 4f8572eebe..91945f716c 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1111,56 +1111,6 @@ static Aml *build_q35_dram_controller(const AcpiMcfgInfo *mcfg)
     return dev;
 }
 
-static Aml *build_q35_osc_method(bool enable_native_pcie_hotplug)
-{
-    Aml *if_ctx;
-    Aml *if_ctx2;
-    Aml *else_ctx;
-    Aml *method;
-    Aml *a_cwd1 = aml_name("CDW1");
-    Aml *a_ctrl = aml_local(0);
-
-    method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
-    aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
-
-    if_ctx = aml_if(aml_equal(
-        aml_arg(0), aml_touuid("33DB4D5B-1FF7-401C-9657-7441C03DD766")));
-    aml_append(if_ctx, aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
-    aml_append(if_ctx, aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
-
-    aml_append(if_ctx, aml_store(aml_name("CDW3"), a_ctrl));
-
-    /*
-     * Always allow native PME, AER (no dependencies)
-     * Allow SHPC (PCI bridges can have SHPC controller)
-     * Disable PCIe Native Hot-plug if ACPI PCI Hot-plug is enabled.
-     */
-    aml_append(if_ctx, aml_and(a_ctrl,
-        aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)), a_ctrl));
-
-    if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
-    /* Unknown revision */
-    aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x08), a_cwd1));
-    aml_append(if_ctx, if_ctx2);
-
-    if_ctx2 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), a_ctrl)));
-    /* Capabilities bits were masked */
-    aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x10), a_cwd1));
-    aml_append(if_ctx, if_ctx2);
-
-    /* Update DWORD3 in the buffer */
-    aml_append(if_ctx, aml_store(a_ctrl, aml_name("CDW3")));
-    aml_append(method, if_ctx);
-
-    else_ctx = aml_else();
-    /* Unrecognized UUID */
-    aml_append(else_ctx, aml_or(a_cwd1, aml_int(4), a_cwd1));
-    aml_append(method, else_ctx);
-
-    aml_append(method, aml_return(aml_arg(3)));
-    return method;
-}
-
 static void build_acpi0017(Aml *table)
 {
     Aml *dev, *scope, *method;
@@ -1231,7 +1181,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
         aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
         aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
-        aml_append(dev, build_q35_osc_method(!pm->pcihp_bridge_en));
+        aml_append(dev, build_pci_host_bridge_osc_method(!pm->pcihp_bridge_en));
         aml_append(dev, aml_pci_edsm());
         aml_append(sb_scope, dev);
         if (mcfg_valid) {
@@ -1353,7 +1303,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
                 aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
 
                 /* Expander bridges do not have ACPI PCI Hot-plug enabled */
-                aml_append(dev, build_q35_osc_method(true));
+                aml_append(dev, build_pci_host_bridge_osc_method(true));
             } else {
                 aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
             }
-- 
2.49.0
