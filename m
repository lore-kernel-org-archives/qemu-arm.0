Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1282235ejf;
        Sat, 24 Feb 2024 12:24:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUi4fWubJvo2VoO50EPw4A40FgnJWO0ViJl2VhM0bl0fp9l60nb2HJ6u17J5YL/qcXoNU/+axmA6Z5idQl+S1FGM+0ZB3Jm
X-Google-Smtp-Source: AGHT+IGx5ZNTRex9qUoCXt85FUguDHGNrJkWdL0YOaNcb0rOCrWqax+OkDLr+VQWW5jFGgxXnXPE
X-Received: by 2002:a05:6808:7d1:b0:3c1:333e:683b with SMTP id f17-20020a05680807d100b003c1333e683bmr3257505oij.20.1708806272584;
        Sat, 24 Feb 2024 12:24:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708806272; cv=none;
        d=google.com; s=arc-20160816;
        b=xZhI7OSLj3nF95JB7vK9Y6IEhfGgDlTMCNdpQMwOCL8TKt0hM8BHwiGRvcVjZBt0YE
         lI3z254WngUcMfy7LrbyZtnKbNSHZmvEWqMKJsuATeBA9qGN+Y4n83mFu9o29mPFOJpM
         5t6boNzBBldUmtBVk5DkO5kxCTuWQt+R61N5gKH/3sSAAmTV+OnJHNogFzmhhYoTNcLT
         aBL09sKirYogADaMsbC99kmHLOGcZWV6mbY0TeGNGqXaMf0yRHljLPdOd8hw8DAHlM6J
         aEbBTh9T0W1aFoe6OD1NbB9aDw8blgmytDdMbkdpe4qLuXNI4BlzRw9MeRRhzrEVwJ5E
         BxDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=13OHCQV4gOWKyRBUqNbkx8gEZsa9oMxaeAkREwVQxP4=;
        fh=5/KJUnugQiXrkElACY+m8dFfns6Lyjy8NJwu7pH0uqI=;
        b=1DHv52E7cIgKgfw9HBXBFxaSndYXJ9q1tesCCkut3HG6NjqjQjMrsz70Z/Lmbiq5lX
         dgyziruqYRiOiegE9c8HHx2RClTMDvaW7Rr1Swyof5OBLOGLENhAqXu9j6nQsS288AkX
         gdIeSwhH57y5yw8dQIG3S56L9fm+vXz6SaHO74IZGOs721qpzt+Lmki0y8RedF/7lmEJ
         7ekDmd3j6P0wmsBkNE8ByBkunZRLcAjHAjiNo3gjTVC6pWKjSAtuYfs6reMFf+oU86na
         LMpZfVlmZEZDJ8sFp3GsYJ4o9pXfpUM3UkYeSTfo3oaitkQPI+Acb9P3Iwyvv7ZrLM4S
         Equg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=FgD7iL8Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s6-20020a05622a018600b0042e4da75f5dsi6285qtw.636.2024.02.24.12.24.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Feb 2024 12:24:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=FgD7iL8Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdyYh-00070b-FX; Sat, 24 Feb 2024 15:23:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1rdyYf-0006zX-BO; Sat, 24 Feb 2024 15:23:41 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1rdyYc-0004Ip-LH; Sat, 24 Feb 2024 15:23:41 -0500
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d275e63590so17637671fa.2; 
 Sat, 24 Feb 2024 12:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708806216; x=1709411016; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=13OHCQV4gOWKyRBUqNbkx8gEZsa9oMxaeAkREwVQxP4=;
 b=FgD7iL8QT1SC2XqbqY9ZgXGCjauPR+wOG0Fr+mBIVjlYgBRLu8528s2Ug1NflhH2LL
 Re2XmYl6fp+LdVEdRhvbFGg5wuWzneKCv4+QXRmr00EiwIO68ggu79gn7ajZSXoT3ah9
 IqVl2lXyD3FDNIsVZQNpw6wtD39pv9ul/k6DSv+6CVjeuZzf1W8dVe4KOz0uJvvuj3fR
 eB9uz90kop3b77JijPJi5Nl8bbLHDQw6I4nD3pPQeO61bmtu3enKVUMaHe0VGqKmczcy
 lze1A+4N+F/FkEE+i2xa6o22ez6VYFYqzpfuk8FbpB3/P/s4KNqpfJ38+YVbTliiuSLW
 R/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708806216; x=1709411016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=13OHCQV4gOWKyRBUqNbkx8gEZsa9oMxaeAkREwVQxP4=;
 b=DHC06W8IVL4EYLtcTN6W33nkGeN2LJI5r7+F5eVjuvk9ehiOhIVMC0EMlnPxqIxqP5
 8pgW4mAwmX5XFyiJdmRxFSmAx4E/T3hnrlvOlWvBcMdq8i9tGeloi3VjDsX5TRVIQoGQ
 hWFb2SBgBJU4tRMj06lYRsi3MEMxEqHhtkaQ049yOwBFxafUi90nXLbIyxYQAJMoVGhI
 Sm8ZHGBpTfVsWvbUe7TtiuMdyHHH8AmpPBEhVuDwO6rRBDAvb6c6cAqW8sK3yi0BLp8h
 gxeH4nF58BcG64FjT2mj++1P4XPnMgiphy/wjeapyv7Idk5KranM7WxqEqRcg//im7/M
 hU6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0+7URes1BpHbyqPZLPak0nyd9ulroZyNxWk8AO9wZ7okYi23Tsw1TUdsLM9tlo5/U4Sy6UxcKx0EeXN4VBrqTPyYF
X-Gm-Message-State: AOJu0YyX7zBplS6dlgZbWthw6larnt7EXZuGvKm2ECz4gJq6LVyJcwTL
 rBgd+GxMw8zjnYbaW5TnOthXIAha8Z8AG1VfPP9Krxwlk6nH4dcGWYQuKb0X
X-Received: by 2002:a2e:8552:0:b0:2d2:7f28:7fdd with SMTP id
 u18-20020a2e8552000000b002d27f287fddmr1035012ljj.52.1708806215742; 
 Sat, 24 Feb 2024 12:23:35 -0800 (PST)
Received: from localhost.localdomain ([212.70.108.232])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a50ee02000000b00560c6ff443esm816108eds.66.2024.02.24.12.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Feb 2024 12:23:35 -0800 (PST)
From: Rayhan Faizel <rayhan.faizel@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@linaro.org, pbonzini@redhat.com,
 qemu-arm@nongnu.org, Rayhan Faizel <rayhan.faizel@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v4 3/3] tests/qtest: Add testcase for BCM2835 BSC
Date: Sun, 25 Feb 2024 00:32:45 +0530
Message-Id: <20240224190245.2405016-4-rayhan.faizel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240224190245.2405016-1-rayhan.faizel@gmail.com>
References: <20240224190245.2405016-1-rayhan.faizel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=rayhan.faizel@gmail.com; helo=mail-lj1-x231.google.com
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
X-TUID: sh/4YwdVE2NU

Simple testcase for validating proper operation of read and write for all
three BSC controllers.

Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/bcm2835-i2c-test.c | 115 +++++++++++++++++++++++++++++++++
 tests/qtest/meson.build        |   2 +-
 2 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/bcm2835-i2c-test.c

diff --git a/tests/qtest/bcm2835-i2c-test.c b/tests/qtest/bcm2835-i2c-test.c
new file mode 100644
index 0000000000..513ecce61d
--- /dev/null
+++ b/tests/qtest/bcm2835-i2c-test.c
@@ -0,0 +1,115 @@
+/*
+ * QTest testcase for Broadcom Serial Controller (BSC)
+ *
+ * Copyright (c) 2024 Rayhan Faizel <rayhan.faizel@gmail.com>
+ *
+ * SPDX-License-Identifier: MIT
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest-single.h"
+
+#include "hw/i2c/bcm2835_i2c.h"
+#include "hw/sensor/tmp105_regs.h"
+
+static const uint32_t bsc_base_addrs[] = {
+    0x3f205000,                         /* I2C0 */
+    0x3f804000,                         /* I2C1 */
+    0x3f805000,                         /* I2C2 */
+};
+
+static void bcm2835_i2c_init_transfer(uint32_t base_addr, bool read)
+{
+    /* read flag is bit 0 so we can write it directly */
+    int interrupt = read ? BCM2835_I2C_C_INTR : BCM2835_I2C_C_INTT;
+
+    writel(base_addr + BCM2835_I2C_C,
+           BCM2835_I2C_C_I2CEN | BCM2835_I2C_C_INTD |
+           BCM2835_I2C_C_ST | BCM2835_I2C_C_CLEAR | interrupt | read);
+}
+
+static void test_i2c_read_write(gconstpointer data)
+{
+    uint32_t i2cdata;
+    intptr_t index = (intptr_t) data;
+    uint32_t base_addr = bsc_base_addrs[index];
+
+    /* Write to TMP105 register */
+    writel(base_addr + BCM2835_I2C_A, 0x50);
+    writel(base_addr + BCM2835_I2C_DLEN, 3);
+
+    bcm2835_i2c_init_transfer(base_addr, 0);
+
+    writel(base_addr + BCM2835_I2C_FIFO, TMP105_REG_T_HIGH);
+    writel(base_addr + BCM2835_I2C_FIFO, 0xde);
+    writel(base_addr + BCM2835_I2C_FIFO, 0xad);
+
+    /* Clear flags */
+    writel(base_addr + BCM2835_I2C_S, BCM2835_I2C_S_DONE | BCM2835_I2C_S_ERR |
+                                      BCM2835_I2C_S_CLKT);
+
+    /* Read from TMP105 register */
+    writel(base_addr + BCM2835_I2C_A, 0x50);
+    writel(base_addr + BCM2835_I2C_DLEN, 1);
+
+    bcm2835_i2c_init_transfer(base_addr, 0);
+
+    writel(base_addr + BCM2835_I2C_FIFO, TMP105_REG_T_HIGH);
+
+    writel(base_addr + BCM2835_I2C_DLEN, 2);
+    bcm2835_i2c_init_transfer(base_addr, 1);
+
+    i2cdata = readl(base_addr + BCM2835_I2C_FIFO);
+    g_assert_cmpint(i2cdata, ==, 0xde);
+
+    i2cdata = readl(base_addr + BCM2835_I2C_FIFO);
+    g_assert_cmpint(i2cdata, ==, 0xad);
+
+    /* Clear flags */
+    writel(base_addr + BCM2835_I2C_S, BCM2835_I2C_S_DONE | BCM2835_I2C_S_ERR |
+                                      BCM2835_I2C_S_CLKT);
+
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+    int i;
+
+    g_test_init(&argc, &argv, NULL);
+
+    for (i = 0; i < 3; i++) {
+        g_autofree char *test_name =
+        g_strdup_printf("/bcm2835/bcm2835-i2c%d/read_write", i);
+        qtest_add_data_func(test_name, (void *)(intptr_t) i,
+                            test_i2c_read_write);
+    }
+
+    /* Run I2C tests with TMP105 slaves on all three buses */
+    qtest_start("-M raspi3b "
+                "-device tmp105,address=0x50,bus=i2c-bus.0 "
+                "-device tmp105,address=0x50,bus=i2c-bus.1 "
+                "-device tmp105,address=0x50,bus=i2c-bus.2");
+    ret = g_test_run();
+    qtest_end();
+
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 39557d5ecb..8fe303160e 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -228,7 +228,7 @@ qtests_aarch64 = \
     ['tpm-tis-device-test', 'tpm-tis-device-swtpm-test'] : []) +                                         \
   (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
   (config_all_devices.has_key('CONFIG_XLNX_VERSAL') ? ['xlnx-canfd-test', 'xlnx-versal-trng-test'] : []) + \
-  (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
+  (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test', 'bcm2835-i2c-test'] : []) +  \
   (config_all_accel.has_key('CONFIG_TCG') and                                            \
    config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
   (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
-- 
2.34.1

