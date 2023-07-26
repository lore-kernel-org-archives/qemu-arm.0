Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp561479ejb;
        Wed, 26 Jul 2023 06:51:39 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGw4TEvlrXnd12iNZ65DQmTyM8YYbJgZQ5ZwDwUuzEyr6gkFNWGoK6wMobJD1EF0oM9AwQJ
X-Received: by 2002:a05:620a:414b:b0:767:2b14:6898 with SMTP id k11-20020a05620a414b00b007672b146898mr2513161qko.49.1690379499381;
        Wed, 26 Jul 2023 06:51:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690379499; cv=none;
        d=google.com; s=arc-20160816;
        b=wsM/5ydAtQ2+jiaUBwIYOURb+Rw9ghsfI7y62H7ZGcv2wnEXDRWmqNDgEYU5TJtSBw
         g6ecs6jM8+0BZ4FSWiyd+kFUGCEGKiJ9cm1REjkjfdlVnvRFgcTH4lYqIqPG3+fAi/8T
         WT2tcq4hGqTuuPeccRaPLZe4TPXHOmbzc0TtxMsvfDCfnycDkCnPLxtFxwo2ehnoLNcW
         TpPp5h0hWuqJaMLS3/QWrzz4Dq9JbBsWqSrnEiF5oiFkfEnxV6YXlQ1hlJ87Cy2x5XOO
         hq2tJHJcz4Q4uHGW7yVcKNRBx9cqoL2oXrWSscHGnZoblv0wQw4MNiWFsht59Owwcehk
         g/ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+wVe0eUBLqPm0eczAYS/bVDkPjCsXHCk5Md+hKvYTUU=;
        fh=f5jt6gD4kTKAQV2ukO6ZfXPs+EJm4Q1+uDtHV6gcJRE=;
        b=hgYWhENpCKDY5evQQB2qfnNNNiQmW/8hUBMKgw5xyMM80fLJdMRY3xu3U4X7A8x28v
         aPlto54RlcVDBOvZwd9nz9ZdxNKJIy5mx78j+lZ1Y7jrPmNFdqebRnFsKm5IRww9Vj6C
         /nKV980PvGPtd4ldTfUb4a6A/5Ff51R5o/fupPZ3F67YQCKKqh2r9iJEsqTPES9/olsj
         ZCa9Zmx2HIGJV/uYmDImLij8EZAr5fNuaomSYcsrKa91lSpfQZ7OTAed8uz7ICnYv4j9
         9WQ4ARwah9zeK4jnwZFeTSquHFj011QncbqXkvVHEWJCQo1IkbFTcLx3MkNZv31s3ZTE
         wr8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=khXncxjy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7-20020a05620a294700b007683249d282si8422851qkp.302.2023.07.26.06.51.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jul 2023 06:51:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=khXncxjy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOeWa-0002pc-S7; Wed, 26 Jul 2023 09:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1qOeWB-0002cG-9n; Wed, 26 Jul 2023 09:25:31 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1qOeW9-00039l-5e; Wed, 26 Jul 2023 09:25:30 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fe05fbe250so2996843e87.0; 
 Wed, 26 Jul 2023 06:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690377927; x=1690982727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+wVe0eUBLqPm0eczAYS/bVDkPjCsXHCk5Md+hKvYTUU=;
 b=khXncxjyS9wYos3u37mTyFOtwhj2HKTTr7HspuoikiTqchExSmNUswDcLLJKDDjBPt
 iKeF5WC4Uup9VH5ZeJweg3a1hN5S4l6VP9jSUJue3WrK9qVWxnEcosjfLMkzdVPXkrid
 TbDrkwKGPAl6nDcGAUNU3zgZg1MOHTYAWI5uoTT0xufeGakeki9FyaP6ah1wCtcSgLp9
 SxqEzVawDO/2HgSGccnKVfVdRhHcPygjGtS1svw0vevUsMytufvnzv00HJiPysf4IES8
 iKUZNR38jyRsXyTYJJoadS93d2vVaPACcBBQWag2RAX1Qrq10YRFs50VrAMRQF1GIidW
 EWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690377927; x=1690982727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+wVe0eUBLqPm0eczAYS/bVDkPjCsXHCk5Md+hKvYTUU=;
 b=fxwRLa2OHHeVGaRGf6rLxPc8xWKxsjqnKUcpl69n7YSddcdRAmm0cQVNDMXr8HiIBL
 BJoBN9qWwDL3F45qgmaFojhoyOmG5wybBZmzWeyW5UJ36qnSDVFAlxbK1DGUMuc6E+XD
 Wcos7pkORtU9X55GX/yS7grfQGMq5FwTdWXci6uIpV+Q+1lmYlJXD3TRRt5ZltIyH7z5
 6DYfwSqT4c1hR6wmh/n5H/ARuW8gAswb1wwhUa4LMAl4UBraViyvQV3iLjlyyHnzLVQh
 ixyxsO6YPOAE2FU1DM0HpyzqIkDLkvA8ePzUAKgS2egVaQAelBnnEl0oqG/fGGEEfTA6
 mxcw==
X-Gm-Message-State: ABy/qLZ9KsGllbfhIkLVAoJ25cysg4cZELeIlaZe9fKGd9uDx95ep9n9
 JkKvSOLmS6fxD96zkE0prTRutJ20Qb0=
X-Received: by 2002:a19:9119:0:b0:4f9:5781:8628 with SMTP id
 t25-20020a199119000000b004f957818628mr1515806lfd.24.1690377926773; 
 Wed, 26 Jul 2023 06:25:26 -0700 (PDT)
Received: from sergevik-thinkpad.localdomain ([213.197.136.186])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a19f516000000b004fe0c3d8bb4sm565079lfb.84.2023.07.26.06.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 06:25:26 -0700 (PDT)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH 07/44] Implement BCM2838 GPIO functionality
Date: Wed, 26 Jul 2023 16:24:35 +0300
Message-Id: <20230726132512.149618-8-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726132512.149618-1-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=serg.oker@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xzstJl9IqMIh

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 hw/gpio/bcm2838_gpio.c | 197 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 193 insertions(+), 4 deletions(-)

diff --git a/hw/gpio/bcm2838_gpio.c b/hw/gpio/bcm2838_gpio.c
index 59be608250..cc9f4f74a0 100644
--- a/hw/gpio/bcm2838_gpio.c
+++ b/hw/gpio/bcm2838_gpio.c
@@ -18,6 +18,7 @@
 #include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "hw/gpio/bcm2838_gpio.h"
+#include "hw/irq.h"
 
 #define GPFSEL0   0x00
 #define GPFSEL1   0x04
@@ -56,14 +57,139 @@
 #define RESET_VAL_CNTRL_REG2 0x50AAA95A;
 #define RESET_VAL_CNTRL_REG3 0x00055555;
 
+#define NUM_FSELN_IN_GPFSELN 10
+#define NUM_BITS_FSELN       3
+#define MASK_FSELN           0x7
+
 #define BYTES_IN_WORD        4
 
+static uint32_t gpfsel_get(BCM2838GpioState *s, uint8_t reg)
+{
+    int i;
+    uint32_t value = 0;
+    for (i = 0; i < NUM_FSELN_IN_GPFSELN; i++) {
+        uint32_t index = NUM_FSELN_IN_GPFSELN * reg + i;
+        if (index < sizeof(s->fsel)) {
+            value |= (s->fsel[index] & MASK_FSELN) << (NUM_BITS_FSELN * i);
+        }
+    }
+    return value;
+}
+
+static void gpfsel_set(BCM2838GpioState *s, uint8_t reg, uint32_t value)
+{
+    int i;
+    for (i = 0; i < NUM_FSELN_IN_GPFSELN; i++) {
+        uint32_t index = NUM_FSELN_IN_GPFSELN * reg + i;
+        if (index < sizeof(s->fsel)) {
+            int fsel = (value >> (NUM_BITS_FSELN * i)) & MASK_FSELN;
+            s->fsel[index] = fsel;
+        }
+    }
+}
+
+static int gpfsel_is_out(BCM2838GpioState *s, int index)
+{
+    if (index >= 0 && index < BCM2838_GPIO_NUM) {
+        return s->fsel[index] == 1;
+    }
+    return 0;
+}
+
+static void gpset(BCM2838GpioState *s, uint32_t val, uint8_t start,
+                  uint8_t count, uint32_t *lev)
+{
+    uint32_t changes = val & ~*lev;
+    uint32_t cur = 1;
+
+    int i;
+    for (i = 0; i < count; i++) {
+        if ((changes & cur) && (gpfsel_is_out(s, start + i))) {
+            qemu_set_irq(s->out[start + i], 1);
+        }
+        cur <<= 1;
+    }
+
+    *lev |= val;
+}
+
+static void gpclr(BCM2838GpioState *s, uint32_t val, uint8_t start,
+                  uint8_t count, uint32_t *lev)
+{
+    uint32_t changes = val & *lev;
+    uint32_t cur = 1;
+
+    int i;
+    for (i = 0; i < count; i++) {
+        if ((changes & cur) && (gpfsel_is_out(s, start + i))) {
+            qemu_set_irq(s->out[start + i], 0);
+        }
+        cur <<= 1;
+    }
+
+    *lev &= ~val;
+}
+
 static uint64_t bcm2838_gpio_read(void *opaque, hwaddr offset, unsigned size)
 {
+    BCM2838GpioState *s = (BCM2838GpioState *)opaque;
     uint64_t value = 0;
 
-    qemu_log_mask(LOG_UNIMP, "%s: %s: not implemented for %"HWADDR_PRIx"\n",
-                    TYPE_BCM2838_GPIO, __func__, offset);
+    switch (offset) {
+    case GPFSEL0:
+    case GPFSEL1:
+    case GPFSEL2:
+    case GPFSEL3:
+    case GPFSEL4:
+    case GPFSEL5:
+        value = gpfsel_get(s, offset / BYTES_IN_WORD);
+        break;
+    case GPSET0:
+    case GPSET1:
+    case GPCLR0:
+    case GPCLR1:
+        /* Write Only */
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: %s: Attempt reading from write only"
+                      " register. %lu will be returned. Address 0x%"HWADDR_PRIx
+                      ", size %u\n", TYPE_BCM2838_GPIO, __func__, value, offset,
+                      size);
+        break;
+    case GPLEV0:
+        value = s->lev0;
+        break;
+    case GPLEV1:
+        value = s->lev1;
+        break;
+    case GPEDS0:
+    case GPEDS1:
+    case GPREN0:
+    case GPREN1:
+    case GPFEN0:
+    case GPFEN1:
+    case GPHEN0:
+    case GPHEN1:
+    case GPLEN0:
+    case GPLEN1:
+    case GPAREN0:
+    case GPAREN1:
+    case GPAFEN0:
+    case GPAFEN1:
+        /* Not implemented */
+        qemu_log_mask(LOG_UNIMP, "%s: %s: not implemented for %"HWADDR_PRIx"\n",
+                      TYPE_BCM2838_GPIO, __func__, offset);
+        break;
+    case GPIO_PUP_PDN_CNTRL_REG0:
+    case GPIO_PUP_PDN_CNTRL_REG1:
+    case GPIO_PUP_PDN_CNTRL_REG2:
+    case GPIO_PUP_PDN_CNTRL_REG3:
+        value = s->pup_cntrl_reg[(offset - GPIO_PUP_PDN_CNTRL_REG0)
+                                 / sizeof(s->pup_cntrl_reg[0])];
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: %s: bad offset %"HWADDR_PRIx"\n",
+                      TYPE_BCM2838_GPIO, __func__, offset);
+        break;
+    }
 
     return value;
 }
@@ -71,14 +197,77 @@ static uint64_t bcm2838_gpio_read(void *opaque, hwaddr offset, unsigned size)
 static void bcm2838_gpio_write(void *opaque, hwaddr offset, uint64_t value,
                                unsigned size)
 {
-    qemu_log_mask(LOG_UNIMP, "%s: %s: not implemented for %"HWADDR_PRIx"\n",
-                    TYPE_BCM2838_GPIO, __func__, offset);
+    BCM2838GpioState *s = (BCM2838GpioState *)opaque;
+
+    switch (offset) {
+    case GPFSEL0:
+    case GPFSEL1:
+    case GPFSEL2:
+    case GPFSEL3:
+    case GPFSEL4:
+    case GPFSEL5:
+        gpfsel_set(s, offset / BYTES_IN_WORD, value);
+        break;
+    case GPSET0:
+        gpset(s, value, 0, 32, &s->lev0);
+        break;
+    case GPSET1:
+        gpset(s, value, 32, 22, &s->lev1);
+        break;
+    case GPCLR0:
+        gpclr(s, value, 0, 32, &s->lev0);
+        break;
+    case GPCLR1:
+        gpclr(s, value, 32, 22, &s->lev1);
+        break;
+    case GPLEV0:
+    case GPLEV1:
+        /* Read Only */
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: %s: Attempt writing %lu to read "
+                      "only register. Ignored. Address 0x%"HWADDR_PRIx", size "
+                      "%u\n", TYPE_BCM2838_GPIO, __func__, value, offset, size);
+        break;
+    case GPEDS0:
+    case GPEDS1:
+    case GPREN0:
+    case GPREN1:
+    case GPFEN0:
+    case GPFEN1:
+    case GPHEN0:
+    case GPHEN1:
+    case GPLEN0:
+    case GPLEN1:
+    case GPAREN0:
+    case GPAREN1:
+    case GPAFEN0:
+    case GPAFEN1:
+        /* Not implemented */
+        qemu_log_mask(LOG_UNIMP, "%s: %s: not implemented for %"HWADDR_PRIx"\n",
+                      TYPE_BCM2838_GPIO, __func__, offset);
+        break;
+    case GPIO_PUP_PDN_CNTRL_REG0:
+    case GPIO_PUP_PDN_CNTRL_REG1:
+    case GPIO_PUP_PDN_CNTRL_REG2:
+    case GPIO_PUP_PDN_CNTRL_REG3:
+        s->pup_cntrl_reg[(offset - GPIO_PUP_PDN_CNTRL_REG0)
+                         / sizeof(s->pup_cntrl_reg[0])] = value;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: %s: bad offset %"HWADDR_PRIx"\n",
+                  TYPE_BCM2838_GPIO, __func__, offset);
+    }
+    return;
 }
 
 static void bcm2838_gpio_reset(DeviceState *dev)
 {
     BCM2838GpioState *s = BCM2838_GPIO(dev);
 
+    int i;
+    for (i = 0; i < 6; i++) {
+        gpfsel_set(s, i, 0);
+    }
+
     s->lev0 = 0;
     s->lev1 = 0;
 
-- 
2.34.1

