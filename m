Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp635897lfm;
        Fri, 19 Jun 2020 07:22:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBgCmuoXY1r9jFEvvd3Qz7qy6BaSZp+9rjfMiZ3nMpxTrxQGtXxJG7DlTEJNCCDDJucRKU
X-Received: by 2002:a5b:610:: with SMTP id d16mr6099232ybq.289.1592576545987;
        Fri, 19 Jun 2020 07:22:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592576545; cv=none;
        d=google.com; s=arc-20160816;
        b=qY0wIeWWy+Feg0FEf+bX0rz0SMA3AsLsrQ4E//dznUHwL9fNVnBCx8wCScVPBwyF1x
         oPpzP6XZf8lB+5ffAeYnQOYl7s8EXhnAx2NZgMdfkZQaP0VK+xgDcYSBfe5QQzLokjDo
         2K5nd1vizv3nU6kgXMCP418aymjQDbS3k2dOi5xutZFm2cksj0Mqk/PH4ibpFmW19iex
         jYjz5Ku9LE3eXvZWXr5SodqaF4roZ6nrrzNgUcYGsgSkWlBqTY7dB5bj8dmN2CQsLuJw
         vl46xrDqvMlbKbMrjWSzaXA4x+kbEBW6om6T7KVq4K5gHokUklIq4UZ1a1XayEsub/Ay
         d0JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/Uvgms2t30WyMLlJbrPjknaO4u94K0FM42shoSWrUNA=;
        b=omepb2n1wJCQRwg136Pytz5w8prs8Hn1wN+AFHQNdCqTvm8nT42xAuy5gjvhU4VTPl
         w/4tBxmBHYhiOie8wBjYJWdaf33rYjxIjr+gsr3N1fvItgxX2jrVMMoKzPn1Pb9B80Eu
         iKIvhlKCT4O014560/if5f+/DSZ/+XLA/PzuFXygWfpBcre3ON70zVvWrSB2V28lvhsv
         WDoM4EkQwZFqGgKoVSUZG4vcATRT8XH7k/A9zNcMxLJYPhptPNQ/EiAjWM2HeWvBq5HT
         HKjCEDomDZd3YWtVAVluqqKN4U5Ydq90zB0oA5aBBYEUOJ1rjEb1yamWSGYBjNtF/X9w
         9STA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FQMFTsLC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16si5077398yba.199.2020.06.19.07.22.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 07:22:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FQMFTsLC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmHuT-00062U-5P
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 10:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jmHrR-0000ku-Jc
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 10:19:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24551
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jmHrP-000601-Tk
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 10:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592576355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Uvgms2t30WyMLlJbrPjknaO4u94K0FM42shoSWrUNA=;
 b=FQMFTsLCCIq1vffPyW1ieD6PTamUIvrsVDtkxArJsSo7RIuCfGj5bfBMoymUCIgrmiTz4J
 Hy6TKU1eU2lmUHER/24dsDjVXVTHeBGHBa9aGwyx9hKrz9dUq9Pjp/e8WiJlAKOmL6fN14
 V5ka/npNNzk2ypnkLPbcrSAejCzRJVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-WglowewoNiiKn3lLgVFMgw-1; Fri, 19 Jun 2020 10:19:13 -0400
X-MC-Unique: WglowewoNiiKn3lLgVFMgw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DC59A0BDB;
 Fri, 19 Jun 2020 14:19:12 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F6FD19D7B;
 Fri, 19 Jun 2020 14:19:09 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v6 2/3] arm/acpi: Add the TPM2.0 device under the DSDT
Date: Fri, 19 Jun 2020 16:18:50 +0200
Message-Id: <20200619141851.16272-3-eric.auger@redhat.com>
In-Reply-To: <20200619141851.16272-1-eric.auger@redhat.com>
References: <20200619141851.16272-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 05:19:18
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
Cc: thuth@redhat.com, lersek@redhat.com, drjones@redhat.com,
 shannon.zhaosl@gmail.com, marcandre.lureau@redhat.com, philmd@redhat.com,
 ardb@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nwZc55Cut6+o

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

