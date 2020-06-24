Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp797732lfm;
        Wed, 24 Jun 2020 16:14:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzn1vUlPzExcnSr7XdJkl0vpKhyLUcsI1ADgKMCGrVwHwH5BY0qO1Tp/qRSm1i6wMao6Lr3
X-Received: by 2002:a25:bb0d:: with SMTP id z13mr47478774ybg.417.1593040445242;
        Wed, 24 Jun 2020 16:14:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593040445; cv=none;
        d=google.com; s=arc-20160816;
        b=cjpUodKpkUPMbD6DMhpp26Hkgs7bHdUfT/CqwM6MOW/hGmvlmpgMZYt1e6C1mQZtTL
         N2x8PRD52gZjrWU9Jpzvhoy81+1P9zqry1fywYniVt5zPuOk8zEEMRzMnmUp7PzkTzLj
         s3PiHiu2l1keEeGO7RAgkbG12I/uyB14F6cOEroMhXkPzSzDvXwVqPswjjk14QetlWOz
         IdSNuSeHCd3lEjfq8AEHupFL3D4jPl32IOG/T3NrCvy1rqRyy9b+uzoZlWbV+jHW3liJ
         QQoCQrQ09K37kjsTvRq00R7ZZ3KeGc7/xc7iNcfEdzPdYOlIAXxgyrhydJjMkPzQLPpe
         uf5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=SQTJT5wD23Ewuir8n5bTPAK5U6CWsgr7NunGte4p7ow=;
        b=ACbfWric4iN7x409f454vB0zp81G9qhs8PgaqGJ55xYj05wn82YH+ZtXmxJNZutRDc
         QvJBCqGrWE7VO1y+vNPGQywe8kEwz1I2o2QSEYhhkwVe6H336VlFF5cL1Ws0iDHb8xJF
         jwwt6LQiOoR98ruRQ9JgZGTQyxSuovFRi1TvUnyMJ1Eodl+Lvvq1569nyuaJlpbW8Bwv
         X3h44ynhKpF7QWXl+GQ6JVxIvdYRTajIfBGrVlvYl/r2T2UWTr8OsNsVctF3LBiw1GB3
         8JGjbFVoJiv2hRyOnRp1qTlhf8Cll4PKfPf+8IZ8Onky1R7e9vhNMBLvVwfe4UhmN8+Q
         dlsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DFPfw0Kl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y185si19416555yby.124.2020.06.24.16.14.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jun 2020 16:14:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DFPfw0Kl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joEai-0004ju-IF
	for alex.bennee@linaro.org; Wed, 24 Jun 2020 19:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1joEU5-0000fL-TU
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 19:07:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20824
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1joEU4-0001cv-3B
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 19:07:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593040031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SQTJT5wD23Ewuir8n5bTPAK5U6CWsgr7NunGte4p7ow=;
 b=DFPfw0Kln6KVlHOKwac8WIS1w1YnB0UJLty4EKO2Z7dC3rFurBHS6PggQf/aHNq0sQF5+/
 eJRfYB7I8JV6wFis6MPI3HIPJ5ScYKKh/aaM/R+VpxKN6CeLcDTSI288Z0tV7ag6Q9chTn
 Mqvk4q9rqUKunhQ6c6rs9NXAbrfpRXQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-zsDNUknZOgSoyRa6h2_CGQ-1; Wed, 24 Jun 2020 19:07:09 -0400
X-MC-Unique: zsDNUknZOgSoyRa6h2_CGQ-1
Received: by mail-wm1-f71.google.com with SMTP id a18so4647179wmm.3
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2020 16:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SQTJT5wD23Ewuir8n5bTPAK5U6CWsgr7NunGte4p7ow=;
 b=aKyoPZJKCcTMql4C6247b1wwsAAxEuuI7n3JSJaJxz7GTqB5+coRHhuZWoGoLi29tn
 Am6HfmyYdIVGDF7kASbyX8Vl3hQnKTvaii7Tfpb7QnMReRNFITE44bDRy9/my+mSVb6c
 uvv7GOUAOKxisj5zUY56d74gAgr/3Vgk1wQhqpRZ32ODW4rANb49lZkTfJFcEehoHU3p
 B7d33X3hLk7R8m19nXrihFcY/vTGPbAavKBnZ56lwoiEUJDUyWPWJeVV9uRGCbKLe3Z9
 ZHn0/C/MoLRLwrLJsZJlLBJv9PqMl2DZyYgVIsYdBQgoOnoTJcscQC6Uy4+BcSwJP8Ky
 0Spw==
X-Gm-Message-State: AOAM530654oSYERwMfkkSPDFaBa3xodkdDK41k7Q0niSdi+hyw3omuX1
 S6bcKY+RHLLLmhlU8cxUPonqDye61MHAZNUKp7ZPM1sot7mY4OEyLntAyqklW67RNjbxRb32oZh
 O5P31n5cuqUBb
X-Received: by 2002:a5d:5549:: with SMTP id g9mr30907632wrw.419.1593040027795; 
 Wed, 24 Jun 2020 16:07:07 -0700 (PDT)
X-Received: by 2002:a5d:5549:: with SMTP id g9mr30907620wrw.419.1593040027627; 
 Wed, 24 Jun 2020 16:07:07 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 x5sm10239713wmg.2.2020.06.24.16.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 16:07:07 -0700 (PDT)
Date: Wed, 24 Jun 2020 19:07:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/19] arm/acpi: Add the TPM2.0 device under the DSDT
Message-ID: <20200624230609.703104-15-mst@redhat.com>
References: <20200624230609.703104-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200624230609.703104-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 03:27:53
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: njaPLddXfpC3

From: Eric Auger <eric.auger@redhat.com>

In case it is dynamically instantiated, add the TPM 2.0 device object
under the DSDT table in the ACPI namespace. Its HID is MSFT0101
while its current resource settings (CRS) property is initialized
with the guest physical address and MMIO size of the device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

Message-Id: <20200622140620.17229-3-eric.auger@redhat.com>
Tested-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST

