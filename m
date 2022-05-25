Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1029806lfh;
        Wed, 25 May 2022 09:17:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiu4VDK2q9bIDFtWe2DgRy3w4bp8OhjtE/pZJBRHsQFz+beCo0x0Yj3kJSK8ZTQkaJ4Z0x
X-Received: by 2002:a05:6214:194e:b0:45a:d8e3:2d3f with SMTP id q14-20020a056214194e00b0045ad8e32d3fmr26528710qvk.59.1653495428917;
        Wed, 25 May 2022 09:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653495428; cv=none;
        d=google.com; s=arc-20160816;
        b=hZWUZDXPe7RmYdfDpc3uRSowVA/Sf6nl6RBRvnX2V4WbndzB7tAwGmM5SZ25M4jf3V
         Pr8TMK/aUWmHVJg8wgT3MEQ/QknIefuBPxCb5y7wLtj6BbBFXd0ico/1GjMKr6dJ1719
         HsezysNxZegkNmnagdBUowDlfvsfjXZcW5ONgJavOcIXwbyuyrkJAiifbyl6uRuDJniM
         ZkiXQ93DUBZvgwcKxHvVVSshoEnSCTuF7MUVM6nK4xK+lVy+mS7hslelXxH16G9t00DT
         CEzMC2+6BDXaRYM2UyDWT7BEp9G1eOeX8cOznQh3IXYZaxI7j6wwtndJqWyk3ZV1GIao
         azeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=4jAZsZuCBM48CZ7V92M4Kh49aW8+gcJR3fMeevAKGKE=;
        b=MtC3lNLEZPnI/p8Ja5VOWVTxWcJLH98rHloK3IItvPtUEYhcbx/A6h8lkxY+Y9zKgl
         dT1Bn74kGZ9qbls9eKs7uv7bGNjhVt/FypMSyVMsF9bzuHJPs3OOB8o+rPRlzS9Eug6R
         FCI92006pWGp95MCDUYs623sN5nno0Q6cfen5welmyXITgKYmeILa/f19jXS61bmaj8c
         ZbMIMM5wgXHAhXA1hh3n3iwtG68MOJy+fI+m5r6tjAxBsDHzRnfHzL3aNHSGI2WpuYX+
         XdjwMxw0sfmsRZ7W+cODxvsBXNshFYuuVN5/2v4uCJcbJIdEcNypsUrfRVr9O1RCzkVN
         ev4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q22-20020a05622a031600b002f3a69289cesi1569377qtw.764.2022.05.25.09.17.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 May 2022 09:17:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntth6-0001Lg-De
	for alex.bennee@linaro.org; Wed, 25 May 2022 12:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSR-000743-Oz; Wed, 25 May 2022 12:02:05 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:47725
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSM-00048f-IF; Wed, 25 May 2022 12:01:56 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4L7bRH5gtWz4xbt;
 Thu, 26 May 2022 02:01:47 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L7bRF6Hsmz4xXj;
 Thu, 26 May 2022 02:01:45 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 02/15] hw/arm/aspeed: Add fby35 machine type
Date: Wed, 25 May 2022 18:01:23 +0200
Message-Id: <20220525160136.556277-3-clg@kaod.org>
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
X-TUID: skM7epQJH23B

From: Peter Delevoryas <pdel@fb.com>

Add the 'fby35-bmc' machine type based on the kernel DTS[1] and userspace
i2c setup scripts[2]. Undefined values are inherited from the AST2600-EVB.

Reference images can be found in Facebook OpenBMC Github Release assets
as "fby35.mtd". [3]

You can boot the reference images as follows (fby35 uses dual-flash):

qemu-system-arm -machine fby35-bmc \
    -drive file=fby35.mtd,format=raw,if=mtd \
    -drive file=fby35.mtd,format=raw,if=mtd \
    -nographic

[1] https://github.com/facebook/openbmc-linux/blob/412d5053258007117e94b1e36015aefc1301474b/arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts
[2] https://github.com/facebook/openbmc/blob/e2294ff5d31dd65c248fe396a385286d6d5c463d/meta-facebook/meta-fby35/recipes-fby35/plat-utils/files/setup-dev.sh
[3] https://github.com/facebook/openbmc/releases

Signed-off-by: Peter Delevoryas <pdel@fb.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220503225925.1798324-2-pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 63 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a74c13ab0fbc..725c169488dc 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -21,6 +21,7 @@
 #include "hw/misc/led.h"
 #include "hw/qdev-properties.h"
 #include "sysemu/block-backend.h"
+#include "sysemu/reset.h"
 #include "hw/loader.h"
 #include "qemu/error-report.h"
 #include "qemu/units.h"
@@ -951,6 +952,35 @@ static void bletchley_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(i2c[12], TYPE_PCA9552, 0x67);
 }
 
+static void fby35_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+    I2CBus *i2c[16];
+
+    for (int i = 0; i < 16; i++) {
+        i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
+    }
+
+    i2c_slave_create_simple(i2c[2], TYPE_LM75, 0x4f);
+    i2c_slave_create_simple(i2c[8], TYPE_TMP421, 0x1f);
+    /* Hotswap controller is actually supposed to be mp5920 or ltc4282. */
+    i2c_slave_create_simple(i2c[11], "adm1272", 0x44);
+    i2c_slave_create_simple(i2c[12], TYPE_LM75, 0x4e);
+    i2c_slave_create_simple(i2c[12], TYPE_LM75, 0x4f);
+
+    aspeed_eeprom_init(i2c[4], 0x51, 128 * KiB);
+    aspeed_eeprom_init(i2c[6], 0x51, 128 * KiB);
+    aspeed_eeprom_init(i2c[8], 0x50, 32 * KiB);
+    aspeed_eeprom_init(i2c[11], 0x51, 128 * KiB);
+    aspeed_eeprom_init(i2c[11], 0x54, 128 * KiB);
+
+    /*
+     * TODO: There is a multi-master i2c connection to an AST1030 MiniBMC on
+     * buses 0, 1, 2, 3, and 9. Source address 0x10, target address 0x20 on
+     * each.
+     */
+}
+
 static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
 {
     return ASPEED_MACHINE(obj)->mmio_exec;
@@ -1293,6 +1323,35 @@ static void aspeed_machine_bletchley_class_init(ObjectClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 }
 
+static void fby35_reset(MachineState *state)
+{
+    AspeedMachineState *bmc = ASPEED_MACHINE(state);
+    AspeedGPIOState *gpio = &bmc->soc.gpio;
+
+    qemu_devices_reset();
+
+    /* Board ID */
+    object_property_set_bool(OBJECT(gpio), "gpioV4", true, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioV5", true, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioV6", true, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioV7", false, &error_fatal);
+}
+
+static void aspeed_machine_fby35_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Facebook fby35 BMC (Cortex-A7)";
+    mc->reset      = fby35_reset;
+    amc->fmc_model = "mx66l1g45g";
+    amc->num_cs    = 2;
+    amc->macs_mask = ASPEED_MAC3_ON;
+    amc->i2c_init  = fby35_i2c_init;
+    /* FIXME: Replace this macro with something more general */
+    mc->default_ram_size = FUJI_BMC_RAM_SIZE;
+}
+
 #define AST1030_INTERNAL_FLASH_SIZE (1024 * 1024)
 /* Main SYSCLK frequency in Hz (200MHz) */
 #define SYSCLK_FRQ 200000000ULL
@@ -1411,6 +1470,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("bletchley-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_bletchley_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("fby35-bmc"),
+        .parent        = MACHINE_TYPE_NAME("ast2600-evb"),
+        .class_init    = aspeed_machine_fby35_class_init,
     }, {
         .name           = MACHINE_TYPE_NAME("ast1030-evb"),
         .parent         = TYPE_ASPEED_MACHINE,
-- 
2.35.3

