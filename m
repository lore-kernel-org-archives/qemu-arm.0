Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4227725wro;
        Mon, 29 Oct 2018 06:37:47 -0700 (PDT)
X-Google-Smtp-Source: AJdET5d0Tl+V/GPI1OzZbT0/RenVjIwRp5S5OYSvFfW3sPkn0eCcaChKHbxLpAnL2DOB1JM2uu5d
X-Received: by 2002:a37:291:: with SMTP id v17mr1454009qkg.208.1540820267231;
        Mon, 29 Oct 2018 06:37:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540820267; cv=none;
        d=google.com; s=arc-20160816;
        b=wM67a/zl4kthRU5ljQwmFTmAICL3UJJfWKtHkGXCqwSVfm2Cbe7y0CD+ne+vITKege
         q9sbuAzzSNAqqFPz1pso1yI5iiVQoKP6/UFcLmpoBUSA4BwAW8b0KPpiBGpwFV8iPbmM
         dMnjnkKA7Z/0SfYdbRk6i308PahBUkeJgPt8B/6Dy+InW6tvMJLlxAZFzuPFpfEmXo01
         TNeL6qb8YqLqcJj9knuZZNlsLqSADJQyM0S2jgOja/qxHxiFNygD28RzjEDdJbLrclds
         rf13jTYQB+inURwHl6cWNfcIFXV7ldyutSXviXH19sjlynzXFkLt+9c2D5uAyoGFwtaR
         3ioA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=0/0m0UejLKDlRsZTp4CTbo5kPUbgGjJWo3is6ch011U=;
        b=yBkaxRi3XKt1BiuatKSPVUAT8dBlJCu7CYc2Ch1wXDC897VZyijUfEAQP6HQoFSY8R
         kCdBZ+/tQWN3NjhmHbyvcINjl/R+zm9P7NQSbMwkHNI0/AlcEn18y360+64Kx9ky24AQ
         M5914PzoogPd2MKHdD9i6G+S3ROoLKr/RzyEBWPiCJaYmQ9FwXCKgmQRlVejQAilWRwa
         fZX/Vmin98KUyi/f/JvLkzedXaLS50xdFWkxVcjxXhJybxe3PUSFe0iaCfZR49cYagmQ
         xopwU1zGTE3cHTGQ5FlsQ4C3tYYW9yySJ8+EapJvP4njpieiq6e2XtpXAV+MQb0O9QMo
         xlLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p77-v6si4249742qka.203.2018.10.29.06.37.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 06:37:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45628 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gH7jm-00012n-Kk
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 09:37:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gH7je-00012H-J6
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 09:37:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gH7jW-0004Tg-LT
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 09:37:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51018)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1gH7jW-0004SH-3q; Mon, 29 Oct 2018 09:37:30 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B0A5531129E1;
	Mon, 29 Oct 2018 13:37:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-158.ams2.redhat.com
	[10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A113F5DD7E;
	Mon, 29 Oct 2018 13:37:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id C34A216444D; Mon, 29 Oct 2018 14:37:22 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Oct 2018 14:37:22 +0100
Message-Id: <20181029133722.12415-5-kraxel@redhat.com>
In-Reply-To: <20181029133722.12415-1-kraxel@redhat.com>
References: <20181029133722.12415-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 29 Oct 2018 13:37:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 4/4] audio: use TYPE_MV88W8618_AUDIO instead of
 hardcoded string
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Mao Zhongyi <maozhongyi@cmss.chinamobile.com>,
	qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cc9mTOMGfKRe

From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>

Cc: Jan Kiszka <jan.kiszka@web.de>
Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-id: 20181022074050.19638-4-maozhongyi@cmss.chinamobile.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/audio/wm8750.h  | 1 +
 hw/arm/musicpal.c          | 2 +-
 hw/audio/marvell_88w8618.c | 1 -
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/audio/wm8750.h b/include/hw/audio/wm8750.h
index 84e7a119bb..e12cb886d1 100644
--- a/include/hw/audio/wm8750.h
+++ b/include/hw/audio/wm8750.h
@@ -17,6 +17,7 @@
 #include "hw/hw.h"
=20
 #define TYPE_WM8750 "wm8750"
+#define TYPE_MV88W8618_AUDIO "mv88w8618_audio"
=20
 typedef void data_req_cb(void *opaque, int free_out, int free_in);
=20
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index ac266f9253..9648b3af44 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1693,7 +1693,7 @@ static void musicpal_init(MachineState *machine)
     }
=20
     wm8750_dev =3D i2c_create_slave(i2c, TYPE_WM8750, MP_WM_ADDR);
-    dev =3D qdev_create(NULL, "mv88w8618_audio");
+    dev =3D qdev_create(NULL, TYPE_MV88W8618_AUDIO);
     s =3D SYS_BUS_DEVICE(dev);
     object_property_set_link(OBJECT(dev), OBJECT(wm8750_dev),
                              TYPE_WM8750, NULL);
diff --git a/hw/audio/marvell_88w8618.c b/hw/audio/marvell_88w8618.c
index 1c7080e844..6600ab4851 100644
--- a/hw/audio/marvell_88w8618.c
+++ b/hw/audio/marvell_88w8618.c
@@ -39,7 +39,6 @@
 #define MP_AUDIO_CLOCK_24MHZ    (1 << 9)
 #define MP_AUDIO_MONO           (1 << 14)
=20
-#define TYPE_MV88W8618_AUDIO "mv88w8618_audio"
 #define MV88W8618_AUDIO(obj) \
     OBJECT_CHECK(mv88w8618_audio_state, (obj), TYPE_MV88W8618_AUDIO)
=20
--=20
2.9.3

