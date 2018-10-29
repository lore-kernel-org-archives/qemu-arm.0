Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4228017wro;
        Mon, 29 Oct 2018 06:38:02 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eDXIwIzHSzDyF44MNXxpYhVDp/4hzBOClmtizJZKc7fFuFcPN4EIWw8VGzMU9dKalkkemA
X-Received: by 2002:ac8:265b:: with SMTP id v27-v6mr12573715qtv.159.1540820282453;
        Mon, 29 Oct 2018 06:38:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540820282; cv=none;
        d=google.com; s=arc-20160816;
        b=d7RM5ZQkjtT4gUa/svXVB7UMXFcbEqexBiKZhKEsBXtwUUB0CwKhkEz3xue0fRBq3z
         3AKMCPj/ZQfnhhhjDAJlwdBRdfWHxgSgRJUySGw7QHCu8cpww53FgSVV0KKdLo9vEIZN
         3MFA/NqfY+l9qFr1d8gByXnp6UUA6b3jKoYLsSEoLCLzYkii/FBP3b0mjTobMBepy80n
         beeco0N6O5GW1vAP5g9muxoHJkiV1tlSjoP0ox7P9ZTPTUoHwliYib1DCHS8MpDnWDP2
         ay7/+FSx84IsUPUL7BuAX86Snb2nAKzeZa1B6zSkFkLHvU8mn7rTlvpyF0LgNB4Sz3Jl
         0IOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Pp8oAa91lBDDJClQCSQuK5D0eeEYEBUGzsdcCITYSQs=;
        b=dr2zceLgRIP7qCbYxq35FavCAET8MRgqcbnEZMFx+/s+xI3mjW1hOF6Hw7euUtUTK2
         92j6gYhLOxZnV3brOOpOTd552hoZIl6IogIRTsSqGyB7ke1CTKd9lR/c0Zmq6Z0TbcG2
         l/0cWASHt3h+4V1aHkDbK6mfDvnQT8xjWTySgIq23ea+f8nik93zPm3VXvJhQD5PHJV+
         Stme9Ni4JF3lkDFXk+I0jiCfzqJfQvX7ab54/ie4M0utTgUT4t5NCw7A3pxM7URVFKSL
         8Sl0NXSXjOFTQ8ClxtQ1lf7ZfARXaD6fxleaMKlSNQfZzEaBzOA5tW68UyX/ZV3+FBUT
         e8+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t17-v6si1230965qvd.7.2018.10.29.06.38.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 06:38:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gH7k1-00018c-Ru
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 09:38:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gH7jl-00016X-Ti
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 09:37:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gH7jk-0004bz-09
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 09:37:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55492)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1gH7jg-0004WE-Fz; Mon, 29 Oct 2018 09:37:41 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 45AA5AD886;
	Mon, 29 Oct 2018 13:37:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-158.ams2.redhat.com
	[10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B2CF75B697;
	Mon, 29 Oct 2018 13:37:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id ADD56B3E02; Mon, 29 Oct 2018 14:37:22 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Oct 2018 14:37:20 +0100
Message-Id: <20181029133722.12415-3-kraxel@redhat.com>
In-Reply-To: <20181029133722.12415-1-kraxel@redhat.com>
References: <20181029133722.12415-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 29 Oct 2018 13:37:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 2/4] audio: use TYPE_WM8750 instead of a hardcoded
 string
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
X-TUID: B5Y2KGVO2HYb

From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>

Cc: Jan Kiszka <jan.kiszka@web.de>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-id: 20181022074050.19638-2-maozhongyi@cmss.chinamobile.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/arm/musicpal.c          | 2 +-
 hw/audio/marvell_88w8618.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index c807010e83..3dafb41b0b 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1695,7 +1695,7 @@ static void musicpal_init(MachineState *machine)
     wm8750_dev =3D i2c_create_slave(i2c, TYPE_WM8750, MP_WM_ADDR);
     dev =3D qdev_create(NULL, "mv88w8618_audio");
     s =3D SYS_BUS_DEVICE(dev);
-    qdev_prop_set_ptr(dev, "wm8750", wm8750_dev);
+    qdev_prop_set_ptr(dev, TYPE_WM8750, wm8750_dev);
     qdev_init_nofail(dev);
     sysbus_mmio_map(s, 0, MP_AUDIO_BASE);
     sysbus_connect_irq(s, 0, pic[MP_AUDIO_IRQ]);
diff --git a/hw/audio/marvell_88w8618.c b/hw/audio/marvell_88w8618.c
index e546892d3c..cf6ce6979b 100644
--- a/hw/audio/marvell_88w8618.c
+++ b/hw/audio/marvell_88w8618.c
@@ -280,7 +280,7 @@ static const VMStateDescription mv88w8618_audio_vmsd =
=3D {
 };
=20
 static Property mv88w8618_audio_properties[] =3D {
-    DEFINE_PROP_PTR("wm8750", mv88w8618_audio_state, wm),
+    DEFINE_PROP_PTR(TYPE_WM8750, mv88w8618_audio_state, wm),
     {/* end of list */},
 };
=20
--=20
2.9.3

