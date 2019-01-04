Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp868335wrt;
        Fri, 4 Jan 2019 10:08:16 -0800 (PST)
X-Google-Smtp-Source: ALg8bN63nSsKXaitflwQlAb4aIIvy/QhUio68w4NdvPidAAfu5wWjDIXbMVxHtUdc1PeK2GDbAny
X-Received: by 2002:a37:d4d9:: with SMTP id s86mr48484462qks.190.1546625296744;
        Fri, 04 Jan 2019 10:08:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546625296; cv=none;
        d=google.com; s=arc-20160816;
        b=iKX8pS+S4DPwcLGXwN37BQ1fTRGFPcRKYIFPMNWJNDGyFILZSYarrHeUnz7vsewxKc
         f6/gf4HGcLUClVuXsbRM4K9d477/Xd2QCJcOxf6VDSJfgL8zQ10Y/E9kZ3Hr6yMwqaab
         SvhZwDiU8AcWzslFTvIzQbbyec9E3HRDBEduunw5z4qwerkcUXT8sAT8vJNO3OhRKi9/
         fyPB6n6zSHukJTWfaOd3hSIyVrPT7EjJmfiPcTIhHBYjQC68pD7Ko+y/PFMCNT50Rzpz
         z9xCOanXRNqDe8E3pbmcNuc7AMGhHjo7buyBiDVmNUuPh5c2GBfUobCffhpQN5QxLJLE
         +5wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=GJbD0aEg5r9g3o1H/6CZ1QUI3VDRkmZJp9oiAsUck0I=;
        b=cYuDfWWEV1M3/YTC0VR8iQLi2jP51ApdAQ8V3MkqipQPfCRHPZtSWaj/HqfycAD/3R
         MoacL1J77sMHiRq030JPh1e3oeSCqX6yte7zax7PEYbndlXQngIUg+dRQ7KaNal3eXqg
         tl7B7t1QLXDhFn9DhUlEd++zV+6ihWHtWO7EjAHZN9Hue0sHWkbZlbrKepemZK5pwXAt
         EhSGa0PmgJTpBJP58htwbXhS0mdL05FVIhYG5G7dO/3OXq6+HRXG2W2XpLQsD4KFF1Z7
         5hdXhTI4MGG22BXOwgbEAbImExfIcsUoqQEWVmaflhWgjdWHJcHytSyw3V0Hci3PFnAh
         CU0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id t23si1272120qtp.212.2019.01.04.10.08.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 10:08:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37789 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfTtI-00040u-4p
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 13:08:16 -0500
Received: from eggs.gnu.org ([208.118.235.92]:52374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTma-0004wK-0p
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 13:01:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTmW-0005G9-7P
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 13:01:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52974)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gfTmU-0005DR-9F; Fri, 04 Jan 2019 13:01:16 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0841C0669A7;
	Fri,  4 Jan 2019 18:01:12 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-119.brq.redhat.com [10.40.204.119])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D162E5D6A6;
	Fri,  4 Jan 2019 18:01:02 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Date: Fri,  4 Jan 2019 18:58:40 +0100
Message-Id: <20190104175847.6290-10-philmd@redhat.com>
In-Reply-To: <20190104175847.6290-1-philmd@redhat.com>
References: <20190104175847.6290-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 04 Jan 2019 18:01:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 09/16] hw/devices: Move TI touchscreen
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
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Joel Stanley <joel@jms.id.au>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9QS/VxZoHQCs

Since uWireSlave is only used in this new header, there is no
need to expose it via "qemu/typedefs.h".

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS                     |  2 ++
 hw/arm/nseries.c                |  2 +-
 hw/arm/palm.c                   |  2 +-
 hw/input/tsc2005.c              |  2 +-
 hw/input/tsc210x.c              |  4 ++--
 include/hw/arm/omap.h           |  6 +-----
 include/hw/devices.h            | 14 --------------
 include/hw/input/ti_uwire_tsc.h | 28 ++++++++++++++++++++++++++++
 include/qemu/typedefs.h         |  1 -
 9 files changed, 36 insertions(+), 25 deletions(-)
 create mode 100644 include/hw/input/ti_uwire_tsc.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 03872552ee..4722805d9e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -642,6 +642,7 @@ S: Odd Fixes
 F: hw/arm/nseries.c
 F: hw/input/tsc2*.c
 F: include/hw/display/blizzard.h
+F: include/hw/input/ti_uwire_tsc.h
 F: include/hw/misc/cbus.h
=20
 Palm
@@ -651,6 +652,7 @@ L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/palm.c
 F: hw/input/tsc2*.c
+F: include/hw/input/ti_uwire_tsc.h
=20
 Raspberry Pi
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index ac876b5878..f1c94ca607 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -30,8 +30,8 @@
 #include "ui/console.h"
 #include "hw/boards.h"
 #include "hw/i2c/i2c.h"
-#include "hw/devices.h"
 #include "hw/display/blizzard.h"
+#include "hw/input/ti_uwire_tsc.h"
 #include "hw/misc/cbus.h"
 #include "hw/block/flash.h"
 #include "hw/hw.h"
diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index 285f43709d..2327a25be3 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -26,7 +26,7 @@
 #include "hw/arm/omap.h"
 #include "hw/boards.h"
 #include "hw/arm/arm.h"
-#include "hw/devices.h"
+#include "hw/input/ti_uwire_tsc.h"
 #include "hw/loader.h"
 #include "exec/address-spaces.h"
 #include "cpu.h"
diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
index 2b9108a193..d3c79f7825 100644
--- a/hw/input/tsc2005.c
+++ b/hw/input/tsc2005.c
@@ -23,7 +23,7 @@
 #include "hw/hw.h"
 #include "qemu/timer.h"
 #include "ui/console.h"
-#include "hw/devices.h"
+#include "hw/input/ti_uwire_tsc.h"
 #include "trace.h"
=20
 #define TSC_CUT_RESOLUTION(value, p)	((value) >> (16 - (p ? 12 : 10)))
diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index 1cad57f644..8e4c282989 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -24,8 +24,8 @@
 #include "audio/audio.h"
 #include "qemu/timer.h"
 #include "ui/console.h"
-#include "hw/arm/omap.h"	/* For I2SCodec and uWireSlave */
-#include "hw/devices.h"
+#include "hw/arm/omap.h"            /* For I2SCodec */
+#include "hw/input/ti_uwire_tsc.h"
=20
 #define TSC_DATA_REGISTERS_PAGE		0x0
 #define TSC_CONTROL_REGISTERS_PAGE	0x1
diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index e7fbd340f3..fc0fe4f7a2 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -20,6 +20,7 @@
 #include "exec/memory.h"
 # define hw_omap_h		"omap.h"
 #include "hw/irq.h"
+#include "hw/input/ti_uwire_tsc.h"
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
index d9c06de7ab..ba9034050b 100644
--- a/include/hw/devices.h
+++ b/include/hw/devices.h
@@ -11,18 +11,4 @@ void smc91c111_init(NICInfo *, uint32_t, qemu_irq);
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
diff --git a/include/hw/input/ti_uwire_tsc.h b/include/hw/input/ti_uwire_=
tsc.h
new file mode 100644
index 0000000000..0f8f296bc3
--- /dev/null
+++ b/include/hw/input/ti_uwire_tsc.h
@@ -0,0 +1,28 @@
+#ifndef HW_INPUT_TI_UWIRE_TOUCHSCREEN_H
+#define HW_INPUT_TI_UWIRE_TOUCHSCREEN_H
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
index d59df20c4d..5d2b2925fb 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -111,7 +111,6 @@ typedef struct SerialState SerialState;
 typedef struct SHPCDevice SHPCDevice;
 typedef struct SMBusDevice SMBusDevice;
 typedef struct SSIBus SSIBus;
-typedef struct uWireSlave uWireSlave;
 typedef struct VirtIODevice VirtIODevice;
 typedef struct Visitor Visitor;
 typedef void SaveStateHandler(QEMUFile *f, void *opaque);
--=20
2.17.2

