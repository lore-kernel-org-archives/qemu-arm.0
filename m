Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5870815njd;
        Mon, 28 Apr 2025 03:29:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXxq+zAsI2GoXGvjdV9q2Qj4xq7Eicjp2EGjcMSyOoK89KVU7PPHwba4ImrooozlVXNIfa8+5+MGXBfw==@linaro.org
X-Google-Smtp-Source: AGHT+IGlkeXQ4t4H51p7/jKao3zfMvGAwYg/3UVrMdrqo6EndYsP5U/lorKPZiSMkdf4nNHOKXSA
X-Received: by 2002:a05:620a:44cb:b0:7c7:694e:1ba0 with SMTP id af79cd13be357-7c9619e8a3amr1766391885a.44.1745836173376;
        Mon, 28 Apr 2025 03:29:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745836173; cv=none;
        d=google.com; s=arc-20240605;
        b=NFC5o5KcwxEuV6w+04A1jG3XotGDZ4fLVSUv3x9LdUUgIRuIc1zxAUJPMVU8lpXq0K
         I9ts0xMwkWgw8qgj80n/e5e8+/9R8bNipq6gqRdOq7KH5XVeGpwFA2JypXMniQHaGwWo
         eAzNFodNuYrUJqzEc7jD/5nU1EN2dZYnwpI2iSjA0rR0MEXZnp2drbDo3tdbrT4iby27
         V+mD0dwcxWzEEIJgadpYES9AdWr6nq69dBOUCsAxd6JTKmwmuAhVAcGlMWwm3aGBs8Gc
         03I2duGHIiO/w7+WUq7t1km8b0sbmIvXd184mAUy3visGXRUdgqRGi8d9jYSEzPlYIgz
         Ntug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4/7wfG4MKM8xOpcQ97dTAuZjJRGxHPyCfvSDMEfl8Jo=;
        fh=+sxB8NkS+xL+1QwPgIVnaMhN8Q9GX11v/uLdEosqQQA=;
        b=CQNQKresIXAQcyZdN2tv71DqtU0lvOVsndXxZ31lRCWG0JyuqhM/F19eZxnecyDoXv
         JHosCYCfpsMWUpLDbl3xq2gcZEcj4/pGTS3Bzf+nHU8P6mAdSWL+c/Mdib+YKvxaGRDT
         oaJu6sqAdnTLbb9wwPa5B0dvgyWYOr7rpHQaWaLQGApX5vO+IGwTTbCUTWxyPOMeuqhe
         o/UuhIZahtmK9A+rm58gmJKsJBOCUfhmIDowPMYzRo8SKCn4oyF2OrD7ECFxkqs5p49D
         PDMCBNgKfXOFMxDPvrMCIZA5v29NDSqAxOXUWHyaGITkoEYyzxZyrVQmWzOBWb7Eirj+
         iz0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iyAh0AX3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c958ebf487si970131385a.573.2025.04.28.03.29.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Apr 2025 03:29:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iyAh0AX3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u9LjY-00024q-Tp; Mon, 28 Apr 2025 06:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9Lie-0000LT-Oc
 for qemu-arm@nongnu.org; Mon, 28 Apr 2025 06:28:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9LiZ-0003SO-Ld
 for qemu-arm@nongnu.org; Mon, 28 Apr 2025 06:28:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745836076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4/7wfG4MKM8xOpcQ97dTAuZjJRGxHPyCfvSDMEfl8Jo=;
 b=iyAh0AX3VbHCuDaFm3TkUy9p6B8K0hdy5PSVnf28djtMEJo9+uAkVGgebTmX0eZzBbjaFV
 91awn+aDoOtW17DC+QUb5+kPwrdQ745Mbpp7QwvtHnQitup77C9ScGPenGr/wPdi9uqd96
 6qdO1jv1DrKwEghZNMScIwgyfirav00=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-536-cSyUVGyQPEONAq5J5uEPBg-1; Mon,
 28 Apr 2025 06:27:54 -0400
X-MC-Unique: cSyUVGyQPEONAq5J5uEPBg-1
X-Mimecast-MFC-AGG-ID: cSyUVGyQPEONAq5J5uEPBg_1745836073
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 483C719560AF; Mon, 28 Apr 2025 10:27:53 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.14])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A49D6180045C; Mon, 28 Apr 2025 10:27:49 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com
Subject: [RFC 16/24] hw/i386/acpi-build: Introduce and use acpi_get_pci_host
Date: Mon, 28 Apr 2025 12:25:42 +0200
Message-ID: <20250428102628.378046-17-eric.auger@redhat.com>
In-Reply-To: <20250428102628.378046-1-eric.auger@redhat.com>
References: <20250428102628.378046-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.492,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QAatMOFHLPn+

pcihp acpi_set_pci_info() generic code currently uses
acpi_get_i386_pci_host() to retrieve the pci host bridge.

Let's rename acpi_get_i386_pci_host into acpi_get_pci_host and
move it in pci generic code.

The helper is augmented with the support of ARM GPEX.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
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
index f88f450af3..0b07b77586 100644
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
index 49da95e0dd..82b8ea2811 100644
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
index 3198d956b6..f9122e56e8 100644
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
@@ -1271,7 +1255,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
     sb_scope = aml_scope("\\_SB");
     {
-        Object *pci_host = acpi_get_i386_pci_host();
+        Object *pci_host = acpi_get_pci_host();
 
         if (pci_host) {
             PCIBus *pbus = PCI_HOST_BRIDGE(pci_host)->bus;
@@ -1332,7 +1316,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
         bool has_pcnt;
 
-        Object *pci_host = acpi_get_i386_pci_host();
+        Object *pci_host = acpi_get_pci_host();
         PCIBus *b = PCI_HOST_BRIDGE(pci_host)->bus;
 
         scope = aml_scope("\\_SB.PCI0");
@@ -1972,7 +1956,7 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
     Object *pci_host;
     QObject *o;
 
-    pci_host = acpi_get_i386_pci_host();
+    pci_host = acpi_get_pci_host();
     if (!pci_host) {
         return false;
     }
-- 
2.49.0

