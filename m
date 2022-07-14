Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp730206lfp;
        Thu, 14 Jul 2022 08:54:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sDGWUDc6IhRuLNM7SwvUcSNm5xqc4mNIMESizqUiQkpl85xMR5cTgn6Una1/aV6fmzdIZw
X-Received: by 2002:a05:622a:60f:b0:31c:c5da:eb49 with SMTP id z15-20020a05622a060f00b0031cc5daeb49mr8489483qta.443.1657814056973;
        Thu, 14 Jul 2022 08:54:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657814056; cv=none;
        d=google.com; s=arc-20160816;
        b=BZnrkXv7nR2j2j+KXYWV0TKxijQsok6IUfcmegePFzkI2DYNvmjENXCAXcMp8fb/WB
         fLIJ6RRbIAIyHQ7XXNhJScFWslHQU7375KgEIqJDSb8u5+AHj6guBhnb1NMS8PjASpcS
         IlGRFcOwaS8q+byKsza5HiRdH7uU8WM68yzVo0Xy5PtdJ7MU758iKZDxd4g5LWFXltO5
         4UgsV8fTGIRGCeKQx7OXuTB4mcR6s0zD9aI6fGHGiFsGXYuvGXDiiF+TULavX/I6QbC6
         ZRcVO6ycZMFPM3tKsDmBc9JJ8VXH7791QLKA6R2uNBj9CsgEQETpT3eOtQBeb/w4X8RU
         HrjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=nmzI786MrQNPrMfWpb3zhbq4bwwiFcirYGiOu2LUW1c=;
        b=lBvYmo/CyWmkeZvRQpi7Y6snm2WYflhYgLaUiKX+DpcxFRsm+Vz+GVGHOEoT5azOOx
         UL5NnUyKXqcvL4Zy3QHd6p3FdoodUOHBZsNZYThdenQHRCkUrwad1OkwXw5rrzytU2QK
         pvGSqWslscC9r9siibOviLCwrdPHlRrebhEk4+nsGQgl9yIVWfBC6MQCozkeWu8LNQh6
         Q40SqR81cgtxqYSfIW5jnewt+FOotLzKkW010oNNzb7pVm2wytrYSggRR5RqalJBG6hG
         QYUhymtuqVS4N8k5wwBdhHKpl9uszHgR+rKyCyWlhGh8SArwzRIjpIwGp1+AolRzZTdn
         1zFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15-20020a0562140c4f00b0047377640430si945731qvj.308.2022.07.14.08.54.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 08:54:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC1AO-0003lQ-Es
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 11:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC12I-0005Rn-KK; Thu, 14 Jul 2022 11:45:56 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:57841
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC12D-0000uK-BU; Thu, 14 Jul 2022 11:45:53 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LkJjk1VHPz4yTJ;
 Fri, 15 Jul 2022 01:45:46 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LkJjg74M7z4xRC;
 Fri, 15 Jul 2022 01:45:43 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <peter@pjd.dev>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 18/19] hw/gpio/aspeed: Don't let guests modify input pins
Date: Thu, 14 Jul 2022 17:44:55 +0200
Message-Id: <20220714154456.2565189-19-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220714154456.2565189-1-clg@kaod.org>
References: <20220714154456.2565189-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=QWOl=XT=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A5TeMQ3EHSq1

From: Peter Delevoryas <peter@pjd.dev>

Up until now, guests could modify input pins by overwriting the data
value register. The guest OS should only be allowed to modify output pin
values, and the QOM property setter should only be permitted to modify
input pins.

This change also updates the gpio input pin test to match this
expectation.

Andrew suggested this particularly refactoring here:

    https://lore.kernel.org/qemu-devel/23523aa1-ba81-412b-92cc-8174faba3612@www.fastmail.com/

Suggested-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Fixes: 4b7f956862dc ("hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500")
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220712023219.41065-3-peter@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/gpio/aspeed_gpio.c          | 15 ++++++++-------
 tests/qtest/aspeed_gpio-test.c |  2 +-
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index a62a673857c2..1e267dd48203 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -268,7 +268,7 @@ static ptrdiff_t aspeed_gpio_set_idx(AspeedGPIOState *s, GPIOSets *regs)
 }
 
 static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
-                               uint32_t value)
+                               uint32_t value, uint32_t mode_mask)
 {
     uint32_t input_mask = regs->input_mask;
     uint32_t direction = regs->direction;
@@ -277,7 +277,8 @@ static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
     uint32_t diff;
     int gpio;
 
-    diff = old ^ new;
+    diff = (old ^ new);
+    diff &= mode_mask;
     if (diff) {
         for (gpio = 0; gpio < ASPEED_GPIOS_PER_SET; gpio++) {
             uint32_t mask = 1 << gpio;
@@ -339,7 +340,7 @@ static void aspeed_gpio_set_pin_level(AspeedGPIOState *s, uint32_t set_idx,
         value &= ~pin_mask;
     }
 
-    aspeed_gpio_update(s, &s->sets[set_idx], value);
+    aspeed_gpio_update(s, &s->sets[set_idx], value, ~s->sets[set_idx].direction);
 }
 
 /*
@@ -653,7 +654,7 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
         reg_value = update_value_control_source(set, set->data_value,
                                                 reg_value);
         set->data_read = reg_value;
-        aspeed_gpio_update(s, set, reg_value);
+        aspeed_gpio_update(s, set, reg_value, set->direction);
         return;
     case gpio_reg_idx_direction:
         reg_value = set->direction;
@@ -753,7 +754,7 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
             __func__, offset, data, reg_idx_type);
         return;
     }
-    aspeed_gpio_update(s, set, set->data_value);
+    aspeed_gpio_update(s, set, set->data_value, UINT32_MAX);
     return;
 }
 
@@ -799,7 +800,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
         data &= props->output;
         data = update_value_control_source(set, set->data_value, data);
         set->data_read = data;
-        aspeed_gpio_update(s, set, data);
+        aspeed_gpio_update(s, set, data, set->direction);
         return;
     case gpio_reg_direction:
         /*
@@ -875,7 +876,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
                       PRIx64"\n", __func__, offset);
         return;
     }
-    aspeed_gpio_update(s, set, set->data_value);
+    aspeed_gpio_update(s, set, set->data_value, UINT32_MAX);
     return;
 }
 
diff --git a/tests/qtest/aspeed_gpio-test.c b/tests/qtest/aspeed_gpio-test.c
index 8f524540998d..d38f51d71908 100644
--- a/tests/qtest/aspeed_gpio-test.c
+++ b/tests/qtest/aspeed_gpio-test.c
@@ -69,7 +69,7 @@ static void test_set_input_pins(const void *data)
 
     qtest_writel(s, AST2600_GPIO_BASE + GPIO_ABCD_DATA_VALUE, 0x00000000);
     value = qtest_readl(s, AST2600_GPIO_BASE + GPIO_ABCD_DATA_VALUE);
-    g_assert_cmphex(value, ==, 0x00000000);
+    g_assert_cmphex(value, ==, 0xffffffff);
 }
 
 int main(int argc, char **argv)
-- 
2.35.3

