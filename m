Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C977CC43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 09:19:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh1xX-0000tM-6Q; Tue, 07 Jul 2026 05:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@free.fr>)
 id 1wh1xW-0000sT-BP
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:19:18 -0400
Received: from smtp2-g21.free.fr ([212.27.42.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@free.fr>)
 id 1wh1xU-0004GH-Ny
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:19:18 -0400
Received: from localhost (unknown [89.92.102.124])
 (Authenticated sender: emmanuel.blot@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 54DC02003DE;
 Tue,  7 Jul 2026 11:18:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1783415955;
 bh=3KvoXpouUJ2pZqZlZc0/zRQUR5b416jfpUlUZl4sDZ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YDMKvN+aq0mFcMimgIFzO5SQGfRuZsTFeHXjugCGrMY+AxlEvtZxBznOU27XqfXnU
 lyiDiUl5tUMUHLlNVFk38l0+tIvXyoeZ42zpFF0zMPfjaNbOdbZW2zHewDL77KFP0U
 mra+qJ5CcHHz/+fWEyI+TuUkSoHJOeeI3Tn16TbGUihg4l2KS1nqKqiOJDh+owZ8Sf
 RDtnn7E95lNYBLzjkNkh96eDBgq6FUYoIq0ulK95L4hwtwIssSL2gokgk+6v/AqVws
 1wWnVnZ8+K6X8OS2nB5LdR8VUNPfQdZDh3ATwvDQ+FsoRBzpHaxVPBvTTnbg+x2PFN
 2CfBp//ss6r3Q==
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
Subject: [PATCH v6 8/9] hw/arm: anacapa: add ADC128D818 devices
Date: Tue,  7 Jul 2026 11:16:01 +0200
Message-ID: <20260707091609.97759-9-emmanuel.blot@free.fr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260707091609.97759-1-emmanuel.blot@free.fr>
References: <20260707091609.97759-1-emmanuel.blot@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Wire up the two ADC128D818 instances that appear in the Anacapa DTS:
one on i2c8 mux channel 0 and one on i2c13 mux channel 3.

Reviewed-by: Cédric Le Goater <clg@redhat.com>
Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/arm/Kconfig                  |  1 +
 hw/arm/aspeed_ast2600_anacapa.c | 21 +++++++++++++++++----
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 5f5c4899ad..7c36df649a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -554,6 +554,7 @@ config ASPEED_SOC
     select LED
     select PMBUS
     select MAX31785
+    select ADC128D818
     select FSI_APB2OPB_ASPEED
     select AT24C
     select PCI_EXPRESS
diff --git a/hw/arm/aspeed_ast2600_anacapa.c b/hw/arm/aspeed_ast2600_anacapa.c
index bd6cc00686..65d6b0faa2 100644
--- a/hw/arm/aspeed_ast2600_anacapa.c
+++ b/hw/arm/aspeed_ast2600_anacapa.c
@@ -1,13 +1,14 @@
 /*
  * Facebook Anacapa
  *
- * Copyright (c) Meta Platforms, Inc. and affiliates.
+ * Copyright (c) 2026 Meta Platforms, Inc. and affiliates.
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "hw/sensor/adc128d818.h"
 #include "hw/arm/machines-qom.h"
 #include "hw/arm/aspeed.h"
 #include "hw/arm/aspeed_soc.h"
@@ -15,7 +16,6 @@
 #include "hw/gpio/pca9552.h"
 #include "hw/nvram/eeprom_at24c.h"
 
-/* Anacapa hardware value */
 #define ANACAPA_BMC_HW_STRAP1 0x00002002
 #define ANACAPA_BMC_HW_STRAP2 0x00000000
 #define ANACAPA_BMC_RAM_SIZE ASPEED_RAM_SIZE(2 * GiB)
@@ -221,6 +221,17 @@ static const uint8_t hpm_brd_id_eeprom[] = {
 };
 static const size_t hpm_brd_id_eeprom_len = sizeof(hpm_brd_id_eeprom);
 
+static void anacapa_add_adc128d818(I2CBus *bus, uint8_t addr,
+                                   const char *description)
+{
+    DeviceState *dev = DEVICE(i2c_slave_new(TYPE_ADC128D818, addr));
+    g_autofree char *childname = g_strdup_printf("0x%02x", addr);
+
+    qdev_prop_set_string(dev, "description", description);
+    object_property_add_child(OBJECT(bus), childname, OBJECT(dev));
+    i2c_slave_realize_and_unref(I2C_SLAVE(dev), bus, &error_fatal);
+}
+
 static void anacapa_bmc_i2c_init(AspeedMachineState *bmc)
 {
     /* Reference: aspeed-bmc-facebook-anacapa.dts */
@@ -259,7 +270,8 @@ static void anacapa_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_mux = i2c_slave_create_simple(i2c[8], TYPE_PCA9546, 0x72);
 
     /* i2c8mux ch0 */
-    /* adc128d818@1f - no model */
+    /* adc128d818@1f - R-PDB ADC (mode 1: 8 voltage channels) */
+    anacapa_add_adc128d818(pca954x_i2c_get_bus(i2c_mux, 0), 0x1f, "i2c8:0:1f");
     /* pca9555@22 */
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 0),
                             TYPE_PCA9552, 0x22);
@@ -320,7 +332,8 @@ static void anacapa_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_mux = i2c_slave_create_simple(i2c[13], TYPE_PCA9548, 0x70);
 
     /* i2c13mux ch3 */
-    /* adc128d818@1f - no model */
+    /* adc128d818@1f - MB ADC (mode 1: 8 voltage channels) */
+    anacapa_add_adc128d818(pca954x_i2c_get_bus(i2c_mux, 3), 0x1f, "i2c13:3:1f");
 
     /* i2c13mux ch4 */
     /* eeprom@51 */
-- 
2.50.1


