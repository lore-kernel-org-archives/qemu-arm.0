Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4628870lfg;
        Sun, 23 Feb 2020 20:17:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqwCJIHRS4RPZbqzrM1/+uwPOTBnApspuhAHSh/iLOwPwgDBd/L8xVZdPubC5wfx2Syxwt5K
X-Received: by 2002:a37:742:: with SMTP id 63mr48210474qkh.31.1582517826775;
        Sun, 23 Feb 2020 20:17:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582517826; cv=none;
        d=google.com; s=arc-20160816;
        b=f8iWgsV94MkhlKSMGJbgpwvqIcioXP0MP0v8i4Mbrl4b92JWQMXPszmYWI/FkGvvAE
         mJ/PedLcgtTxoWt9sJXPdRpogY2d4goV4FiHOaQpEh6phnW7jZaG7Nj83fBEsmPkMmes
         MpPCWbx0QQG20uE0t/XGX4SC7qu53p7PNxszonbT7djo1M8fcPHhaHHvuQWKmaDEADWH
         rOhMNqp79V22MFnSmi9EZm5qgWTIZGifUXoqH8qgfj7/CJBbpPeKT7aobyfJaJPfRoLW
         HX3UKzbbJb+kg/JPqGJoTJ9KrtW/kZSaHn8tkb2Tgs9KgnQlm/EoanGZNkgXUKjGtt+t
         hkog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=JC3y6mf5XDOlqH25YUz820mAiH7SqFSX5sGPp3pIDyI=;
        b=KqjvKdgXYe+88Ca03iNXt9MJ1dRPTX+Qdw21eQI/cqixoGFsenAphXssTL21NigrwF
         KvV6YE12IvzXmR844gTM5VveX4zDbq3S9Z+j5iSDCqAJToyOgSWvtEQYny1JvrjFdjrZ
         mdU0tHyvAG6OrNLPh7L8Z6kHkm5JK3X/dCQwnDbX3wxv4LvlpohWBxSa6nwGlxUTTaHU
         jCdUxXJMbnuxuoVCcsHA7mSJNFWnW6LuFqQKvwnCqbWotf+gioJmRcDlL+gMHV8j54uQ
         n21XRCORJfbXi2U9CXBS+z8GcZNnFdSQIxYNDX4r71YjW3ldHa9t0cvEz4w6AAq8rwpN
         1d8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iHH60lJp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7si4795904qvr.214.2020.02.23.20.17.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Feb 2020 20:17:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iHH60lJp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j65B4-0001fi-7D
	for alex.bennee@linaro.org; Sun, 23 Feb 2020 23:17:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33399)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1j65Am-0001en-2u
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 23:16:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1j65Ak-0007JQ-Hi
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 23:16:47 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53182
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1j65Ak-0007Ir-EI
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 23:16:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582517805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JC3y6mf5XDOlqH25YUz820mAiH7SqFSX5sGPp3pIDyI=;
 b=iHH60lJp/QAY9k39T6ij3F6FkekC3cowM7m4Rj9NkZD0884dQpTwm3A3Ye2p0EqGxz4b/E
 tICd7CDed01ymbJYN1BvJ8F0SahgGmKQrEC//TYtyPSoSdZE6ORnbs4L2I8046KA1nuOMR
 TWW3Tw1KCZ6cgyV2inzqaf4/CLGj1q4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-t_2xYZUuO0m0Xq0sKEb1Lg-1; Sun, 23 Feb 2020 23:16:44 -0500
X-MC-Unique: t_2xYZUuO0m0Xq0sKEb1Lg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57E911005510;
 Mon, 24 Feb 2020 04:16:42 +0000 (UTC)
Received: from localhost.localdomain.com (vpn2-54-48.bne.redhat.com
 [10.64.54.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5199039F;
 Mon, 24 Feb 2020 04:16:37 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH] hw/arm: Use TYPE_PL011 to create serial port
Date: Mon, 24 Feb 2020 15:16:33 +1100
Message-Id: <20200224041633.97345-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, radoslaw.biernacki@linaro.org,
 alistair@alistair23.me, shan.gavin@gmail.com, leif@nuviainc.com,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6VFqU4g7mARU

This uses TYPE_PL011 when creating the serial port, to make the code
a bit more atomatic.

Signed-off-by: Gavin Shan <gshan@redhat.com>
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

