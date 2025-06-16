Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1740839njc;
        Mon, 16 Jun 2025 02:49:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUaQSCxlELkNvSejcGyVKQTwMvY9f0CUcYwtuFYdyMVRkx+4TMQ2e7mpnLAzM42o4riydGm1kyjomojQA==@linaro.org
X-Google-Smtp-Source: AGHT+IGrotUUG3l4ZWE80y43u/s07XrPl8iGA6yOQgtc71iZuGxT93iOWKeQkFMw9GO/jb57pHEf
X-Received: by 2002:a05:6214:f0a:b0:6fb:17a:c428 with SMTP id 6a1803df08f44-6fb47791754mr146398606d6.16.1750067379287;
        Mon, 16 Jun 2025 02:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067379; cv=none;
        d=google.com; s=arc-20240605;
        b=aRpP4vtfScgCmqKmdF8AUGZ4jruEwrHYVfim5AGjqB8yvWHzcj7JLvtFchP36HbsCX
         2M1LpMMZx0G+oITb4EAZ14W3LiFZ1nTciiRrwI6+qpGyVx1ppa3j+OeGLg8UzdqDHTCG
         Icf3FGBOuq9YAnHwOcZyDHfh8xkyvl5CqN8d+RNoKlHHNGX8bTRVTyzWhUEV84C6gkar
         f+7oUYPJrS2kmoc8ri4O8XOBp56Wt37MbQ3gcUFojxeoNbTx+PNu6GGC8HCsdfoIx/4w
         mhJxYaOFGRs8defz8r467G7B7tMYeoBodskxXv+hxR2iC86LUBMB5Yg7zt/rlz3BP69p
         k+sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=y7AL0KX8apZZAHTTmrY2QPu6kbeGIS+EgnQ2gqGZJEs=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=QkrRd3IuLH17F1Z8fhdHBhFMkqwsvyJUq5QWfqB5neMEwUczL9vEyk7Ri+qkKmUlyu
         1wRiEtgUHInTvOIwf8KosUCwPq0Bxv2f3BJuqN9vgNRxMJn6X8s4IMKI346w1GwTyzEP
         rgJAmhkvc8yYiEhcUI2dnR9dXzuKni+Hzs2XJMp+aFliKUBB1riLwkFjI+NO72BQvQuL
         a8xL7hxWVY5h43MPI0WXZ24ounx5oZCrUZrZlpe0AHNcrPfkUCLrrwuP7ARCXrWiQTtC
         5UgNNvcSvCbFLIQZw6tvnAksS3pyVs3pyXnQkpfP3+ZRcRVuJz/PSe3JvbAt1cUTK5eH
         amVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ItSef61A;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb4fa7c80csi43064026d6.464.2025.06.16.02.49.39
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:49:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ItSef61A;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y7AL0KX8apZZAHTTmrY2QPu6kbeGIS+EgnQ2gqGZJEs=;
	b=ItSef61ACbNywbE01exuOqIumSqYEIc1BHELDNo9L/JyukklqBR9Nd8rW/IRaPE2p4NAaJ
	6Tgma5e2hnLb6q0DtquFUj/Ywe+gEJHe9+ZsW+Up205pDiPuQT4y3MkzgMDNj07OOvQef5
	dWkI8C9USu1jrVyRys5h79FCR7ELLjQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-463-uKfTo9e8PdecI3Nchqls7g-1; Mon,
 16 Jun 2025 05:49:37 -0400
X-MC-Unique: uKfTo9e8PdecI3Nchqls7g-1
X-Mimecast-MFC-AGG-ID: uKfTo9e8PdecI3Nchqls7g_1750067375
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B4FA019560AA;
	Mon, 16 Jun 2025 09:49:35 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5E77F19560A3;
	Mon, 16 Jun 2025 09:49:31 +0000 (UTC)
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
Subject: [PATCH v3 04/29] hw/pci-host/gpex-acpi: Add native_pci_hotplug arg to acpi_dsdt_add_pci_osc
Date: Mon, 16 Jun 2025 11:46:33 +0200
Message-ID: <20250616094903.885753-5-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: SnjN8URnYYww

Add a new argument to acpi_dsdt_add_pci_osc to be able to disable
native pci hotplug.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

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
