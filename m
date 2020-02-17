Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4601187lfp;
        Sun, 16 Feb 2020 19:22:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqyy/8iPkb+LcuCKfpeqthmM+UiudAay4QxTvsOoOc/W4UtS9HNFhLJ/ItdFkqkwqF7a6hJP
X-Received: by 2002:a05:6214:161:: with SMTP id y1mr10632848qvs.132.1581909747028;
        Sun, 16 Feb 2020 19:22:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581909747; cv=none;
        d=google.com; s=arc-20160816;
        b=JJp90Ffk7TZ6nF+45/o0WpS/aA+SFsAprrcW0efkRwh+E/i2k1846iTlxTqt0LxYXA
         hPxEqgAYSwUq9AaFyl/Gog3kEpQy5Q7Of5t4K8xmgadF6clr07+UTKIzVWsn+32CH7Pv
         8YQOeK/HjrJaUZENZlyPoocKljsYp5gnLfMK2oICF4SeK+cy7Ji4KxTlPfZnAUN0YTK0
         QZcO4wVMLoX/mCmg7TZrcEZ7hXv1VkQHxFcQxMVXoBqayNvpkhQSrynVk33FtBDUkog1
         /2AwCTjWvxV0gS+dr5XaP+NpwaRm8TAcLBJuiLv6e15V1yoE9e3R1U4jqeEcmHkYr9W2
         dCBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=nzdaIrkN3Kx2t46tETLRIfSTCY9Y0J14IknTQoGsN1E=;
        b=vU5IFW+1TjpmMkA/xbKgZ17hAnp7utxAwAKfPjnCICsbmyBQMSgX/gaqTEiEdXy0fa
         FpeH3n7T5b2uhHlmtByvZNaaHcsJIHt8znptLMHYwNkAVshz9S37J2g70u50s54Ymt0Z
         o4S0O/fwPuTwqfLQw+N6vNNpU2u5JCHKe8kQIvshlIEqGIkAIz4kwbyDrm5ybFaboCQ8
         vSNbhoZrcSY9A2j0SqqQ1F+MuwHCh4GS+7PiOQ3zDRLtCzxXTxmYjmokRil3vCGrX9xQ
         TAlJuKZ5rrQI2sWfDErtwYlksUXfUqh5AEWS2jI4yHRbxNAbBm0I3M588vOn71kDMCmh
         wcJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si7273871qtw.135.2020.02.16.19.22.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Feb 2020 19:22:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3WzK-0005Sk-CZ
	for alex.bennee@linaro.org; Sun, 16 Feb 2020 22:22:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46537)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1j3Wz8-0005Jw-1a
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 22:22:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1j3Wz6-0003gk-HN
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 22:22:13 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2789 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1j3Wz5-0003WM-V5; Sun, 16 Feb 2020 22:22:12 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 0203EE595ABD767E3683;
 Mon, 17 Feb 2020 11:22:03 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Mon, 17 Feb 2020 11:21:57 +0800
From: <pannengyuan@huawei.com>
To: <balrogg@gmail.com>, <peter.maydell@linaro.org>,
 <mav2-rk.cave-ayland@ilande.co.uk>, <david@gibson.dropbear.id.au>,
 <edgar.iglesias@gmail.com>, <alistair@alistair23.me>
Subject: [PATCH v2 2/2] hw: move timer_new from init() into realize() to avoid
 memleaks
Date: Mon, 17 Feb 2020 11:21:27 +0800
Message-ID: <20200217032127.46508-3-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20200217032127.46508-1-pannengyuan@huawei.com>
References: <20200217032127.46508-1-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.173.221.136]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: zhang.zhanghailiang@huawei.com, Pan Nengyuan <pannengyuan@huawei.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 euler.robot@huawei.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 73YvSDXr3XNU

From: Pan Nengyuan <pannengyuan@huawei.com>

There are some memleaks when we call 'device_list_properties'. This patch=
 move timer_new from init into realize to fix it.
Meanwhile, do the null check in mos6522_reset() to avoid null deref if we=
 move timer_new into realize().

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Changes v2 to v1:
- Send this patch in a series instead of a single patch but with wrong su=
bject in v1.
---
 hw/arm/pxa2xx.c        | 17 +++++++++++------
 hw/arm/spitz.c         |  8 +++++++-
 hw/arm/strongarm.c     | 18 ++++++++++++------
 hw/misc/mos6522.c      | 14 ++++++++++++--
 hw/timer/cadence_ttc.c | 16 +++++++++++-----
 5 files changed, 53 insertions(+), 20 deletions(-)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index b33f8f1351..56a36202d7 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -1134,18 +1134,22 @@ static void pxa2xx_rtc_init(Object *obj)
     s->last_rtcpicr =3D 0;
     s->last_hz =3D s->last_sw =3D s->last_pi =3D qemu_clock_get_ms(rtc_c=
lock);
=20
+    sysbus_init_irq(dev, &s->rtc_irq);
+
+    memory_region_init_io(&s->iomem, obj, &pxa2xx_rtc_ops, s,
+                          "pxa2xx-rtc", 0x10000);
+    sysbus_init_mmio(dev, &s->iomem);
+}
+
+static void pxa2xx_rtc_realize(DeviceState *dev, Error **errp)
+{
+    PXA2xxRTCState *s =3D PXA2XX_RTC(dev);
     s->rtc_hz    =3D timer_new_ms(rtc_clock, pxa2xx_rtc_hz_tick,    s);
     s->rtc_rdal1 =3D timer_new_ms(rtc_clock, pxa2xx_rtc_rdal1_tick, s);
     s->rtc_rdal2 =3D timer_new_ms(rtc_clock, pxa2xx_rtc_rdal2_tick, s);
     s->rtc_swal1 =3D timer_new_ms(rtc_clock, pxa2xx_rtc_swal1_tick, s);
     s->rtc_swal2 =3D timer_new_ms(rtc_clock, pxa2xx_rtc_swal2_tick, s);
     s->rtc_pi    =3D timer_new_ms(rtc_clock, pxa2xx_rtc_pi_tick,    s);
-
-    sysbus_init_irq(dev, &s->rtc_irq);
-
-    memory_region_init_io(&s->iomem, obj, &pxa2xx_rtc_ops, s,
-                          "pxa2xx-rtc", 0x10000);
-    sysbus_init_mmio(dev, &s->iomem);
 }
=20
 static int pxa2xx_rtc_pre_save(void *opaque)
@@ -1203,6 +1207,7 @@ static void pxa2xx_rtc_sysbus_class_init(ObjectClas=
s *klass, void *data)
=20
     dc->desc =3D "PXA2xx RTC Controller";
     dc->vmsd =3D &vmstate_pxa2xx_rtc_regs;
+    dc->realize =3D pxa2xx_rtc_realize;
 }
=20
 static const TypeInfo pxa2xx_rtc_sysbus_info =3D {
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index e001088103..cbfa6934cf 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -524,11 +524,16 @@ static void spitz_keyboard_init(Object *obj)
=20
     spitz_keyboard_pre_map(s);
=20
-    s->kbdtimer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, spitz_keyboard_tick=
, s);
     qdev_init_gpio_in(dev, spitz_keyboard_strobe, SPITZ_KEY_STROBE_NUM);
     qdev_init_gpio_out(dev, s->sense, SPITZ_KEY_SENSE_NUM);
 }
=20
+static void spitz_keyboard_realize(DeviceState *dev, Error **errp)
+{
+    SpitzKeyboardState *s =3D SPITZ_KEYBOARD(dev);
+    s->kbdtimer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, spitz_keyboard_tick=
, s);
+}
+
 /* LCD backlight controller */
=20
 #define LCDTG_RESCTL	0x00
@@ -1115,6 +1120,7 @@ static void spitz_keyboard_class_init(ObjectClass *=
klass, void *data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
     dc->vmsd =3D &vmstate_spitz_kbd;
+    dc->realize =3D spitz_keyboard_realize;
 }
=20
 static const TypeInfo spitz_keyboard_info =3D {
diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index cd8a99aaf2..3010d765bb 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -399,9 +399,6 @@ static void strongarm_rtc_init(Object *obj)
     s->last_rcnr =3D (uint32_t) mktimegm(&tm);
     s->last_hz =3D qemu_clock_get_ms(rtc_clock);
=20
-    s->rtc_alarm =3D timer_new_ms(rtc_clock, strongarm_rtc_alarm_tick, s=
);
-    s->rtc_hz =3D timer_new_ms(rtc_clock, strongarm_rtc_hz_tick, s);
-
     sysbus_init_irq(dev, &s->rtc_irq);
     sysbus_init_irq(dev, &s->rtc_hz_irq);
=20
@@ -410,6 +407,13 @@ static void strongarm_rtc_init(Object *obj)
     sysbus_init_mmio(dev, &s->iomem);
 }
=20
+static void strongarm_rtc_realize(DeviceState *dev, Error **errp)
+{
+    StrongARMRTCState *s =3D STRONGARM_RTC(dev);
+    s->rtc_alarm =3D timer_new_ms(rtc_clock, strongarm_rtc_alarm_tick, s=
);
+    s->rtc_hz =3D timer_new_ms(rtc_clock, strongarm_rtc_hz_tick, s);
+}
+
 static int strongarm_rtc_pre_save(void *opaque)
 {
     StrongARMRTCState *s =3D opaque;
@@ -451,6 +455,7 @@ static void strongarm_rtc_sysbus_class_init(ObjectCla=
ss *klass, void *data)
=20
     dc->desc =3D "StrongARM RTC Controller";
     dc->vmsd =3D &vmstate_strongarm_rtc_regs;
+    dc->realize =3D strongarm_rtc_realize;
 }
=20
 static const TypeInfo strongarm_rtc_sysbus_info =3D {
@@ -1240,15 +1245,16 @@ static void strongarm_uart_init(Object *obj)
                           "uart", 0x10000);
     sysbus_init_mmio(dev, &s->iomem);
     sysbus_init_irq(dev, &s->irq);
-
-    s->rx_timeout_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, strongarm_u=
art_rx_to, s);
-    s->tx_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, strongarm_uart_tx, =
s);
 }
=20
 static void strongarm_uart_realize(DeviceState *dev, Error **errp)
 {
     StrongARMUARTState *s =3D STRONGARM_UART(dev);
=20
+    s->rx_timeout_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                       strongarm_uart_rx_to,
+                                       s);
+    s->tx_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, strongarm_uart_tx, =
s);
     qemu_chr_fe_set_handlers(&s->chr,
                              strongarm_uart_can_receive,
                              strongarm_uart_receive,
diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 19e154b870..980eda7599 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -465,11 +465,15 @@ static void mos6522_reset(DeviceState *dev)
     s->timers[0].frequency =3D s->frequency;
     s->timers[0].latch =3D 0xffff;
     set_counter(s, &s->timers[0], 0xffff);
-    timer_del(s->timers[0].timer);
+    if (s->timers[0].timer) {
+        timer_del(s->timers[0].timer);
+    }
=20
     s->timers[1].frequency =3D s->frequency;
     s->timers[1].latch =3D 0xffff;
-    timer_del(s->timers[1].timer);
+    if (s->timers[1].timer) {
+        timer_del(s->timers[1].timer);
+    }
 }
=20
 static void mos6522_init(Object *obj)
@@ -485,6 +489,11 @@ static void mos6522_init(Object *obj)
     for (i =3D 0; i < ARRAY_SIZE(s->timers); i++) {
         s->timers[i].index =3D i;
     }
+}
+
+static void mos6522_realize(DeviceState *dev, Error **errp)
+{
+    MOS6522State *s =3D MOS6522(dev);
=20
     s->timers[0].timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, mos6522_time=
r1, s);
     s->timers[1].timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, mos6522_time=
r2, s);
@@ -502,6 +511,7 @@ static void mos6522_class_init(ObjectClass *oc, void =
*data)
=20
     dc->reset =3D mos6522_reset;
     dc->vmsd =3D &vmstate_mos6522;
+    dc->realize =3D mos6522_realize;
     device_class_set_props(dc, mos6522_properties);
     mdc->parent_reset =3D dc->reset;
     mdc->set_sr_int =3D mos6522_set_sr_int;
diff --git a/hw/timer/cadence_ttc.c b/hw/timer/cadence_ttc.c
index 5e3128c1e3..b0ba6b2bba 100644
--- a/hw/timer/cadence_ttc.c
+++ b/hw/timer/cadence_ttc.c
@@ -412,16 +412,21 @@ static void cadence_timer_init(uint32_t freq, Caden=
ceTimerState *s)
 static void cadence_ttc_init(Object *obj)
 {
     CadenceTTCState *s =3D CADENCE_TTC(obj);
+
+    memory_region_init_io(&s->iomem, obj, &cadence_ttc_ops, s,
+                          "timer", 0x1000);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
+}
+
+static void cadence_ttc_realize(DeviceState *dev, Error **errp)
+{
+    CadenceTTCState *s =3D CADENCE_TTC(dev);
     int i;
=20
     for (i =3D 0; i < 3; ++i) {
         cadence_timer_init(133000000, &s->timer[i]);
-        sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->timer[i].irq);
+        sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->timer[i].irq);
     }
-
-    memory_region_init_io(&s->iomem, obj, &cadence_ttc_ops, s,
-                          "timer", 0x1000);
-    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
 }
=20
 static int cadence_timer_pre_save(void *opaque)
@@ -479,6 +484,7 @@ static void cadence_ttc_class_init(ObjectClass *klass=
, void *data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
     dc->vmsd =3D &vmstate_cadence_ttc;
+    dc->realize =3D cadence_ttc_realize;
 }
=20
 static const TypeInfo cadence_ttc_info =3D {
--=20
2.21.0.windows.1


