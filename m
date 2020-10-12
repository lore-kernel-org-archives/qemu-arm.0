Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1155450lfa;
        Mon, 12 Oct 2020 08:45:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5kzM2D9fSfUyCjKglh1SsopuNrpWGK7xdKJCHJV0Tnzu7BRNnutF7AbICCItjKc0grfn2
X-Received: by 2002:a25:86d0:: with SMTP id y16mr4706364ybm.473.1602517503260;
        Mon, 12 Oct 2020 08:45:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602517503; cv=none;
        d=google.com; s=arc-20160816;
        b=EI+VGKxRjy86rQikHWXUNeaeogcCzp2ij9Tz3hx4UO0K7U5Gv93Il4+c4S3/wcAcjT
         xBXbvrYLBUD1jN48IXrrSaTwCEhH0C4GGnncaiev5hMIHXyTxZe3L9AO6DFlKBVXocER
         H8ZJULiy2sD+FGBpKBdjWAES7LARWbgYtYAls3oM9wD7PbGvJptcOQhZDgxqG2cHPO+T
         kxJCBlTNBW/lsgIdbsj0qe1mog0CWeV7CaUuCIC0L+Ktz8L8kM7V3NKGzcwS+bnyD4Fr
         blNtWnHeg9Kh2Q20gigxt2WRsCYF7QBuJcK0w8IwJ5tlV/vwbCcgU0XAwoJ+XLvQFABG
         V3Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=K3mgJCwncdqIipiYAU+wCrFh9fTPvR4OlTHmlok7qrM=;
        b=wIuSH8Qz3AXBjozY6KU9kJHWGQ81SEO+MS614VvkPXdqdt68Hq9wRvcE4mTLBBqorD
         P1jqVoUGgGaG4567wvBoaiVko45YWhITPoqpZ/wcDQ1kgwDy8qrfTF8kd4VZgScOpoV3
         KUT3KQf02Hq5bwm3jKDVZeGiZqLNnIR6gAe7Mdq4Vtgt/1n0fNKftfWkSA+OZqWaW5Rq
         bMNAd/gznK5CWx2kmgVOBq0hof4NXA5wnOL5Wdyw+2lZeUr+ZCdyI+dACW1WQaZdTHme
         YKfnOO7ArhcbJqvzrh34qXSKndetWODXW882IZ7lbXDdBFxtxmw7DYe90jq2adeVp/bI
         lBKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Bj7+/FdZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n3si5530891ybc.327.2020.10.12.08.45.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:45:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Bj7+/FdZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kS00U-00048X-DL
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzql-0007F9-0I
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:35:00 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqV-0007M3-Rv
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:58 -0400
Received: by mail-wr1-x443.google.com with SMTP id g12so19670978wrp.10
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K3mgJCwncdqIipiYAU+wCrFh9fTPvR4OlTHmlok7qrM=;
 b=Bj7+/FdZqB9RAzExmsmOiXmF94g68Yoq7B3rRbQNJoLxARocJgq7e+/cd3Z2EB+fPL
 lpWhsjvXMp3+5/c9fVh1/3XC15ZLSRLegA8vP7gelQCXbn8DTXE5G2G2al0aUoZx70DX
 SZBB+pR9jP5nZR9pDBKsJJ6qzPoioWGFHXPGPqab0MKX6tuQoBExGuoJNybh5c/WfY06
 drAdICUToc0lzLUidzGmSPtruCnAGy6in3Gl6mK2CtVUqCzUB5pWomUcWh+QAwOqIj4U
 FGtXqmWgKaRhWOTHQCzmB+WEgVamfhGNzaS8IvUAmm2IcI82hmLbXraSs4/3Qr9WS3Hq
 s11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K3mgJCwncdqIipiYAU+wCrFh9fTPvR4OlTHmlok7qrM=;
 b=d3Z8XCTb9BAxmrLzESy5OAttzSaAjkdnvrwf2ixPcgKJAYisdAuLhV0X8BTJGWpO8j
 foKl4gEGMH4UzMFfD8AwTtffoWwmBUGKE2oyzqdJuMAGHzVKG/blPnnMBK7urfRJP1hK
 q2wWDn7ekLpeKODTVcMr170F1xpb4re7Ba6AiG8dtlBGxBsL0DTvAgWsGGa7Vi54Dxn5
 l+BoHjW9wgGvx9umYMlQsmNwYalEBB3hLzFEaty9+m1G05+ZfgAJcPiCB8DoPq5nVXQ8
 E8ZVTfTijqWjuu/or/Q3tdmNwZh7d85gbLKHemK1bg8fh7fIDNuzUe//peuECYjCb08w
 +F5g==
X-Gm-Message-State: AOAM5300Y+8HsGl4Dtzqij5NlCjksyiuH09xAIjlkOzSFEMYbAuUPlmV
 9Wia5rmyBvBvOz1Iv41peb3CltNekX6ongC4
X-Received: by 2002:a5d:6a51:: with SMTP id t17mr14288975wrw.80.1602516877958; 
 Mon, 12 Oct 2020 08:34:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] msf2-soc, stellaris: Don't wire up SYSRESETREQ
Date: Mon, 12 Oct 2020 16:33:47 +0100
Message-Id: <20201012153408.9747-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +LCJlO1+4TVO

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

