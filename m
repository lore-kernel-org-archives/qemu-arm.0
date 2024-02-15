Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp399637ejb;
        Wed, 14 Feb 2024 23:21:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWeY/ljkKH6+Sle3gdaZkYrH1wiQHieoY2yJq0wtG1GOMv1A+Kbtl+dIiFUM7mUGjE+m5BDspTILZ/NYINsKx4DT1Jbfoke
X-Google-Smtp-Source: AGHT+IFsKjfeP7lNwWWu8lfapYhQ6mYr9bLi5Zf3UG0QjImommFJiAJPuvzARspIQD729d60kxSk
X-Received: by 2002:a05:6808:144e:b0:3c0:3203:e9f4 with SMTP id x14-20020a056808144e00b003c03203e9f4mr1340374oiv.48.1707981687805;
        Wed, 14 Feb 2024 23:21:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707981687; cv=none;
        d=google.com; s=arc-20160816;
        b=IQabhnR4gITpgONhgbRAAOzhYXhs2um0YL405EMvXK/RnK+jZ6EQNZXwUspMoB6t0v
         QZy+lfe5x3vSwbJi0nM9h0P2Y27ilyGVfAjktU/sn1N4vx9lWyQucUXLWKv6I1DwohY1
         XFNnt/AEi5Q/aUa5Ec8wV9/pjU8mtkQiU2iezonAenYZKr9tW8s79tQmH98M8m/dwo3T
         I2moJwwmzQeog+BcDPmJm3vm0GyztagDWkcTOIkFQ9UOu/rP2BgfyERqK6k13RKVOIba
         Fdl32zsz3qvsrwFKzGgG4i9oiF7SSNTlsFClF77lAKGFwDHnRxmvNf6/8/LBPpEwb18B
         5exg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=stcMB+Z0XgD+VIzCSPz73FnFD18WHyC1pSB/jjGUiys=;
        fh=jkt7ehUcUSTQBo264eWmsavDvXA1+0nMupSr24pggQ4=;
        b=zTU0+lH4vb6oA9H3oGTqYZ5BARP13NUVdwmOmlSeQRdU6Vmw5lg7TPtGeNk4CFR81V
         khCgwC6TW4vkFafjxZbmm0UPCiuG5PZa/uHpvcyTtjdpRNfBBr5GH1DobnaqfvOgCGhS
         fdXJTDPG7eag80mVgf+JaPlaGI6a9laP9KIhnmiQXPdu+Hx8Ii/M1D7aMc6cGl4XUpmO
         6CaBc/q6S51v66wv3gNCoF04NUzEUU01U7E6ZLZyvwWhK2lpJPIvOlFD7Ex5oJVtB7Qr
         FC1b2SOFv5MTdd4QakWruEXyPGF/cbRsBiX2zagJZ+X9FAZPYcKKqPUu1iKBP09TrTUW
         d9dA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8-20020ad45ca8000000b0068cc2e6a448si878002qvh.99.2024.02.14.23.21.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Feb 2024 23:21:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raW2y-0001bk-1g; Thu, 15 Feb 2024 02:20:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1raW2v-0001bQ-2T; Thu, 15 Feb 2024 02:20:37 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX02.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1raW2s-0006RV-MP; Thu, 15 Feb 2024 02:20:36 -0500
Received: from TWMBX02.aspeed.com (192.168.0.25) by TWMBX02.aspeed.com
 (192.168.0.25) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 15 Feb
 2024 15:20:27 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Feb 2024 15:20:27 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v3 1/2] aspeed: introduce a new UART0 device name
Date: Thu, 15 Feb 2024 15:20:25 +0800
Message-ID: <20240215072026.2331941-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240215072026.2331941-1-jamin_lin@aspeedtech.com>
References: <20240215072026.2331941-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=twmbx02.aspeed.com;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX02.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: a5AIGCopro4e

The Aspeed datasheet refers to the UART controllers
as UART1 - UART13 for the ast10x0, ast2600, ast2500
and ast2400 SoCs and the Aspeed ast2700 introduces an UART0
and the UART controllers as UART0 - UART12.

To keep the naming in the QEMU models
in sync with the datasheet, let's introduce a new  UART0 device name
and do the required adjustements.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed.c             | 13 ++++++++-----
 hw/arm/aspeed_ast10x0.c     |  1 +
 hw/arm/aspeed_ast2400.c     |  2 ++
 hw/arm/aspeed_ast2600.c     |  1 +
 hw/arm/aspeed_soc_common.c  | 10 ++++++----
 include/hw/arm/aspeed_soc.h | 17 +++++++++++++++++
 6 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 09b1e823ba..aa165d583b 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -342,7 +342,7 @@ static void connect_serial_hds_to_uarts(AspeedMachineState *bmc)
     int uart_chosen = bmc->uart_chosen ? bmc->uart_chosen : amc->uart_default;
 
     aspeed_soc_uart_set_chr(s, uart_chosen, serial_hd(0));
-    for (int i = 1, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
+    for (int i = 0, uart = sc->uarts_base; i < sc->uarts_num; i++, uart++) {
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
index c3b5116a6a..2634e0f654 100644
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
index 8829561bb6..95da85fee0 100644
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
index 4ee32ea99d..f74561ecdc 100644
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
index 123a0c432c..95d0c0aba9 100644
--- a/hw/arm/aspeed_soc_common.c
+++ b/hw/arm/aspeed_soc_common.c
@@ -36,7 +36,7 @@ bool aspeed_soc_uart_realize(AspeedSoCState *s, Error **errp)
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     SerialMM *smm;
 
-    for (int i = 0, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
+    for (int i = 0, uart = sc->uarts_base; i < sc->uarts_num; i++, uart++) {
         smm = &s->uart[i];
 
         /* Chardev property is set by the machine. */
@@ -58,10 +58,12 @@ bool aspeed_soc_uart_realize(AspeedSoCState *s, Error **errp)
 void aspeed_soc_uart_set_chr(AspeedSoCState *s, int dev, Chardev *chr)
 {
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
-    int i = dev - ASPEED_DEV_UART1;
+    int uart_index = aspeed_uart_index(dev);
+    int uart_first = aspeed_uart_first(sc);
+    int index = uart_index - uart_first;
 
-    g_assert(0 <= i && i < ARRAY_SIZE(s->uart) && i < sc->uarts_num);
-    qdev_prop_set_chr(DEVICE(&s->uart[i]), "chardev", chr);
+    g_assert(index < ARRAY_SIZE(s->uart));
+    qdev_prop_set_chr(DEVICE(&s->uart[index]), "chardev", chr);
 }
 
 /*
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 9d0af84a8c..e1a023be53 100644
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
-- 
2.25.1

