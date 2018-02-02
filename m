Received: by 10.28.71.27 with SMTP id u27csp866931wma;
        Fri, 2 Feb 2018 07:41:55 -0800 (PST)
X-Google-Smtp-Source: AH8x226vshUNWgcnyi30bNPwXhk23yOJkheeCzf3q/a7ZBHQ4UZPsJIXFbchxtZuVvgGNm0Xd/+y
X-Received: by 10.129.129.69 with SMTP id r66mr27642722ywf.24.1517586115569;
        Fri, 02 Feb 2018 07:41:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517586115; cv=none;
        d=google.com; s=arc-20160816;
        b=Jtblz+q1Hj5XRYIRzzP3lemO1T24Gxs5M7Ragy0QsXnKNNBeoTzuNz1mdNiKHPZRZm
         8ItmW3ep+dpLOdv/5OSeadfUdyNZ1QvpaKTHBkIgp7up5iW7WRisuDjjqztsdAHAvLCu
         DJqFAE57GjAMl8qqBep1cbChfqHt2f8denm6MuKZru4ceRGpSWkEgUZGhZEGfkRYy3LM
         rXwLXfCZ1L5titvmAaSKXNCX1nflqqxOVA1QJ8sF3ZCEYiMh/GMirh88tNzJ2Kd6kZHy
         8HkXmFa6ug55SH9ptdWXHgDafP/brKAQPMCd6FDTkntYIR4SF6u4ULAilaAE/y72QP5/
         cjew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=k8+toYzm6jxKOGG/aC8WmIztvGz99G9c+fJ74ZUt0uE=;
        b=TovYQMC/ILNa58Zqp2HGVYzwf4ZokCVIa7Pug+cuRDgYsuMuTSJDNQfXzVa68Xjgym
         hBD/wTyXjPJp6Rozqa5wdHxg7n/ZhtG66P6nh6Cj6ZTOXiybS95GAfNAfjKW6OwUO2xx
         TyxsJ/QRHZyXR+sMrOwYfTgdmHwSUEhX6ot1DNFlffxoHJCksk7SVDGv24t+IocpOx66
         cemwsY/T22fZ5c2yP/tag8oKFssnN8XVVVVCmy/Yjur3C2IJUtB4FQFdWUUavhxGl0Dr
         /UumaJQ4OFEwtMxMnRfpCe8avNKwOk2z3PISkn5ZJdOR9XzAH+46rju0ME+hTjmqGejC
         ua+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s185si463829ybf.713.2018.02.02.07.41.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Feb 2018 07:41:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37009 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ehdTO-0000ch-Ud
	for alex.bennee@linaro.org; Fri, 02 Feb 2018 10:41:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1ehcox-0006Ts-2V
	for qemu-arm@nongnu.org; Fri, 02 Feb 2018 10:00:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1ehcot-0003Mh-4g
	for qemu-arm@nongnu.org; Fri, 02 Feb 2018 10:00:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59742)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1ehcos-0003M7-SH; Fri, 02 Feb 2018 10:00:03 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 99C26C0587C4;
	Fri,  2 Feb 2018 07:50:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-227.ams2.redhat.com
	[10.36.116.227])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C5E9619E9;
	Fri,  2 Feb 2018 07:50:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id C628231FFF; Fri,  2 Feb 2018 08:50:09 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  2 Feb 2018 08:50:08 +0100
Message-Id: <20180202075009.11653-2-kraxel@redhat.com>
In-Reply-To: <20180202075009.11653-1-kraxel@redhat.com>
References: <20180202075009.11653-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 02 Feb 2018 07:50:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 1/2] hw/audio/wm8750: move WM8750 declarations
 from i2c/i2c.h to audio/wm8750.h
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"open list:Musicpal" <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	Gerd Hoffmann <kraxel@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bH/KiuTHJFte

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

while here use TYPE_WM8750 and declare a data_req_cb() typedef.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-id: 20170919123053.32675-1-f4bug@amsat.org
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/audio/wm8750.h  | 30 ++++++++++++++++++++++++++++++
 include/hw/i2c/i2c.h       |  9 ---------
 hw/arm/musicpal.c          |  3 ++-
 hw/arm/spitz.c             |  3 ++-
 hw/arm/z2.c                |  3 ++-
 hw/audio/marvell_88w8618.c |  1 +
 hw/audio/wm8750.c          |  6 ++----
 7 files changed, 39 insertions(+), 16 deletions(-)
 create mode 100644 include/hw/audio/wm8750.h

diff --git a/include/hw/audio/wm8750.h b/include/hw/audio/wm8750.h
new file mode 100644
index 0000000000..84e7a119bb
--- /dev/null
+++ b/include/hw/audio/wm8750.h
@@ -0,0 +1,30 @@
+/*
+ * This program is free software; you can redistribute it and/or modify =
it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOU=
T
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License alo=
ng with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef HW_DAC_WM8750_H
+#define HW_DAC_WM8750_H
+
+#include "hw/hw.h"
+
+#define TYPE_WM8750 "wm8750"
+
+typedef void data_req_cb(void *opaque, int free_out, int free_in);
+
+void wm8750_data_req_set(DeviceState *dev, data_req_cb *data_req, void *=
opaque);
+void wm8750_dac_dat(void *opaque, uint32_t sample);
+uint32_t wm8750_adc_dat(void *opaque);
+void *wm8750_dac_buffer(void *opaque, int samples);
+void wm8750_dac_commit(void *opaque);
+void wm8750_set_bclk_in(void *opaque, int new_hz);
+
+#endif
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 2ce611d4c8..24e95d0155 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -70,15 +70,6 @@ int i2c_recv(I2CBus *bus);
=20
 DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t add=
r);
=20
-/* wm8750.c */
-void wm8750_data_req_set(DeviceState *dev,
-                void (*data_req)(void *, int, int), void *opaque);
-void wm8750_dac_dat(void *opaque, uint32_t sample);
-uint32_t wm8750_adc_dat(void *opaque);
-void *wm8750_dac_buffer(void *opaque, int samples);
-void wm8750_dac_commit(void *opaque);
-void wm8750_set_bclk_in(void *opaque, int new_hz);
-
 /* lm832x.c */
 void lm832x_key_event(DeviceState *dev, int key, int state);
=20
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index b648770882..4172caf5db 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -25,6 +25,7 @@
 #include "hw/block/flash.h"
 #include "ui/console.h"
 #include "hw/i2c/i2c.h"
+#include "hw/audio/wm8750.h"
 #include "sysemu/block-backend.h"
 #include "exec/address-spaces.h"
 #include "ui/pixel_ops.h"
@@ -1691,7 +1692,7 @@ static void musicpal_init(MachineState *machine)
         qdev_connect_gpio_out(key_dev, i, qdev_get_gpio_in(dev, i + 15))=
;
     }
=20
-    wm8750_dev =3D i2c_create_slave(i2c, "wm8750", MP_WM_ADDR);
+    wm8750_dev =3D i2c_create_slave(i2c, TYPE_WM8750, MP_WM_ADDR);
     dev =3D qdev_create(NULL, "mv88w8618_audio");
     s =3D SYS_BUS_DEVICE(dev);
     qdev_prop_set_ptr(dev, "wm8750", wm8750_dev);
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index ac1e15cbbc..e419e3c00e 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -24,6 +24,7 @@
 #include "hw/devices.h"
 #include "hw/arm/sharpsl.h"
 #include "ui/console.h"
+#include "hw/audio/wm8750.h"
 #include "audio/audio.h"
 #include "hw/boards.h"
 #include "sysemu/block-backend.h"
@@ -745,7 +746,7 @@ static void spitz_i2c_setup(PXA2xxState *cpu)
     DeviceState *wm;
=20
     /* Attach a WM8750 to the bus */
-    wm =3D i2c_create_slave(bus, "wm8750", 0);
+    wm =3D i2c_create_slave(bus, TYPE_WM8750, 0);
=20
     spitz_wm8750_addr(wm, 0, 0);
     qdev_connect_gpio_out(cpu->gpio, SPITZ_GPIO_WM,
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 60561c7b7c..300e933c82 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -23,6 +23,7 @@
 #include "hw/block/flash.h"
 #include "sysemu/block-backend.h"
 #include "ui/console.h"
+#include "hw/audio/wm8750.h"
 #include "audio/audio.h"
 #include "exec/address-spaces.h"
 #include "sysemu/qtest.h"
@@ -346,7 +347,7 @@ static void z2_init(MachineState *machine)
     z2_lcd =3D ssi_create_slave(mpu->ssp[1], "zipit-lcd");
     bus =3D pxa2xx_i2c_bus(mpu->i2c[0]);
     i2c_create_slave(bus, TYPE_AER915, 0x55);
-    wm =3D i2c_create_slave(bus, "wm8750", 0x1b);
+    wm =3D i2c_create_slave(bus, TYPE_WM8750, 0x1b);
     mpu->i2s->opaque =3D wm;
     mpu->i2s->codec_out =3D wm8750_dac_dat;
     mpu->i2s->codec_in =3D wm8750_adc_dat;
diff --git a/hw/audio/marvell_88w8618.c b/hw/audio/marvell_88w8618.c
index 4f65f8c199..e546892d3c 100644
--- a/hw/audio/marvell_88w8618.c
+++ b/hw/audio/marvell_88w8618.c
@@ -13,6 +13,7 @@
 #include "hw/sysbus.h"
 #include "hw/hw.h"
 #include "hw/i2c/i2c.h"
+#include "hw/audio/wm8750.h"
 #include "audio/audio.h"
=20
 #define MP_AUDIO_SIZE           0x00001000
diff --git a/hw/audio/wm8750.c b/hw/audio/wm8750.c
index 6d8b728923..416a78e869 100644
--- a/hw/audio/wm8750.c
+++ b/hw/audio/wm8750.c
@@ -8,8 +8,8 @@
  */
=20
 #include "qemu/osdep.h"
-#include "hw/hw.h"
 #include "hw/i2c/i2c.h"
+#include "hw/audio/wm8750.h"
 #include "audio/audio.h"
=20
 #define IN_PORT_N	3
@@ -24,7 +24,6 @@ typedef struct {
     int dac_hz;
 } WMRate;
=20
-#define TYPE_WM8750 "wm8750"
 #define WM8750(obj) OBJECT_CHECK(WM8750State, (obj), TYPE_WM8750)
=20
 typedef struct WM8750State {
@@ -639,8 +638,7 @@ static void wm8750_fini(I2CSlave *i2c)
 }
 #endif
=20
-void wm8750_data_req_set(DeviceState *dev,
-                void (*data_req)(void *, int, int), void *opaque)
+void wm8750_data_req_set(DeviceState *dev, data_req_cb *data_req, void *=
opaque)
 {
     WM8750State *s =3D WM8750(dev);
=20
--=20
2.9.3

