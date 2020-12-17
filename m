Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp824951lfq;
        Wed, 16 Dec 2020 16:46:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvN56Ry0tv3slaiTLfU5hjQRiOdEAMIPcqxwZ4oc3WI5ePJri7lNM/wt56JsNCKURRG6PX
X-Received: by 2002:a25:6145:: with SMTP id v66mr38192311ybb.146.1608165967497;
        Wed, 16 Dec 2020 16:46:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608165967; cv=none;
        d=google.com; s=arc-20160816;
        b=Y3LXzocaqwMIbsovVTlGx6lHRSvm9IJiM0VZFyspj0BvEY1nBqDVUodIq86h8o/1XA
         Po/nEHd071ic2rVC0BP4eRCzVbbVzrWz7I4TsF3M62ZgbtXVEuQ0kJTJJDNh5BT7bmqQ
         ke3xMmu3CX0uxk3YaZO8deP8X/RbDX8A/Nv1k9ePn0UWteFgYfS46EZG9LFW7Py1wK5T
         yRTMT807BeA1urCBykuMG9Lskj+3zD12Y0GZeZW2H0BBd8Rwtto6LRWLGk5A/vVuFw9U
         Cn98M9WLwfDNjY1JgG3sypWrRWZiW/ykjmAfXlApV/CWj6AgsnUub2POhCvTfpHYhtoe
         U+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:to
         :subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=BerKlRaUjvE8GrggZOrBCgmaVCo9sQ4NKu7h8iibDbM=;
        b=qdiNqsSAGal9Vi+GkNsj8GFUSwwGfYF6jZWxBOJ2Ekcb3gMND8uNcJQ0sKPzmSXhKx
         qtCmVOuo9gnn946d+q3A4/KHlksn/ph1gkZoflak2wxWMIObD2+C065xg1RKaDYStpVW
         T1mt576IcUMEoDeBlI+7oK6waQnFap8axuB0MAlEhupzXcGZl/Ywtdw5tksunJUyFTna
         Yb2I81CAkH6g5aIO3oXBZjYIv74cLqMpNCetkSyUyawVkP0RzMSCLSkeZwyBs78pYgHe
         rJqPX4z2fug+H7+w7SOZXpKn6ubhyQzvJ5W3zVwWlhj2gYpasymZ384bQCSRO0R3SV7v
         zjDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=QrfJyQz0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2si2854742ybm.261.2020.12.16.16.46.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Dec 2020 16:46:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=QrfJyQz0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:35194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kphQk-0006Br-SI
	for alex.bennee@linaro.org; Wed, 16 Dec 2020 19:46:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3KKraXwgKCOsjhUNbgfUTbbTYR.PbZdRZh-NeZabaTah.beT@flex--wuhaotsh.bounces.google.com>)
 id 1kphQI-0006Aj-AZ
 for qemu-arm@nongnu.org; Wed, 16 Dec 2020 19:45:38 -0500
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a]:43530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3KKraXwgKCOsjhUNbgfUTbbTYR.PbZdRZh-NeZabaTah.beT@flex--wuhaotsh.bounces.google.com>)
 id 1kphQA-0006q9-LJ
 for qemu-arm@nongnu.org; Wed, 16 Dec 2020 19:45:38 -0500
Received: by mail-pf1-x44a.google.com with SMTP id v138so17341536pfc.10
 for <qemu-arm@nongnu.org>; Wed, 16 Dec 2020 16:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=BerKlRaUjvE8GrggZOrBCgmaVCo9sQ4NKu7h8iibDbM=;
 b=QrfJyQz0J5oTkylcjKOn0gdi4OQiYIYJaL/2Kn7W2X6G5y/xrQgM4fByMmIHJvEsuI
 i7s83EkhsJXc/20mq63Bc+G3flAJBF2wKRuc8/yG1Znzfp/XtuBMaxlAywA7EunZ/2be
 /6E1bO9MDFnJtlF5zN8NZdrHGj2uNkvSG8RkXxMMjAihwXLjN9cm5l76AFfa+fFOBoSE
 lThwNNBKg1XqQvIturYHvkm83QxOzxRpszVN2kUxi30BitM/zu2GfjHotZn5vx99Y0wc
 r1qEzPd88pdHdRb8B4BcLFfv2+gnGN2k+aLeRTxohY4GvQelQqQ2PP4+pIr99k8sNVbd
 cynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=BerKlRaUjvE8GrggZOrBCgmaVCo9sQ4NKu7h8iibDbM=;
 b=tgUDazKsWOVbVi5jDVPGRUOOpOJNNiZ6Oz2AWnofD/pfW9/KZTSZgDAU9sPF58t4RA
 2I0qxstYi1G/7h9MGv8J3hPyw/tYEAY69wcPim6KtURJKpubthqHNci0LYEBVY5v33Q8
 Zuf7Y5XIMiAItANdyaXEvm8utdy/yHpcINDDWZq3lzU3po6ajpt2A8nq0Bk6oSgjU0RE
 e2I6G72Y4C180Lz9Mzh8L8M/t9P/XQf9gYBiLq3PIgX6bDYIoWyuOUCHQwJb+xVZAma/
 m5qk3YEudeF44478SgVehMBrd7gYJJoxU0Aofikm2KaeswBYY9+ZoSROE+NR3+7DCOSD
 CO2Q==
X-Gm-Message-State: AOAM532BTxcLQJMhK9m81lIAkXH7ijkWx6R/il8WtD1/K+DkUBgfVybH
 7EV06eUWRxeoL9DvlROXQGMUmLbqIyFdHg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:3ee3:: with SMTP id
 k90mr5295745pjc.164.1608165928021; Wed, 16 Dec 2020 16:45:28 -0800 (PST)
Date: Wed, 16 Dec 2020 16:43:45 -0800
In-Reply-To: <20201217004349.3740927-1-wuhaotsh@google.com>
Message-Id: <20201217004349.3740927-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20201217004349.3740927-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH v4 2/6] hw/timer: Refactor NPCM7XX Timer to use CLK clock
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3KKraXwgKCOsjhUNbgfUTbbTYR.PbZdRZh-NeZabaTah.beT@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: xGR8byDeVw6D

This patch makes NPCM7XX Timer to use a the timer clock generated by the
CLK module instead of the magic number TIMER_REF_HZ.

Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx.c                 |  5 +++++
 hw/timer/npcm7xx_timer.c         | 25 ++++++++++++++-----------
 include/hw/misc/npcm7xx_clk.h    |  6 ------
 include/hw/timer/npcm7xx_timer.h |  1 +
 4 files changed, 20 insertions(+), 17 deletions(-)

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
index d24445bd6e..6e990d611a 100644
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
@@ -130,7 +130,7 @@ static int64_t npcm7xx_timer_count_to_ns(NPCM7xxTimer *t, uint32_t count)
 {
     int64_t ns = count;
 
-    ns *= NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ;
+    ns *= clock_get_ns(t->ctrl->clock);
     ns *= npcm7xx_tcsr_prescaler(t->tcsr);
 
     return ns;
@@ -141,7 +141,7 @@ static uint32_t npcm7xx_timer_ns_to_count(NPCM7xxTimer *t, int64_t ns)
 {
     int64_t count;
 
-    count = ns / (NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ);
+    count = ns / clock_get_ns(t->ctrl->clock);
     count /= npcm7xx_tcsr_prescaler(t->tcsr);
 
     return count;
@@ -167,7 +167,7 @@ static void npcm7xx_watchdog_timer_reset_cycles(NPCM7xxWatchdogTimer *t,
         int64_t cycles)
 {
     uint32_t prescaler = npcm7xx_watchdog_timer_prescaler(t);
-    int64_t ns = (NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ) * cycles;
+    int64_t ns = clock_get_ns(t->ctrl->clock) * cycles;
 
     /*
      * The reset function always clears the current timer. The caller of the
@@ -606,10 +606,11 @@ static void npcm7xx_timer_hold_reset(Object *obj)
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
 
@@ -627,11 +628,12 @@ static void npcm7xx_timer_realize(DeviceState *dev, Error **errp)
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
@@ -675,10 +677,11 @@ static const VMStateDescription vmstate_npcm7xx_watchdog_timer = {
 
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
@@ -697,7 +700,6 @@ static void npcm7xx_timer_class_init(ObjectClass *klass, void *data)
     QEMU_BUILD_BUG_ON(NPCM7XX_TIMER_REGS_END > NPCM7XX_TIMER_NR_REGS);
 
     dc->desc = "NPCM7xx Timer Controller";
-    dc->realize = npcm7xx_timer_realize;
     dc->vmsd = &vmstate_npcm7xx_timer_ctrl;
     rc->phases.enter = npcm7xx_timer_enter_reset;
     rc->phases.hold = npcm7xx_timer_hold_reset;
@@ -708,6 +710,7 @@ static const TypeInfo npcm7xx_timer_info = {
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
2.29.2.684.gfbc64c5ab5-goog

