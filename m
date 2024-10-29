Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp106343njj;
        Tue, 29 Oct 2024 02:18:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVi/DJDv+aebTO5vY/oX0u6dJ/8tNf0C6KUMDCd+eRjheIbdigGHkvvFLheGvGjp26twmxi3xLU+/g+hA==@linaro.org
X-Google-Smtp-Source: AGHT+IE2wODH3Cr0jJOubNhYJo+R/+5OXhMurjfnMz0KJ2xArr9TfHMtYs98918qWNigjNv9qj4h
X-Received: by 2002:a05:620a:408b:b0:7af:cb6b:b4fb with SMTP id af79cd13be357-7b193f359femr1752487885a.52.1730193493594;
        Tue, 29 Oct 2024 02:18:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730193493; cv=none;
        d=google.com; s=arc-20240605;
        b=P9ZFqMmCLndGm2WdbKoIprGtgFaoi/DTwCwd+wncCmoUsu2XPFVpmaYpeTYf1vKIMi
         x2LxI4ZAD7TQYx/ULkAtZlBqPwdfSQ/DED2GpelMQ+yLoFUoeVUi2rXc0ZMDmrDHkV/6
         9k1Y/hA4RlEpVLNZl9s3z4fCRZ3OI14kUS+V6fzwtlUYVTT78M2xuelQHxrPiMLaKCLi
         stoVVNI5Xd30bQEGHPsOVXB+Y2cUCaU1jpSicoChTNgj3fPEKi54MUAW8bd3JRt3o8fm
         NXjhix83HxglEK97Chcad4rCa8zT/IBKB43kFkn1TP/8k93JHFSNbMqccp5pE1Gwx/4X
         fgIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=7M3jkkJV5t7WdcYTAhIPytPWTzFHwNKoz/pNBmkAt24=;
        fh=4rHsaFhVkVMXk5u1IVZO4usPBujjRbqK1KMv0eZ+6CI=;
        b=flmv4N8BFSApFSleyI34ARJTLb3QLuOAwNvCusoYEhFGbn4xC5qOTamytBAOAIs7JZ
         QV3v6s6pVKiUF1YNZml/SXrWxn1QNFvCfn4vMYyc18o5EYovlmVzUMBEV/GbWEy28Qna
         2rrJwYxt57l4PEhF7KRw/wyTD/kB8SZpF7M2ClAiJveHm70pbpjWfa78Xkc97sFnmRx5
         hYCrqtL2dGWOWv4cAA3BH3YuYqGsSPQqpwd7aL1DDSnzvYw4CPQ45puEhcWZnk7aw4di
         J0Rq5zGoWpIGglC2xEPWbvJed35PdII1A9fDDhjR/GShWx3oaT/4HEmXlH3owQT6wrRQ
         36pQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b18d37f4e1si1042572185a.713.2024.10.29.02.18.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 02:18:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5iME-0000Xg-Qi; Tue, 29 Oct 2024 05:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t5iMD-0000X6-Ne; Tue, 29 Oct 2024 05:17:45 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t5iMC-0003A3-6D; Tue, 29 Oct 2024 05:17:45 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 29 Oct
 2024 17:17:30 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 29 Oct 2024 17:17:30 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Bin Meng <bmeng.cn@gmail.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:SD (Secure Card)" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 2/8] hw/timer/aspeed: Fix coding style
Date: Tue, 29 Oct 2024 17:17:23 +0800
Message-ID: <20241029091729.3317512-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029091729.3317512-1-jamin_lin@aspeedtech.com>
References: <20241029091729.3317512-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PcU299UKY2kT

Fix coding style issues from checkpatch.pl

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/timer/aspeed_timer.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index b1f860ecfb..5af268ea9e 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -276,7 +276,8 @@ static void aspeed_timer_set_value(AspeedTimerCtrlState *s, int timer, int reg,
         old_reload = t->reload;
         t->reload = calculate_min_ticks(t, value);
 
-        /* If the reload value was not previously set, or zero, and
+        /*
+         * If the reload value was not previously set, or zero, and
          * the current value is valid, try to start the timer if it is
          * enabled.
          */
@@ -312,7 +313,8 @@ static void aspeed_timer_set_value(AspeedTimerCtrlState *s, int timer, int reg,
     }
 }
 
-/* Control register operations are broken out into helpers that can be
+/*
+ * Control register operations are broken out into helpers that can be
  * explicitly called on aspeed_timer_reset(), but also from
  * aspeed_timer_ctrl_op().
  */
@@ -396,7 +398,8 @@ static void aspeed_timer_set_ctrl(AspeedTimerCtrlState *s, uint32_t reg)
     AspeedTimer *t;
     const uint8_t enable_mask = BIT(op_enable);
 
-    /* Handle a dependency between the 'enable' and remaining three
+    /*
+     * Handle a dependency between the 'enable' and remaining three
      * configuration bits - i.e. if more than one bit in the control set has
      * changed, including the 'enable' bit, then we want either disable the
      * timer and perform configuration, or perform configuration and then
@@ -582,7 +585,6 @@ static void aspeed_2600_timer_write(AspeedTimerCtrlState *s, hwaddr offset,
     case 0x3C:
         aspeed_timer_set_ctrl(s, s->ctrl & ~tv);
         break;
-
     case 0x38:
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
@@ -623,7 +625,8 @@ static void aspeed_timer_reset(DeviceState *dev)
 
     for (i = 0; i < ASPEED_TIMER_NR_TIMERS; i++) {
         AspeedTimer *t = &s->timers[i];
-        /* Explicitly call helpers to avoid any conditional behaviour through
+        /*
+         * Explicitly call helpers to avoid any conditional behaviour through
          * aspeed_timer_set_ctrl().
          */
         aspeed_timer_ctrl_enable(t, false);
-- 
2.34.1

