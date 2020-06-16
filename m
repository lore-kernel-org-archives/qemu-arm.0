Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2452577lfm;
        Tue, 16 Jun 2020 02:35:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfGhRv5EPEebCzbWRGCL3zl3zKaIGut/XpwSQmfpCfoHmWpdboB5TqKMVQtDeltHrDcXyT
X-Received: by 2002:a25:b90e:: with SMTP id x14mr2950182ybj.8.1592300143836;
        Tue, 16 Jun 2020 02:35:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592300143; cv=none;
        d=google.com; s=arc-20160816;
        b=ieAMj14/0zTl7jsEDhnMirJ1OAgTaUDt/PpvUYKk09qS87tPhGgf7MQMTZfznjokms
         zzetyfuMKK+BtqMZyUKfhioYXYn8JOzmS7+guxzK+CTzCh4/BvCaPkd7j0S7z+4CUStB
         fZ/y+D/ij0w3NbmpyQUHSPjmawxerDHnr9AgQcLixMNKpcwzIXSoqVO8VLTlYcgf/rW8
         qqMv/gFtoC8Ed+6NhlokkLk8P1maVqhFSyl05CBXzIL08uGqGz4ebAnkeTOLr5ZoRCGZ
         MPtEbSyPvoEJC7F/qyndVw5m4Ax92g9skYSRPM3CNomL0pPtpeSjzvImWBfRn2b2XiP8
         wScw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/Uvgms2t30WyMLlJbrPjknaO4u94K0FM42shoSWrUNA=;
        b=tuj1m/Bdt5+ywXn/UCPc7YCR6QzhqiTHpAy7ltdXs2VyZMyZ5SAV/ExVPvyl3ya0eO
         vdOirZVmu74+QJ43QioxxsvT/u1jWeL7S/arVVdi7xkf4YP+Xqo5glxdEcI2QmlGNdho
         4vz7sPMXcZpAOUMwUPBFVJWoaNAf3MZYyT+zY0bIsvBxws/Du7QE8J3IS3c8/OMJOcie
         mNFFqIW2bBpR18ZOOPv87VyTWpApYHSqjLs5kkezTLAPDbq3XHFpwTj7pcMyV3/CCwdo
         HsLNCd2T3rqOQDmkVoW8D0ldA8cYWxHJ0yKaOpREGUlAHyG39k4TpYgaAnWcTXV10Gnx
         ziPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=P8RmtJtW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e125si15984063ybe.416.2020.06.16.02.35.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 02:35:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=P8RmtJtW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jl80N-0000P8-5w
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 05:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jl806-0000LO-Jr
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 05:35:26 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:59379
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jl805-0000FE-3H
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 05:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592300124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Uvgms2t30WyMLlJbrPjknaO4u94K0FM42shoSWrUNA=;
 b=P8RmtJtWEMksPJDupDm4oFruuqrJbEn8eue1GxMjP3No/zDMla8l/yRV4BEe72COxDA+t8
 sIUByCjvNdMHrjdLe8EfCrhTc0qAg45XMVuWKjXGk0xeaprt88Nx2DxGQGfAkecCHaUd3l
 nUb6nzndquFoVJRHj9cwvojp/GSxHyc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-XOnWlA0NPk6DxIyFErQLXw-1; Tue, 16 Jun 2020 05:35:22 -0400
X-MC-Unique: XOnWlA0NPk6DxIyFErQLXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34B38107B7CE;
 Tue, 16 Jun 2020 09:35:21 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E21815C1BD;
 Tue, 16 Jun 2020 09:35:17 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v5 2/3] arm/acpi: Add the TPM2.0 device under the DSDT
Date: Tue, 16 Jun 2020 11:34:56 +0200
Message-Id: <20200616093457.24709-3-eric.auger@redhat.com>
In-Reply-To: <20200616093457.24709-1-eric.auger@redhat.com>
References: <20200616093457.24709-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:01:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: thuth@redhat.com, lersek@redhat.com, drjones@redhat.com,
 shannon.zhaosl@gmail.com, marcandre.lureau@redhat.com, philmd@redhat.com,
 ardb@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5rSgNOhJsJtq

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
index ca31f70f7f..1384a2cf2a 100644
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
@@ -762,6 +795,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     }
 
     acpi_dsdt_add_power_button(scope);
+    acpi_dsdt_add_tpm(scope, vms);
 
     aml_append(dsdt, scope);
 
-- 
2.20.1

