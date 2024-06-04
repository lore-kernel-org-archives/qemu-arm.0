Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2718021ejs;
        Mon, 3 Jun 2024 22:47:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVYnaQ4gtT4//CvRC4HXpN99cIe2qT+pteFi/7YkDvqepReWnFfu0UhLwZ/8rzAixPRDLqM2SuN0QqJ9PpcXvKkt3wU2AGF
X-Google-Smtp-Source: AGHT+IHlmr/6DYsXSdtZhp4xtnw1ZzYCsCH0mKEMPZUH4pZEWMfIbha6OfOJib1QC8cNJzWZYZYd
X-Received: by 2002:ac8:57d0:0:b0:43a:712c:f985 with SMTP id d75a77b69052e-43ff54a4354mr151490111cf.56.1717480027369;
        Mon, 03 Jun 2024 22:47:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717480027; cv=none;
        d=google.com; s=arc-20160816;
        b=pNcUdLEn5zVIBI6LCdmpQyzP4Lm1Pe8RbvpXrqzzUhTS5bB7k2RQv/K4b6BHDh964s
         S1/q9oQIrxmLMpojm7HtPsN0x1rxCqAcUI2MOd12YorPfR1IQZNUKf++rb/IZuCsXtzK
         wfM8GNNJ3PGXJSUOyz7r9Aq+b0Jg6qRd155yDUFGI1E6DzS0XnMW9voJNofTuXHxTQIz
         f9j9s5TopzCvTHza9SOSbc0Qop/xI5W7SGs68Hf7bk0xVsLUQgo46X1vrUdNTODwbETR
         7XGjOm5nQjbfATni1nOZQDarbS85KJW0FzhK/Bf5Ll32XO1q/234iznvOakRSn7xpsr9
         xxcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=dh4FO6FS/XO2T0sxf0umpAesdmz/B0CDTGXlzISgHxI=;
        fh=4qsXPuPQQYwauqV4GBfUuJ135n2gY4LbnQu8KHliids=;
        b=nE6P4gsK8mzy7Z6xYfnFSFwMANoqHo2C18q3SsW9uwPPrhmfxhL52wFA042LkF2sx5
         CBJNQVfMI9+vmM+YMXaiyWXmTtxeiJAFJCWauP9WWxZEqm3ZvqpOZwp/SKQcAjUXVpTk
         RZL+GgQ46bTAtcMfQrqPR38oc/8OpZQwQMA8SvISp3GuLqJx9MTvM28bnaiLU5ewr5tF
         AfMb0VKLsOIuc0gh/etUW9w3R+GGEZgPu83C915kER33VGlQVqxfmaLGRZ/j+/r6rEOg
         F5NerKkhcq9ATyYcuLJcApurBZAALdumWJfbeh1qyVOpaLZiTPaZhu1pTonhg4pTrYE8
         Sr6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43ff25b7007si88175831cf.776.2024.06.03.22.47.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2024 22:47:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sEMyl-0005bG-Uk; Tue, 04 Jun 2024 01:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sEMyk-0005ax-8u; Tue, 04 Jun 2024 01:45:02 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sEMyi-0008TH-OO; Tue, 04 Jun 2024 01:45:01 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 4 Jun
 2024 13:44:41 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 4 Jun 2024 13:44:41 +0800
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
Subject: [PATCH v5 04/17] aspeed/sdmc: fix coding style
Date: Tue, 4 Jun 2024 13:44:25 +0800
Message-ID: <20240604054438.3424349-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240604054438.3424349-1-jamin_lin@aspeedtech.com>
References: <20240604054438.3424349-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /eTLJ2+56MQx

Fix coding style issues from checkpatch.pl

Test command:
scripts/checkpatch.pl --no-tree -f hw/misc/aspeed_sdmc.c

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_sdmc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 74279bbe8e..873d67c592 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -296,7 +296,8 @@ static void aspeed_2400_sdmc_write(AspeedSDMCState *s, uint32_t reg,
                                    uint32_t data)
 {
     if (reg == R_PROT) {
-        s->regs[reg] = (data == PROT_KEY_UNLOCK) ? PROT_UNLOCKED : PROT_SOFTLOCKED;
+        s->regs[reg] =
+            (data == PROT_KEY_UNLOCK) ? PROT_UNLOCKED : PROT_SOFTLOCKED;
         return;
     }
 
@@ -354,7 +355,8 @@ static void aspeed_2500_sdmc_write(AspeedSDMCState *s, uint32_t reg,
                                    uint32_t data)
 {
     if (reg == R_PROT) {
-        s->regs[reg] = (data == PROT_KEY_UNLOCK) ? PROT_UNLOCKED : PROT_SOFTLOCKED;
+        s->regs[reg] =
+            (data == PROT_KEY_UNLOCK) ? PROT_UNLOCKED : PROT_SOFTLOCKED;
         return;
     }
 
@@ -434,8 +436,9 @@ static void aspeed_2600_sdmc_write(AspeedSDMCState *s, uint32_t reg,
     }
 
     if (s->regs[R_PROT] == PROT_HARDLOCKED) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: SDMC is locked until system reset!\n",
-                __func__);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: SDMC is locked until system reset!\n",
+                      __func__);
         return;
     }
 
-- 
2.25.1

