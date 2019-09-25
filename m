Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp885467wrp;
        Wed, 25 Sep 2019 07:43:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwWJCbCsj55KVHIVHz4MjHkEy/g20h8dO7PEnjNnhX2XqGCqeJjRrWRAn8WuwgRMB6C+V1j
X-Received: by 2002:aed:3903:: with SMTP id l3mr9242576qte.165.1569422616847;
        Wed, 25 Sep 2019 07:43:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569422616; cv=none;
        d=google.com; s=arc-20160816;
        b=zYzvHw2Iocp3RaN/Eqyy6z8M0TACmfX41YdKAZ9SnYTTY/KEu3pJcg4M0oajwoE7rW
         TVoQLZOqPNnPpeVwt/jv6hEHXJHIrqYi74od3L/aNA8Mis8LfGhCjcNPy/G+EO1f2ICo
         8oLWEzsVT8S34SL/dWqGVfcfpS4CIJBs2FQUF6qoXFUEt2dQFjXQlmlOwoS6zrP8P/8M
         RVZ4Ed8ebj/tOYNoNUqa8XlmCdjfT9H0GsoCNhhYM7frgZ5UmTRnA//JhOH+kccOe08E
         /Q21MaANuINAGSCIuDVWOT+iEI+r3u5DdQaOHUv1hCLLMlPXs7rNq0JAAnhUYLUFi80Z
         IzlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=RuTeZND8RQDEx+AviTRbUkXBTqVu1HY0N8a1zXZ8Cxw=;
        b=gbh+6LOKRlEN0vIqxnpNuI9qkXJqu2MjB50isA56YxJ+qhScFlMZ8MWaXGPIuOAhDS
         rFnWZ8cZgDkdj4QlmSI/DnY0Vn7Mhq9lIzY9IvUaAP/kUTVjYQ4JBy3ruzQgBpIiHPK2
         bUGvUP/ACj61dppOEwpzVf4qhbtJw65ZcTPCqwPmUEyw0yIrV3cQytsHfDWRr7O+2gMi
         b9ZCOtGYx/c3JCfzqXapeoucGDUignrkZCTrBCu7U6jKdEaNbfB6hbuizR/5+f9MjjlG
         40KAHvLCohKmtC9DUu38bP1wRXf5a2/ofe0qC2Wtuu6JxRq1vtRG/oxQmabcRTWp5r04
         rdUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t64si4196267qkb.328.2019.09.25.07.43.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2019 07:43:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iD8W0-0004zX-5U
	for alex.bennee@linaro.org; Wed, 25 Sep 2019 10:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52474)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iD8Mf-0003l4-WE
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:34:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iD8Md-0000rw-GA
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:33:56 -0400
Received: from 3.mo179.mail-out.ovh.net ([178.33.251.175]:39808)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iD8Md-0000rM-8t
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:33:55 -0400
Received: from player786.ha.ovh.net (unknown [10.109.159.139])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id D9CED142F67
 for <qemu-arm@nongnu.org>; Wed, 25 Sep 2019 16:33:53 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id 05A9CA4D3DE8;
 Wed, 25 Sep 2019 14:33:46 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 07/23] aspeed/timer: Add support for IRQ status register on
 the AST2600
Date: Wed, 25 Sep 2019 16:32:32 +0200
Message-Id: <20190925143248.10000-8-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925143248.10000-1-clg@kaod.org>
References: <20190925143248.10000-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8849854743962880785
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.33.251.175
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
X-TUID: cyIoju8WdBeM

The AST2600 timer replaces control register 2 with a interrupt status
register. It is set by hardware when an IRQ occurs and cleared by
software.

Modify the vmstate version to take into account the new fields.

Based on previous work from Joel Stanley.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/timer/aspeed_timer.h |  1 +
 hw/timer/aspeed_timer.c         | 36 +++++++++++++++++++++++++--------
 2 files changed, 29 insertions(+), 8 deletions(-)

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
index 7f73d0c75337..bcce2192a92a 100644
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
@@ -644,12 +663,13 @@ static const VMStateDescription vmstate_aspeed_time=
r =3D {
=20
 static const VMStateDescription vmstate_aspeed_timer_state =3D {
     .name =3D "aspeed.timerctrl",
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
+    .version_id =3D 2,
+    .minimum_version_id =3D 2,
     .fields =3D (VMStateField[]) {
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

