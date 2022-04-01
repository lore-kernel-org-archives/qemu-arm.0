Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp713484lfb;
        Fri, 1 Apr 2022 01:41:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/WYYoXVZwJm6vQJfL/2I8eRvth81QYbAmxy45LrM8HF5FKsYGrHHVSd+fZpmPm1xHXbeP
X-Received: by 2002:a05:622a:46:b0:2e1:d837:e91d with SMTP id y6-20020a05622a004600b002e1d837e91dmr7540430qtw.633.1648802486669;
        Fri, 01 Apr 2022 01:41:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648802486; cv=none;
        d=google.com; s=arc-20160816;
        b=SdsF22Jtcpyt1Ehnx971aurmULzwlwC/WCp12ZuIvU0d0oYJxOuT0RfhWe8MzUthIX
         9dKnmeuuUYL8m/ezX6XccisO92DjM0rgV2aAArOZ4A/GybOaHRONUHHwXJJbM+LHQYlt
         2XK5FZFUkWY+sRWHJshKjUV7nGzChPealnvtgSXsGIyR/xpBWaQp35wb8xmfocVEd8nu
         DXcdR9npfSDOXnWVXsxR0IM0NGRWOuQRNfogK0uGHOdvJdzVoA7pyXevPnIfwFJUhmox
         JorZSs/grtFB6wzhbYqnT1FYBF84tCjBaClA/Sv+KuKwqR+jvPHAaVfOcBLE3pQ4ijAl
         cO/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=yY5Sc5MfH8qFz51eLlHePDoO0VqfoTOfLbupnV7hQ1Q=;
        b=tepJjHHioUdwJItGQuPCl91eqiI0GM31gqzXA8JXxF5cnU0RR1tPKcN2EeGA69j6lM
         DcLRiVeSulUPd2+Iv5JPAE62i8C7dZFFzBP3VJWsnFg4dnVu+OEJqunGy2y28UQF+gDE
         7vowbVEHnQS0D98E8aXw6Wbtv+T20CNXLT9xX7Kf0V9HWFui9SECPw1YVAuheM4Of0wA
         DcUn4Ft7HWzvv9I5IdpzwirbIrQ/yydvZ7Vl7YMJnGcqfD6Pt791xymvYb1ybCylO6gE
         u2UUdX7xNKawxebmJxtwr9MZH6hpS10/NLg79jEFOEwhjEicHe9y57VfYjUU8+Kfr93W
         K+fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q15-20020ac8450f000000b002e1fbf3c073si775297qtn.612.2022.04.01.01.41.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Apr 2022 01:41:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1naCqU-0001FF-3T
	for alex.bennee@linaro.org; Fri, 01 Apr 2022 04:41:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1naCpF-0000D5-Is; Fri, 01 Apr 2022 04:40:14 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:17079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1naCpD-0001Rh-66; Fri, 01 Apr 2022 04:40:08 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 2318RqVK030497;
 Fri, 1 Apr 2022 16:27:52 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 1 Apr
 2022 16:38:53 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Beraldo Leal" <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [PATCH v5 4/9] aspeed/wdt: Add AST1030 support
Date: Fri, 1 Apr 2022 16:38:45 +0800
Message-ID: <20220401083850.15266-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220401083850.15266-1-jamin_lin@aspeedtech.com>
References: <20220401083850.15266-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2318RqVK030497
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ao9/69quILI/

From: Steven Lee <steven_lee@aspeedtech.com>

AST1030 wdt controller is similiar to AST2600's wdt, but it has extra
registers.
Introduce ast1030 object class and increse the number of regs(offset) of
ast1030 model.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/watchdog/wdt_aspeed.c         | 24 ++++++++++++++++++++++++
 include/hw/watchdog/wdt_aspeed.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 386928e9c0..31855afdf4 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -391,6 +391,29 @@ static const TypeInfo aspeed_2600_wdt_info = {
     .class_init = aspeed_2600_wdt_class_init,
 };
 
+static void aspeed_1030_wdt_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
+
+    dc->desc = "ASPEED 1030 Watchdog Controller";
+    awc->offset = 0x80;
+    awc->ext_pulse_width_mask = 0xfffff; /* TODO */
+    awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
+    awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
+    awc->wdt_reload = aspeed_wdt_reload_1mhz;
+    awc->sanitize_ctrl = aspeed_2600_sanitize_ctrl;
+    awc->default_status = 0x014FB180;
+    awc->default_reload_value = 0x014FB180;
+}
+
+static const TypeInfo aspeed_1030_wdt_info = {
+    .name = TYPE_ASPEED_1030_WDT,
+    .parent = TYPE_ASPEED_WDT,
+    .instance_size = sizeof(AspeedWDTState),
+    .class_init = aspeed_1030_wdt_class_init,
+};
+
 static void wdt_aspeed_register_types(void)
 {
     watchdog_add_model(&model);
@@ -398,6 +421,7 @@ static void wdt_aspeed_register_types(void)
     type_register_static(&aspeed_2400_wdt_info);
     type_register_static(&aspeed_2500_wdt_info);
     type_register_static(&aspeed_2600_wdt_info);
+    type_register_static(&aspeed_1030_wdt_info);
 }
 
 type_init(wdt_aspeed_register_types)
diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index 0e37f39f38..dfa5dfa424 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -19,6 +19,7 @@ OBJECT_DECLARE_TYPE(AspeedWDTState, AspeedWDTClass, ASPEED_WDT)
 #define TYPE_ASPEED_2400_WDT TYPE_ASPEED_WDT "-ast2400"
 #define TYPE_ASPEED_2500_WDT TYPE_ASPEED_WDT "-ast2500"
 #define TYPE_ASPEED_2600_WDT TYPE_ASPEED_WDT "-ast2600"
+#define TYPE_ASPEED_1030_WDT TYPE_ASPEED_WDT "-ast1030"
 
 #define ASPEED_WDT_REGS_MAX        (0x20 / 4)
 
-- 
2.17.1

