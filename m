Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp193971lff;
        Thu, 12 Aug 2021 02:40:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvi/G6HJgC4Gu/6Xde31UO9EtpBZLN6p0Ve9EHEhax+BVSqPAHlF/ZSJu+Pc+nFySb/uIq
X-Received: by 2002:a25:81c5:: with SMTP id n5mr3322434ybm.276.1628761219928;
        Thu, 12 Aug 2021 02:40:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628761219; cv=none;
        d=google.com; s=arc-20160816;
        b=a1gux+vP6LXg86IFUZF9fu8jsAx0DzJ95kbZCnpxw5dQCn3FoXhgUD5iIuNICbgTT2
         vp2Dc+4Xjt+W/d6i7IZt5hZzZhOXhp9MsBHpQ/Bfr7xaOCv6ud/PgGxDJ8v0USrIPVXk
         Jzzzqxk6mGLb08L8xt19tYiIZK+/Kl4cPdsEdoZ93adFVF8SnGrbklxLhYEfrBsMMy/t
         qWlp4stTvJUc8CQRV6XOojKrMJfjSOo9Op3b5egtlESWwzBEvqX4GJdAQN0Zg+b3gY6i
         W+a1t3j+wVoJqNVI/hSSo90dItYctML6h77lITnYZZiYubfaf8bGhpTUrnfP/1Vd2HUI
         CwRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=V9LPD/w5S2tICuCSVQyFMKgCCI7LpmXe58LRM4rK7Cs=;
        b=uhdDFDSGXvbc8x7dHLVqvp1IBnwzAYPRmcUubCOfmv9RyNgvxQVV79EKRyNBZetLw7
         Zqd0Tvpyv442pb3snm10EimppUfy015oicQdm0worm99DB/No+gfIDeZcPnsGz+JMn3m
         l9jhj6/FO59gasM8osBTAv4fzW1vVIB4vB69Tb65mVyD4NaXxIJbnvsYgFbPM6pENh9e
         c4QRhGAjkJxxMdxz2ZmL/5bFaFX9f3iTISapxMEZ6uor9DVwvBW61thoSsvz9bhhaFSt
         HwTZu4j2M7A3MhRLln2Ra8PefXL3fKB3uk5NqlYKyG25ZcFYRvz8iwic9/p06YYtQ/OT
         zWLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="bUzvD/IN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k16si2154019ybm.275.2021.08.12.02.40.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 02:40:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="bUzvD/IN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mE7CF-0007sl-7W
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 05:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76P-0005Vd-9z
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 05:34:17 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:40739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76L-0007vH-4n
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 05:34:16 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 f12-20020a05600c4e8c00b002e6bdd6ffe2so799974wmq.5
 for <qemu-arm@nongnu.org>; Thu, 12 Aug 2021 02:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V9LPD/w5S2tICuCSVQyFMKgCCI7LpmXe58LRM4rK7Cs=;
 b=bUzvD/IN9TlDDyE4GFCUnRlOHY+XtI1kWAlXEXlCoxYAZxeseaw/QAz8qWlRjHzV6a
 ZxAi5RRpBxtiXYKuX95pTzaL9pYA7V+y5/ADBXeAPIznwnv7JnTIfKiwYx0RtJrAPVV9
 mdIh0tUO/3gNOK/WvEtGXbd6dJfvMHxJH/jHA9NjbdRpAhPRHQN2kEH029M9U0IBX3pC
 gHF5tymJc3SYmjJ/bg57PTXpXrmL8E5fnbn2qohG7cjg8L+HLMf7LexQ26gsdA2QXEbA
 YfSq1XxtqgFnZyJoSntchoX0Vdv50SvDCIbW40V5kd/caw6UmMTPFfbn5cCgXBJ3PqsA
 20jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V9LPD/w5S2tICuCSVQyFMKgCCI7LpmXe58LRM4rK7Cs=;
 b=CAcWhmcRR9PTA1KJlTCRQduNnSUQcjYhnzjiqKBICW1w87QY6djKV/tkuyElYDhyUx
 H+R5R/aQZ3KXz9BtcX6HfQtaqehB4GDwenS5KUjv3fu4hnOiX9Il/6N5073ypUlAbyg/
 oEk09fes8zNnjpE7vj8LxerhhFE3wh/Vs7kE8i6H6CytbKskJ6hOqWRTN24lZnb+QLEO
 5etTTy6zAygNiF3RNZk8j0V0DUolwpWKIMa73PUujAu6aSH4n4QPmErpm6AnL6ZO/Pzo
 8l3vVahumnyCzpE9m2A7QrPpd5YSeQsSz2+zIzTiJze2jXWGt7BoTclYGalOzzKjftfB
 zZlg==
X-Gm-Message-State: AOAM533qBcDkmPlIqopMRdCfUbTdQKqugECD86LvwegCbqYWVxgpt3AQ
 ltmuqMnTVXpQA2y/fT6iYOSLRBMqzbWMNA==
X-Received: by 2002:a7b:c204:: with SMTP id x4mr2985911wmi.70.1628760851426;
 Thu, 12 Aug 2021 02:34:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 13/25] hw/arm/stm32f405: Wire up sysclk and refclk
Date: Thu, 12 Aug 2021 10:33:44 +0100
Message-Id: <20210812093356.1946-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kF1I0yfdhqrG

Wire up the sysclk and refclk for the stm32f405 SoC.  This SoC always
runs the systick refclk at 1/8 the frequency of the main CPU clock,
so the board code only needs to provide a single sysclk clock.

Because there is only one board using this SoC, we convert the SoC
and the board together, rather than splitting it into "add clock to
SoC; connect clock in board; add error check in SoC code that clock
is wired up".

When the systick device starts honouring its clock inputs, this will
fix an emulation inaccuracy in the netduinoplus2 board where the
systick reference clock was running at 1MHz rather than 21MHz.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/stm32f405_soc.h |  3 +++
 hw/arm/netduinoplus2.c         | 12 +++++++-----
 hw/arm/stm32f405_soc.c         | 30 ++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/stm32f405_soc.h b/include/hw/arm/stm32f405_soc.h
index 347105e709b..5bb0c8d5697 100644
--- a/include/hw/arm/stm32f405_soc.h
+++ b/include/hw/arm/stm32f405_soc.h
@@ -68,6 +68,9 @@ struct STM32F405State {
     MemoryRegion sram;
     MemoryRegion flash;
     MemoryRegion flash_alias;
+
+    Clock *sysclk;
+    Clock *refclk;
 };
 
 #endif
diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c
index d3ad7a2b675..a5a8999cc8c 100644
--- a/hw/arm/netduinoplus2.c
+++ b/hw/arm/netduinoplus2.c
@@ -26,6 +26,7 @@
 #include "qapi/error.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
+#include "hw/qdev-clock.h"
 #include "qemu/error-report.h"
 #include "hw/arm/stm32f405_soc.h"
 #include "hw/arm/boot.h"
@@ -36,16 +37,17 @@
 static void netduinoplus2_init(MachineState *machine)
 {
     DeviceState *dev;
+    Clock *sysclk;
 
-    /*
-     * TODO: ideally we would model the SoC RCC and let it handle
-     * system_clock_scale, including its ability to define different
-     * possible SYSCLK sources.
-     */
     system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
 
+    /* This clock doesn't need migration because it is fixed-frequency */
+    sysclk = clock_new(OBJECT(machine), "SYSCLK");
+    clock_set_hz(sysclk, SYSCLK_FRQ);
+
     dev = qdev_new(TYPE_STM32F405_SOC);
     qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m4"));
+    qdev_connect_clock_in(dev, "sysclk", sysclk);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     armv7m_load_kernel(ARM_CPU(first_cpu),
diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index cb04c111987..0019b7f4785 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -28,6 +28,7 @@
 #include "exec/address-spaces.h"
 #include "sysemu/sysemu.h"
 #include "hw/arm/stm32f405_soc.h"
+#include "hw/qdev-clock.h"
 #include "hw/misc/unimp.h"
 
 #define SYSCFG_ADD                     0x40013800
@@ -80,6 +81,9 @@ static void stm32f405_soc_initfn(Object *obj)
     }
 
     object_initialize_child(obj, "exti", &s->exti, TYPE_STM32F4XX_EXTI);
+
+    s->sysclk = qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0);
+    s->refclk = qdev_init_clock_in(DEVICE(s), "refclk", NULL, NULL, 0);
 }
 
 static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
@@ -91,6 +95,30 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
     Error *err = NULL;
     int i;
 
+    /*
+     * We use s->refclk internally and only define it with qdev_init_clock_in()
+     * so it is correctly parented and not leaked on an init/deinit; it is not
+     * intended as an externally exposed clock.
+     */
+    if (clock_has_source(s->refclk)) {
+        error_setg(errp, "refclk clock must not be wired up by the board code");
+        return;
+    }
+
+    if (!clock_has_source(s->sysclk)) {
+        error_setg(errp, "sysclk clock must be wired up by the board code");
+        return;
+    }
+
+    /*
+     * TODO: ideally we should model the SoC RCC and its ability to
+     * change the sysclk frequency and define different sysclk sources.
+     */
+
+    /* The refclk always runs at frequency HCLK / 8 */
+    clock_set_mul_div(s->refclk, 8, 1);
+    clock_set_source(s->refclk, s->sysclk);
+
     memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F405.flash",
                            FLASH_SIZE, &err);
     if (err != NULL) {
@@ -116,6 +144,8 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
     qdev_prop_set_uint32(armv7m, "num-irq", 96);
     qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
+    qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
+    qdev_connect_clock_in(armv7m, "refclk", s->refclk);
     object_property_set_link(OBJECT(&s->armv7m), "memory",
                              OBJECT(system_memory), &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), errp)) {
-- 
2.20.1

