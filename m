Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49117CCF2C9
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 09:16:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI0Wa-0004Oa-Cr; Sat, 17 Oct 2026 05:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinja.p.jankovic@gmail.com>)
 id 1xI0WM-0004Me-Tc
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 05:16:09 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinja.p.jankovic@gmail.com>)
 id 1xI0WJ-0001fY-NS
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 05:16:06 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5be47aa555cso728484e87.3
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 02:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792228561; x=1792833361; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:sender:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=XabNco4fHbGNpg34t8je7iOzxvV1puOHb7Nk47Y3M1c=;
 b=Icwnjv6sGjioLyHJYGtgrS83sgLHOhULwLw4obaOZgtMMemFbf06NRKgz+UtcQ1gDS
 8wsPjTGXKprf6vxQkrp8/bnPXDlmyiHkFIyvqpJiG8055iCg7Ruyfag/1nKqE3/edyqO
 AtETn7V7xiaf5TT093VBQlQATUTIw7JpJZCOiCYLD9OgpGKdLIA3mYfo+IcHdywUoSY7
 A1bCKuOoUleaD4ZKuLd8anw51VDfKP92Yk+vQGol0qouPLlMu/43pG6z4g3iFygu6mMf
 zY11Ks+hmx5QsVAobU+m2HM0TkdCJ4OZ3C+5LPmvwYFaBX7/3IDlvqmaSLJcUID/HImi
 Xg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792228561; x=1792833361;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XabNco4fHbGNpg34t8je7iOzxvV1puOHb7Nk47Y3M1c=;
 b=BcSOcobCkPCXgGE/p1+GNPn9w5GqS2rHneve0deflGRSVeiAGTZxHOmN8lPYL4avJ7
 QRyI41g9DGEeQmlXs2UknMELn+MiyJIRQyYro7MUTysuNQ6TcuYwkqZEVWPmLdJA1Fmu
 AtxhDqKUP9wIfGxOmmyiWCQRkDr7XwBeRuoicKM6zjcOGhaX1mrlKDRejhVIGU3Zx4rm
 +jiM9phGxHugSQj1ZBPUACaj+8lLHocXOOsw0JKgll0N2YHIop6xmZZ1S0UgIdD01ToT
 ESdRRAbEBR04shB/q9i6rAUiIWJowcKkMaFkH5ShZNY9ceyrjKjwl9HCn6QD4or/5Wr3
 dH9Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBzIJ7PhrCuzh4vTuV/N/OEWQTle1ssAQ5HAkOQtRyO6L+VVjC3rM73CBXZ8bACXPkEldff9fue3Cg==@nongnu.org
X-Gm-Message-State: AFq9FYIe1/YVyxhpYsbZwR1pOKPaVtP179o0MnPQ/fb5LAvstfPeW18F
 5pJntkdG5Igi1Ud4d89mQkppFtyw71DvBVnlNEp0GDls1DvLPSvm2Vmy
X-Gm-Gg: AYBFou1++SqvAsMAljyW4cYyZXpyAWrrKBdAOAaxQqwRLYtak6sh0JLGbP/qhxwoAB1
 DP0NDes2ha5gCEKVFlEbZWDEB/C3LHXWevov7QLkxSTaDuReUN+pfzkYmejGXS639eKkHh3uUGF
 ajMIC11j5e24A8YJ3kZEDMDTkGD34q8YLINuvnEMxO1qgoeLUQf6eMtc39J6sMHcFPpkC4hRg1E
 HoJC9IywlIU2/8HMX9pI98T5PS8r2Ut7GUDzLVsnNR1mmHu8wkERrnoZnwdYeaOwCw9wGNZ22pH
 Llm1MZZTeRHOAMV6iHmHN144yCPZXxs5eSazu9l28syaZwWht3Qc1ZnJn/JBaG1N58ELe0GGms7
 PwJYXgOh9/+rt5psstfPmB5x97JDR6b0ZXbQZsdB32OmPBuv2vKek41NoyRJQdwK+yaPal7T0en
 hOQ61jfbI8hcS5B4poTt1d4i4xKuZDZrmisP1WI17ZNH/bV1x512ZFSxZucksIoOGc/0WjytarA
 5gngy5lQvXyloOBG0BIsu8WM4+VqpDAw7EuCbcHMgUNP9noQ3I8+aHaWkg=
X-Received: by 2002:a05:6512:1396:b0:5b7:6590:a8e0 with SMTP id
 2adb3069b0e04-5be50a886b8mr655881e87.57.1792228560414; 
 Sat, 17 Oct 2026 02:16:00 -0700 (PDT)
Received: from [192.168.31.141] (213-65-111-204-no600.tbcn.telia.com.
 [213.65.111.204]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5be4a633f54sm853132e87.60.2026.10.17.02.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Oct 2026 02:15:59 -0700 (PDT)
From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Date: Sat, 17 Oct 2026 11:15:32 +0200
Subject: [PATCH v2 1/2] hw/gpio: Add EINT CFG to Allwinner GPIO, fix
 interrupt handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-allwinner-gpio-eint-v2-1-82906f440378@gmail.com>
References: <20261017-allwinner-gpio-eint-v2-0-82906f440378@gmail.com>
In-Reply-To: <20261017-allwinner-gpio-eint-v2-0-82906f440378@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
X-Mailer: b4 0.14.3
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=strahinja.p.jankovic@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The original Allwinner GPIO implementation assumed pin had to be
configured as input (CFG 0x0) in order to be able to handle interrupts
on interrupt-capable pins.
However, libgpiod configures those pins in EINT mode (CFG 0x06) when
gpiomon is used, so this patch fixes interrupt path to expect pin
configuration to be set to EINT.

Also update interrupt handling tests for the correct functionality.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
---
 hw/gpio/allwinner-gpio.c              | 19 ++++++++++++++-----
 include/hw/gpio/allwinner-gpio-regs.h |  5 +----
 tests/qtest/allwinner-gpio-test.c     | 30 +++++++++++++++---------------
 3 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/hw/gpio/allwinner-gpio.c b/hw/gpio/allwinner-gpio.c
index e3bda7cb76..19176e7c56 100644
--- a/hw/gpio/allwinner-gpio.c
+++ b/hw/gpio/allwinner-gpio.c
@@ -114,7 +114,7 @@ static inline bool gpio_is_output(AWPortMap *port, uint32_t pin)
     uint32_t cfg_n = pin / CFG_PINS_PER_REG;
     uint32_t pin_shift = (pin % CFG_PINS_PER_REG) * CFG_PIN_STRIDE;
     return (extract32(port->cfg[cfg_n], pin_shift, CFG_PIN_STRIDE - 1) ==
-        CFG_OUTPUT_MASK);
+        AW_GPIO_CFG_OUT);
 }
 
 static inline bool gpio_is_input(AWPortMap *port, uint32_t pin)
@@ -122,7 +122,15 @@ static inline bool gpio_is_input(AWPortMap *port, uint32_t pin)
     uint32_t cfg_n = pin / CFG_PINS_PER_REG;
     uint32_t pin_shift = (pin % CFG_PINS_PER_REG) * CFG_PIN_STRIDE;
     return (extract32(port->cfg[cfg_n], pin_shift, CFG_PIN_STRIDE - 1) ==
-        CFG_INPUT_MASK);
+        AW_GPIO_CFG_IN);
+}
+
+static inline bool gpio_is_eint(AWPortMap *port, uint32_t pin)
+{
+    uint32_t cfg_n = pin / CFG_PINS_PER_REG;
+    uint32_t pin_shift = (pin % CFG_PINS_PER_REG) * CFG_PIN_STRIDE;
+    return (extract32(port->cfg[cfg_n], pin_shift, CFG_PIN_STRIDE - 1) ==
+        AW_GPIO_CFG_EINT);
 }
 
 static inline int int_ctl_cfg(AWGPIOState *s, int irq_line)
@@ -155,8 +163,8 @@ static void allwinner_gpio_set_int_line(AWGPIOState *s, int port,
         return;
     }
 
-    /* if this signal isn't configured as an input signal, nothing to do */
-    if (!gpio_is_input(&o->ports[port], line)) {
+    /* if this signal isn't configured as an EINT, nothing to do */
+    if (!gpio_is_eint(&o->ports[port], line)) {
         return;
     }
 
@@ -225,7 +233,8 @@ static void allwinner_gpio_set(void *opaque, int port, int line, int level)
     AWPortsOverlay *o = (AWPortsOverlay *)s->regs;
     AWGPIOLevel aw_level = level ? AW_GPIO_LEVEL_HIGH : AW_GPIO_LEVEL_LOW;
 
-    if (gpio_is_input(&o->ports[port], line)) {
+    if (gpio_is_input(&o->ports[port], line) ||
+        gpio_is_eint(&o->ports[port], line)) {
 
         trace_allwinner_gpio_set(portname(port), line, aw_level);
 
diff --git a/include/hw/gpio/allwinner-gpio-regs.h b/include/hw/gpio/allwinner-gpio-regs.h
index a435b87ec4..5e969c23f6 100644
--- a/include/hw/gpio/allwinner-gpio-regs.h
+++ b/include/hw/gpio/allwinner-gpio-regs.h
@@ -73,9 +73,6 @@ static const AWPortResetVals aw_gpio_port_reset[] = {
 #define DEFAULT_DRV_MASK    0xffffffff
 #define DEFAULT_PUL_MASK    0xffffffff
 
-#define CFG_INPUT_MASK      0x0
-#define CFG_OUTPUT_MASK     0x1
-#define CFG_IO_MASK         0x1
 #define CFG_PIN_STRIDE      4
 #define CFG_PINS_PER_REG    (AW_GPIO_PIN_COUNT / CFG_PIN_STRIDE)
 
@@ -172,7 +169,7 @@ typedef enum AWGPIOLevel {
 typedef enum AWGPIOCfg {
     AW_GPIO_CFG_IN = 0,
     AW_GPIO_CFG_OUT = 1,
-    AW_GPIO_CFG_FUN = 2,
+    AW_GPIO_CFG_EINT = 6,
 } AWGPIOCfg;
 
 typedef enum AWGPIOIrqCfg {
diff --git a/tests/qtest/allwinner-gpio-test.c b/tests/qtest/allwinner-gpio-test.c
index c048f0f88b..7ad89f6e0a 100644
--- a/tests/qtest/allwinner-gpio-test.c
+++ b/tests/qtest/allwinner-gpio-test.c
@@ -251,9 +251,9 @@ static void test_irq_pin_rising(const void *data)
 
     qtest_irq_intercept_in(s, "/machine/soc");
 
-    /* Configure as input and set pin low */
-    update_cfg_reg(s, gpio_port, port_pin, AW_GPIO_CFG_IN);
-    assert_cfg_regval(s, gpio_port, port_pin, AW_GPIO_CFG_IN);
+    /* Configure as EINT and set pin low */
+    update_cfg_reg(s, gpio_port, port_pin, AW_GPIO_CFG_EINT);
+    assert_cfg_regval(s, gpio_port, port_pin, AW_GPIO_CFG_EINT);
     qtest_set_irq_in(s,
                      "/machine/soc/gpio", in_name, port_pin,
                      AW_GPIO_LEVEL_LOW);
@@ -296,9 +296,9 @@ static void test_irq_pin_falling(const void *data)
 
     qtest_irq_intercept_in(s, "/machine/soc");
 
-    /* Configure as input and set pin high */
-    update_cfg_reg(s, gpio_port, port_pin, AW_GPIO_CFG_IN);
-    assert_cfg_regval(s, gpio_port, port_pin, AW_GPIO_CFG_IN);
+    /* Configure as EINT and set pin high */
+    update_cfg_reg(s, gpio_port, port_pin, AW_GPIO_CFG_EINT);
+    assert_cfg_regval(s, gpio_port, port_pin, AW_GPIO_CFG_EINT);
     qtest_set_irq_in(s,
                      "/machine/soc/gpio", in_name, port_pin,
                      AW_GPIO_LEVEL_HIGH);
@@ -341,9 +341,9 @@ static void test_irq_pin_high_level(const void *data)
 
     qtest_irq_intercept_in(s, "/machine/soc");
 
-    /* Configure as input and set pin low */
-    update_cfg_reg(s, gpio_port, port_pin, AW_GPIO_CFG_IN);
-    assert_cfg_regval(s, gpio_port, port_pin, AW_GPIO_CFG_IN);
+    /* Configure as EINT and set pin low */
+    update_cfg_reg(s, gpio_port, port_pin, AW_GPIO_CFG_EINT);
+    assert_cfg_regval(s, gpio_port, port_pin, AW_GPIO_CFG_EINT);
     qtest_set_irq_in(s,
                      "/machine/soc/gpio", in_name, port_pin,
                      AW_GPIO_LEVEL_LOW);
@@ -394,9 +394,9 @@ static void test_irq_pin_low_level(const void *data)
 
     qtest_irq_intercept_in(s, "/machine/soc");
 
-    /* Configure as input and set pin high */
-    update_cfg_reg(s, gpio_port, port_pin, AW_GPIO_CFG_IN);
-    assert_cfg_regval(s, gpio_port, port_pin, AW_GPIO_CFG_IN);
+    /* Configure as EINT and set pin high */
+    update_cfg_reg(s, gpio_port, port_pin, AW_GPIO_CFG_EINT);
+    assert_cfg_regval(s, gpio_port, port_pin, AW_GPIO_CFG_EINT);
     qtest_set_irq_in(s,
                      "/machine/soc/gpio", in_name, port_pin,
                      AW_GPIO_LEVEL_HIGH);
@@ -447,9 +447,9 @@ static void test_irq_pin_both_edge(const void *data)
 
     qtest_irq_intercept_in(s, "/machine/soc");
 
-    /* Configure as input and set pin low */
-    update_cfg_reg(s, gpio_port, port_pin, AW_GPIO_CFG_IN);
-    assert_cfg_regval(s, gpio_port, port_pin, AW_GPIO_CFG_IN);
+    /* Configure as EINT and set pin low */
+    update_cfg_reg(s, gpio_port, port_pin, AW_GPIO_CFG_EINT);
+    assert_cfg_regval(s, gpio_port, port_pin, AW_GPIO_CFG_EINT);
     qtest_set_irq_in(s,
                      "/machine/soc/gpio", in_name, port_pin,
                      AW_GPIO_LEVEL_LOW);

-- 
2.56.0


