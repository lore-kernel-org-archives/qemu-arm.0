Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp192808lff;
        Thu, 12 Aug 2021 02:38:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1B7J7hLJ/Q5cpj8G9kuxfJI7SeR0RRFcTb4rNh4KSZxdExewZfvRk0yAUDY9kdqNyDPun
X-Received: by 2002:ac8:6886:: with SMTP id m6mr2969357qtq.255.1628761107723;
        Thu, 12 Aug 2021 02:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628761107; cv=none;
        d=google.com; s=arc-20160816;
        b=Yy36L9rPjLN9xpo/i2n8Z7YKuKhjKTvSt51FcVJdmv9TPmzHkqrU4b6dGdLxS5wieI
         Vc3z57lQpQeEadWkMGUIBJJics3hARZODL/r+Z/0PUp/n6ImN+aM28UtsP/evSsw5J9I
         Pyk9wZb0XP5a8FZo4DsyZSmxNrSB7PCRO7UecsYCKyLwhAN2yQxurHIGU+qZD/J4Ws57
         C5kmZI6poaBdZkYJp01kEVvF/B8/d4FJbx5Kba9pO4FUqT2YDWUfBCtHLV2CphfU+OCX
         a3eTaPGLeN5pJ/XYRBgQfq+fgB+SP3+TE6dPdY55Ym6hS8bK6SXvSLU93bkqr+v0MmlI
         l/+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7atIIz9vNDvMRlAfoc+jUsWE/JQnMUBn7D/R0DKnTp8=;
        b=LE2FuqSA/d1v+7fD2Eksya0j1dsrgmlTK8SWBs4XEZ9Gyt6etok45Sc9l8WMDmuUvu
         60i9HD+FDT5BCJ9dHqs7ALc7MytSmXKUgKwNk5paMulxXVspXHknOFotJAnk5GnWV2kd
         ucGsJXjIT0wUZ7MsVh4Dl0dSheDDeLalD87/ngGjfPupMfxnJylXKeAfAMogLZ1yX6iP
         n6AoBbk7M0piPWfLiLGxLJeeWWSBSCGl9L3L4FO2vFs0iB7asaMP4ZT3x0n/FY2DOuyQ
         S2uBTtpdsJsXsrSdfIk6FtxhAhyrAyeJLkkvn/5HYSUPxlZMoHTH0hd68NQRTOK+jp5e
         IGFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SUfytAJ4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8si1681443qko.63.2021.08.12.02.38.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 02:38:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SUfytAJ4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mE7AR-0001Vc-1V
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 05:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76N-0005PY-UD
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 05:34:15 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76K-0007t4-1e
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 05:34:15 -0400
Received: by mail-wr1-x433.google.com with SMTP id k29so7337754wrd.7
 for <qemu-arm@nongnu.org>; Thu, 12 Aug 2021 02:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7atIIz9vNDvMRlAfoc+jUsWE/JQnMUBn7D/R0DKnTp8=;
 b=SUfytAJ4/bLBQRKB0By3vzo/tw74CQsIA0Jnd+f6YdzkErmQfUWV0UDGqeq9BgIr/u
 Cd++vzmjWkTnY3nF8FsJJYAqL2BB0qa5A8k8nlrTCZ8+p5eq/WyTN9bMuz43rUKDPJXM
 dDMJSRsShrexwLl0xgVncOYhXtygLyzYHAqtjuYKONx52dqBej6RvOP9G9Lm50OL596I
 /9eJ9hPPzrGJOGaX4qBrHwwA+eWg4MfAeFJICOdPO+b2rJgQJgsGvb3A6yJ+8qy4OUit
 vEXCjBRYLextUN2jCJGdyXFnMxx4dS94zEgU2dc71LYIMtDkaLifZAZWUPWP7vRVxg6M
 8DIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7atIIz9vNDvMRlAfoc+jUsWE/JQnMUBn7D/R0DKnTp8=;
 b=RHKHiTq1kmlGTzIhcoeJYKEk54wxCzYWZmf8vmX4K7nE4eqjvID4uroxJSxe7gYmZH
 aDtT0ruEMinPyu5fuM3Gt2cTCQccglP2+TBh/IYpCIhnw08ci5reK34fPMJQ7nHTrJhK
 pfnoQgQWf2NQJ4yOCP6mRgDob+qzCr+sI0FDFXmaD6IaM7iswIiLwjhxkVFEjWvyX30H
 2v9JDtIn3/I6cBU4VMT+RAB6g1u7y7IpNeu5x1Xdh1OMjHuKwqMuFz8UGlMZ1T0wT8Fb
 SoCDoz6J//H+QdsG7WM0A0AHyD3vh7YtBSUYdmkftrGkfiJm7bLuhBJ4aay3auREmQT4
 PHnA==
X-Gm-Message-State: AOAM530p+wXMf8rt4T73EJGClbIBBGF11pMxeUhkqiCQrE7EJkRkZ/91
 zxUvG4VjxscOT2mQ8mCnPXB6qTpLPGeBxQ==
X-Received: by 2002:adf:cd86:: with SMTP id q6mr2854280wrj.385.1628760850478; 
 Thu, 12 Aug 2021 02:34:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 12/25] hw/arm/stm32f205: Wire up sysclk and refclk
Date: Thu, 12 Aug 2021 10:33:43 +0100
Message-Id: <20210812093356.1946-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RUV0Vwe1F7CW

Wire up the sysclk and refclk for the stm32f205 SoC.  This SoC always
runs the systick refclk at 1/8 the frequency of the main CPU clock,
so the board code only needs to provide a single sysclk clock.

Because there is only one board using this SoC, we convert the SoC
and the board together, rather than splitting it into "add clock to
SoC; connect clock in board; add error check in SoC code that clock
is wired up".

When the systick device starts honouring its clock inputs, this will
fix an emulation inaccuracy in the netduino2 board where the systick
reference clock was running at 1MHz rather than 15MHz.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/stm32f205_soc.h |  4 ++++
 hw/arm/netduino2.c             | 12 +++++++-----
 hw/arm/stm32f205_soc.c         | 30 ++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/stm32f205_soc.h b/include/hw/arm/stm32f205_soc.h
index 75251494917..849d3ed8891 100644
--- a/include/hw/arm/stm32f205_soc.h
+++ b/include/hw/arm/stm32f205_soc.h
@@ -32,6 +32,7 @@
 #include "hw/or-irq.h"
 #include "hw/ssi/stm32f2xx_spi.h"
 #include "hw/arm/armv7m.h"
+#include "hw/clock.h"
 #include "qom/object.h"
 
 #define TYPE_STM32F205_SOC "stm32f205-soc"
@@ -67,6 +68,9 @@ struct STM32F205State {
     MemoryRegion sram;
     MemoryRegion flash;
     MemoryRegion flash_alias;
+
+    Clock *sysclk;
+    Clock *refclk;
 };
 
 #endif
diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
index 1733b71507c..b5c0ba23ee5 100644
--- a/hw/arm/netduino2.c
+++ b/hw/arm/netduino2.c
@@ -26,6 +26,7 @@
 #include "qapi/error.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
+#include "hw/qdev-clock.h"
 #include "qemu/error-report.h"
 #include "hw/arm/stm32f205_soc.h"
 #include "hw/arm/boot.h"
@@ -36,16 +37,17 @@
 static void netduino2_init(MachineState *machine)
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
     dev = qdev_new(TYPE_STM32F205_SOC);
     qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
+    qdev_connect_clock_in(dev, "sysclk", sysclk);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index 0bd215aebd7..c6b75a381d9 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -29,6 +29,7 @@
 #include "exec/address-spaces.h"
 #include "hw/arm/stm32f205_soc.h"
 #include "hw/qdev-properties.h"
+#include "hw/qdev-clock.h"
 #include "sysemu/sysemu.h"
 
 /* At the moment only Timer 2 to 5 are modelled */
@@ -74,6 +75,9 @@ static void stm32f205_soc_initfn(Object *obj)
     for (i = 0; i < STM_NUM_SPIS; i++) {
         object_initialize_child(obj, "spi[*]", &s->spi[i], TYPE_STM32F2XX_SPI);
     }
+
+    s->sysclk = qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0);
+    s->refclk = qdev_init_clock_in(DEVICE(s), "refclk", NULL, NULL, 0);
 }
 
 static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
@@ -85,6 +89,30 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
 
     MemoryRegion *system_memory = get_system_memory();
 
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
     memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F205.flash",
                            FLASH_SIZE, &error_fatal);
     memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
@@ -101,6 +129,8 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
     qdev_prop_set_uint32(armv7m, "num-irq", 96);
     qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
+    qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
+    qdev_connect_clock_in(armv7m, "refclk", s->refclk);
     object_property_set_link(OBJECT(&s->armv7m), "memory",
                              OBJECT(get_system_memory()), &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), errp)) {
-- 
2.20.1

