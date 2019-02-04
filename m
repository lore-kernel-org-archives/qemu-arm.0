Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4114555wrt;
        Mon, 4 Feb 2019 15:23:21 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYFMUkRA0oEzPPhbwd7RZGBJnHV5TUY67ydKjUT4RoBOrjVwaJC1GRjo//gOxT51jwX8DJq
X-Received: by 2002:a81:7ad2:: with SMTP id v201mr1654065ywc.302.1549322601857;
        Mon, 04 Feb 2019 15:23:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549322601; cv=none;
        d=google.com; s=arc-20160816;
        b=GDTaPeMhOJC1mWDGGz0IWjCUxiJ487t2/aGMShwGGd2PWp8Xonj/RUliJhefaG80wq
         N3lCPHl4X4kZ9LEeVvKzAssp/qKF3FFKNq2/Vj4VzT6SIL3hWpiTlgs63kfdY9mNo0Xs
         giRxBspXIBP7OgU2QgE7sT+dofDZNaA+3S4F0LhCcvqblZYpUd/ZbfQUOoCCnX3EXSzf
         kOUmvOlBlnTzaGtCWIyIuH6VdpA5cONPqVwhX/S0oyOBHARqSPses7nVP66lTro6tA+c
         UJvSgg2lxSp3NWPwdHyx5olNAJLPDkWQ02KGPTNnZ4+JSRm5nG1Mo9YYWbzhvwsBXekp
         i0Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=sbnKb9R83lFSbZUC6DxV4IGC8CPKrHGvsR52RhpBUS8=;
        b=vkX+NrrURN2tcWTS5/OS45Fvix9abRy7DDytdJRMDW/wKUJrDl+uEWIgSDKHuYq93K
         q9OFDVwrNHtaBOqUZUzI142Ya2Kpd2aFsOk+yn9rsL9y36zHxH6WHW1ezi/qiA3ouNDu
         Qof+Q2IdW5mlJ8hSzSW6n3ncQocN50ThOm1k3OgmMA54s3AaDUaygXdku/HE0ChX2Y3H
         OopscJCQZgvMR9FS4HYUtaiV//K20vJ8huY0gHyu34nvBt7AwbRYaEcZsCWxRy9mC/U7
         zza3Tyy5Ify8T/BjWwGmY/WBpQ4wBofcnb9V6CxxuPOFjf6iDYhiYL8GnzpVMGYYhqN3
         8L5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 186si892148ybv.17.2019.02.04.15.23.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Feb 2019 15:23:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50975 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gqnaD-0004JX-8N
	for alex.bennee@linaro.org; Mon, 04 Feb 2019 18:23:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnWo-0001Wt-IQ
	for qemu-arm@nongnu.org; Mon, 04 Feb 2019 18:19:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnWn-0001Bt-4t
	for qemu-arm@nongnu.org; Mon, 04 Feb 2019 18:19:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54794)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gqnWl-00018j-6p; Mon, 04 Feb 2019 18:19:49 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 526B688E53;
	Mon,  4 Feb 2019 23:19:44 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-98.brq.redhat.com [10.40.204.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39ED987A5;
	Mon,  4 Feb 2019 23:19:34 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  5 Feb 2019 00:18:11 +0100
Message-Id: <20190204231815.29661-8-philmd@redhat.com>
In-Reply-To: <20190204231815.29661-1-philmd@redhat.com>
References: <20190204231815.29661-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 04 Feb 2019 23:19:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 07/11] hw/devices: Move TI touchscreen
 declarations into a new header
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
	Andrzej Zaborowski <balrogg@gmail.com>,
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
X-TUID: I04XzWFteaTY

Since uWireSlave is only used in this new header, there is no
need to expose it via "qemu/typedefs.h".

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS                |  2 ++
 hw/arm/nseries.c           |  2 +-
 hw/arm/palm.c              |  2 +-
 hw/input/tsc2005.c         |  2 +-
 hw/input/tsc210x.c         |  4 ++--
 include/hw/arm/omap.h      |  6 +-----
 include/hw/devices.h       | 15 ---------------
 include/hw/input/tsc2xxx.h | 38 ++++++++++++++++++++++++++++++++++++++
 include/qemu/typedefs.h    |  1 -
 9 files changed, 46 insertions(+), 26 deletions(-)
 create mode 100644 include/hw/input/tsc2xxx.h

diff --git a/MAINTAINERS b/MAINTAINERS
index a38086f767..6b0b5ccb41 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -654,6 +654,7 @@ F: hw/input/tsc2005.c
 F: hw/misc/cbus.c
 F: hw/timer/twl92230.c
 F: include/hw/display/blizzard.h
+F: include/hw/input/tsc2xxx.h
 F: include/hw/misc/cbus.h
=20
 Palm
@@ -663,6 +664,7 @@ L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/palm.c
 F: hw/input/tsc210x.c
+F: include/hw/input/tsc2xxx.h
=20
 Raspberry Pi
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index ac876b5878..5ac2ca0877 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -30,8 +30,8 @@
 #include "ui/console.h"
 #include "hw/boards.h"
 #include "hw/i2c/i2c.h"
-#include "hw/devices.h"
 #include "hw/display/blizzard.h"
+#include "hw/input/tsc2xxx.h"
 #include "hw/misc/cbus.h"
 #include "hw/block/flash.h"
 #include "hw/hw.h"
diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index 285f43709d..139d27d1cc 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -26,7 +26,7 @@
 #include "hw/arm/omap.h"
 #include "hw/boards.h"
 #include "hw/arm/arm.h"
-#include "hw/devices.h"
+#include "hw/input/tsc2xxx.h"
 #include "hw/loader.h"
 #include "exec/address-spaces.h"
 #include "cpu.h"
diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
index 2b9108a193..f82771e7a7 100644
--- a/hw/input/tsc2005.c
+++ b/hw/input/tsc2005.c
@@ -23,7 +23,7 @@
 #include "hw/hw.h"
 #include "qemu/timer.h"
 #include "ui/console.h"
-#include "hw/devices.h"
+#include "hw/input/tsc2xxx.h"
 #include "trace.h"
=20
 #define TSC_CUT_RESOLUTION(value, p)	((value) >> (16 - (p ? 12 : 10)))
diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index ded0db9351..542a9188be 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -24,8 +24,8 @@
 #include "audio/audio.h"
 #include "qemu/timer.h"
 #include "ui/console.h"
-#include "hw/arm/omap.h"	/* For I2SCodec and uWireSlave */
-#include "hw/devices.h"
+#include "hw/arm/omap.h"            /* For I2SCodec */
+#include "hw/input/tsc2xxx.h"
=20
 #define TSC_DATA_REGISTERS_PAGE		0x0
 #define TSC_CONTROL_REGISTERS_PAGE	0x1
diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index e7fbd340f3..9de867daa4 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -20,6 +20,7 @@
 #include "exec/memory.h"
 # define hw_omap_h		"omap.h"
 #include "hw/irq.h"
+#include "hw/input/tsc2xxx.h"
 #include "target/arm/cpu-qom.h"
 #include "qemu/log.h"
=20
@@ -679,11 +680,6 @@ qemu_irq *omap_mpuio_in_get(struct omap_mpuio_s *s);
 void omap_mpuio_out_set(struct omap_mpuio_s *s, int line, qemu_irq handl=
er);
 void omap_mpuio_key(struct omap_mpuio_s *s, int row, int col, int down);
=20
-struct uWireSlave {
-    uint16_t (*receive)(void *opaque);
-    void (*send)(void *opaque, uint16_t data);
-    void *opaque;
-};
 struct omap_uwire_s;
 void omap_uwire_attach(struct omap_uwire_s *s,
                 uWireSlave *slave, int chipselect);
diff --git a/include/hw/devices.h b/include/hw/devices.h
index 7a630da47f..ba9034050b 100644
--- a/include/hw/devices.h
+++ b/include/hw/devices.h
@@ -4,7 +4,6 @@
 /* Devices that have nowhere better to go.  */
=20
 #include "hw/hw.h"
-#include "ui/console.h"
=20
 /* smc91c111.c */
 void smc91c111_init(NICInfo *, uint32_t, qemu_irq);
@@ -12,18 +11,4 @@ void smc91c111_init(NICInfo *, uint32_t, qemu_irq);
 /* lan9118.c */
 void lan9118_init(NICInfo *, uint32_t, qemu_irq);
=20
-/* tsc210x.c */
-uWireSlave *tsc2102_init(qemu_irq pint);
-uWireSlave *tsc2301_init(qemu_irq penirq, qemu_irq kbirq, qemu_irq dav);
-I2SCodec *tsc210x_codec(uWireSlave *chip);
-uint32_t tsc210x_txrx(void *opaque, uint32_t value, int len);
-void tsc210x_set_transform(uWireSlave *chip,
-                MouseTransformInfo *info);
-void tsc210x_key_event(uWireSlave *chip, int key, int down);
-
-/* tsc2005.c */
-void *tsc2005_init(qemu_irq pintdav);
-uint32_t tsc2005_txrx(void *opaque, uint32_t value, int len);
-void tsc2005_set_transform(void *opaque, MouseTransformInfo *info);
-
 #endif
diff --git a/include/hw/input/tsc2xxx.h b/include/hw/input/tsc2xxx.h
new file mode 100644
index 0000000000..f23f00cde9
--- /dev/null
+++ b/include/hw/input/tsc2xxx.h
@@ -0,0 +1,38 @@
+/*
+ * TI touchscreen controller
+ *
+ * Copyright (c) 2006 Andrzej Zaborowski
+ * Copyright (C) 2008 Nokia Corporation
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_INPUT_TSC2XXX_H
+#define HW_INPUT_TSC2XXX_H
+
+/* TI 4/8-wire resistive touch screen converters */
+
+#include "hw/irq.h"
+#include "ui/console.h"
+
+typedef struct uWireSlave {
+    uint16_t (*receive)(void *opaque);
+    void (*send)(void *opaque, uint16_t data);
+    void *opaque;
+} uWireSlave;
+
+/* tsc210x.c */
+uWireSlave *tsc2102_init(qemu_irq pint);
+uWireSlave *tsc2301_init(qemu_irq penirq, qemu_irq kbirq, qemu_irq dav);
+I2SCodec *tsc210x_codec(uWireSlave *chip);
+uint32_t tsc210x_txrx(void *opaque, uint32_t value, int len);
+void tsc210x_set_transform(uWireSlave *chip, MouseTransformInfo *info);
+void tsc210x_key_event(uWireSlave *chip, int key, int down);
+
+/* tsc2005.c */
+void *tsc2005_init(qemu_irq pintdav);
+uint32_t tsc2005_txrx(void *opaque, uint32_t value, int len);
+void tsc2005_set_transform(void *opaque, MouseTransformInfo *info);
+
+#endif
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 5d1a2d8329..4d2e3cfb86 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -98,7 +98,6 @@ typedef struct RAMBlock RAMBlock;
 typedef struct Range Range;
 typedef struct SHPCDevice SHPCDevice;
 typedef struct SSIBus SSIBus;
-typedef struct uWireSlave uWireSlave;
 typedef struct VirtIODevice VirtIODevice;
 typedef struct Visitor Visitor;
 typedef void SaveStateHandler(QEMUFile *f, void *opaque);
--=20
2.20.1

