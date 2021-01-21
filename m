Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp178297lfb;
        Thu, 21 Jan 2021 11:35:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGmTc9Ug/IehxOK4dQRms4XzzpaPBUf3h8EqilRZJ/p1NwY2Bh5t0IcdbIPSCY+T4ipdll
X-Received: by 2002:a25:df8f:: with SMTP id w137mr1312426ybg.70.1611257724223;
        Thu, 21 Jan 2021 11:35:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611257724; cv=none;
        d=google.com; s=arc-20160816;
        b=kaA5SiqA51/NONF1w7e7o+7zsHK+v01GXKQMuKGR9u5xB0tfgGIQlbwYK+R0Xs+HjM
         Aq19zCjK8iQsFLmhMlbGW8JeybHtHKAie4lzXeBYE7MpbWfAFHJsqdBfg2xTK9mJpqVx
         xQc3G/5PoMaPhnIJTjbj/OpaKUBTSpa/Z2IS6VE8AXkPSu62H78zdl610Yi6r87m/lEx
         OopSrF+RUZon2yvqUYD9cnXOrIJNuGwShtFIgQDOzzcsXpHIDc07/gkNeQxhlA+whQDu
         KLPqzpsMlcA4f3W4l2eu56bgoZjKqd8j19tnc/PQkeFSUHtGIloO4Nm/UZLge15UjDXU
         ICbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=M450OYz/GBhndtZoAmfzOIX2VnGdSC4wd81hH65n+S0=;
        b=Oh8am8q2H3bYZrcuCe2b85nyBDKW2Bj7CUzm/1C7+rJ/EGXMgjCQs6gp7Ww5YTAAcV
         cVKzjTVD4THBTgkxsmlo80ZgeB8pVp/N9lvoVk9XlfCbWOvdMATm5PkhkzpXfh5t/Fgi
         5mWfEQGBVm3Bg5U07lz7X3iiwlGlLL+98hvNGnO/6P1ZoBBjYngvnFVGZ1YwUL3kkNjr
         sZhEGFvYSH8RZE2c0wdz46+46hPqt+FTOGfYqIXZ/GS2lUCubZFPxHpA2+6U6lSw2n1K
         gsxQsad9DNNO6VDk28+N4RMprd30KNiA/xGadkfdYSqvErA4+Sfkz5f1l+2R4WmJ1Cjl
         7nnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WXQ++Bmx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4si5300125ybc.387.2021.01.21.11.35.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jan 2021 11:35:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WXQ++Bmx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2fjn-0005J7-Jy
	for alex.bennee@linaro.org; Thu, 21 Jan 2021 14:35:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fIZ-0002kA-Fr
 for qemu-arm@nongnu.org; Thu, 21 Jan 2021 14:07:15 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fIA-0005xF-PE
 for qemu-arm@nongnu.org; Thu, 21 Jan 2021 14:07:15 -0500
Received: by mail-wr1-x436.google.com with SMTP id a12so2816994wrv.8
 for <qemu-arm@nongnu.org>; Thu, 21 Jan 2021 11:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M450OYz/GBhndtZoAmfzOIX2VnGdSC4wd81hH65n+S0=;
 b=WXQ++Bmxm8z8NcWPFu3TTCoatxxvtPU7MtoIBY2yHLaCUX9aXqpB2Bm6P4LSjS59qz
 twq++8yV+YkJGo+8ndUSHPT/2YwhfYp5RMml/4OYpnXOEcG1+Mxf6BUkJKugES7GITcE
 RjwVaeMlJBegSzZ4dfGAn++AB5N9nwMCS8V43UX0fGjJlVSbMo9dBUYarbc3ip8fzZDT
 wTLV+U9XF6ZWka7z9KzAMtLFKcADhl7T09F3+SEgZT54JdW2jPKKxoeB5jJN9c0Y28Wf
 A6yYyKJPNyFID1WU8rV9x8bD8DjLYZGZc9gPphUBwV44XBZXE4p1c7TMg5uqaeCZBt66
 jtbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M450OYz/GBhndtZoAmfzOIX2VnGdSC4wd81hH65n+S0=;
 b=hWM+5LRbnXRa7W/jgAgW64OwqW5QXNj0XO6ADRXxvguz2126Vk2rH+d7HsHRtCpkwS
 OYFlrVp9eUpARUtDwZR+l/WzPjgQbEYLnFysIn0g2ndNVEYKl4/qHLYvj/BpTpIe8cy4
 SPhmBRNxiNXCSHizTYgcWl13j8JaGK+e6hsLgiUDdg8ro1ql89j6KvjhVB0r2GN0VGYz
 DVmvaXZQTuioT/I++WfgL1teRBuzx53nezq0myvKgAHW3PZqmS0H76/aENIPYuL7Efmt
 3ItD62G1Urg0ENMVY9U/xlS8z3l52wzm3bbdEL6cVh8fGas/ii3RZdUZrb3nYq1VRfaM
 QREQ==
X-Gm-Message-State: AOAM533nTskph4DW2WI69ypF6710+VeTpfgNZXvcdm+BvICAHgFc8HuR
 5tNgTlXbycjQ1J5a3dLJoktTiifmbhyKAA==
X-Received: by 2002:adf:ea0c:: with SMTP id q12mr926859wrm.126.1611256008326; 
 Thu, 21 Jan 2021 11:06:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 24/25] arm: Remove frq properties on CMSDK timer, dualtimer,
 watchdog, ARMSSE
Date: Thu, 21 Jan 2021 19:06:21 +0000
Message-Id: <20210121190622.22000-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rjvjrfy+9iIO

Now no users are setting the frq properties on the CMSDK timer,
dualtimer, watchdog or ARMSSE SoC devices, we can remove the
properties and the struct fields that back them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h                  | 2 --
 include/hw/timer/cmsdk-apb-dualtimer.h   | 2 --
 include/hw/timer/cmsdk-apb-timer.h       | 2 --
 include/hw/watchdog/cmsdk-apb-watchdog.h | 2 --
 hw/arm/armsse.c                          | 2 --
 hw/timer/cmsdk-apb-dualtimer.c           | 6 ------
 hw/timer/cmsdk-apb-timer.c               | 6 ------
 hw/watchdog/cmsdk-apb-watchdog.c         | 6 ------
 8 files changed, 28 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index bfa1e79c4fe..676cd4f36b0 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -41,7 +41,6 @@
  *  + Clock input "S32KCLK": slow 32KHz clock used for a few peripherals
  *  + QOM property "memory" is a MemoryRegion containing the devices provided
  *    by the board model.
- *  + QOM property "MAINCLK_FRQ" is the frequency of the main system clock
  *  + QOM property "EXP_NUMIRQ" sets the number of expansion interrupts.
  *    (In hardware, the SSE-200 permits the number of expansion interrupts
  *    for the two CPUs to be configured separately, but we restrict it to
@@ -218,7 +217,6 @@ struct ARMSSE {
     /* Properties */
     MemoryRegion *board_memory;
     uint32_t exp_numirq;
-    uint32_t mainclk_frq;
     uint32_t sram_addr_width;
     uint32_t init_svtor;
     bool cpu_fpu[SSE_MAX_CPUS];
diff --git a/include/hw/timer/cmsdk-apb-dualtimer.h b/include/hw/timer/cmsdk-apb-dualtimer.h
index 3adbb01dd34..f3ec86c00b5 100644
--- a/include/hw/timer/cmsdk-apb-dualtimer.h
+++ b/include/hw/timer/cmsdk-apb-dualtimer.h
@@ -16,7 +16,6 @@
  * https://developer.arm.com/products/system-design/system-design-kits/cortex-m-system-design-kit
  *
  * QEMU interface:
- *  + QOM property "pclk-frq": frequency at which the timer is clocked
  *  + Clock input "TIMCLK": clock (for both timers)
  *  + sysbus MMIO region 0: the register bank
  *  + sysbus IRQ 0: combined timer interrupt TIMINTC
@@ -63,7 +62,6 @@ struct CMSDKAPBDualTimer {
     /*< public >*/
     MemoryRegion iomem;
     qemu_irq timerintc;
-    uint32_t pclk_frq;
     Clock *timclk;
 
     CMSDKAPBDualTimerModule timermod[CMSDK_APB_DUALTIMER_NUM_MODULES];
diff --git a/include/hw/timer/cmsdk-apb-timer.h b/include/hw/timer/cmsdk-apb-timer.h
index 54f7ec8c502..c4c7eae8499 100644
--- a/include/hw/timer/cmsdk-apb-timer.h
+++ b/include/hw/timer/cmsdk-apb-timer.h
@@ -23,7 +23,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(CMSDKAPBTimer, CMSDK_APB_TIMER)
 
 /*
  * QEMU interface:
- *  + QOM property "pclk-frq": frequency at which the timer is clocked
  *  + Clock input "pclk": clock for the timer
  *  + sysbus MMIO region 0: the register bank
  *  + sysbus IRQ 0: timer interrupt TIMERINT
@@ -35,7 +34,6 @@ struct CMSDKAPBTimer {
     /*< public >*/
     MemoryRegion iomem;
     qemu_irq timerint;
-    uint32_t pclk_frq;
     struct ptimer_state *timer;
     Clock *pclk;
 
diff --git a/include/hw/watchdog/cmsdk-apb-watchdog.h b/include/hw/watchdog/cmsdk-apb-watchdog.h
index 34069ca6969..c6b3e78731e 100644
--- a/include/hw/watchdog/cmsdk-apb-watchdog.h
+++ b/include/hw/watchdog/cmsdk-apb-watchdog.h
@@ -16,7 +16,6 @@
  * https://developer.arm.com/products/system-design/system-design-kits/cortex-m-system-design-kit
  *
  * QEMU interface:
- *  + QOM property "wdogclk-frq": frequency at which the watchdog is clocked
  *  + Clock input "WDOGCLK": clock for the watchdog's timer
  *  + sysbus MMIO region 0: the register bank
  *  + sysbus IRQ 0: watchdog interrupt
@@ -53,7 +52,6 @@ struct CMSDKAPBWatchdog {
     /*< public >*/
     MemoryRegion iomem;
     qemu_irq wdogint;
-    uint32_t wdogclk_frq;
     bool is_luminary;
     struct ptimer_state *timer;
     Clock *wdogclk;
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 7494afc630e..513caa33a9a 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -48,7 +48,6 @@ static Property iotkit_properties[] = {
     DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
-    DEFINE_PROP_UINT32("MAINCLK_FRQ", ARMSSE, mainclk_frq, 0),
     DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),
     DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
     DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], true),
@@ -60,7 +59,6 @@ static Property armsse_properties[] = {
     DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
-    DEFINE_PROP_UINT32("MAINCLK_FRQ", ARMSSE, mainclk_frq, 0),
     DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),
     DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
     DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], false),
diff --git a/hw/timer/cmsdk-apb-dualtimer.c b/hw/timer/cmsdk-apb-dualtimer.c
index 828127b366f..ef49f5852d3 100644
--- a/hw/timer/cmsdk-apb-dualtimer.c
+++ b/hw/timer/cmsdk-apb-dualtimer.c
@@ -533,11 +533,6 @@ static const VMStateDescription cmsdk_apb_dualtimer_vmstate = {
     }
 };
 
-static Property cmsdk_apb_dualtimer_properties[] = {
-    DEFINE_PROP_UINT32("pclk-frq", CMSDKAPBDualTimer, pclk_frq, 0),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void cmsdk_apb_dualtimer_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -545,7 +540,6 @@ static void cmsdk_apb_dualtimer_class_init(ObjectClass *klass, void *data)
     dc->realize = cmsdk_apb_dualtimer_realize;
     dc->vmsd = &cmsdk_apb_dualtimer_vmstate;
     dc->reset = cmsdk_apb_dualtimer_reset;
-    device_class_set_props(dc, cmsdk_apb_dualtimer_properties);
 }
 
 static const TypeInfo cmsdk_apb_dualtimer_info = {
diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
index f053146d88f..ee51ce3369c 100644
--- a/hw/timer/cmsdk-apb-timer.c
+++ b/hw/timer/cmsdk-apb-timer.c
@@ -261,11 +261,6 @@ static const VMStateDescription cmsdk_apb_timer_vmstate = {
     }
 };
 
-static Property cmsdk_apb_timer_properties[] = {
-    DEFINE_PROP_UINT32("pclk-frq", CMSDKAPBTimer, pclk_frq, 0),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void cmsdk_apb_timer_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -273,7 +268,6 @@ static void cmsdk_apb_timer_class_init(ObjectClass *klass, void *data)
     dc->realize = cmsdk_apb_timer_realize;
     dc->vmsd = &cmsdk_apb_timer_vmstate;
     dc->reset = cmsdk_apb_timer_reset;
-    device_class_set_props(dc, cmsdk_apb_timer_properties);
 }
 
 static const TypeInfo cmsdk_apb_timer_info = {
diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-watchdog.c
index 9cad0c67da4..302f1711738 100644
--- a/hw/watchdog/cmsdk-apb-watchdog.c
+++ b/hw/watchdog/cmsdk-apb-watchdog.c
@@ -373,11 +373,6 @@ static const VMStateDescription cmsdk_apb_watchdog_vmstate = {
     }
 };
 
-static Property cmsdk_apb_watchdog_properties[] = {
-    DEFINE_PROP_UINT32("wdogclk-frq", CMSDKAPBWatchdog, wdogclk_frq, 0),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void cmsdk_apb_watchdog_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -385,7 +380,6 @@ static void cmsdk_apb_watchdog_class_init(ObjectClass *klass, void *data)
     dc->realize = cmsdk_apb_watchdog_realize;
     dc->vmsd = &cmsdk_apb_watchdog_vmstate;
     dc->reset = cmsdk_apb_watchdog_reset;
-    device_class_set_props(dc, cmsdk_apb_watchdog_properties);
 }
 
 static const TypeInfo cmsdk_apb_watchdog_info = {
-- 
2.20.1

