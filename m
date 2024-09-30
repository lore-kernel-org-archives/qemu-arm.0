Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1101592njc;
        Mon, 30 Sep 2024 01:54:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVo9Zz18RZC30u3yKOqhUY5GkJPRUuKkuSkjCJhhsshPgKPbE1azqD5VhBrQE42s3q6gTlJvy4n+kpPqw==@linaro.org
X-Google-Smtp-Source: AGHT+IEqoh4bHLOFg4YO8z0YCe6ybd1Q9o2yAycBqaQgCyoF6b/yXw0TWDDuneYxVbGyDufWI+wo
X-Received: by 2002:a05:620a:1915:b0:7a9:bf9f:5ccb with SMTP id af79cd13be357-7ae378245e8mr1847465585a.1.1727686477334;
        Mon, 30 Sep 2024 01:54:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727686477; cv=none;
        d=google.com; s=arc-20240605;
        b=B6ee6P+lWlXu/tPXT5bRCQdhC5lAQ+Al1dTMujhbWh+kT9Ms2GMn/P67kwd+m4dzfm
         tsS3/vGg8QIcvztslbVvUaxeK4z0mWF/B+/QsbnVp/zLbC7bC3qCgaB/ordScVFAvAWG
         i9FYM2RDUrTh7VCyXxlcXCJcW34JXalqdCKqq977v9tsqRz8BD+ZlxC4l9hk65ab4qvG
         T3yQucrtE6xCy2wpYf/zk3bEM/KejR3lzanzZLLVnAegu1qtk1m1SnIWnt0ZXX07v8dr
         RdzlPslqZcjOKzhEvR4P5oWx82KLOwDsdLHvA458iMtq/GAfLkoIukwVurImxiSQYIVj
         6DQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=ZHNB4LxnvTXzka7dx5WtdJWxt+H+LF+Ncm8ahhP/gQk=;
        fh=bfdvnURtAD34fQ77QeZnvwdM4/zSvHk1Doa+KIkv0v8=;
        b=K3Qd+0skI33flcpvdxEH5tchj/7XE+5pxSl/TQYj1zyPp51ft9TrX3m6dILJ+ac4mO
         TL6zAlSBiuLy+pTedMKsZPnGAgkUwXxpOBH+fbQvXqQxB/GF+BXnbFUpw647vYshPvyw
         N2XFTUJXIxTUtDQ/f2d0teZnWpoAvrhlMoenFq7oeQzpsINDbzddYbfp+pXSUVqlBi1z
         lXy58P5Ywlz7wOiiuMrasVKTIrlfBVVgZwgOQx79Kjg4f10N6QuBx9NnjqkcK+4BLvPE
         8BU+yQLB1c2g/I9MmGGDNRrtqtScqWMPhK/PfcVbVfFpsxvpvBGq2SL2gqV7C+HkloTt
         gGpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae378a2e0csi795313385a.723.2024.09.30.01.54.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 01:54:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svC9l-0005IG-8C; Mon, 30 Sep 2024 04:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1svC9Z-0004HH-Fc; Mon, 30 Sep 2024 04:53:18 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1svC9W-00025U-BY; Mon, 30 Sep 2024 04:53:11 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 30 Sep
 2024 16:52:41 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 30 Sep 2024 16:52:41 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v6 8/8] hw/gpio/aspeed: Add test case for AST2700
Date: Mon, 30 Sep 2024 16:52:39 +0800
Message-ID: <20240930085239.3089901-9-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240930085239.3089901-1-jamin_lin@aspeedtech.com>
References: <20240930085239.3089901-1-jamin_lin@aspeedtech.com>
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
X-TUID: drFvUiTOX/k5

Add test case to test GPIO output and input pins from A0 to D7 for AST2700.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/qtest/aspeed_gpio-test.c | 77 ++++++++++++++++++++++++++++++++--
 tests/qtest/meson.build        |  3 ++
 2 files changed, 76 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/aspeed_gpio-test.c b/tests/qtest/aspeed_gpio-test.c
index d38f51d719..03b3b1c2b2 100644
--- a/tests/qtest/aspeed_gpio-test.c
+++ b/tests/qtest/aspeed_gpio-test.c
@@ -33,6 +33,10 @@
 #define GPIO_ABCD_DATA_VALUE 0x000
 #define GPIO_ABCD_DIRECTION  0x004
 
+/* AST2700 */
+#define AST2700_GPIO_BASE 0x14C0B000
+#define GPIOA0_CONTROL 0x180
+
 static void test_set_colocated_pins(const void *data)
 {
     QTestState *s = (QTestState *)data;
@@ -72,17 +76,82 @@ static void test_set_input_pins(const void *data)
     g_assert_cmphex(value, ==, 0xffffffff);
 }
 
+static void test_2700_output_pins(const void *data)
+{
+    QTestState *s = (QTestState *)data;
+    uint32_t offset = 0;
+    uint32_t value = 0;
+    uint32_t pin = 0;
+
+    for (char c = 'A'; c <= 'D'; c++) {
+        for (int i = 0; i < 8; i++) {
+            offset = AST2700_GPIO_BASE + GPIOA0_CONTROL + (pin * 4);
+
+            /* output direction and output hi */
+            qtest_writel(s, offset, 0x00000003);
+            value = qtest_readl(s, offset);
+            g_assert_cmphex(value, ==, 0x00000003);
+
+            /* output direction and output low */
+            qtest_writel(s, offset, 0x00000002);
+            value = qtest_readl(s, offset);
+            g_assert_cmphex(value, ==, 0x00000002);
+            pin++;
+        }
+    }
+}
+
+static void test_2700_input_pins(const void *data)
+{
+    QTestState *s = (QTestState *)data;
+    char name[16];
+    uint32_t offset = 0;
+    uint32_t value = 0;
+    uint32_t pin = 0;
+
+    for (char c = 'A'; c <= 'D'; c++) {
+        for (int i = 0; i < 8; i++) {
+            sprintf(name, "gpio%c%d", c, i);
+            offset = AST2700_GPIO_BASE + GPIOA0_CONTROL + (pin * 4);
+            /* input direction */
+            qtest_writel(s, offset, 0);
+
+            /* set input */
+            qtest_qom_set_bool(s, "/machine/soc/gpio", name, true);
+            value = qtest_readl(s, offset);
+            g_assert_cmphex(value, ==, 0x00002000);
+
+            /* clear input */
+            qtest_qom_set_bool(s, "/machine/soc/gpio", name, false);
+            value = qtest_readl(s, offset);
+            g_assert_cmphex(value, ==, 0);
+            pin++;
+        }
+    }
+}
+
+
 int main(int argc, char **argv)
 {
+    const char *arch = qtest_get_arch();
     QTestState *s;
     int r;
 
     g_test_init(&argc, &argv, NULL);
 
-    s = qtest_init("-machine ast2600-evb");
-    qtest_add_data_func("/ast2600/gpio/set_colocated_pins", s,
-                        test_set_colocated_pins);
-    qtest_add_data_func("/ast2600/gpio/set_input_pins", s, test_set_input_pins);
+    if (strcmp(arch, "aarch64") == 0) {
+        s = qtest_init("-machine ast2700-evb");
+        qtest_add_data_func("/ast2700/gpio/input_pins",
+                            s, test_2700_input_pins);
+        qtest_add_data_func("/ast2700/gpio/out_pins", s, test_2700_output_pins);
+    } else {
+        s = qtest_init("-machine ast2600-evb");
+        qtest_add_data_func("/ast2600/gpio/set_colocated_pins", s,
+                            test_set_colocated_pins);
+        qtest_add_data_func("/ast2600/gpio/set_input_pins", s,
+                            test_set_input_pins);
+    }
+
     r = g_test_run();
     qtest_quit(s);
 
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 310865e49c..292980e3ad 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -209,6 +209,8 @@ qtests_aspeed = \
   ['aspeed_hace-test',
    'aspeed_smc-test',
    'aspeed_gpio-test']
+qtests_aspeed64 = \
+  ['aspeed_gpio-test']
 
 qtests_stm32l4x5 = \
   ['stm32l4x5_exti-test',
@@ -247,6 +249,7 @@ qtests_aarch64 = \
   (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test', 'bcm2835-i2c-test'] : []) +  \
   (config_all_accel.has_key('CONFIG_TCG') and                                            \
    config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed64 : []) + \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
-- 
2.34.1

