Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp786449wrx;
        Fri, 12 Apr 2019 09:59:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwSI0Ejyo9Bz1srMX04IJTo90gtZ8YZIDgvGjRY6I88+T2fI5gqgo6RiSNRjmPTkZICckG0
X-Received: by 2002:a1c:dc43:: with SMTP id t64mr12602129wmg.19.1555088384045;
        Fri, 12 Apr 2019 09:59:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555088384; cv=none;
        d=google.com; s=arc-20160816;
        b=GCU+/FCgzBbi5E0w2lcbkIvOh80H6esAl6nN3f5nNU5aB2e3wNYqugLbMz+Fttq+jq
         WEEJlRQtksjBXKlIQAi3Vqc3NQxRfvxE4qz9oXXujuvfxPTXaUpVIQNOSTI8K9ARyBd8
         6kBMd4k3rLqGto9bj/Ufu2LaQ2U9bVpj74EC/anGf0LbTkExNJ9pV78uIVMNiEL8nNfO
         Yd/Js4igLTgi6C76dx16TIvbRxPsjxhs3tBwWnqzCCgid5/ktktU/73viRgkUNPBewbN
         gZ7Zr6uESxQefuuy+MipwIxQC7J2GW9KS2wUCiCxuQRACiIyj1g1eYDqYixy2WZ4/iWT
         Jkwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=eMnWuBSPOTN42kS+PlxL/GdVBDPmFqVbaBD+3Xqj69I=;
        b=Fh7W159jkEDy7OFBqMHcxoeYowSoVDCgPX+1hJAmJZ+2GnW13l9vMT5Hq9h8LTUjQK
         /YZYa1t8+xfNpuQ57ZDFLxiyqklqMB/1WKiNVw2VYqVt/0L9HTOMQyMkdoAKzI3owmiq
         mEhjAJiO7Eiu/0f5LdYswmdDkI8g1oYlMQj2vV7KRxqYI5gJXQL8rqctMgatZe4C493N
         O8EUhB7lfughSW34s1I6Qz9AU3kWjbj/RI29MPuEOgzvVBs+zpo660uX/QI5CzIcyhVB
         QwDwRP1BoxlfXYUj0neIhX+D9MiCkpt8pB89/DN84SVf341xIg00lhbVaU2PdTGqbpw3
         0hcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o4si27631779wrn.211.2019.04.12.09.59.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 09:59:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40104 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEzWh-0005An-1g
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 12:59:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzS4-0001CC-GJ
	for qemu-devel@nongnu.org; Fri, 12 Apr 2019 12:54:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzS2-0007US-HI
	for qemu-devel@nongnu.org; Fri, 12 Apr 2019 12:54:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34436)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hEzRy-0007JM-GZ; Fri, 12 Apr 2019 12:54:50 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A3C8308FBAF;
	Fri, 12 Apr 2019 16:54:49 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-66.brq.redhat.com [10.40.204.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1718160BEC;
	Fri, 12 Apr 2019 16:54:46 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Date: Fri, 12 Apr 2019 18:54:12 +0200
Message-Id: <20190412165416.7977-9-philmd@redhat.com>
In-Reply-To: <20190412165416.7977-1-philmd@redhat.com>
References: <20190412165416.7977-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 12 Apr 2019 16:54:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 08/12] hw/devices: Move TI touchscreen
 declarations into a new header
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fVLO3DQvEnFM

Since uWireSlave is only used in this new header, there is no
need to expose it via "qemu/typedefs.h".

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v3:
 Drop "TI 4/8-wire resistive touch screen converters" comment (Markus)
---
 MAINTAINERS                |  2 ++
 hw/arm/nseries.c           |  2 +-
 hw/arm/palm.c              |  2 +-
 hw/input/tsc2005.c         |  2 +-
 hw/input/tsc210x.c         |  4 ++--
 include/hw/arm/omap.h      |  6 +-----
 include/hw/devices.h       | 15 ---------------
 include/hw/input/tsc2xxx.h | 36 ++++++++++++++++++++++++++++++++++++
 include/qemu/typedefs.h    |  1 -
 9 files changed, 44 insertions(+), 26 deletions(-)
 create mode 100644 include/hw/input/tsc2xxx.h

diff --git a/MAINTAINERS b/MAINTAINERS
index e7c3d282a0a..b31260189ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -669,6 +669,7 @@ F: hw/input/tsc2005.c
 F: hw/misc/cbus.c
 F: hw/timer/twl92230.c
 F: include/hw/display/blizzard.h
+F: include/hw/input/tsc2xxx.h
 F: include/hw/misc/cbus.h
=20
 Palm
@@ -678,6 +679,7 @@ L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/palm.c
 F: hw/input/tsc210x.c
+F: include/hw/input/tsc2xxx.h
=20
 Raspberry Pi
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 6889f13d699..303f7a31e1c 100644
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
 #include "hw/misc/tmp105.h"
 #include "hw/block/flash.h"
diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index 285f43709dd..139d27d1cc0 100644
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
index 2b9108a1932..f82771e7a7c 100644
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
index 41731619bb6..f94cb4683bf 100644
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
index e7fbd340f37..9de867daa46 100644
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
index 7a630da47f7..ba9034050b4 100644
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
index 00000000000..dbfe5c55c1f
--- /dev/null
+++ b/include/hw/input/tsc2xxx.h
@@ -0,0 +1,36 @@
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
index e4a0a656d1c..fcdaae58c44 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -99,7 +99,6 @@ typedef struct RAMBlock RAMBlock;
 typedef struct Range Range;
 typedef struct SHPCDevice SHPCDevice;
 typedef struct SSIBus SSIBus;
-typedef struct uWireSlave uWireSlave;
 typedef struct VirtIODevice VirtIODevice;
 typedef struct Visitor Visitor;
 typedef void SaveStateHandler(QEMUFile *f, void *opaque);
--=20
2.20.1

