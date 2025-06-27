Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp787853dye;
        Fri, 27 Jun 2025 02:57:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2fkioPZ5QPFJoXg0W4zPtfjgcEVSqwv2GX3gNK3hrzxGaPy4fJRDf8ORWZGTAamZ7QQF3tOcRUbKhlg==@linaro.org
X-Google-Smtp-Source: AGHT+IFwhmhDsVjgO0lF0md0Q6K2FXmB9NjQfsGD6KAoiFmDtcwN1Vg9Oph0F8Z0uxxnHPMPy68x
X-Received: by 2002:a05:622a:120f:b0:4a7:6f3f:9192 with SMTP id d75a77b69052e-4a7fc9f7892mr48609231cf.13.1751018241366;
        Fri, 27 Jun 2025 02:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018241; cv=none;
        d=google.com; s=arc-20240605;
        b=GiOPHpr2bBlQjOKUylxEfNoZR9bK6mep51z5A1wC0Z/Ntq6RVAEcy7o4Bmnjpw9WQ6
         T9EjavqwuXYoGw3nehFrpinrx4xuQph2fJ0/iwwrIvIoviqZuaIHQ7vhTKIRkuSxrjnr
         0DJ18keCDvfvtRnt+e5utUEFUDrCVu79otj2oNaKvZaNiVZqviYx1v0gRPyFYhBBle1E
         OIGka6ZyT/JSPN8b1FkH6KG6PnnvHLBJN3oIW90H78yOjDcD0Os/5NVkAGXoRgS5G8cD
         TFHfw1IIRF16pd4YnTxTffrXL7jIUGRbyNmnz97Adwsuny+aIF4rEPATd+7XnHn5BCOV
         9ZuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=45zep+yfpvOYeLiyVESnp4LTP5O7YDakds6xxlaxHqk=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=I2Diz6u1QXBME6AEedVrHFygEZUZrRuu7R8Yd01R9Sf68RPnSCfjNKdZDGEaCw9vMD
         mZLbdVQBwfFFzbUVNeFUlWrtGGIT63oZOlCbiJGp7bLB7c1wyislGJN43g8oBPNDslrR
         RDnXnnfCPWveQl/b3hk4MkHlKQe9dHMqreye48zZUhBQ7+TC1CTEtK9Ft9jegUjajPdV
         PPkpOYBkyZNwKz6aD4G7Cf1Uwmx6DfoPYPrWVU2MtIJgurEFZD7YWvp6OnFnRDlKWoDV
         9TFplyWkXb0JKghqcT46KFS5WJFxMMpU7Del1gQbIQAybzX+4fkWLxyCalvBW68YJcjb
         as2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TFsLqk6w;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc55503fsi18211911cf.502.2025.06.27.02.57.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:57:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TFsLqk6w;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=45zep+yfpvOYeLiyVESnp4LTP5O7YDakds6xxlaxHqk=;
	b=TFsLqk6woPFYkL5gUE17XipsiQeA7V/NGOk97NkJdA9IgS4ye4ypvpsTfbSsQZ4N7zTW1J
	2fheRfsAwHtnmzkIhCOOUU0hN7nDpQxdFKLuWU+n7mX7+VZb/0szwDzIDvvhxtaAHqYOVK
	6oGdemXs032JBOSDg3WM7HqJOw4PFVg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-664-50c0MjzdMzKjl-XxsUB-7A-1; Fri,
 27 Jun 2025 05:57:15 -0400
X-MC-Unique: 50c0MjzdMzKjl-XxsUB-7A-1
X-Mimecast-MFC-AGG-ID: 50c0MjzdMzKjl-XxsUB-7A_1751018234
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3C7871801208;
	Fri, 27 Jun 2025 09:57:14 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B534219560A7;
	Fri, 27 Jun 2025 09:57:09 +0000 (UTC)
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
Subject: [PATCH v4 09/32] hw/pci-host/gpex-acpi: Use build_pci_host_bridge_osc_method
Date: Fri, 27 Jun 2025 11:54:58 +0200
Message-ID: <20250627095620.3300028-10-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: Nf/Nsm8C4Huu

gpex build_host_bridge_osc() and x86 originated
build_pci_host_bridge_osc_method() are mostly identical.

In GPEX, SUPP is set to CDW2 but is not further used. CTRL
is same as Local0.

So let gpex code reuse build_pci_host_bridge_osc_method()
and remove build_host_bridge_osc().

Also add an imply ACPI_PCI clause along with
PCI_EXPRESS_GENERIC_BRIDGE to compile hw/acpi/pci.c
when its dependency is resolved (ie. CONFIG_ACPI_PCI).
This is requested to link qemu-system-mips64el.

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

v3 -> v3:
- Fix link issue:
/usr/bin/ld: libsystem.a.p/hw_pci-host_gpex-acpi.c.o: in function `acpi_dsdt_add_host_bridge_methods':
./hw/pci-host/gpex-acpi.c:83: undefined reference to `build_pci_host_bridge_osc_method'

v1 -> v2:
- move in the dsdt.dsl diff in the commit message and remove useless
  info (Gustavo, Michael)
---
 hw/pci-host/gpex-acpi.c | 62 ++++-------------------------------------
 hw/pci-host/Kconfig     |  1 +
 2 files changed, 6 insertions(+), 57 deletions(-)

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
diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
index 35c0415242..9824fa188d 100644
--- a/hw/pci-host/Kconfig
+++ b/hw/pci-host/Kconfig
@@ -54,6 +54,7 @@ config PCI_EXPRESS_Q35
 config PCI_EXPRESS_GENERIC_BRIDGE
     bool
     select PCI_EXPRESS
+    imply ACPI_PCI
 
 config PCI_EXPRESS_XILINX
     bool
-- 
2.49.0
