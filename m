Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3385708njk;
        Mon, 2 Dec 2024 18:16:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXa8Qvs9clm8Bmb2Yuwa93SK31YwFg3W7oUWLlb5AwQt69im1BXuGO6sthdE/WTQMExkfFWVGMJJYRNNQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHDhOh9VHkmYvZpHOdb5N/LGuTuguq+FTps7YS05EP+kDykxBvMNibrryYFRKZ1CpGyWR5k
X-Received: by 2002:a05:620a:2685:b0:7b1:113f:2e55 with SMTP id af79cd13be357-7b6a61c81a7mr95716685a.58.1733192218088;
        Mon, 02 Dec 2024 18:16:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733192218; cv=none;
        d=google.com; s=arc-20240605;
        b=OH0b1+yuqlpYjRYdZ2KAZqu24RvKBfGD2ZAoa8HeTrSptgcYcOTl+0jkj9dMV680dW
         bE4ocoQ6Z6/bo2Gh0ad93/G9xS9GLQDmnsaYNG2jvhpg7pahEv5J7PagXJJ810UORzPb
         cZCarvr9MCamnICGcbgfMeV/EuUPyZAsxzIz7lSDVP+k7dM8hTZbhobukqd1w4ncr0t4
         IAuJHUJsAVvwMfMHRHO1UpcGBYzIEoYwnZEeoKXvhXPXTZA4eQSivZN/ZYidaN1aH5NX
         8CJjpE0KIQBR966N3S244g/+or3W/o9yl/Hwy+90G9bAG4kHmwy+LMcCP3mnGU9tgWs8
         sakw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=U5VmLB+AjWtYjZ5aMKEX09mvDce6qy6G7HUywFEOuOQ=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=h957P/AL4d7B6hnVmtVsey5jsk0YN+7oNWtC7LjJ0PuVK5HTRxhpurSZutoEgJPbLw
         blajr1Dq6GQNEOHr+dD4CxJLsibCf4iQxg96Kuz4jLN/8mIdFAbLlgTo5UTo0L205W5W
         XH48QIbuhFTPfoYf3euPZdZdBOoJkugBuSdGb3YvrfqL7IPIrEp2bl7VsdeAzupEu2BY
         IhulEho70uIkJjotUDwh95L9VmgQtIIoGwA5MIX9ny9JdCnQZpheLcbeTeo4hcVNhA17
         p9JH2cjIgNEwgpQuJJJHabigfwaZZylbTPM49TxZxV9zNH2kBHBQBhKRylVrfbIz4YLN
         ARTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849c241bsi1262244585a.370.2024.12.02.18.16.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 18:16:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tIIRl-0005Up-RN; Mon, 02 Dec 2024 21:15:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIIRi-0005T9-4e; Mon, 02 Dec 2024 21:15:27 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIIRg-0003dt-AO; Mon, 02 Dec 2024 21:15:25 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 3 Dec
 2024 10:15:01 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 3 Dec 2024 10:15:01 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 5/6] aspeed/soc: Support SDHCI for AST2700
Date: Tue, 3 Dec 2024 10:14:59 +0800
Message-ID: <20241203021500.3986213-6-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241203021500.3986213-1-jamin_lin@aspeedtech.com>
References: <20241203021500.3986213-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eKbzEYplbXfm

Add SDHCI model for AST2700 SDHCI support. The SDHCI controller only support 1
slot and registers base address is start at 0x1408_0000 and its interrupt is
connected to GICINT133_INTC at bit 1.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 63d1fcb086..baddd35ecf 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -65,6 +65,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_I2C]       =  0x14C0F000,
     [ASPEED_DEV_GPIO]      =  0x14C0B000,
     [ASPEED_DEV_RTC]       =  0x12C0F000,
+    [ASPEED_DEV_SDHCI]     =  0x14080000,
 };
 
 #define AST2700_MAX_IRQ 256
@@ -113,6 +114,7 @@ static const int aspeed_soc_ast2700_irqmap[] = {
     [ASPEED_DEV_KCS]       = 128,
     [ASPEED_DEV_DP]        = 28,
     [ASPEED_DEV_I3C]       = 131,
+    [ASPEED_DEV_SDHCI]     = 133,
 };
 
 /* GICINT 128 */
@@ -158,6 +160,7 @@ static const int aspeed_soc_ast2700_gic132_intcmap[] = {
 
 /* GICINT 133 */
 static const int aspeed_soc_ast2700_gic133_intcmap[] = {
+    [ASPEED_DEV_SDHCI]     = 1,
     [ASPEED_DEV_PECI]      = 4,
 };
 
@@ -380,6 +383,14 @@ static void aspeed_soc_ast2700_init(Object *obj)
     object_initialize_child(obj, "gpio", &s->gpio, typename);
 
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_ASPEED_RTC);
+
+    snprintf(typename, sizeof(typename), "aspeed.sdhci-%s", socname);
+    object_initialize_child(obj, "sd-controller", &s->sdhci, typename);
+    object_property_set_int(OBJECT(&s->sdhci), "num-slots", 1, &error_abort);
+
+    /* Init sd card slot class here so that they're under the correct parent */
+    object_initialize_child(obj, "sd-controller.sdhci",
+                            &s->sdhci.slots[0], TYPE_SYSBUS_SDHCI);
 }
 
 /*
@@ -681,6 +692,15 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_RTC));
 
+    /* SDHCI */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->sdhci), errp)) {
+        return;
+    }
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sdhci), 0,
+                    sc->memmap[ASPEED_DEV_SDHCI]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_SDHCI));
+
     create_unimplemented_device("ast2700.dpmcu", 0x11000000, 0x40000);
     create_unimplemented_device("ast2700.iomem0", 0x12000000, 0x01000000);
     create_unimplemented_device("ast2700.iomem1", 0x14000000, 0x01000000);
-- 
2.34.1

