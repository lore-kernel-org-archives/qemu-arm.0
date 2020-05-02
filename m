Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2157304lfm;
        Sat, 2 May 2020 13:36:49 -0700 (PDT)
X-Google-Smtp-Source: APiQypLKx5Us2CsWb9npxn+ILMdUvLaBgWKkYRPyfxQu646t3Jy+rjtcfR6jeKmlmhPXU+aoYO11
X-Received: by 2002:ac8:164e:: with SMTP id x14mr10118381qtk.196.1588451809752;
        Sat, 02 May 2020 13:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588451809; cv=none;
        d=google.com; s=arc-20160816;
        b=nS3p9StOFGGpnjB0m+PzW4Pz7Kn/whOD+naerkl8MeIrr5hwhupBBbSg3f7j1L9FN1
         LRt3QTVWxZt3+lYg/Xi0P1L+Xy6QwzCXyi2gTl03/9OurLFtQOBs8DKgQPVBpED0/0N7
         2mPERIYQZeSqCt2V6Ql4cI8t7PXKU+Imx8vLPYCUl2zKvwuuqkUvftBaYW+Bo7mms82J
         4/VsIBpxCgRYzwmB1TotrJZTX5ZEV1uJZJsQjJkFyFTUKAPpRdbWXfMKtGkvq8pzXuT8
         j+cQ/vHENQxXz2kB4djzx44TBgt6tQW12WhBEjm52+rjfTk3RhKFtayVzmVRxMtoJjy0
         TNyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nX4JQPiEzAFhnB9ENyMrEpHgnft3fb952sqvA++yGTk=;
        b=s0sGgcX8SKEmvM/8ekvF7Ja+46DWKr2OuawMl4zLlFNwBwnB7Zv/+FIK4330Sm7JoX
         4ESUKHbXeVzd9lTR+VWMEeVXqTDoL1BdKerTnPnkiBmEiGW7pneYeaO4y/5w5+WQGQlu
         sh9qj1DNgm3KEU3f71F1UEu1BoVPdohlArQatcxZkiQJpoDFOVpGjs9tJIig86mMMY7a
         O4XWj5a3WQjvgA/8rSRc8Hxroae9wq7ZXSuYqmKkv+AlTXpAGmavO3xbF/eDKJLMce1c
         OoRu4/NDVEw/63sNb0lNTy8WZ1RGYxKvd4dAd/cTkgqnQP+syL2DxwAyaviZtSOd2uBn
         u+yQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ktqu20VI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id c1si3788210qtq.356.2020.05.02.13.36.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 May 2020 13:36:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ktqu20VI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUysT-0002t2-6o
	for alex.bennee@linaro.org; Sat, 02 May 2020 16:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jUysF-0002rL-GW
 for qemu-arm@nongnu.org; Sat, 02 May 2020 16:36:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jUysD-000465-No
 for qemu-arm@nongnu.org; Sat, 02 May 2020 16:36:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58829
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jUysC-00043S-6O
 for qemu-arm@nongnu.org; Sat, 02 May 2020 16:36:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588451789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nX4JQPiEzAFhnB9ENyMrEpHgnft3fb952sqvA++yGTk=;
 b=Ktqu20VIz6tDxkf7/5NmtMSM97uGmZ607XBdog/TjDId8pbpBPX+r5F7M68NyTEdLpqypg
 HKAsxnZAqnKq4z/jLgs3qSeG06kTi8yeWGT8cqPsnEgI9OHdt8QgQwKN/172w9Fgy5GUBO
 e3dgk2aOAy3cvJ//5Do6QJw6G9PDacM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-xqgOJiRgNNW3gn9MIvlwlg-1; Sat, 02 May 2020 16:36:18 -0400
X-MC-Unique: xqgOJiRgNNW3gn9MIvlwlg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E585D1009600;
 Sat,  2 May 2020 20:36:16 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-58.ams2.redhat.com [10.36.112.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3E691002388;
 Sat,  2 May 2020 20:36:02 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 imammedo@redhat.com, shannon.zhaosl@gmail.com, mst@redhat.com
Subject: [PATCH 2/2] arm/acpi: Add the TPM2.0 device under the DSDT
Date: Sat,  2 May 2020 22:35:36 +0200
Message-Id: <20200502203536.15011-3-eric.auger@redhat.com>
In-Reply-To: <20200502203536.15011-1-eric.auger@redhat.com>
References: <20200502203536.15011-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/02 16:36:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, gshan@redhat.com,
 lersek@redhat.com, ardb@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nLTbeYIw8AV8

In case it is dynamically instantiated, add the TPM 2.0 device object
under the DSDT table in the ACPI namespace. Its HID is MSFT0101
while its current resource settings (CRS) property is initialized
with the guest physical address and MMIO size of the device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index cc5863eaf2..0cb9cdb2ce 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -45,6 +45,7 @@
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/arm/virt.h"
+#include "hw/platform-bus.h"
 #include "sysemu/numa.h"
 #include "sysemu/reset.h"
 #include "sysemu/tpm.h"
@@ -362,6 +363,38 @@ static void acpi_dsdt_add_power_button(Aml *scope)
     aml_append(scope, dev);
 }
=20
+static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
+{
+    hwaddr pbus_base =3D vms->memmap[VIRT_PLATFORM_BUS].base;
+    PlatformBusDevice *pbus =3D PLATFORM_BUS_DEVICE(vms->platform_bus_dev)=
;
+    MemoryRegion *sbdev_mr;
+    SysBusDevice *sbdev;
+    hwaddr tpm_base;
+
+    sbdev =3D (SysBusDevice *)object_dynamic_cast(OBJECT(tpm_find()),
+                                                TYPE_SYS_BUS_DEVICE);
+    if (!sbdev) {
+        return;
+    }
+
+    tpm_base =3D platform_bus_get_mmio_addr(pbus, sbdev, 0);
+    assert(tpm_base !=3D -1);
+
+    tpm_base +=3D pbus_base;
+
+    sbdev_mr =3D sysbus_mmio_get_region(sbdev, 0);
+
+    Aml *dev =3D aml_device("TPM0");
+    aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+
+    Aml *crs =3D aml_resource_template();
+    aml_append(crs,
+               aml_memory32_fixed(tpm_base, sbdev_mr->size, AML_READ_WRITE=
));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    aml_append(scope, dev);
+}
+
 static void
 build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
@@ -785,6 +818,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, Virt=
MachineState *vms)
     }
=20
     acpi_dsdt_add_power_button(scope);
+    acpi_dsdt_add_tpm(scope, vms);
=20
     aml_append(dsdt, scope);
=20
--=20
2.20.1

