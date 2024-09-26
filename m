Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp777512njb;
        Thu, 26 Sep 2024 00:46:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXg8iUgEUbnecOEIGGCAiqc8CL+Q8Yv4Veb4UPpsvv2uNXQCKHuLoOYHsH219e5B+t+XzyoUX0TfpDIQg==@linaro.org
X-Google-Smtp-Source: AGHT+IHNvAmz3EPBmtb3yNA7YMaoqIqcugJQ5LTXcAXV8SpF3bBCtqdicXvW4wqJ68NX+3Vrrjlt
X-Received: by 2002:a05:620a:4555:b0:7a9:be54:4b00 with SMTP id af79cd13be357-7ace7412827mr790758785a.35.1727336788148;
        Thu, 26 Sep 2024 00:46:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727336788; cv=none;
        d=google.com; s=arc-20240605;
        b=VT5+JVmtxNRhiApKIYZhI1JhdVGm9f9O07tnDUigh4Ei/uYd1fDCa8PPsKh0DbPr5I
         OYj4RfYb6Dwz9W60qPuPT1ce14KiTu+/veROfajlaaRTM1wmvlKUzhK+8Kkr52Wr1Otd
         vWy2dhEgs2ZMynSJlhjp7FhOuJIU132rL6EQL4zjy5A9xq3PzNPwN876ayW2GvxDG6q4
         jQqK6tmDFQ4akqYVSImIio4/ltm8mePXQ2gZ64mYKJ4XaH+HKAS1wpheGg3BEDYBm4to
         zc3k2SFM2OKE8h6no/kUNwDXP+C0xv/R4pHVTSdjkZ1+hI+BoZRM+AHZkg6CbNorxC1z
         1nJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Rj7uCO06PLpB6cshGlQ8TTYWCMHDsA9Rc70HHHmO1yw=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=Cpn/RTC9mfjndYVN5bWCnK1c3aaoX20BdEh+56XhUBLlZvABYH4GkuqAu7UawA8OEY
         /+I0T9jVFeJfZea7GTRJpC4R29BjWhG34osc11IWEX92dOZvZlEBLxmPx2ZECFPNS5XV
         ZwWfrNK5njjERNyBoyTPRkUfERBDm9CXLw5WM66pz8Ms0cDvWIEaRGKQaHTpQ3HThVgA
         3ce4LzLQw3duopDXVQeqlDrGHCKzxYzxDKlaaE6vGlG27ImklAmzVbwzms9WMyQvgIr1
         gR/8DNkt2OM79SYMsdAbPWziqMwfktyZRu+ds5rJ5r0BJXsD4R7kwX5cqIWZRTBRuwcB
         7U7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45b52749d50si59514331cf.676.2024.09.26.00.46.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2024 00:46:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1stjCJ-0001LK-JC; Thu, 26 Sep 2024 03:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1stjCC-0001Gs-1t; Thu, 26 Sep 2024 03:45:52 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1stjC8-0006Ef-DA; Thu, 26 Sep 2024 03:45:51 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 26 Sep
 2024 15:45:36 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 26 Sep 2024 15:45:36 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v3 1/6] hw/gpio/aspeed: Fix coding style
Date: Thu, 26 Sep 2024 15:45:30 +0800
Message-ID: <20240926074535.1286209-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240926074535.1286209-1-jamin_lin@aspeedtech.com>
References: <20240926074535.1286209-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mWgRRtawP/eV

Fix coding style issues from checkpatch.pl

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/gpio/aspeed_gpio.c         | 6 +++---
 include/hw/gpio/aspeed_gpio.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 71756664dd..00fb72a509 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -340,7 +340,8 @@ static void aspeed_gpio_set_pin_level(AspeedGPIOState *s, uint32_t set_idx,
         value &= ~pin_mask;
     }
 
-    aspeed_gpio_update(s, &s->sets[set_idx], value, ~s->sets[set_idx].direction);
+    aspeed_gpio_update(s, &s->sets[set_idx], value,
+                       ~s->sets[set_idx].direction);
 }
 
 /*
@@ -629,7 +630,6 @@ static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
 static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
                                                 uint64_t data, uint32_t size)
 {
-
     AspeedGPIOState *s = ASPEED_GPIO(opaque);
     AspeedGPIOClass *agc = ASPEED_GPIO_GET_CLASS(s);
     const GPIOSetProperties *props;
@@ -963,7 +963,7 @@ static void aspeed_gpio_set_pin(Object *obj, Visitor *v, const char *name,
     aspeed_gpio_set_pin_level(s, set_idx, pin, level);
 }
 
-/****************** Setup functions ******************/
+/* Setup functions */
 static const GPIOSetProperties ast2400_set_props[ASPEED_GPIO_MAX_NR_SETS] = {
     [0] = {0xffffffff,  0xffffffff,  {"A", "B", "C", "D"} },
     [1] = {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
diff --git a/include/hw/gpio/aspeed_gpio.h b/include/hw/gpio/aspeed_gpio.h
index 90a12ae318..39febda9ea 100644
--- a/include/hw/gpio/aspeed_gpio.h
+++ b/include/hw/gpio/aspeed_gpio.h
@@ -88,7 +88,7 @@ struct AspeedGPIOState {
     qemu_irq irq;
     qemu_irq gpios[ASPEED_GPIO_MAX_NR_SETS][ASPEED_GPIOS_PER_SET];
 
-/* Parallel GPIO Registers */
+    /* Parallel GPIO Registers */
     uint32_t debounce_regs[ASPEED_GPIO_NR_DEBOUNCE_REGS];
     struct GPIOSets {
         uint32_t data_value; /* Reflects pin values */
-- 
2.34.1

