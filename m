Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1217528lfb;
        Mon, 21 Mar 2022 19:53:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCU1LaK1v5/2wUF5mEIQLP4e9AblcMMT7Y11HTA8f79TnHnby1YtzeZjeIoJa8BXjyHOxW
X-Received: by 2002:a05:622a:190e:b0:2e1:d655:d447 with SMTP id w14-20020a05622a190e00b002e1d655d447mr18594699qtc.571.1647917596806;
        Mon, 21 Mar 2022 19:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647917596; cv=none;
        d=google.com; s=arc-20160816;
        b=a2bj4V4UwM6kRop0DPLxMqVmwdd9z9QU6dGWwHUA7b+xjqOFxpn0Jom72CFKfIdr8S
         X80+pXxEChJx1mSLaN+cBDxqvbmr+lhh9wr0tPImQJcn/VSxE7ywo1Jet6eLQdxf1qdp
         c3mUcdeW/6cMpAkbw677CAtorE2Uz0CwCO0FVDNFO/RohyrvMxHx8DJNaxvR7Sayo4Rc
         Sxh2cMxnWC3chuOh4AJ5ytPrgkCbWpmtLVqKeqEpVi3pXsE3sSBUc9PtLQtXJDbPmnW8
         gPKoDf2boluxrkwpgj4Dumgviv1AfQTc04gu/i3lbG8cfJQNNnS6DIi/UvOnk3ogUbZC
         /d/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=JEMyGq8qI/8dda8eD3xUMLwz5Ba3XcmR5B5X2fnxrW4=;
        b=zxWQQ9WkeM2UzBLwx8reoyR3PJI9/cstWOPQN0WIGX4d2WNzQUnIocnUZmdf02mWCC
         Gmm/neSM8z6ao5+stA1ns9mB0wyGvJF+5kNNElzryoTyNBgSG73A6TR3lqO/XfzfY5mY
         37F7PiT4phEhEhXyyj/rHscc+4bGhPfMKVGz3TLHQwy/tUt/q5UoCImdYY4s8PJOddOJ
         9Vp8vwzWc8bs4xWmQfMEbX7E1Wx5y91AhoNn5AeM4waUYy9AXUjoFcKuXRJkpCoE91dQ
         pI02h6omPmKxa/Lp7qnSL8xc8IPkAnGP4LmvVmAsc/Zmx9qFM+xQ+arneqkhyXwkfF/m
         aZXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p64-20020a0c90c6000000b00440e46a7c52si2690836qvp.240.2022.03.21.19.53.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Mar 2022 19:53:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nWUe4-00030U-AA
	for alex.bennee@linaro.org; Mon, 21 Mar 2022 22:53:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWUds-0002zG-OG; Mon, 21 Mar 2022 22:53:04 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:29236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWUdp-0001uz-6f; Mon, 21 Mar 2022 22:53:04 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22M2fUr6078439;
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
Subject: [PATCH v1 3/9] aspeed/wdt: Fix ast2500/ast2600 default reload value.
Date: Tue, 22 Mar 2022 10:51:48 +0800
Message-ID: <20220322025154.3989-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220322025154.3989-1-jamin_lin@aspeedtech.com>
References: <20220322025154.3989-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22M2fUr6078439
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
X-TUID: QsCRW8JWvcFl

From: Steven Lee <steven_lee@aspeedtech.com>

Per ast2500_2520_datasheet_v1.8 and ast2600v11.pdf, the default value of
WDT00 and WDT04 is 0x014FB180 for ast2500/ast2600.
Add default_status and default_reload_value attributes for storing
counter status and reload value as they are different from ast2400.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 hw/watchdog/wdt_aspeed.c         | 10 ++++++++--
 include/hw/watchdog/wdt_aspeed.h |  2 ++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 6aa6f90b66..386928e9c0 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -232,8 +232,8 @@ static void aspeed_wdt_reset(DeviceState *dev)
     AspeedWDTState *s = ASPEED_WDT(dev);
     AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(s);
 
-    s->regs[WDT_STATUS] = 0x3EF1480;
-    s->regs[WDT_RELOAD_VALUE] = 0x03EF1480;
+    s->regs[WDT_STATUS] = awc->default_status;
+    s->regs[WDT_RELOAD_VALUE] = awc->default_reload_value;
     s->regs[WDT_RESTART] = 0;
     s->regs[WDT_CTRL] = awc->sanitize_ctrl(0);
     s->regs[WDT_RESET_WIDTH] = 0xFF;
@@ -319,6 +319,8 @@ static void aspeed_2400_wdt_class_init(ObjectClass *klass, void *data)
     awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
     awc->wdt_reload = aspeed_wdt_reload;
     awc->sanitize_ctrl = aspeed_2400_sanitize_ctrl;
+    awc->default_status = 0x03EF1480;
+    awc->default_reload_value = 0x03EF1480;
 }
 
 static const TypeInfo aspeed_2400_wdt_info = {
@@ -355,6 +357,8 @@ static void aspeed_2500_wdt_class_init(ObjectClass *klass, void *data)
     awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
     awc->wdt_reload = aspeed_wdt_reload_1mhz;
     awc->sanitize_ctrl = aspeed_2500_sanitize_ctrl;
+    awc->default_status = 0x014FB180;
+    awc->default_reload_value = 0x014FB180;
 }
 
 static const TypeInfo aspeed_2500_wdt_info = {
@@ -376,6 +380,8 @@ static void aspeed_2600_wdt_class_init(ObjectClass *klass, void *data)
     awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
     awc->wdt_reload = aspeed_wdt_reload_1mhz;
     awc->sanitize_ctrl = aspeed_2600_sanitize_ctrl;
+    awc->default_status = 0x014FB180;
+    awc->default_reload_value = 0x014FB180;
 }
 
 static const TypeInfo aspeed_2600_wdt_info = {
diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index f945cd6c58..0e37f39f38 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -45,6 +45,8 @@ struct AspeedWDTClass {
     void (*reset_pulse)(AspeedWDTState *s, uint32_t property);
     void (*wdt_reload)(AspeedWDTState *s);
     uint64_t (*sanitize_ctrl)(uint64_t data);
+    uint32_t default_status;
+    uint32_t default_reload_value;
 };
 
 #endif /* WDT_ASPEED_H */
-- 
2.17.1

