Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1260732njk;
        Wed, 17 Jul 2024 23:51:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWufPsURU1wjKx9me22UuU/Q1ybZyaT346nsyz7lCPd3e8ZLCIVpk0vN6dx3zmcgQJep+Lr80YQ6RAaZXuagzOo2UVsN6af
X-Google-Smtp-Source: AGHT+IHxrXJDIv4yfpKsW7M99SAGIHGoVlrGSnlEbDC8BarOF4ApVAwMXSZVkVDnQuuQ5s135w37
X-Received: by 2002:a05:620a:2697:b0:7a1:3ffb:e88e with SMTP id af79cd13be357-7a187446f65mr427941085a.9.1721285505883;
        Wed, 17 Jul 2024 23:51:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721285505; cv=none;
        d=google.com; s=arc-20160816;
        b=y02aWDgcjcoa0SgUujLZ5Zx9oXiEWSaiHHC56Lveu18dGa1U7jDegJaGO3VUcIaO91
         9ChOFzynNLN7uBhDNlymnC8fHqMdvszX5WM3VRwFxPO8n6EFJqd3BUgLXoX+6hEqx+u0
         ieOUYA3Y1o7g6qXbPAG038O/hnUgwKzCOSZcqinsV6E+FUICFok4B9wx1NCx93XO2OVn
         m+BUzepC5Oifr/PxyIbPgkEgDvmaqIfFRJgcea09/JDeTVttODUqR7kZ9aKGgPrM+Zvw
         gDXqY1wImWZ9ktkCe3y2y0g10Hg6uKSkK5LuIFUZ8Xv/eOkdu4LFV08JkBi8WSzMbeRM
         f1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=75qVw0A69s4WPWCxeO4vAxiB1n5P2oQb3D1cv6e1Crs=;
        fh=Ph+R0NNHAlT66tvNC78JUFsmAbXddKrwk994XbgsRkc=;
        b=FRNui/uy0UW3FPRDeMgtG4Ojj8lUmczEB+jDXJSDD7pLdbVO1wbFAEoq8/yUNjBJPX
         t533ODzICHqxd/P5z8UIIyN28ovzGFajCtuZILuTFrXUbPaWCC9220f2GgTR+EeRIioc
         Dba/4tW7Tl+kgYWwI1oSo5FiZlDTJ7Arr5taSd2DtJBgN8BTPgwuV+2QNea5dLjqN1zr
         HNjlUHxR6dx8NpVGZglhW10Pg6zfncMcr+g6bSVdHKjR4PX9rrIxtpYWgLjQR1dJvZrS
         hjuXLjDeINHfLU5COyo+jFiZZb+ZcXFvyzigUYsayhE/sL4eXWrs37EPr4NaD+ohyGE0
         c63A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a160c698bdsi1167611885a.429.2024.07.17.23.51.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2024 23:51:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sUKyx-0008WS-UR; Thu, 18 Jul 2024 02:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sUKyg-00072E-OX; Thu, 18 Jul 2024 02:50:59 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sUKyf-0004VA-5Q; Thu, 18 Jul 2024 02:50:58 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 18 Jul
 2024 14:50:18 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 18 Jul 2024 14:50:18 +0800
To: Alistair Francis <alistair@alistair23.me>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@kaod.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:STM32F205" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 12/15] aspeed/soc: introduce a new API to get the INTC
 orgate information
Date: Thu, 18 Jul 2024 14:49:22 +0800
Message-ID: <20240718064925.1846074-13-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
References: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: sT6NkGRHGACK

Currently, users can set the intc mapping table with
enumerated device id and device irq to get the INTC orgate
input pins. However, some devices use the continuous bits number in the
same orgate. To reduce the enumerated device id definition,
create a new API to get the INTC orgate index and source bit number
if users only provide the start bus number of device.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 4257b5e8af..0bbd66110b 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -164,6 +164,11 @@ struct gic_intc_irq_info {
     const int *ptr;
 };
 
+struct gic_intc_orgate_info {
+    int index;
+    int int_num;
+};
+
 static const struct gic_intc_irq_info aspeed_soc_ast2700_gic_intcmap[] = {
     {128,  aspeed_soc_ast2700_gic128_intcmap},
     {129,  NULL},
@@ -193,6 +198,27 @@ static qemu_irq aspeed_soc_ast2700_get_irq(AspeedSoCState *s, int dev)
     return qdev_get_gpio_in(DEVICE(&a->gic), sc->irqmap[dev]);
 }
 
+static void aspeed_soc_ast2700_get_intc_orgate(AspeedSoCState *s, int dev,
+    struct gic_intc_orgate_info *orgate_info)
+{
+    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(aspeed_soc_ast2700_gic_intcmap); i++) {
+        if (sc->irqmap[dev] == aspeed_soc_ast2700_gic_intcmap[i].irq) {
+            assert(aspeed_soc_ast2700_gic_intcmap[i].ptr);
+            orgate_info->index = i;
+            orgate_info->int_num = aspeed_soc_ast2700_gic_intcmap[i].ptr[dev];
+            return;
+        }
+    }
+
+    /*
+     * Invalid orgate index, device irq should be 128 to 136.
+     */
+    g_assert_not_reached();
+}
+
 static uint64_t aspeed_ram_capacity_read(void *opaque, hwaddr addr,
                                                     unsigned int size)
 {
-- 
2.34.1

