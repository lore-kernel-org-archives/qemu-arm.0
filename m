Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp843704lfg;
        Mon, 24 Feb 2020 14:23:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqz18lsr3scsqzJTw2Y7x9e5FKL/feqvKTjZtae0SN2YlCKhT/8N/9z6mxDMFcX3LBotIk1Y
X-Received: by 2002:a05:6214:1633:: with SMTP id e19mr47693780qvw.104.1582582997606;
        Mon, 24 Feb 2020 14:23:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582582997; cv=none;
        d=google.com; s=arc-20160816;
        b=vREm6Q3BfDx7hzDCuiM3+Cr0FQ0wuI62oWECxZgvR519SyCCfopp31/jCuOHhqFvz4
         bCKjIZ/2cihIOSSohz13R9nI5/HMngLWoKl/jffRSe4egZZZ2uCjuY0F5eLubiX1CN0f
         wb7jG0zVF1HOBpvkqSrupvM9skvbPX5iebFsNyW1e/4/d/LUL3Y1xU2jJ16GbZEyo1ds
         Q5cXB6xDlKL2szgFGRfXRz5N4hqZYu4yDviv/q1c3nic/swu3TnQk9TI9vF5qhxaB3rz
         cPH0XFHLh2IfEdUVGgMtJw9V0TQhuNBHP0guPBJvoNCS3g82elNp3UTZew4zid9b5dDe
         mBIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Vl9pzkgL9ZtA2TNJq2XUK0NJTfJBBMQ8TW15Np5+w7o=;
        b=Ry0SjXKpCmRyeT1KzXQZG0dYk4thrhR9zAMh/Xbm1yirl2dLCPTOLZRtmCkpbumLNt
         3MuWAzbvg5A06IvKcQIx0QYoTup1n+IvqQ+CdfrLO0c9tSpJBLbzrPd5OPidpjwzRti1
         G3715gYZIkgcywfvLE7YyUEC0VsmV8ajifpkLePx91WC6XUGfhVRWKLW/OEUvm39uqfw
         /5RuXndegNeE22BqzT6X9Y1S3lTuOaRYZ7Czie+4TTm6iEuRkJIm8Cmy3pCw92bE44ey
         I0LBWt5tE/jOwnCjXPbhbNlVLvJ9vq8qedTN9Qi8Xz/hIZT08HKDiJP0T9CHkZQn27n8
         gNLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SZilWybj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16si6418896qtq.33.2020.02.24.14.23.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 14:23:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SZilWybj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6M8D-0004MA-20
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 17:23:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37652)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1j6M7a-0003yY-Bd
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 17:22:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1j6M7Y-0005j2-H9
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 17:22:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34524
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1j6M7Y-0005iJ-E2
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 17:22:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582582955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Vl9pzkgL9ZtA2TNJq2XUK0NJTfJBBMQ8TW15Np5+w7o=;
 b=SZilWybjuMPF2G0EdVFtgtPfZql093Ef+c7Lwe9oxlqppN2/QmkUiyddmcDQhEPots+DLh
 pPJkVpslvicp3WEIUUpFeX/PpoPoS+JZ+zoJnndWJeFqYigBnnT+i+tbFKQGAb1VFNWNyz
 H7MSD9G0oR8dBi3ivPpQZdPah7O+pzE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-XNENPwxzNfavfkhQ0h9SZw-1; Mon, 24 Feb 2020 17:22:34 -0500
X-MC-Unique: XNENPwxzNfavfkhQ0h9SZw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8503818A5502;
 Mon, 24 Feb 2020 22:22:32 +0000 (UTC)
Received: from localhost.localdomain.com (vpn2-54-79.bne.redhat.com
 [10.64.54.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0910A9078A;
 Mon, 24 Feb 2020 22:22:28 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/arm: Use TYPE_PL011 to create serial port
Date: Tue, 25 Feb 2020 09:22:23 +1100
Message-Id: <20200224222223.4128-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, radoslaw.biernacki@linaro.org,
 alistair@alistair23.me, qemu-arm@nongnu.org, shan.gavin@gmail.com,
 edgar.iglesias@gmail.com, leif@nuviainc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ni8QSTunetOO

This uses TYPE_PL011 when creating the serial port so that the code
looks cleaner.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
v2: Improved changelog suggested by Phil
---
 hw/arm/sbsa-ref.c    | 3 ++-
 hw/arm/virt.c        | 3 ++-
 hw/arm/xlnx-versal.c | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 9b5bcb5634..df0a165047 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -39,6 +39,7 @@
 #include "hw/pci-host/gpex.h"
 #include "hw/qdev-properties.h"
 #include "hw/usb.h"
+#include "hw/char/pl011.h"
 #include "net/net.h"
=20
 #define RAMLIMIT_GB 8192
@@ -409,7 +410,7 @@ static void create_uart(const SBSAMachineState *sms, in=
t uart,
 {
     hwaddr base =3D sbsa_ref_memmap[uart].base;
     int irq =3D sbsa_ref_irqmap[uart];
-    DeviceState *dev =3D qdev_create(NULL, "pl011");
+    DeviceState *dev =3D qdev_create(NULL, TYPE_PL011);
     SysBusDevice *s =3D SYS_BUS_DEVICE(dev);
=20
     qdev_prop_set_chr(dev, "chardev", chr);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f788fe27d6..d0da513737 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -71,6 +71,7 @@
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
 #include "hw/acpi/generic_event_device.h"
+#include "hw/char/pl011.h"
=20
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -724,7 +725,7 @@ static void create_uart(const VirtMachineState *vms, in=
t uart,
     int irq =3D vms->irqmap[uart];
     const char compat[] =3D "arm,pl011\0arm,primecell";
     const char clocknames[] =3D "uartclk\0apb_pclk";
-    DeviceState *dev =3D qdev_create(NULL, "pl011");
+    DeviceState *dev =3D qdev_create(NULL, TYPE_PL011);
     SysBusDevice *s =3D SYS_BUS_DEVICE(dev);
=20
     qdev_prop_set_chr(dev, "chardev", chr);
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 1cf3daaf4f..403fc7b881 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -22,6 +22,7 @@
 #include "hw/misc/unimp.h"
 #include "hw/intc/arm_gicv3_common.h"
 #include "hw/arm/xlnx-versal.h"
+#include "hw/char/pl011.h"
=20
 #define XLNX_VERSAL_ACPU_TYPE ARM_CPU_TYPE_NAME("cortex-a72")
 #define GEM_REVISION        0x40070106
@@ -144,7 +145,7 @@ static void versal_create_uarts(Versal *s, qemu_irq *pi=
c)
         DeviceState *dev;
         MemoryRegion *mr;
=20
-        dev =3D qdev_create(NULL, "pl011");
+        dev =3D qdev_create(NULL, TYPE_PL011);
         s->lpd.iou.uart[i] =3D SYS_BUS_DEVICE(dev);
         qdev_prop_set_chr(dev, "chardev", serial_hd(i));
         object_property_add_child(OBJECT(s), name, OBJECT(dev), &error_fat=
al);
--=20
2.23.0

