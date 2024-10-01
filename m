Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp210639njl;
        Tue, 1 Oct 2024 07:15:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXDjH5UiJ5Y2gPm+BQKV9wVYc7kuB/8eHA26b45DbIUNbnGWBMK+b0FvbysLFQnMu7CVlk+i25u7ABDcw==@linaro.org
X-Google-Smtp-Source: AGHT+IErElf4ptgpAPsJGSX61h1q6IoOgIF915AooylyZUT6UgDUtV6kJx888jkFid7v5ijTA6/p
X-Received: by 2002:ad4:5cae:0:b0:6c3:6344:d4e1 with SMTP id 6a1803df08f44-6cb729ff6edmr51721546d6.20.1727792101578;
        Tue, 01 Oct 2024 07:15:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727792101; cv=none;
        d=google.com; s=arc-20240605;
        b=PkifRuKxPjE1CcYiVYO4liGz2jNfk6firThDB1YVnQ7ECIr10svStspwfKtCOF7sbs
         cmEVBtZXhqmOCKZGQfWVg4L25cwzYDFgQAVPk5EiEjnFizqwCpjkN9lr0736G7DukL0R
         f3d7UuGMVw95PkG1JakJlwvbBOmPW8eQCW7lVHQf9+9Xz1AC94Wb+5SeEXkORGLPNBsa
         zzQqtuxar4FwSRNyqG2QbQ3tcmyNTcYoZknkuk1TRFS63pR6PWllWVzTVQrHXb9hARmB
         uuSX3VHjDZ+ITcH3w6Jdbo3gvV1WTso6+pjr5jJ2fGzC8piMKPUvnjbf7dR2oT9bJ2EP
         4+/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=BTwPFO/BhysuS2suf+GCLaZ1BVLv1u8k6feDMSx//Dg=;
        fh=bfdvnURtAD34fQ77QeZnvwdM4/zSvHk1Doa+KIkv0v8=;
        b=B1U6uozmEA5CrlMAWEXvu4gdOuZBcV7sT7P3RlvMGGMzMwdm2EwyoHc0tbq04w5WNH
         IxLH8o2HxrrSDu44KvgGdZg8ebbbtzFJotbPSSikHKDPDpoX9ykDlXCEzrvycCA0XE0j
         DKBXocDAapmoAO/lNDvz2O6yt1JcOqcUFQkQoG796R6N+24Bi989r0AVGTOLiIi4W+EQ
         OWxpA1BauevzMW8bbNYTQI5UcYdipxua3+cfVg0y3Kja6U9J9L21KQaEjYTcVcjV8Mhe
         VM/H068DeQQWfo4JdiARIwb5nUesboT9dmnCXcy0SAE6Mi1kLDknEzgNdD5O0k/4HE/f
         vU0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb3b602f4csi108536916d6.34.2024.10.01.07.15.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2024 07:15:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svdcJ-0000Lz-Ho; Tue, 01 Oct 2024 10:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1svdcB-0008Df-Ia; Tue, 01 Oct 2024 10:12:35 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1svdc9-0003Bx-FP; Tue, 01 Oct 2024 10:12:35 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 1 Oct
 2024 10:43:36 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 1 Oct 2024 10:43:36 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v7 8/8] tests/qtest:ast2700-gpio-test: Add GPIO test case for
 AST2700
Date: Tue, 1 Oct 2024 10:43:34 +0800
Message-ID: <20241001024334.834807-9-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241001024334.834807-1-jamin_lin@aspeedtech.com>
References: <20241001024334.834807-1-jamin_lin@aspeedtech.com>
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
X-TUID: uFKRqsIAGMRK

Add GPIO test cases to test output and input pins from A0 to D7 for AST2700.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/qtest/ast2700-gpio-test.c | 95 +++++++++++++++++++++++++++++++++
 tests/qtest/meson.build         |  3 ++
 2 files changed, 98 insertions(+)
 create mode 100644 tests/qtest/ast2700-gpio-test.c

diff --git a/tests/qtest/ast2700-gpio-test.c b/tests/qtest/ast2700-gpio-test.c
new file mode 100644
index 0000000000..9275845564
--- /dev/null
+++ b/tests/qtest/ast2700-gpio-test.c
@@ -0,0 +1,95 @@
+/*
+ * QTest testcase for the ASPEED AST2700 GPIO Controller.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2024 ASPEED Technology Inc.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/bitops.h"
+#include "qemu/timer.h"
+#include "qapi/qmp/qdict.h"
+#include "libqtest-single.h"
+
+#define AST2700_GPIO_BASE 0x14C0B000
+#define GPIOA0_CONTROL 0x180
+
+static void test_output_pins(const char *machine, const uint32_t base)
+{
+    QTestState *s = qtest_init(machine);
+    uint32_t offset = 0;
+    uint32_t value = 0;
+    uint32_t pin = 0;
+
+    for (char c = 'A'; c <= 'D'; c++) {
+        for (int i = 0; i < 8; i++) {
+            offset = base + (pin * 4);
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
+
+    qtest_quit(s);
+}
+
+static void test_input_pins(const char *machine, const uint32_t base)
+{
+    QTestState *s = qtest_init(machine);
+    char name[16];
+    uint32_t offset = 0;
+    uint32_t value = 0;
+    uint32_t pin = 0;
+
+    for (char c = 'A'; c <= 'D'; c++) {
+        for (int i = 0; i < 8; i++) {
+            sprintf(name, "gpio%c%d", c, i);
+            offset = base + (pin * 4);
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
+
+    qtest_quit(s);
+}
+
+static void test_2700_input_pins(void)
+{
+    test_input_pins("-machine ast2700-evb",
+                    AST2700_GPIO_BASE + GPIOA0_CONTROL);
+}
+
+static void test_2700_output_pins(void)
+{
+    test_output_pins("-machine ast2700-evb",
+                     AST2700_GPIO_BASE + GPIOA0_CONTROL);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("/ast2700/gpio/input_pins", test_2700_input_pins);
+    qtest_add_func("/ast2700/gpio/output_pins", test_2700_output_pins);
+
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 310865e49c..e1b62d34d8 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -209,6 +209,8 @@ qtests_aspeed = \
   ['aspeed_hace-test',
    'aspeed_smc-test',
    'aspeed_gpio-test']
+qtests_aspeed64 = \
+  ['ast2700-gpio-test']
 
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

