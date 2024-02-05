Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1011943ejb;
        Mon, 5 Feb 2024 01:20:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUb08SeTef+miTlusyZWw94TqfkTlNO4fyFUFQUAxYfWInbhS4V1RWqnYfapNX5Tzn/rc5sS698EKBcN7HryDTH2iOl6n+e
X-Google-Smtp-Source: AGHT+IHPmsAhu33cndGjHb/XAWmgp/pqgm8B//MDEI1DrCbTde2EKcQ6dEDlZNjrueq/08uFzVpI
X-Received: by 2002:a05:6214:cc5:b0:68c:4e10:a713 with SMTP id 5-20020a0562140cc500b0068c4e10a713mr10924271qvx.17.1707124852327;
        Mon, 05 Feb 2024 01:20:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707124852; cv=none;
        d=google.com; s=arc-20160816;
        b=gv0buWsYk+VSyjA5jJouuTRAn/dkXr4m4VxDrQMFaPvHH+id4hUCGWU0dyVpqwteTk
         o4At6IBHcPvsto7kWnPDsJEgwa3QizS9GTt/3TmIJK+ns3VkwCU8ppTqBuegs9J25MrD
         hxLSZatM8iIiymUP2OmRVuBd7le7dztCgFvAKPIzOW8ZNqoUkasTgmIgwKxRghZctslS
         awsJbtwFliA2Ua72ytboN6QkBMy1/PrxnTRUmIu+kekN+gV+WP+vxI8VbZbX/+pBryAv
         ehAC+hNm4XGFD/Uuc31JLYIovDZeKpsTkaU5cYEfy0vkK66By0xX6vuXRBZOi9lS4GIm
         rsMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Lhw2L1jqYjREvph9hPEoRJ/Obaw2GgkJkLNghjn7q0I=;
        fh=F7OS5na3bxMgDU2paiSJ9U5rc7SGWzHpUoTndsAChXY=;
        b=RR/3/Lq0+BQdcZwVe7YFNBrc9PGgRAP5fBb8piGLpF7KFU2Vhm7c7X6FL6rMdkw98G
         NJTblZMMZnSAnkn696sEetEL15voZvFJ88uhE7GFd1sSJQcSjD1wbWq5BEujAOZeEeK/
         OK+dkomkUssgMpZ/iZG3AecrEztgoANRxylWsQBCZDdgZG3N+kx1N3+VMEtZUZoEFXkU
         PBnLK0efAENB8ITumhdGU1QS2IX37BnrMN0yLN+PCvFJKmJ3sYolcXe4hfz5GsnSpMxp
         fvTKnSlFt2yiLsddxc/qtHTP6wUxBuPxr0oslpILQOnHU0rGUa1e8VlBH6796ComcYg+
         YTjA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
X-Forwarded-Encrypted: i=0; AJvYcCUk/S0hS6l3K3Gj9kFSA8mzQN56pL+TJACEGYA7KPgiumYvobNaDRr/6nueUN28dxBXsO5baQNbAE6jNuuaDlsDY3tE1sTl
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020a0cc308000000b0068c4790c9afsi7957849qvi.268.2024.02.05.01.20.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Feb 2024 01:20:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rWv9W-0004II-Jy; Mon, 05 Feb 2024 04:20:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rWv9U-0004Hu-OP; Mon, 05 Feb 2024 04:20:32 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX02.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rWv9T-0008Gf-3y; Mon, 05 Feb 2024 04:20:32 -0500
Received: from TWMBX02.aspeed.com (192.168.0.25) by TWMBX02.aspeed.com
 (192.168.0.25) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 5 Feb
 2024 17:14:17 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 5 Feb 2024 17:14:17 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v0 1/2] aspeed: support uart controller both 0 and 1 base
Date: Mon, 5 Feb 2024 17:14:13 +0800
Message-ID: <20240205091415.935686-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240205091415.935686-1-jamin_lin@aspeedtech.com>
References: <20240205091415.935686-1-jamin_lin@aspeedtech.com>
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
X-TUID: nzgjAc7w0TBc

According to the design of ASPEED SOCS, the uart controller
is 1 base for ast10x0, ast2600, ast2500 and ast2400.

However, the uart controller is 0 base for ast2700.
To support uart controller both 0 and 1 base,
adds uasrt_bases parameter in AspeedSoCClass
and set the default uart controller 1 base
for ast10x0, astt2600, ast2500 and ast2400.

From datasheet description
ast2700:
Base Address of UART0 = 0x14c33000
ast1030:
Base Address of UART1 = 0x7e783000
ast2600:
Base Address of UART1 = 0x1E78 3000
ast2500:
Base Address of UART1 = 0x1E78 3000

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed.c             | 8 +++++---
 hw/arm/aspeed_ast10x0.c     | 1 +
 hw/arm/aspeed_ast2400.c     | 2 ++
 hw/arm/aspeed_ast2600.c     | 1 +
 hw/arm/aspeed_soc_common.c  | 4 ++--
 include/hw/arm/aspeed_soc.h | 1 +
 6 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 09b1e823ba..218b81298e 100644
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
@@ -1092,9 +1092,11 @@ static char *aspeed_get_bmc_console(Object *obj, Error **errp)
 {
     AspeedMachineState *bmc = ASPEED_MACHINE(obj);
     AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(bmc);
+    AspeedSoCClass *sc = ASPEED_SOC_CLASS(obj);
+
     int uart_chosen = bmc->uart_chosen ? bmc->uart_chosen : amc->uart_default;
 
-    return g_strdup_printf("uart%d", uart_chosen - ASPEED_DEV_UART1 + 1);
+    return g_strdup_printf("uart%d", uart_chosen - sc->uarts_base + 1);
 }
 
 static void aspeed_set_bmc_console(Object *obj, const char *value, Error **errp)
@@ -1114,7 +1116,7 @@ static void aspeed_set_bmc_console(Object *obj, const char *value, Error **errp)
         error_setg(errp, "\"uart\" should be in range [1 - %d]", sc->uarts_num);
         return;
     }
-    bmc->uart_chosen = ASPEED_DEV_UART1 + val - 1;
+    bmc->uart_chosen = sc->uarts_base + val - 1;
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
index 123a0c432c..3963436c3a 100644
--- a/hw/arm/aspeed_soc_common.c
+++ b/hw/arm/aspeed_soc_common.c
@@ -36,7 +36,7 @@ bool aspeed_soc_uart_realize(AspeedSoCState *s, Error **errp)
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     SerialMM *smm;
 
-    for (int i = 0, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
+    for (int i = 0, uart = sc->uarts_base; i < sc->uarts_num; i++, uart++) {
         smm = &s->uart[i];
 
         /* Chardev property is set by the machine. */
@@ -58,7 +58,7 @@ bool aspeed_soc_uart_realize(AspeedSoCState *s, Error **errp)
 void aspeed_soc_uart_set_chr(AspeedSoCState *s, int dev, Chardev *chr)
 {
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
-    int i = dev - ASPEED_DEV_UART1;
+    int i = dev - sc->uarts_base;
 
     g_assert(0 <= i && i < ARRAY_SIZE(s->uart) && i < sc->uarts_num);
     qdev_prop_set_chr(DEVICE(&s->uart[i]), "chardev", chr);
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 9d0af84a8c..ce2bb51682 100644
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
-- 
2.34.1

