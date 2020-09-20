Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3322445lfq;
        Sun, 20 Sep 2020 10:59:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLj6YxPJoJvWN97uElVwBXbRP0vC/QYiKw2eliKy4yo2N9GP9qq6SgJjJgSQme2kLovb75
X-Received: by 2002:a25:4c89:: with SMTP id z131mr30942770yba.256.1600624759618;
        Sun, 20 Sep 2020 10:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600624759; cv=none;
        d=google.com; s=arc-20160816;
        b=BNsK79J/t8DFta7sXSfcvDeKu79jPCwYQQ97IDg9rMCZ6aM8fIQ8RkCKGbOk9++saG
         QQKqGwAHwVOmX2j3JGqhElo6hel3Jzd2mLpkCo/1sBp3c+9DFPlW0t9yXzz0Kk+oRPAR
         cWr5cvHiSFEjToLLP4nm/zmPeKSs4zcuA79jztNHMy8me8niSe+3BmZ3ystkECjE9tRl
         +DFXbjMGIYQX5kesfVZqc7AKqxBhNqrJiYNWGNtihSSqpx1hQAXryJ4pGXGTwDa5TERs
         ZJTN9LEpXQHha6GBEZvdBbRhAKrCKlYW/OGyEByZan0n/1tUv3NwJ3icJZr1eqatc1YV
         n2ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1xZK1vadig9h9dP7jrIfkZesoIogtY0XRXYELyLBf2M=;
        b=maFNUsj/OBi4l7ixVd0s4g13kklrX1b2+STPMzWuVwOOGRmU3tqYlw01fZNjnJafEA
         xb7GtQBFGASbx1I0ZAJrfJvsCdEE9hcHbn0g20GFfTkunVvG48PRj26/Gw5DUD6vAO0w
         5EwngkVHTV7mRBGADH0aZIw0VRHnAgoJ8/Hm/kO50GIU1RV8ZIznGuFmYkYHODT4EEES
         vmfpf1u8/2REmgWVgkxV/1YYUCgrGLzRWi5DQF1x1Tc1Ml4+LRuxqlc/wcI5M1FkvLHf
         p47kYY8muA2Qijz3afFhkxQMZSEmLoBNkb/5RNP+HQRwLd2lkS0EAgvv5F0uwA2i0Del
         EaAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=U0PK9Eik;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z32si1092953ybh.88.2020.09.20.10.59.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Sep 2020 10:59:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=U0PK9Eik;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:46766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kK3cN-0002ph-07
	for alex.bennee@linaro.org; Sun, 20 Sep 2020 13:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kK3bj-0001xg-UN; Sun, 20 Sep 2020 13:58:40 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:36593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kK3bi-00031X-HP; Sun, 20 Sep 2020 13:58:39 -0400
Received: by mail-wr1-x442.google.com with SMTP id z1so10451821wrt.3;
 Sun, 20 Sep 2020 10:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1xZK1vadig9h9dP7jrIfkZesoIogtY0XRXYELyLBf2M=;
 b=U0PK9Eik3JEvu0Sum1qSEdY4uHVbNBMFh9FnCQbiFUIgbVQfR2DoRTPxDOCYKBSEnw
 k8AkxkWBAiSTC9AKlEEFmhwwdxU/hxnykVbmd+q/52OPW1nuhd/Q116cPu8gxJxcDeOC
 MsBfa14wpz74rSFOLk5uD1JuQXz37PPCxYZF5dMHG1+Kuxm+n3xex4W3JT88IpylEZs+
 IikRLob4iz4H7HbKsYpgmLVde4rq5N6sF8WJIy1EAJi/Xds1HVQllCuzY60F6iDpxLox
 PnKN9kJ57t/friTdyywiZZqNCEa0HhjHIhxiR05pa7/rNaBwSdqydsAC7rTIRmMOF1Jn
 +0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1xZK1vadig9h9dP7jrIfkZesoIogtY0XRXYELyLBf2M=;
 b=HBEgr9RdKK1YotlTkBh0UPI+BujreYzAqrGmorfi2HvR8r7gkgA0BoFEXfXcbInDyR
 lWqsjs8qq/YFxRMdxg9d/+Zd96VYNrN8GEA/vfFY/B3ZGfvxfEVeUT7IiQ5ERdoF5Q04
 db7WKHM7Uqdf/bW75X2TEKBG3CEYkVmYiQeT4O11c53PMHbh9NzqkN8BVm55tHQUQGyf
 TsbOtSIf6sTCWkonb5tUJIW4KgBqiqPLxBQrJB5VQTI3M5ES6pUAYoxG0a2LSgkFMVBF
 naJSjnAkLRtHoXYuoOUHjF0sIlw4TH0KWTOKFhZDAFfnVEC4ZIHLB5lg/2aNXfUXYpBA
 K5OA==
X-Gm-Message-State: AOAM53172siuuaYiEaZbcfBWTVDtSdoUL2JLObxEiNga/AKy2rR28Wg3
 QsZ0g621TsdBb+K56ru45coSZNRy4PI=
X-Received: by 2002:adf:f2d0:: with SMTP id d16mr46647540wrp.332.1600624716675; 
 Sun, 20 Sep 2020 10:58:36 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id u66sm15675781wme.12.2020.09.20.10.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 10:58:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] hw/arm/bcm2835_peripherals: Correctly wire the SYS_timer
 IRQs
Date: Sun, 20 Sep 2020 19:58:25 +0200
Message-Id: <20200920175825.417680-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200920175825.417680-1-f4bug@amsat.org>
References: <20200920175825.417680-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cc/fnBuvTa0T

The SYS_timer is not directly wired to the ARM core, but to the
SoC interrupt controller.

Fixes: 0e5bbd74064 ("hw/arm/bcm2835_peripherals: Use the SYS_timer")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2835_peripherals.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 4e6c678aa99..d1a1ff0676e 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -171,8 +171,17 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->peri_mr, ST_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systmr), 0));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), 0,
-        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_ARM_IRQ,
-                               INTERRUPT_ARM_TIMER));
+        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
+                               INTERRUPT_TIMER0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), 1,
+        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
+                               INTERRUPT_TIMER1));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), 2,
+        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
+                               INTERRUPT_TIMER2));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), 3,
+        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
+                               INTERRUPT_TIMER3));
 
     /* UART0 */
     qdev_prop_set_chr(DEVICE(&s->uart0), "chardev", serial_hd(0));
-- 
2.26.2

