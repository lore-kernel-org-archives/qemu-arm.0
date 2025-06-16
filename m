Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1740894njc;
        Mon, 16 Jun 2025 02:49:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGw47Hf+qFQeNwDxdOh+k6suKaRRfVySFZ5lmlTbifzCIcM04YXkC+o5nCgHIRbBumSVlke23AAjVomg==@linaro.org
X-Google-Smtp-Source: AGHT+IGcPL9ZznIrikCZU+AxKu0WKRArQazYBTS4dWgJwtXwJqpqt3ivUCQM8NbNsxXg8wPAq15/
X-Received: by 2002:a05:620a:2954:b0:7c5:50ab:de07 with SMTP id af79cd13be357-7d3c6c1ab9fmr1219511385a.21.1750067389180;
        Mon, 16 Jun 2025 02:49:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067389; cv=none;
        d=google.com; s=arc-20240605;
        b=N87GA96d13rh8n9XsNSM7cdk9DTrq6BEz+cZswT1cvpeO6a8YFP2Mjx+WZ9lmxB1QH
         SUdgtWRsnKbE33tDIsha95Ox6l6Dypv6g8KB7IP25bfZypaG7xvBPL67U9Z0jRQYv7Ic
         xWcddiy2bH4KOUdjzGZN1lmFHQJ+tzGpis5c6RnlR8Ejr+4jGVN/oxkfS4HW46TadK4K
         VDLpFAfifZtXKipraqpBplyOVAOTMUGMYj8Jm+tZqyeEZSZMY6XuR4FzUL3vou1rnY0J
         R48xWG4/YBjfvOfZDMtu0rs9zbatkckzsz1e8qDBQiVvC4/I91CcbN+tnT3b7eucroYA
         yhKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kd2uCnm0wxqIzFc8HBJODVGohJd5d8hlh4KWN889KMY=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=NsdgA0eC2VnEbj2F8ri9u5sw1ypXAGm7RG59xubIyLteamxksR358HN7yYxIQ2kh/X
         Zdndd377Fmk00XapN6y5oktVlirDf1+iaRC08izqAhFaJzY99/mbEYYB/R7J8HCcovSe
         LuifI4RkAceSVWiJ7SAPJnlaZfc1pY3XteUtq7aDP7EeRx/vlWtAoKuy60vxRc/Vv7/u
         l0db+glT26SUN5SlEvZKKZf5z/ub0zngTmtfU0WCxoXnliOR35lsQf/WQnqMiiZsv9j2
         YYMwFUfLUO9pCJgUBraL70G03Q+dprnpFoFMiaQstbgb6pvxkA3dP19zSDWMpLemcXyr
         Q6rg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YtFud7Ky;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8f13d96si947724785a.467.2025.06.16.02.49.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:49:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YtFud7Ky;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kd2uCnm0wxqIzFc8HBJODVGohJd5d8hlh4KWN889KMY=;
	b=YtFud7KyXHCSlla4/IFx555em9u80Hz9V0efJOu9L095+eBPJmlqk7nRqcdiLogoTguq7M
	KOAZBux5cW6Rs/isODTDOntkHFYk1Brp/g1n+hvwJxjzGotC0/ZvsAzbTucLZtogsGBYTJ
	A38oVq1qEad5kCM3cVKNFONKHAclstI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-orgce-eMN6m8Qv_9rdPrYA-1; Mon,
 16 Jun 2025 05:49:47 -0400
X-MC-Unique: orgce-eMN6m8Qv_9rdPrYA-1
X-Mimecast-MFC-AGG-ID: orgce-eMN6m8Qv_9rdPrYA_1750067385
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 97C22180026D;
	Mon, 16 Jun 2025 09:49:45 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2ED8719560A3;
	Mon, 16 Jun 2025 09:49:40 +0000 (UTC)
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
Subject: [PATCH v3 06/29] hw/pci-host/gpex-acpi: Split host bridge OSC and DSM generation
Date: Mon, 16 Jun 2025 11:46:35 +0200
Message-ID: <20250616094903.885753-7-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: I8coIK/CCUt0

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
