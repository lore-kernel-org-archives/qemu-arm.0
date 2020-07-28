Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp467804lfy;
        Tue, 28 Jul 2020 03:39:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkZPny6siqgiEZuO8CUFMBEnkuBnjQFPOgoT3tWbtEcxsGddiSV+Sq2LO6mGD3ifYuSWku
X-Received: by 2002:a25:3355:: with SMTP id z82mr39052971ybz.445.1595932784633;
        Tue, 28 Jul 2020 03:39:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595932784; cv=none;
        d=google.com; s=arc-20160816;
        b=g697BPw88/CcnqEsdsU2psMw6ENfVlPZKFxIe+7mrTNP/t/jaAbxLi6S4C0Ra2yxaf
         +KVFWdp+4H7NqYkfSizMl7fN/XICBtEbgO8E+NNo0e2cAfEy26Aonuwhz4dlqVc8Yz0Q
         U6wKGv/CGHxS6q9ifHNHPxfLZz8wwwsiRCeAWUAvnqTF9cIW453VMo22ZzKLMLx6XrEx
         BiOIviQ4QbSOpcgiZkaBTkop6ii0+41ijGPixj8lPc/NbFr6WuORM25PDUPCVDdjKzDS
         hUZd2lpTpyh+iM/adcSabxlTnNo83qvQomklmwh6FUpN5RrPk7YUo1BEX/z2EnZv1LZ1
         w1NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=K3mgJCwncdqIipiYAU+wCrFh9fTPvR4OlTHmlok7qrM=;
        b=qm+D687v3dZrjCBiEOIjUEPxpA8z5NGsDzcqmQPCbKW3DOYuUXN2QlYWNdBjtN+vNu
         G1b8cEJ/pcQdLKIqhY/to61Het/oYQR+hB96mbJ5sE0dZTtxi08xtiPJvCqUZ7QHMgwS
         ukyzVLUoCcCLhENVsHCVfXK/xfTVJCwwmRc0rrtyuBm3SaGErYBuE3cQwKJI2zcyMAdk
         Eazl4360U0dkVuegypZjk2fsPT9SyVB7y0j+BzFzmRMYIQFm0fvAh08/GbymMfaDG55U
         Qov/U4g9mvHdKpwYx0QI4umDHjdT3qniQOj7ZNNSh97/4iWNDflQMO5RcZyqK+9M97nE
         lMKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hc9j+Sdm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n68si12584336ybf.148.2020.07.28.03.39.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 03:39:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hc9j+Sdm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0N1L-0006yR-WC
	for alex.bennee@linaro.org; Tue, 28 Jul 2020 06:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k0MzZ-0004lr-Iw
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 06:37:53 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k0MzX-0002lw-3g
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 06:37:53 -0400
Received: by mail-wm1-x342.google.com with SMTP id d190so204799wmd.4
 for <qemu-devel@nongnu.org>; Tue, 28 Jul 2020 03:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=K3mgJCwncdqIipiYAU+wCrFh9fTPvR4OlTHmlok7qrM=;
 b=Hc9j+SdmnOO9Yaf2c4ihvxVxBuQIhB7CHYtOAbMj1VJLNlJTx2rL3DReli7UFIxIaZ
 QkKH1I38JhE3+Sqe/K2wUU8qRCN3EyKMzB0wRqFnjm2NTCA+0qOkwD+qBA2PAm6FcMtt
 mHVS9roCEh3Rvbxb4soAAj9GOJZU/G86iJY26JuYic+tm7VqiUwtEzgAmnuxZRior7+E
 O0PIFDKe/UCHMUmc20SbH8KNxGaqP2Llaie8ci2+XMn6bILBzHZOXbD+HmQtHsHU2cPy
 /ZAafJG1W/R9F3f8YFz/N3Ob1hqDFukA8xih65RfeMg0s1l0zuJNbmpoPqutv4lz6zVz
 gF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K3mgJCwncdqIipiYAU+wCrFh9fTPvR4OlTHmlok7qrM=;
 b=qaK/9Iw3Lbmac/hZRTPIeQRxvEn4FDwEJVsawdgM+8HoYZCQe7yFgLqlYztcCc0P9S
 wF1J1KbFZsd5M1j/lKWerDUoLyGn+ejSF+dmJZ7hiUFt8Mz0Ov5xelY2OCIEisbFW1A0
 oh8gvnvuCZIxoZNDw9TYAWp4YkniphML1P0xynzz/zbcoQ69GHVXCRkLrAHmlsm5lKmR
 wepVXvD0XBr0zByD/ZbdiXfeQpwhHVQylIcaBDiooBtD0JpulbbOOcVb+F8o8zE9eHZZ
 kEubMrJcy/xj62GzmjXiTozqVmowLGQr+n/OjSCvohXp2Ly71KPO/Eh7b9FPOLD/SzpE
 +KrA==
X-Gm-Message-State: AOAM532toeeJYO/HLE8K61VDnT3bxaWK3HG/94glQkOFnmas2vHr/L6P
 QlmwQzpKEywp+K8pNjruADoIgA==
X-Received: by 2002:a1c:dc02:: with SMTP id t2mr3391892wmg.55.1595932669892;
 Tue, 28 Jul 2020 03:37:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w16sm18634657wrg.95.2020.07.28.03.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 03:37:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.1? 3/3] msf2-soc, stellaris: Don't wire up SYSRESETREQ
Date: Tue, 28 Jul 2020 11:37:44 +0100
Message-Id: <20200728103744.6909-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200728103744.6909-1-peter.maydell@linaro.org>
References: <20200728103744.6909-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mHFEbKaXk2i0

The MSF2 SoC model and the Stellaris board code both wire
SYSRESETREQ up to a function that just invokes
    qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
This is now the default action that the NVIC does if the line is
not connected, so we can delete the handling code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/msf2-soc.c  | 11 -----------
 hw/arm/stellaris.c | 12 ------------
 2 files changed, 23 deletions(-)

diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index 33ea7df342c..d2c29e82d13 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -30,7 +30,6 @@
 #include "hw/irq.h"
 #include "hw/arm/msf2-soc.h"
 #include "hw/misc/unimp.h"
-#include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 
 #define MSF2_TIMER_BASE       0x40004000
@@ -59,13 +58,6 @@ static const int spi_irq[MSF2_NUM_SPIS] = { 2, 3 };
 static const int uart_irq[MSF2_NUM_UARTS] = { 10, 11 };
 static const int timer_irq[MSF2_NUM_TIMERS] = { 14, 15 };
 
-static void do_sys_reset(void *opaque, int n, int level)
-{
-    if (level) {
-        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
-    }
-}
-
 static void m2sxxx_soc_initfn(Object *obj)
 {
     MSF2State *s = MSF2_SOC(obj);
@@ -130,9 +122,6 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
         return;
     }
 
-    qdev_connect_gpio_out_named(DEVICE(&s->armv7m.nvic), "SYSRESETREQ", 0,
-                                qemu_allocate_irq(&do_sys_reset, NULL, 0));
-
     system_clock_scale = NANOSECONDS_PER_SECOND / s->m3clk;
 
     for (i = 0; i < MSF2_NUM_UARTS; i++) {
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 28eb15c76ca..5f9d0801807 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -18,7 +18,6 @@
 #include "hw/boards.h"
 #include "qemu/log.h"
 #include "exec/address-spaces.h"
-#include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "hw/arm/armv7m.h"
 #include "hw/char/pl011.h"
@@ -1206,14 +1205,6 @@ static void stellaris_adc_init(Object *obj)
     qdev_init_gpio_in(dev, stellaris_adc_trigger, 1);
 }
 
-static
-void do_sys_reset(void *opaque, int n, int level)
-{
-    if (level) {
-        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
-    }
-}
-
 /* Board init.  */
 static stellaris_board_info stellaris_boards[] = {
   { "LM3S811EVB",
@@ -1317,9 +1308,6 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     /* This will exit with an error if the user passed us a bad cpu_type */
     sysbus_realize_and_unref(SYS_BUS_DEVICE(nvic), &error_fatal);
 
-    qdev_connect_gpio_out_named(nvic, "SYSRESETREQ", 0,
-                                qemu_allocate_irq(&do_sys_reset, NULL, 0));
-
     if (board->dc1 & (1 << 16)) {
         dev = sysbus_create_varargs(TYPE_STELLARIS_ADC, 0x40038000,
                                     qdev_get_gpio_in(nvic, 14),
-- 
2.20.1

