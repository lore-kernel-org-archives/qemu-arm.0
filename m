Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1741027njc;
        Mon, 16 Jun 2025 02:50:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXitukAWdYHxuXs0DO/z0iB4/JxSvSyZ9Wm93oo15UW3D/R2H6tpmDSV5EHoPclwy0SN4bzUDRUV13SsQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEf5pxRWZIa0j3rqYXBKF0qT5mZMJrdgAGHobgR7JfTE6wLeV7KcHXPHtBAUM/yFszhwjwT
X-Received: by 2002:a05:6214:5884:b0:6fb:14:5e82 with SMTP id 6a1803df08f44-6fb47778968mr119309366d6.29.1750067408919;
        Mon, 16 Jun 2025 02:50:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067408; cv=none;
        d=google.com; s=arc-20240605;
        b=gjJNSEaOfrbYnmMsNvWmDU4cV9Knu1DbT28Gg+00ucjvzB6Ow7630wWQ9R7BtOJ2TD
         1ct64vGZ254sc69fc0rnxQqEx6gsfVXBZrIcTBehJFqXhFu5iUrRIzQfwH7I/nsyghV0
         77k/eUzDVpl9CDuzGEJmOTi9J0mn39orENKM3k+xvjWtp9ckBoL8TC2qxRWTaAWyrbpb
         RsTPaMhPPujiQc9Q6QYNNQ7TCCgmlJHZ3lN9zgpUZMz2NA8jSVfMaLDoVBzPd3euOUYD
         wfMO5fZh7VqU/Vw2BNgdWJohyECtWNxi0E4Wl/Da5SvDU0PpSSo2oel5hHC6VmUTaoFb
         UUFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KECbpm7G2omVzXV/QQ1MakPLiM65j5oGQhGALjqJ2ug=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=J67XAcZ5GrY5eUWnEg6XmH+VMWEVWRBhGMFrIDPtbPtH+zLJb4QrEINkDjDEglw6/V
         Mv80+9HwNba0engFXpBMXO9+Y0t5uUCoXynuxgc1uA8trENtMqakUOpszCMRg3QxVrkl
         iqcfyx20lI4dqcd2OxO69htnjRci84I6o6ZuQ+sFC1mh9ptHhApezQHF0DiHDyrjNSRA
         kM+ji61+OTB+xidFkDYoDMz7+SkZwgd0jqCesXVzRSW7qb+kMD4qQjTkap90SktV0lyx
         XeBn3AtD13NTvjgco1Ijgl/izP7D3Vxiiox0DI8W6n7JjVVPCPU0hG0/ogO2qkjNxHoi
         Aq+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G84063uh;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb35c340a9si107542046d6.451.2025.06.16.02.50.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:50:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G84063uh;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KECbpm7G2omVzXV/QQ1MakPLiM65j5oGQhGALjqJ2ug=;
	b=G84063uhBwbyh7uUTgVfE1FZCi+5XIsbECdMAwLPp4I0RZgnAGtBl67RcmtEfZDsDwzlbQ
	dvHg42ksCZKUSjK7OoVJFbPMk/daW9AgqoH/4/06/DxnmR5c5kMQVZUVw7adbcrW/2OBaU
	w6QdTM2U103izN3D9EA6htZiwKT9sis=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-344-sGQmuNZrPEGu8r5IebKF-A-1; Mon,
 16 Jun 2025 05:50:05 -0400
X-MC-Unique: sGQmuNZrPEGu8r5IebKF-A-1
X-Mimecast-MFC-AGG-ID: sGQmuNZrPEGu8r5IebKF-A_1750067403
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 734D6180029D;
	Mon, 16 Jun 2025 09:50:03 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1CC7119560A3;
	Mon, 16 Jun 2025 09:49:58 +0000 (UTC)
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
Subject: [PATCH v3 09/29] hw/pci-host/gpex-acpi: Use build_pci_host_bridge_osc_method
Date: Mon, 16 Jun 2025 11:46:38 +0200
Message-ID: <20250616094903.885753-10-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: vYWVQ1zZ/C4H

gpex build_host_bridge_osc() and x86 originated
build_pci_host_bridge_osc_method() are mostly identical.

In GPEX, SUPP is set to CDW2 but is not further used. CTRL
is same as Local0.

So let gpex code reuse build_pci_host_bridge_osc_method()
and remove build_host_bridge_osc().

The disassembled DSDT difference is given below:

  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00001A4F (6735)
+ *     Length           0x00001A35 (6709)
  *     Revision         0x02
- *     Checksum         0xBF
+ *     Checksum         0xDD
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
@@ -1849,27 +1849,26 @@ DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
                 {
                     CreateDWordField (Arg3, 0x04, CDW2)
                     CreateDWordField (Arg3, 0x08, CDW3)
-                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
-                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
-                    CTRL &= 0x1F
+                    Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
+                    Local0 &= 0x1F
                     If ((Arg1 != One))
                     {
                         CDW1 |= 0x08
                     }

-                    If ((CDW3 != CTRL))
+                    If ((CDW3 != Local0))
                     {
                         CDW1 |= 0x10
                     }

-                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
-                    Return (Arg3)
+                    CDW3 = Local0
                 }
                 Else
                 {
                     CDW1 |= 0x04
-                    Return (Arg3)
                 }
+
+                Return (Arg3)
             }

             Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---

v1 -> v2:
- move in the dsdt.dsl diff in the commit message and remove useless
  info (Gustavo, Michael)
---
 hw/pci-host/gpex-acpi.c | 62 ++++-------------------------------------
 1 file changed, 5 insertions(+), 57 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index 44737a8d81..952a0ace19 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -1,5 +1,6 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/aml-build.h"
+#include "hw/acpi/pci.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/arm/virt.h"
 #include "hw/pci/pci_bus.h"
@@ -50,61 +51,7 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq,
     }
 }
 
-static Aml *build_host_bridge_osc(bool enable_native_pcie_hotplug)
-{
-    Aml *method, *UUID, *ifctx, *ifctx1, *elsectx;
-    method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
-    aml_append(method, aml_name_decl("SUPP", aml_int(0)));
-    aml_append(method, aml_name_decl("CTRL", aml_int(0)));
-    aml_append(method,
-        aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
-
-    /* PCI Firmware Specification 3.0
-     * 4.5.1. _OSC Interface for PCI Host Bridge Devices
-     * The _OSC interface for a PCI/PCI-X/PCI Express hierarchy is
-     * identified by the Universal Unique IDentifier (UUID)
-     * 33DB4D5B-1FF7-401C-9657-7441C03DD766
-     */
-    UUID = aml_touuid("33DB4D5B-1FF7-401C-9657-7441C03DD766");
-    ifctx = aml_if(aml_equal(aml_arg(0), UUID));
-    aml_append(ifctx,
-        aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
-    aml_append(ifctx,
-        aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
-    aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
-    aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
-
-    /*
-     * Allow OS control for SHPCHotplug, PME, AER, PCIeCapability,
-     * and PCIeHotplug depending on enable_native_pcie_hotplug
-     */
-    aml_append(ifctx, aml_and(aml_name("CTRL"),
-               aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)),
-               aml_name("CTRL")));
-
-    ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
-    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x08),
-                              aml_name("CDW1")));
-    aml_append(ifctx, ifctx1);
-
-    ifctx1 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), aml_name("CTRL"))));
-    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x10),
-                              aml_name("CDW1")));
-    aml_append(ifctx, ifctx1);
-
-    aml_append(ifctx, aml_store(aml_name("CTRL"), aml_name("CDW3")));
-    aml_append(ifctx, aml_return(aml_arg(3)));
-    aml_append(method, ifctx);
-
-    elsectx = aml_else();
-    aml_append(elsectx, aml_or(aml_name("CDW1"), aml_int(4),
-                               aml_name("CDW1")));
-    aml_append(elsectx, aml_return(aml_arg(3)));
-    aml_append(method, elsectx);
-    return method;
-}
-
-static Aml *build_host_bridge_dsm(void)
+static Aml *build_pci_host_bridge_dsm_method(void)
 {
     Aml *method = aml_method("_DSM", 4, AML_NOTSERIALIZED);
     Aml *UUID, *ifctx, *ifctx1, *buf;
@@ -133,8 +80,9 @@ static void acpi_dsdt_add_host_bridge_methods(Aml *dev,
                                               bool enable_native_pcie_hotplug)
 {
     /* Declare an _OSC (OS Control Handoff) method */
-    aml_append(dev, build_host_bridge_osc(enable_native_pcie_hotplug));
-    aml_append(dev, build_host_bridge_dsm());
+    aml_append(dev,
+               build_pci_host_bridge_osc_method(enable_native_pcie_hotplug));
+    aml_append(dev, build_pci_host_bridge_dsm_method());
 }
 
 void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
-- 
2.49.0
