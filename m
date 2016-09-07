Received: by 10.25.87.130 with SMTP id l124csp308216lfb;
        Wed, 7 Sep 2016 06:23:35 -0700 (PDT)
X-Received: by 10.200.49.86 with SMTP id h22mr27350756qtb.44.1473254615365;
        Wed, 07 Sep 2016 06:23:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t80si25004232qka.41.2016.09.07.06.23.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Sep 2016 06:23:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40982 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhcpC-0001g9-Jw
	for alex.bennee@linaro.org; Wed, 07 Sep 2016 09:23:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcp6-0001cR-F6
	for qemu-arm@nongnu.org; Wed, 07 Sep 2016 09:23:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcp4-0005hr-AL
	for qemu-arm@nongnu.org; Wed, 07 Sep 2016 09:23:28 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:35791)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bhcox-0005eQ-0s; Wed, 07 Sep 2016 09:23:19 -0400
Received: by mail-lf0-x241.google.com with SMTP id s64so834204lfs.2;
	Wed, 07 Sep 2016 06:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=/6dH6bZcsgnPeD/jBoNvN/msp9NmGeGUjAQmH8dIhJo=;
	b=BHAsAB76ofxzA9ICIGk4583Zzns5LjsNxd+RSKlHUmmKrm/ob5ab271uAlesZ+nYjm
	+k+rjr5cT4ivsI7L91wqUlshYVZKsyOrgftEd/NDQn/ASvarEgzeSp9tCD5jaWx+bTKj
	nea3yBFFWP1zq7Oumv7tujLe1GBIe3Q0GeHqWoVPoBNTxZfZkGgrENNq7ouBAT3JZt3V
	MkERgfguHLFvXINK5hvWlXdM/GCA6w2yBZfJ9ZuJQJ1QcJ8r5p3d4eeofKkyDiQH6nfL
	hZbrLw2dkB9t3B3WbNVHc6n+dTpYdWKQns5y/5Jc9ix0f8pFsxbpT3k0OHpkUPnt0c6l
	Oreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=/6dH6bZcsgnPeD/jBoNvN/msp9NmGeGUjAQmH8dIhJo=;
	b=biqDykfibF2toVFhVBU4ZiXghvUTjpFcyX+enMVcgXq0uLQV0doxxoGwmPqSfCg2u3
	R/AAWpTdfxO0T6RVjY3SJAvMnh4StEh1gpZkUiYqZsEyYPHp78bfa18urPfDFetQerwf
	XqXS0F2CJAaxdzthP92XqPG3kYIXL+cWH3oFxJzU0cxhcEZJ7i9bcxqYX6N+JYbDfoxH
	/mg0jchN5rY7UkQiDErBj9udje4sbDRuutcjV++m3D5BVH+J+sgyFSWrkfy2B2PwyvYo
	9I9NRoqGuHokyVSlC3bARCE64yeCKgoO56YP1CK4BV7fNptzs9AZsghSxWm+tH996QZd
	+9Cg==
X-Gm-Message-State: AE9vXwM+ejSHgO3pjloGb0cVyeMPs+lNlQaokVmbs+aMBQGG4VGVfvQdo3T8V9r46iWVBA==
X-Received: by 10.25.18.204 with SMTP id 73mr21485lfs.186.1473254597645;
	Wed, 07 Sep 2016 06:23:17 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17])
	by smtp.gmail.com with ESMTPSA id h29sm11375lfi.18.2016.09.07.06.23.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Sep 2016 06:23:17 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Wed,  7 Sep 2016 16:22:13 +0300
Message-Id: <994cd608ec392da6e58f0643800dda595edb9d97.1473252818.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: [Qemu-arm] [PATCH v16 02/16] hw/ptimer: Introduce timer policy
 feature
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
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W5ZOQcJxoWNh

Some of the timer devices may behave differently from what ptimer
provides. Introduce ptimer policy feature that allows ptimer users to
change default and wrong timer behaviour, for example to continuously
trigger periodic timer when load value is equal to "0".

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/arm/musicpal.c            |  2 +-
 hw/core/ptimer.c             |  4 +++-
 hw/dma/xilinx_axidma.c       |  2 +-
 hw/m68k/mcf5206.c            |  2 +-
 hw/m68k/mcf5208.c            |  2 +-
 hw/net/fsl_etsec/etsec.c     |  2 +-
 hw/net/lan9118.c             |  2 +-
 hw/timer/allwinner-a10-pit.c |  2 +-
 hw/timer/arm_timer.c         |  2 +-
 hw/timer/digic-timer.c       |  2 +-
 hw/timer/etraxfs_timer.c     |  6 +++---
 hw/timer/exynos4210_mct.c    |  7 ++++---
 hw/timer/exynos4210_pwm.c    |  2 +-
 hw/timer/exynos4210_rtc.c    |  4 ++--
 hw/timer/grlib_gptimer.c     |  2 +-
 hw/timer/imx_epit.c          |  4 ++--
 hw/timer/imx_gpt.c           |  2 +-
 hw/timer/lm32_timer.c        |  2 +-
 hw/timer/milkymist-sysctl.c  |  4 ++--
 hw/timer/puv3_ost.c          |  2 +-
 hw/timer/sh_timer.c          |  2 +-
 hw/timer/slavio_timer.c      |  2 +-
 hw/timer/xilinx_timer.c      |  2 +-
 include/hw/ptimer.h          | 24 +++++++++++++++++++++++-
 24 files changed, 56 insertions(+), 31 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index cc50ace..7527037 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -837,7 +837,7 @@ static void mv88w8618_timer_init(SysBusDevice *dev, mv88w8618_timer_state *s,
     s->freq = freq;
 
     bh = qemu_bh_new(mv88w8618_timer_tick, s);
-    s->ptimer = ptimer_init(bh);
+    s->ptimer = ptimer_init(bh, PTIMER_POLICY_DEFAULT);
 }
 
 static uint64_t mv88w8618_pit_read(void *opaque, hwaddr offset,
diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 02c3135..00fdf15 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -21,6 +21,7 @@ struct ptimer_state
     int64_t period;
     int64_t last_event;
     int64_t next_event;
+    uint8_t policy_mask;
     QEMUBH *bh;
     QEMUTimer *timer;
 };
@@ -243,12 +244,13 @@ const VMStateDescription vmstate_ptimer = {
     }
 };
 
-ptimer_state *ptimer_init(QEMUBH *bh)
+ptimer_state *ptimer_init(QEMUBH *bh, uint8_t policy_mask)
 {
     ptimer_state *s;
 
     s = (ptimer_state *)g_malloc0(sizeof(ptimer_state));
     s->bh = bh;
     s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, ptimer_tick, s);
+    s->policy_mask = policy_mask;
     return s;
 }
diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index a4753e5..b135a5f 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -548,7 +548,7 @@ static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
 
         st->nr = i;
         st->bh = qemu_bh_new(timer_hit, st);
-        st->ptimer = ptimer_init(st->bh);
+        st->ptimer = ptimer_init(st->bh, PTIMER_POLICY_DEFAULT);
         ptimer_set_freq(st->ptimer, s->freqhz);
     }
     return;
diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index e14896e..b81901f 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -139,7 +139,7 @@ static m5206_timer_state *m5206_timer_init(qemu_irq irq)
 
     s = (m5206_timer_state *)g_malloc0(sizeof(m5206_timer_state));
     bh = qemu_bh_new(m5206_timer_trigger, s);
-    s->timer = ptimer_init(bh);
+    s->timer = ptimer_init(bh, PTIMER_POLICY_DEFAULT);
     s->irq = irq;
     m5206_timer_reset(s);
     return s;
diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index 2415557..9240ebf 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -183,7 +183,7 @@ static void mcf5208_sys_init(MemoryRegion *address_space, qemu_irq *pic)
     for (i = 0; i < 2; i++) {
         s = (m5208_timer_state *)g_malloc0(sizeof(m5208_timer_state));
         bh = qemu_bh_new(m5208_timer_trigger, s);
-        s->timer = ptimer_init(bh);
+        s->timer = ptimer_init(bh, PTIMER_POLICY_DEFAULT);
         memory_region_init_io(&s->iomem, NULL, &m5208_timer_ops, s,
                               "m5208-timer", 0x00004000);
         memory_region_add_subregion(address_space, 0xfc080000 + 0x4000 * i,
diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
index b5c777f..951c5f0 100644
--- a/hw/net/fsl_etsec/etsec.c
+++ b/hw/net/fsl_etsec/etsec.c
@@ -387,7 +387,7 @@ static void etsec_realize(DeviceState *dev, Error **errp)
 
 
     etsec->bh     = qemu_bh_new(etsec_timer_hit, etsec);
-    etsec->ptimer = ptimer_init(etsec->bh);
+    etsec->ptimer = ptimer_init(etsec->bh, PTIMER_POLICY_DEFAULT);
     ptimer_set_freq(etsec->ptimer, 100);
 }
 
diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index 4615d87..3db8937 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -1345,7 +1345,7 @@ static int lan9118_init1(SysBusDevice *sbd)
     s->txp = &s->tx_packet;
 
     bh = qemu_bh_new(lan9118_tick, s);
-    s->timer = ptimer_init(bh);
+    s->timer = ptimer_init(bh, PTIMER_POLICY_DEFAULT);
     ptimer_set_freq(s->timer, 10000);
     ptimer_set_limit(s->timer, 0xffff, 1);
 
diff --git a/hw/timer/allwinner-a10-pit.c b/hw/timer/allwinner-a10-pit.c
index 3385e5d..22ceabe 100644
--- a/hw/timer/allwinner-a10-pit.c
+++ b/hw/timer/allwinner-a10-pit.c
@@ -267,7 +267,7 @@ static void a10_pit_init(Object *obj)
         tc->container = s;
         tc->index = i;
         bh[i] = qemu_bh_new(a10_pit_timer_cb, tc);
-        s->timer[i] = ptimer_init(bh[i]);
+        s->timer[i] = ptimer_init(bh[i], PTIMER_POLICY_DEFAULT);
     }
 }
 
diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 111a16d..98fddd7 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -171,7 +171,7 @@ static arm_timer_state *arm_timer_init(uint32_t freq)
     s->control = TIMER_CTRL_IE;
 
     bh = qemu_bh_new(arm_timer_tick, s);
-    s->timer = ptimer_init(bh);
+    s->timer = ptimer_init(bh, PTIMER_POLICY_DEFAULT);
     vmstate_register(NULL, -1, &vmstate_arm_timer, s);
     return s;
 }
diff --git a/hw/timer/digic-timer.c b/hw/timer/digic-timer.c
index 0f21faf..e1fcf73 100644
--- a/hw/timer/digic-timer.c
+++ b/hw/timer/digic-timer.c
@@ -127,7 +127,7 @@ static void digic_timer_init(Object *obj)
 {
     DigicTimerState *s = DIGIC_TIMER(obj);
 
-    s->ptimer = ptimer_init(NULL);
+    s->ptimer = ptimer_init(NULL, PTIMER_POLICY_DEFAULT);
 
     /*
      * FIXME: there is no documentation on Digic timer
diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
index 36d8f46..8e18236 100644
--- a/hw/timer/etraxfs_timer.c
+++ b/hw/timer/etraxfs_timer.c
@@ -322,9 +322,9 @@ static int etraxfs_timer_init(SysBusDevice *dev)
     t->bh_t0 = qemu_bh_new(timer0_hit, t);
     t->bh_t1 = qemu_bh_new(timer1_hit, t);
     t->bh_wd = qemu_bh_new(watchdog_hit, t);
-    t->ptimer_t0 = ptimer_init(t->bh_t0);
-    t->ptimer_t1 = ptimer_init(t->bh_t1);
-    t->ptimer_wd = ptimer_init(t->bh_wd);
+    t->ptimer_t0 = ptimer_init(t->bh_t0, PTIMER_POLICY_DEFAULT);
+    t->ptimer_t1 = ptimer_init(t->bh_t1, PTIMER_POLICY_DEFAULT);
+    t->ptimer_wd = ptimer_init(t->bh_wd, PTIMER_POLICY_DEFAULT);
 
     sysbus_init_irq(dev, &t->irq);
     sysbus_init_irq(dev, &t->nmi);
diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index ae69345..0c18934 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -1431,15 +1431,16 @@ static void exynos4210_mct_init(Object *obj)
 
     /* Global timer */
     bh[0] = qemu_bh_new(exynos4210_gfrc_event, s);
-    s->g_timer.ptimer_frc = ptimer_init(bh[0]);
+    s->g_timer.ptimer_frc = ptimer_init(bh[0], PTIMER_POLICY_DEFAULT);
     memset(&s->g_timer.reg, 0, sizeof(struct gregs));
 
     /* Local timers */
     for (i = 0; i < 2; i++) {
         bh[0] = qemu_bh_new(exynos4210_ltick_event, &s->l_timer[i]);
         bh[1] = qemu_bh_new(exynos4210_lfrc_event, &s->l_timer[i]);
-        s->l_timer[i].tick_timer.ptimer_tick = ptimer_init(bh[0]);
-        s->l_timer[i].ptimer_frc = ptimer_init(bh[1]);
+        s->l_timer[i].tick_timer.ptimer_tick =
+                                   ptimer_init(bh[0], PTIMER_POLICY_DEFAULT);
+        s->l_timer[i].ptimer_frc = ptimer_init(bh[1], PTIMER_POLICY_DEFAULT);
         s->l_timer[i].id = i;
     }
 
diff --git a/hw/timer/exynos4210_pwm.c b/hw/timer/exynos4210_pwm.c
index 0e9e2e9..f576507 100644
--- a/hw/timer/exynos4210_pwm.c
+++ b/hw/timer/exynos4210_pwm.c
@@ -390,7 +390,7 @@ static void exynos4210_pwm_init(Object *obj)
     for (i = 0; i < EXYNOS4210_PWM_TIMERS_NUM; i++) {
         bh = qemu_bh_new(exynos4210_pwm_tick, &s->timer[i]);
         sysbus_init_irq(dev, &s->timer[i].irq);
-        s->timer[i].ptimer = ptimer_init(bh);
+        s->timer[i].ptimer = ptimer_init(bh, PTIMER_POLICY_DEFAULT);
         s->timer[i].id = i;
         s->timer[i].parent = s;
     }
diff --git a/hw/timer/exynos4210_rtc.c b/hw/timer/exynos4210_rtc.c
index da4dd45..1a648c5 100644
--- a/hw/timer/exynos4210_rtc.c
+++ b/hw/timer/exynos4210_rtc.c
@@ -555,12 +555,12 @@ static void exynos4210_rtc_init(Object *obj)
     QEMUBH *bh;
 
     bh = qemu_bh_new(exynos4210_rtc_tick, s);
-    s->ptimer = ptimer_init(bh);
+    s->ptimer = ptimer_init(bh, PTIMER_POLICY_DEFAULT);
     ptimer_set_freq(s->ptimer, RTC_BASE_FREQ);
     exynos4210_rtc_update_freq(s, 0);
 
     bh = qemu_bh_new(exynos4210_rtc_1Hz_tick, s);
-    s->ptimer_1Hz = ptimer_init(bh);
+    s->ptimer_1Hz = ptimer_init(bh, PTIMER_POLICY_DEFAULT);
     ptimer_set_freq(s->ptimer_1Hz, RTC_BASE_FREQ);
 
     sysbus_init_irq(dev, &s->alm_irq);
diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c
index dd000f5..712d1ae 100644
--- a/hw/timer/grlib_gptimer.c
+++ b/hw/timer/grlib_gptimer.c
@@ -363,7 +363,7 @@ static int grlib_gptimer_init(SysBusDevice *dev)
 
         timer->unit   = unit;
         timer->bh     = qemu_bh_new(grlib_gptimer_hit, timer);
-        timer->ptimer = ptimer_init(timer->bh);
+        timer->ptimer = ptimer_init(timer->bh, PTIMER_POLICY_DEFAULT);
         timer->id     = i;
 
         /* One IRQ line for each timer */
diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index eddf348..f34d7f7 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -314,10 +314,10 @@ static void imx_epit_realize(DeviceState *dev, Error **errp)
                           0x00001000);
     sysbus_init_mmio(sbd, &s->iomem);
 
-    s->timer_reload = ptimer_init(NULL);
+    s->timer_reload = ptimer_init(NULL, PTIMER_POLICY_DEFAULT);
 
     bh = qemu_bh_new(imx_epit_cmp, s);
-    s->timer_cmp = ptimer_init(bh);
+    s->timer_cmp = ptimer_init(bh, PTIMER_POLICY_DEFAULT);
 }
 
 static void imx_epit_class_init(ObjectClass *klass, void *data)
diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c
index 82bc73c..f034d65 100644
--- a/hw/timer/imx_gpt.c
+++ b/hw/timer/imx_gpt.c
@@ -461,7 +461,7 @@ static void imx_gpt_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->iomem);
 
     bh = qemu_bh_new(imx_gpt_timeout, s);
-    s->timer = ptimer_init(bh);
+    s->timer = ptimer_init(bh, PTIMER_POLICY_DEFAULT);
 }
 
 static void imx_gpt_class_init(ObjectClass *klass, void *data)
diff --git a/hw/timer/lm32_timer.c b/hw/timer/lm32_timer.c
index e45a65b..2a07b59 100644
--- a/hw/timer/lm32_timer.c
+++ b/hw/timer/lm32_timer.c
@@ -184,7 +184,7 @@ static void lm32_timer_init(Object *obj)
     sysbus_init_irq(dev, &s->irq);
 
     s->bh = qemu_bh_new(timer_hit, s);
-    s->ptimer = ptimer_init(s->bh);
+    s->ptimer = ptimer_init(s->bh, PTIMER_POLICY_DEFAULT);
 
     memory_region_init_io(&s->iomem, obj, &timer_ops, s,
                           "timer", R_MAX * 4);
diff --git a/hw/timer/milkymist-sysctl.c b/hw/timer/milkymist-sysctl.c
index 2194832..4488590 100644
--- a/hw/timer/milkymist-sysctl.c
+++ b/hw/timer/milkymist-sysctl.c
@@ -281,8 +281,8 @@ static void milkymist_sysctl_init(Object *obj)
 
     s->bh0 = qemu_bh_new(timer0_hit, s);
     s->bh1 = qemu_bh_new(timer1_hit, s);
-    s->ptimer0 = ptimer_init(s->bh0);
-    s->ptimer1 = ptimer_init(s->bh1);
+    s->ptimer0 = ptimer_init(s->bh0, PTIMER_POLICY_DEFAULT);
+    s->ptimer1 = ptimer_init(s->bh1, PTIMER_POLICY_DEFAULT);
 
     memory_region_init_io(&s->regs_region, obj, &sysctl_mmio_ops, s,
             "milkymist-sysctl", R_MAX * 4);
diff --git a/hw/timer/puv3_ost.c b/hw/timer/puv3_ost.c
index 93650b7..0b3d717 100644
--- a/hw/timer/puv3_ost.c
+++ b/hw/timer/puv3_ost.c
@@ -125,7 +125,7 @@ static int puv3_ost_init(SysBusDevice *dev)
     sysbus_init_irq(dev, &s->irq);
 
     s->bh = qemu_bh_new(puv3_ost_tick, s);
-    s->ptimer = ptimer_init(s->bh);
+    s->ptimer = ptimer_init(s->bh, PTIMER_POLICY_DEFAULT);
     ptimer_set_freq(s->ptimer, 50 * 1000 * 1000);
 
     memory_region_init_io(&s->iomem, OBJECT(s), &puv3_ost_ops, s, "puv3_ost",
diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index 255b2fc..9afb2d0 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -203,7 +203,7 @@ static void *sh_timer_init(uint32_t freq, int feat, qemu_irq irq)
     s->irq = irq;
 
     bh = qemu_bh_new(sh_timer_tick, s);
-    s->timer = ptimer_init(bh);
+    s->timer = ptimer_init(bh, PTIMER_POLICY_DEFAULT);
 
     sh_timer_write(s, OFFSET_TCOR >> 2, s->tcor);
     sh_timer_write(s, OFFSET_TCNT >> 2, s->tcnt);
diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
index fb3e08b..bfee1f3 100644
--- a/hw/timer/slavio_timer.c
+++ b/hw/timer/slavio_timer.c
@@ -389,7 +389,7 @@ static int slavio_timer_init1(SysBusDevice *dev)
         tc->timer_index = i;
 
         bh = qemu_bh_new(slavio_timer_irq, tc);
-        s->cputimer[i].timer = ptimer_init(bh);
+        s->cputimer[i].timer = ptimer_init(bh, PTIMER_POLICY_DEFAULT);
         ptimer_set_period(s->cputimer[i].timer, TIMER_PERIOD);
 
         size = i == 0 ? SYS_TIMER_SIZE : CPU_TIMER_SIZE;
diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
index 2ea970d..59439c0 100644
--- a/hw/timer/xilinx_timer.c
+++ b/hw/timer/xilinx_timer.c
@@ -218,7 +218,7 @@ static void xilinx_timer_realize(DeviceState *dev, Error **errp)
         xt->parent = t;
         xt->nr = i;
         xt->bh = qemu_bh_new(timer_hit, xt);
-        xt->ptimer = ptimer_init(xt->bh);
+        xt->ptimer = ptimer_init(xt->bh, PTIMER_POLICY_DEFAULT);
         ptimer_set_freq(xt->ptimer, t->freq_hz);
     }
 
diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index e397db5..7b0fc13 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -12,11 +12,33 @@
 #include "qemu/timer.h"
 #include "migration/vmstate.h"
 
+/* The default ptimer policy retains backward compatibility with the legacy
+ * timers. Custom policies are adjusting the default one. Consider providing
+ * a correct policy for your timer.
+ *
+ * The rough edges of the default policy:
+ *  - Starting to run with a period = 0 emits error message and stops the
+ *    timer without a trigger.
+ *
+ *  - Setting period to 0 of the running timer emits error message and
+ *    stops the timer without a trigger.
+ *
+ *  - Starting to run with counter = 0 or setting it to "0" while timer
+ *    is running causes a trigger and reloads counter with a limit value.
+ *    If limit = 0, ptimer emits error message and stops the timer.
+ *
+ *  - Counter value of the running timer is one less than the actual value.
+ *
+ *  - Changing period/frequency of the running timer loses time elapsed
+ *    since the last period, effectively restarting the timer with a
+ *    counter = counter value at the moment of change (.i.e. one less).  */
+#define PTIMER_POLICY_DEFAULT               0
+
 /* ptimer.c */
 typedef struct ptimer_state ptimer_state;
 typedef void (*ptimer_cb)(void *opaque);
 
-ptimer_state *ptimer_init(QEMUBH *bh);
+ptimer_state *ptimer_init(QEMUBH *bh, uint8_t policy_mask);
 void ptimer_set_period(ptimer_state *s, int64_t period);
 void ptimer_set_freq(ptimer_state *s, uint32_t freq);
 uint64_t ptimer_get_limit(ptimer_state *s);
-- 
2.9.3

