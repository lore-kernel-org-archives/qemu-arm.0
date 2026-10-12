Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF58CA9ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 15:00:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGHV6-0001xo-VA; Mon, 12 Oct 2026 10:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHV3-0001qK-FP
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 10:59:37 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHUz-0005kb-Es
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 10:59:36 -0400
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a168355946so17200575e9.0
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 07:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791817172; x=1792421972;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9Rfer8hh0Vvf5IwVCuxWXlCGZN/4Nsa/aOUTquN+KzI=;
 b=bGDNbnHMm3VRrvwwVYWVD6hDhbgZ2zkjzNllvAsFz38OQC4UjVoJnU+TuPv8y7tvIg
 BA5aZL0+j0wbn8mUmcBvPMLFMZRDhPcqeDKt7nmLc6W16c00031TLYk97My621EV8i9I
 RLYXcRxxiphMmAdV2a777UFY/LYn3BafCJAOi+qIcKPAscHstEQEvKNKGVAcxenb339/
 OxK6jRRP3a2zwi5vaKJo7NikMNDhHT3N05EjDk0nNV0HVzGu8ZChLFjqxGPIOyXtUzpB
 1fElFbYuIzNtNsuT66+XFWTex86O8SBzaGyNDH4IY94TcjnZ+Kyp6vaEgfU+nW8zSR9x
 VTqA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwqFSffwgLoFFbpp5q26/a74cRODhK2HRRRaVYhBvnx+s//RZhLipbmzYDU+h9cWaEtg9eB2FX/yg==@nongnu.org
X-Gm-Message-State: AFq9FYLuAtyJNjgN7VbMARtn/uU0FVe39i7Yov9fTVCfCQQ/pm+2fd+w
 OlnKV8HibQ399s6/BTxJ7s9RHSCESdsI7GwJsD5HRquPV2D3DZeUUgVF
X-Gm-Gg: AYBFou3kF8DCC5qf5EtccrSs3BFWnyny4q5DJ/gb150FcRIDeHnLbENbeN5Uo/hRiUF
 gYIfpeHnCGRvvFJgN8UjTc+7BroqGX7Ds2iHRAD186e+7AGD5imTM/rOys8FHbVOs1egHyCtSEf
 ZYO7aLfvAFp7UpKv8tl/fuD+3vnGbL73lwZR/TeYFanN+1e5gtD1whOR0UgcMM0GalyO0poiEJ1
 d3PGzdZbx7unklXUqG1RMVyt6/ddPc0lfD7ZJAzsjl4gpVd5OdH5dfm8bdBW0swsu4wnIUqY77G
 jy5gf0NoavokVEBqz1OKlY9Z8yHgaXDDw1b+U8UhBHxpy045RK95+MZKXCse1isyTEBQZbbysVY
 iwohl5aTmOoae+w/VlFbSwqZp4cprUSsnbGHPLz8KdT8bZzHfbRXxq81hrO3U3s7NCZrZ4+mkrE
 7HvmVtcVkxGLq3flMXoJqiPGd40vRdeTrAPM5lB1NzmbwprBNcaPrkjblqtDbG8TrVCTur/hUOa
 xpwbr0l/e4IAqBNS+vZ21wUp8Ath7KgDREU3HnCi/aQYA==
X-Received: by 2002:a05:600c:8b74:b0:4a0:2847:b6ee with SMTP id
 5b1f17b1804b1-4a18e4fb8c1mr183422435e9.35.1791817171791; 
 Mon, 12 Oct 2026 07:59:31 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf2e0dbsm312446465e9.11.2026.10.12.07.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 07:59:31 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:00 +0200
Subject: [PATCH v2 07/50] tests/qtest: pca9545: add mux test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-7-4c3dff084ec9@free.fr>
References: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
In-Reply-To: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815519; l=4644;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=72voOzSuCaCvtExlGMvR/ZyC+1zQC+N/iYCSHIdJEEY=;
 b=hO1AVeCoe5RAYmDOO8pUyHooRQL7tTrdKKZQeOgRAl1Th9ITISdPnVn/93Hehj7eU2IwO3M2G
 GIclfDYxaB0AKAbZ1w+Cvvi/MeJPbsmacKlhwN4ijSOcWIxcJpi07fJ
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.41; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f41.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Exercise the PCA9545 4-channel I2C mux: channel selection through the
control byte, upper-nibble read-back, and interrupt logic.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/meson.build    |   1 +
 tests/qtest/pca9545-test.c | 116 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 117 insertions(+)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 200abf6f36..e05d8a07b9 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -336,6 +336,7 @@ qos_test_ss.add(
   'ne2000-test.c',
   'tulip-test.c',
   'nvme-test.c',
+  'pca9545-test.c',
   'pca9552-test.c',
   'pca9554-test.c',
   'pca9555-test.c',
diff --git a/tests/qtest/pca9545-test.c b/tests/qtest/pca9545-test.c
new file mode 100644
index 0000000000..91f56db92f
--- /dev/null
+++ b/tests/qtest/pca9545-test.c
@@ -0,0 +1,116 @@
+/*
+ * QTest testcase for the PCA9545 4-channel I2C switch with interrupt logic
+ *
+ * Copyright (c) 2026 Meta Platforms, Inc. and affiliates.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest-single.h"
+#include "libqos/qgraph.h"
+#include "libqos/i2c.h"
+
+#define PCA9545_TEST_ID   "pca9545-test"
+#define PCA9545_TEST_ADDR 0x70
+#define PCA9545_TEST_PATH "/machine/peripheral/" PCA9545_TEST_ID
+
+/* INTn and INT are active low: level 0 is asserted. */
+#define INT_ASSERTED   0
+#define INT_RELEASED   1
+
+/* The mux has no register pointer: a read/write moves a single control byte. */
+static uint8_t pca9545_get(QI2CDevice *dev)
+{
+    uint8_t val;
+
+    qi2c_recv(dev, &val, 1);
+    return val;
+}
+
+static void pca9545_set(QI2CDevice *dev, uint8_t val)
+{
+    qi2c_send(dev, &val, 1);
+}
+
+static void pca9545_set_int(unsigned chan, int level)
+{
+    qtest_set_irq_in(global_qtest, PCA9545_TEST_PATH, "interrupt", chan, level);
+}
+
+/* Channel selection is the lower nibble; the upper nibble reads back 0. */
+static void test_channel_select(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    g_assert_cmphex(pca9545_get(dev), ==, 0x00);
+
+    pca9545_set(dev, 0x05); /* channels 0 and 2 */
+    g_assert_cmphex(pca9545_get(dev), ==, 0x05);
+
+    pca9545_set(dev, 0x0f); /* all channels */
+    g_assert_cmphex(pca9545_get(dev), ==, 0x0f);
+
+    pca9545_set(dev, 0x00);
+    g_assert_cmphex(pca9545_get(dev), ==, 0x00);
+}
+
+/*
+ * The interrupt status is reported in the upper nibble (INT3..INT0) and is
+ * latched regardless of which channels are selected (PCA9545A Table 5).
+ */
+static void test_interrupt_status(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    pca9545_set_int(1, INT_ASSERTED);
+    g_assert_cmphex(pca9545_get(dev), ==, 0x20);
+
+    pca9545_set(dev, 0x01);
+    pca9545_set_int(3, INT_ASSERTED);
+    g_assert_cmphex(pca9545_get(dev), ==, 0xa1); /* INT3 | INT1 | channel 0 */
+
+    pca9545_set_int(1, INT_RELEASED);
+    g_assert_cmphex(pca9545_get(dev), ==, 0x81); /* INT3 | channel 0 */
+}
+
+/* The INT output is pulled low while any channel interrupt is active. */
+static void test_interrupt_output(void *obj, void *data, QGuestAllocator *alloc)
+{
+    qtest_irq_intercept_out_named(global_qtest, PCA9545_TEST_PATH,
+                                  "interrupt-out");
+
+    /*
+     * Interception starts with no recorded level, so drive an idle input
+     * first to make the mux publish the released state of its output.
+     */
+    pca9545_set_int(0, INT_RELEASED);
+    g_assert_true(get_irq(0));
+
+    pca9545_set_int(0, INT_ASSERTED);
+    g_assert_false(get_irq(0));
+
+    pca9545_set_int(2, INT_ASSERTED);
+    g_assert_false(get_irq(0));
+
+    pca9545_set_int(0, INT_RELEASED);
+    g_assert_false(get_irq(0));
+    pca9545_set_int(2, INT_RELEASED);
+    g_assert_true(get_irq(0));
+}
+
+static void pca9545_register_nodes(void)
+{
+    QOSGraphEdgeOptions opts = {
+        .extra_device_opts = "id=" PCA9545_TEST_ID ",address=0x70"
+    };
+    add_qi2c_address(&opts, &(QI2CAddress) { PCA9545_TEST_ADDR });
+
+    qos_node_create_driver("pca9545", i2c_device_create);
+    qos_node_consumes("pca9545", "i2c-bus", &opts);
+
+    qos_add_test("channel-select", "pca9545", test_channel_select, NULL);
+    qos_add_test("interrupt-status", "pca9545", test_interrupt_status, NULL);
+    qos_add_test("interrupt-output", "pca9545", test_interrupt_output, NULL);
+}
+libqos_init(pca9545_register_nodes);

-- 
2.50.1


