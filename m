Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2470350eja;
        Mon, 4 Mar 2024 01:13:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXNDf8v6X91935eTorFxlZVIJGHWN8pJKWRwSGto6EI+EMxJei0LisqZjY4p122ar2SKGMAnVB++d/bjizBxxoGtzI4gjSJ
X-Google-Smtp-Source: AGHT+IHAcODshdwseEk9st/WTCDt97w/XcuIs9CsmS3bY+EWQBQaaZqPXUXELzgZXskI/qNOuK+U
X-Received: by 2002:a05:622a:164f:b0:42e:c1b8:acd8 with SMTP id y15-20020a05622a164f00b0042ec1b8acd8mr8919890qtj.57.1709543608126;
        Mon, 04 Mar 2024 01:13:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709543608; cv=none;
        d=google.com; s=arc-20160816;
        b=zcilbQCdF4c3DtpeDOUWZ5STj8fCO0javDS6d+G7PQPuEiRAib7FiTCSYQ2XmGxk+I
         1XooUSSen9kcHNFUAe19YGzS89gF7/qHl1We6buTqNW09wWSiyeLWsac4pSGJd+ErFrH
         j0IkrgcI+eTR3zPB0scZtJhwCNc2ElqFDMQ2YspVe4rnqUzbj+yB9VA0S7hnb01ISuhk
         aMdRrPeMZLs46P10WgyteiKYc4rp18BBHPErpNU2wP8XpSLnnbS9qqGGywB/sKVDS1Qf
         jkICSEiyGJT5rR2AlBiQHW5tYFIFTocz+vxx3/093Dwwh/7cqqZeAqDl+MP5ig3t9h67
         ZV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Pj7k0wYh3wHW05N9gW3iprZKmGP6mAJKnIPARGDKqKo=;
        fh=MGNs5MsPfS8GULtQe2qMcYQbAiZJSQuMQcVfuHK1z7k=;
        b=G9AExBmpcIOyVmCAawclnsbOV1YUjXZstMc3lNxOoFIDSYpXtNRjFaFxBliQQIcC/D
         TmEOETUgnoFMd8Y/99gOvoIYNgwJdsOR/5c+7i7/Utx/DGZw+zEjXtK0BYg/srCmvz26
         BIevatDG6wIcnNt10L027FhYSuGONTBRoPCCkcsYnfiKu9ibWhWQeDM1Rl63oYbE8wdW
         CL9ekfPRkORCUNwbNDEkBFjvy+VSIGUe5Wmx6bLSJurvm2XF0lox7up5AKnlKhPB2ysV
         vUfaSH+fpY4SZBjFF47bgn38wncf5oyMoCm5q2fTYW0xUNXn1orkRdsa32MUEDjWJVbP
         HaBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12-20020ac85a8c000000b0042e67b99a2bsi9457841qtc.481.2024.03.04.01.13.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 01:13:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rh4N9-0007L0-Q8; Mon, 04 Mar 2024 04:12:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rh4N7-0007Jn-Sd; Mon, 04 Mar 2024 04:12:33 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX02.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rh4N6-0003Bk-BR; Mon, 04 Mar 2024 04:12:33 -0500
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 4 Mar
 2024 17:12:24 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 4 Mar 2024 17:12:24 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 1/9] aspeed/wdt: Add AST2700 support
Date: Mon, 4 Mar 2024 17:12:13 +0800
Message-ID: <20240304091221.1855398-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304091221.1855398-1-jamin_lin@aspeedtech.com>
References: <20240304091221.1855398-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
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
X-TUID: DWHppAsXqylu

AST2700 wdt controller is similiar to AST2600's wdt, but
the AST2700 has 8 watchdogs, and they each have a 0x80 of registers.
Introduce ast2700 object class and increse the number of regs(offset) of
ast2700 model.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/watchdog/wdt_aspeed.c         | 24 ++++++++++++++++++++++++
 include/hw/watchdog/wdt_aspeed.h |  3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index d70b656f8e..75685c5647 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -422,12 +422,36 @@ static const TypeInfo aspeed_1030_wdt_info = {
     .class_init = aspeed_1030_wdt_class_init,
 };
 
+static void aspeed_2700_wdt_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
+
+    dc->desc = "ASPEED 2700 Watchdog Controller";
+    awc->iosize = 0x80;
+    awc->ext_pulse_width_mask = 0xfffff; /* TODO */
+    awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
+    awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
+    awc->wdt_reload = aspeed_wdt_reload_1mhz;
+    awc->sanitize_ctrl = aspeed_2600_sanitize_ctrl;
+    awc->default_status = 0x014FB180;
+    awc->default_reload_value = 0x014FB180;
+}
+
+static const TypeInfo aspeed_2700_wdt_info = {
+    .name = TYPE_ASPEED_2700_WDT,
+    .parent = TYPE_ASPEED_WDT,
+    .instance_size = sizeof(AspeedWDTState),
+    .class_init = aspeed_2700_wdt_class_init,
+};
+
 static void wdt_aspeed_register_types(void)
 {
     type_register_static(&aspeed_wdt_info);
     type_register_static(&aspeed_2400_wdt_info);
     type_register_static(&aspeed_2500_wdt_info);
     type_register_static(&aspeed_2600_wdt_info);
+    type_register_static(&aspeed_2700_wdt_info);
     type_register_static(&aspeed_1030_wdt_info);
 }
 
diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index e90ef86651..830b0a7936 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -19,9 +19,10 @@ OBJECT_DECLARE_TYPE(AspeedWDTState, AspeedWDTClass, ASPEED_WDT)
 #define TYPE_ASPEED_2400_WDT TYPE_ASPEED_WDT "-ast2400"
 #define TYPE_ASPEED_2500_WDT TYPE_ASPEED_WDT "-ast2500"
 #define TYPE_ASPEED_2600_WDT TYPE_ASPEED_WDT "-ast2600"
+#define TYPE_ASPEED_2700_WDT TYPE_ASPEED_WDT "-ast2700"
 #define TYPE_ASPEED_1030_WDT TYPE_ASPEED_WDT "-ast1030"
 
-#define ASPEED_WDT_REGS_MAX        (0x30 / 4)
+#define ASPEED_WDT_REGS_MAX        (0x80 / 4)
 
 struct AspeedWDTState {
     /*< private >*/
-- 
2.25.1

