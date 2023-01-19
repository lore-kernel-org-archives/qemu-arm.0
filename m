Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp296345ejc;
        Thu, 19 Jan 2023 04:36:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvFg5alS4yYtTXk/3XLZ7FWMKsVf1ynAEhLclPbkZyz4fr0MPUvDqt/L/NU71b34IGWNofr
X-Received: by 2002:ac8:7ec4:0:b0:3b6:3c9c:59f0 with SMTP id x4-20020ac87ec4000000b003b63c9c59f0mr14422049qtj.15.1674131776864;
        Thu, 19 Jan 2023 04:36:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674131776; cv=none;
        d=google.com; s=arc-20160816;
        b=K4V6GRnCWfajEi95CRDtlXuz3DnrGAKzu9pyyFdvk/Yq+1cspnMaDMyItIMcDQI5uS
         gZpgWpdg2NLgd0qJnOrP4Vpc/RfNoEQqaoO4xeJTu1vhyL1dztBct1D+Nxfn9rup9G9e
         xGqWTadRFbbv5qId+fEGlJueIlpqJw8btsbsnccx/b/gQEE4QotNIajxcP9IKC5M9VnI
         AIPXVykJ3bR4xe2y3egjNsLoyw1lCDUsyjusFtSlVq6pveTD0sKBxhOiLJUs9d2oA/bJ
         ZwwzQBdZ+ctygs0yuDzQgHcyMErQIiFP06PW0YYery3RUiIAzkd+10trLm+KcrpRWjqt
         zlAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=ZfCMloy3+h2ZMhPuRQm8RiOYHDOjWGkhJn0FfGyJLcw=;
        b=Cw+cUP/jigAjPtHIOGvtlsRjUva/ZTg2l5kmBqbzr38O5EB3UY+Y2ZAikzFwSl/HXL
         OY6DiE1OlFVrZqGznsiLWIUlJ2/Jxx0rOuICVhCfz1g/2ZmQGW5KPodrbR/LN9zc7iMl
         qCiTN37uspgd66C0swlyJIRl5+PTUfElMyRfw8jobm1syMDhlRDTx8T5vR8HT4Qqro6a
         i+J7eBCuNwVw0kmaGGOy30XndhNlV8u3QYDul+5Q5WJiZOfV2DB/7IRev5/oLnGYwHg0
         A2FvoIOmGVf9qX2ZL8dqOWrn3VxNmAnJvp7HblIXLPosrbEMjlH1cmZzvBvPiTVMQ8hr
         01aw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dt54-20020a05620a47b600b00706303ee940si9694413qkb.50.2023.01.19.04.36.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 04:36:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIU9F-0007Ke-TU; Thu, 19 Jan 2023 07:36:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU96-0007DN-9J; Thu, 19 Jan 2023 07:35:58 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU94-0007ee-Gp; Thu, 19 Jan 2023 07:35:56 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NyMYP01yjz4xN1;
 Thu, 19 Jan 2023 23:35:53 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NyMYL6tQbz4xHV;
 Thu, 19 Jan 2023 23:35:50 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 18/25] hw/watchdog/wdt_aspeed: Log unimplemented registers as
 UNIMP level
Date: Thu, 19 Jan 2023 13:34:42 +0100
Message-Id: <20230119123449.531826-19-clg@kaod.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119123449.531826-1-clg@kaod.org>
References: <20230119123449.531826-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZJ1tnPMG8A6b

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Add more Aspeed watchdog registers from [*].

Since guests can righteously access them, log the access at
'unimplemented' level instead of 'guest-errors'.

[*] https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/drivers/watchdog/wdt_aspeed.c#L31

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/watchdog/wdt_aspeed.h |  2 +-
 hw/watchdog/wdt_aspeed.c         | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index db91ee6b51..e90ef86651 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -21,7 +21,7 @@ OBJECT_DECLARE_TYPE(AspeedWDTState, AspeedWDTClass, ASPEED_WDT)
 #define TYPE_ASPEED_2600_WDT TYPE_ASPEED_WDT "-ast2600"
 #define TYPE_ASPEED_1030_WDT TYPE_ASPEED_WDT "-ast1030"
 
-#define ASPEED_WDT_REGS_MAX        (0x20 / 4)
+#define ASPEED_WDT_REGS_MAX        (0x30 / 4)
 
 struct AspeedWDTState {
     /*< private >*/
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index eefca31ae4..d267aa185c 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -42,6 +42,11 @@
 #define     WDT_PUSH_PULL_MAGIC         (0xA8 << 24)
 #define     WDT_OPEN_DRAIN_MAGIC        (0x8A << 24)
 #define WDT_RESET_MASK1                 (0x1c / 4)
+#define WDT_RESET_MASK2                 (0x20 / 4)
+
+#define WDT_SW_RESET_CTRL               (0x24 / 4)
+#define WDT_SW_RESET_MASK1              (0x28 / 4)
+#define WDT_SW_RESET_MASK2              (0x2c / 4)
 
 #define WDT_TIMEOUT_STATUS              (0x10 / 4)
 #define WDT_TIMEOUT_CLEAR               (0x14 / 4)
@@ -83,6 +88,10 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned size)
         return s->regs[WDT_RESET_MASK1];
     case WDT_TIMEOUT_STATUS:
     case WDT_TIMEOUT_CLEAR:
+    case WDT_RESET_MASK2:
+    case WDT_SW_RESET_CTRL:
+    case WDT_SW_RESET_MASK1:
+    case WDT_SW_RESET_MASK2:
         qemu_log_mask(LOG_UNIMP,
                       "%s: uninmplemented read at offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
@@ -190,6 +199,10 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
 
     case WDT_TIMEOUT_STATUS:
     case WDT_TIMEOUT_CLEAR:
+    case WDT_RESET_MASK2:
+    case WDT_SW_RESET_CTRL:
+    case WDT_SW_RESET_MASK1:
+    case WDT_SW_RESET_MASK2:
         qemu_log_mask(LOG_UNIMP,
                       "%s: uninmplemented write at offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
-- 
2.39.0

