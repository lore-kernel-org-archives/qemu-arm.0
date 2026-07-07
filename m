Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97792C43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 09:17:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh1vu-0008JW-He; Tue, 07 Jul 2026 05:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@free.fr>)
 id 1wh1vs-0008Hi-VQ
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:17:36 -0400
Received: from smtp2-g21.free.fr ([212.27.42.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@free.fr>)
 id 1wh1vr-0003gC-2d
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:17:36 -0400
Received: from localhost (unknown [89.92.102.124])
 (Authenticated sender: emmanuel.blot@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 244112003D0;
 Tue,  7 Jul 2026 11:17:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1783415853;
 bh=Hej78vcTkoAdQ/j+5wDk8cm73w9zfyMqMLcfHOUvhq8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FPvASWtKYaSfZTlO+RJCR/l5Ww1upi12cHV1a0FRpIhTE8zQ3bdh+Rd5ZY5xr86Qv
 It9yVIuymeicj6wF7PWdNq6FPD2tpgyUlt4ENbDm/+C5n4kENwrXzYTx9P4WP0ZCfd
 wrIUDmUEhAZOMfkrLro5pnZgqY9xLkAfGMlIA850qwAbGtdz3SFqlOgVV1583pigiE
 9Cgas4Aph00pLfEfkTfSFYOUKJ+mn7VxXDQf9IPMWYCWFK8d7PzZa91vct3TfmJyhp
 oUiEXtfdPuZ/vy3VEm0V1xqmEaVaFduEBH8CnkKEmo7/tVuOBqHSrj7o5YLpWvcLhW
 wEcSJCVlxkuqg==
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
Subject: [PATCH v6 2/9] tests/qtest: adc128d818: add test harness and register
 access
Date: Tue,  7 Jul 2026 11:15:55 +0200
Message-ID: <20260707091609.97759-3-emmanuel.blot@free.fr>
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

Introduce the QOS test node and QMP property helpers for the
ADC128D818, and cover basic register access: manufacturer and
revision IDs, power-on-reset defaults, software reset, and the
ain and temperature property readback.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/adc128d818-test.c | 169 ++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build       |   1 +
 2 files changed, 170 insertions(+)
 create mode 100644 tests/qtest/adc128d818-test.c

diff --git a/tests/qtest/adc128d818-test.c b/tests/qtest/adc128d818-test.c
new file mode 100644
index 0000000000..9a8811256f
--- /dev/null
+++ b/tests/qtest/adc128d818-test.c
@@ -0,0 +1,169 @@
+/*
+ * QTest testcase for the ADC128D818 ADC
+ *
+ * Copyright (c) 2026 Meta Platforms, Inc. and affiliates.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/bitops.h"
+#include "libqos/i2c.h"
+#include "libqos/qgraph.h"
+#include "libqtest-single.h"
+#include "qobject/qdict.h"
+
+#define ADC128D818_TEST_ID      "adc128d818-test"
+#define ADC128D818_TEST_ADDR    0x1f
+
+/* Register addresses */
+#define REG_CONFIG              0x00
+#define REG_INT_STATUS          0x01
+#define REG_INT_MASK            0x03
+#define REG_CONV_RATE           0x07
+#define REG_CH_DISABLE          0x08
+#define REG_ONE_SHOT            0x09
+#define REG_DEEP_SHUTDOWN       0x0a
+#define REG_ADV_CONFIG          0x0b
+#define REG_BUSY_STATUS         0x0c
+
+/* Channel Reading Registers (16-bit, read-only) */
+#define REG_CH_READING_BASE     0x20
+
+/* Limit Registers (8-bit, read/write) */
+#define REG_LIMIT_BASE          0x2a
+
+/* ID Registers (read-only) */
+#define REG_MANUFACTURER_ID     0x3e
+#define REG_REVISION_ID         0x3f
+
+/* Configuration Register (0x00) bitfields */
+#define CONFIG_START            BIT(0)
+#define CONFIG_INT_ENABLE       BIT(1)
+#define CONFIG_INT_CLEAR        BIT(3)
+#define CONFIG_INITIALIZATION   BIT(7)
+
+/* Advanced Configuration Register (0x0b) bitfields */
+#define ADV_CONFIG_EXT_REF_EN   BIT(0)
+#define ADV_CONFIG_MODE_1       (1 << 1)
+#define ADV_CONFIG_MODE_2       (2 << 1)
+#define ADV_CONFIG_MODE_3       (3 << 1)
+
+/* Number of channels */
+#define NUM_CHANNELS            8
+
+/* Internal VREF in mV */
+#define INTERNAL_VREF_MV        2560
+
+/* QMP helpers for setting device properties */
+
+static void qmp_adc128d818_set(const char *property, int value)
+{
+    QDict *resp;
+
+    resp = qmp("{ 'execute': 'qom-set', 'arguments':"
+               " { 'path': %s, 'property': %s, 'value': %d } }",
+               ADC128D818_TEST_ID, property, value);
+    g_assert(qdict_haskey(resp, "return"));
+    qobject_unref(resp);
+}
+
+static int qmp_adc128d818_get(const char *property)
+{
+    QDict *resp;
+    int ret;
+
+    resp = qmp("{ 'execute': 'qom-get', 'arguments':"
+               " { 'path': %s, 'property': %s } }",
+               ADC128D818_TEST_ID, property);
+    g_assert(qdict_haskey(resp, "return"));
+    ret = qdict_get_int(resp, "return");
+    qobject_unref(resp);
+    return ret;
+}
+
+/* Manufacturer and Revision ID registers */
+static void test_id_registers(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    g_assert_cmphex(i2c_get8(dev, REG_MANUFACTURER_ID), ==, 0x01);
+    g_assert_cmphex(i2c_get8(dev, REG_REVISION_ID), ==, 0x09);
+}
+
+/* Power-on-reset default values */
+static void test_defaults(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+    unsigned ch;
+
+    g_assert_cmphex(i2c_get8(dev, REG_CONFIG), ==, 0x08);
+    g_assert_cmphex(i2c_get8(dev, REG_INT_STATUS), ==, 0x00);
+    g_assert_cmphex(i2c_get8(dev, REG_INT_MASK), ==, 0x00);
+    g_assert_cmphex(i2c_get8(dev, REG_CONV_RATE), ==, 0x00);
+    g_assert_cmphex(i2c_get8(dev, REG_CH_DISABLE), ==, 0x00);
+    g_assert_cmphex(i2c_get8(dev, REG_DEEP_SHUTDOWN), ==, 0x00);
+    g_assert_cmphex(i2c_get8(dev, REG_ADV_CONFIG), ==, 0x00);
+    g_assert_cmphex(i2c_get8(dev, REG_BUSY_STATUS), ==, 0x02);
+
+    for (ch = 0u; ch < NUM_CHANNELS; ch++) {
+        g_assert_cmphex(i2c_get8(dev, REG_LIMIT_BASE + ch * 2u), ==, 0xFF);
+        g_assert_cmphex(i2c_get8(dev, REG_LIMIT_BASE + ch * 2u + 1u), ==, 0x00);
+    }
+}
+
+/* Software reset via INITIALIZATION bit */
+static void test_soft_reset(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set8(dev, REG_INT_MASK, 0xAA);
+    i2c_set8(dev, REG_CH_DISABLE, 0x55);
+    i2c_set8(dev, REG_LIMIT_BASE, 0x42);
+
+    g_assert_cmphex(i2c_get8(dev, REG_INT_MASK), ==, 0xAA);
+    g_assert_cmphex(i2c_get8(dev, REG_CH_DISABLE), ==, 0x55);
+    g_assert_cmphex(i2c_get8(dev, REG_LIMIT_BASE), ==, 0x42);
+
+    i2c_set8(dev, REG_CONFIG, CONFIG_INITIALIZATION);
+
+    g_assert_cmphex(i2c_get8(dev, REG_CONFIG), ==, 0x08);
+    g_assert_cmphex(i2c_get8(dev, REG_INT_MASK), ==, 0x00);
+    g_assert_cmphex(i2c_get8(dev, REG_CH_DISABLE), ==, 0x00);
+    g_assert_cmphex(i2c_get8(dev, REG_LIMIT_BASE), ==, 0xFF);
+    g_assert_cmphex(i2c_get8(dev, REG_BUSY_STATUS), ==, 0x02);
+}
+
+/* Verify ain property readback via QMP */
+static void test_ain_property(void *obj, void *data, QGuestAllocator *alloc)
+{
+    int value;
+
+    qmp_adc128d818_set("ain3", 1500);
+    value = qmp_adc128d818_get("ain3");
+    g_test_message("Set ain3 = 1500 mV, readback = %d mV", value);
+    g_assert_cmpint(value, ==, 1500);
+
+    qmp_adc128d818_set("temperature", 37500);
+    value = qmp_adc128d818_get("temperature");
+    g_test_message("Set temperature = 37500 mC, readback = %d mC", value);
+    g_assert_cmpint(value, ==, 37500);
+}
+
+static void adc128d818_register_nodes(void)
+{
+    QOSGraphEdgeOptions opts = {
+        .extra_device_opts = "id=" ADC128D818_TEST_ID
+                             ",address=0x1f"
+    };
+    add_qi2c_address(&opts, &(QI2CAddress) { ADC128D818_TEST_ADDR });
+
+    qos_node_create_driver("adc128d818", i2c_device_create);
+    qos_node_consumes("adc128d818", "i2c-bus", &opts);
+
+    qos_add_test("id-registers", "adc128d818", test_id_registers, NULL);
+    qos_add_test("defaults", "adc128d818", test_defaults, NULL);
+    qos_add_test("soft-reset", "adc128d818", test_soft_reset, NULL);
+    qos_add_test("ain-property", "adc128d818", test_ain_property, NULL);
+}
+libqos_init(adc128d818_register_nodes);
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 5e18b947c7..364458ab0b 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -303,6 +303,7 @@ qtests_hexagon = ['boot-serial-test']
 qos_test_ss = ss.source_set()
 qos_test_ss.add(
   'ac97-test.c',
+  'adc128d818-test.c',
   'adm1272-test.c',
   'adm1266-test.c',
   'ds1338-test.c',
-- 
2.50.1


