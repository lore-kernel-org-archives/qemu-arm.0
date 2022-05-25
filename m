Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1034002lfh;
        Wed, 25 May 2022 09:22:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwixax7ynjR4fPZvT1t6RpJ52gb8JoIqTS72GgHmElhKjlJ0mrIaZos9WE6aedDGgcpV+K8
X-Received: by 2002:a05:6214:238a:b0:441:76a5:2331 with SMTP id fw10-20020a056214238a00b0044176a52331mr26442963qvb.96.1653495742610;
        Wed, 25 May 2022 09:22:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653495742; cv=none;
        d=google.com; s=arc-20160816;
        b=DrgGllDluyAYtB5lrHt2HmJ+zPjGtriT+S5OKaaxutS1pt20IrG0gfkAgZ1km82TsQ
         RyeeUDe47AFoXTkiHgXhuBCJxhAJ29NFv/Id1hy7Ob9ccLg63JbVbMGW0JzpWBqEE9B7
         CbMPzX3YGuoq3eCXHIsy/RR4oHt6NYks8t6nhTvnIi792qHyPc9C6Q3G1pMf5orbBjp1
         LZx5k0lDmRK3gRVQcuwueORqayvZewyB/Q0vN/eQcdJz9UpaNa+2PFRRpxC++ueeG3uW
         T87XsyRhyrRzE45Ucs2aabFzz53dINhE4fyCDuHa8v6R9jhbAvIVvFs8vWeJIFwcKDox
         AeVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=LwGK0NJm7VbwWDUfk+CyTIJ3ZUW52vg3bjWucrNSzkc=;
        b=w24A4sX6DiwkWljqskS/yla6hKHXC+qHjbhYZcJvk1X68kPmWN0vKkpOGwFWnHl/XD
         1sgb/brVBVPW10ALJ8+NDjeUspBxjepeepDUlMk6fQGjzL7XNwJvRegL/tUrxl8Qo2op
         1KRoQPtRZR7V6cdmRPQRZ5S5acF29a+3QkYC8TbIy+FNlXqqu/kYomO0FXGqU6UsLhzV
         rnlULw8+kbnfo7vVRcmUKutTj7Y8g9Hk81duC3+BD0BZKF6PmGHbo6oOBXNNXDP8JLqe
         1XdN6QSlNBnQS+CVQ+OfyNM1EMO/uGSkEC38LcjuGlZT2MkfJAiCbZ7MLMu3kr3rP+UJ
         fypA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j123-20020a378781000000b0069c651900f6si1294035qkd.649.2022.05.25.09.22.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 May 2022 09:22:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nttmA-0001ob-0S
	for alex.bennee@linaro.org; Wed, 25 May 2022 12:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSm-0007RJ-F7; Wed, 25 May 2022 12:02:20 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:44733
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSj-0004AX-14; Wed, 25 May 2022 12:02:20 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4L7bRn6sKYz4xbt;
 Thu, 26 May 2022 02:02:13 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L7bRm1Hwtz4xDK;
 Thu, 26 May 2022 02:02:11 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 13/15] hw/gpio support GPIO index mode for write operation.
Date: Wed, 25 May 2022 18:01:34 +0200
Message-Id: <20220525160136.556277-14-clg@kaod.org>
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
X-TUID: 3oM5wNBRRndp

From: Jamin Lin <jamin_lin@aspeedtech.com>

It did not support GPIO index mode for read operation.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220525053444.27228-4-jamin_lin@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/gpio/aspeed_gpio.h |  14 +++
 hw/gpio/aspeed_gpio.c         | 168 ++++++++++++++++++++++++++++++++++
 2 files changed, 182 insertions(+)

diff --git a/include/hw/gpio/aspeed_gpio.h b/include/hw/gpio/aspeed_gpio.h
index 6dee3cd43893..41b36524d062 100644
--- a/include/hw/gpio/aspeed_gpio.h
+++ b/include/hw/gpio/aspeed_gpio.h
@@ -50,6 +50,20 @@ enum GPIORegType {
     gpio_reg_input_mask,
 };
 
+/* GPIO index mode */
+enum GPIORegIndexType {
+    gpio_reg_idx_data = 0,
+    gpio_reg_idx_direction,
+    gpio_reg_idx_interrupt,
+    gpio_reg_idx_debounce,
+    gpio_reg_idx_tolerance,
+    gpio_reg_idx_cmd_src,
+    gpio_reg_idx_input_mask,
+    gpio_reg_idx_reserved,
+    gpio_reg_idx_new_w_cmd_src,
+    gpio_reg_idx_new_r_cmd_src,
+};
+
 typedef struct AspeedGPIOReg {
     uint16_t set_idx;
     enum GPIORegType type;
diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 5138fe812b9e..c834bf19f5ce 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -16,6 +16,7 @@
 #include "hw/irq.h"
 #include "migration/vmstate.h"
 #include "trace.h"
+#include "hw/registerfields.h"
 
 #define GPIOS_PER_GROUP 8
 
@@ -204,6 +205,28 @@
 #define GPIO_1_8V_MEM_SIZE            0x1D8
 #define GPIO_1_8V_REG_ARRAY_SIZE      (GPIO_1_8V_MEM_SIZE >> 2)
 
+/*
+ * GPIO index mode support
+ * It only supports write operation
+ */
+REG32(GPIO_INDEX_REG, 0x2AC)
+    FIELD(GPIO_INDEX_REG, NUMBER, 0, 8)
+    FIELD(GPIO_INDEX_REG, COMMAND, 12, 1)
+    FIELD(GPIO_INDEX_REG, TYPE, 16, 4)
+    FIELD(GPIO_INDEX_REG, DATA_VALUE, 20, 1)
+    FIELD(GPIO_INDEX_REG, DIRECTION, 20, 1)
+    FIELD(GPIO_INDEX_REG, INT_ENABLE, 20, 1)
+    FIELD(GPIO_INDEX_REG, INT_SENS_0, 21, 1)
+    FIELD(GPIO_INDEX_REG, INT_SENS_1, 22, 1)
+    FIELD(GPIO_INDEX_REG, INT_SENS_2, 23, 1)
+    FIELD(GPIO_INDEX_REG, INT_STATUS, 24, 1)
+    FIELD(GPIO_INDEX_REG, DEBOUNCE_1, 20, 1)
+    FIELD(GPIO_INDEX_REG, DEBOUNCE_2, 21, 1)
+    FIELD(GPIO_INDEX_REG, RESET_TOLERANT, 20, 1)
+    FIELD(GPIO_INDEX_REG, COMMAND_SRC_0, 20, 1)
+    FIELD(GPIO_INDEX_REG, COMMAND_SRC_1, 21, 1)
+    FIELD(GPIO_INDEX_REG, INPUT_MASK, 20, 1)
+
 static int aspeed_evaluate_irq(GPIOSets *regs, int gpio_prev_high, int gpio)
 {
     uint32_t falling_edge = 0, rising_edge = 0;
@@ -596,6 +619,144 @@ static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
     return value;
 }
 
+static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
+                                                uint64_t data, uint32_t size)
+{
+
+    AspeedGPIOState *s = ASPEED_GPIO(opaque);
+    AspeedGPIOClass *agc = ASPEED_GPIO_GET_CLASS(s);
+    const GPIOSetProperties *props;
+    GPIOSets *set;
+    uint32_t reg_idx_number = FIELD_EX32(data, GPIO_INDEX_REG, NUMBER);
+    uint32_t reg_idx_type = FIELD_EX32(data, GPIO_INDEX_REG, TYPE);
+    uint32_t reg_idx_command = FIELD_EX32(data, GPIO_INDEX_REG, COMMAND);
+    uint32_t set_idx = reg_idx_number / ASPEED_GPIOS_PER_SET;
+    uint32_t pin_idx = reg_idx_number % ASPEED_GPIOS_PER_SET;
+    uint32_t group_idx = pin_idx / GPIOS_PER_GROUP;
+    uint32_t reg_value = 0;
+    uint32_t cleared;
+
+    set = &s->sets[set_idx];
+    props = &agc->props[set_idx];
+
+    if (reg_idx_command)
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: offset 0x%" PRIx64 "data 0x%"
+            PRIx64 "index mode wrong command 0x%x\n",
+            __func__, offset, data, reg_idx_command);
+
+    switch (reg_idx_type) {
+    case gpio_reg_idx_data:
+        reg_value = set->data_read;
+        reg_value = deposit32(reg_value, pin_idx, 1,
+                              FIELD_EX32(data, GPIO_INDEX_REG, DATA_VALUE));
+        reg_value &= props->output;
+        reg_value = update_value_control_source(set, set->data_value,
+                                                reg_value);
+        set->data_read = reg_value;
+        aspeed_gpio_update(s, set, reg_value);
+        return;
+    case gpio_reg_idx_direction:
+        reg_value = set->direction;
+        reg_value = deposit32(reg_value, pin_idx, 1,
+                              FIELD_EX32(data, GPIO_INDEX_REG, DIRECTION));
+        /*
+         *   where data is the value attempted to be written to the pin:
+         *    pin type      | input mask | output mask | expected value
+         *    ------------------------------------------------------------
+         *   bidirectional  |   1       |   1        |  data
+         *   input only     |   1       |   0        |   0
+         *   output only    |   0       |   1        |   1
+         *   no pin         |   0       |   0        |   0
+         *
+         *  which is captured by:
+         *  data = ( data | ~input) & output;
+         */
+        reg_value = (reg_value | ~props->input) & props->output;
+        set->direction = update_value_control_source(set, set->direction,
+                                                     reg_value);
+        break;
+    case gpio_reg_idx_interrupt:
+        reg_value = set->int_enable;
+        reg_value = deposit32(reg_value, pin_idx, 1,
+                              FIELD_EX32(data, GPIO_INDEX_REG, INT_ENABLE));
+        set->int_enable = update_value_control_source(set, set->int_enable,
+                                                      reg_value);
+        reg_value = set->int_sens_0;
+        reg_value = deposit32(reg_value, pin_idx, 1,
+                              FIELD_EX32(data, GPIO_INDEX_REG, INT_SENS_0));
+        set->int_sens_0 = update_value_control_source(set, set->int_sens_0,
+                                                      reg_value);
+        reg_value = set->int_sens_1;
+        reg_value = deposit32(reg_value, pin_idx, 1,
+                              FIELD_EX32(data, GPIO_INDEX_REG, INT_SENS_1));
+        set->int_sens_1 = update_value_control_source(set, set->int_sens_1,
+                                                      reg_value);
+        reg_value = set->int_sens_2;
+        reg_value = deposit32(reg_value, pin_idx, 1,
+                              FIELD_EX32(data, GPIO_INDEX_REG, INT_SENS_2));
+        set->int_sens_2 = update_value_control_source(set, set->int_sens_2,
+                                                      reg_value);
+        /* set interrupt status */
+        reg_value = set->int_status;
+        reg_value = deposit32(reg_value, pin_idx, 1,
+                              FIELD_EX32(data, GPIO_INDEX_REG, INT_STATUS));
+        cleared = ctpop32(reg_value & set->int_status);
+        if (s->pending && cleared) {
+            assert(s->pending >= cleared);
+            s->pending -= cleared;
+        }
+        set->int_status &= ~reg_value;
+        break;
+    case gpio_reg_idx_debounce:
+        reg_value = set->debounce_1;
+        reg_value = deposit32(reg_value, pin_idx, 1,
+                              FIELD_EX32(data, GPIO_INDEX_REG, DEBOUNCE_1));
+        set->debounce_1 = update_value_control_source(set, set->debounce_1,
+                                                      reg_value);
+        reg_value = set->debounce_2;
+        reg_value = deposit32(reg_value, pin_idx, 1,
+                              FIELD_EX32(data, GPIO_INDEX_REG, DEBOUNCE_2));
+        set->debounce_2 = update_value_control_source(set, set->debounce_2,
+                                                      reg_value);
+        return;
+    case gpio_reg_idx_tolerance:
+        reg_value = set->reset_tol;
+        reg_value = deposit32(reg_value, pin_idx, 1,
+                              FIELD_EX32(data, GPIO_INDEX_REG, RESET_TOLERANT));
+        set->reset_tol = update_value_control_source(set, set->reset_tol,
+                                                     reg_value);
+        return;
+    case gpio_reg_idx_cmd_src:
+        reg_value = set->cmd_source_0;
+        reg_value = deposit32(reg_value, GPIOS_PER_GROUP * group_idx, 1,
+                              FIELD_EX32(data, GPIO_INDEX_REG, COMMAND_SRC_0));
+        set->cmd_source_0 = reg_value & ASPEED_CMD_SRC_MASK;
+        reg_value = set->cmd_source_1;
+        reg_value = deposit32(reg_value, GPIOS_PER_GROUP * group_idx, 1,
+                              FIELD_EX32(data, GPIO_INDEX_REG, COMMAND_SRC_1));
+        set->cmd_source_1 = reg_value & ASPEED_CMD_SRC_MASK;
+        return;
+    case gpio_reg_idx_input_mask:
+        reg_value = set->input_mask;
+        reg_value = deposit32(reg_value, pin_idx, 1,
+                              FIELD_EX32(data, GPIO_INDEX_REG, INPUT_MASK));
+        /*
+         * feeds into interrupt generation
+         * 0: read from data value reg will be updated
+         * 1: read from data value reg will not be updated
+         */
+        set->input_mask = reg_value & props->input;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: offset 0x%" PRIx64 "data 0x%"
+            PRIx64 "index mode wrong type 0x%x\n",
+            __func__, offset, data, reg_idx_type);
+        return;
+    }
+    aspeed_gpio_update(s, set, set->data_value);
+    return;
+}
+
 static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
                               uint32_t size)
 {
@@ -610,6 +771,13 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
     trace_aspeed_gpio_write(offset, data);
 
     idx = offset >> 2;
+
+    /* check gpio index mode */
+    if (idx == R_GPIO_INDEX_REG) {
+        aspeed_gpio_write_index_mode(opaque, offset, data, size);
+        return;
+    }
+
     if (idx >= GPIO_DEBOUNCE_TIME_1 && idx <= GPIO_DEBOUNCE_TIME_3) {
         idx -= GPIO_DEBOUNCE_TIME_1;
         s->debounce_regs[idx] = (uint32_t) data;
-- 
2.35.3

