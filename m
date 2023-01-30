Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1150622ejb;
        Mon, 30 Jan 2023 10:28:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt6Kl+naCn4GjmropYDK5RYhu1g42XAeXVq8bPVt3VwpfUvbIoKJ0fHN2mNxPZ6sJsVMF14
X-Received: by 2002:ac8:58c3:0:b0:3a8:1635:ae5e with SMTP id u3-20020ac858c3000000b003a81635ae5emr91976122qta.39.1675103298387;
        Mon, 30 Jan 2023 10:28:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675103298; cv=none;
        d=google.com; s=arc-20160816;
        b=GIQ1okND5j92iePAJ/Hn1gRAtzAkWz2fEbmyHmn84T4//pCaKAY0ps+eO/sKcW1mj5
         Pzj53vWPzEbXzJtBCpreIqxrqxzVB3Jw1TU3S69dM3XRQFyxyGOqDgKirRfkd672pSl1
         V596JDFgu5M5FJcWJsnvqd8EuNQUMuIGf0FvK0ZEnL62wRmPdq6kaF+jkb7CrFDbBc23
         xGCA2MTBPDJ294yNVZqEqNX+ZNA5qYbplnGCuwciYk0z3hjWLbEqvDmDvBJRweYCNzOt
         4TSn2pyPlQPZjSRnIa7n56Fq5ZggGwBgJlWAUcpUfyvSCcKTRfvwat87kNNjTmAsD7jj
         nJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dmGYMqKT6htGJ/lTyLu1tD0GGum+71lym1RaJ3XxWLg=;
        b=wlp2j5AgbAgfCslwHMDTdJemXKPdB02MI19gicg0zSfG0oCBhHCWBDeGzeGZx5SWwY
         W4OymARI+lWAZkm+NhbJSbTEAqauF6qt4jJOM6e/sSn1gQYJLk9XRuJTs87+zTBgGE+d
         ugltyzfiiUX0wQpLVo8OlTrBhpADK2Kv0/hAa68xQirFwc+XFonmEglgEXPl57PVpVIo
         BuVac3b8OUuoF2EgfWewzeTj1b8sGm0RyELaeqNTY40Vh7L/T+zjElOPUOboh9hVYGuc
         Zt1E4o0Df6G8zJJk0SFX/0HgFsO2Misax5t7xTEqzOpLCah+f5QcdTBAuI8E95Bm4oK7
         Lcbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H1y2mzdO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16-20020a05622a139000b003b96ffcbb43si711308qtk.673.2023.01.30.10.28.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 10:28:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H1y2mzdO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMYqM-000199-94; Mon, 30 Jan 2023 13:25:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqB-00010x-PS
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 13:25:16 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYq6-0008PW-8y
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 13:25:15 -0500
Received: by mail-wr1-x42d.google.com with SMTP id m14so11521982wrg.13
 for <qemu-arm@nongnu.org>; Mon, 30 Jan 2023 10:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dmGYMqKT6htGJ/lTyLu1tD0GGum+71lym1RaJ3XxWLg=;
 b=H1y2mzdOHOSORIQzj9iahYah96m2hGwyd6xypXMOvmgTru8xwnE5zFV8LchVpO30lA
 U/Jam26NFhMQNJQSsBrpKRfVQIXe4y7W2ImwaUXpi5b1J7o1nLw0NMsl7S/cAfe73DmX
 kA3Lc1uiSUzSwDh33nbodFqtJwl4EJGypkVXUQy/CnFWP9tu1V1/u155kp9WrOIRdMCD
 QayWnPSqsuFVrZgs+meJYwZif/f93f0HkCLHK+UE7dD9PhF/PqipXZrGMxJMAe8nKfk1
 L2zRt9+AzbHZJrqb24/nSoL+ojGP+tcz2lVrhjn4oZCgPRq99FEBOY5Dt8YWzCaJIP5O
 pGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dmGYMqKT6htGJ/lTyLu1tD0GGum+71lym1RaJ3XxWLg=;
 b=rbP3TfffnMy/5Lm89j2Rf4TkTQOpLnjGdX+/L+uNRtfwi56qRshhGFlsSrgbgG1diy
 bSAmMcGTO0ZIIiqOnV+qh5SnVbu9GCWwBGb7PuK7ve0DVRvCXHDfjeHdioBSq6mFp+vg
 eSAXGVJZCv/OCgRn8hwAKdEdi9BJBLscJbexZCcryQXvVZ/aNPmZ1Aa0iuxCNj5n2wlj
 F+ohbE2H9aOxQK+n9EzdZfL8qbsu9kMrNwh5au46xEAkFjU1OfSAbSn39zu9NGA1ECBv
 3KY1bauwONdtoNfHypGfs6KA1HNsJ8dzWTeVwfMx/dWm5uMWqkq1XDZ3zNOTR5gH51Ji
 re4g==
X-Gm-Message-State: AO0yUKVPQT/HEjvh/3iXCh06P9ci6cWaplwRgTA+yVMSTZckb11Z6Iga
 vfiKMAFGsNG9cu37Ph2tHbOnN9KSBuh9eAgi
X-Received: by 2002:a5d:4dc1:0:b0:2bf:b2fe:a2ca with SMTP id
 f1-20020a5d4dc1000000b002bfb2fea2camr21536087wru.20.1675103108515; 
 Mon, 30 Jan 2023 10:25:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 07/23] target/arm: Disable HSTR_EL2 traps if EL2 is not
 enabled
Date: Mon, 30 Jan 2023 18:24:43 +0000
Message-Id: <20230130182459.3309057-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HP8ulIhh+E0x

The HSTR_EL2 register is not supposed to have an effect unless EL2 is
enabled in the current security state.  We weren't checking for this,
which meant that if the guest set up the HSTR_EL2 register we would
incorrectly trap even for accesses from Secure EL0 and EL1.

Add the missing checks. (Other places where we look at HSTR_EL2
for the not-in-v8A bits TTEE and TJDBX are already checking that
we are in NS EL0 or EL1, so there we alredy know EL2 is enabled.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230127175507.2895013-8-peter.maydell@linaro.org
---
 target/arm/helper.c    | 2 +-
 target/arm/op_helper.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6f6772d8e04..66966869218 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11716,7 +11716,7 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
         DP_TBFLAG_A32(flags, VFPEN, 1);
     }
 
-    if (el < 2 && env->cp15.hstr_el2 &&
+    if (el < 2 && env->cp15.hstr_el2 && arm_is_el2_enabled(env) &&
         (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         DP_TBFLAG_A32(flags, HSTR_ACTIVE, 1);
     }
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 7797a137af6..dec03310ad5 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -663,6 +663,7 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
      * we only need to check here for traps from EL0.
      */
     if (!is_a64(env) && arm_current_el(env) == 0 && ri->cp == 15 &&
+        arm_is_el2_enabled(env) &&
         (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         uint32_t mask = 1 << ri->crn;
 
-- 
2.34.1

