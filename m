Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2648159ejf;
        Tue, 27 Feb 2024 04:52:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWmx7Co0S6viOvDr1544D61G0lraL5UKX0ErhkKDl3NMuB5/HjMVUW/eSwNQ7yHyBh4jEzCtdhlIBO7QMHR6himEIcC5JHR
X-Google-Smtp-Source: AGHT+IEy9PPmFgwGLzcMDbOZFwEbCebmo5U5JBaV6PadMgE/XZJjFDyDzIVqLvZiAom7uWDEG0DC
X-Received: by 2002:a0c:cd12:0:b0:68f:ff45:8793 with SMTP id b18-20020a0ccd12000000b0068fff458793mr2720768qvm.25.1709038371483;
        Tue, 27 Feb 2024 04:52:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709038371; cv=none;
        d=google.com; s=arc-20160816;
        b=C4sBdjkytDXLcyckNRBl07lB2Ic7fyBZS9a+9MCVAO4ilW1kGtm+xuu61/EMeCq5ih
         LDg64g2zbmgVa+jPn86S5eIH8lGFvSfp0CBEN5r5nG05YcS9vP/5Eim4cjnQ+4x4jgGT
         cG+hT/IVuNXyTRkx2d0pt6sHZ4IUyilz9y9YQjMz//VuNSoJZxMnNGiYs8yml81vN30L
         zVkj/hnh8U/50hqTHjWoJWEduNJqjt20DZr1WcYAlX0DSFolU+0WaN7LJZPal2hZNgo5
         XHK8mhsdvm56ocMs2/NnwaITUiK1VDKOEAb2OgBpTg95Uxijc+uiM0zQKVk8NFd4awvu
         HqNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=3KsJ1xRDrUzX54GsxqP5fjCKk+5y4oaJjqjEwtTs4C4=;
        fh=AcWSTBBcQtYb7MKLFQz0jAErn8oNU1WklmI8CXNUViI=;
        b=XXWleZCReuali7SsCH0Ok8DesqVS/i2tK0+UKYKlzt7o6U/p+zWd485TsCqaRx+lv8
         A4tYiYd3iYwPIKRiO0ou77j1Q7wne62xJJWaHFjlJqI3x1QpCglWoartyKZXrsRUxGyp
         QKhFvQ2DI994jFc41J7bX/+en0WWM4S8TinOwdeujhEQrG8MDEcpE++4JhvckEUwTuvV
         rmPn6ynnS0Nc3k+WU3InbSsYj2ySzcQLVVFnyC4Z8V08XKJCOpwhTidOPGCAcJwL81Sm
         7yC5X8uQenmixZGumuDYTSpEJ2ClbbnOqIsCpxcm4JAw7p9MLiYYadyet5ul+eCDELc+
         0tnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id im12-20020a056214246c00b0068f74097af6si7414460qvb.82.2024.02.27.04.52.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 04:52:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rewwe-00005a-GO; Tue, 27 Feb 2024 07:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=hhKj=KE=kaod.org=clg@ozlabs.org>)
 id 1rewwZ-0008VY-BL; Tue, 27 Feb 2024 07:52:23 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=hhKj=KE=kaod.org=clg@ozlabs.org>)
 id 1rewwW-0002iX-4u; Tue, 27 Feb 2024 07:52:23 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Tkcnn4ZVTz4wcN;
 Tue, 27 Feb 2024 23:52:13 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tkcnk3KHYz4wc1;
 Tue, 27 Feb 2024 23:52:10 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 1/2] aspeed: introduce a new UART0 device name
Date: Tue, 27 Feb 2024 13:52:00 +0100
Message-ID: <20240227125201.414060-2-clg@kaod.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240227125201.414060-1-clg@kaod.org>
References: <20240227125201.414060-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=hhKj=KE=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: NJ5A/1BP+Lfw

From: Jamin Lin <jamin_lin@aspeedtech.com>

The Aspeed datasheet refers to the UART controllers
as UART1 - UART13 for the ast10x0, ast2600, ast2500
and ast2400 SoCs and the Aspeed ast2700 introduces an UART0
and the UART controllers as UART0 - UART12.

To keep the naming in the QEMU models
in sync with the datasheet, let's introduce a new  UART0 device name
and do the required adjustements.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
[ clg: - Kept original assert() in aspeed_soc_uart_set_chr()
       - Fixed 'i' range in connect_serial_hds_to_uarts() loop ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h | 17 +++++++++++++++++
 hw/arm/aspeed.c             | 13 ++++++++-----
 hw/arm/aspeed_ast10x0.c     |  1 +
 hw/arm/aspeed_ast2400.c     |  2 ++
 hw/arm/aspeed_ast2600.c     |  1 +
 hw/arm/aspeed_soc_common.c  |  6 ++++--
 6 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 9d0af84a8cff..e1a023be538b 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -140,6 +140,7 @@ struct AspeedSoCClass {
     int wdts_num;
     int macs_num;
     int uarts_num;
+    int uarts_base;
     const int *irqmap;
     const hwaddr *memmap;
     uint32_t num_cpus;
@@ -151,6 +152,7 @@ const char *aspeed_soc_cpu_type(AspeedSoCClass *sc);
 enum {
     ASPEED_DEV_SPI_BOOT,
     ASPEED_DEV_IOMEM,
+    ASPEED_DEV_UART0,
     ASPEED_DEV_UART1,
     ASPEED_DEV_UART2,
     ASPEED_DEV_UART3,
@@ -235,4 +237,19 @@ void aspeed_mmio_map_unimplemented(AspeedSoCState *s, SysBusDevice *dev,
 void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
                                unsigned int count, int unit0);
 
+static inline int aspeed_uart_index(int uart_dev)
+{
+    return uart_dev - ASPEED_DEV_UART0;
+}
+
+static inline int aspeed_uart_first(AspeedSoCClass *sc)
+{
+    return aspeed_uart_index(sc->uarts_base);
+}
+
+static inline int aspeed_uart_last(AspeedSoCClass *sc)
+{
+    return aspeed_uart_first(sc) + sc->uarts_num - 1;
+}
+
 #endif /* ASPEED_SOC_H */
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 09b1e823ba1c..0af96afa16a6 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -342,7 +342,7 @@ static void connect_serial_hds_to_uarts(AspeedMachineState *bmc)
     int uart_chosen = bmc->uart_chosen ? bmc->uart_chosen : amc->uart_default;
 
     aspeed_soc_uart_set_chr(s, uart_chosen, serial_hd(0));
-    for (int i = 1, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
+    for (int i = 1, uart = sc->uarts_base; i < sc->uarts_num; i++, uart++) {
         if (uart == uart_chosen) {
             continue;
         }
@@ -1094,7 +1094,7 @@ static char *aspeed_get_bmc_console(Object *obj, Error **errp)
     AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(bmc);
     int uart_chosen = bmc->uart_chosen ? bmc->uart_chosen : amc->uart_default;
 
-    return g_strdup_printf("uart%d", uart_chosen - ASPEED_DEV_UART1 + 1);
+    return g_strdup_printf("uart%d", aspeed_uart_index(uart_chosen));
 }
 
 static void aspeed_set_bmc_console(Object *obj, const char *value, Error **errp)
@@ -1103,6 +1103,8 @@ static void aspeed_set_bmc_console(Object *obj, const char *value, Error **errp)
     AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(bmc);
     AspeedSoCClass *sc = ASPEED_SOC_CLASS(object_class_by_name(amc->soc_name));
     int val;
+    int uart_first = aspeed_uart_first(sc);
+    int uart_last = aspeed_uart_last(sc);
 
     if (sscanf(value, "uart%u", &val) != 1) {
         error_setg(errp, "Bad value for \"uart\" property");
@@ -1110,11 +1112,12 @@ static void aspeed_set_bmc_console(Object *obj, const char *value, Error **errp)
     }
 
     /* The number of UART depends on the SoC */
-    if (val < 1 || val > sc->uarts_num) {
-        error_setg(errp, "\"uart\" should be in range [1 - %d]", sc->uarts_num);
+    if (val < uart_first || val > uart_last) {
+        error_setg(errp, "\"uart\" should be in range [%d - %d]",
+                   uart_first, uart_last);
         return;
     }
-    bmc->uart_chosen = ASPEED_DEV_UART1 + val - 1;
+    bmc->uart_chosen = val + ASPEED_DEV_UART0;
 }
 
 static void aspeed_machine_class_props_init(ObjectClass *oc)
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index c3b5116a6a9d..2634e0f6544e 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -436,6 +436,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
     sc->wdts_num = 4;
     sc->macs_num = 1;
     sc->uarts_num = 13;
+    sc->uarts_base = ASPEED_DEV_UART1;
     sc->irqmap = aspeed_soc_ast1030_irqmap;
     sc->memmap = aspeed_soc_ast1030_memmap;
     sc->num_cpus = 1;
diff --git a/hw/arm/aspeed_ast2400.c b/hw/arm/aspeed_ast2400.c
index 8829561bb6c2..95da85fee029 100644
--- a/hw/arm/aspeed_ast2400.c
+++ b/hw/arm/aspeed_ast2400.c
@@ -523,6 +523,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
     sc->wdts_num     = 2;
     sc->macs_num     = 2;
     sc->uarts_num    = 5;
+    sc->uarts_base   = ASPEED_DEV_UART1;
     sc->irqmap       = aspeed_soc_ast2400_irqmap;
     sc->memmap       = aspeed_soc_ast2400_memmap;
     sc->num_cpus     = 1;
@@ -551,6 +552,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
     sc->wdts_num     = 3;
     sc->macs_num     = 2;
     sc->uarts_num    = 5;
+    sc->uarts_base   = ASPEED_DEV_UART1;
     sc->irqmap       = aspeed_soc_ast2500_irqmap;
     sc->memmap       = aspeed_soc_ast2500_memmap;
     sc->num_cpus     = 1;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 4ee32ea99dbc..f74561ecdcd5 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -666,6 +666,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
     sc->wdts_num     = 4;
     sc->macs_num     = 4;
     sc->uarts_num    = 13;
+    sc->uarts_base   = ASPEED_DEV_UART1;
     sc->irqmap       = aspeed_soc_ast2600_irqmap;
     sc->memmap       = aspeed_soc_ast2600_memmap;
     sc->num_cpus     = 2;
diff --git a/hw/arm/aspeed_soc_common.c b/hw/arm/aspeed_soc_common.c
index 123a0c432cfd..1e8f2558fdc2 100644
--- a/hw/arm/aspeed_soc_common.c
+++ b/hw/arm/aspeed_soc_common.c
@@ -36,7 +36,7 @@ bool aspeed_soc_uart_realize(AspeedSoCState *s, Error **errp)
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     SerialMM *smm;
 
-    for (int i = 0, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
+    for (int i = 0, uart = sc->uarts_base; i < sc->uarts_num; i++, uart++) {
         smm = &s->uart[i];
 
         /* Chardev property is set by the machine. */
@@ -58,7 +58,9 @@ bool aspeed_soc_uart_realize(AspeedSoCState *s, Error **errp)
 void aspeed_soc_uart_set_chr(AspeedSoCState *s, int dev, Chardev *chr)
 {
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
-    int i = dev - ASPEED_DEV_UART1;
+    int uart_first = aspeed_uart_first(sc);
+    int uart_index = aspeed_uart_index(dev);
+    int i = uart_index - uart_first;
 
     g_assert(0 <= i && i < ARRAY_SIZE(s->uart) && i < sc->uarts_num);
     qdev_prop_set_chr(DEVICE(&s->uart[i]), "chardev", chr);
-- 
2.43.2

