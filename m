Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828C5C43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 09:18:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh1wj-0000OZ-V7; Tue, 07 Jul 2026 05:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@free.fr>)
 id 1wh1wj-0000Nu-3M
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:18:29 -0400
Received: from smtp2-g21.free.fr ([212.27.42.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@free.fr>)
 id 1wh1wg-0003zU-GW
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:18:28 -0400
Received: from localhost (unknown [89.92.102.124])
 (Authenticated sender: emmanuel.blot@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id A4ACF2003DE;
 Tue,  7 Jul 2026 11:18:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1783415905;
 bh=DYpQhgPt3BPLRKHF0wK5cWAFJHcd91HES6x14wLx/OY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GtAJld51qkY46XTnpjWWBb1A7ZgenVnYL/TkSM3ib/Wek4f+80h3Spu0ecvqIHPqZ
 tWYFAGKRDNz6273GBOZiQcYuiIppiuyafgHhsOkyHmsDXs11YC0ZQlQ5otxLQvZElh
 zxgT3LqkwTyE66h5hNNLhSdcV6ZDoDuUyzmAc5eTjW1jlNnKPBbx8Z/bKX/TwTDQxz
 NMTK66oMiIf/LI3IWYjDMDo0ZpDS9riFM1yUKWC7oCqGJR2UEnZ+HQ3Gxp4ofHEKBD
 mV26gJg9l7bDw2GcOZx1iG8S8Kq7ZxLIyHO+JIxIvfQ/JH7zgLphP3hfQ0HCVfGAMq
 EGYw+tYwJH4Cg==
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
Subject: [PATCH v6 5/9] tests/qtest: adc128d818: test operating modes and
 power control
Date: Tue,  7 Jul 2026 11:15:58 +0200
Message-ID: <20260707091609.97759-6-emmanuel.blot@free.fr>
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

Cover advanced-configuration mode selection (single-ended,
pseudo-differential pairs, and mixed) and the reset of readings on
reconfiguration, plus channel disable, one-shot conversion, deep
shutdown, BUSY_STATUS lifecycle, and conversion-rate gating.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/adc128d818-test.c | 377 ++++++++++++++++++++++++++++++++++
 1 file changed, 377 insertions(+)

diff --git a/tests/qtest/adc128d818-test.c b/tests/qtest/adc128d818-test.c
index 3e3fabb8d9..91eda5ca74 100644
--- a/tests/qtest/adc128d818-test.c
+++ b/tests/qtest/adc128d818-test.c
@@ -447,6 +447,368 @@ static void test_temp_hysteresis(void *obj, void *data,
     g_assert_cmphex(status & 0x80u, ==, 0x00);
 }
 
+/* Channel disable prevents conversion */
+static void test_channel_disable(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    uint16_t reading;
+
+    i2c_set8(dev, REG_CH_DISABLE, 0x01);
+    g_test_message("Disabled channel 0");
+
+    qmp_adc128d818_set("ain0", 1280);
+    g_test_message("Injected ain0 = 1280 mV (disabled)");
+    i2c_set8(dev, REG_CONFIG, CONFIG_START);
+
+    reading = i2c_get16(dev, REG_CH_READING_BASE);
+    g_test_message("Read ch0 (disabled): raw 0x%04x", reading);
+    g_assert_cmphex(reading, ==, 0x0000);
+
+    qmp_adc128d818_set("ain1", 1280);
+    g_test_message("Injected ain1 = 1280 mV (enabled)");
+    reading = i2c_get16(dev, REG_CH_READING_BASE + 1u);
+    g_test_message("Read ch1 (enabled): raw 0x%04x -> %u mV", reading,
+             (reading >> 4u) * INTERNAL_VREF_MV / 4096u);
+    g_assert_cmphex(reading, ==, 0x8000);
+}
+
+/* One-shot conversion in shutdown mode */
+static void test_one_shot(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    uint16_t reading;
+
+    qmp_adc128d818_set("ain0", 1280);
+    g_test_message("Injected ain0 = 1280 mV (device stopped)");
+
+    reading = i2c_get16(dev, REG_CH_READING_BASE);
+    g_test_message("Read ch0 before one-shot: raw 0x%04x", reading);
+    g_assert_cmphex(reading, ==, 0x0000);
+
+    g_assert_cmphex(i2c_get8(dev, REG_ONE_SHOT), ==, 0x00);
+
+    i2c_set8(dev, REG_ONE_SHOT, 0x00);
+    g_test_message("Triggered one-shot conversion with value 0x00");
+
+    reading = i2c_get16(dev, REG_CH_READING_BASE);
+    g_test_message("Read ch0 after one-shot: raw 0x%04x -> %u mV", reading,
+             (reading >> 4u) * INTERNAL_VREF_MV / 4096u);
+    g_assert_cmphex(reading, ==, 0x8000);
+}
+
+/* Mode 1 makes channel 7 a voltage input instead of temperature */
+static void test_mode_selection(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    uint16_t reading;
+
+    i2c_set8(dev, REG_ADV_CONFIG, ADV_CONFIG_MODE_1);
+    g_test_message("Set mode 1 (all voltage channels)");
+
+    qmp_adc128d818_set("ain7", 1280);
+    qmp_adc128d818_set("temperature", 50000);
+    g_test_message("Injected ain7 = 1280 mV, temperature = 50000 mC");
+
+    i2c_set8(dev, REG_CONFIG, CONFIG_START);
+
+    reading = i2c_get16(dev, REG_CH_READING_BASE + 7u);
+    g_test_message("Read ch7 (mode 1): raw 0x%04x -> %u mV", reading,
+             (reading >> 4u) * INTERNAL_VREF_MV / 4096u);
+    g_assert_cmphex(reading, ==, 0x8000);
+}
+
+/* Mode 2 - 4 pseudo-differential pairs */
+static void test_mode2_diff(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    uint16_t reading;
+
+    i2c_set8(dev, REG_ADV_CONFIG, ADV_CONFIG_MODE_2);
+    g_test_message("Set mode 2 (4 pseudo-differential pairs)");
+
+    qmp_adc128d818_set("ain0", 2000);
+    qmp_adc128d818_set("ain1", 720);
+    i2c_set8(dev, REG_CONFIG, CONFIG_START);
+
+    reading = i2c_get16(dev, REG_CH_READING_BASE);
+    g_test_message("Pair 0 (IN0-IN1): raw 0x%04x (expect 0x8000)", reading);
+    g_assert_cmphex(reading, ==, 0x8000);
+
+    qmp_adc128d818_set("ain3", 1920);
+    qmp_adc128d818_set("ain2", 640);
+
+    reading = i2c_get16(dev, REG_CH_READING_BASE + 1u);
+    g_test_message("Pair 1 (IN3-IN2): raw 0x%04x (expect 0x8000)", reading);
+    g_assert_cmphex(reading, ==, 0x8000);
+
+    qmp_adc128d818_set("ain4", 1500);
+    qmp_adc128d818_set("ain5", 220);
+
+    reading = i2c_get16(dev, REG_CH_READING_BASE + 2u);
+    g_test_message("Pair 2 (IN4-IN5): raw 0x%04x (expect 0x8000)", reading);
+    g_assert_cmphex(reading, ==, 0x8000);
+
+    qmp_adc128d818_set("ain7", 2560);
+    qmp_adc128d818_set("ain6", 1280);
+
+    reading = i2c_get16(dev, REG_CH_READING_BASE + 3u);
+    g_test_message("Pair 3 (IN7-IN6): raw 0x%04x (expect 0x8000)", reading);
+    g_assert_cmphex(reading, ==, 0x8000);
+
+    reading = i2c_get16(dev, REG_CH_READING_BASE + 4u);
+    g_test_message("Reserved ch4: raw 0x%04x (expect 0x0000)", reading);
+    g_assert_cmphex(reading, ==, 0x0000);
+
+    qmp_adc128d818_set("ain0", 500);
+    qmp_adc128d818_set("ain1", 1000);
+
+    reading = i2c_get16(dev, REG_CH_READING_BASE);
+    g_test_message("Pair 0 negative dV: raw 0x%04x (expect 0x0000)", reading);
+    g_assert_cmphex(reading, ==, 0x0000);
+}
+
+/* Mode 3 - 4 single-ended + 2 pseudo-differential pairs */
+static void test_mode3_mixed(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    uint16_t reading;
+
+    i2c_set8(dev, REG_ADV_CONFIG, ADV_CONFIG_MODE_3);
+    g_test_message("Set mode 3 (4 single-ended + 2 differential)");
+
+    qmp_adc128d818_set("ain0", 1280);
+    i2c_set8(dev, REG_CONFIG, CONFIG_START);
+
+    reading = i2c_get16(dev, REG_CH_READING_BASE);
+    g_test_message("Ch0 single-ended: raw 0x%04x (expect 0x8000)", reading);
+    g_assert_cmphex(reading, ==, 0x8000);
+
+    qmp_adc128d818_set("ain4", 1500);
+    qmp_adc128d818_set("ain5", 220);
+
+    reading = i2c_get16(dev, REG_CH_READING_BASE + 4u);
+    g_test_message("Ch4 diff (IN4-IN5): raw 0x%04x (expect 0x8000)", reading);
+    g_assert_cmphex(reading, ==, 0x8000);
+
+    qmp_adc128d818_set("ain7", 2560);
+    qmp_adc128d818_set("ain6", 1280);
+
+    reading = i2c_get16(dev, REG_CH_READING_BASE + 5u);
+    g_test_message("Ch5 diff (IN7-IN6): raw 0x%04x (expect 0x8000)", reading);
+    g_assert_cmphex(reading, ==, 0x8000);
+
+    reading = i2c_get16(dev, REG_CH_READING_BASE + 6u);
+    g_test_message("Reserved ch6: raw 0x%04x (expect 0x0000)", reading);
+    g_assert_cmphex(reading, ==, 0x0000);
+
+    qmp_adc128d818_set("temperature", 25000);
+
+    reading = i2c_get16(dev, REG_CH_READING_BASE + 7u);
+    g_test_message("Ch7 temperature: raw 0x%04x (expect 0x1900)", reading);
+    g_assert_cmphex(reading, ==, 0x1900);
+}
+
+/* Mode change resets channel readings and interrupt status */
+static void test_mode_change_reset(void *obj, void *data,
+                                   QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    uint16_t reading;
+    uint8_t status;
+
+    qmp_adc128d818_set("ain0", 1280);
+    i2c_set8(dev, REG_CONFIG, CONFIG_START);
+
+    reading = i2c_get16(dev, REG_CH_READING_BASE);
+    g_test_message("Before mode change, ch0: raw 0x%04x", reading);
+    g_assert_cmphex(reading, !=, 0x0000);
+
+    i2c_set8(dev, REG_CONFIG, 0x00);
+    i2c_set8(dev, REG_LIMIT_BASE, 0x10);
+    qmp_adc128d818_set("ain0", 2560);
+    i2c_set8(dev, REG_CONFIG, CONFIG_START);
+
+    i2c_set8(dev, REG_CONFIG, 0x00);
+    i2c_set8(dev, REG_ADV_CONFIG, ADV_CONFIG_MODE_2);
+
+    reading = i2c_get16(dev, REG_CH_READING_BASE);
+    g_test_message("After mode change, ch0: raw 0x%04x (expect 0x0000)",
+                   reading);
+    g_assert_cmphex(reading, ==, 0x0000);
+
+    status = i2c_get8(dev, REG_INT_STATUS);
+    g_test_message("After mode change, INT_STATUS: 0x%02x (expect 0x00)",
+                   status);
+    g_assert_cmphex(status, ==, 0x00);
+
+    g_assert_cmphex(i2c_get8(dev, REG_LIMIT_BASE), ==, 0x10);
+    g_test_message("Limit register preserved after mode change");
+}
+
+/* QOM property changes trigger correct differential conversion */
+static void test_diff_qom_trigger(void *obj, void *data,
+                                  QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    uint16_t reading;
+
+    i2c_set8(dev, REG_CONFIG, CONFIG_INITIALIZATION);
+    i2c_set8(dev, REG_ADV_CONFIG, ADV_CONFIG_MODE_2);
+
+    qmp_adc128d818_set("ain0", 0);
+    qmp_adc128d818_set("ain1", 0);
+    qmp_adc128d818_set("ain2", 0);
+    qmp_adc128d818_set("ain3", 0);
+    i2c_set8(dev, REG_CONFIG, CONFIG_START);
+
+    qmp_adc128d818_set("ain0", 2000);
+    reading = i2c_get16(dev, REG_CH_READING_BASE);
+    g_test_message("After ain0=2000, ain1=0: pair0 = 0x%04x (expect 0xC800)",
+             reading);
+    g_assert_cmphex(reading, ==, 0xC800);
+
+    qmp_adc128d818_set("ain1", 720);
+    reading = i2c_get16(dev, REG_CH_READING_BASE);
+    g_test_message("After ain1=720: pair0 = 0x%04x (expect 0x8000)", reading);
+    g_assert_cmphex(reading, ==, 0x8000);
+
+    qmp_adc128d818_set("ain3", 1920);
+    qmp_adc128d818_set("ain2", 640);
+    reading = i2c_get16(dev, REG_CH_READING_BASE + 1u);
+    g_test_message("Pair 1 (IN3-IN2) via QOM: 0x%04x (expect 0x8000)", reading);
+    g_assert_cmphex(reading, ==, 0x8000);
+}
+
+/* One-shot conversion works in deep shutdown */
+static void test_deep_shutdown(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    uint16_t reading;
+
+    i2c_set8(dev, REG_CONFIG, CONFIG_INITIALIZATION);
+
+    qmp_adc128d818_set("ain0", 1280);
+    i2c_set8(dev, REG_CONFIG, CONFIG_START);
+    reading = i2c_get16(dev, REG_CH_READING_BASE);
+    g_assert_cmphex(reading, ==, 0x8000);
+
+    i2c_set8(dev, REG_DEEP_SHUTDOWN, 0x01);
+    g_test_message("DEEP_SHUTDOWN write while running rejected");
+    g_assert_cmphex(i2c_get8(dev, REG_DEEP_SHUTDOWN), ==, 0x00);
+
+    i2c_set8(dev, REG_CONFIG, 0x00);
+    i2c_set8(dev, REG_DEEP_SHUTDOWN, 0x01);
+    qmp_adc128d818_set("ain0", 0);
+
+    reading = i2c_get16(dev, REG_CH_READING_BASE);
+    g_test_message("Deep shutdown, no one-shot: raw 0x%04x (expect 0x8000)",
+                   reading);
+    g_assert_cmphex(reading, ==, 0x8000);
+
+    i2c_set8(dev, REG_ONE_SHOT, 0x01);
+    reading = i2c_get16(dev, REG_CH_READING_BASE);
+    g_test_message("Deep shutdown one-shot: raw 0x%04x (expect 0x0000)",
+                   reading);
+    g_assert_cmphex(reading, ==, 0x0000);
+
+    g_assert_cmphex(i2c_get8(dev, REG_DEEP_SHUTDOWN), ==, 0x01);
+
+    i2c_set8(dev, REG_DEEP_SHUTDOWN, 0x00);
+    qmp_adc128d818_set("ain0", 1280);
+    i2c_set8(dev, REG_ONE_SHOT, 0x01);
+    reading = i2c_get16(dev, REG_CH_READING_BASE);
+    g_test_message("After exit shutdown: raw 0x%04x (expect 0x8000)", reading);
+    g_assert_cmphex(reading, ==, 0x8000);
+}
+
+/* BUSY_STATUS NOT_READY clears after first conversion */
+static void test_busy_status(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set8(dev, REG_CONFIG, CONFIG_INITIALIZATION);
+
+    g_assert_cmphex(i2c_get8(dev, REG_BUSY_STATUS) & 0x02, ==, 0x02);
+    g_test_message("After reset: BUSY_STATUS = 0x%02x (NOT_READY set)",
+             i2c_get8(dev, REG_BUSY_STATUS));
+
+    qmp_adc128d818_set("ain0", 0);
+    i2c_set8(dev, REG_CONFIG, CONFIG_START);
+
+    g_assert_cmphex(i2c_get8(dev, REG_BUSY_STATUS) & 0x02, ==, 0x00);
+    g_test_message("After conversion: BUSY_STATUS = 0x%02x (NOT_READY cleared)",
+             i2c_get8(dev, REG_BUSY_STATUS));
+}
+
+/* Programming Channel Disable resets channel readings */
+static void test_chan_disable_clears(void *obj, void *data,
+                                     QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    uint16_t reading;
+
+    i2c_set8(dev, REG_CONFIG, CONFIG_INITIALIZATION);
+
+    qmp_adc128d818_set("ain0", 1280);
+    i2c_set8(dev, REG_CONFIG, CONFIG_START);
+    g_assert_cmphex(i2c_get16(dev, REG_CH_READING_BASE), ==, 0x8000);
+
+    i2c_set8(dev, REG_CONFIG, 0x00);
+    i2c_set8(dev, REG_CH_DISABLE, 0x02);
+    reading = i2c_get16(dev, REG_CH_READING_BASE);
+    g_test_message("After CH_DISABLE write: ch0 raw 0x%04x (expect 0x0000)",
+                   reading);
+    g_assert_cmphex(reading, ==, 0x0000);
+}
+
+/* Programming Advanced Configuration always resets channel readings */
+static void test_adv_config_clears(void *obj, void *data,
+                                   QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    uint16_t reading;
+
+    i2c_set8(dev, REG_CONFIG, CONFIG_INITIALIZATION);
+
+    qmp_adc128d818_set("ain0", 1280);
+    i2c_set8(dev, REG_CONFIG, CONFIG_START);
+    g_assert_cmphex(i2c_get16(dev, REG_CH_READING_BASE), ==, 0x8000);
+
+    i2c_set8(dev, REG_CONFIG, 0x00);
+    i2c_set8(dev, REG_ADV_CONFIG, 0x00);
+    reading = i2c_get16(dev, REG_CH_READING_BASE);
+    g_test_message("After same-mode ADV_CONFIG: ch0 0x%04x (expect 0x0000)",
+                   reading);
+    g_assert_cmphex(reading, ==, 0x0000);
+
+    i2c_set8(dev, REG_CONFIG, CONFIG_START);
+    g_assert_cmphex(i2c_get16(dev, REG_CH_READING_BASE), ==, 0x8000);
+    i2c_set8(dev, REG_CONFIG, 0x00);
+    qmp_adc128d818_set("ext-vref-mv", 4096);
+    i2c_set8(dev, REG_ADV_CONFIG, ADV_CONFIG_EXT_REF_EN);
+    reading = i2c_get16(dev, REG_CH_READING_BASE);
+    g_test_message("After ext-vref toggle: ch0 0x%04x (expect 0x0000)",
+                   reading);
+    g_assert_cmphex(reading, ==, 0x0000);
+}
+
+/* Conversion Rate register may only be programmed while in shutdown */
+static void test_conv_rate(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set8(dev, REG_CONFIG, CONFIG_INITIALIZATION);
+
+    i2c_set8(dev, REG_CONV_RATE, 0x01);
+    g_assert_cmphex(i2c_get8(dev, REG_CONV_RATE), ==, 0x01);
+
+    i2c_set8(dev, REG_CONFIG, CONFIG_START);
+    i2c_set8(dev, REG_CONV_RATE, 0x00);
+    g_test_message("CONV_RATE while running: 0x%02x (expect unchanged 0x01)",
+             i2c_get8(dev, REG_CONV_RATE));
+    g_assert_cmphex(i2c_get8(dev, REG_CONV_RATE), ==, 0x01);
+}
+
 static void adc128d818_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
@@ -475,5 +837,20 @@ static void adc128d818_register_nodes(void)
     qos_add_test("int-clear", "adc128d818", test_int_clear, NULL);
     qos_add_test("low-limit", "adc128d818", test_low_limit, NULL);
     qos_add_test("temp-hysteresis", "adc128d818", test_temp_hysteresis, NULL);
+    qos_add_test("channel-disable", "adc128d818", test_channel_disable, NULL);
+    qos_add_test("one-shot", "adc128d818", test_one_shot, NULL);
+    qos_add_test("mode-selection", "adc128d818", test_mode_selection, NULL);
+    qos_add_test("mode2-diff", "adc128d818", test_mode2_diff, NULL);
+    qos_add_test("mode3-mixed", "adc128d818", test_mode3_mixed, NULL);
+    qos_add_test("mode-change-reset", "adc128d818", test_mode_change_reset,
+                 NULL);
+    qos_add_test("diff-qom-trigger", "adc128d818", test_diff_qom_trigger, NULL);
+    qos_add_test("deep-shutdown", "adc128d818", test_deep_shutdown, NULL);
+    qos_add_test("busy-status", "adc128d818", test_busy_status, NULL);
+    qos_add_test("chan-disable-clears", "adc128d818", test_chan_disable_clears,
+                 NULL);
+    qos_add_test("adv-config-clears", "adc128d818", test_adv_config_clears,
+                 NULL);
+    qos_add_test("conv-rate", "adc128d818", test_conv_rate, NULL);
 }
 libqos_init(adc128d818_register_nodes);
-- 
2.50.1


