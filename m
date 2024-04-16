Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp245701ejd;
        Tue, 16 Apr 2024 02:20:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4lMJuRgF909y/6zWzA5yg7py5nrlDkV8Cya/pwn8u9klIx1DLDyKk2D2HXQ7hjJnISBNhfYGpG7GEDVG9dIVs6Fu7C2Oi
X-Google-Smtp-Source: AGHT+IHq3pmAdiQqLvsaL7tqmHzZNyn5rEutIe9JiQAKXpHWbFIKwJhUBcaCUyv/yyB3A1QFmTfD
X-Received: by 2002:a05:6122:54b:b0:4d3:45a2:ae53 with SMTP id y11-20020a056122054b00b004d345a2ae53mr8233178vko.16.1713259246021;
        Tue, 16 Apr 2024 02:20:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713259246; cv=none;
        d=google.com; s=arc-20160816;
        b=jHj82n5KWFbXfK6Px9IDSvoiJLmLC/CNwXry0LwZBpkpX6hWsiqIER/QId2zw0IIgU
         PTD+MznAv6BJySFnr5dzXNv+X63X1LgmIgBlov+0zS6tDv87X7Bj9g9mTKgARJtE05zx
         xODT5ib3s9sKbCCXRv7NJgX7KuVl8z5NCv87I2VDv0W+zL94jNSJaEGXjodAsNN3h50b
         6TwICBKkzYXUPmrIVpYr6B8P2elkZYu1lGnQUODhMKGYNWp8w+ijhcwds+SUvBbHIAHn
         2j316hsIl46xbKkOs++lPtpsIx+3TQtvDV7/k92v6taiKDLM54LuVTLCzKrVtBzv231J
         tVVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=bkPbZrWkfn1gLPyX+TFyjtkATCVhqBjw5ey+1ijIzsc=;
        fh=4qsXPuPQQYwauqV4GBfUuJ135n2gY4LbnQu8KHliids=;
        b=JH9anRE+KFvXcIIOOISVoP7aV09PiD4vCH/p1ylifrN/b1HfCIEF3Pg4cIQycWCvi6
         pV0PYYKekvbR7CIq8XGCtQe6fmrmsPgEhPOYAb8WT45yLq38X+83VyYO4fyt6Bl+lV8r
         drAIFQTzy7xlL6VT4mGulO/8rCxoCNvgn7aRvatMtnmh3Qqa6oFtt8F/bZlHR6Sx18nQ
         jfZG6bRp27OMuBLYjHXqc3c7cmTR0yl7vhf4UVLReUTP0ai/76e6b0owuXPfjDtbbHeG
         KUskyoL1Wtvlr5G0wMCcczHn2gfVcOlIPUjJkIuoVDfh7UKySTJainbgJUN3pIPgsfJW
         4IhQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qp6-20020a05620a388600b0078bcec2939asi12107512qkn.38.2024.04.16.02.20.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2024 02:20:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rweyS-0002aT-ML; Tue, 16 Apr 2024 05:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rweyO-0002Y8-1w; Tue, 16 Apr 2024 05:19:29 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rweyL-0007Zt-TN; Tue, 16 Apr 2024 05:19:27 -0400
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 17:19:05 +0800
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 16 Apr
 2024 17:19:06 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 16 Apr 2024 17:19:04 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v3 01/16] aspeed/wdt: Add AST2700 support
Date: Tue, 16 Apr 2024 17:18:48 +0800
Message-ID: <20240416091904.935283-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240416091904.935283-1-jamin_lin@aspeedtech.com>
References: <20240416091904.935283-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Q/l0TSB9xSRS

AST2700 wdt controller is similiar to AST2600's wdt, but
the AST2700 has 8 watchdogs, and they each have 0x80 of registers.
Introduce ast2700 object class and increase the number of regs(offset) of
ast2700 model.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
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

