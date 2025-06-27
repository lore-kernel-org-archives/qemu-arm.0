Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp787657dye;
        Fri, 27 Jun 2025 02:56:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUYF0GvVOb5S1u9FBo5NvZpO6Jbb8g9GMRoajHwLL6YSqlRZWfnxl8JcT9Ec+72PlZq1Jb24zhAmVw0Ww==@linaro.org
X-Google-Smtp-Source: AGHT+IFaluCoRNnEFBRePE46cMAS/X3EexljWPQkNJJkdMfL8k1e7aD+FEiouwXAEiObwKuiNXfM
X-Received: by 2002:a05:620a:454b:b0:7d3:90ab:814a with SMTP id af79cd13be357-7d443966499mr407900285a.24.1751018208317;
        Fri, 27 Jun 2025 02:56:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018208; cv=none;
        d=google.com; s=arc-20240605;
        b=Sf9FjOGX2gC7Qysb0RZQyRMQCfu2OYF4xv1n+ErE6AAe2D/BBPWJgYmaZ8dwJzEph8
         BWHkafuKCCTJVh9aiG1sUsg5lbmuJEtfsP6ixjKzuGJlKotgCpBRaEMTAA0xtoSJUJUg
         uYmyIwOPlXY6PXR7kHFssp7wOte3uiAbIwBxQunnDS1pgFhNrijVSwueFhQ3LR0LmgOu
         e5nvFpa7OYGGQOlUGNIzSwx5IbogMGEFHtfhEd77y8INvbR2xj6X1Vb3XvpJJP66IpfN
         F//g4xvWWmYralC/jtqwAd1zzGvv0m6eky8nsKd6q0CeFIKRI7ncYVcvgxW84wu8C7OU
         ANtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1HSMLnRPbnF6OXBap7NtZPM/Y9so/IkI//K6rZ9XUXg=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=CieJM46bkNkfKaT8QbSODsww4pRUqDdAGWrnNUhg84UUfAQZ1LwUriFqSyxcguWMNb
         xG2o+VzAoYxygcLbVGyXh+XUlKYSPv8ngChog+MNX1/tpinSCIuTkPE4jDTESePgBcb9
         YJd7HIUE2Q9dXzCEStyV3Fa2+e4DzvgQ3VFVjWjL9PDmIgWZahKZ/Nq+664A7EhZh0jj
         63XaybsFlZYd88YuY/qaXUserjC4+C/54PbauPt9d4KzCl7HsQiDpRfrkTFJTPC7bFIO
         Fqpo83X1rGK1sDmOzJWsjG23cl1NjtFrq57U+nFPXZkL3rH52NgAl4ahOwpf4mdL69wt
         V+aA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N5ksUPRJ;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d443195830si195826285a.79.2025.06.27.02.56.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:56:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N5ksUPRJ;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1HSMLnRPbnF6OXBap7NtZPM/Y9so/IkI//K6rZ9XUXg=;
	b=N5ksUPRJMqChb9Wz7Mjd2CF3UW24DQH3cgKd6cqWN2xHsL5fYdU9DJulT4rcbC09WVTaDj
	/lezG4eLetwc9jzRm26G9pPB2DNLcrG7sFrG8G8YMZB3HvEkNVI+Lc+nK6z1u0F/ca4w7X
	O8qtwY549H3vh84+GjeTJeqdnrNBt+4=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-75-3U6sxESBPUey0j_x9F9DBg-1; Fri,
 27 Jun 2025 05:56:44 -0400
X-MC-Unique: 3U6sxESBPUey0j_x9F9DBg-1
X-Mimecast-MFC-AGG-ID: 3U6sxESBPUey0j_x9F9DBg_1751018203
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7DF52190FBD1;
	Fri, 27 Jun 2025 09:56:43 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D7A3319560A7;
	Fri, 27 Jun 2025 09:56:38 +0000 (UTC)
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
Subject: [PATCH v4 03/32] hw/pci-host/gpex-acpi: Add native_pci_hotplug arg to acpi_dsdt_add_pci_osc
Date: Fri, 27 Jun 2025 11:54:52 +0200
Message-ID: <20250627095620.3300028-4-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: xrZBrVoYsTao

Add a new argument to acpi_dsdt_add_pci_osc to be able to disable
native pci hotplug.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

---

rfc -> v1:
- updated the "Allow OS control for all 5 features" comment
---
 hw/pci-host/gpex-acpi.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index 0aba47c71c..f34b7cf25e 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -50,7 +50,7 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq,
     }
 }
 
-static void acpi_dsdt_add_pci_osc(Aml *dev)
+static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
 {
     Aml *method, *UUID, *ifctx, *ifctx1, *elsectx, *buf;
 
@@ -77,11 +77,12 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
     aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
 
     /*
-     * Allow OS control for all 5 features:
-     * PCIeHotplug SHPCHotplug PME AER PCIeCapability.
+     * Allow OS control for SHPCHotplug, PME, AER, PCIeCapability,
+     * and PCIeHotplug depending on enable_native_pcie_hotplug
      */
-    aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1F),
-                              aml_name("CTRL")));
+    aml_append(ifctx, aml_and(aml_name("CTRL"),
+               aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)),
+               aml_name("CTRL")));
 
     ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
     aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x08),
@@ -192,7 +193,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
             if (is_cxl) {
                 build_cxl_osc_method(dev);
             } else {
-                acpi_dsdt_add_pci_osc(dev);
+                acpi_dsdt_add_pci_osc(dev, true);
             }
 
             aml_append(scope, dev);
@@ -267,7 +268,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
     }
     aml_append(dev, aml_name_decl("_CRS", rbuf));
 
-    acpi_dsdt_add_pci_osc(dev);
+    acpi_dsdt_add_pci_osc(dev, true);
 
     Aml *dev_res0 = aml_device("%s", "RES0");
     aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
-- 
2.49.0
