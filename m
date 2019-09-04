Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp29038wrp;
        Wed, 4 Sep 2019 14:43:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx7MoqMEnFq4NRitRiTS9NEHsFQK4XVF1bpqdeyBDn5PHRPo7vHcWDKilQfZ2qd/i2ysuYA
X-Received: by 2002:a17:906:2ac3:: with SMTP id m3mr179137eje.212.1567633439796;
        Wed, 04 Sep 2019 14:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567633439; cv=none;
        d=google.com; s=arc-20160816;
        b=hDz+5IIF6yChzzo6KyNTeczk8v6Ombqe5wDyrHirZ83zIcDol0FyuM+MQNY1cfvjaF
         qcoQ0niwZsnNQW9aovnEsLwJbgQ0HFEAk1GoFL6s8ItmuKSHhnmpjP4yjfpUTt4TcdO4
         PH52iY9RJHoXsM+W/E0ceE7ZTSQRiz0/rKR9L8IoDtNTmcyHseRQZus4pppoHKUin9n3
         m0ZDvIoo7WL3V+0OZOPbk8guQVn0+hEOdFCmjUwO88bXFqGhMSP71nRoeVZy/dyBSDIq
         dGHfsvPCBxG4wC43EAFsDq2wskI3qgyusOowEW6GW0/IRart8pHKLEXpVeYBluxeOYUg
         L4/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=EI7xaN9I+u16ilCKXW1A5jVYOy9VpKRXgYyotyIjhAU=;
        b=Kz0aUiGzsfjc+Y58t6DwFPr/Lljlz1C7n5JVMQSUhjPGM/khvxhma3qEU3j5z50GTz
         YO7a+ngbY4K0ueEBt/2gsqu2GW30MN3z88fJ92kjB9c/1zU3RZH1UzEcLImKKDChYi7P
         +F4YrszeqbEawEKtS8CSbaiX+nzJP+CWTyZtFYfSvjVdjeoI3+731PBZmkXQef+D7fMs
         bem/WU0H1BWxYVeBOcaCn9gmsKtHLb1l9m01ha66SYkIAp2GU2YKNTjoMlNyHTtOG/hi
         A/Zmv4VUWD7POdcdy6OM7yiR44BanIUXvRhCF5wgzurEVUzk12aEzXeG8Ojs8Y888BUm
         /IfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o24si152002ejb.296.2019.09.04.14.43.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 14:43:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5d4I-0003Tt-BQ
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 17:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53417)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1i5cBw-0000Er-W4
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 16:47:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1i5cBv-0001DS-Ip
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 16:47:48 -0400
Received: from 9.mo6.mail-out.ovh.net ([87.98.171.146]:39197)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1i5cBv-0001Ay-C9
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 16:47:47 -0400
Received: from player691.ha.ovh.net (unknown [10.108.35.95])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 886B91DEB2D
 for <qemu-arm@nongnu.org>; Wed,  4 Sep 2019 22:47:45 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id 1555398B282E;
 Wed,  4 Sep 2019 20:47:39 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed,  4 Sep 2019 22:46:49 +0200
Message-Id: <20190904204659.13878-6-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190904204659.13878-1-clg@kaod.org>
References: <20190904204659.13878-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2517793669831625489
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudejhedgudehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.171.146
Subject: [Qemu-arm] [RFC PATCH 05/15] aspeed/timer: Add support for IRQ
 status register on the AST2600
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
X-TUID: 4mRsJA/xvMd4

The AST2600 timer replaces control register 2 with a interrupt status
register. It is set by hardware when an IRQ occurs and cleared by
software.

Based on previous work from Joel Stanley.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/timer/aspeed_timer.h |  1 +
 hw/timer/aspeed_timer.c         | 32 ++++++++++++++++++++++++++------
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_ti=
mer.h
index 69b1377af01e..948329893c0b 100644
--- a/include/hw/timer/aspeed_timer.h
+++ b/include/hw/timer/aspeed_timer.h
@@ -60,6 +60,7 @@ typedef struct AspeedTimerCtrlState {
     uint32_t ctrl;
     uint32_t ctrl2;
     uint32_t ctrl3;
+    uint32_t irq_sts;
     AspeedTimer timers[ASPEED_TIMER_NR_TIMERS];
=20
     AspeedSCUState *scu;
diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 7f73d0c75337..dbf8143f0457 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -160,7 +160,9 @@ static uint64_t calculate_next(struct AspeedTimer *t)
     timer_del(&t->timer);
=20
     if (timer_overflow_interrupt(t)) {
+        AspeedTimerCtrlState *s =3D timer_to_ctrl(t);
         t->level =3D !t->level;
+        s->irq_sts |=3D BIT(t->id);
         qemu_set_irq(t->irq, t->level);
     }
=20
@@ -199,7 +201,9 @@ static void aspeed_timer_expire(void *opaque)
     }
=20
     if (interrupt) {
+        AspeedTimerCtrlState *s =3D timer_to_ctrl(t);
         t->level =3D !t->level;
+        s->irq_sts |=3D BIT(t->id);
         qemu_set_irq(t->irq, t->level);
     }
=20
@@ -244,9 +248,6 @@ static uint64_t aspeed_timer_read(void *opaque, hwadd=
r offset, unsigned size)
     case 0x30: /* Control Register */
         value =3D s->ctrl;
         break;
-    case 0x34: /* Control Register 2 */
-        value =3D s->ctrl2;
-        break;
     case 0x00 ... 0x2c: /* Timers 1 - 4 */
         value =3D aspeed_timer_get_value(&s->timers[(offset >> 4)], reg)=
;
         break;
@@ -438,9 +439,6 @@ static void aspeed_timer_write(void *opaque, hwaddr o=
ffset, uint64_t value,
     case 0x30:
         aspeed_timer_set_ctrl(s, tv);
         break;
-    case 0x34:
-        aspeed_timer_set_ctrl2(s, tv);
-        break;
     /* Timer Registers */
     case 0x00 ... 0x2c:
         aspeed_timer_set_value(s, (offset >> TIMER_NR_REGS), reg, tv);
@@ -468,6 +466,9 @@ static uint64_t aspeed_2400_timer_read(AspeedTimerCtr=
lState *s, hwaddr offset)
     uint64_t value;
=20
     switch (offset) {
+    case 0x34:
+        value =3D s->ctrl2;
+        break;
     case 0x38:
     case 0x3C:
     default:
@@ -482,7 +483,12 @@ static uint64_t aspeed_2400_timer_read(AspeedTimerCt=
rlState *s, hwaddr offset)
 static void aspeed_2400_timer_write(AspeedTimerCtrlState *s, hwaddr offs=
et,
                                     uint64_t value)
 {
+    const uint32_t tv =3D (uint32_t)(value & 0xFFFFFFFF);
+
     switch (offset) {
+    case 0x34:
+        aspeed_timer_set_ctrl2(s, tv);
+        break;
     case 0x38:
     case 0x3C:
     default:
@@ -497,6 +503,9 @@ static uint64_t aspeed_2500_timer_read(AspeedTimerCtr=
lState *s, hwaddr offset)
     uint64_t value;
=20
     switch (offset) {
+    case 0x34:
+        value =3D s->ctrl2;
+        break;
     case 0x38:
         value =3D s->ctrl3 & BIT(0);
         break;
@@ -517,6 +526,9 @@ static void aspeed_2500_timer_write(AspeedTimerCtrlSt=
ate *s, hwaddr offset,
     uint8_t command;
=20
     switch (offset) {
+    case 0x34:
+        aspeed_timer_set_ctrl2(s, tv);
+        break;
     case 0x38:
         command =3D (value >> 1) & 0xFF;
         if (command =3D=3D 0xAE) {
@@ -543,6 +555,9 @@ static uint64_t aspeed_2600_timer_read(AspeedTimerCtr=
lState *s, hwaddr offset)
     uint64_t value;
=20
     switch (offset) {
+    case 0x34:
+        value =3D s->irq_sts;
+        break;
     case 0x38:
     case 0x3C:
     default:
@@ -560,6 +575,9 @@ static void aspeed_2600_timer_write(AspeedTimerCtrlSt=
ate *s, hwaddr offset,
     const uint32_t tv =3D (uint32_t)(value & 0xFFFFFFFF);
=20
     switch (offset) {
+    case 0x34:
+        s->irq_sts &=3D tv;
+        break;
     case 0x3C:
         aspeed_timer_set_ctrl(s, s->ctrl & ~tv);
         break;
@@ -626,6 +644,7 @@ static void aspeed_timer_reset(DeviceState *dev)
     s->ctrl =3D 0;
     s->ctrl2 =3D 0;
     s->ctrl3 =3D 0;
+    s->irq_sts =3D 0;
 }
=20
 static const VMStateDescription vmstate_aspeed_timer =3D {
@@ -650,6 +669,7 @@ static const VMStateDescription vmstate_aspeed_timer_=
state =3D {
         VMSTATE_UINT32(ctrl, AspeedTimerCtrlState),
         VMSTATE_UINT32(ctrl2, AspeedTimerCtrlState),
         VMSTATE_UINT32(ctrl3, AspeedTimerCtrlState),
+        VMSTATE_UINT32(irq_sts, AspeedTimerCtrlState),
         VMSTATE_STRUCT_ARRAY(timers, AspeedTimerCtrlState,
                              ASPEED_TIMER_NR_TIMERS, 1, vmstate_aspeed_t=
imer,
                              AspeedTimer),
--=20
2.21.0

