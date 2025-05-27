Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4648000njc;
        Tue, 27 May 2025 00:43:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXI9dCZYPJUQTbwETHWYOE/eP5VKovVm8PHvF1h+tGnYRuMdkb0a5jqx08eml2jJS7D6Sr5hDvYyoFEJA==@linaro.org
X-Google-Smtp-Source: AGHT+IHXFldzARuWPVTaaBbXwTO0pM3OUi/qmwtJUgQdBlcbBA9lXTYZQBM+kJR4cBAFwlLY3+dC
X-Received: by 2002:a05:6214:5092:b0:6f8:b4aa:2a4d with SMTP id 6a1803df08f44-6fa9d28895emr215322716d6.31.1748331834395;
        Tue, 27 May 2025 00:43:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331834; cv=none;
        d=google.com; s=arc-20240605;
        b=aBjRCvw2hD1vFxInXxp1tKV7Ezm4D2DPueYkjWaFxuwmPjCx+pm0r3bxmbpf3zQ+mw
         EVVT4qQFWKrerr8VhM8Q0IDC6rUolAGYI3tHdhqMiZGHL2o2T53Ad2UQNMVDKMmhY+uq
         tP1r0OOpSPXrYEzh2q2aXzDmshqHgYhmwyJlV0BJtTZP3ECNywWmCg/Hb0hWHg8eaXWt
         PQ9CbNvfpTFTd5Bcr3V1xVpeDocyHfEDoqDTT1MblAc7vo65e0JSMBFf1XZIPPxZeB1g
         dNTBvjNV/QCjH99HxcqChLsRQiSddSxGB7ifabiB5KqepQCl9flUBCxZ+BebwrSJ8aqs
         T7yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ynMjCFkKq4avL2xQUuTd4QN6DUjSo6c9gEotr/SPDLI=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=DGUfhPyoM6Nf1rS3JX8ZXQmVXBsDWokZmlzZRNFMwrPQO6P5gXVAEZT6vTtMFu4q+T
         wn7hdF/PYjaSMLIzqXrhiMsH/iL0ew0+N3XLdn/zbCbygS+UMQU/gJ54zZ6EqbXmkYNC
         J7JrEXAlW6hq7no07sjMxYjcK4A4gw86j+Z9T+oq/isYmL8TLg0ak9ScnwR3gdjilAo3
         Q9JAXKh76D6++Nftw60e0GBoI4to35UVS0/v+c4PYV5qx4EvBb/emuc1XzLQWdmPNfaM
         yoZTiZZKUavyQa2B6lrVgo0O7VNsxtskNnVIe8tXkiri49TzIdkajO82PlhYhiIn2lt1
         pDgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GvE44uv5;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6faa3ba4880si62965496d6.278.2025.05.27.00.43.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:43:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GvE44uv5;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748331834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ynMjCFkKq4avL2xQUuTd4QN6DUjSo6c9gEotr/SPDLI=;
	b=GvE44uv5gS25wORHA1Ya4vSiF6YqBl7r9ZedbmJvGLAoYYX6ppTXd/XkCzmqDiXsfnB9Sk
	cxHsHnHtgQ7FxS8chBO4WQuOeHYbBo62ahfOI59FZt9WL+RAg4li7HQvQp7f7nXB1EvJEX
	2uDNVApxDSE6hGMmp13BKqCD/FymRnM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-177-SiwzEGkCPN28ABHyCD0f0A-1; Tue,
 27 May 2025 03:43:50 -0400
X-MC-Unique: SiwzEGkCPN28ABHyCD0f0A-1
X-Mimecast-MFC-AGG-ID: SiwzEGkCPN28ABHyCD0f0A_1748331829
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E168E1800373;
	Tue, 27 May 2025 07:43:48 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7C1AA19560AA;
	Tue, 27 May 2025 07:43:44 +0000 (UTC)
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
Subject: [PATCH v2 15/25] hw/i386/acpi-build: Introduce and use acpi_get_pci_host
Date: Tue, 27 May 2025 09:40:17 +0200
Message-ID: <20250527074224.1197793-16-eric.auger@redhat.com>
In-Reply-To: <20250527074224.1197793-1-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: UcvJT4MIrHMp

pcihp acpi_set_pci_info() generic code currently uses
acpi_get_i386_pci_host() to retrieve the pci host bridge.

Let's rename acpi_get_i386_pci_host into acpi_get_pci_host and
move it in pci generic code.

The helper is augmented with the support of ARM GPEX.

Also instead of using the machine child property to retrieve
the PCI host bridge, we search for the actual object type using
object_resolve_type_unambiguous().

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>

---

v1 -> v2
- described the fact we changed the implementation of
  acpi_get_pci_host() in the commit msg.
---
 include/hw/acpi/pci.h |  2 ++
 hw/acpi/pci.c         | 20 ++++++++++++++++++++
 hw/acpi/pcihp.c       |  3 ++-
 hw/i386/acpi-build.c  | 24 ++++--------------------
 4 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
index 4dca22c0e2..310cbd02db 100644
--- a/include/hw/acpi/pci.h
+++ b/include/hw/acpi/pci.h
@@ -41,4 +41,6 @@ void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope);
 
 void build_srat_generic_affinity_structures(GArray *table_data);
 
+Object *acpi_get_pci_host(void);
+
 #endif
diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
index d511a85029..4191886ebe 100644
--- a/hw/acpi/pci.c
+++ b/hw/acpi/pci.c
@@ -26,6 +26,7 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
 #include "qom/object_interfaces.h"
+#include "qom/object.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
 #include "hw/acpi/aml-build.h"
@@ -33,6 +34,9 @@
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_device.h"
 #include "hw/pci/pcie_host.h"
+#include "hw/pci-host/i440fx.h"
+#include "hw/pci-host/q35.h"
+#include "hw/pci-host/gpex.h"
 
 /*
  * PCI Firmware Specification, Revision 3.0
@@ -301,3 +305,19 @@ void build_srat_generic_affinity_structures(GArray *table_data)
     object_child_foreach_recursive(object_get_root(), build_acpi_generic_port,
                                    table_data);
 }
+
+Object *acpi_get_pci_host(void)
+{
+    Object *host;
+
+    host = object_resolve_type_unambiguous(TYPE_I440FX_PCI_HOST_BRIDGE, NULL);
+    if (host) {
+        return host;
+    }
+    host = object_resolve_type_unambiguous(TYPE_Q35_HOST_DEVICE, NULL);
+    if (host) {
+        return host;
+    }
+    host = object_resolve_type_unambiguous(TYPE_GPEX_HOST, NULL);
+    return host;
+}
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 942669ea89..d800371ddc 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -36,6 +36,7 @@
 #include "hw/pci-bridge/xio3130_downstream.h"
 #include "hw/i386/acpi-build.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/pci.h"
 #include "hw/pci/pci_bus.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
@@ -102,7 +103,7 @@ static void *acpi_set_bsel(PCIBus *bus, void *opaque)
 static void acpi_set_pci_info(bool has_bridge_hotplug)
 {
     static bool bsel_is_set;
-    Object *host = acpi_get_i386_pci_host();
+    Object *host = acpi_get_pci_host();
     PCIBus *bus;
     BSELInfo info = { .bsel_alloc = ACPI_PCIHP_BSEL_DEFAULT,
                       .has_bridge_hotplug = has_bridge_hotplug };
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index fe8bc62c03..6feb99e9eb 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -269,27 +269,11 @@ static void acpi_get_misc_info(AcpiMiscInfo *info)
 #endif
 }
 
-/*
- * Because of the PXB hosts we cannot simply query TYPE_PCI_HOST_BRIDGE.
- * On i386 arch we only have two pci hosts, so we can look only for them.
- */
-Object *acpi_get_i386_pci_host(void)
-{
-    PCIHostState *host;
-
-    host = PCI_HOST_BRIDGE(object_resolve_path("/machine/i440fx", NULL));
-    if (!host) {
-        host = PCI_HOST_BRIDGE(object_resolve_path("/machine/q35", NULL));
-    }
-
-    return OBJECT(host);
-}
-
 static void acpi_get_pci_holes(Range *hole, Range *hole64)
 {
     Object *pci_host;
 
-    pci_host = acpi_get_i386_pci_host();
+    pci_host = acpi_get_pci_host();
 
     if (!pci_host) {
         return;
@@ -1245,7 +1229,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
     sb_scope = aml_scope("\\_SB");
     {
-        Object *pci_host = acpi_get_i386_pci_host();
+        Object *pci_host = acpi_get_pci_host();
 
         if (pci_host) {
             PCIBus *pbus = PCI_HOST_BRIDGE(pci_host)->bus;
@@ -1306,7 +1290,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
         bool has_pcnt;
 
-        Object *pci_host = acpi_get_i386_pci_host();
+        Object *pci_host = acpi_get_pci_host();
         PCIBus *b = PCI_HOST_BRIDGE(pci_host)->bus;
 
         scope = aml_scope("\\_SB.PCI0");
@@ -1946,7 +1930,7 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
     Object *pci_host;
     QObject *o;
 
-    pci_host = acpi_get_i386_pci_host();
+    pci_host = acpi_get_pci_host();
     if (!pci_host) {
         return false;
     }
-- 
2.49.0
