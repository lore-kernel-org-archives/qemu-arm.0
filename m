Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9FBC43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 09:18:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh1wR-00006l-97; Tue, 07 Jul 2026 05:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@free.fr>)
 id 1wh1wP-00006L-Tb
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:18:09 -0400
Received: from smtp2-g21.free.fr ([212.27.42.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@free.fr>)
 id 1wh1wO-0003pr-7I
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:18:09 -0400
Received: from localhost (unknown [89.92.102.124])
 (Authenticated sender: emmanuel.blot@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id C1FAB2003DA;
 Tue,  7 Jul 2026 11:17:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1783415887;
 bh=4S2h+GVgVDMUDc52x21fkzKc1n7GVb5jXqLccHC0zrM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OqZq/3eCdrYwudD4c2UZLEdetJMVZrYxhEizIMkqd5mvlij0z0K+qI7DxwvsqdpyY
 jVNurGq0ktT0rsn5NGYrFr8BtjDCL+80cMzQp1a2UrNZIROCzLASIX6arQ+k8JkqSv
 DMSEab1PyEVCuVyAZz2ooUlfPiqTgJcsB2TQjkmXUgf9CXHk/epVb4SU1AgX7QvaQ7
 WNEL6+hIfj7elwoVPX82Flxg8vKzVyS0JAyLsFmZsrY8QaOcurLym/1M9V0UIIdnCx
 xRoG3BYHx42bNlGVQG9/uywIWMuSMvr3towtrwfrbivPDHwGiP6Pb390say0fLxhHZ
 ORM7wuhR2DydA==
From: Emmanuel Blot <emmanuel.blot@free.fr>
To: 
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 Alexander Hansen <alexander.hansen@9elements.com>,
 William de Abreu Pinho <williampinho@meta.com>,
 Emmanuel Blot <eblot@meta.com>, qemu-arm@nongnu.org
Subject: [PATCH v6 4/9] tests/qtest: adc128d818: test limit interrupts
Date: Tue,  7 Jul 2026 11:15:57 +0200
Message-ID: <20260707091609.97759-5-emmanuel.blot@free.fr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260707091609.97759-1-emmanuel.blot@free.fr>
References: <20260707091609.97759-1-emmanuel.blot@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.27.42.2; envelope-from=emmanuel.blot@free.fr;
 helo=smtp2-g21.free.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Cover per-channel high- and low-limit interrupt status, the
INT_CLEAR bit gating the monitoring loop, and the temperature
high-limit alarm with hysteresis.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/adc128d818-test.c | 121 ++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/tests/qtest/adc128d818-test.c b/tests/qtest/adc128d818-test.c
index 891189f0bd..3e3fabb8d9 100644
--- a/tests/qtest/adc128d818-test.c
+++ b/tests/qtest/adc128d818-test.c
@@ -330,6 +330,123 @@ static void test_ext_vref(void *obj, void *data, QGuestAllocator *alloc)
     g_assert_cmphex(reading, ==, 0x8000);
 }
 
+/* Interrupt status set on limit violation; persists while fault remains */
+static void test_interrupt_status(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    uint8_t status;
+
+    i2c_set8(dev, REG_LIMIT_BASE, 0x10);
+    g_test_message("Set ch0 high limit = 0x10");
+
+    qmp_adc128d818_set("ain0", 2560);
+    g_test_message("Injected ain0 = 2560 mV (exceeds limit)");
+
+    i2c_set8(dev, REG_CONFIG, CONFIG_START | CONFIG_INT_ENABLE);
+
+    status = i2c_get8(dev, REG_INT_STATUS);
+    g_test_message("INT_STATUS = 0x%02x (expect bit 0 set)", status);
+    g_assert_cmphex(status & 0x01u, ==, 0x01);
+
+    status = i2c_get8(dev, REG_INT_STATUS);
+    g_test_message("INT_STATUS after re-read = 0x%02x (expect bit 0 still set)",
+             status);
+    g_assert_cmphex(status & 0x01u, ==, 0x01);
+
+    qmp_adc128d818_set("ain0", 80);
+    g_test_message("Injected ain0 = 80 mV (within limit)");
+    status = i2c_get8(dev, REG_INT_STATUS);
+    g_test_message("INT_STATUS after fault cleared = 0x%02x "
+                   "(expect bit 0 clear)", status);
+    g_assert_cmphex(status & 0x01u, ==, 0x00);
+}
+
+/* INT_CLEAR stops the round-robin monitoring loop */
+static void test_int_clear(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    uint8_t status;
+
+    i2c_set8(dev, REG_LIMIT_BASE, 0x10);
+    qmp_adc128d818_set("ain0", 2560);
+
+    i2c_set8(dev, REG_CONFIG,
+             CONFIG_START | CONFIG_INT_ENABLE | CONFIG_INT_CLEAR);
+    status = i2c_get8(dev, REG_INT_STATUS);
+    g_test_message("INT_STATUS with INT_CLEAR set = 0x%02x (expect 0x00)",
+                   status);
+    g_assert_cmphex(status, ==, 0x00);
+
+    i2c_set8(dev, REG_CONFIG, CONFIG_START | CONFIG_INT_ENABLE);
+    status = i2c_get8(dev, REG_INT_STATUS);
+    g_test_message("INT_STATUS after INT_CLEAR cleared = 0x%02x (expect bit 0)",
+             status);
+    g_assert_cmphex(status & 0x01u, ==, 0x01);
+}
+
+/* Low-limit interrupt triggers correctly */
+static void test_low_limit(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    uint8_t status;
+
+    i2c_set8(dev, REG_CONFIG, CONFIG_INITIALIZATION);
+
+    i2c_set8(dev, REG_LIMIT_BASE + 3u, 0x80);
+    g_test_message("Set ch1 low limit = 0x80");
+
+    i2c_set8(dev, REG_LIMIT_BASE + 5u, 0x80);
+    g_test_message("Set ch2 low limit = 0x80");
+
+    qmp_adc128d818_set("ain1", 640);
+    qmp_adc128d818_set("ain2", 1280);
+    qmp_adc128d818_set("ain0", 1280);
+    i2c_set8(dev, REG_CONFIG, CONFIG_START | CONFIG_INT_ENABLE);
+
+    status = i2c_get8(dev, REG_INT_STATUS);
+    g_test_message("INT_STATUS = 0x%02x (expect bits 1 and 2 set)", status);
+    g_assert_cmphex(status & 0x02u, ==, 0x02);
+    g_assert_cmphex(status & 0x04u, ==, 0x04);
+
+    g_assert_cmphex(status & 0x01u, ==, 0x00);
+}
+
+/* Temperature high-limit interrupt with hysteresis */
+static void test_temp_hysteresis(void *obj, void *data,
+                                 QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    uint8_t status;
+
+    i2c_set8(dev, REG_CONFIG, CONFIG_INITIALIZATION);
+
+    i2c_set8(dev, REG_LIMIT_BASE + 7u * 2u, 0x32);
+    i2c_set8(dev, REG_LIMIT_BASE + 7u * 2u + 1u, 0x28);
+
+    qmp_adc128d818_set("temperature", 25000);
+    i2c_set8(dev, REG_CONFIG, CONFIG_START);
+
+    status = i2c_get8(dev, REG_INT_STATUS);
+    g_test_message("25 C: INT_STATUS = 0x%02x (temp bit expect clear)", status);
+    g_assert_cmphex(status & 0x80u, ==, 0x00);
+
+    qmp_adc128d818_set("temperature", 55000);
+    status = i2c_get8(dev, REG_INT_STATUS);
+    g_test_message("55 C: INT_STATUS = 0x%02x (temp bit expect set)", status);
+    g_assert_cmphex(status & 0x80u, ==, 0x80);
+
+    qmp_adc128d818_set("temperature", 45000);
+    status = i2c_get8(dev, REG_INT_STATUS);
+    g_test_message("45 C (hysteresis): INT_STATUS = 0x%02x "
+                   "(temp bit expect set)", status);
+    g_assert_cmphex(status & 0x80u, ==, 0x80);
+
+    qmp_adc128d818_set("temperature", 35000);
+    status = i2c_get8(dev, REG_INT_STATUS);
+    g_test_message("35 C: INT_STATUS = 0x%02x (temp bit expect clear)", status);
+    g_assert_cmphex(status & 0x80u, ==, 0x00);
+}
+
 static void adc128d818_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
@@ -354,5 +471,9 @@ static void adc128d818_register_nodes(void)
     qos_add_test("temperature-edges", "adc128d818", test_temperature_edges,
                  NULL);
     qos_add_test("ext-vref", "adc128d818", test_ext_vref, NULL);
+    qos_add_test("interrupt-status", "adc128d818", test_interrupt_status, NULL);
+    qos_add_test("int-clear", "adc128d818", test_int_clear, NULL);
+    qos_add_test("low-limit", "adc128d818", test_low_limit, NULL);
+    qos_add_test("temp-hysteresis", "adc128d818", test_temp_hysteresis, NULL);
 }
 libqos_init(adc128d818_register_nodes);
-- 
2.50.1


