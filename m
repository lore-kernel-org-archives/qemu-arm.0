Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5538460lfc;
        Thu, 29 Jul 2021 04:17:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz0VbLz3I5W+mikjfjZ8585w1PEvyu7ABncr3y9Zas3zwA/POyAjMd0f1w2oWROPDu4rx0
X-Received: by 2002:a05:6638:1356:: with SMTP id u22mr4063253jad.39.1627557453006;
        Thu, 29 Jul 2021 04:17:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627557453; cv=none;
        d=google.com; s=arc-20160816;
        b=P9VXX335dwysWZed0LKJi/Ym4GVMICzdJythUUtUPn/Xtm0k7HP4sMG3n991GEEPeW
         xeJzSaVrbWGXmRarLeJ/Ytf6cjRqnF0gj4h8+ox2q1Q4FeNrUPU5qUEjaM1G5BgTdHcK
         aGQF6VYoxLlqf8KqBaNjQvdF2TDEuAQTAYyj/Bdyr4djIqMdTXXc6R5A6hkYl5AbsZr0
         S3m6OSfmjpUAf8Vyd3BGqDtgwFPL2ZmXPQyApqp9USXKfbl2BXh4IjZmY0QV/bh0ueKN
         Ohxmp2vD8jYvKGguldpvrFyInCL8B0Fx2QGgHFQ1n+SAqS8V18KSGsnihtimQSaKx3Dp
         bVZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2AKLx+FAZSEHTDgotUySXrnfQs5xm57wonDC26WVk28=;
        b=A5kvkgMC+dOd0vHWq+AvN+Y6nLzcQfImuDNw7Ft5ltkT6jnps8rHD8iO2u2ammKrye
         N6Mo1+RIHQ0eQYiAuEktS2pfDAIisLRZ5KjTcPvhRdeGlfgYtm/I6mCfr82oNaLDT8E1
         IYzb9gW9Mpdalk2DNiaHPbAHMGjcwM6CaXt9rchnsU3fcdJG/5PaAM8YTgymbVVyr7Y6
         IhjW0Vvs1STe24DjgJ3FRoiRcumFzLNr+qOYK1SaInQXhMiWIOLnTgtSd/l+mshpK9Qx
         4aDo4XdWfy5GMr1swUt1RGDDWMYNHZxxHDdgUnAmdVCgKF5V6dw0DjruGhdaEB73M5XR
         tBnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="m/8jrRsI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n12si2241094ilm.119.2021.07.29.04.17.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:17:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="m/8jrRsI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m942e-00039B-6w
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940a-0008UK-VK
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:24 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940V-0000we-CP
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:24 -0400
Received: by mail-wr1-x432.google.com with SMTP id z4so6441385wrv.11
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 04:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2AKLx+FAZSEHTDgotUySXrnfQs5xm57wonDC26WVk28=;
 b=m/8jrRsIdWQaEvtiM0ZzsiP7w+nuqXtKnLnbQL/QIreJnepWWyOIrMQxJsrQzy7L3f
 wtBAzFj04ma9Fyo97gjRcLkfAE8qoOETf5rcQTGy3h1KKM2Zgv5rNjKxlZebZGiJEA7Z
 h9xDfd0/Pxr0A3d+OcwI6o4NIjxdsnbWFFCKEt9hYm5irFPO8UrO/Ton4ezT03Bwz6ce
 5ejtZc907GIR7G5aQVJqbX2+KHSvuZiFoTCn+1L86rvt8n/PmUPT9iL2mt8kLL6zJ71B
 r0OMFJHpxQLXvOiVuuSVDwXDlEh8BTynQiqQSpqFVuKmeSL1Tj1Dc8m4fjNf10mkREnz
 AZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2AKLx+FAZSEHTDgotUySXrnfQs5xm57wonDC26WVk28=;
 b=sKZFcu+E+aJ7aJXvqU2BeSTUkY9OrgmchHzAW2xgnhqt9m/Fe+Pw4lJot4AKa8eAO5
 dtbUFSaPsRtZYcUuBFAt8phQWC6CRkarQwfof8BsftIs0FXokL3iaENKCkLYLz1LVMyH
 50HAcvSW/jaEIwMwHsrmY0bGMlG9e3nOBvMNFRtHBlQNPJsDmqJo8QjaqtqNZAoL/66p
 WaRueLy+8PjhmhYY69JS2L2U9zMT7qWRuxB/9PCR3uXvA7Gk9Wezx8ba/5c7CD9erkkT
 Sc8LcmCOV+4WnxKHKgrOwptdOX3c26p5nfEzivRGjHBIB9MGRir9D0J9l0yS15be9FjH
 EDPQ==
X-Gm-Message-State: AOAM5331Fpa9eqSxOFtvqC7iiBYnH0Da4cD2+YcO2QxX291ppt9Xv4vC
 ZmbX4PLVGirHiS9xk3znHJ85Wovo2LHdAA==
X-Received: by 2002:adf:de8a:: with SMTP id w10mr4293021wrl.61.1627557318090; 
 Thu, 29 Jul 2021 04:15:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 04/53] target/arm: Fix signed VADDV
Date: Thu, 29 Jul 2021 12:14:23 +0100
Message-Id: <20210729111512.16541-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h8+0conjlX9p

A cut-and-paste error meant we handled signed VADDV like
unsigned VADDV; fix the type used.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index f14fa914b68..82151b06200 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1182,9 +1182,9 @@ DO_LDAVH(vrmlsldavhxsw, int32_t, int64_t, true, true)
         return ra;                                              \
     }                                                           \
 
-DO_VADDV(vaddvsb, 1, uint8_t)
-DO_VADDV(vaddvsh, 2, uint16_t)
-DO_VADDV(vaddvsw, 4, uint32_t)
+DO_VADDV(vaddvsb, 1, int8_t)
+DO_VADDV(vaddvsh, 2, int16_t)
+DO_VADDV(vaddvsw, 4, int32_t)
 DO_VADDV(vaddvub, 1, uint8_t)
 DO_VADDV(vaddvuh, 2, uint16_t)
 DO_VADDV(vaddvuw, 4, uint32_t)
-- 
2.20.1

