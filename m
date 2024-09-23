Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp2115399njb;
        Mon, 23 Sep 2024 02:43:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWXqP8peODxQiA9da3vhXo5dDRtubPeawjr8ipa0WtebbvqKUtyQquV+JuPgyPnsjplLEW8WmhfN2qzeQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF6B7Nu7r9OFt2LNKgCwn4SAPryD5FgG3vMotFo91bMAIGlM0FRqf8Q8EdxyiqUaBVNryZb
X-Received: by 2002:a05:6214:4198:b0:6c3:669a:13b1 with SMTP id 6a1803df08f44-6c7bc7584e4mr147797076d6.31.1727084613570;
        Mon, 23 Sep 2024 02:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727084613; cv=none;
        d=google.com; s=arc-20240605;
        b=EBSn2+ufo6g3sbnwTLFekyeYkR2ZNqIXNTgtOdTHR2aXarD40Nx0nxyDJEbhK7JMKh
         rAzJ4BJ0TzVRDJESsKMjs7TSCJ+pevCoFdSA7lVMivm9MsVsbxXndzRE9K3cuY5qb6HD
         Qfu9BjebyxTQUVuEAszuoAnevP7IxB5lJe6Y+amYa7e6ef8QUyXyNak243gHc83SOnhN
         3JJRQyomQ1q1iwwIDEVLtfWBxUKHAMelOwPwmZEqOpAP7HqV54P2Elf4t7EymHeXLjQI
         N7DvljzQTXc+8/VQb8Y85lTP/8Qo75cj7Y7aTD3k3qet2Ey07b0ohgzABvqGJsku4o+a
         NABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=z/3U5uDxpsCuHEpT1WPTYYs9H2YBF6XjQSNR4QOjROc=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=en47bi5vdO5zbixpd9KfJYX+Fm6Irlb/gbOwUl09PBun0Jan9uBFo+/Hc28cWkhEj0
         zoEbZjYMfUdpezLDls4FOAIWSncYzlm991T/hj0werGjy1cRpqP29N8RLyeYcVyOdWT5
         OtYaYR11xUiXxRvgGeXG10kKC7mNguM4q5TSFp2IbNFOiwYFXkSOUVbS61P2Uae0BCOm
         Agh1n/j1lDvsfrVY6V7TxBKQXhpYsRFQjhabX7HpsFHgSwlQZf6rl+5rL4n4mmUYas3L
         ujSXApJ3ZdPpWJUoJH4IMKNtApDYV6IADpTZF1yowwonWfRcRv+ezSm4jPEjt+m71mf3
         7uKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c75e453892si102580106d6.101.2024.09.23.02.43.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2024 02:43:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ssfaW-0000vJ-Uw; Mon, 23 Sep 2024 05:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ssfaV-0000ns-5I; Mon, 23 Sep 2024 05:42:35 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ssfaT-0008C9-0t; Mon, 23 Sep 2024 05:42:34 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 23 Sep
 2024 17:42:07 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 23 Sep 2024 17:42:07 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH 4/5] hw/gpio/aspeed: Add AST2700 support
Date: Mon, 23 Sep 2024 17:42:04 +0800
Message-ID: <20240923094206.1455783-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240923094206.1455783-1-jamin_lin@aspeedtech.com>
References: <20240923094206.1455783-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-TUID: 5IncBMePogPk

AST2700 integrates two set of Parallel GPIO Controller
with maximum 212 control pins, which are 27 groups.
(H, exclude pin: H7 H6 H5 H4)

In the previous design of ASPEED SOCs,
one register is used for setting one function for one set which are 32 pins
and 4 groups.
ex: GPIO000 is used for setting data value for GPIO A, B, C and D in AST2600.
ex: GPIO004 is used for setting direction for GPIO A, B, C and D in AST2600.

However, the register set have a significant change since AST2700.
Each GPIO pin has their own individual control register. In other words, users are able to
set one GPIO pin’s direction, interrupt enable, input mask and so on
in the same one register.

Currently, aspeed_gpio_read/aspeed_gpio_write callback functions
are not compatible AST2700.
Introduce new aspeed_gpio_2700_read/aspeed_gpio_2700_write callback functions
and aspeed_gpio_2700_ops memory region operation for AST2700.
Introduce a new ast2700 class to support AST2700.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/gpio/aspeed_gpio.c | 373 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 373 insertions(+)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index f23ffae34d..e3d5556dc1 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -227,6 +227,38 @@ REG32(GPIO_INDEX_REG, 0x2AC)
     FIELD(GPIO_INDEX_REG, COMMAND_SRC_1, 21, 1)
     FIELD(GPIO_INDEX_REG, INPUT_MASK, 20, 1)
 
+/* AST2700 GPIO Register Address Offsets */
+REG32(GPIO_2700_DEBOUNCE_TIME_1, 0x000)
+REG32(GPIO_2700_DEBOUNCE_TIME_2, 0x004)
+REG32(GPIO_2700_DEBOUNCE_TIME_3, 0x008)
+REG32(GPIO_2700_INT_STATUS_1, 0x100)
+REG32(GPIO_2700_INT_STATUS_2, 0x104)
+REG32(GPIO_2700_INT_STATUS_3, 0x108)
+REG32(GPIO_2700_INT_STATUS_4, 0x10C)
+REG32(GPIO_2700_INT_STATUS_5, 0x110)
+REG32(GPIO_2700_INT_STATUS_6, 0x114)
+REG32(GPIO_2700_INT_STATUS_7, 0x118)
+/* GPIOA0 - GPIOAA7 Control Register*/
+REG32(GPIO_A0_CONTROL, 0x180)
+    SHARED_FIELD(GPIO_CONTROL_OUT_DATA, 0, 1)
+    SHARED_FIELD(GPIO_CONTROL_DIRECTION, 1, 1)
+    SHARED_FIELD(GPIO_CONTROL_INT_ENABLE, 2, 1)
+    SHARED_FIELD(GPIO_CONTROL_INT_SENS_0, 3, 1)
+    SHARED_FIELD(GPIO_CONTROL_INT_SENS_1, 4, 1)
+    SHARED_FIELD(GPIO_CONTROL_INT_SENS_2, 5, 1)
+    SHARED_FIELD(GPIO_CONTROL_RESET_TOLERANCE, 6, 1)
+    SHARED_FIELD(GPIO_CONTROL_DEBOUNCE_1, 7, 1)
+    SHARED_FIELD(GPIO_CONTROL_DEBOUNCE_2, 8, 1)
+    SHARED_FIELD(GPIO_CONTROL_INPUT_MASK, 9, 1)
+    SHARED_FIELD(GPIO_CONTROL_BLINK_COUNTER_1, 10, 1)
+    SHARED_FIELD(GPIO_CONTROL_BLINK_COUNTER_2, 11, 1)
+    SHARED_FIELD(GPIO_CONTROL_INT_STATUS, 12, 1)
+    SHARED_FIELD(GPIO_CONTROL_IN_DATA, 13, 1)
+    SHARED_FIELD(GPIO_CONTROL_RESERVED, 14, 18)
+REG32(GPIO_AA7_CONTROL, 0x4DC)
+#define GPIO_2700_MEM_SIZE 0x4E0
+#define GPIO_2700_REG_ARRAY_SIZE (GPIO_2700_MEM_SIZE >> 2)
+
 static int aspeed_evaluate_irq(GPIOSets *regs, int gpio_prev_high, int gpio)
 {
     uint32_t falling_edge = 0, rising_edge = 0;
@@ -964,6 +996,309 @@ static void aspeed_gpio_set_pin(Object *obj, Visitor *v, const char *name,
     aspeed_gpio_set_pin_level(s, set_idx, pin, level);
 }
 
+static uint64_t aspeed_gpio_read_control_reg(AspeedGPIOState *s, uint32_t pin)
+{
+    AspeedGPIOClass *agc = ASPEED_GPIO_GET_CLASS(s);
+    GPIOSets *set;
+    uint64_t value = 0;
+    uint32_t set_idx;
+    uint32_t pin_idx;
+
+    set_idx = pin / ASPEED_GPIOS_PER_SET;
+    pin_idx = pin % ASPEED_GPIOS_PER_SET;
+
+    if (set_idx >= agc->nr_gpio_sets) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: set index: %d, out of bounds\n",
+                      __func__, set_idx);
+        return 0;
+    }
+
+    set = &s->sets[set_idx];
+    value = SHARED_FIELD_DP32(value, GPIO_CONTROL_OUT_DATA,
+                              extract32(set->data_read, pin_idx, 1));
+    value = SHARED_FIELD_DP32(value, GPIO_CONTROL_DIRECTION,
+                              extract32(set->direction, pin_idx, 1));
+    value = SHARED_FIELD_DP32(value, GPIO_CONTROL_INT_ENABLE,
+                              extract32(set->int_enable, pin_idx, 1));
+    value = SHARED_FIELD_DP32(value, GPIO_CONTROL_INT_SENS_0,
+                              extract32(set->int_sens_0, pin_idx, 1));
+    value = SHARED_FIELD_DP32(value, GPIO_CONTROL_INT_SENS_1,
+                              extract32(set->int_sens_1, pin_idx, 1));
+    value = SHARED_FIELD_DP32(value, GPIO_CONTROL_INT_SENS_2,
+                              extract32(set->int_sens_2, pin_idx, 1));
+    value = SHARED_FIELD_DP32(value, GPIO_CONTROL_RESET_TOLERANCE,
+                              extract32(set->reset_tol, pin_idx, 1));
+    value = SHARED_FIELD_DP32(value, GPIO_CONTROL_DEBOUNCE_1,
+                              extract32(set->debounce_1, pin_idx, 1));
+    value = SHARED_FIELD_DP32(value, GPIO_CONTROL_DEBOUNCE_2,
+                              extract32(set->debounce_2, pin_idx, 1));
+    value = SHARED_FIELD_DP32(value, GPIO_CONTROL_INPUT_MASK,
+                              extract32(set->input_mask, pin_idx, 1));
+    value = SHARED_FIELD_DP32(value, GPIO_CONTROL_INT_STATUS,
+                              extract32(set->int_status, pin_idx, 1));
+    value = SHARED_FIELD_DP32(value, GPIO_CONTROL_IN_DATA,
+                              extract32(set->data_value, pin_idx, 1));
+    return value;
+}
+
+static void aspeed_gpio_write_control_reg(AspeedGPIOState *s,
+                    uint32_t pin, uint32_t type, uint64_t data)
+{
+    AspeedGPIOClass *agc = ASPEED_GPIO_GET_CLASS(s);
+    const GPIOSetProperties *props;
+    GPIOSets *set;
+    uint32_t cleared;
+    uint32_t set_idx;
+    uint32_t pin_idx;
+    uint32_t group_value = 0;
+
+    set_idx = pin / ASPEED_GPIOS_PER_SET;
+    pin_idx = pin % ASPEED_GPIOS_PER_SET;
+
+    if (set_idx >= agc->nr_gpio_sets) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: set index: %d, out of bounds\n",
+                      __func__, set_idx);
+        return;
+    }
+
+    set = &s->sets[set_idx];
+    props = &agc->props[set_idx];
+
+    /* direction */
+    group_value = set->direction;
+    group_value = deposit32(group_value, pin_idx, 1,
+                            SHARED_FIELD_EX32(data, GPIO_CONTROL_DIRECTION));
+    /*
+     *   where data is the value attempted to be written to the pin:
+     *    pin type      | input mask | output mask | expected value
+     *    ------------------------------------------------------------
+     *   bidirectional  |   1       |   1        |  data
+     *   input only     |   1       |   0        |   0
+     *   output only    |   0       |   1        |   1
+     *   no pin         |   0       |   0        |   0
+     *
+     *  which is captured by:
+     *  data = ( data | ~input) & output;
+     */
+    group_value = (group_value | ~props->input) & props->output;
+    set->direction = update_value_control_source(set, set->direction,
+                                                 group_value);
+
+    /* out data */
+    group_value = set->data_read;
+    group_value = deposit32(group_value, pin_idx, 1,
+                            SHARED_FIELD_EX32(data, GPIO_CONTROL_OUT_DATA));
+    group_value &= props->output;
+    group_value = update_value_control_source(set, set->data_read,
+                                                  group_value);
+    set->data_read = group_value;
+
+    /* interrupt enable */
+    group_value = set->int_enable;
+    group_value = deposit32(group_value, pin_idx, 1,
+                            SHARED_FIELD_EX32(data, GPIO_CONTROL_INT_ENABLE));
+    set->int_enable = update_value_control_source(set, set->int_enable,
+                                                  group_value);
+
+    /* interrupt sensitivity type 0 */
+    group_value = set->int_sens_0;
+    group_value = deposit32(group_value, pin_idx, 1,
+                            SHARED_FIELD_EX32(data, GPIO_CONTROL_INT_SENS_0));
+    set->int_sens_0 = update_value_control_source(set, set->int_sens_0,
+                                                  group_value);
+
+    /* interrupt sensitivity type 1 */
+    group_value = set->int_sens_1;
+    group_value = deposit32(group_value, pin_idx, 1,
+                            SHARED_FIELD_EX32(data, GPIO_CONTROL_INT_SENS_1));
+    set->int_sens_1 = update_value_control_source(set, set->int_sens_1,
+                                                  group_value);
+
+    /* interrupt sensitivity type 2 */
+    group_value = set->int_sens_2;
+    group_value = deposit32(group_value, pin_idx, 1,
+                            SHARED_FIELD_EX32(data, GPIO_CONTROL_INT_SENS_2));
+    set->int_sens_2 = update_value_control_source(set, set->int_sens_2,
+                                                  group_value);
+
+    /* reset tolerance enable */
+    group_value = set->reset_tol;
+    group_value = deposit32(group_value, pin_idx, 1,
+                        SHARED_FIELD_EX32(data, GPIO_CONTROL_RESET_TOLERANCE));
+    set->reset_tol = update_value_control_source(set, set->reset_tol,
+                                                 group_value);
+
+    /* debounce 1 */
+    group_value = set->debounce_1;
+    group_value = deposit32(group_value, pin_idx, 1,
+                            SHARED_FIELD_EX32(data, GPIO_CONTROL_DEBOUNCE_1));
+    set->debounce_1 = update_value_control_source(set, set->debounce_1,
+                                                  group_value);
+
+    /* debounce 2 */
+    group_value = set->debounce_2;
+    group_value = deposit32(group_value, pin_idx, 1,
+                            SHARED_FIELD_EX32(data, GPIO_CONTROL_DEBOUNCE_2));
+    set->debounce_2 = update_value_control_source(set, set->debounce_2,
+                                                  group_value);
+
+    /* input mask */
+    group_value = set->input_mask;
+    group_value = deposit32(group_value, pin_idx, 1,
+                            SHARED_FIELD_EX32(data, GPIO_CONTROL_INPUT_MASK));
+    /*
+     * feeds into interrupt generation
+     * 0: read from data value reg will be updated
+     * 1: read from data value reg will not be updated
+     */
+    set->input_mask = group_value & props->input;
+
+    /* blink counter 1 */
+    /* blink counter 2 */
+    /* unimplement */
+
+    /* interrupt status */
+    group_value = set->int_status;
+    group_value = deposit32(group_value, pin_idx, 1,
+                            SHARED_FIELD_EX32(data, GPIO_CONTROL_INT_STATUS));
+    cleared = ctpop32(group_value & set->int_status);
+    if (s->pending && cleared) {
+        assert(s->pending >= cleared);
+        s->pending -= cleared;
+    }
+    set->int_status &= ~group_value;
+
+    aspeed_gpio_update(s, set, set->data_value, UINT32_MAX);
+    return;
+}
+
+static uint64_t aspeed_gpio_2700_read(void *opaque, hwaddr offset,
+                                uint32_t size)
+{
+    AspeedGPIOState *s = ASPEED_GPIO(opaque);
+    AspeedGPIOClass *agc = ASPEED_GPIO_GET_CLASS(s);
+    GPIOSets *set;
+    uint64_t value;
+    uint64_t reg;
+    uint32_t pin;
+    uint32_t idx;
+
+    reg = offset >> 2;
+
+    if (reg >= agc->reg_table_count) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: offset 0x%" PRIx64 " out of bounds\n",
+                      __func__, offset);
+        return 0;
+    }
+
+    switch (reg) {
+    case R_GPIO_2700_DEBOUNCE_TIME_1 ... R_GPIO_2700_DEBOUNCE_TIME_3:
+        idx = reg - R_GPIO_2700_DEBOUNCE_TIME_1;
+
+        if (idx >= ASPEED_GPIO_NR_DEBOUNCE_REGS) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: debounce index: %d, out of bounds\n",
+                          __func__, idx);
+            return 0;
+        }
+
+        value = (uint64_t) s->debounce_regs[idx];
+        break;
+    case R_GPIO_2700_INT_STATUS_1 ... R_GPIO_2700_INT_STATUS_7:
+        idx = reg - R_GPIO_2700_INT_STATUS_1;
+
+        if (idx >= agc->nr_gpio_sets) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: interrupt status index: %d, out of bounds\n",
+                          __func__, idx);
+            return 0;
+        }
+
+        set = &s->sets[idx];
+        value = (uint64_t) set->int_status;
+        break;
+    case R_GPIO_A0_CONTROL ... R_GPIO_AA7_CONTROL:
+        pin = reg - R_GPIO_A0_CONTROL;
+
+        if (pin >= agc->nr_gpio_pins) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid pin number: %d\n",
+                          __func__, pin);
+               return 0;
+        }
+
+        value = aspeed_gpio_read_control_reg(s, pin);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: no getter for offset 0x%"
+                      PRIx64"\n", __func__, offset);
+        return 0;
+    }
+
+    trace_aspeed_gpio_read(offset, value);
+    return value;
+}
+
+static void aspeed_gpio_2700_write(void *opaque, hwaddr offset,
+                                uint64_t data, uint32_t size)
+{
+    AspeedGPIOState *s = ASPEED_GPIO(opaque);
+    AspeedGPIOClass *agc = ASPEED_GPIO_GET_CLASS(s);
+    uint64_t reg;
+    uint32_t pin;
+    uint32_t type;
+    uint32_t idx;
+
+    trace_aspeed_gpio_write(offset, data);
+
+    reg = offset >> 2;
+
+    if (reg >= agc->reg_table_count) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: offset 0x%" PRIx64 " out of bounds\n",
+                      __func__, offset);
+        return;
+    }
+
+    switch (reg) {
+    case R_GPIO_2700_DEBOUNCE_TIME_1 ... R_GPIO_2700_DEBOUNCE_TIME_3:
+        idx = reg - R_GPIO_2700_DEBOUNCE_TIME_1;
+
+        if (idx >= ASPEED_GPIO_NR_DEBOUNCE_REGS) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: debounce index: %d out of bounds\n",
+                          __func__, idx);
+            return;
+        }
+
+        s->debounce_regs[idx] = (uint32_t) data;
+        break;
+    case R_GPIO_A0_CONTROL ... R_GPIO_AA7_CONTROL:
+        pin = reg - R_GPIO_A0_CONTROL;
+
+        if (pin >= agc->nr_gpio_pins) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid pin number: %d\n",
+                          __func__, pin);
+            return;
+        }
+
+        if (SHARED_FIELD_EX32(data, GPIO_CONTROL_RESERVED)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid reserved data: 0x%"
+                          PRIx64"\n", __func__, data);
+            return;
+        }
+
+        aspeed_gpio_write_control_reg(s, pin, type, data);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: no setter for offset 0x%"
+                      PRIx64"\n", __func__, offset);
+        break;
+    }
+
+    return;
+}
+
 /****************** Setup functions ******************/
 static const GPIOSetProperties ast2400_set_props[ASPEED_GPIO_MAX_NR_SETS] = {
     [0] = {0xffffffff,  0xffffffff,  {"A", "B", "C", "D"} },
@@ -1010,6 +1345,16 @@ static GPIOSetProperties ast1030_set_props[ASPEED_GPIO_MAX_NR_SETS] = {
     [5] = {0x000000ff,  0x00000000,  {"U"} },
 };
 
+static GPIOSetProperties ast2700_set_props[ASPEED_GPIO_MAX_NR_SETS] = {
+    [0] = {0xffffffff,  0xffffffff,  {"A", "B", "C", "D"} },
+    [1] = {0x0fffffff,  0x0fffffff,  {"E", "F", "G", "H"} },
+    [2] = {0xffffffff,  0xffffffff,  {"I", "J", "K", "L"} },
+    [3] = {0xffffffff,  0xffffffff,  {"M", "N", "O", "P"} },
+    [4] = {0xffffffff,  0xffffffff,  {"Q", "R", "S", "T"} },
+    [5] = {0xffffffff,  0xffffffff,  {"U", "V", "W", "X"} },
+    [6] = {0x00ffffff,  0x00ffffff,  {"Y", "Z", "AA"} },
+};
+
 static const MemoryRegionOps aspeed_gpio_ops = {
     .read       = aspeed_gpio_read,
     .write      = aspeed_gpio_write,
@@ -1018,6 +1363,14 @@ static const MemoryRegionOps aspeed_gpio_ops = {
     .valid.max_access_size = 4,
 };
 
+static const MemoryRegionOps aspeed_gpio_2700_ops = {
+    .read       = aspeed_gpio_2700_read,
+    .write      = aspeed_gpio_2700_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+};
+
 static void aspeed_gpio_reset(DeviceState *dev)
 {
     AspeedGPIOState *s = ASPEED_GPIO(dev);
@@ -1187,6 +1540,18 @@ static void aspeed_gpio_1030_class_init(ObjectClass *klass, void *data)
     agc->reg_ops = &aspeed_gpio_ops;
 }
 
+static void aspeed_gpio_2700_class_init(ObjectClass *klass, void *data)
+{
+    AspeedGPIOClass *agc = ASPEED_GPIO_CLASS(klass);
+
+    agc->props = ast2700_set_props;
+    agc->nr_gpio_pins = 216;
+    agc->nr_gpio_sets = 7;
+    agc->reg_table_count = GPIO_2700_REG_ARRAY_SIZE;
+    agc->mem_size = 0x1000;
+    agc->reg_ops = &aspeed_gpio_2700_ops;
+}
+
 static const TypeInfo aspeed_gpio_info = {
     .name           = TYPE_ASPEED_GPIO,
     .parent         = TYPE_SYS_BUS_DEVICE,
@@ -1231,6 +1596,13 @@ static const TypeInfo aspeed_gpio_ast1030_info = {
     .instance_init  = aspeed_gpio_init,
 };
 
+static const TypeInfo aspeed_gpio_ast2700_info = {
+    .name           = TYPE_ASPEED_GPIO "-ast2700",
+    .parent         = TYPE_ASPEED_GPIO,
+    .class_init     = aspeed_gpio_2700_class_init,
+    .instance_init  = aspeed_gpio_init,
+};
+
 static void aspeed_gpio_register_types(void)
 {
     type_register_static(&aspeed_gpio_info);
@@ -1239,6 +1611,7 @@ static void aspeed_gpio_register_types(void)
     type_register_static(&aspeed_gpio_ast2600_3_3v_info);
     type_register_static(&aspeed_gpio_ast2600_1_8v_info);
     type_register_static(&aspeed_gpio_ast1030_info);
+    type_register_static(&aspeed_gpio_ast2700_info);
 }
 
 type_init(aspeed_gpio_register_types);
-- 
2.34.1

