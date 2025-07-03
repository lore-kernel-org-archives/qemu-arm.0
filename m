Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp505195dyc;
        Thu, 3 Jul 2025 05:37:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVg6vWz3cr9uaZ91X1d0zm/b9wh+1/w0RUO6q1+qzUmFq6b5zDpHAXYGY4MYf4d4FD1D4PW+P6PbUx7uA==@linaro.org
X-Google-Smtp-Source: AGHT+IFkYRey7u0msYmnzKGfDyTwp3lG/aCyg36ovieKeeZG2XQWZ1SWXzR86M3zkP+HwGM+cm7E
X-Received: by 2002:a05:620a:4707:b0:7d3:f3e1:b8d5 with SMTP id af79cd13be357-7d5d144d367mr448586385a.26.1751546277858;
        Thu, 03 Jul 2025 05:37:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546277; cv=none;
        d=google.com; s=arc-20240605;
        b=ATminJLYdVkyiapIdO1bI+WEP+0npr1eSJUqS4SSf22mrMpRgULrikKdCVgeXhSBFY
         1PYMlbMrY2HADmxFsaGAvhr6Hvcare+dXwdJpOvZacbYvStE2Z1378y693md4i7xEqWX
         sed0WymNlH2q7y2psKUIbHiI8pv2B4Qk/VxZbCabwJ4wn7nj6J8ts3/1KCNUFcYMr9WL
         hCdEvwdLbw/6peOpnDb8L4id3L6alDuOYBensBeATkgtyll2ak9smVxuxTEjpordILkQ
         Gd8vPPB61T7Truj3jPjV9vNi30U7gNwY3ABFX83r3hFA+H4WvMt2+9SS2HlDsOuQI1XS
         Ph7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1HSMLnRPbnF6OXBap7NtZPM/Y9so/IkI//K6rZ9XUXg=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=AvcO+V85v07zrLt76opZzWJcC/McCCO83SDGxJMFqyWV6CAglrg/X6etkmG2jMqP1x
         fQEo+AL17Ul/R3FvmWWS/g2K5470nCOETODZkq/9bSPZKy6ilWDI0YkLFYwj71eF8829
         LWLFEa8B7EyxLIoJw//qbmF8WN01N+2kR4QsFIiPHwXFCqWQfGfO2Cz79PjkJnqIFKEN
         zCQkV1+SL5XbcTKTm+6EdazSitOzUxmLkZ0tBJvj6W8c6JUs3JU0iDRIBLlsYRs4pW5M
         oJjzT9Y3BuSV6Aa3pToEJXrSqZfKRIU8bsDkXpiuz4m0VE3d5k30meMAyaIETQ23+wcq
         9GfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aOPyt8fT;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d48fefa44asi598385385a.333.2025.07.03.05.37.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:37:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aOPyt8fT;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1HSMLnRPbnF6OXBap7NtZPM/Y9so/IkI//K6rZ9XUXg=;
	b=aOPyt8fT5smSDLRqeqWGXI39hIRZ9O3Y0uBUeqkOZt8rXoLGQC/DKElxRV2xF9lekcAEfs
	bKLYMy2Y4OZm3zmlYbcpZ9TtsyX3AutLP9AnFBMGXqd1PY3V0GQHxQccxpUDitBDcGPuIg
	J1En34IOXoKnL1i/LoHMMcENYQb3b1I=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-489-jeguISCNPBKyqNoaRLIkag-1; Thu,
 03 Jul 2025 08:37:54 -0400
X-MC-Unique: jeguISCNPBKyqNoaRLIkag-1
X-Mimecast-MFC-AGG-ID: jeguISCNPBKyqNoaRLIkag_1751546273
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EB69B19560B9;
	Thu,  3 Jul 2025 12:37:52 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6507A1803AFF;
	Thu,  3 Jul 2025 12:37:47 +0000 (UTC)
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
Subject: [PATCH v5 03/36] hw/pci-host/gpex-acpi: Add native_pci_hotplug arg to acpi_dsdt_add_pci_osc
Date: Thu,  3 Jul 2025 14:35:03 +0200
Message-ID: <20250703123728.414386-4-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: e2C/lJLiCB/F

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
