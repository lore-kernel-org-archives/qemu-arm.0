Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp298021ejc;
        Thu, 19 Jan 2023 04:38:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvysCDALKd2wZfPvIIxfOBd8pgfsaBXQsBXE9fKd0QrX6tXY86J7thUYJ/PYy1xdtmAMLcd
X-Received: by 2002:a05:6102:20c8:b0:3d3:d8eb:6c1d with SMTP id i8-20020a05610220c800b003d3d8eb6c1dmr5907600vsr.31.1674131938078;
        Thu, 19 Jan 2023 04:38:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674131938; cv=none;
        d=google.com; s=arc-20160816;
        b=GCZW39zH2qVEm8F9KQqi+QSoRbIu1KQqHPcrNOIXmyJnXk4j+tRzQNnV6/wLkhRwqZ
         jtzC+UfM6p24TXvL582OJ7dBhJdyJ/nvZh5Ng11C3pKccj2oQfoRXsr3yn23xR+R7370
         OcjP4PdN390jepY6bqfhq1DlHfx/2NDBBP5lzkzXFlaJD3gggpqFY7cGs41k41fDJmbb
         z+5LJsNZjpNCbs6nBiZdaXYrAYipMfr592SzC1jBIhs7ZLaKQDNI7fpz9W8U0/v8E9J2
         AlS2N53805ddCxjfks91c3EbQArmohtOYUIdRqIX/DGIw+TOvCxtcv17s2EPWSlquTo2
         CuDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=1a8C3gqDcwU2fGsIf6QFxRqheUNOa/bYDHCS50rAVUs=;
        b=XCo5F/1zNZYOgSxF4zHUXucXiIYcOJMmhVikGpK4Zp9MyBmM5jTAEuuvyzYykrb3CQ
         zduKrVZtx+2phvwyVMLLZCJ34ZBI4Rl4HogpkF6rs+7jUms4FK5N+kIfBaWlKXDoDmyL
         nzIr2gjBJTMTFrzKCkG6jIH3P6mHokFEMOJhHPZR2jfT4xZ/xyV55jxyPVbwS/7u27Qk
         Kq3+bAznkU9bK7zBzPX1YjynWppK9Baf18f+SczboEt6XVRs1UYQndfiB03p+JsG9xdM
         0Cla7QSrizunuYAnkBl6b2vsqfyV4Nk4O7S2dlPpKA72w8gH3dct6NHkmeVScpfmFOLw
         ZH2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20-20020a05620a44d400b0070671368861si7327269qkp.621.2023.01.19.04.38.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 04:38:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIU8c-0006LX-PP; Thu, 19 Jan 2023 07:35:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8V-0006IL-L6; Thu, 19 Jan 2023 07:35:20 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8R-0007VF-W1; Thu, 19 Jan 2023 07:35:19 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NyMXZ12xMz4xN5;
 Thu, 19 Jan 2023 23:35:10 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NyMXW5Kncz4x1D;
 Thu, 19 Jan 2023 23:35:07 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 02/25] aspeed: Add Supermicro X11 SPI machine type
Date: Thu, 19 Jan 2023 13:34:26 +0100
Message-Id: <20230119123449.531826-3-clg@kaod.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119123449.531826-1-clg@kaod.org>
References: <20230119123449.531826-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TkKVn+Yxdk9p

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
Message-Id: <20221025165109.1226001-1-linux@roeck-us.net>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 55f114ef72..4919a1fe9e 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -71,6 +71,16 @@ struct AspeedMachineState {
         SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       \
         SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
 
+/* TODO: Find the actual hardware value */
+#define SUPERMICROX11_SPI_BMC_HW_STRAP1 (                               \
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
 
+static void aspeed_machine_supermicrox11_spi_bmc_class_init(ObjectClass *oc,
+                                                            void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Supermicro X11 SPI BMC (ARM1176)";
+    amc->soc_name  = "ast2500-a1";
+    amc->hw_strap1 = SUPERMICROX11_SPI_BMC_HW_STRAP1;
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
+        .name          = MACHINE_TYPE_NAME("supermicrox11-spi-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_supermicrox11_spi_bmc_class_init,
     }, {
         .name          = MACHINE_TYPE_NAME("ast2500-evb"),
         .parent        = TYPE_ASPEED_MACHINE,
-- 
2.39.0

