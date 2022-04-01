Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp575220lfb;
        Thu, 31 Mar 2022 20:52:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzU80wuQKPQPSSjfflr3h8dIVQQLNcVEhG47Qc5xy3ltJCS5enXSnhA1zmdT6iZInkkVVA8
X-Received: by 2002:a05:622a:2cd:b0:2e1:db0c:88db with SMTP id a13-20020a05622a02cd00b002e1db0c88dbmr7044063qtx.649.1648785138154;
        Thu, 31 Mar 2022 20:52:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648785138; cv=none;
        d=google.com; s=arc-20160816;
        b=m6GauNPedQAqES0rTSzbL0ruse7fStxEoxB8ZY0E6bZpWkHBSjU2lonLgb87c3coPe
         D2eORpT6k3jP2MNcHveEhpPfx0fJIIYZnT8XNzzoXex4dlXv1mEQ6v3m3swAFPWkHbwT
         VfC2l1+3zI/ikHMG0ReKwJTqRhRjwS+IiR3fPFIipIFQg0SRHNXzWTaAPGuy8JFbKGpl
         KSIO3vOeAL1AC1Yz3SGD4ncBZvx4la3x6iWTXFWBXIqjTClnNm1uDd6JI299oVQWpCFG
         bmxr8wkNaCk8cqqCQo4A0aQvc/38HFO/a/KmTk4DIGX8+4RkV5GWX8zPIaxY6ksqgTJG
         4TQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=yY5Sc5MfH8qFz51eLlHePDoO0VqfoTOfLbupnV7hQ1Q=;
        b=FEJ3pnjGTNxqBTPy8T9inke+ugPhMpiq2AyVzck+cI8kqKU40oBtw/2NfB+iJKGN3H
         8z/TQMCEUAgToGp3Ae57+4wB/ro9jJNP/mtZKOx2YpJ902CUrmJnyj+0XCoWkbxBLT1t
         VG//n38gBm0F3hiyyA3U4UBem2HpO7nf+kWSt/ticxPMFQkCp72BE4el9BdqrMaM9jRb
         U5n7jmEwlKZ++Q97X/gZ/qNja1kkW8XW26YfgAYqFSwL9e5mBc6a8loRoHdtZeCBDwkw
         xl1G1j8gJAsPaJNI3lj+iTRLJwKAkmJVBaHbt7d0t/PWP3YbUOqqa8Zw29ULRaE0dmxc
         uERQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z24-20020ac81018000000b002eb8ec527c9si603834qti.157.2022.03.31.20.52.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 20:52:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1na8Kf-0002Qn-J6
	for alex.bennee@linaro.org; Thu, 31 Mar 2022 23:52:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1na8GW-00026b-Im; Thu, 31 Mar 2022 23:48:00 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:35455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1na8GU-0000r5-GI; Thu, 31 Mar 2022 23:48:00 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 2313Zqow095945;
 Fri, 1 Apr 2022 11:35:54 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 1 Apr
 2022 11:46:54 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Beraldo Leal" <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [PATCH v4 4/9] aspeed/wdt: Add AST1030 support
Date: Fri, 1 Apr 2022 11:46:46 +0800
Message-ID: <20220401034651.9066-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220401034651.9066-1-jamin_lin@aspeedtech.com>
References: <20220401034651.9066-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2313Zqow095945
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
X-TUID: aHi6Gr1rnepH

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

