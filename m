Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp157131lfo;
        Thu, 28 Jan 2021 04:01:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTsIZlcaQlfV5kHT9s2V768QZ0vPTzQ0zBpCNF4vHmV1pzeUmICwRP7XBXamHE1px9EPUO
X-Received: by 2002:a25:41c3:: with SMTP id o186mr22268650yba.503.1611835266295;
        Thu, 28 Jan 2021 04:01:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611835266; cv=none;
        d=google.com; s=arc-20160816;
        b=W947/ZDLEJKKuxkRRWjHBdAMAVClGK5YUY1GiJ/wOgcLChNkTHNgdpn2/bd7IhNEX+
         15S/rw6wmkVTnNZpcwSf01cYKBZ059sVjyPzAc7InDHat6yw/sWbXyf+78fe/5hD7sSN
         sWLxsbgj0FdlixWbuDc/3x3GTm80lvOXLKd7AjIyZ2ZB9dSXPHvELYd7H41MjwbsVQYi
         dRjoNL0yt7hkmqo51ntSy7Nd98K/7BHQ2IxvBq1Iu8DSKMmidp2piG5fwyFVIrHpb7w8
         bFXvJvYPzV9RYZm9sxd+Z4GaQjc3bh/HT8ovp0aA/GJgyzZvXuC8/NuY8SAhFTqogAOq
         e8dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Jz9NDWJlL3r2GqLKIuRpg/kHH68d8J+FWgxl1TndnRQ=;
        b=qyyk+t8we9QEbFWz6fAxqD5IbY7/AhoVkS/xW0Y4kcOOmEE3XstXUPgeBVYoow9j2/
         ouIk1W6+ulmy2m/HQrDP9l6TmTWp1ORlCacclF5rbH1ZBCJNJnb7py6696gjAfXcvddZ
         X+o/MSDc7MBr4OR5jF8YvwpggAfGctVMowkExHyNMLx/7G0G1/ZRMfNueXhs9lBjSxTw
         fD3WuLkkGG010Q8QeCUyUCxS/QDyB3YlgoRx32GLBUTBeyieKqlR3TkZQsJ9oxY4SR+Y
         B4j0DrXaZ3gVBT3LllesRfIcxUTG3eS700jsbCLFWxrejLOynn03GjFAjNAlTMfCe9s8
         Rk9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yPyxG9nI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10si5393985ybk.104.2021.01.28.04.01.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 04:01:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yPyxG9nI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l55yz-0007x6-Ly
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 07:01:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gu-0001kM-Di
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:25 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gk-0006ET-EO
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:24 -0500
Received: by mail-wr1-x42a.google.com with SMTP id a1so5075662wrq.6
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jz9NDWJlL3r2GqLKIuRpg/kHH68d8J+FWgxl1TndnRQ=;
 b=yPyxG9nIm6gNg6JeGYh5/msRrjFyOZV8lfyeQ0rXzuxHON+vvP8rdmJKye8Xzrj4S8
 tU5WqH4eY1H6c4smb61/oua1sW49rI7XJhJFKE7kzgMA1CVcKRNKBK1YSkRydvpeR7ZD
 WM8SL9/V2t5+AWMTJALnW9UNYX33MXSpHmTRmbdBT8BJtJBUbnRh4tLAAJJmSNHIUwJ6
 XWJ34n1UaDLLuF+F/Vk3gnIaTj4cN5f+rv6MqXrJ+2K+AtXUVJXpqRKOmJFONQ/Vgn21
 OB74Ja73gabYpFgFgoqLMFnuhawT4KA87a6RiM8oP4UJU1HNZ0NikLXrsriv38IfuTVX
 LpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jz9NDWJlL3r2GqLKIuRpg/kHH68d8J+FWgxl1TndnRQ=;
 b=b6VNUTlQxsK/2T9/Tc3eJmD0Wc8aNKc0qUjPWsUpcq+LSIedLl7Bez8Hbf0IhmFECU
 6oI3HdBaPMf4cAJNjTN9pMEvhis861xbcDhM9RnyH7/vc+pC9Wglh2la/fpdmv8oHRbh
 6x26a4i16l396PS8HdFVlsALHPeOQkNxQ8/4dcgBM1z7hCGKUEhKhAX5ZbnvET2H8gNl
 6AuG/BfZK/PEHulVFQEW+R7Llldjf0akh1nwWThZpOnj6kpdIKmbbd6XN9oFxFVTxoU0
 emyAI/+j8LWDUZHEpjsMqMyqiKfYXoQ8bKyUQ2Ynap0m0SMI6mFjQlIDMHqCK1aRgpK/
 yEVg==
X-Gm-Message-State: AOAM530xHoL56LTo7/AbTsQ7pGoJEeMGb+b1q+xLjROMRI21/RJhuGZD
 6Nt7BLpnr/Z8JYimb26DDNkstg==
X-Received: by 2002:a5d:6686:: with SMTP id l6mr15715840wru.236.1611834132929; 
 Thu, 28 Jan 2021 03:42:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:42:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 23/25] arm: Don't set freq properties on CMSDK timer,
 dualtimer, watchdog, ARMSSE
Date: Thu, 28 Jan 2021 11:41:43 +0000
Message-Id: <20210128114145.20536-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kZVJwKpqu/ko

Remove all the code that sets frequency properties on the CMSDK
timer, dualtimer and watchdog devices and on the ARMSSE SoC device:
these properties are unused now that the devices rely on their Clock
inputs instead.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210121190622.22000-24-peter.maydell@linaro.org
---
 hw/arm/armsse.c    | 7 -------
 hw/arm/mps2-tz.c   | 1 -
 hw/arm/mps2.c      | 3 ---
 hw/arm/musca.c     | 1 -
 hw/arm/stellaris.c | 3 ---
 5 files changed, 15 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 9a6b24c79aa..34855e667de 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -727,7 +727,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
      * it to the appropriate PPC port; then we can realize the PPC and
      * map its upstream ends to the right place in the container.
      */
-    qdev_prop_set_uint32(DEVICE(&s->timer0), "pclk-frq", s->mainclk_frq);
     qdev_connect_clock_in(DEVICE(&s->timer0), "pclk", s->mainclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer0), errp)) {
         return;
@@ -738,7 +737,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     object_property_set_link(OBJECT(&s->apb_ppc0), "port[0]", OBJECT(mr),
                              &error_abort);
 
-    qdev_prop_set_uint32(DEVICE(&s->timer1), "pclk-frq", s->mainclk_frq);
     qdev_connect_clock_in(DEVICE(&s->timer1), "pclk", s->mainclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer1), errp)) {
         return;
@@ -749,7 +747,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     object_property_set_link(OBJECT(&s->apb_ppc0), "port[1]", OBJECT(mr),
                              &error_abort);
 
-    qdev_prop_set_uint32(DEVICE(&s->dualtimer), "pclk-frq", s->mainclk_frq);
     qdev_connect_clock_in(DEVICE(&s->dualtimer), "TIMCLK", s->mainclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->dualtimer), errp)) {
         return;
@@ -908,7 +905,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     /* Devices behind APB PPC1:
      *   0x4002f000: S32K timer
      */
-    qdev_prop_set_uint32(DEVICE(&s->s32ktimer), "pclk-frq", S32KCLK);
     qdev_connect_clock_in(DEVICE(&s->s32ktimer), "pclk", s->s32kclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->s32ktimer), errp)) {
         return;
@@ -1002,7 +998,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     qdev_connect_gpio_out(DEVICE(&s->nmi_orgate), 0,
                           qdev_get_gpio_in_named(DEVICE(&s->armv7m), "NMI", 0));
 
-    qdev_prop_set_uint32(DEVICE(&s->s32kwatchdog), "wdogclk-frq", S32KCLK);
     qdev_connect_clock_in(DEVICE(&s->s32kwatchdog), "WDOGCLK", s->s32kclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->s32kwatchdog), errp)) {
         return;
@@ -1013,7 +1008,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
 
     /* 0x40080000 .. 0x4008ffff : ARMSSE second Base peripheral region */
 
-    qdev_prop_set_uint32(DEVICE(&s->nswatchdog), "wdogclk-frq", s->mainclk_frq);
     qdev_connect_clock_in(DEVICE(&s->nswatchdog), "WDOGCLK", s->mainclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->nswatchdog), errp)) {
         return;
@@ -1022,7 +1016,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                        armsse_get_common_irq_in(s, 1));
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->nswatchdog), 0, 0x40081000);
 
-    qdev_prop_set_uint32(DEVICE(&s->swatchdog), "wdogclk-frq", s->mainclk_frq);
     qdev_connect_clock_in(DEVICE(&s->swatchdog), "WDOGCLK", s->mainclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->swatchdog), errp)) {
         return;
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 7acdf490f28..90caa914934 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -413,7 +413,6 @@ static void mps2tz_common_init(MachineState *machine)
     object_property_set_link(OBJECT(&mms->iotkit), "memory",
                              OBJECT(system_memory), &error_abort);
     qdev_prop_set_uint32(iotkitdev, "EXP_NUMIRQ", MPS2TZ_NUMIRQ);
-    qdev_prop_set_uint32(iotkitdev, "MAINCLK_FRQ", SYSCLK_FRQ);
     qdev_connect_clock_in(iotkitdev, "MAINCLK", mms->sysclk);
     qdev_connect_clock_in(iotkitdev, "S32KCLK", mms->s32kclk);
     sysbus_realize(SYS_BUS_DEVICE(&mms->iotkit), &error_fatal);
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index cd1c215f941..39add416db5 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -346,7 +346,6 @@ static void mps2_common_init(MachineState *machine)
         object_initialize_child(OBJECT(mms), name, &mms->timer[i],
                                 TYPE_CMSDK_APB_TIMER);
         sbd = SYS_BUS_DEVICE(&mms->timer[i]);
-        qdev_prop_set_uint32(DEVICE(&mms->timer[i]), "pclk-frq", SYSCLK_FRQ);
         qdev_connect_clock_in(DEVICE(&mms->timer[i]), "pclk", mms->sysclk);
         sysbus_realize_and_unref(sbd, &error_fatal);
         sysbus_mmio_map(sbd, 0, base);
@@ -355,7 +354,6 @@ static void mps2_common_init(MachineState *machine)
 
     object_initialize_child(OBJECT(mms), "dualtimer", &mms->dualtimer,
                             TYPE_CMSDK_APB_DUALTIMER);
-    qdev_prop_set_uint32(DEVICE(&mms->dualtimer), "pclk-frq", SYSCLK_FRQ);
     qdev_connect_clock_in(DEVICE(&mms->dualtimer), "TIMCLK", mms->sysclk);
     sysbus_realize(SYS_BUS_DEVICE(&mms->dualtimer), &error_fatal);
     sysbus_connect_irq(SYS_BUS_DEVICE(&mms->dualtimer), 0,
@@ -363,7 +361,6 @@ static void mps2_common_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(&mms->dualtimer), 0, 0x40002000);
     object_initialize_child(OBJECT(mms), "watchdog", &mms->watchdog,
                             TYPE_CMSDK_APB_WATCHDOG);
-    qdev_prop_set_uint32(DEVICE(&mms->watchdog), "wdogclk-frq", SYSCLK_FRQ);
     qdev_connect_clock_in(DEVICE(&mms->watchdog), "WDOGCLK", mms->sysclk);
     sysbus_realize(SYS_BUS_DEVICE(&mms->watchdog), &error_fatal);
     sysbus_connect_irq(SYS_BUS_DEVICE(&mms->watchdog), 0,
diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index a9292482a06..945643c3cd7 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -385,7 +385,6 @@ static void musca_init(MachineState *machine)
     qdev_prop_set_uint32(ssedev, "EXP_NUMIRQ", mmc->num_irqs);
     qdev_prop_set_uint32(ssedev, "init-svtor", mmc->init_svtor);
     qdev_prop_set_uint32(ssedev, "SRAM_ADDR_WIDTH", mmc->sram_addr_width);
-    qdev_prop_set_uint32(ssedev, "MAINCLK_FRQ", SYSCLK_FRQ);
     qdev_connect_clock_in(ssedev, "MAINCLK", mms->sysclk);
     qdev_connect_clock_in(ssedev, "S32KCLK", mms->s32kclk);
     /*
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 9b67c739ef2..5acb043a07e 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1415,9 +1415,6 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     if (board->dc1 & (1 << 3)) { /* watchdog present */
         dev = qdev_new(TYPE_LUMINARY_WATCHDOG);
 
-        /* system_clock_scale is valid now */
-        uint32_t mainclk = NANOSECONDS_PER_SECOND / system_clock_scale;
-        qdev_prop_set_uint32(dev, "wdogclk-frq", mainclk);
         qdev_connect_clock_in(dev, "WDOGCLK",
                               qdev_get_clock_out(ssys_dev, "SYSCLK"));
 
-- 
2.20.1

