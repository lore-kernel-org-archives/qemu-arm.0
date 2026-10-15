Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC973CC6B33
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 10:35:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHIlh-0005RK-3A; Thu, 15 Oct 2026 06:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIiT-00005L-Ez
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:29:44 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIiP-0004cN-Q9
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:29:41 -0400
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a16bc2278aso36405915e9.1
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 03:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792060176; x=1792664976;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Sq7XhabJmYhh213jf/5ZhPcJEk2bxoy1lv+2qIC8xl4=;
 b=raWvhVFs9U3KM++St2QKsllbTdA/wGw6Lbp9YME0BAD9dAncZxBj9aPAKON4J9Ns/i
 w9kchgWs/E6lys4quzla3haEoVbiyza3f8VsMAgzGssEAovaCKF8AuA8BCl6vIfXAnj/
 Tol577NmU/QMtfM+w0brHnGyuxe3/mqlOX3BjLvPySDT+yxpvog1P3JpyGT+MwIBsmDQ
 KSpHxbEfJIvJZgY4K/uFxir0cLA3MEvZNvM12d/wj4mkYcSEL6kupy/D+7aMbrr1v5IY
 AMYUCd63IIJSTaiPobGZBT7Wf6kAv+2bzyZxGFw0h/VsnF0Zgzu2+5tOBmXFgEIiSIhe
 bUOw==
X-Forwarded-Encrypted: i=1;
 AKwUvBygt9hxBZPkcfOYlQcoCNtT+Ef9gyweP9vnLlMtw3VtkZM/pd3FUiFpcJAQknl+Yif0hPvn5LHbGA==@nongnu.org
X-Gm-Message-State: AFq9FYLecV6XoRoGrS/KOcqKhCBrilhZB1RZfPXBI+rO7pmFDULFOlf7
 WBebw8iYuoGD+l7wtE831GGcVU4d55RhIufkqpctEaJQx5Ak4TSSoYlb
X-Gm-Gg: AYBFou0kL1DBW4Rq4NmnATt4BmxG2DGpUh7WlYz8wfnEKBbqeJoa5CPhyRmiNG6ODa0
 zXhTce/IWLle+nUHbsxgApy6+ObtYmuO0eIRn0ZJWAhiafIAuVDOdLY6majL0eI3fAWjfgcFvDX
 5EaJTYPmS3d7AaddF6M0O0henLaDxUSHu+hv+OITlWmQMMCeUsBDw63Ogbg2aCgCUW9iFPnqPB3
 wnezbcECSxTPpTmabQOD2cLTU0kCJc3UTn5nUAXw6z/6nw10DLUulRdTL6TAZz6gy1GeLz5zAN9
 A3l4AWGvYGjdMeZdgZKxlR0305x1UjyVbhGj1mr/tRSn895BWQEjjVA8DsW+BKYjoWGM7VecF73
 fxF8Hy4kjm93PLY+QwLTeTYR4hHk1jDeUhlgpDmABYo6hD2CmH6BvQlAF9CMUL5XcNZyTWsYNH7
 REMctBfyxnQr0GZpgFR2BdKvDyt7T1ZiRsTeXUN6PKBU7zAnQJyWjYbxzAXDUTc0olopKOhwS/5
 Wnbpzg/yAmLTqY1g2lraqpGMqQ87HqLFg10yzZWI+b07fxap+Pkg7x61w==
X-Received: by 2002:a05:600c:3ba2:b0:4a1:acab:234c with SMTP id
 5b1f17b1804b1-4a1acab23acmr206608275e9.10.1792060176209; 
 Thu, 15 Oct 2026 03:29:36 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd99faf3sm59818785e9.14.2026.10.15.03.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:29:35 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:28:35 +0200
Subject: [PATCH v3 48/50] hw/arm: minerva: add Facebook BMC machine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-minerva-v3-48-7d50c8a108e5@free.fr>
References: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
In-Reply-To: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056477; l=8435;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=uIkPvuS1HhUIQuDA8DlpvtePjZWDWAz2s5Y0WUPJu8I=;
 b=Q0i/Ml3HrciF1rfHda5E0dEE0Vw0CsLp2lciEf7+p5R9+VfUs10Q0+EMSTPbBBC5AN1vpymJ4
 El56FW28qhEDcaY2A7BI8+Z+fdtfZQDFfGaL+Hwk4qf0G/x2w+rrnl4
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.43; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f43.google.com
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

Add a machine for the Facebook Minerva Chassis Management Module (BMC),
an AST2600-based board modelled from its device tree
(aspeed-bmc-facebook-minerva.dts).

The board uses INA230 and INA238 power monitors, TMP75 temperature
sensors, PCA9555 IO expanders, PCA9545 and PCA9548 I2C muxes, AT24C
EEPROMs and a DS1339 RTC.

Every device the Minerva device tree describes and QEMU already models
is instantiated. The remaining ones (LTC4287, XDP710, MAX31790, PCF8563
and IPMB) have no QEMU model and are left documented as comments.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 docs/system/arm/aspeed.rst      |   1 +
 hw/arm/aspeed_ast2600_minerva.c | 180 ++++++++++++++++++++++++++++++++++++++++
 hw/arm/meson.build              |   1 +
 3 files changed, 182 insertions(+)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index f38f33cbe1..bbd3d9cdf4 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -36,6 +36,7 @@ AST2600 SoC based machines :
 - ``catalina-bmc``         Facebook Catalina BMC
 - ``sanmiguel-bmc``        Facebook SanMiguel BMC
 - ``anacapa-bmc``          Facebook Anacapa BMC
+- ``minerva-bmc``          Facebook Minerva BMC
 - ``gb200nvl-bmc``         Nvidia GB200nvl BMC
 
 Supported devices
diff --git a/hw/arm/aspeed_ast2600_minerva.c b/hw/arm/aspeed_ast2600_minerva.c
new file mode 100644
index 0000000000..93abc64770
--- /dev/null
+++ b/hw/arm/aspeed_ast2600_minerva.c
@@ -0,0 +1,180 @@
+/*
+ * Facebook Minerva Chassis Management Module
+ *
+ * Copyright (c) 2026 Meta Platforms, Inc. and affiliates.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/arm/aspeed.h"
+#include "hw/arm/aspeed_soc.h"
+#include "hw/i2c/i2c_mux_pca954x.h"
+#include "hw/gpio/pca9552.h"
+#include "hw/nvram/eeprom_at24c.h"
+#include "hw/rtc/ds1338.h"
+#include "hw/sensor/ina230.h"
+#include "hw/sensor/ina238.h"
+#include "hw/sensor/tmp105.h"
+
+/*
+ * Minerva hardware values.
+ */
+#define MINERVA_BMC_HW_STRAP1 0x00002002
+#define MINERVA_BMC_HW_STRAP2 0x00000800
+#define MINERVA_BMC_RAM_SIZE (2 * GiB)
+
+/*
+ * Fan Controller Board (FCB).  The Minerva BMC device tree describes six
+ * identical FCBs, each hanging off one channel of the PCA9548 on i2c2.
+ */
+static void minerva_fcb_i2c_init(I2CBus *bus)
+{
+    /* eeprom@50 - atmel,24c128 */
+    at24c_eeprom_init(bus, 0x50, 16 * KiB);
+    /* pwm@5e - maxim,max31790 (no model) */
+    /* power-sensor@40/41/44/45 - ti,ina238 */
+    i2c_slave_create_simple(bus, TYPE_INA238, 0x40);
+    i2c_slave_create_simple(bus, TYPE_INA238, 0x41);
+    i2c_slave_create_simple(bus, TYPE_INA238, 0x44);
+    i2c_slave_create_simple(bus, TYPE_INA238, 0x45);
+    /* temperature-sensor@4b - tmp75 */
+    i2c_slave_create_simple(bus, TYPE_TMP75, 0x4b);
+    /* gpio@11/12/13/17 - pca9555 */
+    i2c_slave_create_simple(bus, TYPE_PCA9555, 0x11);
+    i2c_slave_create_simple(bus, TYPE_PCA9555, 0x12);
+    i2c_slave_create_simple(bus, TYPE_PCA9555, 0x13);
+    i2c_slave_create_simple(bus, TYPE_PCA9555, 0x17);
+}
+
+static void minerva_pca9545_eeprom_init(I2CBus *bus, uint8_t addr,
+                                        unsigned neeprom)
+{
+    I2CSlave *i2c_mux = i2c_slave_create_simple(bus, TYPE_PCA9545, addr);
+
+    for (unsigned idx = 0; idx < neeprom; idx++) {
+        at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, idx), 0x50, 8 * KiB);
+    }
+}
+
+static void minerva_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    /* Reference: aspeed-bmc-facebook-minerva.dts */
+
+    AspeedSoCState *soc = bmc->soc;
+    I2CBus *i2c[16] = {};
+    I2CSlave *i2c_mux;
+
+    for (unsigned idx = 0; idx < ARRAY_SIZE(i2c); idx++) {
+        i2c[idx] = aspeed_i2c_get_bus(&soc->i2c, idx);
+    }
+
+    /* &i2c0 */
+    /* power-monitor@40/41 - ti,ina230 */
+    i2c_slave_create_simple(i2c[0], TYPE_INA230, 0x40);
+    i2c_slave_create_simple(i2c[0], TYPE_INA230, 0x41);
+    /* power-monitor@44 - lltc,ltc4287 (no model) */
+    /* power-monitor@43 - infineon,xdp710 (no model) */
+    /* leds_gpio: gpio@19 - pca9555 */
+    i2c_slave_create_simple(i2c[0], TYPE_PCA9555, 0x19);
+    /* gpio@11/12/13 - pca9555 */
+    i2c_slave_create_simple(i2c[0], TYPE_PCA9555, 0x11);
+    i2c_slave_create_simple(i2c[0], TYPE_PCA9555, 0x12);
+    i2c_slave_create_simple(i2c[0], TYPE_PCA9555, 0x13);
+
+    /* &i2c1 */
+    /* temperature-sensor@4b/4f - tmp75 */
+    i2c_slave_create_simple(i2c[1], TYPE_TMP75, 0x4b);
+    i2c_slave_create_simple(i2c[1], TYPE_TMP75, 0x4f);
+    /* eeprom@54 - atmel,24c128 */
+    at24c_eeprom_init(i2c[1], 0x54, 16 * KiB);
+
+    /* &i2c2 */
+    /* i2c-mux@77 (PCA9548) - six Fan Controller Boards */
+    i2c_mux = i2c_slave_create_simple(i2c[2], TYPE_PCA9548, 0x77);
+    /* FCB 1 - imux16 (channel 1) */
+    minerva_fcb_i2c_init(pca954x_i2c_get_bus(i2c_mux, 1));
+    /* FCB 2 - imux17 (channel 0) */
+    minerva_fcb_i2c_init(pca954x_i2c_get_bus(i2c_mux, 0));
+    /* FCB 3 - imux18 (channel 3) */
+    minerva_fcb_i2c_init(pca954x_i2c_get_bus(i2c_mux, 3));
+    /* FCB 4 - imux19 (channel 2) */
+    minerva_fcb_i2c_init(pca954x_i2c_get_bus(i2c_mux, 2));
+    /* FCB 5 - imux20 (channel 4) */
+    minerva_fcb_i2c_init(pca954x_i2c_get_bus(i2c_mux, 4));
+    /* FCB 6 - imux21 (channel 5) */
+    minerva_fcb_i2c_init(pca954x_i2c_get_bus(i2c_mux, 5));
+    /* imux22/imux23 (channels 6/7) - empty */
+
+    /* &i2c3 */
+    /* i2c-mux@72 (PCA9545) - imux24-27, eeprom@50 on each channel */
+    minerva_pca9545_eeprom_init(i2c[3], 0x72, 4);
+
+    /* &i2c4 */
+    /* i2c-mux@72 (PCA9545) - imux28-31, eeprom@50 on each channel */
+    minerva_pca9545_eeprom_init(i2c[4], 0x72, 4);
+
+    /* &i2c5 */
+    /* i2c-mux@72 (PCA9545) - imux32-35, eeprom@50 on each channel */
+    minerva_pca9545_eeprom_init(i2c[5], 0x72, 4);
+
+    /* &i2c6 */
+    /* i2c-mux@72 (PCA9545) - imux36-39, eeprom@50 on each channel */
+    minerva_pca9545_eeprom_init(i2c[6], 0x72, 4);
+
+    /* &i2c7 - empty */
+    /* &i2c8 - empty */
+
+    /* &i2c9 */
+    /* eeprom@50 - atmel,24c64 */
+    at24c_eeprom_init(i2c[9], 0x50, 8 * KiB);
+    /* rtc@51 - nxp,pcf8563 (no model) */
+    /* rtc@68 - dallas,ds1339 */
+    i2c_slave_create_simple(i2c[9], TYPE_DS1339, 0x68);
+
+    /* &i2c12 */
+    /* i2c-mux@70 (PCA9545) - imux40-42 eeprom@50, imux43 empty */
+    minerva_pca9545_eeprom_init(i2c[12], 0x70, 3);
+
+    /* &i2c13 */
+    /* i2c-mux@70 (PCA9545) - imux44-46 eeprom@50, imux47 empty */
+    minerva_pca9545_eeprom_init(i2c[13], 0x70, 3);
+
+    /* &i2c14 */
+    /* ipmb@10 - ipmb-dev (no model) */
+
+    /* &i2c15 */
+    /* eeprom@50 - atmel,24c128 */
+    at24c_eeprom_init(i2c[15], 0x50, 16 * KiB);
+    /* eeprom@56 - atmel,24c64 */
+    at24c_eeprom_init(i2c[15], 0x56, 8 * KiB);
+}
+
+static void aspeed_machine_minerva_class_init(ObjectClass *oc,
+                                              const void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Facebook Minerva BMC (Cortex-A7)";
+    amc->soc_name  = "ast2600-a3";
+    amc->hw_strap1 = MINERVA_BMC_HW_STRAP1;
+    amc->hw_strap2 = MINERVA_BMC_HW_STRAP2;
+    amc->fmc_model = "mx66l1g45g";
+    amc->spi_model = NULL;
+    amc->num_cs    = 2;
+    amc->macs_mask = ASPEED_MAC3_ON;
+    amc->i2c_init  = minerva_bmc_i2c_init;
+    mc->default_ram_size = MINERVA_BMC_RAM_SIZE;
+    aspeed_machine_class_init_cpus_defaults(mc);
+}
+
+static const TypeInfo aspeed_ast2600_minerva_types[] = {
+    {
+        .name          = MACHINE_TYPE_NAME("minerva-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_minerva_class_init,
+    }
+};
+
+DEFINE_TYPES(aspeed_ast2600_minerva_types)
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index bcc068de04..a9e8270b85 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -63,6 +63,7 @@ arm_common_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_ast2600_fby35.c',
   'aspeed_ast2600_fuji.c',
   'aspeed_ast2600_gb200nvl.c',
+  'aspeed_ast2600_minerva.c',
   'aspeed_ast2600_rainier.c',
   'aspeed_ast2600_sanmiguel.c',
   'aspeed_ast10x0.c',

-- 
2.53.0-Meta


