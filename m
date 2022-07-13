Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp71942lfp;
        Wed, 13 Jul 2022 01:03:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vHHsUG7K6HC9jy+88bfstTCr34OiYpj9WdyeFrwHYMfZPy2ZrRHAL249uQurvlNjtZHso4
X-Received: by 2002:a05:620a:2981:b0:6b5:7af7:7cfb with SMTP id r1-20020a05620a298100b006b57af77cfbmr1379802qkp.361.1657699417700;
        Wed, 13 Jul 2022 01:03:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657699417; cv=none;
        d=google.com; s=arc-20160816;
        b=cbt03mLW2/8g4XingaOmnn3l1mUqwmRcNfrlEBi0KCMdqe7NU0kLkXUIigPh7k1fTc
         jGqBr+U1z8o614s6e8TNrScVxo14W1xx+cVxOWG24jDJ0YrV104OF0V79ldOXdrTX5nw
         NMMTpUl5xRJNpU4fq0itIrEGoowvQaRh0TCOdzfFzCqMjHMWtJ0FvVh6dnLA7VYI5+Cn
         Inq3yE59GML9ZofsGsAoKCN/N9oFP7r9cBkBMD8dJBeRO5k0ayJKzKsX90HN4O6SXzZ0
         xZ/cr2vUm9TKDGOYl3x4OeUg7ZQ/sT63ZSWalBgQsZzAl6/4s58MxeAQHdtYvQMQ+fPK
         IcbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=oWq45uXFuWzonDWj69AG8Q/IX5y13K0zohT9Cakuk74=;
        b=WMZW1y/VPzZDl0q01H5Mr8KIqMjZGB0cSy/CaBd5WoAWtWSElRd6bOj4gFwO+tnrUy
         YqPgeLcxEJek0GVTuE0N1uJgYRSBw3Z1DTlvzT3XfPu0YNZh7Q0kgwIgp5mBJENKF/I/
         Nt7r7Nfroc5n7AdHukFfGqlkVH/fQrxdI5aApBARV6cbBb1AOirfWOF/4O5trO2kIBR0
         pZ7c6ayYnymBPkTdc9LjctOaC8sAl2bFunYvPUGyVq8H31m/lYy5iBXjEOor03OA7wPM
         C1Mckj7AVNbzw2jWUkdS/Bt/cjTF6ZWPIrLFIuimih9V1o7Hk6JwZCTsqlUYl3i7Yr57
         F2zg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h139-20020a379e91000000b006b551685bf9si6095172qke.145.2022.07.13.01.03.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jul 2022 01:03:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBXLN-0001i1-3q
	for alex.bennee@linaro.org; Wed, 13 Jul 2022 04:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBy-0008IT-AN; Wed, 13 Jul 2022 03:53:54 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:33587
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBw-0002d0-Lp; Wed, 13 Jul 2022 03:53:54 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LjVHf1tNtz4ySl;
 Wed, 13 Jul 2022 17:53:50 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LjVHc1N1pz4ySW;
 Wed, 13 Jul 2022 17:53:47 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 17/19] qtest/aspeed_gpio: Add input pin modification test
Date: Wed, 13 Jul 2022 09:52:53 +0200
Message-Id: <20220713075255.2248923-18-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220713075255.2248923-1-clg@kaod.org>
References: <20220713075255.2248923-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=zHgX=XS=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: tEnDBD/1Vs4D

From: Peter Delevoryas <peter@pjd.dev>

Verify the current behavior, which is that input pins can be modified by
guest OS register writes.

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220712023219.41065-2-peter@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/qtest/aspeed_gpio-test.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/qtest/aspeed_gpio-test.c b/tests/qtest/aspeed_gpio-test.c
index bac63e8742f4..8f524540998d 100644
--- a/tests/qtest/aspeed_gpio-test.c
+++ b/tests/qtest/aspeed_gpio-test.c
@@ -28,6 +28,11 @@
 #include "qapi/qmp/qdict.h"
 #include "libqtest-single.h"
 
+#define AST2600_GPIO_BASE 0x1E780000
+
+#define GPIO_ABCD_DATA_VALUE 0x000
+#define GPIO_ABCD_DIRECTION  0x004
+
 static void test_set_colocated_pins(const void *data)
 {
     QTestState *s = (QTestState *)data;
@@ -46,6 +51,27 @@ static void test_set_colocated_pins(const void *data)
     g_assert(!qtest_qom_get_bool(s, "/machine/soc/gpio", "gpioV7"));
 }
 
+static void test_set_input_pins(const void *data)
+{
+    QTestState *s = (QTestState *)data;
+    char name[16];
+    uint32_t value;
+
+    qtest_writel(s, AST2600_GPIO_BASE + GPIO_ABCD_DIRECTION, 0x00000000);
+    for (char c = 'A'; c <= 'D'; c++) {
+        for (int i = 0; i < 8; i++) {
+            sprintf(name, "gpio%c%d", c, i);
+            qtest_qom_set_bool(s, "/machine/soc/gpio", name, true);
+        }
+    }
+    value = qtest_readl(s, AST2600_GPIO_BASE + GPIO_ABCD_DATA_VALUE);
+    g_assert_cmphex(value, ==, 0xffffffff);
+
+    qtest_writel(s, AST2600_GPIO_BASE + GPIO_ABCD_DATA_VALUE, 0x00000000);
+    value = qtest_readl(s, AST2600_GPIO_BASE + GPIO_ABCD_DATA_VALUE);
+    g_assert_cmphex(value, ==, 0x00000000);
+}
+
 int main(int argc, char **argv)
 {
     QTestState *s;
@@ -56,6 +82,7 @@ int main(int argc, char **argv)
     s = qtest_init("-machine ast2600-evb");
     qtest_add_data_func("/ast2600/gpio/set_colocated_pins", s,
                         test_set_colocated_pins);
+    qtest_add_data_func("/ast2600/gpio/set_input_pins", s, test_set_input_pins);
     r = g_test_run();
     qtest_quit(s);
 
-- 
2.35.3

