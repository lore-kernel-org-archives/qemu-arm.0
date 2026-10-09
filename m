Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E639CA601E
	for <qemu-arm@archiver.kernel.org>; Fri,  9 Oct 2026 16:26:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xFDQX-0004qI-W5; Fri, 09 Oct 2026 12:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinja.p.jankovic@gmail.com>)
 id 1xFDQW-0004nY-1g
 for qemu-arm@nongnu.org; Fri, 09 Oct 2026 12:26:32 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinja.p.jankovic@gmail.com>)
 id 1xFDQU-0004qm-3c
 for qemu-arm@nongnu.org; Fri, 09 Oct 2026 12:26:31 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5bcb3726952so2342866e87.3
 for <qemu-arm@nongnu.org>; Fri, 09 Oct 2026 09:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791563188; x=1792167988; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:sender:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=SndT5SN4q6iE57dN8O3ZxmepoZzwsh4ngSOova6VWAs=;
 b=aDOnofaCtjlKIDvSl65nN8yPQzKMNA0g2GvbF2WxKnm5ZtAhULEmpzfE7x8xOjQa+B
 PF4gie6WNgtBQGD6Bb75YPYBW+7TNhmiYFIrMZDKhdq/J7WxJODSoxnI9Ktj9HwM31B1
 /ADnuDf1at30N9NKV0MmP3MlHtPIa86dxO1toJsppgdydV9a7PeJ36EbrhbZVRYu6x8q
 VtAp23EAYx/AQGrT+fW2h92rn9iFrVEj4mTMZlteprSyOI6H5+s7uGfyS63D4umQv/cW
 0YIBTLBdu+Z/IibxDtIIEJ3bSADCA6dOdAwo0FKNBMOZmDihuSpEYESTcZU49+7RQV+K
 Zk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791563188; x=1792167988;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=SndT5SN4q6iE57dN8O3ZxmepoZzwsh4ngSOova6VWAs=;
 b=vd/x+1lxD60U6JAbg3uJWZZy442N7nYaDCwGAVG1DkSAHYZZUzG3uV38frGVhCDqUN
 PGVIkwUgp9aiyDc5KIbnkQ+oxNSM8n9FUE0eHAbYxW7ojZBEHnZzVtE0dNAnhnhILsE7
 ikhmP+Vv2Ntdodu6Mvae6YMFmvDPjD4oZJGuRAwXK8qKkVLS+dHtv/eK0uKhF5TXqtBA
 Q7TvA+iEU/b0vm7xNUdoXFpWGfAVmrzCT8HjoQypdQW30TFBrqOGc+PtNAkpwfqLkEsS
 8mIRw0149wV1+zwJFHsX3sLo/BwJXxi2TmSiUd4Cjlb9mHV6fnmYjU2th4vDZqZ7Wyh+
 tEdA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzr5mkisiWwiz0anNqFAIbo2KjIKNMnYAr7Oboh91mgjAVpwomHjH56wLFdrNBHzuEnoGyffz7QoQ==@nongnu.org
X-Gm-Message-State: AFq9FYIkU0ySWzMxPznkpwmRzu++V5284NNZyzHNOXOxNoNNtRaA17hE
 yQURlO5WobP+LIoTd/kxHTbXbwC9C7cbU4cz1BFCcngtT4jDdA/WX+fG
X-Gm-Gg: AYBFou2a1+NZrOUzk1DX4ocddiffcaYvVlopvgiFKR2wpUfXVApvOA5vI6+UInZPc7L
 DaUsdIKSEqnoZ+KFwOrHMzyFi719JdUCOooihUNFYGER9iugSFXcCIpgdbeVWLIAgObMcaa+qxV
 fLBeYo8R81FM+f3mNfVl81unUyJkzain9UASPEaI0AA5EUPOG8vLLJJ+zrdsB3O2pF+ynKPNuZT
 RqO8Z861uHKXs91quTCSig4ciqQOCWuR+cCkxZMW8aANyn39Ge0J/DCZEQydCQRzpvMAGsRnbd/
 SvEDTDree6ttgnbb5biWtgRFzsrGTXzUHbyVXZRGDrWcgz1ivIreOq8KqQcYMnZ7/ZPHIXmpP50
 APedAtzaWbRJHwg1nf7qLsnV2vJJyFrqQK+vp9W5lvemiPnXGK0oY87GovXWnMeAW27zSPTupY1
 X6WuJYKG2F4W+VPjEolJcrUfZV4mJVEht1J77eW3wnKTt2HMKqjTD/CrHo3JD0eI1rufrUaVST4
 nMB1OjJA6cCtzQazEXbfkKPU0Q93hjsJon87Pn+6QZQqDgxgBIIomO417ia
X-Received: by 2002:a05:6512:3d8a:b0:5b8:f048:473d with SMTP id
 2adb3069b0e04-5bcde35cad4mr850058e87.7.1791563187707; 
 Fri, 09 Oct 2026 09:26:27 -0700 (PDT)
Received: from [192.168.31.141] (213-65-111-204-no600.tbcn.telia.com.
 [213.65.111.204]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5bce5bce999sm240217e87.79.2026.10.09.09.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 09:26:27 -0700 (PDT)
From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Date: Fri, 09 Oct 2026 18:26:09 +0200
Subject: [PATCH 1/2] hw/gpio: Add EINT CFG to Allwinner GPIO, fix interrupt
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-allwinner-gpio-eint-v1-1-c55d2958ae0b@gmail.com>
References: <20261009-allwinner-gpio-eint-v1-0-c55d2958ae0b@gmail.com>
In-Reply-To: <20261009-allwinner-gpio-eint-v1-0-c55d2958ae0b@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
X-Mailer: b4 0.14.3
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=strahinja.p.jankovic@gmail.com; helo=mail-lf1-x12e.google.com
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

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
---
 hw/gpio/allwinner-gpio.c              | 19 ++++++++++++++-----
 include/hw/gpio/allwinner-gpio-regs.h |  5 +----
 2 files changed, 15 insertions(+), 9 deletions(-)

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

-- 
2.56.0


