Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp880161wrp;
        Wed, 25 Sep 2019 07:38:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQ/5XOBZwDh4I0tfBxXqlo+ngWjjGc5ADbi+icn6IjZC/+451til6c+HcCX/oVUSodsgsy
X-Received: by 2002:a05:6402:1e4:: with SMTP id i4mr3292901edy.31.1569422333062;
        Wed, 25 Sep 2019 07:38:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569422333; cv=none;
        d=google.com; s=arc-20160816;
        b=M6gdW9PGaIRauRT3r01EoLm1Z3++crvDN8BBK6HpDviM4YflgJyntfpLgPDs7M8Fzk
         dnvOpm4Y8Dk2dyJ4IpwzTbS4jGVEYYwDN1fgAZybMX97hOTUZXTT/5ERTupOya4wkPSl
         1IVR0GDrp1w+l4uZGs+xI7VC4LwSIrurepWdTOWMmpPunqVf44v/56HMIbkiwcA5FKop
         Zyl+E6Uo7jjq2elNbYU1Qr31oLt7om8qkA/AW6MLR9AnAIraOP/I8UN0OWjnCxL6r1l4
         6nhiaXJ+lfIPT8lQquE25/tMU3tHpDnfwnGljIPPgtdUhO6rydBOkYegaX7KgvFJGMhx
         HHeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=UOwJB+3hcrzm8kJDHM8z/tXlv1frmPad/0ujmvLg6hk=;
        b=igZvPGKbpTVJng64wOOdoHe2fqiO7kg6Trytb4RnwclipgFvctTLqJ5eTfgEZJ3DaN
         yZG3lH3M3bFz++0Qd1HulsByM6sB9OEWOB2VQm4fG3J0ovHhIobdsxDs2UgbLqH/HqW4
         SQ+7gFJrd+h83lVkPbm+R/Hkuas7ndP4//vl6wGOK34lXOUdDW+JwmAKTHH5zmBPqDlO
         Dml8c278pkY45TKetGunsf6aYKEgNuXwG4l1PEXCrrCyCpEaZfBAeHI45+os+y5BlPGh
         ewqthJYC3BXdKMFEbltJp9LJe0xVjoJR5gwFTF2a3kvtoX2CFvahF2gsBF9VyjS20ZAs
         lwUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d27si3656427ede.381.2019.09.25.07.38.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2019 07:38:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iD8RP-0000Tf-OL
	for alex.bennee@linaro.org; Wed, 25 Sep 2019 10:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52367)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iD8MO-0003VU-KB
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:33:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iD8MN-0000bB-8H
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:33:40 -0400
Received: from 4.mo1.mail-out.ovh.net ([46.105.76.26]:59472)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iD8MN-0000YQ-1h
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:33:39 -0400
Received: from player786.ha.ovh.net (unknown [10.109.146.137])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 50FF3191363
 for <qemu-arm@nongnu.org>; Wed, 25 Sep 2019 16:33:37 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id 57EF1A4D3C97;
 Wed, 25 Sep 2019 14:33:26 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 04/23] aspeed/timer: Introduce an object class per SoC
Date: Wed, 25 Sep 2019 16:32:29 +0200
Message-Id: <20190925143248.10000-5-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925143248.10000-1-clg@kaod.org>
References: <20190925143248.10000-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8844225243800242961
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.76.26
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c7SK9NaNOhFK

The most important changes will be on the register range 0x34 - 0x3C
memops. Introduce class read/write operations to handle the
differences between SoCs.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/timer/aspeed_timer.h |  15 +++++
 hw/arm/aspeed_soc.c             |   3 +-
 hw/timer/aspeed_timer.c         | 107 ++++++++++++++++++++++++++++----
 3 files changed, 113 insertions(+), 12 deletions(-)

diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_ti=
mer.h
index 1fb949e16710..a791fee276f4 100644
--- a/include/hw/timer/aspeed_timer.h
+++ b/include/hw/timer/aspeed_timer.h
@@ -28,6 +28,9 @@
 #define ASPEED_TIMER(obj) \
     OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER);
 #define TYPE_ASPEED_TIMER "aspeed.timer"
+#define TYPE_ASPEED_2400_TIMER TYPE_ASPEED_TIMER "-ast2400"
+#define TYPE_ASPEED_2500_TIMER TYPE_ASPEED_TIMER "-ast2500"
+
 #define ASPEED_TIMER_NR_TIMERS 8
=20
 typedef struct AspeedTimer {
@@ -60,4 +63,16 @@ typedef struct AspeedTimerCtrlState {
     AspeedSCUState *scu;
 } AspeedTimerCtrlState;
=20
+#define ASPEED_TIMER_CLASS(klass) \
+     OBJECT_CLASS_CHECK(AspeedTimerClass, (klass), TYPE_ASPEED_TIMER)
+#define ASPEED_TIMER_GET_CLASS(obj) \
+     OBJECT_GET_CLASS(AspeedTimerClass, (obj), TYPE_ASPEED_TIMER)
+
+typedef struct AspeedTimerClass {
+    SysBusDeviceClass parent_class;
+
+    uint64_t (*read)(AspeedTimerCtrlState *s, hwaddr offset);
+    void (*write)(AspeedTimerCtrlState *s, hwaddr offset, uint64_t value=
);
+} AspeedTimerClass;
+
 #endif /* ASPEED_TIMER_H */
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index c3821a562733..26e03486f9b7 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -182,8 +182,9 @@ static void aspeed_soc_init(Object *obj)
     sysbus_init_child_obj(obj, "rtc", OBJECT(&s->rtc), sizeof(s->rtc),
                           TYPE_ASPEED_RTC);
=20
+    snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
     sysbus_init_child_obj(obj, "timerctrl", OBJECT(&s->timerctrl),
-                          sizeof(s->timerctrl), TYPE_ASPEED_TIMER);
+                          sizeof(s->timerctrl), typename);
     object_property_add_const_link(OBJECT(&s->timerctrl), "scu",
                                    OBJECT(&s->scu), &error_abort);
=20
diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 2bda826882d9..c78bc1bd2d25 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -253,13 +253,8 @@ static uint64_t aspeed_timer_read(void *opaque, hwad=
dr offset, unsigned size)
     case 0x40 ... 0x8c: /* Timers 5 - 8 */
         value =3D aspeed_timer_get_value(&s->timers[(offset >> 4) - 1], =
reg);
         break;
-    /* Illegal */
-    case 0x38:
-    case 0x3C:
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx =
"\n",
-                __func__, offset);
-        value =3D 0;
+        value =3D ASPEED_TIMER_GET_CLASS(s)->read(s, offset);
         break;
     }
     trace_aspeed_timer_read(offset, size, value);
@@ -453,12 +448,8 @@ static void aspeed_timer_write(void *opaque, hwaddr =
offset, uint64_t value,
     case 0x40 ... 0x8c:
         aspeed_timer_set_value(s, (offset >> TIMER_NR_REGS) - 1, reg, tv=
);
         break;
-    /* Illegal */
-    case 0x38:
-    case 0x3C:
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx =
"\n",
-                __func__, offset);
+        ASPEED_TIMER_GET_CLASS(s)->write(s, offset, value);
         break;
     }
 }
@@ -472,6 +463,64 @@ static const MemoryRegionOps aspeed_timer_ops =3D {
     .valid.unaligned =3D false,
 };
=20
+static uint64_t aspeed_2400_timer_read(AspeedTimerCtrlState *s, hwaddr o=
ffset)
+{
+    uint64_t value;
+
+    switch (offset) {
+    case 0x38:
+    case 0x3C:
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx =
"\n",
+                __func__, offset);
+        value =3D 0;
+        break;
+    }
+    return value;
+}
+
+static void aspeed_2400_timer_write(AspeedTimerCtrlState *s, hwaddr offs=
et,
+                                    uint64_t value)
+{
+    switch (offset) {
+    case 0x38:
+    case 0x3C:
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx =
"\n",
+                __func__, offset);
+        break;
+    }
+}
+
+static uint64_t aspeed_2500_timer_read(AspeedTimerCtrlState *s, hwaddr o=
ffset)
+{
+    uint64_t value;
+
+    switch (offset) {
+    case 0x38:
+    case 0x3C:
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx =
"\n",
+                __func__, offset);
+        value =3D 0;
+        break;
+    }
+    return value;
+}
+
+static void aspeed_2500_timer_write(AspeedTimerCtrlState *s, hwaddr offs=
et,
+                                    uint64_t value)
+{
+    switch (offset) {
+    case 0x38:
+    case 0x3C:
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx =
"\n",
+                __func__, offset);
+        break;
+    }
+}
+
 static void aspeed_init_one_timer(AspeedTimerCtrlState *s, uint8_t id)
 {
     AspeedTimer *t =3D &s->timers[id];
@@ -570,11 +619,47 @@ static const TypeInfo aspeed_timer_info =3D {
     .parent =3D TYPE_SYS_BUS_DEVICE,
     .instance_size =3D sizeof(AspeedTimerCtrlState),
     .class_init =3D timer_class_init,
+    .class_size =3D sizeof(AspeedTimerClass),
+    .abstract   =3D true,
+};
+
+static void aspeed_2400_timer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedTimerClass *awc =3D ASPEED_TIMER_CLASS(klass);
+
+    dc->desc =3D "ASPEED 2400 Timer";
+    awc->read =3D aspeed_2400_timer_read;
+    awc->write =3D aspeed_2400_timer_write;
+}
+
+static const TypeInfo aspeed_2400_timer_info =3D {
+    .name =3D TYPE_ASPEED_2400_TIMER,
+    .parent =3D TYPE_ASPEED_TIMER,
+    .class_init =3D aspeed_2400_timer_class_init,
+};
+
+static void aspeed_2500_timer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedTimerClass *awc =3D ASPEED_TIMER_CLASS(klass);
+
+    dc->desc =3D "ASPEED 2500 Timer";
+    awc->read =3D aspeed_2500_timer_read;
+    awc->write =3D aspeed_2500_timer_write;
+}
+
+static const TypeInfo aspeed_2500_timer_info =3D {
+    .name =3D TYPE_ASPEED_2500_TIMER,
+    .parent =3D TYPE_ASPEED_TIMER,
+    .class_init =3D aspeed_2500_timer_class_init,
 };
=20
 static void aspeed_timer_register_types(void)
 {
     type_register_static(&aspeed_timer_info);
+    type_register_static(&aspeed_2400_timer_info);
+    type_register_static(&aspeed_2500_timer_info);
 }
=20
 type_init(aspeed_timer_register_types)
--=20
2.21.0

