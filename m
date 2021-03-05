Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp600243lfg;
        Fri, 5 Mar 2021 10:49:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMDBBpGIuYCTCwfIp/mp4kw65TVUP2xeDups2GHgEIrMDL/BwsvD9keeh7pGZpUcKzsB8H
X-Received: by 2002:a02:7657:: with SMTP id z84mr11532586jab.103.1614970151500;
        Fri, 05 Mar 2021 10:49:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614970151; cv=none;
        d=google.com; s=arc-20160816;
        b=JX18f6Mqc39l8mv+w7DNUD7205VuMrDDs7XLq8QZbriP/qezC7kg0oDAhBQckcia1P
         wWIboTyZ0/qNs3ebd+6s/M7rPzoxY04SuCyNvQpLRCHAUpH0GfKK5OOCsse7u3eeG+Wc
         WDNj0TMaWxyb5KTH75e+KjAJd3hXyPHa9tbOLiD2X4E0KLkimXlx0fLdXLc21UJLNaOr
         5Lg5AASO3YyMWoHE8QQlsKfll7Vn3/e2H7wPUT3hEUm0UNbZAt4wxXXHQXhQ3V2w6ozG
         /4/LwGoalPpKNE+t4W503fWt/beumAg3CHwXR+vmV1FBRHKnNWw9bIMxRdS6aTyKYXeg
         +TbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:cc:to:subject
         :references:mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=6DnqYV2qhu32scty/F7T/6bVDk8dFU19TMQvSpzPB6I=;
        b=B7ZKEJRXTpQUzvfcBQ7EhbayATP30el/ebuh/2d0sAnKf0C5Rby+JTLkhDmpH+0Zzm
         Ks8Su30vLTunQcktJRznBJIHPeIeRxVngtVszpnrus988hU372AjHIPp547AY8oaehf/
         36mjzXrw+nwHsOYAgT070OmZEbyQoftiepJDJJfWdFe9O50H0iGCZB+W9h9hRw07fxTd
         CQ6PcN9HQq4/+1fJZfN/lRieBlABEJWtnuYtT3NsxEB22K1R20tq/9InY0sVzc/1EaEi
         9uW1X9nbPQV+HS3o+UBQAhhnDvkVwTnTHY5vHkgvMSxU+bP1Upr7dJUo9rmBcoFxFbOG
         BNmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=hJ0PZXMH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b28si2997394jav.105.2021.03.05.10.49.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Mar 2021 10:49:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=hJ0PZXMH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:44212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lIFVe-00031Q-Q2
	for alex.bennee@linaro.org; Fri, 05 Mar 2021 13:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3EntCYAgKCBsNL81FKJ87FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--wuhaotsh.bounces.google.com>)
 id 1lIFN9-0006mv-HM
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 13:40:23 -0500
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:42562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3EntCYAgKCBsNL81FKJ87FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--wuhaotsh.bounces.google.com>)
 id 1lIFN6-00071q-Ds
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 13:40:23 -0500
Received: by mail-pg1-x54a.google.com with SMTP id m14so1904952pgr.9
 for <qemu-arm@nongnu.org>; Fri, 05 Mar 2021 10:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=6DnqYV2qhu32scty/F7T/6bVDk8dFU19TMQvSpzPB6I=;
 b=hJ0PZXMHataaSS3PiK96IAnNvpnevLZzaHEhwZPqDD1/5w2Nv4SMc2KpLz8fK4BM7x
 JRGo+4hfoiPKmwPCqWONW8n8D2FeuRWf89wJjtwW0SUtU1TKJOp64FdTcbxOnsYuaTgR
 3gQa/JHqECJhTlZncDwL2Qsbny/XtS9nfjdm18adLmBjOgt+A+QszBturvpSy4lmd6KN
 ueUGVquB8pJuxjnWL02lmAcuRJ11oj3OyNVEOKQMMRCFHjG2jS9wyRjq98NJWPoa/m3L
 3qYmJHe9poJlMBwIljMQpC8Rg6urX5EPgzIiwgUhGY3TrL0QEvr70Bifv8aUjA2mSg3M
 7OIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=6DnqYV2qhu32scty/F7T/6bVDk8dFU19TMQvSpzPB6I=;
 b=S/AVFgMnOQQssZv3xI6nqHjdu8PdJdgPZnVOQuPxCIghG3BZBSXKnmzVyMnYCWu87Z
 nhQvH5IOdMlJX3XZWGswDg/yWQsxtDoZ3A/q1sycwn0DxTWkhPzyD+Y5lQfxNcg4vdig
 /9uBIByfJe1N9pLrgzFCyV+96ClJTRgkSOyJ/jLolG2xazLp2eNIxSaOh6N6ae2q8BKf
 cCK6tKtZilDSG7z/l7bqSZ8L2qBT4Usz29R6MIra4NcCY79la6MeFdue66QjR70Zkpw6
 VF+o69yaf66bD+1okcQvGE0nYNKiJM960oDTEOdfL10ZQYn5hOfpMtJZMLb0/n0iwqBE
 ohGw==
X-Gm-Message-State: AOAM5324aUST2RmpeuKN0R1sGsx8ndotqYtpze8E2fffDSpIR2VWO0hw
 3E8lxwDyg80dcUREOiVutEBEatJ8zs+Tsg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:aa87:b029:e5:e1fc:be6 with SMTP
 id d7-20020a170902aa87b02900e5e1fc0be6mr7021186plr.4.1614969618672; Fri, 05
 Mar 2021 10:40:18 -0800 (PST)
Date: Fri,  5 Mar 2021 10:38:56 -0800
In-Reply-To: <20210305183857.3120188-1-wuhaotsh@google.com>
Message-Id: <20210305183857.3120188-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210305183857.3120188-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
Subject: [PATCH 3/4] hw/arm: Connect PWM fans in NPCM7XX boards
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 venture@google.com, dje@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3EntCYAgKCBsNL81FKJ87FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From:  Hao Wu via <qemu-arm@nongnu.org>
X-TUID: knLYNVcOE1R/

This patch adds fan_splitters (split IRQs) in NPCM7XX boards. Each fan
splitter corresponds to 1 PWM output and can connect to multiple fan
inputs (MFT devices).
In NPCM7XX boards(NPCM750 EVB and Quanta GSJ boards), we initializes
these splitters and connect them to their corresponding modules
according their specific device trees.

Reviewed-by: Doug Evans <dje@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c  | 99 ++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/npcm7xx.h | 11 ++++-
 2 files changed, 109 insertions(+), 1 deletion(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index fbf6ce8e02..e22fe4bf8f 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -21,6 +21,7 @@
 #include "hw/core/cpu.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/loader.h"
+#include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
@@ -116,6 +117,64 @@ static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
     i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
 }
 
+static void npcm7xx_init_pwm_splitter(NPCM7xxMachine *machine,
+                                      NPCM7xxState *soc, const int *fan_counts)
+{
+    SplitIRQ *splitters = machine->fan_splitter;
+
+    /*
+     * PWM 0~3 belong to module 0 output 0~3.
+     * PWM 4~7 belong to module 1 output 0~3.
+     */
+    for (int i = 0; i < NPCM7XX_NR_PWM_MODULES; ++i) {
+        for (int j = 0; j < NPCM7XX_PWM_PER_MODULE; ++j) {
+            int splitter_no = i * NPCM7XX_PWM_PER_MODULE + j;
+            DeviceState *splitter;
+
+            if (fan_counts[splitter_no] < 1) {
+                continue;
+            }
+            object_initialize_child(OBJECT(machine), "fan-splitter[*]",
+                                    &splitters[splitter_no], TYPE_SPLIT_IRQ);
+            splitter = DEVICE(&splitters[splitter_no]);
+            qdev_prop_set_uint16(splitter, "num-lines",
+                                 fan_counts[splitter_no]);
+            qdev_realize(splitter, NULL, &error_abort);
+            qdev_connect_gpio_out_named(DEVICE(&soc->pwm[i]), "duty-gpio-out",
+                                        j, qdev_get_gpio_in(splitter, 0));
+        }
+    }
+}
+
+static void npcm7xx_connect_pwm_fan(NPCM7xxState *soc, SplitIRQ *splitter,
+                                    int fan_no, int output_no)
+{
+    DeviceState *fan;
+    int fan_input;
+    qemu_irq fan_duty_gpio;
+
+    g_assert(fan_no >= 0 && fan_no <= NPCM7XX_MFT_MAX_FAN_INPUT);
+    /*
+     * Fan 0~1 belong to module 0 input 0~1.
+     * Fan 2~3 belong to module 1 input 0~1.
+     * ...
+     * Fan 14~15 belong to module 7 input 0~1.
+     * Fan 16~17 belong to module 0 input 2~3.
+     * Fan 18~19 belong to module 1 input 2~3.
+     */
+    if (fan_no < 16) {
+        fan = DEVICE(&soc->mft[fan_no / 2]);
+        fan_input = fan_no % 2;
+    } else {
+        fan = DEVICE(&soc->mft[(fan_no - 16) / 2]);
+        fan_input = fan_no % 2 + 2;
+    }
+
+    /* Connect the Fan to PWM module */
+    fan_duty_gpio = qdev_get_gpio_in_named(fan, "duty", fan_input);
+    qdev_connect_gpio_out(DEVICE(splitter), output_no, fan_duty_gpio);
+}
+
 static void npcm750_evb_i2c_init(NPCM7xxState *soc)
 {
     /* lm75 temperature sensor on SVB, tmp105 is compatible */
@@ -128,6 +187,30 @@ static void npcm750_evb_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 6), "tmp105", 0x48);
 }
 
+static void npcm750_evb_fan_init(NPCM7xxMachine *machine, NPCM7xxState *soc)
+{
+    SplitIRQ *splitter = machine->fan_splitter;
+    static const int fan_counts[] = {2, 2, 2, 2, 2, 2, 2, 2};
+
+    npcm7xx_init_pwm_splitter(machine, soc, fan_counts);
+    npcm7xx_connect_pwm_fan(soc, &splitter[0], 0x00, 0);
+    npcm7xx_connect_pwm_fan(soc, &splitter[0], 0x01, 1);
+    npcm7xx_connect_pwm_fan(soc, &splitter[1], 0x02, 0);
+    npcm7xx_connect_pwm_fan(soc, &splitter[1], 0x03, 1);
+    npcm7xx_connect_pwm_fan(soc, &splitter[2], 0x04, 0);
+    npcm7xx_connect_pwm_fan(soc, &splitter[2], 0x05, 1);
+    npcm7xx_connect_pwm_fan(soc, &splitter[3], 0x06, 0);
+    npcm7xx_connect_pwm_fan(soc, &splitter[3], 0x07, 1);
+    npcm7xx_connect_pwm_fan(soc, &splitter[4], 0x08, 0);
+    npcm7xx_connect_pwm_fan(soc, &splitter[4], 0x09, 1);
+    npcm7xx_connect_pwm_fan(soc, &splitter[5], 0x0a, 0);
+    npcm7xx_connect_pwm_fan(soc, &splitter[5], 0x0b, 1);
+    npcm7xx_connect_pwm_fan(soc, &splitter[6], 0x0c, 0);
+    npcm7xx_connect_pwm_fan(soc, &splitter[6], 0x0d, 1);
+    npcm7xx_connect_pwm_fan(soc, &splitter[7], 0x0e, 0);
+    npcm7xx_connect_pwm_fan(soc, &splitter[7], 0x0f, 1);
+}
+
 static void quanta_gsj_i2c_init(NPCM7xxState *soc)
 {
     /* GSJ machine have 4 max31725 temperature sensors, tmp105 is compatible. */
@@ -142,6 +225,20 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
     /* TODO: Add additional i2c devices. */
 }
 
+static void quanta_gsj_fan_init(NPCM7xxMachine *machine, NPCM7xxState *soc)
+{
+    SplitIRQ *splitter = machine->fan_splitter;
+    static const int fan_counts[] = {2, 2, 2, 0, 0, 0, 0, 0};
+
+    npcm7xx_init_pwm_splitter(machine, soc, fan_counts);
+    npcm7xx_connect_pwm_fan(soc, &splitter[0], 0x00, 0);
+    npcm7xx_connect_pwm_fan(soc, &splitter[0], 0x01, 1);
+    npcm7xx_connect_pwm_fan(soc, &splitter[1], 0x02, 0);
+    npcm7xx_connect_pwm_fan(soc, &splitter[1], 0x03, 1);
+    npcm7xx_connect_pwm_fan(soc, &splitter[2], 0x04, 0);
+    npcm7xx_connect_pwm_fan(soc, &splitter[2], 0x05, 1);
+}
+
 static void npcm750_evb_init(MachineState *machine)
 {
     NPCM7xxState *soc;
@@ -153,6 +250,7 @@ static void npcm750_evb_init(MachineState *machine)
     npcm7xx_load_bootrom(machine, soc);
     npcm7xx_connect_flash(&soc->fiu[0], 0, "w25q256", drive_get(IF_MTD, 0, 0));
     npcm750_evb_i2c_init(soc);
+    npcm750_evb_fan_init(NPCM7XX_MACHINE(machine), soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
@@ -168,6 +266,7 @@ static void quanta_gsj_init(MachineState *machine)
     npcm7xx_connect_flash(&soc->fiu[0], 0, "mx25l25635e",
                           drive_get(IF_MTD, 0, 0));
     quanta_gsj_i2c_init(soc);
+    quanta_gsj_fan_init(NPCM7XX_MACHINE(machine), soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 42d4c1f717..82036898d4 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -18,6 +18,7 @@
 
 #include "hw/boards.h"
 #include "hw/adc/npcm7xx_adc.h"
+#include "hw/core/split-irq.h"
 #include "hw/cpu/a9mpcore.h"
 #include "hw/gpio/npcm7xx_gpio.h"
 #include "hw/i2c/npcm7xx_smbus.h"
@@ -47,8 +48,16 @@
 #define NPCM7XX_GIC_CPU_IF_ADDR         (0xf03fe100)  /* GIC within A9 */
 #define NPCM7XX_BOARD_SETUP_ADDR        (0xffff1000)  /* Boot ROM */
 
+#define NPCM7XX_NR_PWM_MODULES 2
+
 typedef struct NPCM7xxMachine {
     MachineState        parent;
+    /*
+     * PWM fan splitter. each splitter connects to one PWM output and
+     * multiple MFT inputs.
+     */
+    SplitIRQ            fan_splitter[NPCM7XX_NR_PWM_MODULES *
+                                     NPCM7XX_PWM_PER_MODULE];
 } NPCM7xxMachine;
 
 #define TYPE_NPCM7XX_MACHINE MACHINE_TYPE_NAME("npcm7xx")
@@ -81,7 +90,7 @@ typedef struct NPCM7xxState {
     NPCM7xxCLKState     clk;
     NPCM7xxTimerCtrlState tim[3];
     NPCM7xxADCState     adc;
-    NPCM7xxPWMState     pwm[2];
+    NPCM7xxPWMState     pwm[NPCM7XX_NR_PWM_MODULES];
     NPCM7xxMFTState     mft[8];
     NPCM7xxOTPState     key_storage;
     NPCM7xxOTPState     fuse_array;
-- 
2.30.1.766.gb4fecdf3b7-goog

