Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp787727dye;
        Fri, 27 Jun 2025 02:56:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUb3011mKI+CdY79zuW51V4vq1xGI+JQrp5bM0K3Y65nyg7b7iSv3g86B5FQRF2kBWnDgDrSqpO1VD4Mw==@linaro.org
X-Google-Smtp-Source: AGHT+IF8TgR8+2IQpKRlwN3A6UOlTYGkC+zbn7ZDIpbGM05+B6IGirHXbD4RA7H6WjiGx8pw2xXS
X-Received: by 2002:a05:620a:270f:b0:7d4:2868:89ea with SMTP id af79cd13be357-7d4439270efmr390410185a.4.1751018219407;
        Fri, 27 Jun 2025 02:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018219; cv=none;
        d=google.com; s=arc-20240605;
        b=jhaO2cMO9vHmP4/1U5sQUj75R0LmL7dh21PH9iSGHRDlMLyMVVXL6A0BwXwtPZ499f
         xD5JqBOVVWKWr5J73DUaJB9KQfKwpm7gTsOMS33LL2TsXyCES1HzR4EnqD7nD42PrToK
         igwd84jpXS2FUaFnqDQRd5bHugNQlyFKGPiNm+ICPHtqQXvcbkrUob2D5BZGxGf79Wi2
         pf5yi0AETd81br16Hk78xO/ZpNgDkqT/JpXI8J/aEF85nNmnjDryjtED03k45jaaQNsA
         YVcm2tYGtPBwKdcA0vTnmMGuaB7fAXp5gqaaJ3IveEuUEcIOkIBKdh7H4fv0ttJZbNr1
         bpnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8tsfNnFgjFSMarOZ/Ey2DdHtTx77eO4HAyY+2EP63+M=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=AEWmyRaSgE19+aOGXVg1eb+4F7aHHt44+LwztQ15uemVIeHD1wCjjETRYc4iDsGQ3v
         bnQf26xV3gEjeg2DXT0DrdlRdO6XH2ctB6DL1J8n15DvDbPYrUNUK8JWoXoa7z1HXMCz
         Bv1stK/IQy4g4bUIcJuVfK+fz5Ur8e/KfdJdLqI4gTdcAsUnjM4EHWp+BRZlTpAI1kgB
         N0CH9rJSVWyq74BQ9BXG/ttBOll9gVppAm050mGdmpxsQEmEaCNGU1P8DkBe2BX4hK/B
         04gZbKzLKhkwByZ6CZogztz9u4farlYg5VlyztMLCTqQBlFllS7HRHdJ05OyGOAAyvo1
         mdVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RRTaVTSp;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d44329edaasi188000285a.600.2025.06.27.02.56.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:56:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RRTaVTSp;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8tsfNnFgjFSMarOZ/Ey2DdHtTx77eO4HAyY+2EP63+M=;
	b=RRTaVTSpDs0vlg4D0EJBEQoPQSbE9HzdbWS+SZDjzRzImPO8x5eRtP6IjeVr09A6ifolD4
	0VYdy7N9nfNkzvp+47et52tvRxODiDRbD/ybejBUJ0NwwvzzpdevBednFGz6NDFXcEYZvb
	SQIG67pC/4U7fO7+2DEcOwLjzwHJC9Y=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-107-opkuTeszNTiQezS40xfp_A-1; Fri,
 27 Jun 2025 05:56:55 -0400
X-MC-Unique: opkuTeszNTiQezS40xfp_A-1
X-Mimecast-MFC-AGG-ID: opkuTeszNTiQezS40xfp_A_1751018214
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F2E581809C82;
	Fri, 27 Jun 2025 09:56:53 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9222B19560A7;
	Fri, 27 Jun 2025 09:56:49 +0000 (UTC)
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
Subject: [PATCH v4 05/32] hw/pci-host/gpex-acpi: Split host bridge OSC and DSM generation
Date: Fri, 27 Jun 2025 11:54:54 +0200
Message-ID: <20250627095620.3300028-6-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: Iv2gg/9JScm2

acpi_dsdt_add_pci_osc() name is confusing as it gives the impression
it appends the _OSC method but in fact it also appends the _DSM method
for the host bridge. Let's split the function into two separate ones
and let them return the method Aml pointer instead. This matches the
way it is done on x86 (build_q35_osc_method). In a subsequent patch
we will replace the gpex method by the q35 implementation that will
become shared between ARM and x86.

acpi_dsdt_add_host_bridge_methods is a new top helper that generates
both the _OSC and _DSM methods.

We take the opportunity to move SUPP and CTRL in the _osc method
that use them.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---

v2 -> v3:
- moved
    aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
    aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
  into the _osc function. (Jonathan)
  hence discarded Gustavo's and Igor's R-bs
---
 hw/pci-host/gpex-acpi.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index f34b7cf25e..80fc2bf032 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -50,14 +50,12 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq,
     }
 }
 
-static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
+static Aml *build_host_bridge_osc(bool enable_native_pcie_hotplug)
 {
-    Aml *method, *UUID, *ifctx, *ifctx1, *elsectx, *buf;
-
-    /* Declare an _OSC (OS Control Handoff) method */
-    aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
-    aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
+    Aml *method, *UUID, *ifctx, *ifctx1, *elsectx;
     method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
+    aml_append(method, aml_name_decl("SUPP", aml_int(0)));
+    aml_append(method, aml_name_decl("CTRL", aml_int(0)));
     aml_append(method,
         aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
 
@@ -103,9 +101,13 @@ static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
                                aml_name("CDW1")));
     aml_append(elsectx, aml_return(aml_arg(3)));
     aml_append(method, elsectx);
-    aml_append(dev, method);
+    return method;
+}
 
-    method = aml_method("_DSM", 4, AML_NOTSERIALIZED);
+static Aml *build_host_bridge_dsm(void)
+{
+    Aml *method = aml_method("_DSM", 4, AML_NOTSERIALIZED);
+    Aml *UUID, *ifctx, *ifctx1, *buf;
 
     /* PCI Firmware Specification 3.0
      * 4.6.1. _DSM for PCI Express Slot Information
@@ -124,7 +126,15 @@ static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
     byte_list[0] = 0;
     buf = aml_buffer(1, byte_list);
     aml_append(method, aml_return(buf));
-    aml_append(dev, method);
+    return method;
+}
+
+static void acpi_dsdt_add_host_bridge_methods(Aml *dev,
+                                              bool enable_native_pcie_hotplug)
+{
+    /* Declare an _OSC (OS Control Handoff) method */
+    aml_append(dev, build_host_bridge_osc(enable_native_pcie_hotplug));
+    aml_append(dev, build_host_bridge_dsm());
 }
 
 void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
@@ -193,7 +203,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
             if (is_cxl) {
                 build_cxl_osc_method(dev);
             } else {
-                acpi_dsdt_add_pci_osc(dev, true);
+                acpi_dsdt_add_host_bridge_methods(dev, true);
             }
 
             aml_append(scope, dev);
@@ -268,7 +278,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
     }
     aml_append(dev, aml_name_decl("_CRS", rbuf));
 
-    acpi_dsdt_add_pci_osc(dev, true);
+    acpi_dsdt_add_host_bridge_methods(dev, true);
 
     Aml *dev_res0 = aml_device("%s", "RES0");
     aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
-- 
2.49.0
