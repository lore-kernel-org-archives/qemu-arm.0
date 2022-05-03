Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1240474lfj;
        Tue, 3 May 2022 00:38:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjFNfH14KlOERTeMgO8A3l59CvqOojH42qCsT0+AAKtD2/eB6+zoLCUVqvTw/tYOAOoj1D
X-Received: by 2002:a37:2f45:0:b0:69c:f34:d9b5 with SMTP id v66-20020a372f45000000b0069c0f34d9b5mr11237887qkh.68.1651563534008;
        Tue, 03 May 2022 00:38:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651563534; cv=none;
        d=google.com; s=arc-20160816;
        b=RagB2bWuUFsetYf9yn8dvPrP3X6tuL9ZKykayPkcfqJP0LxZwVNsPjVrOnS0Vdyvjt
         grzqlrOMkljz0RHnIsfQudZM814uB+sVepLYIcAHLhv98+d6jtnZgCIB/dt26JUpG/mX
         pTQRRvprTO7Q/X7lYt72ystgLXBIpZlPs7l7WptH+TqZDNrHfSq5paRQ584mL4bpO7Wg
         1k/jEkVCNyKjb2dv/OSxtVRL330QLZph/onhKQfn8LhoKP2pXPGOmL3y9+EMFmp9xhgO
         /KSOM1Y9USBX+u8ytXymemhmVlmZzPgAFwTC9IH43oHyceKJOM/bDqiHiG8kaXDtmfJC
         JW1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=t+pMkXWa44gxqmWaU2pj8f1AEA6UHCEHw/55Lj39kF8=;
        b=bbwUBJfAXw5dSLdiTH2+tfzHEyu0tblnE0e0BtzxmvpPoWXAb58uXimVnHuAhEFpgZ
         NFpL3Mkf3hCyG8OU5WvuHf/5XA0OSS309ri30/tMwYKBbITPgKjoUPbhb1BsiQXTpNYC
         UEpYVGqnE1ddPqUHX1N+7EeEoIe57bPJGEzlWbs3se3cWibPR50S4dXrlB+yS4qPGWkH
         Kx/SQm9eFSQgS0eHwB6iS9lHTtYYKK964w3WG2kENK8XdUzCFgPE6tYt4rPfZWqVXRl/
         OY8q4eGso+hmTUNh5djKliDrThSpwrioj93pvDCKdVI6Hw2mf7wAqyA26JIS/d4JJwDf
         ocbw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x22-20020a05620a259600b0069a88a4adafsi7741078qko.258.2022.05.03.00.38.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 00:38:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nln7V-0006Kr-EC
	for alex.bennee@linaro.org; Tue, 03 May 2022 03:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmV9-0003D6-6I; Tue, 03 May 2022 02:59:15 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:46431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmV7-0007Ts-GD; Tue, 03 May 2022 02:59:14 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KsrRM10wcz4ySs;
 Tue,  3 May 2022 16:59:11 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsrRJ616Zz4yST;
 Tue,  3 May 2022 16:59:08 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 07/19] aspeed/wdt: Fix ast2500/ast2600 default reload value
Date: Tue,  3 May 2022 08:58:36 +0200
Message-Id: <20220503065848.125215-8-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503065848.125215-1-clg@kaod.org>
References: <20220503065848.125215-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=XF6a=VL=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /bZFCSiChvcQ

From: Steven Lee <steven_lee@aspeedtech.com>

Per ast2500_2520_datasheet_v1.8 and ast2600v11.pdf, the default value of
WDT00 and WDT04 is 0x014FB180 for ast2500/ast2600.
Add default_status and default_reload_value attributes for storing
counter status and reload value as they are different from ast2400.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220401083850.15266-4-jamin_lin@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/watchdog/wdt_aspeed.h |  2 ++
 hw/watchdog/wdt_aspeed.c         | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index f945cd6c5833..0e37f39f384c 100644
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
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 6aa6f90b664a..386928e9c0fc 100644
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
-- 
2.35.1

