Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp806514njc;
        Thu, 20 Mar 2025 02:26:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWKb+uK1xbm3P7vqJfUDibL6f87MHS6LRyibs2sIMPMD5bhygSHeMYCI132K2L4PniIPT9a/yCvbXprQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHlVbL+TDi8u4CJqX7Vhc6plXE4/Mw7RhTOvzntPB6syThNIhw9zbOiLnR6dWjeaku1IXNh
X-Received: by 2002:a05:6214:e6d:b0:6e8:fa38:46aa with SMTP id 6a1803df08f44-6eb29450471mr96219606d6.33.1742462811825;
        Thu, 20 Mar 2025 02:26:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742462811; cv=none;
        d=google.com; s=arc-20240605;
        b=KlFw8h8W4QXDcqVDG/KjELTVddWMGHRmIuu5KVdnLJqHoCNEhvcOiJKLzDpiHRqIon
         liqUjn7HEhqXNg/IFHwu3DWKRzGA7C27hlxtd1LKwwWCNPoUAigu5R/LcQgPPo1F0vuW
         LdL+0ie4BbPxtmy2C1OjHAupo9R3qIwRdbcK3wSlkzVXZatmYn0MLCaowIW8nWIZHTC6
         frTAghb5edYeZfjEfj2T0W1SEEFOFdqP/ernd/ljKJQhoJiZpzCm4h5gjXcfQidErAUw
         8FR9qlEbrz4t1JYnIduEm3WJ/MaWqGsc5IWa6p4f0XcXKTlBEIYWMjlPp6QYV+H0K2pu
         h/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=k740X9DjfJ8hYK/ToE8lrJo3He6hTEv9X+CCLNShLCo=;
        fh=2H4UoRS0/Ye3UKg2DXxfbzP6hSQr3XkUMWx9xhUa1ts=;
        b=SRJpx+XWU6a8MzJX1HCfkzyA+pXINIXlcOzOXycrAbxUMolEglDul3hA/HCqNYZrjr
         5Fft7zkg9nXrctihGoZVsfNa6BMq4ietUzq/zcpfQu24TUwu0rA8mP9gcO3wogpP/rPD
         ynJ6+I5YFl07lEQU0jFDuCL+82in/GWoPMsabempMeC/bNPmVYTZGGbAJK3X3XQOxRlJ
         N78d52458N7iFx0sWcJlteVO+5F3Y17xjpvLgYYTF6BAFiNityEbe1peTfFQCbUfIg97
         VfUIx7nFbAjl0VMd3edyinE799anx7yeXUAAzIYcP/tfB5JcYuHxqKZcKX2pgrgpGdPA
         VFGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade1ddec2si153057696d6.53.2025.03.20.02.26.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Mar 2025 02:26:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tvCA6-0001ia-W6; Thu, 20 Mar 2025 05:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1tvCA4-0001g9-93; Thu, 20 Mar 2025 05:26:00 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1tvCA2-0004k9-Pz; Thu, 20 Mar 2025 05:26:00 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 20 Mar
 2025 17:25:43 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 20 Mar 2025 17:25:43 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH 1/1] hw/intc/aspeed: Fix IRQ handler mask check
Date: Thu, 20 Mar 2025 17:25:43 +0800
Message-ID: <20250320092543.4040672-2-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320092543.4040672-1-steven_lee@aspeedtech.com>
References: <20250320092543.4040672-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: COMngneor6lY

Updated the IRQ handler mask check to AND with select variable.
This ensures that the interrupt service routine is correctly triggered
for the interrupts within the same irq group.

For example, both `eth0` and the debug UART are handled in `GICINT132`.
Without this fix, the debug console may hang if the `eth0` ISR is not
handled.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Change-Id: Ic3609eb72218dfd68be6057d78b8953b18828709
---
 hw/intc/aspeed_intc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 3fd417084f..f17bf43925 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -111,7 +111,7 @@ static void aspeed_intc_set_irq_handler(AspeedINTCState *s,
     outpin_idx = intc_irq->outpin_idx;
     inpin_idx = intc_irq->inpin_idx;
 
-    if (s->mask[inpin_idx] || s->regs[status_reg]) {
+    if ((s->mask[inpin_idx] & select) || (s->regs[status_reg] & select)) {
         /*
          * a. mask is not 0 means in ISR mode
          * sources interrupt routine are executing.
-- 
2.43.0

