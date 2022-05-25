Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1022922lfh;
        Wed, 25 May 2022 09:07:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPtMqLIUU5OlLTxycPPF+MnrHLFQ97LTyWWZAuNYuYBxnDNC7vVpkkqBUsCWIPrGzNwNae
X-Received: by 2002:ad4:51cd:0:b0:461:da31:848c with SMTP id p13-20020ad451cd000000b00461da31848cmr26009758qvq.86.1653494861739;
        Wed, 25 May 2022 09:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653494861; cv=none;
        d=google.com; s=arc-20160816;
        b=b2FFmSBTgVXG7zVY1d8pNIE22yDighDgf9DrGea4EB8x3DXcVGX2IFZ+uoZHuU1qJj
         kwire/P9twKyKalo1iQnGY7EFMcYoGrMdL2Jc3Vmb1dY9y88sYDu5Zcr9yAEFTt+YO4o
         D++vRDZkftNcSMilq34aTphn8giZDc2FAqXJ6TxUIWxen5XBg5nXM1YvTkGQKAaFoVXa
         yhYaC2+OmcSnF0GBq4P90LghM5uBLKfZHtGWDzrOVpNzXeCJtIXykqsdqsTA+fzEkSkD
         Pe9ulvmzl0H14qt5JsS+N5Km3XaWpqumrvDp3Y4Y1dtACBX2SGrV2bE4X4eiBL8og+Os
         MX5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=rMsvebd2CdicHuJs7kTB+sDq1asnn+zE0TwlHVzCAcY=;
        b=kYKeJPaJnoQsYPpDT0+p1RVYh9VIJgjsxtJvR1oo8h3HnAs+MIFKFXhuDKcYElNDH+
         mX6rkr8JguCYovqwfqDhDg7o6ozLSxwU6emmJ1wj18RpvJGgYNCz0HO+4cfYA3KvFUAB
         hIaBKPyQs/dy5b4fQYDN6Fr+5XD2aa8O8gz7U13Qf32JYiH4E+ntg9kbH9zbn4XvKRNn
         1dPQIyAk7rrU3ucCcWg33BEHCq0xOP3qzvAG6cI7jSSUVlyLlr56tiRUB8a0kfIMi6b+
         WNBvWXLA5U1XOemYkrUbdF7zV/rF435zV93XuaaDw6bH1uvCuC/5TvAT3Zjb8GCdNBqB
         5UmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7-20020a056214062700b0046224336023si1726210qvx.420.2022.05.25.09.07.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 May 2022 09:07:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nttXx-0003uC-5O
	for alex.bennee@linaro.org; Wed, 25 May 2022 12:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSR-000742-OL; Wed, 25 May 2022 12:02:02 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:40143
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSN-00048z-F3; Wed, 25 May 2022 12:01:57 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4L7bRP08MHz4ySn;
 Thu, 26 May 2022 02:01:53 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L7bRL4qmFz4xXj;
 Thu, 26 May 2022 02:01:50 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Iris Chen <irischenlj@fb.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>
Subject: [PULL 04/15] hw: m25p80: allow write_enable latch get/set
Date: Wed, 25 May 2022 18:01:25 +0200
Message-Id: <20220525160136.556277-5-clg@kaod.org>
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
X-TUID: ggYqw5C6vTAU

From: Iris Chen <irischenlj@fb.com>

The write_enable latch property is not currently exposed.
This commit makes it a modifiable property.

Signed-off-by: Iris Chen <irischenlj@fb.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-Id: <20220513055022.951759-1-irischenlj@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/qtest/libqtest.h         | 22 +++++++++++++++++
 hw/block/m25p80.c              |  1 +
 tests/qtest/aspeed_gpio-test.c | 40 +++++++------------------------
 tests/qtest/aspeed_smc-test.c  | 43 ++++++++++++++++++++++++++++++++++
 tests/qtest/libqtest.c         | 24 +++++++++++++++++++
 5 files changed, 98 insertions(+), 32 deletions(-)

diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
index 4ab0cad3266d..94b187837d3f 100644
--- a/tests/qtest/libqtest.h
+++ b/tests/qtest/libqtest.h
@@ -783,4 +783,26 @@ QTestState *qtest_inproc_init(QTestState **s, bool log, const char* arch,
                     void (*send)(void*, const char*));
 
 void qtest_client_inproc_recv(void *opaque, const char *str);
+
+/**
+ * qtest_qom_set_bool:
+ * @s: QTestState instance to operate on.
+ * @path: Path to the property being set.
+ * @property: Property being set.
+ * @value: Value to set the property.
+ *
+ * Set the property with passed in value.
+ */
+void qtest_qom_set_bool(QTestState *s, const char *path, const char *property,
+                         bool value);
+
+/**
+ * qtest_qom_get_bool:
+ * @s: QTestState instance to operate on.
+ * @path: Path to the property being retrieved.
+ * @property: Property from where the value is being retrieved.
+ *
+ * Returns: Value retrieved from property.
+ */
+bool qtest_qom_get_bool(QTestState *s, const char *path, const char *property);
 #endif
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 7d3d8b12e01f..81ba3da4df10 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -1533,6 +1533,7 @@ static int m25p80_pre_save(void *opaque)
 
 static Property m25p80_properties[] = {
     /* This is default value for Micron flash */
+    DEFINE_PROP_BOOL("write-enable", Flash, write_enable, false),
     DEFINE_PROP_UINT32("nonvolatile-cfg", Flash, nonvolatile_cfg, 0x8FFF),
     DEFINE_PROP_UINT8("spansion-cr1nv", Flash, spansion_cr1nv, 0x0),
     DEFINE_PROP_UINT8("spansion-cr2nv", Flash, spansion_cr2nv, 0x8),
diff --git a/tests/qtest/aspeed_gpio-test.c b/tests/qtest/aspeed_gpio-test.c
index c1003f2d1bc4..bac63e8742f4 100644
--- a/tests/qtest/aspeed_gpio-test.c
+++ b/tests/qtest/aspeed_gpio-test.c
@@ -28,30 +28,6 @@
 #include "qapi/qmp/qdict.h"
 #include "libqtest-single.h"
 
-static bool qom_get_bool(QTestState *s, const char *path, const char *property)
-{
-    QDict *r;
-    bool b;
-
-    r = qtest_qmp(s, "{ 'execute': 'qom-get', 'arguments': "
-                     "{ 'path': %s, 'property': %s } }", path, property);
-    b = qdict_get_bool(r, "return");
-    qobject_unref(r);
-
-    return b;
-}
-
-static void qom_set_bool(QTestState *s, const char *path, const char *property,
-                         bool value)
-{
-    QDict *r;
-
-    r = qtest_qmp(s, "{ 'execute': 'qom-set', 'arguments': "
-                     "{ 'path': %s, 'property': %s, 'value': %i } }",
-                     path, property, value);
-    qobject_unref(r);
-}
-
 static void test_set_colocated_pins(const void *data)
 {
     QTestState *s = (QTestState *)data;
@@ -60,14 +36,14 @@ static void test_set_colocated_pins(const void *data)
      * gpioV4-7 occupy bits within a single 32-bit value, so we want to make
      * sure that modifying one doesn't affect the other.
      */
-    qom_set_bool(s, "/machine/soc/gpio", "gpioV4", true);
-    qom_set_bool(s, "/machine/soc/gpio", "gpioV5", false);
-    qom_set_bool(s, "/machine/soc/gpio", "gpioV6", true);
-    qom_set_bool(s, "/machine/soc/gpio", "gpioV7", false);
-    g_assert(qom_get_bool(s, "/machine/soc/gpio", "gpioV4"));
-    g_assert(!qom_get_bool(s, "/machine/soc/gpio", "gpioV5"));
-    g_assert(qom_get_bool(s, "/machine/soc/gpio", "gpioV6"));
-    g_assert(!qom_get_bool(s, "/machine/soc/gpio", "gpioV7"));
+    qtest_qom_set_bool(s, "/machine/soc/gpio", "gpioV4", true);
+    qtest_qom_set_bool(s, "/machine/soc/gpio", "gpioV5", false);
+    qtest_qom_set_bool(s, "/machine/soc/gpio", "gpioV6", true);
+    qtest_qom_set_bool(s, "/machine/soc/gpio", "gpioV7", false);
+    g_assert(qtest_qom_get_bool(s, "/machine/soc/gpio", "gpioV4"));
+    g_assert(!qtest_qom_get_bool(s, "/machine/soc/gpio", "gpioV5"));
+    g_assert(qtest_qom_get_bool(s, "/machine/soc/gpio", "gpioV6"));
+    g_assert(!qtest_qom_get_bool(s, "/machine/soc/gpio", "gpioV7"));
 }
 
 int main(int argc, char **argv)
diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index 87b40a0ef186..ec233315e6c6 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -26,6 +26,7 @@
 #include "qemu/osdep.h"
 #include "qemu/bswap.h"
 #include "libqtest-single.h"
+#include "qemu/bitops.h"
 
 /*
  * ASPEED SPI Controller registers
@@ -40,6 +41,7 @@
 #define   CTRL_FREADMODE       0x1
 #define   CTRL_WRITEMODE       0x2
 #define   CTRL_USERMODE        0x3
+#define SR_WEL BIT(1)
 
 #define ASPEED_FMC_BASE    0x1E620000
 #define ASPEED_FLASH_BASE  0x20000000
@@ -49,6 +51,8 @@
  */
 enum {
     JEDEC_READ = 0x9f,
+    RDSR = 0x5,
+    WRDI = 0x4,
     BULK_ERASE = 0xc7,
     READ = 0x03,
     PP = 0x02,
@@ -348,6 +352,44 @@ static void test_write_page_mem(void)
     flash_reset();
 }
 
+static void test_read_status_reg(void)
+{
+    uint8_t r;
+
+    spi_conf(CONF_ENABLE_W0);
+
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, RDSR);
+    r = readb(ASPEED_FLASH_BASE);
+    spi_ctrl_stop_user();
+
+    g_assert_cmphex(r & SR_WEL, ==, 0);
+    g_assert(!qtest_qom_get_bool
+            (global_qtest, "/machine/soc/fmc/ssi.0/child[0]", "write-enable"));
+
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, WREN);
+    writeb(ASPEED_FLASH_BASE, RDSR);
+    r = readb(ASPEED_FLASH_BASE);
+    spi_ctrl_stop_user();
+
+    g_assert_cmphex(r & SR_WEL, ==, SR_WEL);
+    g_assert(qtest_qom_get_bool
+            (global_qtest, "/machine/soc/fmc/ssi.0/child[0]", "write-enable"));
+
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, WRDI);
+    writeb(ASPEED_FLASH_BASE, RDSR);
+    r = readb(ASPEED_FLASH_BASE);
+    spi_ctrl_stop_user();
+
+    g_assert_cmphex(r & SR_WEL, ==, 0);
+    g_assert(!qtest_qom_get_bool
+            (global_qtest, "/machine/soc/fmc/ssi.0/child[0]", "write-enable"));
+
+    flash_reset();
+}
+
 static char tmp_path[] = "/tmp/qtest.m25p80.XXXXXX";
 
 int main(int argc, char **argv)
@@ -373,6 +415,7 @@ int main(int argc, char **argv)
     qtest_add_func("/ast2400/smc/write_page", test_write_page);
     qtest_add_func("/ast2400/smc/read_page_mem", test_read_page_mem);
     qtest_add_func("/ast2400/smc/write_page_mem", test_write_page_mem);
+    qtest_add_func("/ast2400/smc/read_status_reg", test_read_status_reg);
 
     ret = g_test_run();
 
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 2e496184549d..8c159eacf5ed 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1440,3 +1440,27 @@ void qtest_client_inproc_recv(void *opaque, const char *str)
     g_string_append(qts->rx, str);
     return;
 }
+
+void qtest_qom_set_bool(QTestState *s, const char *path, const char *property,
+                         bool value)
+{
+    QDict *r;
+
+    r = qtest_qmp(s, "{ 'execute': 'qom-set', 'arguments': "
+                     "{ 'path': %s, 'property': %s, 'value': %i } }",
+                     path, property, value);
+    qobject_unref(r);
+}
+
+bool qtest_qom_get_bool(QTestState *s, const char *path, const char *property)
+{
+    QDict *r;
+    bool b;
+
+    r = qtest_qmp(s, "{ 'execute': 'qom-get', 'arguments': "
+                     "{ 'path': %s, 'property': %s } }", path, property);
+    b = qdict_get_bool(r, "return");
+    qobject_unref(r);
+
+    return b;
+}
-- 
2.35.3

