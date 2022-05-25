Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1032236lfh;
        Wed, 25 May 2022 09:20:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoR+lnn1zaX7A1KA86dmfx07GPd9eRMwBUOria1qydjkY/RJJpTJh+qW2Vv74lBlxmbig3
X-Received: by 2002:a05:6214:2aaf:b0:45b:9f:8752 with SMTP id js15-20020a0562142aaf00b0045b009f8752mr26575007qvb.9.1653495607591;
        Wed, 25 May 2022 09:20:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653495607; cv=none;
        d=google.com; s=arc-20160816;
        b=Ivg2dhQZAhOwSOzVg8RaiJM0AhUdG6JomyHeo58WnkMd5NVOuq851j2WI2ncv5JfNY
         Kvy+5JynyXhrPJ/oWnoqMIgvJLyH5Jquorpe7Z+j2KYffzYHTfzEznBKGoPnbn6V8mgN
         U0vbkjeY79+suvx9A+LUAsiaFdbTlVWDvIHScQxfCG98S4fhVVrag8Jvute4FeT+D5NC
         PAt8XKc8zS2lkCJkOEp6iVQ0kw7p42l/7NpY9XO2HmAJqpDoD6S/vzxRk11wWaQfO/So
         Ib4mss4XV4Gq9A9NXnmXGBNw15jD80gwE8lxxQA3xIRybDcP4VJELf5TEADQoNjmUcAV
         92dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=sZztCNkyZ8m8rxAIgRISbiIgK7bpUJ5pq6v78liXbT8=;
        b=vDB/zwasWcVjeSeuj1hx+INo68q7YDojJt3JgwDchDRg1CuF8HMW6WXeoftckCIDQU
         RIx9TbP3bFs/leFp1Trn9iPIlRRvAxlzRxJ0j+TRqftBTAEUBCtAcxqg/AiDm3r1iNJb
         foUOjGx4DKXoT9ClmDSG1f/1NgOD8L5/CK1YDft53zUKRuEu7qSvLPuMJVIKS9/5qaHk
         oNxtDRtb6wIRApbiTzHp7Gcu4fCYsnEB8fDlcEEO1LzTGr4ennl8sQaIAf3DPjDMb7Qy
         ydpHFT1xKDka3LxmoKamOk/uJFPTi8Qfsgavrr9Jlr02v7d4aKu7mOXfR0/G5IqM+/04
         y9Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jr15-20020a0562142a8f00b004563b80a548si1535863qvb.318.2022.05.25.09.20.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 May 2022 09:20:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nttjy-0007Dd-W7
	for alex.bennee@linaro.org; Wed, 25 May 2022 12:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSh-0007Fj-MM; Wed, 25 May 2022 12:02:15 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:48649
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSd-00049O-9L; Wed, 25 May 2022 12:02:15 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4L7bRj2kGfz4xXj;
 Thu, 26 May 2022 02:02:09 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L7bRg4J7kz4xDK;
 Thu, 26 May 2022 02:02:07 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 11/15] hw/gpio Add GPIO read/write trace event.
Date: Wed, 25 May 2022 18:01:32 +0200
Message-Id: <20220525160136.556277-12-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220525160136.556277-1-clg@kaod.org>
References: <20220525160136.556277-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=Lufh=WB=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: alQJH9wckAHm

From: Jamin Lin <jamin_lin@aspeedtech.com>

Add GPIO read/write trace event for aspeed model.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220525053444.27228-2-jamin_lin@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/gpio/aspeed_gpio.c | 54 +++++++++++++++++++++++++++++++------------
 hw/gpio/trace-events  |  4 ++++
 2 files changed, 43 insertions(+), 15 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 9b736e7a9f26..4620ea8e8b83 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -15,6 +15,7 @@
 #include "qapi/visitor.h"
 #include "hw/irq.h"
 #include "migration/vmstate.h"
+#include "trace.h"
 
 #define GPIOS_PER_GROUP 8
 
@@ -523,11 +524,15 @@ static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
     uint64_t idx = -1;
     const AspeedGPIOReg *reg;
     GPIOSets *set;
+    uint32_t value = 0;
+    uint64_t debounce_value;
 
     idx = offset >> 2;
     if (idx >= GPIO_DEBOUNCE_TIME_1 && idx <= GPIO_DEBOUNCE_TIME_3) {
         idx -= GPIO_DEBOUNCE_TIME_1;
-        return (uint64_t) s->debounce_regs[idx];
+        debounce_value = (uint64_t) s->debounce_regs[idx];
+        trace_aspeed_gpio_read(offset, debounce_value);
+        return debounce_value;
     }
 
     reg = &agc->reg_table[idx];
@@ -540,38 +545,55 @@ static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
     set = &s->sets[reg->set_idx];
     switch (reg->type) {
     case gpio_reg_data_value:
-        return set->data_value;
+        value = set->data_value;
+        break;
     case gpio_reg_direction:
-        return set->direction;
+        value = set->direction;
+        break;
     case gpio_reg_int_enable:
-        return set->int_enable;
+        value = set->int_enable;
+        break;
     case gpio_reg_int_sens_0:
-        return set->int_sens_0;
+        value = set->int_sens_0;
+        break;
     case gpio_reg_int_sens_1:
-        return set->int_sens_1;
+        value = set->int_sens_1;
+        break;
     case gpio_reg_int_sens_2:
-        return set->int_sens_2;
+        value = set->int_sens_2;
+        break;
     case gpio_reg_int_status:
-        return set->int_status;
+        value = set->int_status;
+        break;
     case gpio_reg_reset_tolerant:
-        return set->reset_tol;
+        value = set->reset_tol;
+        break;
     case gpio_reg_debounce_1:
-        return set->debounce_1;
+        value = set->debounce_1;
+        break;
     case gpio_reg_debounce_2:
-        return set->debounce_2;
+        value = set->debounce_2;
+        break;
     case gpio_reg_cmd_source_0:
-        return set->cmd_source_0;
+        value = set->cmd_source_0;
+        break;
     case gpio_reg_cmd_source_1:
-        return set->cmd_source_1;
+        value = set->cmd_source_1;
+        break;
     case gpio_reg_data_read:
-        return set->data_read;
+        value = set->data_read;
+        break;
     case gpio_reg_input_mask:
-        return set->input_mask;
+        value = set->input_mask;
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: no getter for offset 0x%"
                       HWADDR_PRIx"\n", __func__, offset);
         return 0;
     }
+
+    trace_aspeed_gpio_read(offset, value);
+    return value;
 }
 
 static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
@@ -585,6 +607,8 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
     GPIOSets *set;
     uint32_t cleared;
 
+    trace_aspeed_gpio_write(offset, data);
+
     idx = offset >> 2;
     if (idx >= GPIO_DEBOUNCE_TIME_1 && idx <= GPIO_DEBOUNCE_TIME_3) {
         idx -= GPIO_DEBOUNCE_TIME_1;
diff --git a/hw/gpio/trace-events b/hw/gpio/trace-events
index 1dab99c5604d..9736b362ac18 100644
--- a/hw/gpio/trace-events
+++ b/hw/gpio/trace-events
@@ -27,3 +27,7 @@ sifive_gpio_read(uint64_t offset, uint64_t r) "offset 0x%" PRIx64 " value 0x%" P
 sifive_gpio_write(uint64_t offset, uint64_t value) "offset 0x%" PRIx64 " value 0x%" PRIx64
 sifive_gpio_set(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
 sifive_gpio_update_output_irq(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
+
+# aspeed_gpio.c
+aspeed_gpio_read(uint64_t offset, uint64_t value) "offset: 0x%" PRIx64 " value 0x%" PRIx64
+aspeed_gpio_write(uint64_t offset, uint64_t value) "offset: 0x%" PRIx64 " value 0x%" PRIx64
-- 
2.35.3

