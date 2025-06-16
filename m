Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1741095njc;
        Mon, 16 Jun 2025 02:50:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVyv1ruHG3o3fsBjpZjhrYESTUe8gANhGu78P/Amx+PiKHHD/6vdvp1XPVtOmu3Rmmgbh+TYNTsO2ontw==@linaro.org
X-Google-Smtp-Source: AGHT+IE3yGc3qUzEOKjdqKgsHjKEUVUa6LWqNvo54yR4JWNobT4/wL9W7wqR1CHVlVPxTAsvj1Rz
X-Received: by 2002:a05:6a00:9181:b0:748:a0b9:f873 with SMTP id d2e1a72fcca58-748a0b9f8d2mr9807755b3a.9.1750067419636;
        Mon, 16 Jun 2025 02:50:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067419; cv=none;
        d=google.com; s=arc-20240605;
        b=eKPo1eh8u56PxlhF99+W+sP8hr6mN712QY45hnVSXYDncpKKtLjbcLSAwmNKl/v+3G
         9ubdO85uee1oB51r0FtLWcNk8XRYCc+BmBYwOn0dxKSS3+g5WgM8PBKc/4JLKzY2sy9t
         BH+18PZ6/0cjjK1Pu0LBbv74Ri2RAAO30RT4cpMQsUbZ+ykgb0lHKSA55LKcKVdLdp9f
         erUafslgSWEiUsXZGE2iPDw4BExGCRA0nNWpbOGPE3+LUvirIUGteyOVEnXW+UxLQE99
         dFdcCt6QS3PPgkM9hGbABOeUcSUE+vryQ4u4ayXXXd94K/hSfVwN9IePuBVEE9Eu6FGq
         Ua7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DfwPhpp6uiZtdpNSC/DKcOHh1NFlVN+rydU2xvgZgfI=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=YG5/eJtz+D1Y0Z56Kea9tnSh7JZWn23NMEyUtv5/Bl3NBD3ACv6VDFvdUT6P41L5G+
         scAgkNc0a9kE8Ce+MnOBn3YpDYk9SOQh0SvxtaHjBTB1QfhRPmnXlD1/GKpiWuOwV7Bk
         B2uNScR17jfyMrlVOlgvJYF+tBAGoVfQodRAFbcPTeXZEiLW18xORW446lQQQgbrTBv/
         fluSR1Wxl12+CptoSIGuK5Mo+71TxWNp9Bcdh0yaPDIEw37sxRIIdENlSm72t8CWvaRX
         /Ef4HiuiJash4Uxv70AILS5vjS5NzEmTNfPB5ykhIQZYEXPRyRF4I2G5kFK1EmSUHdRf
         YQuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UJiP3nTY;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d2e1a72fcca58-748900e245csi10547042b3a.142.2025.06.16.02.50.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:50:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UJiP3nTY;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DfwPhpp6uiZtdpNSC/DKcOHh1NFlVN+rydU2xvgZgfI=;
	b=UJiP3nTYCw7/WyOByh0FuZGJRvCpt+rSBxxb75NcS5fNz34S28xarAgT2aTxi7yHdzZEAy
	4XFKTjk7qJcFybpZA+AH4DuWi7B5dJJQE61If86L30C8+TsQKCmgaVPEK9esfVVy4VZ13B
	4mdtjua3Htoh+QGnCHhBLSxxa6/Muk8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-322-0TBql2dNPwOvWuXUASSl9A-1; Mon,
 16 Jun 2025 05:50:15 -0400
X-MC-Unique: 0TBql2dNPwOvWuXUASSl9A-1
X-Mimecast-MFC-AGG-ID: 0TBql2dNPwOvWuXUASSl9A_1750067413
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AB3B31800343;
	Mon, 16 Jun 2025 09:50:13 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5548219560A3;
	Mon, 16 Jun 2025 09:50:09 +0000 (UTC)
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
Subject: [PATCH v3 11/29] hw/i386/acpi-build: Introduce build_append_pcihp_resources() helper
Date: Mon, 16 Jun 2025 11:46:40 +0200
Message-ID: <20250616094903.885753-12-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: XxkYi8LsuYP0

Extract the code that reserves resources for ACPI PCI hotplug
into a new helper named build_append_pcihp_resources() and
move it to pcihp.c. We will reuse it on ARM.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

---

v2 -> v3:
- fixed indent (Jonathan)
---
 include/hw/acpi/pcihp.h |  2 ++
 hw/acpi/pcihp.c         | 18 ++++++++++++++++++
 hw/i386/acpi-build.c    | 15 ++-------------
 3 files changed, 22 insertions(+), 13 deletions(-)

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
index e0260f67e6..47fa434a62 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -685,6 +685,24 @@ void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
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
+    aml_append(crs, aml_io(AML_DECODE16, io_addr, io_addr, 1, io_len));
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
