Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5180774ejb;
        Tue, 7 Feb 2023 02:08:21 -0800 (PST)
X-Google-Smtp-Source: AK7set/d9Haf+8KCt6idyUrFqdQyAg6zyRp7SOcd7gQCC+zOy5HbH9htpN8kqB/vWe4B8lfvA1/j
X-Received: by 2002:a05:622a:1209:b0:3b8:6bf8:9584 with SMTP id y9-20020a05622a120900b003b86bf89584mr4324317qtx.35.1675764501492;
        Tue, 07 Feb 2023 02:08:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675764501; cv=none;
        d=google.com; s=arc-20160816;
        b=QLz3LpHodxWRFBgrBB/SIslbh8sUHQ3nO7f9j2ATnj6vaEgZMmp7JJmkSI8FhfYJqa
         5oHEpXlOGwLkNvtbjyKxUW5y91EA8T1tEiZCzN5PgP0MjqkuD75OElU5uJJRk3um7dIZ
         /winLrNE3HrIk/NnhEpXnuVfcjU9PtyFEu3vukv03Po2VUt4cNZE/0EaGXaAeQ1Cn17+
         uR3s7slrE8e0YU1KnmVQ6+i7DdN4ky4+rOFcly7Gk/LE5O3dzL39M4Vsg2epfr154lZN
         ZWlVENnlnQRM+0G6QPIn5gcQLH+uflqIEwYSVpBRM/IyWa6HOxSaINlybiD4LowkSUzd
         p6JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=5XinY7WdpaCsPjwXfVZJS4IyV2/Cu2A092Cffm9aVM0=;
        b=iYISvQSdxIidIFVaH+njDkrG59DW6fmYKlRwz3WDQlpcfWPepiLMzH6ewMk7FpDjsf
         pVnklRzxLNCw5ZFvcsQR9ZrjOWqx3oj/etGJm5SICTrrAflrBkzzejf3Fdm8NIalv7ih
         sWZ27rAm9ukPamc3SvwBLWlOO9MaHyVQRS5qBalm8a0+DC+6kGYs1tezA7D9zwcMT8Il
         bKJwNPzeFNgGvqC2rvQNHWoZN1JStuG/e1IPivZuBLDl7PZRSTmsZax4WXla5LlRMA6C
         icYEgm3GKkreDADBfiXNijKTDe/eo+cvsQA1u/gjtQ0Si6yrgJ0L6ge/I0MYO9IiCXKW
         7q5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r22-20020ac85c96000000b003a811f3b81asi10837150qta.169.2023.02.07.02.08.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 02:08:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPKta-0000Qc-PN; Tue, 07 Feb 2023 05:08:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKtV-0000PK-1C; Tue, 07 Feb 2023 05:08:09 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKtQ-0002MZ-P8; Tue, 07 Feb 2023 05:08:07 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4P9zMz53hTz4xyd;
 Tue,  7 Feb 2023 21:07:59 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P9zMx2V2Lz4wgv;
 Tue,  7 Feb 2023 21:07:57 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 03/25] aspeed: Add Supermicro X11 SPI machine type
Date: Tue,  7 Feb 2023 11:07:22 +0100
Message-Id: <20230207100744.698694-4-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207100744.698694-1-clg@kaod.org>
References: <20230207100744.698694-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=a43c=6D=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iOZVjPdZqwbk

From: Guenter Roeck <linux@roeck-us.net>

supermicrox11-bmc is configured with ast2400-a1 SoC. This does not match
the Supermicro documentation for X11 BMCs, and it does not match the
devicetree file in the Linux kernel.

As it turns out, some Supermicro X11 motherboards use AST2400 SoCs,
while others use AST2500.

Introduce new machine type supermicrox11-spi-bmc with AST2500 SoC
to match the devicetree description in the Linux kernel. Hardware
configuration details for this machine type are guesswork and taken
from defaults as well as from the Linux kernel devicetree file.

The new machine type was tested with aspeed-bmc-supermicro-x11spi.dts
from the Linux kernel and with Linux versions 6.0.3 and 6.1-rc2.
Linux booted successfully from initrd and from both SPI interfaces.
Ethernet interfaces were confirmed to be operational.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Link: https://lore.kernel.org/r/20221025165109.1226001-1-linux@roeck-us.net
[ clg: Renamed machine to 'supermicro-x11spi-bmc' ]
Message-Id: <20221025165109.1226001-1-linux@roeck-us.net>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 55f114ef72..0c8c3be413 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -71,6 +71,16 @@ struct AspeedMachineState {
         SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       \
         SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
 
+/* TODO: Find the actual hardware value */
+#define SUPERMICRO_X11SPI_BMC_HW_STRAP1 (                               \
+        AST2500_HW_STRAP1_DEFAULTS |                                    \
+        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     \
+        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        \
+        SCU_AST2500_HW_STRAP_UART_DEBUG |                               \
+        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                              \
+        SCU_HW_STRAP_SPI_WIDTH |                                        \
+        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_M_S_EN))
+
 /* AST2500 evb hardware value: 0xF100C2E6 */
 #define AST2500_EVB_HW_STRAP1 ((                                        \
         AST2500_HW_STRAP1_DEFAULTS |                                    \
@@ -1141,6 +1151,25 @@ static void aspeed_machine_supermicrox11_bmc_class_init(ObjectClass *oc,
     mc->default_ram_size = 256 * MiB;
 }
 
+static void aspeed_machine_supermicro_x11spi_bmc_class_init(ObjectClass *oc,
+                                                            void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Supermicro X11 SPI BMC (ARM1176)";
+    amc->soc_name  = "ast2500-a1";
+    amc->hw_strap1 = SUPERMICRO_X11SPI_BMC_HW_STRAP1;
+    amc->fmc_model = "mx25l25635e";
+    amc->spi_model = "mx25l25635e";
+    amc->num_cs    = 1;
+    amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON;
+    amc->i2c_init  = palmetto_bmc_i2c_init;
+    mc->default_ram_size = 512 * MiB;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
+}
+
 static void aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1522,6 +1551,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("supermicrox11-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_supermicrox11_bmc_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("supermicro-x11spi-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_supermicro_x11spi_bmc_class_init,
     }, {
         .name          = MACHINE_TYPE_NAME("ast2500-evb"),
         .parent        = TYPE_ASPEED_MACHINE,
-- 
2.39.1

