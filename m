Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp787918dye;
        Fri, 27 Jun 2025 02:57:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWGDXDJBG+pYDAYo4Ee4qq3FOc5MGwijGRslOqCUNH6d4j7qT0qqr1v/+QU7eFwNQOWICmAh+SY4rmSzw==@linaro.org
X-Google-Smtp-Source: AGHT+IHLSmVgSF5iD0IDA6m3xdZUk71dBRtPUqFASP+BvEFC8l8+k21dBaQc3nBeNUslb+XakCgz
X-Received: by 2002:a05:622a:547:b0:494:aa40:b0c3 with SMTP id d75a77b69052e-4a7fc9d4f4bmr34505091cf.10.1751018250405;
        Fri, 27 Jun 2025 02:57:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018250; cv=none;
        d=google.com; s=arc-20240605;
        b=IemnvszvH8YLllALLTJR8hYLLZnBKxc28vTL8qd0PmqzIDa3UWoE0Uuh9F0j+E/5az
         wnCzcvicpsdqAZhbM+Ue1a4Vk9sE8UZhupWYwjIn1qneVq217M285b23uC795FLK6zxN
         E2VQthtoJejBOVrDcW9LXIsRjRt1Cqqj8w//d/o6xWYwDZ1h2fgGl3BcDtvqFDuP/wFF
         BsspF19itcCUhJC2mSBNPDl+qniKt4DaInmTud3ea4jFCJcQPwj4/QH2Zel0KLsPENBx
         8mknQao/wLq/Ek3p0FkdYs7gbdINXcBymZrBZQy5w39h5/0KbYaoNOXWAiPo7/AWW4ID
         swgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DfwPhpp6uiZtdpNSC/DKcOHh1NFlVN+rydU2xvgZgfI=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=cozkPIwPdO/BJQwg4RAzBXrtKOwo80yVexNvqFx04huttcVwAn5nT0x1KLVRFa7+pu
         uj8x+x6czhL5mMLoTRIegaVsjnjVCYCsaWxFhqwx1/Z5gf8OEfGPLjgyzd0o0TGFZ0TW
         L6w9Hu90SweBd5OjQlx+nPW1zM2Kp5UFx8r3JP5JNpffTbrKV6JDsJZt2IUwnFhs637a
         pdgriuxFoQpkG35NqmaHO8J65bGXL9zCTJ564zYCKOvgxqlCPAUifgMQjveV+aJBfKNT
         tkhi1Ini+q5njXc8GsAkjiq2Ig+n/RUlQMT+t3UOKbs7cnCwwnHZObNys0bSFqHCXI4l
         twaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="TH/BIBAi";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc23961dsi17712041cf.350.2025.06.27.02.57.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:57:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="TH/BIBAi";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DfwPhpp6uiZtdpNSC/DKcOHh1NFlVN+rydU2xvgZgfI=;
	b=TH/BIBAiP1WXCh8cR4PhSqd+6dVgxLAHtsH/BqB5e1LoOrcY4r2jqxKldvNyYMPO2DgyTf
	S+x4wHBbb3e1e5jToKKn6iwpmoFGT0ndA9QsVqolaTYP36pnCN4XWUElDfU3oCOoqHgaO0
	hE6vkhqJPyljVGa8/6JTi9vWjnuYcRY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-228-nWmUCieKNEi5PLFuZsBXMw-1; Fri,
 27 Jun 2025 05:57:26 -0400
X-MC-Unique: nWmUCieKNEi5PLFuZsBXMw-1
X-Mimecast-MFC-AGG-ID: nWmUCieKNEi5PLFuZsBXMw_1751018244
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B0831195FCCA;
	Fri, 27 Jun 2025 09:57:24 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CDB7919560A7;
	Fri, 27 Jun 2025 09:57:19 +0000 (UTC)
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
Subject: [PATCH v4 11/32] hw/i386/acpi-build: Introduce build_append_pcihp_resources() helper
Date: Fri, 27 Jun 2025 11:55:00 +0200
Message-ID: <20250627095620.3300028-12-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: +Lb40QK9KC6k

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
