Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE30C79FA1
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Sep 2026 16:49:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3cWw-0005ht-HC; Mon, 07 Sep 2026 12:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cWl-0005Sb-UB
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 12:49:05 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cWh-000453-PJ
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 12:49:02 -0400
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-485843aeab8so4205779f8f.1
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2026 09:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799737; x=1789404537;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zUsTXXEeIFdgO+Vb2tiN7o6xxQ0vkicw8Xmi7qgeMm4=;
 b=hyjtg1Ay5IirtEDXvMU3xp+vsxMYhUnUcaa8x/b+hFgzOw30shyucJhsUsIibZxK+V
 FnPtjXUrh707hMbYokXLp9r9DDejOMtKkWD3w5c04jVEHos0zlLyc6BQ40qjbzCi9/br
 4hwY2d051tibWJP3X8JSAO7cK2NngP/uRJp+S2GM8zWaNv0jZ42TETekLT/mFZ6Zo84x
 YbLwCpr+U65/3ZjJNeowlCZxvv9wEThytYiETNrN+QfYZxkL6puz6c32dyKAoGrotaTJ
 jRbyBnl5wWMumeZh/Ibk0/lA8GPPXGNO9KcaFLofz8AkhOhUwWGwl49M78bojHzTHV4M
 yPhA==
X-Forwarded-Encrypted: i=1;
 AKwUvBx1ziLTolFmCGvtsZmmELXmOpoHIzGf+3dTK8wDSKJX2BCs0f8obvVshXOEiNT2GOSUyS/lMDc1NQ==@nongnu.org
X-Gm-Message-State: AFuF++lnhbCFqhdmAhKdTe/1o97ewbA66wNuFp7hNMuTnm68tbX5axr1
 l+FSJsojIWqvNmJZoxB+rAJKDrdVs4KQZWNHdF8OTVtOtahFoSImR0MX
X-Gm-Gg: AYBFou0eET9hgO6Cj1RCPwPrwAnkUvouHxWLz5CGFZSmcmKx/SApafHQifsx+xCE+Il
 TlEUhx6+P9fseugEsNkpgE13mEARWJ50lAuhG4KdEIM2dS3oxHuJSFK5VxFgq/rcwXdxG9mh3pQ
 wasOQlmLV6iSqlrXLniyAXZwZryQGeRgfNmSqqirR7GDKLBDrnE3kUcWZY1f9e2cWytYv8bXZAo
 E5k/BfM0/LaGHsgGghoEtW3bQcG3ytLMjNOTPCkiS3K+xuBd6CH8KUVqwbGNYI5r0kAjCWRN9S4
 crhgPCIR3kHmcCEutJ16is1q/ur1XjnwFmSpUvflwa0XXHqufzdMHoS8bAkG92mylR+7djj+0tc
 LwIicNGcQmkHVslaB5E7MPv0Xe55u4nQvHIe2vG/GA318PT4iUDbJHFLyxnw0O/JZLam/SFpeS2
 6g5lKGG55r820EaQ8LHxs7tA9DxYiHI2miXxD/AD7Ld5hUbP6TOgEhgj7qeu8NRM6QXmHpcga9V
 Z9781o+zoJTTVjtw6ni+BSRcukl4xUavpc=
X-Received: by 2002:a05:600c:8b6d:b0:499:a277:e8b5 with SMTP id
 5b1f17b1804b1-49cf7fdd67emr471961705e9.3.1788799736620; 
 Mon, 07 Sep 2026 09:48:56 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee6024a8sm423768425e9.6.2026.09.07.09.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:48:55 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:42:23 +0200
Subject: [PATCH 33/50] tests/qtest: ina230: add current/voltage/power
 monitor test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-33-0d83ad610c3b@free.fr>
References: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
In-Reply-To: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799322; l=5192;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=PgiXV2D5MUPvMC/5KaHeQDpxZM0vqyW+GxMY+0uXgS4=;
 b=nollitU02QchYB4vzHtldawtOY/2bbfcEI2xVmutJ7IBjxwYo8lZ7PgLWtyovhjkVfVvKWkK2
 AgYVH0r4fBECa5+UER/mkoOrGILa3BIYDTqKBZEBBJOrFtNvipIA5YX
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.41; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f41.google.com
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

Introduce the INA230 qtest: the qgraph node and the register map. Cover
the power-on-reset defaults and Die ID, the software reset, and the
Configuration register write mask. The QMP voltage-injection helpers
arrive with the following commit that exercises them.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/qtest/ina230-test.c | 115 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build   |   1 +
 2 files changed, 116 insertions(+)

diff --git a/tests/qtest/ina230-test.c b/tests/qtest/ina230-test.c
new file mode 100644
index 0000000000..f7aefd2d97
--- /dev/null
+++ b/tests/qtest/ina230-test.c
@@ -0,0 +1,115 @@
+/*
+ * QTest testcase for the INA230 current/voltage/power monitor
+ *
+ * Copyright (c) 2026 Meta Platforms, Inc. and affiliates.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "libqos/i2c.h"
+#include "libqos/qgraph.h"
+#include "libqtest-single.h"
+#include "qobject/qdict.h"
+
+#define INA230_TEST_ID      "ina230-test"
+#define INA230_TEST_ADDR    0x40
+
+/* Register pointer addresses */
+#define REG_CONFIG          0x00
+#define REG_SHUNT           0x01
+#define REG_BUS             0x02
+#define REG_POWER           0x03
+#define REG_CURRENT         0x04
+#define REG_CALIBRATION     0x05
+#define REG_MASK_ENABLE     0x06
+#define REG_ALERT_LIMIT     0x07
+#define REG_DIE_ID          0xFF
+
+/* Configuration register bits */
+#define CONFIG_POR          0x4127
+#define CONFIG_RST          0x8000
+
+/* Mask/Enable register bits */
+#define ME_LEN              0x0001
+#define ME_APOL             0x0002
+#define ME_OVF              0x0004
+#define ME_CVRF             0x0008
+#define ME_AFF              0x0010
+#define ME_CNVR             0x0400
+#define ME_POL              0x0800
+#define ME_BUL              0x1000
+#define ME_BOL              0x2000
+#define ME_SUL              0x4000
+#define ME_SOL              0x8000
+
+/* Injected-input scaling (datasheet fixed LSBs) */
+#define SHUNT_LSB_NV        2500
+#define BUS_LSB_UV          1250
+
+#define DIE_ID_VAL          0x2310
+
+/* Power-on-reset default values and the Die ID */
+static void test_defaults(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    g_assert_cmphex(i2c_get16(dev, REG_CONFIG), ==, CONFIG_POR);
+    g_assert_cmphex(i2c_get16(dev, REG_SHUNT), ==, 0x0000);
+    g_assert_cmphex(i2c_get16(dev, REG_BUS), ==, 0x0000);
+    g_assert_cmphex(i2c_get16(dev, REG_POWER), ==, 0x0000);
+    g_assert_cmphex(i2c_get16(dev, REG_CURRENT), ==, 0x0000);
+    g_assert_cmphex(i2c_get16(dev, REG_CALIBRATION), ==, 0x0000);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE), ==, 0x0000);
+    g_assert_cmphex(i2c_get16(dev, REG_ALERT_LIMIT), ==, 0x0000);
+    g_assert_cmphex(i2c_get16(dev, REG_DIE_ID), ==, DIE_ID_VAL);
+}
+
+/* Software reset via the Configuration RST bit */
+static void test_soft_reset(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    i2c_set16(dev, REG_CALIBRATION, 0x1234);
+    i2c_set16(dev, REG_MASK_ENABLE, ME_SOL);
+    i2c_set16(dev, REG_ALERT_LIMIT, 0x0500);
+
+    g_assert_cmphex(i2c_get16(dev, REG_CALIBRATION), ==, 0x1234);
+    g_assert_cmphex(i2c_get16(dev, REG_ALERT_LIMIT), ==, 0x0500);
+
+    i2c_set16(dev, REG_CONFIG, CONFIG_RST);
+
+    g_assert_cmphex(i2c_get16(dev, REG_CONFIG), ==, CONFIG_POR);
+    g_assert_cmphex(i2c_get16(dev, REG_CALIBRATION), ==, 0x0000);
+    g_assert_cmphex(i2c_get16(dev, REG_MASK_ENABLE), ==, 0x0000);
+    g_assert_cmphex(i2c_get16(dev, REG_ALERT_LIMIT), ==, 0x0000);
+}
+
+/* Every bit except the self-clearing RST is writable and reads back */
+static void test_config_wmask(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QI2CDevice *dev = (QI2CDevice *)obj;
+
+    /* Reserved bits are not forced: the guest value is retained */
+    i2c_set16(dev, REG_CONFIG, 0x0007);
+    g_assert_cmphex(i2c_get16(dev, REG_CONFIG), ==, 0x0007);
+
+    i2c_set16(dev, REG_CONFIG, 0x7FFF);
+    g_assert_cmphex(i2c_get16(dev, REG_CONFIG), ==, 0x7FFF);
+}
+
+static void ina230_register_nodes(void)
+{
+    QOSGraphEdgeOptions opts = {
+        .extra_device_opts = "id=" INA230_TEST_ID ",address=0x40"
+    };
+    add_qi2c_address(&opts, &(QI2CAddress) { INA230_TEST_ADDR });
+
+    qos_node_create_driver("ina230", i2c_device_create);
+    qos_node_consumes("ina230", "i2c-bus", &opts);
+
+    qos_add_test("defaults", "ina230", test_defaults, NULL);
+    qos_add_test("soft-reset", "ina230", test_soft_reset, NULL);
+    qos_add_test("config-wmask", "ina230", test_config_wmask, NULL);
+}
+libqos_init(ina230_register_nodes);
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 2bf3f5555b..97480d92aa 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -324,6 +324,7 @@ qos_test_ss.add(
   'e1000-test.c',
   'eepro100-test.c',
   'es1370-test.c',
+  'ina230-test.c',
   'lsm303dlhc-mag-test.c',
   'isl_pmbus_vr-test.c',
   'max34451-test.c',

-- 
2.50.1


