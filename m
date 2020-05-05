Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp139065lfb;
        Tue, 5 May 2020 07:45:06 -0700 (PDT)
X-Google-Smtp-Source: APiQypK2svlRtoqeuhUW9CJ6vUQk2EEgDY+taMxzrKAh3p3iZ4KpVYgQyiHlx4JZ7QVam4YLuTJu
X-Received: by 2002:ae9:e20d:: with SMTP id c13mr3501120qkc.241.1588689905980;
        Tue, 05 May 2020 07:45:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588689905; cv=none;
        d=google.com; s=arc-20160816;
        b=X92XCz2fEvT4rFOm/NwTr5Mp5+mNnKj5VrD+7qbYkzQ068UxqXU5nvHXw4GHzg/H9G
         S0fvkgZnY0APi/f0amw4Y0F3f+UCQ/62VnC9OVDJqRb7RdiZ0qTJ5djNTponylWa+9fW
         0DZj7hjMj6qWIJHCnFBEXPo05Vf1n4nOwvPezThdPtYMOyANBZ3aOBU9sGAkvfAUH3Zr
         uS3I72ICxJ1Fzh51FwY2T7OiPc81kWcah26f9FKkUB4zb3MFk9+Z/xKhqJpup3PsoBPP
         vB2QmL393/QRmQVDp4Kdrw83JUfBlRsHUqqLYnvMz7C04eandcDesR9n3Mg/cDHmRgHT
         oEVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+y7WMV3btEsmWqlJ0VZGXww+ICsd0jjrW1ncM6f5HS8=;
        b=CxrSYmRrYe+4DjqMhcioOZaoq5dJgJE09yHOB2bbPDrw1kEFH5oL7Qm8QBqurK6HI4
         Wty2YGIqslDdf/nS1u+K5BWu19z/4ehQZ8Sme/pTD5mVd46g4OaXIXcBIsyfIXD7OPDG
         cok7EGsl6eNeD9DAgxzm6RXe2ZOsnc3LxGMHXJfbRAakdIFj/yLLFvFb4lF4Rm74Ahf8
         jZOwdvogSvBHo4W9XK5jRL3+aScgcBcO/vbaPEJ96nXAs6gyquQnCx4AMHaIeHb8fS1j
         24KF47Ov7ZxawyALa1RPUv+s+ByU6/LRQ2nbXRYGreF+DqTQU9yuaGfTdwLLg8aURVAJ
         VVCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VfZYTpta;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id x7si1288268qkn.142.2020.05.05.07.45.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 May 2020 07:45:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VfZYTpta;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVyoj-0005u6-By
	for alex.bennee@linaro.org; Tue, 05 May 2020 10:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jVyoZ-0005qt-94
 for qemu-arm@nongnu.org; Tue, 05 May 2020 10:44:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39129
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jVyoY-0004aW-Ds
 for qemu-arm@nongnu.org; Tue, 05 May 2020 10:44:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588689893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+y7WMV3btEsmWqlJ0VZGXww+ICsd0jjrW1ncM6f5HS8=;
 b=VfZYTptagslUGPfJOO22jiptTuY0EY05THK+0PILG1774SGq9oQBq05EsEqDi70hR7CzCi
 ttUkKk9Z0vvqJJXWymAcZq6PSeDsrLbhj6dJgPfGSaMISaBqHwbfurBTLNcfrxW4Dw5Z4i
 nmr2JBeBxYV1pCQiBJKWRC35aM0QIGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-PIRjhIutOd2Mp5rSHmv0JQ-1; Tue, 05 May 2020 10:44:52 -0400
X-MC-Unique: PIRjhIutOd2Mp5rSHmv0JQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9C0F1902EA2;
 Tue,  5 May 2020 14:44:50 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 122E26060E;
 Tue,  5 May 2020 14:44:39 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 imammedo@redhat.com, shannon.zhaosl@gmail.com, mst@redhat.com
Subject: [PATCH v2 3/3] arm/acpi: Add the TPM2.0 device under the DSDT
Date: Tue,  5 May 2020 16:44:19 +0200
Message-Id: <20200505144419.29174-4-eric.auger@redhat.com>
In-Reply-To: <20200505144419.29174-1-eric.auger@redhat.com>
References: <20200505144419.29174-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 00:37:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, gshan@redhat.com,
 lersek@redhat.com, ardb@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oIHH+kOcrpc8

In case it is dynamically instantiated, add the TPM 2.0 device object
under the DSDT table in the ACPI namespace. Its HID is MSFT0101
while its current resource settings (CRS) property is initialized
with the guest physical address and MMIO size of the device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

---

v1 -> v2:
- use memory_region_size
- fix mingw compilation issue by casting to uint32_t
- added Stefan's R-b
---
 hw/arm/virt-acpi-build.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 1a2ec10c8f..8534d14e20 100644
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
@@ -362,6 +363,40 @@ static void acpi_dsdt_add_power_button(Aml *scope)
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
@@ -756,6 +791,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, Virt=
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

