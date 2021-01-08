Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp750966lfq;
        Fri, 8 Jan 2021 11:12:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQ9noM3ImATDhVFwkN5kLuF6g3gbmk16oKOFgBca5wojJgRbVhH5zl7AogYYXUHAv1rez7
X-Received: by 2002:a25:7a44:: with SMTP id v65mr8022022ybc.0.1610133126964;
        Fri, 08 Jan 2021 11:12:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610133126; cv=none;
        d=google.com; s=arc-20160816;
        b=lhLYJlB9mJxKxiBJeEq22cgzoyht6Mq0PK6Hr/mHbliUahOKo+r7HseAPEhjVCdPIb
         gvGZCfx8MdTz9fIZUCDjfHNtseeYWBJYolYiT+zs6cBhzu19Gig7RongYTQ9GFWu2cmG
         +6Lsnut3CLIFlhopPXOo+lF2x5JwiYCrGEI3INVXKyM34yGmt2NZH7+dM13oboyufBN+
         wRFGbdxhfmdhGayVv6gLtKfRjmuDakJiyuprL0c35KI5FlyLyrV7Kp3KXibqyCjja5Sd
         /JI/2rD/QrxnfejtCazSZOk9BTprKIlZ7kdZf4eNoVk0D2b9gdrFWhxmF+s2oDZ2ajfz
         rDwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:to
         :subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=Fyb4FJea0+LttCueKhL0/bu+E731whPsjDvUt294ZsI=;
        b=s54cV4F3ZxUSlSEuV6YRRyDoYp0CVDn5AfWyP52juqecf+5f9kFmrECbkbqPChHxD1
         XN+4IsXAtuQ1YGwfOw7eeJwHC6Nb0OFljqtt6EMVm8EdnjfEHEgOMWyY75tyB4jrcNMz
         Kgwxd5wXfHVp9holwtLYuZNxMYaFLR3HfyCKBSgQWtqHBm3KnI0tQKzwlQEy16r+amga
         SJ4s92sWRmFxan9eYeVatk1KTIYKhCwzDnnb4MhDezLvQMYl9i6is4B6BM/p+mqaDwHp
         ZFtDxLneBjIGs8TH6cW3c0YfdaL3IuGsliLXA0PN4zlyw9BMGGns0UTtbilIoJIXIj3c
         IJOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=XUeJlklb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2si10343823ybl.203.2021.01.08.11.12.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 11:12:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=XUeJlklb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:47614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxxB8-0001yt-9i
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 14:12:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Ia74XwgKCGYaYLESXWLKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--wuhaotsh.bounces.google.com>)
 id 1kxx9h-00018i-PQ
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 14:10:38 -0500
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:46180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Ia74XwgKCGYaYLESXWLKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--wuhaotsh.bounces.google.com>)
 id 1kxx9a-0007KI-Uo
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 14:10:37 -0500
Received: by mail-pl1-x64a.google.com with SMTP id h23so6890231plr.13
 for <qemu-arm@nongnu.org>; Fri, 08 Jan 2021 11:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=Fyb4FJea0+LttCueKhL0/bu+E731whPsjDvUt294ZsI=;
 b=XUeJlklbrhpads4eo5ZJOIw0RJpZd2uIRkJfiT1KlT6w4v0CKncgBi6O2/3uuxqARX
 23H1j/O3mNS7aXJZLpvFe2G4MndiZlHrwCwS/k/feytAmLbkrFkU6EjAizvKtNPsHs+4
 /KGlDatcU14ZEyltzyQNmbU6SdPaNgejgl/1P6iFikr7IgsG8WQ2bkSO4SDR6wFxOMBA
 8bO7SCN4SOrU7bl0ds9pcT1+lcOcqt49YyLjYkr1lWUEkBe2uWlkjO15q4mV18dAc6uz
 wMgqf23/H/2I/z6zkbEZv1bXaOoQbNhY1AfnKwLRf1oanG4BCqJ94xcd/de1Nh25NCPx
 6dcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Fyb4FJea0+LttCueKhL0/bu+E731whPsjDvUt294ZsI=;
 b=oHFc3AY+ROCt956LIUb9qbwVHISbLzIC/95hXdW+cZlxnxCRnMup9+55gqYSs1iVkR
 5XgAir5DceCBgG7mV1AvH0DAW0AS5LeIitg0LJgxhMlLWox7leNjEkgQduP+rEQ098fQ
 jCfm18FjUrO8MEy/MHBQbsTg2n/lpo3wktib7SxK5j/oF0rJE1WLdHt8hZmCDUqRT8o2
 Se+pF7T0d0o5y3tl0Vys8LMe8YWKIK6+0dduMG+pEDjqLxrukfa/TUj6dn+dd7EYTxtQ
 WuiqZLm7a9yOtwCZXHOvLjfBTkSPLWKzoqqiZAY8WmQYcdF3ybvu91MtFxsIlo1OIZEQ
 0Epw==
X-Gm-Message-State: AOAM531JQxA9Z+yFZrHdlCdt6ytsOs/qSrr7Js2M7aTJeo+92eu7YlFr
 rBMYA5todSePsxdClRHX7WQoi5pOAGzToQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a62:1716:0:b029:19d:b78b:ef02 with SMTP
 id 22-20020a6217160000b029019db78bef02mr5030444pfx.11.1610133025893; Fri, 08
 Jan 2021 11:10:25 -0800 (PST)
Date: Fri,  8 Jan 2021 11:09:41 -0800
In-Reply-To: <20210108190945.949196-1-wuhaotsh@google.com>
Message-Id: <20210108190945.949196-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210108190945.949196-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH v5 2/6] hw/timer: Refactor NPCM7XX Timer to use CLK clock
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3Ia74XwgKCGYaYLESXWLKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: minyard@acm.org, venture@google.com, qemu-devel@nongnu.org,
 hskinnemoen@google.com, wuhaotsh@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-arm@nongnu.org>
X-TUID: nBdDrd838BjL

This patch makes NPCM7XX Timer to use a the timer clock generated by the
CLK module instead of the magic number TIMER_REF_HZ.

Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx.c                 |  5 ++++
 hw/timer/npcm7xx_timer.c         | 39 +++++++++++++++-----------------
 include/hw/misc/npcm7xx_clk.h    |  6 -----
 include/hw/timer/npcm7xx_timer.h |  1 +
 4 files changed, 24 insertions(+), 27 deletions(-)

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 47e2b6fc40..fabfb1697b 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -22,6 +22,7 @@
 #include "hw/char/serial.h"
 #include "hw/loader.h"
 #include "hw/misc/unimp.h"
+#include "hw/qdev-clock.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu/units.h"
@@ -420,6 +421,10 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
         int first_irq;
         int j;
 
+        /* Connect the timer clock. */
+        qdev_connect_clock_in(DEVICE(&s->tim[i]), "clock", qdev_get_clock_out(
+                    DEVICE(&s->clk), "timer-clock"));
+
         sysbus_realize(sbd, &error_abort);
         sysbus_mmio_map(sbd, 0, npcm7xx_tim_addr[i]);
 
diff --git a/hw/timer/npcm7xx_timer.c b/hw/timer/npcm7xx_timer.c
index d24445bd6e..36e2c07db2 100644
--- a/hw/timer/npcm7xx_timer.c
+++ b/hw/timer/npcm7xx_timer.c
@@ -17,8 +17,8 @@
 #include "qemu/osdep.h"
 
 #include "hw/irq.h"
+#include "hw/qdev-clock.h"
 #include "hw/qdev-properties.h"
-#include "hw/misc/npcm7xx_clk.h"
 #include "hw/timer/npcm7xx_timer.h"
 #include "migration/vmstate.h"
 #include "qemu/bitops.h"
@@ -128,23 +128,18 @@ static uint32_t npcm7xx_tcsr_prescaler(uint32_t tcsr)
 /* Convert a timer cycle count to a time interval in nanoseconds. */
 static int64_t npcm7xx_timer_count_to_ns(NPCM7xxTimer *t, uint32_t count)
 {
-    int64_t ns = count;
+    int64_t ticks = count;
 
-    ns *= NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ;
-    ns *= npcm7xx_tcsr_prescaler(t->tcsr);
+    ticks *= npcm7xx_tcsr_prescaler(t->tcsr);
 
-    return ns;
+    return clock_ticks_to_ns(t->ctrl->clock, ticks);
 }
 
 /* Convert a time interval in nanoseconds to a timer cycle count. */
 static uint32_t npcm7xx_timer_ns_to_count(NPCM7xxTimer *t, int64_t ns)
 {
-    int64_t count;
-
-    count = ns / (NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ);
-    count /= npcm7xx_tcsr_prescaler(t->tcsr);
-
-    return count;
+    return ns / clock_ticks_to_ns(t->ctrl->clock,
+                                  npcm7xx_tcsr_prescaler(t->tcsr));
 }
 
 static uint32_t npcm7xx_watchdog_timer_prescaler(const NPCM7xxWatchdogTimer *t)
@@ -166,8 +161,8 @@ static uint32_t npcm7xx_watchdog_timer_prescaler(const NPCM7xxWatchdogTimer *t)
 static void npcm7xx_watchdog_timer_reset_cycles(NPCM7xxWatchdogTimer *t,
         int64_t cycles)
 {
-    uint32_t prescaler = npcm7xx_watchdog_timer_prescaler(t);
-    int64_t ns = (NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ) * cycles;
+    int64_t ticks = cycles * npcm7xx_watchdog_timer_prescaler(t);
+    int64_t ns = clock_ticks_to_ns(t->ctrl->clock, ticks);
 
     /*
      * The reset function always clears the current timer. The caller of the
@@ -176,7 +171,6 @@ static void npcm7xx_watchdog_timer_reset_cycles(NPCM7xxWatchdogTimer *t,
      */
     npcm7xx_timer_clear(&t->base_timer);
 
-    ns *= prescaler;
     t->base_timer.remaining_ns = ns;
 }
 
@@ -606,10 +600,11 @@ static void npcm7xx_timer_hold_reset(Object *obj)
     qemu_irq_lower(s->watchdog_timer.irq);
 }
 
-static void npcm7xx_timer_realize(DeviceState *dev, Error **errp)
+static void npcm7xx_timer_init(Object *obj)
 {
-    NPCM7xxTimerCtrlState *s = NPCM7XX_TIMER(dev);
-    SysBusDevice *sbd = &s->parent;
+    NPCM7xxTimerCtrlState *s = NPCM7XX_TIMER(obj);
+    DeviceState *dev = DEVICE(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     int i;
     NPCM7xxWatchdogTimer *w;
 
@@ -627,11 +622,12 @@ static void npcm7xx_timer_realize(DeviceState *dev, Error **errp)
             npcm7xx_watchdog_timer_expired, w);
     sysbus_init_irq(sbd, &w->irq);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &npcm7xx_timer_ops, s,
+    memory_region_init_io(&s->iomem, obj, &npcm7xx_timer_ops, s,
                           TYPE_NPCM7XX_TIMER, 4 * KiB);
     sysbus_init_mmio(sbd, &s->iomem);
     qdev_init_gpio_out_named(dev, &w->reset_signal,
             NPCM7XX_WATCHDOG_RESET_GPIO_OUT, 1);
+    s->clock = qdev_init_clock_in(dev, "clock", NULL, NULL);
 }
 
 static const VMStateDescription vmstate_npcm7xx_base_timer = {
@@ -675,10 +671,11 @@ static const VMStateDescription vmstate_npcm7xx_watchdog_timer = {
 
 static const VMStateDescription vmstate_npcm7xx_timer_ctrl = {
     .name = "npcm7xx-timer-ctrl",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(tisr, NPCM7xxTimerCtrlState),
+        VMSTATE_CLOCK(clock, NPCM7xxTimerCtrlState),
         VMSTATE_STRUCT_ARRAY(timer, NPCM7xxTimerCtrlState,
                              NPCM7XX_TIMERS_PER_CTRL, 0, vmstate_npcm7xx_timer,
                              NPCM7xxTimer),
@@ -697,7 +694,6 @@ static void npcm7xx_timer_class_init(ObjectClass *klass, void *data)
     QEMU_BUILD_BUG_ON(NPCM7XX_TIMER_REGS_END > NPCM7XX_TIMER_NR_REGS);
 
     dc->desc = "NPCM7xx Timer Controller";
-    dc->realize = npcm7xx_timer_realize;
     dc->vmsd = &vmstate_npcm7xx_timer_ctrl;
     rc->phases.enter = npcm7xx_timer_enter_reset;
     rc->phases.hold = npcm7xx_timer_hold_reset;
@@ -708,6 +704,7 @@ static const TypeInfo npcm7xx_timer_info = {
     .parent             = TYPE_SYS_BUS_DEVICE,
     .instance_size      = sizeof(NPCM7xxTimerCtrlState),
     .class_init         = npcm7xx_timer_class_init,
+    .instance_init      = npcm7xx_timer_init,
 };
 
 static void npcm7xx_timer_register_type(void)
diff --git a/include/hw/misc/npcm7xx_clk.h b/include/hw/misc/npcm7xx_clk.h
index f641f95f3e..d5c8d16ca4 100644
--- a/include/hw/misc/npcm7xx_clk.h
+++ b/include/hw/misc/npcm7xx_clk.h
@@ -20,12 +20,6 @@
 #include "hw/clock.h"
 #include "hw/sysbus.h"
 
-/*
- * The reference clock frequency for the timer modules, and the SECCNT and
- * CNTR25M registers in this module, is always 25 MHz.
- */
-#define NPCM7XX_TIMER_REF_HZ            (25000000)
-
 /*
  * Number of registers in our device state structure. Don't change this without
  * incrementing the version_id in the vmstate.
diff --git a/include/hw/timer/npcm7xx_timer.h b/include/hw/timer/npcm7xx_timer.h
index 6993fd723a..d45c051b56 100644
--- a/include/hw/timer/npcm7xx_timer.h
+++ b/include/hw/timer/npcm7xx_timer.h
@@ -101,6 +101,7 @@ struct NPCM7xxTimerCtrlState {
 
     uint32_t    tisr;
 
+    Clock       *clock;
     NPCM7xxTimer timer[NPCM7XX_TIMERS_PER_CTRL];
     NPCM7xxWatchdogTimer watchdog_timer;
 };
-- 
2.29.2.729.g45daf8777d-goog

