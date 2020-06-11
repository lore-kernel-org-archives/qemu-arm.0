Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1461710lfc;
        Thu, 11 Jun 2020 07:03:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxA/xd8OFamEeB4eqp6n6FokbZiecw1kCmYLiBs6dcQLUGBx+5MOzMvZ4psrWzUeaWLGWLr
X-Received: by 2002:a67:db90:: with SMTP id f16mr6259521vsk.132.1591884183937;
        Thu, 11 Jun 2020 07:03:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591884183; cv=none;
        d=google.com; s=arc-20160816;
        b=ZBnudbjbjTKyuHnjz0DwvoPPtKqgqM7c1jHC81eswF+Uio1UQTAVSDxtcPP8+5N5aF
         q72qCu2NjqEaXPz67D2aWyqgO3sis9ibvpUqSxTXFwEd7VeknRyLDoKP+JMDnjJl5rVF
         NFcdNxhw0BtJOWInJlah7XZThRp5iOKifgqG8IDFc1y7HJ8SU667bFBW4DDIk6I895ij
         9t2fdRL5K839XR6b/3Z9Bp9YOjt+uozaFqse7n3XcwVVbQbU7BK58vuGGu1yAOFLqlOL
         zG6e0TgJfdnFj05NH7luzO66IGJBqomehrqhjPUCYzpDjK/ImK5gfeO6Os2vrm0gTKuc
         ztXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ntfG//GL1YECO3Gr8H+WJTmhryn3WPZswXVXiuSUlM0=;
        b=lidufUU4M9h2H6Mg3bej9U+UuGDFc7KJRkN0Z5z1rnbe82O8yWvp2Zx/8jSw3yj7Ho
         1qbFOmjFjanioIXxR/j9JNA4mleHuZr7NIZzu3cYg6pN0xlZEEXknF37VZIOIg3tMy5V
         rTq8u0OetipjGVvmEiFF3M8mL0Dk+EV1siU/xWHVwTL2JT8JXmkw1itdX0FocyEutm94
         ndaDGknEVSB6B1vjJd5eL8ukhncobfRQFNkRO2+voL4Dkd/y1KdxmbTopJv4jTh6dcqE
         0bP/NZboxDVU5QpCDAUBaWmdDekzShDNY6hLUwsuBAKQO4UOLJ6lcbz9xcdIJTBnvcux
         EImA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=S+QKFBJS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x137si271401vsx.159.2020.06.11.07.03.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 07:03:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=S+QKFBJS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjNnL-0005gA-5K
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 10:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jjNkO-0002ff-UH
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 10:00:00 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57766
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jjNkN-0002By-T0
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 10:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591883998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ntfG//GL1YECO3Gr8H+WJTmhryn3WPZswXVXiuSUlM0=;
 b=S+QKFBJSGlL0T0LYqjulT5V6eHo3p7MOz57W2stQpRkOjSp3T/eZVffOtPpV/nHoMyBWgY
 l33fGgR6ADMxeOiDN3fm0OL3/Cgtmo6ENWYTsdT0u3Llv1jI1rRXEByo8Y2C4xIjU4TwPQ
 ji6GjsySI6X+zHm0oYp4MiUxfU6tSLM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-51YW-kWENCm7rRCE0IqFGQ-1; Thu, 11 Jun 2020 09:59:57 -0400
X-MC-Unique: 51YW-kWENCm7rRCE0IqFGQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 084EF801503;
 Thu, 11 Jun 2020 13:59:56 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE4205D9DC;
 Thu, 11 Jun 2020 13:59:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, shannon.zhaosl@gmail.com, imammedo@redhat.com
Subject: [PATCH v4 4/5] arm/acpi: Add the TPM2.0 device under the DSDT
Date: Thu, 11 Jun 2020 15:59:16 +0200
Message-Id: <20200611135917.18300-5-eric.auger@redhat.com>
In-Reply-To: <20200611135917.18300-1-eric.auger@redhat.com>
References: <20200611135917.18300-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 03:29:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, lersek@redhat.com,
 ardb@kernel.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BK9nu7XzOdlZ

In case it is dynamically instantiated, add the TPM 2.0 device object
under the DSDT table in the ACPI namespace. Its HID is MSFT0101
while its current resource settings (CRS) property is initialized
with the guest physical address and MMIO size of the device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

---

v3 -> v4:
- check the presence of the tpm in acpi_dsdt_add_tpm
  as it was done in v2

v2 -> v3:
- use SYS_BUS_DEVICE() instead of
  (SysBusDevice *)object_dynamic_cast(OBJECT())

v1 -> v2:
- use memory_region_size
- fix mingw compilation issue by casting to uint32_t
- added Stefan's R-b
---
 hw/arm/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6d152ab481..b7277233b3 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -46,6 +46,7 @@
 #include "hw/pci/pci.h"
 #include "hw/arm/virt.h"
 #include "hw/mem/nvdimm.h"
+#include "hw/platform-bus.h"
 #include "sysemu/numa.h"
 #include "sysemu/reset.h"
 #include "sysemu/tpm.h"
@@ -364,6 +365,38 @@ static void acpi_dsdt_add_power_button(Aml *scope)
     aml_append(scope, dev);
 }
 
+static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
+{
+    PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
+    hwaddr pbus_base = vms->memmap[VIRT_PLATFORM_BUS].base;
+    SysBusDevice *sbdev = SYS_BUS_DEVICE(tpm_find());
+    MemoryRegion *sbdev_mr;
+    hwaddr tpm_base;
+
+    if (!sbdev) {
+        return;
+    }
+
+    tpm_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
+    assert(tpm_base != -1);
+
+    tpm_base += pbus_base;
+
+    sbdev_mr = sysbus_mmio_get_region(sbdev, 0);
+
+    Aml *dev = aml_device("TPM0");
+    aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+
+    Aml *crs = aml_resource_template();
+    aml_append(crs,
+               aml_memory32_fixed(tpm_base,
+                                  (uint32_t)memory_region_size(sbdev_mr),
+                                  AML_READ_WRITE));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    aml_append(scope, dev);
+}
+
 static void
 build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
@@ -758,6 +791,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     }
 
     acpi_dsdt_add_power_button(scope);
+    acpi_dsdt_add_tpm(scope, vms);
 
     aml_append(dsdt, scope);
 
-- 
2.20.1

