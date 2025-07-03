Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp505265dyc;
        Thu, 3 Jul 2025 05:38:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvjPMY55At9AtrdvBP2bR9P8oL+IdglO/UJbX1SSGctdH6FscEasstN55IF7mLY0Y5GH/9TFrOTKa0hg==@linaro.org
X-Google-Smtp-Source: AGHT+IHsPd8snc+7UA0c93ba530t4NPgEEODoV/uw8W0EI6aDTi5vtnyiGJfTx6CzCdH47zfYm5a
X-Received: by 2002:a05:620a:280a:b0:7d4:6138:bd58 with SMTP id af79cd13be357-7d5c47cd84fmr882567385a.52.1751546288454;
        Thu, 03 Jul 2025 05:38:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546288; cv=none;
        d=google.com; s=arc-20240605;
        b=Xs6P06IJ/Cv0D9Qj5gHgrx/uk8q2nEulKrJiCh4M8jD+ZsNBNNVbajyCaT13OgUwJ8
         XpEGaN2g/jngyx7LtwhaZkaXqwmnswiqK//SNz2jDDJ5BTXegvY2YVLgU8BN6SuStrio
         yvPdiAQx+NtKBbmvfmIQHYkI88F1yDMU6IAldj+TzDJEUmX2QYZouEeOHMBkmZmght06
         1KheA7/KZxqum6zdSZt1+8e0og1WuBtrlAxeysqDTDVtNJEAZhqfYG1LDGAiSfJDX/3y
         A6TpUiOtqtGWqxqUfDgW7zArAlmvOjTKiJLugWGtFoxDc3TKSI9I0sSwvzdpu/Lesi34
         QZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8tsfNnFgjFSMarOZ/Ey2DdHtTx77eO4HAyY+2EP63+M=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=VgzupvslHKA5A3GIsSqyveDqJDQhWm0Q2qo3WniByMZFGm3y/VODntZWCi5sTTZX75
         u14wI7jnwZdrel6GGIqgnVA0ryFN4eF0jg8/daxIyYCKS+1hyCKQhxeIQgJcC/kZGtis
         LbbAerYGc/Swn1m+/Qjzvpm7oMU4WXOvcgbOO+dJti247/X/5sZIdGwR+WVISGKC1HXc
         jfvfrQA8bqLf66H8solBVuqr7lDo9qqfwPk1grgWXSGBcem0SnBKqqHBARwRyzkKpMC8
         eAfXpJadpOQeN43CUmgfy/OYK53PCny59xt5cfsP28UcrIsDyx6qhCRehuK/ik6lcr7j
         y24g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="YoE/zDjK";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d443225249si1412755285a.188.2025.07.03.05.38.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:38:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="YoE/zDjK";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8tsfNnFgjFSMarOZ/Ey2DdHtTx77eO4HAyY+2EP63+M=;
	b=YoE/zDjKjPkU34ELOsUoUuWBnmWbKl0wEtKAq/DCilQMGGDmHLkyZxIBCIP4X0k2ZWlL3l
	47ErxrhZGyBrQDptLI9K586VB8VxHbKdgmPjbT0UlERkZpNT1PY4ciuIR7oXhk1IqT1yCe
	hM1xyqHNLXRNsy+fV+ncjuGXKdMIyxg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-147-eX7hsATXPPK2tGvWD0_1dA-1; Thu,
 03 Jul 2025 08:38:04 -0400
X-MC-Unique: eX7hsATXPPK2tGvWD0_1dA-1
X-Mimecast-MFC-AGG-ID: eX7hsATXPPK2tGvWD0_1dA_1751546283
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 585EB18DA380;
	Thu,  3 Jul 2025 12:38:03 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 748411803AFF;
	Thu,  3 Jul 2025 12:37:58 +0000 (UTC)
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
Subject: [PATCH v5 05/36] hw/pci-host/gpex-acpi: Split host bridge OSC and DSM generation
Date: Thu,  3 Jul 2025 14:35:05 +0200
Message-ID: <20250703123728.414386-6-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: buGeWQPT8iXh

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
