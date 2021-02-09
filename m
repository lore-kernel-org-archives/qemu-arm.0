Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp353879lfc;
        Tue, 9 Feb 2021 05:21:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCrYe3foOBNk994AH5T6qEiCnyC6ifqHsW/a3xYixLfavDV7pHuFPqNPRcVaKHtqpTNs11
X-Received: by 2002:a5b:488:: with SMTP id n8mr13592010ybp.224.1612876900658;
        Tue, 09 Feb 2021 05:21:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612876900; cv=none;
        d=google.com; s=arc-20160816;
        b=b4vgZX95R/Cny/QYwNjfdtzuj1rZQc7deXkQiZO59g2qMLQJRseCUup2cgLD6NLPSf
         rDy1jpSV/W7j3PxumbL/Spk29sxqlx/mFRDJJ5mRpzYfgROwCFwKByBw9CB8X4xL8Tt8
         hnhz8u9LlJm889u2u5sBSG/F0zZzASUmqgH/ixd5FxV83TbdQrA25+85qj9ZaMguquc7
         nW8aj9JX6eb9gPGeCuAOlKG/TbrZxGdeV4YwLekgPJKxitv+BOYfNI4z2PBzxKl/zdtX
         oP2oFZFgwBmzOitmvrDaNjqTCo6hdZo4vanQcF5EziKBLwL2GgdhfTNPSeOQOOluXtAp
         eZfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RQnHSU5URki5Eoi1GvfEMafAg4qrSv6IwWbelkI4His=;
        b=rSKfIBQaSYT7FEcZkZUf/qFN+RrzCBT+SwnUcp22HUB8t1LgdPGkv+2uTm23mnsasS
         BGa43Hb1RSL9Io5anr6nVMbSng1hYU9ZGkqydHXiTtSeFyM/rBYOp+pRAxwUo2xWZvB0
         agElD/m3ADzQ2W9JMtOSDVL51GVP2IUvDat/vBlBLC72U8YBctzqAFdw4tjf403DJSUA
         FlDgjuchoEM7uDRXyR9SpxqP5mrru3DFaJphBSm1LDLf1Ewux0kKxVxc27PQqZdlJXBT
         J15t5amKQr5mkeYSdcGAA+RsjuHnpWCPjpzfgUAiNN9WvjIWf1r6flQnQmLDymji6YYo
         G6pA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="eekVPp/C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p127si19074037ybc.19.2021.02.09.05.21.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Feb 2021 05:21:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="eekVPp/C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9SxY-0003IH-1i
	for alex.bennee@linaro.org; Tue, 09 Feb 2021 08:21:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Swr-0002oo-JY
 for qemu-arm@nongnu.org; Tue, 09 Feb 2021 08:20:57 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Swj-0000m0-Gd
 for qemu-arm@nongnu.org; Tue, 09 Feb 2021 08:20:57 -0500
Received: by mail-wm1-x329.google.com with SMTP id i5so3105773wmq.2
 for <qemu-arm@nongnu.org>; Tue, 09 Feb 2021 05:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RQnHSU5URki5Eoi1GvfEMafAg4qrSv6IwWbelkI4His=;
 b=eekVPp/C9p6r8Vv1bvidh5JjtT5UYSt+vsgApr3nfh84RAaSvnD/6OKfx3K+tcCuCR
 riuYCYES6FN+KlUeWd83JvS/tlphQg1PkS38P3epX/v/0GBcxhHKxwfMtsiigjF6aq2+
 lbSRL4Pe8v+tiAopoakCQKbNveVHmaSx6Uj5rUXIcxIucOJyBzbFWh3adDJnHWRXHqNM
 1Up7NyRhMsMXmPewbucxS7K0Uuac2p5i1ttMOFqpqBWPTlHKI0SAvEq8iF/97cHi+h+c
 WTwWof2XitOZhCetL6ccuau3YcbooBsqPDMTmD/f6T/sbHbs+OwmNnNCHxSeXchVcOJq
 G2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RQnHSU5URki5Eoi1GvfEMafAg4qrSv6IwWbelkI4His=;
 b=VPI8A90bIMjYfgaqz3oKWdHxpFEvfNKeef5HpquG5qnzDYRCIOx8XscxyU7uTdssvE
 d7UN6I53oKF7NCDVhKP0P1dp0HY9xlVMqAYfaI3mWTthdhzT9NuVtsjmhOpqo9BQSMoa
 2buRf4gVImWwlfNVBuykE08N8PT6I8Vzk+VreAmd6BtINp6MR0v8w5lEwR8IfHVp4hw9
 xHqzbuYdStRbepeZMUjv8THyaODlLrdWMXtA9Vd7GH7H2eFXmDLOJ6+qLB3qK4te6Cce
 Hvx2QJSVKtTGgLT2hzr+k2hWe5A9zBVyBL+dIFCT1YOlYOAumlr4PkSHK91JCN0KzIWs
 WKJw==
X-Gm-Message-State: AOAM5328/le6cxKGQIVcGtZRANc8Xm0cBdm9mBqIdL7U00CohUb7l5/1
 u4jpx6colBuFkW9gga3K5qoMTl9LH6kxIw==
X-Received: by 2002:a1c:1d8b:: with SMTP id d133mr3431989wmd.172.1612876847751; 
 Tue, 09 Feb 2021 05:20:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm34752472wrh.16.2021.02.09.05.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 05:20:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] hw/timer/npcm7xx_timer: Use new clock_ns_to_ticks()
Date: Tue,  9 Feb 2021 13:20:40 +0000
Message-Id: <20210209132040.5091-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209132040.5091-1-peter.maydell@linaro.org>
References: <20210209132040.5091-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Tyrone Ting <kfting@nuvoton.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mwS+P7Sbdl85

Use the new clock_ns_to_ticks() function in npcm7xx_timer where
appropriate.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/npcm7xx_timer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/timer/npcm7xx_timer.c b/hw/timer/npcm7xx_timer.c
index 4efdf135b82..32f5e021f85 100644
--- a/hw/timer/npcm7xx_timer.c
+++ b/hw/timer/npcm7xx_timer.c
@@ -138,8 +138,8 @@ static int64_t npcm7xx_timer_count_to_ns(NPCM7xxTimer *t, uint32_t count)
 /* Convert a time interval in nanoseconds to a timer cycle count. */
 static uint32_t npcm7xx_timer_ns_to_count(NPCM7xxTimer *t, int64_t ns)
 {
-    return ns / clock_ticks_to_ns(t->ctrl->clock,
-                                  npcm7xx_tcsr_prescaler(t->tcsr));
+    return clock_ns_to_ticks(t->ctrl->clock, ns) /
+        npcm7xx_tcsr_prescaler(t->tcsr);
 }
 
 static uint32_t npcm7xx_watchdog_timer_prescaler(const NPCM7xxWatchdogTimer *t)
-- 
2.20.1

