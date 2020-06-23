Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3871273lfm;
        Tue, 23 Jun 2020 00:30:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjuSaRoFzuU63KAPlmAIB8JbFW6Bg6H1mYB3DT6/yfMD8dqVjQb/FAaElKIo+I8KX8SNAh
X-Received: by 2002:a25:3610:: with SMTP id d16mr35670624yba.213.1592897422337;
        Tue, 23 Jun 2020 00:30:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592897422; cv=none;
        d=google.com; s=arc-20160816;
        b=JPfqxjBDXH8kcEgKXHq3EGg8PW+Q8Uu6n9cwfAdYgrjBaZsp6/1eJ0mi121+JsFYsk
         5ChDw8CO4O8H3a52f8g4AibYzi3V8/dOG+JRobMgv6JcVU1anACM+k8UsKWbtRd8iOTY
         +V2+laFC4duKINtooddwtp4fhG3gu4c7apjMLSY+FUDPXekampnkldlgQOcHIARz0MCL
         7muoGYvWKdpNcwnopYOwT+wARYE83PzZZ0VhavtgKq2baDam5Ci2hxm/S3nnyaZkSgQ2
         L919ZN33HlF+CsNs6G2tWXkTA8KFVNYs1w243ZeroUohBZlyGHwLYeK5FOqG4HnkFEVs
         OC4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SnIqSjyF8YgQb0Itmn2YtSwizey6mNlLT4qxz0zJ7Rc=;
        b=XeEaEyD/4xxp8TEfhVuQNxalfEf+fLbBjKJBBPqkpm0YQTIOv40aOhC9QHMW+rH/yf
         MItiWhV1+9VM77ZOx+2ME3pW2kMwMxdTGIgXw7IPzQuI/fktWXVBKwDEhDc04vLu5wXA
         tlDZ8rJYmB+hrawhrbApcEqMSfSzwqD3hQlezu6XDVMGL1S5I4syf+3iQKm9VkdtaDeq
         zK+BuT+V8ihCpSQnBq948eOisZBA8cr7kAnt2Aa4qABOKtie8296/BcP+UlBNe+VQ4xv
         q6MQCiu3L6X2OkNXXhVMHWfh8XcWPUkiLxBwu6F0oWgWgT2PotTiAi+DkkguKgQtvi49
         vB2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eUT9yIAp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i127si19066217ybb.475.2020.06.23.00.30.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 00:30:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eUT9yIAp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:50808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jndNt-0003ri-N2
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 03:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jndLF-0007LR-8K; Tue, 23 Jun 2020 03:27:37 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jndLD-00051d-Am; Tue, 23 Jun 2020 03:27:36 -0400
Received: by mail-wr1-x441.google.com with SMTP id h5so19388043wrc.7;
 Tue, 23 Jun 2020 00:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SnIqSjyF8YgQb0Itmn2YtSwizey6mNlLT4qxz0zJ7Rc=;
 b=eUT9yIApTa+vp18YjW0FB5TJrWqwLssVWLj+Mb5SAm1kXflefPXtX7TKZzXtlGwF9H
 YbIbruo+dh9fuzu5oBGh+hKXnxJ3XQ68vwbKA8kUdHaqwjQFRo0karDr/XiHEj0WluEA
 8MJO9AiMzbUT8O3nddPMdu1wp3fSG+JRYrgKus10Vfj4y8q2yyBUJD7+sbGMxmw/pD0n
 83RmyMWm0NMDLtPBOx2i04R8CJfHxdmuj9/iYRcTRvXP8yROy6VHFd4RGWE9pfjkeekK
 ozoO3V7n4+twOMBLgWAlmIUhbQHf3ohLZ8Zg6uG9ohl4ajhjvREAOEx20FjHNdKNLGY9
 KXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SnIqSjyF8YgQb0Itmn2YtSwizey6mNlLT4qxz0zJ7Rc=;
 b=mD/DV0OhPj4LA+H8OBg7y8t5oJaCr0htqU51aqdtcY+ikqKA3c64hlxeSho26YdjWO
 PVaX+95aWtTJ42OZeuHAavUMVl8NrG2vhrPwjuYVgr45XLOI14YAmQqf+mI6tvZhitlf
 Scw8Q8RzXKWvN2ETenVTD0geiMkcfDLtXgUxWy2FaD/lpuadP81vznVvV2NUI09tooAo
 GT6Yah1AWp5m5hhl9fU5mW9L6LrxJMlr39svoA63lugMDxDwR5iyo1AYlo6kb1MbvvwR
 ZK6UFosfB6h+3GP/sVZANznNQLnzHr1smyW2qugXx2H/ZdZ44h3Uy2WFibfNiI9CZaHT
 IPQg==
X-Gm-Message-State: AOAM5323xrjX+hNVsn1bUuCqDJokK8Aw95kLRqRZ3kGXd8bqk3Fvybgm
 w9dKsrYoXevIgxSE6/+DR04tlKMu
X-Received: by 2002:a5d:55cf:: with SMTP id i15mr11750860wrw.204.1592897253339; 
 Tue, 23 Jun 2020 00:27:33 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id l14sm4200059wrn.18.2020.06.23.00.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 00:27:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 6/9] hw/misc/pca9552: Trace GPIO High/Low events
Date: Tue, 23 Jun 2020 09:27:20 +0200
Message-Id: <20200623072723.6324-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200623072723.6324-1-f4bug@amsat.org>
References: <20200623072723.6324-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YMU6n5QbxW8w

Add a trivial representation of the PCA9552 GPIOs.

Example booting obmc-phosphor-image:

  $ qemu-system-arm -M witherspoon-bmc -trace pca955x_gpio_status
  1592689902.327837:pca955x_gpio_status pca-unspecified GPIOs 0-15 [*...............]
  1592689902.329934:pca955x_gpio_status pca-unspecified GPIOs 0-15 [**..............]
  1592689902.330717:pca955x_gpio_status pca-unspecified GPIOs 0-15 [***.............]
  1592689902.331431:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****............]
  1592689902.332163:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........*..]
  1592689902.332888:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........**.]
  1592689902.333629:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........***]
  1592690032.793289:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........*.*]
  1592690033.303163:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........***]
  1592690033.812962:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........*.*]
  1592690034.323234:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........***]
  1592690034.832922:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........*.*]

We notice the GPIO #14 (front-power LED) starts to blink.

This LED is described in the witherspoon device-tree [*]:

  front-power {
      retain-state-shutdown;
      default-state = "keep";
      gpios = <&pca0 14 GPIO_ACTIVE_LOW>;
  };

[*] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts?id=b1f9be9392f0#n140

Suggested-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/pca9552.c    | 39 +++++++++++++++++++++++++++++++++++++++
 hw/misc/trace-events |  3 +++
 2 files changed, 42 insertions(+)

diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index 2cc52b0205..41f8ad213d 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -13,12 +13,14 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qemu/bitops.h"
 #include "hw/qdev-properties.h"
 #include "hw/misc/pca9552.h"
 #include "hw/misc/pca9552_regs.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
+#include "trace.h"
 
 typedef struct PCA955xClass {
     /*< private >*/
@@ -49,6 +51,39 @@ static uint8_t pca955x_pin_get_config(PCA955xState *s, int pin)
     return extract32(s->regs[reg], shift, 2);
 }
 
+/* Return INPUT status (bit #N belongs to GPIO #N) */
+static uint16_t pca955x_pins_get_status(PCA955xState *s)
+{
+    return (s->regs[PCA9552_INPUT1] << 8) | s->regs[PCA9552_INPUT0];
+}
+
+static void pca955x_display_pins_status(PCA955xState *s,
+                                        uint16_t previous_pins_status)
+{
+    PCA955xClass *k = PCA955X_GET_CLASS(s);
+    uint16_t pins_status, pins_changed;
+    int i;
+
+    pins_status = pca955x_pins_get_status(s);
+    pins_changed = previous_pins_status ^ pins_status;
+    if (!pins_changed) {
+        return;
+    }
+    if (trace_event_get_state_backends(TRACE_PCA955X_GPIO_STATUS)) {
+        char *buf = g_newa(char, k->pin_count + 1);
+
+        for (i = 0; i < k->pin_count; i++) {
+            if (extract32(pins_status, i, 1)) {
+                buf[i] = '*';
+            } else {
+                buf[i] = '.';
+            }
+        }
+        buf[i] = '\0';
+        trace_pca955x_gpio_status(s->description, buf);
+    }
+}
+
 static void pca955x_update_pin_input(PCA955xState *s)
 {
     PCA955xClass *k = PCA955X_GET_CLASS(s);
@@ -98,6 +133,8 @@ static uint8_t pca955x_read(PCA955xState *s, uint8_t reg)
 
 static void pca955x_write(PCA955xState *s, uint8_t reg, uint8_t data)
 {
+    uint16_t pins_status;
+
     switch (reg) {
     case PCA9552_PSC0:
     case PCA9552_PWM0:
@@ -110,8 +147,10 @@ static void pca955x_write(PCA955xState *s, uint8_t reg, uint8_t data)
     case PCA9552_LS1:
     case PCA9552_LS2:
     case PCA9552_LS3:
+        pins_status = pca955x_pins_get_status(s);
         s->regs[reg] = data;
         pca955x_update_pin_input(s);
+        pca955x_display_pins_status(s, pins_status);
         break;
 
     case PCA9552_INPUT0:
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 5561746866..9282c60dd9 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -206,3 +206,6 @@ via1_rtc_cmd_pram_sect_write(int sector, int offset, int addr, int value) "secto
 # grlib_ahb_apb_pnp.c
 grlib_ahb_pnp_read(uint64_t addr, uint32_t value) "AHB PnP read addr:0x%03"PRIx64" data:0x%08x"
 grlib_apb_pnp_read(uint64_t addr, uint32_t value) "APB PnP read addr:0x%03"PRIx64" data:0x%08x"
+
+# pca9552.c
+pca955x_gpio_status(const char *description, const char *buf) "%s GPIOs 0-15 [%s]"
-- 
2.21.3

