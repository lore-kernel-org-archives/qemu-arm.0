Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp538314wrq;
        Fri, 22 Jun 2018 00:57:48 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJpq86LXRuEgl+oe+5LMPVvhIQ/PErWxffczB1krbYgS0Unq4QteYMb6PpccRAaKNzghrzV
X-Received: by 2002:a37:2c87:: with SMTP id s129-v6mr408251qkh.68.1529654268120;
        Fri, 22 Jun 2018 00:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529654268; cv=none;
        d=google.com; s=arc-20160816;
        b=BsQlBSvl2sYpJ5u2TApZYnxO9SF429m5/VjcdJlswOmhPXCBqEn6ddBLsw9Zf37+yd
         ls24j04koLfiX3py8IJc48tWjHExiKiPOmJTpLFICwkbR8ZQ/5bEhd2pnvt1kYxmi612
         Q0zJmk7p9FnUN7UF3JWfwNGvSw3dCf1AHsdh1cwLmatT1RjPBXcNBRLwjt0FJn//cKeM
         jOBOl/qaYwTWj4iKYtXO3Fso0UbbgBWPdobtcKOQ4blAT1fFH47Mp2qhvc1BQnTEdjTY
         kiox48mhR+geLcMefWOmDOJFXmU/GQrgkFXMGkDoIjlHpk0JWa2uf6R9EWqvEp3dk6WH
         B4HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=34DyYXW0OMTX3zqZBY14u3jCh4+OZFu005c8AinAO0Q=;
        b=NXcHmA8mVzg3LBJ8CIg/oX37OJggcTGmWSlOCWt1kBeG9+8dn4do2LxXX3f71QrpII
         a1dvbfi5zDjI0kRu1ZBpLEeqciUeLpSNkoIYTbhe5qwBSo1XMLIH14RpJuunpANZMqeo
         aAC0n4tgR0PBbh2lYshzbVRn/O7tIJlxjw2D5utfIYas12o8mRqKhS4kK1pFSX/eatFv
         9UVy3cL3zY/DO5s0u55ML0hd2puOvO9HTO43g4QIuHhRMapAOVHdKRU8xj6DxWyY0fnW
         OTuZ1GP8hdkWbF6U2/QQ9l2z7cU2C3YEthtPQDdYoMdiYxcXEMcISQYMuwk68kNaEujg
         bagA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u1-v6si162524qkd.91.2018.06.22.00.57.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 00:57:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59896 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWGx1-0006hi-Lh
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 03:57:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43104)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fWGwo-0006eW-JS
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 03:57:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fWGwl-0008VZ-GF
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 03:57:34 -0400
Received: from 8.mo178.mail-out.ovh.net ([46.105.74.227]:53639)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fWGwl-0008V1-9t
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 03:57:31 -0400
Received: from player168.ha.ovh.net (unknown [10.109.105.47])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id A6C6D1C118
	for <qemu-arm@nongnu.org>; Fri, 22 Jun 2018 09:57:29 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player168.ha.ovh.net (Postfix) with ESMTPSA id 5ED494200B0;
	Fri, 22 Jun 2018 09:57:23 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 22 Jun 2018 09:57:00 +0200
Message-Id: <20180622075700.5923-4-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180622075700.5923-1-clg@kaod.org>
References: <20180622075700.5923-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 12387432250061130560
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtiedrtdehgdduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.74.227
Subject: [Qemu-arm] [PATCH v2 3/3] aspeed/timer: use the APB frequency from
 the SCU
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
X-TUID: Lb4lVUNWxknU

The timer controller can be driven by either an external 1MHz clock or
by the APB clock. Today, the model makes the assumption that the APB
frequency is always set to 24MHz but this is incorrect.

The AST2400 SoC on the palmetto machines uses a 48MHz input clock
source and the APB can be set to 48MHz. The consequence is a general
system slowdown. The QEMU machines using the AST2500 SoC do not seem
impacted today because the APB frequency is still set to 24MHz.

We fix the timer frequency for all SoCs by linking the Timer model to
the SCU model. The APB frequency driving the timers is now the one
configured for the SoC.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
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

