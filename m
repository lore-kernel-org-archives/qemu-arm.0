Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1873428lfm;
        Sat, 20 Jun 2020 16:02:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqDuYXpQa3QJAf+MlX4UPYayOE+fN3xV53kahH6mVagnWtVv7Pw4ZQd4uk3z3RT7fBG/gi
X-Received: by 2002:a25:cfd6:: with SMTP id f205mr16402104ybg.363.1592694173042;
        Sat, 20 Jun 2020 16:02:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592694173; cv=none;
        d=google.com; s=arc-20160816;
        b=kwXwxb8e8VMfCXL+ztjoPNK6w2O0sxH/+qMAmXyVFyHdph616MF+8c1/Ha+sDolMOo
         0qJgerQYodgmB8djp3z3UjfbNJwPXZ/+IYzXL/EqUz5g6wJ60/Lvb8QHNF6ILkYa295A
         MJtaJD3gkVQvq0U/XFJbFzhEukhkwTXcW9D6BhQMZlE0eeYl30KSiDMHvdFm4QRyODpa
         O3NqRbJXAJQ7vDiYs9VgDWFX4jme4ElL8q+NhJ8vIgWm6Lan9Xc7MfAlFHUDeoqnYhG6
         o4J14L7cimZnq2dx1CDMHx5DY/48NEnJfuY1ilRWe1lS6DH0EkYrGRsKPc3mV0BXyAz5
         54Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SiT2334pLV4XCYraQE2kkHCbieDQYd9kjZYL7o8p/6E=;
        b=fEbojrB9W57Y49pKswIs0CdRKkSAi92VJlhIF7XZ2zp/bRT+XsVW2RGg1cFnNDGunV
         pUvqO9cXuhfq96ZeYJmuSaA523G+GjnAo3E9K6JyuaL/0tZxA/qhiPVH5xcABogDVvqi
         UEwczaCUcPDPwlP4284xmvC8u4xZNXLsMO7Oph1wytJ8t8+F27fvEZLWH27vXYWBpaRG
         MrcedJ5AZ6ViHQuP4w1qJZzbd95hfNz3gRvh2pw7MNVZ8Q1zcM2nlySFgU/DASQqmzaK
         ETwcdbR7KwQcd73FodOEoCmCJLsGUntzQMgf7YLPGPGmIHG5G0vuUgUEOdpYcYyCf4sN
         Agzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oxjuPb+o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b15si9289146ybr.243.2020.06.20.16.02.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Jun 2020 16:02:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oxjuPb+o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmmVg-0006zw-D0
	for alex.bennee@linaro.org; Sat, 20 Jun 2020 19:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmmS4-0000u0-0b; Sat, 20 Jun 2020 18:59:08 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:36678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmmS2-0000yT-5A; Sat, 20 Jun 2020 18:59:07 -0400
Received: by mail-wr1-x442.google.com with SMTP id k6so677798wrn.3;
 Sat, 20 Jun 2020 15:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SiT2334pLV4XCYraQE2kkHCbieDQYd9kjZYL7o8p/6E=;
 b=oxjuPb+oFP+7OsIJTJnwVIbV0sH+lq7Go+H+H+7up5NCwICr065ZZ1+Ai8xRzBRdkc
 XZj2ceJ+Jun6Uqb7fp0r4lCYfELrnLXwNJZDof4q0J2RUzuFl/hloend+OyuSlBUD9hS
 aQsE8z6OpCNOH9c6EQyLanoa83sEfet3nmMdH4d9OIj60ZWOs3TDLRjIQG6vqd6zcyFp
 xJnnWc+TZqm0HqmH1Dz+FhjKPEZ6aBWUnvG/88me5X606doKmdEjq3CU3UI1YNliJXUn
 /UfpfpSWTtUBE+ClQZWpD/ai4TTrYTr5yWsgBVl4pJEB+4u8eFRYzJve3ymGcGfjLwz1
 piVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SiT2334pLV4XCYraQE2kkHCbieDQYd9kjZYL7o8p/6E=;
 b=M+KRJM0J78j5rivS73lm0btT7DPXto5r0DefY+8GTQOA3uiEHEcKG616ZRye1/h1Ax
 tWgCeblxiGic/oZ6DQ9YJE1OUl4rXml6UCaNaVC/rxtvoI6zFAOcdYob60ifMWk4VCDM
 4cuau4WMIGHXt7xhSWtgL8tPNaRpxNnloM1AcgcWMf5+60blS/HiSi76QUvcJ8J25fsl
 JyU15zv28dQE24ZwPu4APMpcBDWmq7HM1ZPXXbBa5P4Z4ARgx+UyygPFcLZVcbpq1ybh
 PaGZ781tw1ETDX0++k/fZboxxm4IwdakgZXTYcJN6uFe9RpsrDdZdO17i4Qo6oHYE1zK
 4iyQ==
X-Gm-Message-State: AOAM531m0QDabsl674wVhBAvtIDsET9qWf3qCFcS15FvxJRyuSkRJNxK
 t0VsgYrPnHV0qpyOqXIqlS2bOa4f
X-Received: by 2002:a5d:6b83:: with SMTP id n3mr11121629wrx.395.1592693943203; 
 Sat, 20 Jun 2020 15:59:03 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id x18sm11147127wmi.35.2020.06.20.15.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 15:59:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/8] hw/misc/pca9552: Trace GPIO High/Low events
Date: Sun, 21 Jun 2020 00:58:51 +0200
Message-Id: <20200620225854.31160-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200620225854.31160-1-f4bug@amsat.org>
References: <20200620225854.31160-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dW47xtjHx0o2

Add a trivial representation of the PCA9552 GPIOs.

Example booting obmc-phosphor-image:

  $ qemu-system-arm -M witherspoon-bmc -trace pca9552_gpio_status
  1592689902.327837:pca9552_gpio_status pca-unspecified GPIOs 0-15 [*...............]
  1592689902.329934:pca9552_gpio_status pca-unspecified GPIOs 0-15 [**..............]
  1592689902.330717:pca9552_gpio_status pca-unspecified GPIOs 0-15 [***.............]
  1592689902.331431:pca9552_gpio_status pca-unspecified GPIOs 0-15 [****............]
  1592689902.332163:pca9552_gpio_status pca-unspecified GPIOs 0-15 [****.........*..]
  1592689902.332888:pca9552_gpio_status pca-unspecified GPIOs 0-15 [****.........**.]
  1592689902.333629:pca9552_gpio_status pca-unspecified GPIOs 0-15 [****.........***]
  1592690032.793289:pca9552_gpio_status pca-unspecified GPIOs 0-15 [****.........*.*]
  1592690033.303163:pca9552_gpio_status pca-unspecified GPIOs 0-15 [****.........***]
  1592690033.812962:pca9552_gpio_status pca-unspecified GPIOs 0-15 [****.........*.*]
  1592690034.323234:pca9552_gpio_status pca-unspecified GPIOs 0-15 [****.........***]
  1592690034.832922:pca9552_gpio_status pca-unspecified GPIOs 0-15 [****.........*.*]

We notice the GPIO #14 (front-power LED) starts to blink.

This LED is described in the witherspoon device-tree [*]:

  front-power {
      retain-state-shutdown;
      default-state = "keep";
      gpios = <&pca0 14 GPIO_ACTIVE_LOW>;
  };

[*] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts?id=b1f9be9392f0#n140

Suggested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/pca9552.h |  1 +
 hw/misc/pca9552.c         | 29 +++++++++++++++++++++++++++++
 hw/misc/trace-events      |  3 +++
 3 files changed, 33 insertions(+)

diff --git a/include/hw/misc/pca9552.h b/include/hw/misc/pca9552.h
index c5be7f1c5e..755be2e8e5 100644
--- a/include/hw/misc/pca9552.h
+++ b/include/hw/misc/pca9552.h
@@ -26,6 +26,7 @@ typedef struct PCA9552State {
     uint8_t pointer;
 
     uint8_t regs[PCA9552_NR_REGS];
+    uint16_t pins_status; /* Holds latest INPUT0 & INPUT1 status */
     uint8_t max_reg;
     char *description; /* For debugging purpose only */
     uint8_t nr_leds;
diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index 54ccdcf6d4..f0d435e310 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -12,12 +12,14 @@
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
 
 #define PCA9552_LED_ON   0x0
 #define PCA9552_LED_OFF  0x1
@@ -34,6 +36,32 @@ static uint8_t pca9552_pin_get_config(PCA9552State *s, int pin)
     return extract32(s->regs[reg], shift, 2);
 }
 
+static void pca9552_display_pins_status(PCA9552State *s)
+{
+    uint16_t pins_status, pins_changed;
+    int i;
+
+    pins_status = (s->regs[PCA9552_INPUT1] << 8) | s->regs[PCA9552_INPUT0];
+    pins_changed = s->pins_status ^ pins_status;
+    if (!pins_changed) {
+        return;
+    }
+    s->pins_status = pins_status;
+    if (trace_event_get_state_backends(TRACE_PCA9552_GPIO_STATUS)) {
+        char buf[PCA9552_PIN_COUNT + 1];
+
+        for (i = 0; i < s->nr_leds; i++) {
+            if (extract32(pins_status, i, 1)) {
+                buf[i] = '*';
+            } else {
+                buf[i] = '.';
+            }
+        }
+        buf[i] = '\0';
+        trace_pca9552_gpio_status(s->description, buf);
+    }
+}
+
 static void pca9552_update_pin_input(PCA9552State *s)
 {
     int i;
@@ -57,6 +85,7 @@ static void pca9552_update_pin_input(PCA9552State *s)
             break;
         }
     }
+    pca9552_display_pins_status(s);
 }
 
 static uint8_t pca9552_read(PCA9552State *s, uint8_t reg)
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 5561746866..7630e59652 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -206,3 +206,6 @@ via1_rtc_cmd_pram_sect_write(int sector, int offset, int addr, int value) "secto
 # grlib_ahb_apb_pnp.c
 grlib_ahb_pnp_read(uint64_t addr, uint32_t value) "AHB PnP read addr:0x%03"PRIx64" data:0x%08x"
 grlib_apb_pnp_read(uint64_t addr, uint32_t value) "APB PnP read addr:0x%03"PRIx64" data:0x%08x"
+
+# pca9552.c
+pca9552_gpio_status(const char *description, const char *buf) "%s GPIOs 0-15 [%s]"
-- 
2.21.3

