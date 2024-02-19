Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp970636ejb;
        Mon, 19 Feb 2024 15:02:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXXRZxYszv9stKf1m6YV32mzfRja+2kzLA4SKAzHDSIYFnJaDA11Cgi4vLzYkhuEj5U7c814vzRx02luELgVQzXjFd3Po7O
X-Google-Smtp-Source: AGHT+IFdEAiyzn9MPaaZddeVAi1GSIqXvcPi52IUfzYOn41ISkxALD/b+IK4s4QrzmCSVr6a33TU
X-Received: by 2002:aca:90b:0:b0:3c0:34d9:4d7a with SMTP id 11-20020aca090b000000b003c034d94d7amr13272621oij.18.1708383745052;
        Mon, 19 Feb 2024 15:02:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708383745; cv=none;
        d=google.com; s=arc-20160816;
        b=ecrHMBsiolYPHpoF2Qfr/4Eoqip43/jXMTvEsypkLxdv1ZBqK5gVi7QQBlzTnPrNik
         SehVpRAYDQYhvLx5C8TX6b9TPqicdOqU8PhovzajD+vk4nMFozJh4ghsYt7ixca0aMyO
         AfduH+WyvyBE2dDicfF8tGI07VM139EUmImYozynMz81OFZWeUe26/eSIn/Pl8TCmIU/
         3GZE6gfKUo3aCYLvJqhhTOqrz+kHVZemnA2s0v0try9ciNNXurXh/koc4qJsRIpyxBMO
         qW+RCh578LW3iwdTNkRt2tSOidh/KDPyqHu29stOB8jcyRsivg6PQCN746XjXKqcZ0Z6
         8RqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=f1fVUCqWusRM++ozJ5Qk9LhzZuBr3Ghsq7WXiNYgSLg=;
        fh=l8S81+H+dijHanFQZZPLJ8cwKh6wX9nJrPsKOLFcz9k=;
        b=hk6LCEWhm+yjmBzurhNLsPukIOFcFjI9Zc5nvg330L52SIe2yeN87+qqzAdMex0fKL
         Y83GxSjEWtq9Xkga6It5Hzx/PL4rPSWO23yXKkBAYeY1+D+sXZsnkbVmXl+s7E5o8YKa
         MHRp/C/YOstjcSPEyh/CMp/jcC0Xx2p3C56xVqmBQDKK7B0M5723DX2Tpwqr+I4MSrVC
         eOVVlpdTzgbqHHHeibNfmRJfg+KM62uRRaVVS65biuSFThdX8lbOpheP+SF3DvpchIry
         DOTIPVYyPsXXeVh6SdbGuPtEx711MKJosCpiHQ5UjCVeRUOkoTAReUhbMrNlcnsgqxb3
         d3/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wp657bpR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey8-20020a0562140b6800b0068f34f21e75si7885836qvb.109.2024.02.19.15.02.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Feb 2024 15:02:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wp657bpR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcCe1-0001Y4-Iu; Mon, 19 Feb 2024 18:01:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1rcCdv-0001Vd-Rw; Mon, 19 Feb 2024 18:01:49 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1rcCdu-00040S-2X; Mon, 19 Feb 2024 18:01:47 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4126ea3b6fcso211905e9.3; 
 Mon, 19 Feb 2024 15:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708383704; x=1708988504; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f1fVUCqWusRM++ozJ5Qk9LhzZuBr3Ghsq7WXiNYgSLg=;
 b=Wp657bpR2YS865gvOd/CRCGy00/yOoPgtd63QUTEl+yM9W5wgJP46ghZDzLSs5yxYG
 VCeiTqrncBIu5/kCr73/VfaFHS6Ock+H+N2AU9I7Zx1smsOjEQciENX6M7kRUjAkteq8
 XQukKpMEdWUdveNmG7amVe99Ucda7xXJLksEZRhJatB7quE+NOWO78dLpQt5qiuIYr3T
 +NvROPonh3JOw59TUVsTlc4ILkLUjuaKJW0Rp6NKhuuQ3jwsYYnSy30cEzMJyVTQ6cGR
 4QRMLtU6fQ7hj+zlKalu2DMDEhgE71YBimJCkjCg1wgDzCxmaFbAauwxZm7SOkKukPjh
 Nn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708383704; x=1708988504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f1fVUCqWusRM++ozJ5Qk9LhzZuBr3Ghsq7WXiNYgSLg=;
 b=QK4Vi9uTm2ka+yN+/NTbg3OU2K3eApWu034cNCWma5Llu/u4YsikJ3IuK3o8JcQmB3
 IQ2euXrP7sIwLIZrPOvcl0aLKyfpcWFRnvJdRuv4+ZcRD5WBDzOaRu/v+6d20lcXVauL
 ds/vQ2FIBNcvIdEzWhmaF1i5fhcMjRdzDEDnws3cEuT98pwTFnUEjRr1ixPiam5DL2b7
 Bm3I8BA6FRVFnJY3S/0FqSKtNC0cTLvBrU5ll3eIV7YziEPCHVur5bQ+AFUeiBpgz7W4
 9ieD1ZhQgd7WNLD03ce6tVG0eQ1/KKreX9M90LmbBkmwwX5aXjuYPHZoMUuGzPKGGtKJ
 dIvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsCZ8iuLMCPNoNGA5miGrDsU8cHoCM7uZhVzwehq+spq12ir8Vwl+6EzAIu2tfTKK5TQNbAVG9MZ2A/aMirhVUds0R
X-Gm-Message-State: AOJu0YyFz5cLyNNKtTtfL+cmsfrkZxwB27mwEw9QO2lZzulk9mWsUe0J
 fkbVQQD4aXs1NCvzxIyRrevzTNCehv+aSGPvuSKkhzbJAZ4ugf17nYNEzsn1aMc=
X-Received: by 2002:a05:600c:3541:b0:412:6e8a:efff with SMTP id
 i1-20020a05600c354100b004126e8aefffmr56314wmq.16.1708383703120; 
 Mon, 19 Feb 2024 15:01:43 -0800 (PST)
Received: from localhost.localdomain ([37.186.51.232])
 by smtp.gmail.com with ESMTPSA id
 13-20020a05600c020d00b00410dd253008sm12508206wmi.42.2024.02.19.15.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 15:01:42 -0800 (PST)
From: Rayhan Faizel <rayhan.faizel@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@linaro.org, pbonzini@redhat.com,
 qemu-arm@nongnu.org, Rayhan Faizel <rayhan.faizel@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 3/3] tests/qtest: Add testcase for BCM2835 BSC
Date: Tue, 20 Feb 2024 04:29:58 +0530
Message-Id: <20240219225958.2421873-4-rayhan.faizel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219225958.2421873-1-rayhan.faizel@gmail.com>
References: <20240219225958.2421873-1-rayhan.faizel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=rayhan.faizel@gmail.com; helo=mail-wm1-x32f.google.com
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
X-TUID: kwF1MM3omIX3

Simple testcase for validating proper operation of read and write for all
three BSC controllers.

Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>
---
 tests/qtest/bcm2835-i2c-test.c | 105 +++++++++++++++++++++++++++++++++
 tests/qtest/meson.build        |   2 +-
 2 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/bcm2835-i2c-test.c

diff --git a/tests/qtest/bcm2835-i2c-test.c b/tests/qtest/bcm2835-i2c-test.c
new file mode 100644
index 0000000000..6ec15b8976
--- /dev/null
+++ b/tests/qtest/bcm2835-i2c-test.c
@@ -0,0 +1,105 @@
+/*
+ * QTest testcase for Broadcom Serial Controller (BSC)
+ *
+ * Copyright (c) 2024 Rayhan Faizel <rayhan.faizel@gmail.com>
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

