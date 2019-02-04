Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4115780wrt;
        Mon, 4 Feb 2019 15:25:15 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbDCB4ioDYj6/hwFn4xMKlLAQmEBM0s7KeGlcbqqzeAxAZ5zB9RFhlRHGI9YZCur+IvsVMp
X-Received: by 2002:a25:9901:: with SMTP id z1mr1585526ybn.377.1549322715885;
        Mon, 04 Feb 2019 15:25:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549322715; cv=none;
        d=google.com; s=arc-20160816;
        b=oxRV+fvTxQPI+Z0JU6wgQYLfydPTAo36f4vbLbj6Hra4iZV8/WJLJ8q7KNPhTgKAHs
         T7z2I05xTedFIk4DxKCniE52XVyrEl2bM5KLP9cbPreoakHWj7Lu+FChie8vFpy0FPkc
         6Vu+KJs0OM5LOUKwIjqAjWCaxE/mML2Sn7e6Df6WoSKhYdb4sIEX0IqV2u6B+EJ4CoCy
         zZg2W+KmF5G4XBTljwyQcfOFukgHq3Md6CmNWIZoG7dnUlK9EsIdAz9lXlmhaMK+Ul9u
         g1Mq44IyrWh8ff4x/nur9qC4OhJaz5/yoCagXVi/g41ydlG0D8df9CHRwJD4PQLhYHjt
         B3Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=jPgCtWFD+D98+FpBXWtZ19Z5FtULdQ7SpxPm1IFym5M=;
        b=zVSDS9G+eKEkCSnasmnQdxo+ODRocYElctx4YtjxbSnffS/NYeQi2AyWUZzVssHUFW
         9oJauDj293ea77gqb/iH049g0Wh747bEoMadWO4c+Vwp7zL4CG97+TYp7DHAh5de1qOh
         o6kgpejwNuZCqgv2yVS88DtDjQvn5dCVD9YoA/c/itE55+EpVvP8eIbdMKTirdHCVA6u
         GSXvVsmrjTtBGlG3bqVkJoWvG7405vpdigybbHXPGAjmMl7o4w3qlxvf5phStVDNxNMg
         jcCxXGudTyZdzwxBHdN4BqEI5Mt1bo9Ag9z8SqsbUOdZKBUGwqu1zKDiuSVkj+4m480H
         +Zig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4si899847yba.319.2019.02.04.15.25.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Feb 2019 15:25:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51016 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gqnc3-00067j-9i
	for alex.bennee@linaro.org; Mon, 04 Feb 2019 18:25:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnW7-0000z4-Qd
	for qemu-arm@nongnu.org; Mon, 04 Feb 2019 18:19:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnW6-0000pA-TA
	for qemu-arm@nongnu.org; Mon, 04 Feb 2019 18:19:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45516)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gqnW6-0000ol-LF; Mon, 04 Feb 2019 18:19:06 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8FEA7A53C0;
	Mon,  4 Feb 2019 23:19:05 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-98.brq.redhat.com [10.40.204.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B586013AB9;
	Mon,  4 Feb 2019 23:18:54 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  5 Feb 2019 00:18:08 +0100
Message-Id: <20190204231815.29661-5-philmd@redhat.com>
In-Reply-To: <20190204231815.29661-1-philmd@redhat.com>
References: <20190204231815.29661-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 04 Feb 2019 23:19:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 04/11] hw/devices: Move Blizzard declarations
 into a new header
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>, Thomas Huth <thuth@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gY1qLyeZygCt

Add an entries the Blizzard device in MAINTAINERS.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS                   |  2 ++
 hw/arm/nseries.c              |  1 +
 hw/display/blizzard.c         |  2 +-
 include/hw/devices.h          |  7 -------
 include/hw/display/blizzard.h | 22 ++++++++++++++++++++++
 5 files changed, 26 insertions(+), 8 deletions(-)
 create mode 100644 include/hw/display/blizzard.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 52058a8983..a21e7b546b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -648,10 +648,12 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/nseries.c
+F: hw/display/blizzard.c
 F: hw/input/lm832x.c
 F: hw/input/tsc2005.c
 F: hw/misc/cbus.c
 F: hw/timer/twl92230.c
+F: include/hw/display/blizzard.h
=20
 Palm
 M: Andrzej Zaborowski <balrogg@gmail.com>
diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 906b7ca22d..9521be1cef 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -31,6 +31,7 @@
 #include "hw/boards.h"
 #include "hw/i2c/i2c.h"
 #include "hw/devices.h"
+#include "hw/display/blizzard.h"
 #include "hw/block/flash.h"
 #include "hw/hw.h"
 #include "hw/bt.h"
diff --git a/hw/display/blizzard.c b/hw/display/blizzard.c
index 291abe6fca..471bd0ed99 100644
--- a/hw/display/blizzard.c
+++ b/hw/display/blizzard.c
@@ -21,7 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "ui/console.h"
-#include "hw/devices.h"
+#include "hw/display/blizzard.h"
 #include "ui/pixel_ops.h"
=20
 typedef void (*blizzard_fn_t)(uint8_t *, const uint8_t *, unsigned int);
diff --git a/include/hw/devices.h b/include/hw/devices.h
index 1e2141caad..77d6611302 100644
--- a/include/hw/devices.h
+++ b/include/hw/devices.h
@@ -29,13 +29,6 @@ void tsc2005_set_transform(void *opaque, MouseTransfor=
mInfo *info);
 /* stellaris_input.c */
 void stellaris_gamepad_init(int n, qemu_irq *irq, const int *keycode);
=20
-/* blizzard.c */
-void *s1d13745_init(qemu_irq gpio_int);
-void s1d13745_write(void *opaque, int dc, uint16_t value);
-void s1d13745_write_block(void *opaque, int dc,
-                void *buf, size_t len, int pitch);
-uint16_t s1d13745_read(void *opaque, int dc);
-
 /* cbus.c */
 typedef struct {
     qemu_irq clk;
diff --git a/include/hw/display/blizzard.h b/include/hw/display/blizzard.=
h
new file mode 100644
index 0000000000..ef72bbc186
--- /dev/null
+++ b/include/hw/display/blizzard.h
@@ -0,0 +1,22 @@
+/*
+ * Epson S1D13744/S1D13745 (Blizzard/Hailstorm/Tornado) LCD/TV controlle=
r.
+ *
+ * Copyright (C) 2008 Nokia Corporation
+ * Written by Andrzej Zaborowski
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_DISPLAY_BLIZZARD_H
+#define HW_DISPLAY_BLIZZARD_H
+
+#include "hw/irq.h"
+
+void *s1d13745_init(qemu_irq gpio_int);
+void s1d13745_write(void *opaque, int dc, uint16_t value);
+void s1d13745_write_block(void *opaque, int dc,
+                          void *buf, size_t len, int pitch);
+uint16_t s1d13745_read(void *opaque, int dc);
+
+#endif
--=20
2.20.1

