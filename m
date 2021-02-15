Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5558714lfc;
        Mon, 15 Feb 2021 04:02:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVd8W2xUODsfxGOg23yFbHMFB6tpqWD4wNaB/U7oBCVtkl3QF7MfOK3aWZrzVGdcJTrONt
X-Received: by 2002:a25:2a14:: with SMTP id q20mr22019393ybq.237.1613390570885;
        Mon, 15 Feb 2021 04:02:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613390570; cv=none;
        d=google.com; s=arc-20160816;
        b=W+xQHpKZ6Ehb1gTp03KYMDw3dsWJh210yae1udtRTKg3QNLNSXKaasEarFzZZobZRA
         ZpZn0k5PbVUeIsy87mxzPRzNMH4WbIETVWHfyla9qks4m7NuJI2p7dcrALChfk/k86hE
         Bpb9O33OPTA2frH2C+sinEx6gHmlU+YKHmby3xSgB1GFcwBVC7wf1uhXxardU8WPJ7bF
         ghIkbg1pmRbAJIL94xhSeqSbhIPWbJ4yD/shynAxoL30Rp3N1fL/92eNvJkJLdaYPvcM
         RIrmFRp6G+QlcltDOv6xkler2GUxpMi7xQHtJOfmjntMfwuVco/xAxCESKHSPglNDH0u
         zxSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YocI5mwW2d9jWoFEVN2qubyzzCutaE6tbqO05qvCxyI=;
        b=bSwNTyRapVeVSEl3n5oOoIVBMZ3evVlJU7lrMxnQrMWiccjrkvhSJJymCfIQbBMMbw
         6+UIOdKBYkkbp5l2cu9otTM6WyUr2WUdDCWGFMlCNBYIc2owOyGUI65GpmgT/J5/MVtp
         ImS/Lq6X9Ex+dBuBq7cAbwc5qWvNvkEDZ3hvJ/lj675Rj9ejvcYySSxHW+6CUphq4cgG
         ndDe/hrjzWZbkb3AMHhJOpWa7yK4Mhp+exLjMFQUwDbHDGqj8pKTLtqWYnSd2dAIHux+
         XUoVMno8hBo6dQRZ2Je/gNnLLF163rlu7SJcGp5RypzLdnEM36RB/Ihjv6XeOV8aRbEp
         DOxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Li5nd5+q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f85si6158521ybg.23.2021.02.15.04.02.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 04:02:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Li5nd5+q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBcaY-000558-89
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 07:02:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQR-0007P1-L1
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:52:23 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:55214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQP-0003yS-T5
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:52:23 -0500
Received: by mail-wm1-x32c.google.com with SMTP id w4so5946080wmi.4
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 03:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YocI5mwW2d9jWoFEVN2qubyzzCutaE6tbqO05qvCxyI=;
 b=Li5nd5+qO8jmsWicbG40YqUZ5Uq2zeOVi9HL2zjMN0p578CgzUVaYSq9pUZR3nptox
 9VRICfQeEivD99KrvOvXfe4PEsQVExgXWmRteQIdhX6Tz76Bvz8VOU6g5K8QtrLtgM9z
 4VYZQQQZik5Em8Yxk8zYE2/HPtaaUzxU+x/Fx5Vx6HIQNfA1aBVE+SQ8fOhnXQ7yPrTv
 SkjjSxpKU3jNcGAMVN/JWKUpGBjAWjj0mmSec7SX2ahw9+uA4GcJpd/GH5b1vl1bpl85
 LzA78oZONNIzhnnKP4b00m0HXbzPZiDJnnuvEWv0PJD53bZEwPj6IwV8NHzbXQPzmzHm
 UxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YocI5mwW2d9jWoFEVN2qubyzzCutaE6tbqO05qvCxyI=;
 b=mdbgq1/8kzaxAx6t+TWzO9nMNLHmzspLeRb0Gy1EbvTZaL8VXawqHXfSJ5Rb6pGTbY
 ST0oOplPAgI9O364vYuXKfosXROHNRzspVGgY24J8USzT8yMK4wnl8cZ1zZ8HjKz68Mg
 QkAaPx6EEG8VYLGUa+9g9XJ3xmt+j0O5UuqyHe8Yp4xjz7HdzsXdeAQy8+tNKTUTYvwW
 ARWm4OXw+DG+r/kq/xdKls6igHJVWXC1IAovnwLEoLtnqpGcu54my76PxuBwOT+Ob9+L
 RBs0oveFL4hrCWSdGKs3xkSvgz0osZfr50bxohCL5q5Ghn0j8EtmBy8ZAWM0lDfMKoc3
 qoaQ==
X-Gm-Message-State: AOAM532UZ5VlUmOHq/jZfPKs68sYLgjfkDEv+T+bmB+JQz2LrFwJtl59
 tqdrVdj8/KYhBogyTlG9gPpKDp6ru/0MnA==
X-Received: by 2002:a1c:4ca:: with SMTP id 193mr13925685wme.178.1613389940668; 
 Mon, 15 Feb 2021 03:52:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 09/24] hw/arm/mps2-tz: Make number of IRQs board-specific
Date: Mon, 15 Feb 2021 11:51:23 +0000
Message-Id: <20210215115138.20465-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ascanlWY+MvJ

The AN524 has more interrupt lines than the AN505 and AN521; make
numirq board-specific rather than a compile-time constant.

Since the difference is small (92 on the current boards and 95 on the
new one) we don't dynamically allocate the cpu_irq_splitter[] array
but leave it as a fixed length array whose size is the maximum needed
for any of the boards.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/mps2-tz.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 5561c30b126..6362652e617 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -65,7 +65,7 @@
 #include "hw/qdev-clock.h"
 #include "qom/object.h"
 
-#define MPS2TZ_NUMIRQ 92
+#define MPS2TZ_NUMIRQ_MAX 92
 
 typedef enum MPS2TZFPGAType {
     FPGA_AN505,
@@ -81,6 +81,7 @@ struct MPS2TZMachineClass {
     const uint32_t *oscclk;
     uint32_t fpgaio_num_leds; /* Number of LEDs in FPGAIO LED0 register */
     bool fpgaio_has_switches; /* Does FPGAIO have SWITCH register? */
+    int numirq; /* Number of external interrupts */
     const char *armsse_type;
 };
 
@@ -105,7 +106,7 @@ struct MPS2TZMachineState {
     SplitIRQ sec_resp_splitter;
     qemu_or_irq uart_irq_orgate;
     DeviceState *lan9118;
-    SplitIRQ cpu_irq_splitter[MPS2TZ_NUMIRQ];
+    SplitIRQ cpu_irq_splitter[MPS2TZ_NUMIRQ_MAX];
     Clock *sysclk;
     Clock *s32kclk;
 };
@@ -140,8 +141,9 @@ static qemu_irq get_sse_irq_in(MPS2TZMachineState *mms, int irqno)
 {
     /* Return a qemu_irq which will signal IRQ n to all CPUs in the SSE. */
     MachineClass *mc = MACHINE_GET_CLASS(mms);
+    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
 
-    assert(irqno < MPS2TZ_NUMIRQ);
+    assert(irqno < mmc->numirq);
 
     if (mc->max_cpus > 1) {
         return qdev_get_gpio_in(DEVICE(&mms->cpu_irq_splitter[irqno]), 0);
@@ -428,7 +430,7 @@ static void mps2tz_common_init(MachineState *machine)
     iotkitdev = DEVICE(&mms->iotkit);
     object_property_set_link(OBJECT(&mms->iotkit), "memory",
                              OBJECT(system_memory), &error_abort);
-    qdev_prop_set_uint32(iotkitdev, "EXP_NUMIRQ", MPS2TZ_NUMIRQ);
+    qdev_prop_set_uint32(iotkitdev, "EXP_NUMIRQ", mmc->numirq);
     qdev_connect_clock_in(iotkitdev, "MAINCLK", mms->sysclk);
     qdev_connect_clock_in(iotkitdev, "S32KCLK", mms->s32kclk);
     sysbus_realize(SYS_BUS_DEVICE(&mms->iotkit), &error_fatal);
@@ -439,8 +441,9 @@ static void mps2tz_common_init(MachineState *machine)
      * board. If there is only one CPU, we can just wire the device IRQ
      * directly to the SSE's IRQ input.
      */
+    assert(mmc->numirq <= MPS2TZ_NUMIRQ_MAX);
     if (mc->max_cpus > 1) {
-        for (i = 0; i < MPS2TZ_NUMIRQ; i++) {
+        for (i = 0; i < mmc->numirq; i++) {
             char *name = g_strdup_printf("mps2-irq-splitter%d", i);
             SplitIRQ *splitter = &mms->cpu_irq_splitter[i];
 
@@ -693,6 +696,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
     mmc->fpgaio_num_leds = 2;
     mmc->fpgaio_has_switches = false;
+    mmc->numirq = 92;
     mmc->armsse_type = TYPE_IOTKIT;
 }
 
@@ -713,6 +717,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
     mmc->fpgaio_num_leds = 2;
     mmc->fpgaio_has_switches = false;
+    mmc->numirq = 92;
     mmc->armsse_type = TYPE_SSE200;
 }
 
-- 
2.20.1

