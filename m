Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1470315ejb;
        Fri, 16 Dec 2022 07:24:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4qnud8h/+InAtGRU3T3YQq2IGheT9TzLY5RI4bzl17TnUswpCSxBFrMGRXBoXiroglMcNm
X-Received: by 2002:a0c:fbd1:0:b0:4c7:61a9:ab5c with SMTP id n17-20020a0cfbd1000000b004c761a9ab5cmr43406346qvp.25.1671204298540;
        Fri, 16 Dec 2022 07:24:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671204298; cv=none;
        d=google.com; s=arc-20160816;
        b=EZjPNtoN4zExDt3n8PN8Sdq1O6REP3+8N3tSaQvVgJD91Y23dtCErJiEYv5fr4zW30
         dr0MD6h17tvhcd87bMoXUhHAAASmXLe5mBveVtLXK1Djelx3s8ngHSEQjwvovhC6VAcI
         kOThT2/SBvs66kJcE81ej0HUoMwvWupC5lQOyIKLCkII8iEEo0C9FRnOUv8IXzprZdSm
         mlmjP2NOTfK3JP4Es+lV5IDYCXUxF886b9c7ckDS1Xvd4L8ZA+E/qzE7XpPFA76x3Iya
         4JFbbYnXW69hzIxsSQ8u2PQQ1xJLaFUV2WCXopBDDsBzkfeWvlmzYYWC+X2aRYIahGoh
         oxnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=WafTAAJogOWdkFpTF0q8FAoLgjZ785o76HD8t7NlFkQ=;
        b=U5Z6Fp0tuv3w0h6Al50LuICfDrVaCTe8X8bcMBUlvXFQxnE+1CpAq4DvhmfcSW0GY/
         kYrBeNfNObEwpJ1Ytc2b2ZxtEGnyOhibBE/4LWnalg8ILDkMF8vExhzxQZAY48UNyqgq
         Ooi48ni3cx3zay0Cg1blVJISW+oW+x/XLm73895XSLFMfkHVAQHD+dJ/Z6GDRC2eQM/R
         zHRDmdyE1FPfXIpA/j1hs6Y1/AX6CQMtTDpzQ23hEXVhg2AJbferApHEtYORsXjB6fkl
         StF6fVX+fczpGWINCZMKhPZ/hNJRJvV0IJsvH4+3mPuC6VTRuVAC2hRGBAb2vLhlGWJe
         Xz0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bYNOhOQ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu7-20020ad45cc7000000b004caaa358043si1264026qvb.1.2022.12.16.07.24.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Dec 2022 07:24:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bYNOhOQ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p6CZR-0002Hh-Ns; Fri, 16 Dec 2022 10:24:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6CZO-0002H8-Mf
 for qemu-arm@nongnu.org; Fri, 16 Dec 2022 10:24:18 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6CZK-0000wn-R9
 for qemu-arm@nongnu.org; Fri, 16 Dec 2022 10:24:17 -0500
Received: by mail-wr1-x429.google.com with SMTP id h12so2813086wrv.10
 for <qemu-arm@nongnu.org>; Fri, 16 Dec 2022 07:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WafTAAJogOWdkFpTF0q8FAoLgjZ785o76HD8t7NlFkQ=;
 b=bYNOhOQ9WX5/NSbIURI8/FBgWbyuHdV+lCOkcvP1UocLdMnVlBn2hcMPtZOp4YIcDn
 7Df5JhrtYkyZ2112TNcDWhVQIpqFydN/rMv9wHWHUJYGG3Sgp2gdb+MZSJRTqH4F4HBl
 /QCkcz17ZPMJIsXwKSh1+YyUnpRLbLpcEKyAvjaECbevdAYmjJXdlpT2gFdHp7h88sHr
 4G/uBmBV0s84NfJ3wRUllF+Cajqu6cf+rWpvkD6whdmCBA+DMsv6Iy7Fc4vwm6yEwMrA
 C//wm2Uw+d0GrvjkOcMZlYHRVY0cRsC3CHb77AitcthajzHvSYOacGYwzSB1anO3L6vj
 MQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WafTAAJogOWdkFpTF0q8FAoLgjZ785o76HD8t7NlFkQ=;
 b=xT7bwSWOAiZ2mCzg6gCMbILLSni4dH4lwmN8JmqloC2/Y6G/CCmYjuDGeLW0JiNYLH
 6mDmWwu2/LaoMUnkpHtVyRXl2dWKSW8NPkGF91hlJFIPyrjAIZgBaXuKW0zCoQqrubED
 GJ/iKFXBBj2jv2CDKMU+NZtkFb9GzjGUUjJ1M6rvbyGRe2K3yFGyCZHb2ryAxIvvO30t
 KoHSRc1a7WeZMVCjvIxkd4jxqwXOlBAv0MoBxbNZH8FtfGa4XoXLUiUzcQrJ0ZPMlgm9
 CYoE/FQyu5YPHaLl9xOgoCrGPE6JeVHqg4SV17q2/ZQI5jgLDBmpgv0ENc5iWydpap38
 +5Hw==
X-Gm-Message-State: ANoB5plzLO+ON2Hx0TZ28iTWfuqE+ueqeZ6TIIEWl/X2x3n5VrnCVy1E
 IkChD51hRy4f+zb0fWcRa2f1LBw8JA9Bq4+F
X-Received: by 2002:a05:6000:170f:b0:253:62af:8025 with SMTP id
 n15-20020a056000170f00b0025362af8025mr12350917wrc.61.1671204252745; 
 Fri, 16 Dec 2022 07:24:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a5d510d000000b00241e5b917d0sm2953008wrt.36.2022.12.16.07.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 07:24:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Igor Kotrasinski <i.kotrasinsk@samsung.com>
Subject: [PATCH] target/arm: Don't set EXC_RETURN.ES if Security Extension not
 present
Date: Fri, 16 Dec 2022 15:24:10 +0000
Message-Id: <20221216152410.1185369-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 9NIaZO0plFXN

In v7m_exception_taken(), for v8M we set the EXC_RETURN.ES bit if
either the exception targets Secure or if the CPU doesn't implement
the Security Extension.  This is incorrect: the v8M Arm ARM specifies
that the ES bit should be RES0 if the Security Extension is not
implemented, and the pseudocode agrees.

Remove the incorrect condition, so that we leave the ES bit 0
if the Security Extension isn't implemented.

This doesn't have any guest-visible effects for our current set of
emulated CPUs, because all our v8M CPUs implement the Security
Extension; but it's worth fixing in case we add a v8M CPU without
the extension in future.

Reported-by: Igor Kotrasinski <i.kotrasinsk@samsung.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/m_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 355cd4d60a7..2b55e90ea9d 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -895,7 +895,7 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain,
         }
 
         lr &= ~R_V7M_EXCRET_ES_MASK;
-        if (targets_secure || !arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+        if (targets_secure) {
             lr |= R_V7M_EXCRET_ES_MASK;
         }
         lr &= ~R_V7M_EXCRET_SPSEL_MASK;
-- 
2.25.1

