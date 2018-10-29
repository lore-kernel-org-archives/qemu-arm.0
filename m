Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4228188wro;
        Mon, 29 Oct 2018 06:38:12 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dWff5LPNeoYhWZrBY3wBVVmjpdw1de0i2F7c+PxpbbVzFQutY4iXPC3KIEcUmIvt0/bcyk
X-Received: by 2002:a37:bb42:: with SMTP id l63-v6mr12348418qkf.214.1540820292063;
        Mon, 29 Oct 2018 06:38:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540820292; cv=none;
        d=google.com; s=arc-20160816;
        b=yMg45FvAm6L1685Z5ZODCxwpdZLeqWLnKSBcUKw3l2C/XN4bEZJtRc7QD/TNb7PazA
         4cy+KS5eXObER7pg3+qmSTIcPOSK1l4IvIg8hfL3I5tcGao9U4APg70f7KYwRI2J5zXX
         bs4dqQ/Gnlt847IGrowUGhdTRn46ytX/QWfHCsnYyZMLrqVGQY4pvVRaEM9qH2xJnyzF
         9capL1cATJAOapOoIaJqvKV1ctjsHi9/2CAHdGuhJugOv07XC+exgz9Mt3v3oAy+ZRCz
         YotN2TX1UtfYsIwd3J9AdqhPbnGZw4noNlyEcHe/ZHK53+zxnJ3UVYzXAAbYsKjJqFJb
         tegg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=NXJ368lnva4dYRbrb0QY/Uc6x821MpwSsVe6EeEYAA8=;
        b=rWQjnma5YT+2XluTeowvUZOWFbhFIvbHHw8uIPctWE42f1cSadywO5N2k9Q4/rLOsS
         c5wUK3hsPngxA3/xj9YXQzv+A/sn/j0nO3C74HgcJs/wuvN6j1UX1DkSZkJwku7Fq7cA
         15WVIfYs5mN0GfRajb8IF6IVLbeZfQ+V5B1fLfJSgvAzFl4qku2u27xg6RtGcuIhj5Xt
         PYEXXpGlRxwzqqoE0oe1YI/cHd5UhgvvaTzvsoSf298CrveHAMXkcAbIg/mPINUuXpKu
         v7P6/fbTMNCArqSfSEedy3Hu7kPDbtm8xXRjEidgrZywt5HADNr4dgpP+OmI38WKtB6m
         f3Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m17si10330452qvh.10.2018.10.29.06.38.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 06:38:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gH7kB-0001P2-Jg
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 09:38:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gH7jl-00016a-UU
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 09:37:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gH7jk-0004cZ-5d
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 09:37:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62633)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1gH7ji-0004WA-5O; Mon, 29 Oct 2018 09:37:44 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33D4630A480F;
	Mon, 29 Oct 2018 13:37:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-158.ams2.redhat.com
	[10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A12B05B687;
	Mon, 29 Oct 2018 13:37:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id B6D0916444B; Mon, 29 Oct 2018 14:37:22 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Oct 2018 14:37:21 +0100
Message-Id: <20181029133722.12415-4-kraxel@redhat.com>
In-Reply-To: <20181029133722.12415-1-kraxel@redhat.com>
References: <20181029133722.12415-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Mon, 29 Oct 2018 13:37:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 3/4] audio: use object link instead of qdev
 property to pass wm8750 reference
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Gerd Hoffmann <kraxel@redhat.com>,
	Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Do87w1tqBNqU

From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>

According to qdev-properties.h, properties of pointer type should
be avoided, it seems a link type property is a good substitution.

Cc: Jan Kiszka <jan.kiszka@web.de>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-id: 20181022074050.19638-3-maozhongyi@cmss.chinamobile.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/arm/musicpal.c          |  3 ++-
 hw/audio/marvell_88w8618.c | 13 ++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 3dafb41b0b..ac266f9253 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1695,7 +1695,8 @@ static void musicpal_init(MachineState *machine)
     wm8750_dev =3D i2c_create_slave(i2c, TYPE_WM8750, MP_WM_ADDR);
     dev =3D qdev_create(NULL, "mv88w8618_audio");
     s =3D SYS_BUS_DEVICE(dev);
-    qdev_prop_set_ptr(dev, TYPE_WM8750, wm8750_dev);
+    object_property_set_link(OBJECT(dev), OBJECT(wm8750_dev),
+                             TYPE_WM8750, NULL);
     qdev_init_nofail(dev);
     sysbus_mmio_map(s, 0, MP_AUDIO_BASE);
     sysbus_connect_irq(s, 0, pic[MP_AUDIO_IRQ]);
diff --git a/hw/audio/marvell_88w8618.c b/hw/audio/marvell_88w8618.c
index cf6ce6979b..1c7080e844 100644
--- a/hw/audio/marvell_88w8618.c
+++ b/hw/audio/marvell_88w8618.c
@@ -15,6 +15,7 @@
 #include "hw/i2c/i2c.h"
 #include "hw/audio/wm8750.h"
 #include "audio/audio.h"
+#include "qapi/error.h"
=20
 #define MP_AUDIO_SIZE           0x00001000
=20
@@ -252,6 +253,11 @@ static void mv88w8618_audio_init(Object *obj)
     memory_region_init_io(&s->iomem, obj, &mv88w8618_audio_ops, s,
                           "audio", MP_AUDIO_SIZE);
     sysbus_init_mmio(dev, &s->iomem);
+
+    object_property_add_link(OBJECT(dev), "wm8750", TYPE_WM8750,
+                             (Object **) &s->wm,
+                             qdev_prop_allow_set_link_before_realize,
+                             0, &error_abort);
 }
=20
 static void mv88w8618_audio_realize(DeviceState *dev, Error **errp)
@@ -279,11 +285,6 @@ static const VMStateDescription mv88w8618_audio_vmsd=
 =3D {
     }
 };
=20
-static Property mv88w8618_audio_properties[] =3D {
-    DEFINE_PROP_PTR(TYPE_WM8750, mv88w8618_audio_state, wm),
-    {/* end of list */},
-};
-
 static void mv88w8618_audio_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
@@ -291,8 +292,6 @@ static void mv88w8618_audio_class_init(ObjectClass *k=
lass, void *data)
     dc->realize =3D mv88w8618_audio_realize;
     dc->reset =3D mv88w8618_audio_reset;
     dc->vmsd =3D &mv88w8618_audio_vmsd;
-    dc->props =3D mv88w8618_audio_properties;
-    /* Reason: pointer property "wm8750" */
     dc->user_creatable =3D false;
 }
=20
--=20
2.9.3

