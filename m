Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp154647wrq;
        Thu, 21 Jun 2018 15:40:39 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIUmuCCPhqO6NFU+/G8xnalk1tesRfjG3AmJWscmLEYhDG5R9OkalvcDRdHMq/HiRlSHl1g
X-Received: by 2002:a0c:f702:: with SMTP id w2-v6mr23616298qvn.166.1529620839906;
        Thu, 21 Jun 2018 15:40:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529620839; cv=none;
        d=google.com; s=arc-20160816;
        b=HCc8DhffKywJt0NS+DUW+uvq/ns5kiUeO0zEMJ0uAoPPU5bLw1E4ORMlFJ7k8iljva
         aEshZOX9qGlr44Waraz3kEgW9fiKtLGgDIEuROH7YHy+ke4eQeEmTp3/F7wou6gR9mkk
         tWASFyty85NDgxoUF18DvejQ9Pb4CDFYbuS5KI2awkIPPqrZWGc1oYO9iHO0Le82HD9F
         f58ukki3F/gsSgUJrqjfvjIhZ4EmPYyd+2Nezkp6IybI3Wxs0hO2H8Pmm4VezXwHxhA0
         AA2qb/qeSs8jLFUa8fwelQkrPRNtfGIwHcfaAj+xdEruzVaOTUwkH8digJsQC5BIlbx8
         F0Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=KZvhjv4fUcdea1TRfG2FXpGPU3KQ84VJUdub2xCo3/g=;
        b=urKheULns9eqSMD4faNyGs8+TnDs3Hn/oGwfmUH3MnIlrivzVti957Vkkpzm5NDhzV
         mTJz/lm2zgzRegSihVxpYJ2BsXwKNCq4PdCQXcuXiyv1VhEwGE2X3GfJ8NqGFFZtnoMq
         /BJ2c+2YzUSWwqq8xKWPW0OwSwz/AFHA0iFnBcHIK56U1HMdD+QCc86JdYGqy5Bm2mmf
         wGktuPhha0AdQv4Jw5MJs0Kq1E5lsMsfB2gBEMrP+hwAs+M65pSzwgEMXEnM6Xjp+t+q
         oq4S0zDbNhkadpNGjbGDvckuJY8gqPM3OsVR9gmig3ie6G8GJUwnLNT9mHKjq9l0h6Ak
         /70Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s7-v6si3770676qtn.23.2018.06.21.15.40.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 15:40:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57901 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fW8Fr-0000nB-B9
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 18:40:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fW8Fc-0000jy-EH
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 18:40:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fW8FZ-0001tw-4o
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 18:40:24 -0400
Received: from 12.mo4.mail-out.ovh.net ([178.33.104.253]:57473)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fW8FY-0001tZ-PA
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 18:40:21 -0400
Received: from player696.ha.ovh.net (unknown [10.109.108.22])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 30F34185993
	for <qemu-arm@nongnu.org>; Fri, 22 Jun 2018 00:40:19 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player696.ha.ovh.net (Postfix) with ESMTPSA id C6EA53C007E;
	Fri, 22 Jun 2018 00:40:12 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 22 Jun 2018 00:39:46 +0200
Message-Id: <20180621223946.20738-4-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180621223946.20738-1-clg@kaod.org>
References: <20180621223946.20738-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2977442306162002752
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtiedrtdehgdduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.104.253
Subject: [Qemu-arm] [PATCH 3/3] aspeed/timer: use the APB frequency from the
 SCU
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2KcSnhNdU2Zy

The timer controller can be driven by either an external 1MHz clock or
by the APB clock. Today, the model makes this assumption that the APB
frequency is 24MHz but this is incorrect on the AST2400 SoC. palmetto
machines use a 48MHz input clock source.

Use the SCU object to get the APB frequency and drive the timers with
the configured freq for the SoC.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/timer/aspeed_timer.h |  4 ++++
 hw/arm/aspeed_soc.c             |  2 ++
 hw/timer/aspeed_timer.c         | 19 +++++++++++++++----
 3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_ti=
mer.h
index bd6c1a7f9609..040a08873432 100644
--- a/include/hw/timer/aspeed_timer.h
+++ b/include/hw/timer/aspeed_timer.h
@@ -24,6 +24,8 @@
=20
 #include "qemu/timer.h"
=20
+typedef struct AspeedSCUState AspeedSCUState;
+
 #define ASPEED_TIMER(obj) \
     OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER);
 #define TYPE_ASPEED_TIMER "aspeed.timer"
@@ -55,6 +57,8 @@ typedef struct AspeedTimerCtrlState {
     uint32_t ctrl;
     uint32_t ctrl2;
     AspeedTimer timers[ASPEED_TIMER_NR_TIMERS];
+
+    AspeedSCUState *scu;
 } AspeedTimerCtrlState;
=20
 #endif /* ASPEED_TIMER_H */
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 7cc05ee27ea4..e68911af0f90 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -127,6 +127,8 @@ static void aspeed_soc_init(Object *obj)
=20
     object_initialize(&s->timerctrl, sizeof(s->timerctrl), TYPE_ASPEED_T=
IMER);
     object_property_add_child(obj, "timerctrl", OBJECT(&s->timerctrl), N=
ULL);
+    object_property_add_const_link(OBJECT(&s->timerctrl), "scu",
+                                   OBJECT(&s->scu), &error_abort);
     qdev_set_parent_bus(DEVICE(&s->timerctrl), sysbus_get_default());
=20
     object_initialize(&s->i2c, sizeof(s->i2c), TYPE_ASPEED_I2C);
diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 1e31e22b6f1f..5e3f51b66b43 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -10,8 +10,10 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "hw/timer/aspeed_timer.h"
+#include "hw/misc/aspeed_scu.h"
 #include "qemu-common.h"
 #include "qemu/bitops.h"
 #include "qemu/timer.h"
@@ -26,7 +28,6 @@
 #define TIMER_CLOCK_USE_EXT true
 #define TIMER_CLOCK_EXT_HZ 1000000
 #define TIMER_CLOCK_USE_APB false
-#define TIMER_CLOCK_APB_HZ 24000000
=20
 #define TIMER_REG_STATUS 0
 #define TIMER_REG_RELOAD 1
@@ -80,11 +81,11 @@ static inline bool timer_external_clock(AspeedTimer *=
t)
     return timer_ctrl_status(t, op_external_clock);
 }
=20
-static uint32_t clock_rates[] =3D { TIMER_CLOCK_APB_HZ, TIMER_CLOCK_EXT_=
HZ };
-
 static inline uint32_t calculate_rate(struct AspeedTimer *t)
 {
-    return clock_rates[timer_external_clock(t)];
+    AspeedTimerCtrlState *s =3D timer_to_ctrl(t);
+
+    return timer_external_clock(t) ? TIMER_CLOCK_EXT_HZ : s->scu->apb_fr=
eq;
 }
=20
 static inline uint32_t calculate_ticks(struct AspeedTimer *t, uint64_t n=
ow_ns)
@@ -449,6 +450,16 @@ static void aspeed_timer_realize(DeviceState *dev, E=
rror **errp)
     int i;
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
     AspeedTimerCtrlState *s =3D ASPEED_TIMER(dev);
+    Object *obj;
+    Error *err =3D NULL;
+
+    obj =3D object_property_get_link(OBJECT(dev), "scu", &err);
+    if (!obj) {
+        error_propagate(errp, err);
+        error_prepend(errp, "required link 'scu' not found: ");
+        return;
+    }
+    s->scu =3D ASPEED_SCU(obj);
=20
     for (i =3D 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
         aspeed_init_one_timer(s, i);
--=20
2.13.6

