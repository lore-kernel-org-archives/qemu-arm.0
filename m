Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1217531lfb;
        Mon, 21 Mar 2022 19:53:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxR/9iesdE3l+0dmdWb5HdXPId9P7Jv2o4XGiH7UOI/WCiLUEnlTvlm7+j9RUh7uaO7wCtt
X-Received: by 2002:a05:622a:1447:b0:2e1:c405:b05b with SMTP id v7-20020a05622a144700b002e1c405b05bmr19467793qtx.626.1647917597561;
        Mon, 21 Mar 2022 19:53:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647917597; cv=none;
        d=google.com; s=arc-20160816;
        b=zck0c/gP4ugzifiNOPQXCYYMpWi1Poj+AUHAfv/iGbsamWQ1t7wtDq2/Z+f55d/QSW
         ycQEanJUsNDcsMshgKPeG7UGb8mDFOGPrNPj4A15qjiTYP3D1MMJXp0zqbGA1kTTSR34
         dP7HiLDUAo7gIcbwsoiTu9uUtha5Hv3ZB9mzBOr4grOTwWdUe9V5M/N4J6Yvnh3RYyye
         7xyk8wEB5vbDPhwudtSH6Ft5y6/C2JipvnTMrrutEvd3AbjkUBfeFLA0vOq/GX7JequI
         c0obpD9FZ6xNuzjXGdBuEM+Wvub3KSfcHuj8h5F6O/wXhsXWj9ws6fEc7j5utGc2+gF2
         H0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=wmQXcmkQJwOm9DRJlZMQhYJnfbyrIQ9+f60JoZUcQ9M=;
        b=YiV7usDQ6EXVOzphAh0kMIiS6RqIAXlhOKBBy2B0EkW+1iRNp2BVrm9O+IH2eHuTrH
         1hvOZTehugVfLgt/HJ0vax428tkZnrHYn2E3dHo0c+Wxt1N03fUTtFfyKW+gKYC4uKFo
         OuCOJaglZAfOlffYKBGGAEyIXSVuwlS6d7/tfPtC/zbAMnRQ6T8Quva/lQ2lSVjDjzMT
         oUiEw38wEoUMo07F7vqs37I2hdBsCUgRSqdn+Mj3Z3SncoU4wEnAcQ9/uzXlMHFiqL7t
         kLpxjUXS7za/u4fTdPxsULC+QzU5genCkTF1kWKfp2G42alj5mGpc+X0vc4pmXD05/I3
         r0Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14-20020a0ce00e000000b00440e46a7b79si2313216qvk.23.2022.03.21.19.53.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Mar 2022 19:53:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nWUe5-00030k-1F
	for alex.bennee@linaro.org; Mon, 21 Mar 2022 22:53:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWUds-0002zN-Tf; Mon, 21 Mar 2022 22:53:04 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:21205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWUdp-0001v4-7c; Mon, 21 Mar 2022 22:53:04 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22M2fU6Q078440;
 Tue, 22 Mar 2022 10:41:30 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 22 Mar
 2022 10:51:58 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Beraldo Leal" <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [PATCH v1 4/9] aspeed/wdt: Add AST1030 support
Date: Tue, 22 Mar 2022 10:51:49 +0800
Message-ID: <20220322025154.3989-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220322025154.3989-1-jamin_lin@aspeedtech.com>
References: <20220322025154.3989-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22M2fU6Q078440
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
X-TUID: hr9mIRrtYNvv

From: Steven Lee <steven_lee@aspeedtech.com>

AST1030 wdt controller is similiar to AST2600's wdt, but it has extra
registers.
Introduce ast1030 object class and increse the number of regs(offset) of
ast1030 model.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
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

