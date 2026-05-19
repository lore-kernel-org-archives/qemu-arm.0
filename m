Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6DACD5BA3
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 10:36:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPHoC-0005FQ-Ve; Tue, 19 May 2026 06:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <williamdapinho@gmail.com>)
 id 1wPHoB-0005DC-Az
 for qemu-arm@nongnu.org; Tue, 19 May 2026 06:36:19 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <williamdapinho@gmail.com>)
 id 1wPHo9-0005uA-6k
 for qemu-arm@nongnu.org; Tue, 19 May 2026 06:36:19 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-7b37d84a6b3so26834917b3.2
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 03:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779186976; x=1779791776; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Imn7gRhq8UHf9WD3M2qqYk+mqwg5MZaM7nOmvBSaQWQ=;
 b=JOt2odyr/eRaIw0oBZay9oPFEEyX8kk2SX3ER9yEO+P7hK8DP8tECxfE5ddZ0iOee2
 8te4U39TyTog+9fp1+P7h9oc8/NICG+NIiwfE3W25M4Rv9hd6oIpI0UnJ0i1Q2TgZnwI
 vU9+/KCnQaQQ4kXamS7Jzn0hZiqfqXdYjOLMVrD2RBU0R17dO5mkQPCbeWj3B/KKiyST
 jPWr8LzGXTiq2QdvEanaOmUSZrBLLqTIPazO4XLg4b2i+d7NeZqOpPI+fR3QAjdBZmQb
 YzhS0whMuT4g7IXovCvzdtvLzD+hozrgxacUAqdz5995AQqH8trpxuuAIGPpfWL+dNql
 JfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779186976; x=1779791776;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Imn7gRhq8UHf9WD3M2qqYk+mqwg5MZaM7nOmvBSaQWQ=;
 b=k9RlGCVRNxyyAbpuCEpLHpDO1J1w/k6HjDviubM4eF+YGiQ3Frfnpo43Qyp9kHCcEv
 lmF0gOATFHALDJ68MWP78duB7ZT6tK5ahAw4jvzqk5PT3xtWbhkPKl/c3ZPsFn+MkjoD
 d8ziHzbVzQsIa6Ne/+x6FIz+ZqqQTNtodH6eQIm/K6RnZO+rGtMDDWMCzC4BDJaBheIc
 q585Aj3Zu0C862LrSfNAyRh+/ioUsGgsO6Fu7QJ9xu10XjHt2pwyAj0Lx2PGC5qQO0iR
 MtP8gGycPD1c1/gRh8+H5OLjruNJv4aB1Fa83QNwloPE6x2WAOPXIBAJQd/e13RAxENw
 6SZw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8mUMPW9JH+oYdeHbhGoeY2AeMxxiVuSCTvlKw0S13cRj6te/h5Go+ldN22KbIqDm4QCroPjuDg8A==@nongnu.org
X-Gm-Message-State: AOJu0YzLVKwPsNLjpN042R4WNGbAPlwDqVAuhHhVTL3Fthl2y/LVPeir
 N4/9agkOtfigJrrIvslEQl4OGuOh5URRj49II5M0/z/vK6GrHc7fMRbT
X-Gm-Gg: Acq92OHV2iHm+zXIAI6yyHpscn2nuGewXI6WCsNA1OdwgcY3Wqf0hZBK6bfnph3tJM/
 6jYtDHTSOiIqQbA+SAhuPoHkeJlfaXaO+e3uUATMXqhko+Im/5mMPuRn9MKgVlCMOZWwJKmzVde
 e5SWTTcDUMYb3AfY7Gh0xm5Sk+z+K6ZbJWOLuyA9SDcBdw8ULc8UvpcA9G/5a1jAQ2RIeZ2kqPB
 iYMgNE9kNC99ZXX41lZ2+ytofjfsj8bE4OSLSpNbQMKNkihsA55X4LkUNlHInwwOyLEELzLluk/
 jfbW7DUGuss7nMYG/oCVpnFVyo2LU1brnrfYv52qO6cnZT1nWUTpZEqiafdNwjvuXQUqcu8ZGWq
 QlKTIS3VU6/VuqeXB+UG8G9G2vK+2ok0GDBPy9pmPYhw2T/0p++aNZqhBR5lc0qwGVU9W9SrFNU
 g/b5seqTDbXb0VQJACDbVU0TI=
X-Received: by 2002:a05:690c:385:b0:7bd:5cc4:1961 with SMTP id
 00721157ae682-7c95d1d32e5mr204295857b3.37.1779186975777; 
 Tue, 19 May 2026 03:36:15 -0700 (PDT)
Received: from localhost ([2a03:2880:f806:3c::])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7cc997cad73sm34558817b3.17.2026.05.19.03.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2026 03:36:14 -0700 (PDT)
From: William de Abreu Pinho <williamdapinho@gmail.com>
Date: Tue, 19 May 2026 03:36:04 -0700
Subject: [PATCH v2 2/3] hw/arm/aspeed: add anacapa-bmc machine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260519-add-anacapa-machine-v2-2-47027867d76a@gmail.com>
References: <20260519-add-anacapa-machine-v2-0-47027867d76a@gmail.com>
In-Reply-To: <20260519-add-anacapa-machine-v2-0-47027867d76a@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, William de Abreu Pinho <williamdapinho@gmail.com>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=williamdapinho@gmail.com; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add the Facebook Anacapa BMC machine.  The I2C topology is based on the
Linux kernel device tree [1].  Hardware strap register values are taken
from real hardware.

A functional test is included using the OpenBMC image built from [2],
similar to the tests for bletchley-bmc and catalina-bmc.

[1]: https://github.com/torvalds/linux/blob/76b4ec8efdc3887cdbf730da2e55881fc1a18770/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
[2]: https://github.com/openbmc/openbmc/commit/8e22df918eaaa5d83143471d24ef0eeb1c1e3c7c

Signed-off-by: William de Abreu Pinho <williamdapinho@gmail.com>
---
 hw/arm/aspeed_ast2600_anacapa.c             | 153 ++++++++++++++++++++++++++++
 hw/arm/meson.build                          |   1 +
 tests/functional/arm/meson.build            |   2 +
 tests/functional/arm/test_aspeed_anacapa.py |  25 +++++
 4 files changed, 181 insertions(+)

diff --git a/hw/arm/aspeed_ast2600_anacapa.c b/hw/arm/aspeed_ast2600_anacapa.c
new file mode 100644
index 0000000000..c24f00d44c
--- /dev/null
+++ b/hw/arm/aspeed_ast2600_anacapa.c
@@ -0,0 +1,153 @@
+/*
+ * Facebook Anacapa
+ *
+ * Copyright (c) Meta Platforms, Inc. and affiliates.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/arm/machines-qom.h"
+#include "hw/arm/aspeed.h"
+#include "hw/arm/aspeed_soc.h"
+#include "hw/i2c/i2c_mux_pca954x.h"
+#include "hw/gpio/pca9552.h"
+#include "hw/nvram/eeprom_at24c.h"
+
+/* Anacapa hardware value */
+#define ANACAPA_BMC_HW_STRAP1 0x00002002
+#define ANACAPA_BMC_HW_STRAP2 0x00000000
+#define ANACAPA_BMC_RAM_SIZE ASPEED_RAM_SIZE(2 * GiB)
+
+static void anacapa_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    /* Reference: aspeed-bmc-facebook-anacapa.dts */
+
+    AspeedSoCState *soc = bmc->soc;
+    I2CBus *i2c[16] = {};
+    I2CSlave *i2c_mux;
+
+    for (int i = 0; i < ARRAY_SIZE(i2c); i++) {
+        i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
+    }
+
+    /* &i2c0 */
+    /* eeprom@50 */
+    at24c_eeprom_init(i2c[0], 0x50, 256 * KiB);
+    /* i2c-mux@70 */
+    i2c_slave_create_simple(i2c[0], TYPE_PCA9546, 0x70);
+
+    /* &i2c1 */
+    /* eeprom@50 */
+    at24c_eeprom_init(i2c[1], 0x50, 256 * KiB);
+    /* i2c-mux@70 (PCA9546) — 4 channels, empty */
+    i2c_slave_create_simple(i2c[1], TYPE_PCA9546, 0x70);
+
+    /* &i2c4 */
+    /* i2c-mux@70 (PCA9548) */
+    i2c_slave_create_simple(i2c[4], TYPE_PCA9548, 0x70);
+
+    /* &i2c6 */
+    /* eeprom@50 */
+    at24c_eeprom_init(i2c[6], 0x50, 32 * KiB);
+
+    /* &i2c8 */
+    /* i2c-mux@72 (PCA9546) */
+    i2c_mux = i2c_slave_create_simple(i2c[8], TYPE_PCA9546, 0x72);
+
+    /* i2c8mux ch0 */
+    /* adc128d818@1f — no model */
+    /* pca9555@22 */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 0),
+                            TYPE_PCA9552, 0x22);
+    /* pca9555@24 */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 0),
+                            TYPE_PCA9552, 0x24);
+    /* eeprom@50 */
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 16 * KiB);
+
+    /* i2c8mux ch1 */
+    /* pca9555@22 */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 1),
+                            TYPE_PCA9552, 0x22);
+    /* pca9555@24 */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 1),
+                            TYPE_PCA9552, 0x24);
+    /* eeprom@50 */
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x50, 16 * KiB);
+
+    /* &i2c9 */
+    /* eeprom@50 */
+    at24c_eeprom_init(i2c[9], 0x50, 16 * KiB);
+    /* eeprom@56 */
+    at24c_eeprom_init(i2c[9], 0x56, 8 * KiB);
+
+    /* &i2c10 */
+    /* i2c-mux@71 (PCA9548) */
+    i2c_mux = i2c_slave_create_simple(i2c[10], TYPE_PCA9548, 0x71);
+
+    /* i2c10mux ch5 */
+    /* pca9555@22*/
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5),
+                            TYPE_PCA9552, 0x22);
+    /* eeprom@52 */
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 5), 0x52, 32 * KiB);
+
+    /* &i2c11 */
+    /* i2c-mux@71 (PCA9548) */
+    i2c_mux = i2c_slave_create_simple(i2c[11], TYPE_PCA9548, 0x71);
+
+    /* i2c11mux ch0-ch4 — empty */
+
+    /* i2c11mux ch5 */
+    /* pca9555@22 */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5),
+                            TYPE_PCA9552, 0x22);
+    /* eeprom@52 */
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 5), 0x52, 32 * KiB);
+
+    /* &i2c13 */
+    /* i2c-mux@70 (PCA9548) */
+    i2c_mux = i2c_slave_create_simple(i2c[13], TYPE_PCA9548, 0x70);
+
+    /* i2c13mux ch3 */
+    /* adc128d818@1f - no model */
+
+    /* i2c13mux ch4 */
+    /* eeprom@51 */
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 4), 0x51, 32 * KiB);
+
+    /* i2c13mux ch7 */
+    /* nfc@28 — no model */
+}
+
+static void aspeed_machine_anacapa_class_init(ObjectClass *oc,
+                                               const void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Facebook Anacapa BMC (Cortex-A7)";
+    amc->soc_name  = "ast2600-a3";
+    amc->hw_strap1 = ANACAPA_BMC_HW_STRAP1;
+    amc->hw_strap2 = ANACAPA_BMC_HW_STRAP2;
+    amc->fmc_model = "mx66l1g45g";
+    amc->spi_model = NULL;
+    amc->num_cs    = 2;
+    amc->macs_mask = ASPEED_MAC2_ON;
+    amc->i2c_init  = anacapa_bmc_i2c_init;
+    mc->default_ram_size = ANACAPA_BMC_RAM_SIZE;
+    aspeed_machine_class_init_cpus_defaults(mc);
+}
+
+static const TypeInfo aspeed_ast2600_anacapa_types[] = {
+    {
+        .name          = MACHINE_TYPE_NAME("anacapa-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_anacapa_class_init,
+        .interfaces    = arm_machine_interfaces,
+    }
+};
+
+DEFINE_TYPES(aspeed_ast2600_anacapa_types)
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 84b8ec5fb5..3de3dca8a9 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -56,6 +56,7 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_ast2500_witherspoon.c',
   'aspeed_ast2500_yosemitev2.c',
   'aspeed_ast2600.c',
+  'aspeed_ast2600_anacapa.c',
   'aspeed_ast2600_bletchley.c',
   'aspeed_ast2600_catalina.c',
   'aspeed_ast2600_evb.c',
diff --git a/tests/functional/arm/meson.build b/tests/functional/arm/meson.build
index 2f538f29a2..959179a56f 100644
--- a/tests/functional/arm/meson.build
+++ b/tests/functional/arm/meson.build
@@ -12,6 +12,7 @@ test_arm_timeouts = {
   'aspeed_ast2600_sdk' : 720,
   'aspeed_ast2600_sdk_515' : 720,
   'aspeed_ast2600_sdk_otp' : 720,
+  'aspeed_anacapa' : 480,
   'aspeed_bletchley' : 480,
   'aspeed_catalina' : 480,
   'aspeed_gb200nvl_bmc' : 480,
@@ -45,6 +46,7 @@ tests_arm_system_thorough = [
   'aspeed_ast2600_sdk',
   'aspeed_ast2600_sdk_515',
   'aspeed_ast2600_sdk_otp',
+  'aspeed_anacapa',
   'aspeed_bletchley',
   'aspeed_catalina',
   'aspeed_gb200nvl_bmc',
diff --git a/tests/functional/arm/test_aspeed_anacapa.py b/tests/functional/arm/test_aspeed_anacapa.py
new file mode 100755
index 0000000000..27f8bd8b56
--- /dev/null
+++ b/tests/functional/arm/test_aspeed_anacapa.py
@@ -0,0 +1,25 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots the ASPEED machines
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import Asset
+from aspeed import FacebookAspeedTest
+
+
+class AnacapaMachine(FacebookAspeedTest):
+
+    ASSET_ANACAPA_FLASH = Asset(
+        'https://github.com/legoater/qemu-aspeed-boot/raw/3fa3212827b04be4034d43b5adeef57c27d6ab18/images/anacapa-bmc/openbmc-20260512025228/obmc-phosphor-image-anacapa-20260512025228.static.mtd.xz',
+        '2232e241abcfb6d4f6b82cb6c378ce5ce05e364aac6d118785c2b6cc33fe43f3')
+
+    def test_arm_ast2600_anacapa_openbmc(self):
+        image_path = self.uncompress(self.ASSET_ANACAPA_FLASH)
+
+        self.do_test_arm_aspeed_openbmc('anacapa-bmc', image=image_path,
+                                        uboot='2019.04', cpu_id='0xf00',
+                                        soc='AST2600 rev A3')
+
+if __name__ == '__main__':
+    FacebookAspeedTest.main()

-- 
2.53.0-Meta


