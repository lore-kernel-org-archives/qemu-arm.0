Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071574wrv;
        Wed, 31 Jul 2019 13:38:53 -0700 (PDT)
X-Received: by 2002:a65:52ca:: with SMTP id z10mr65885382pgp.424.1564605533504;
        Wed, 31 Jul 2019 13:38:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605533; cv=none;
        d=google.com; s=arc-20160816;
        b=MRFoMwVkFsp29r9n0f8ajaM1hcBWO5+ordIms4pbw60kVuzOkmGrynL3HRBzGJ0VYU
         lJ7LN6e2iSdnIXHQYILbsMVxXOxH2MSPMCDs0di2bEn1yhVPge+frXm1RMqLfQlyDlhu
         KV32JPVVFGuhPmCM6sntOWayPc9s4RH31RWnTHcSWABiKDkzG7DjvXNry8YUhTPFmcRm
         xmV8/QA9eS6SOJOt8/nxOCA9A+2GMfSefEMQTBkUdC76nO/mJLNY10l0PlSeV7O9rpIJ
         YEymyAWI4HRaTgpyBudfNnLevN5mokASAB3G3+PN7Muj2TaXcjLrjC+duVxIFzYbm/ao
         eKtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1OFhZYB7REGpAAmdzyA7otQ/hGEth32oUJ6nOIibRSY=;
        b=xSvi8CPgIzybf1eQZFUeKECx8A0ALrhLxz2BRLZ6XJs6XjFTlvtoY2BKtLuygoV4tF
         pDEu83sUNxyOu80GIEmuSMa7gPoN1OGQj5RV9ZX1yJGsepBplFlSuJxEgAri2Skdyw1q
         3Qu/oBbghQmSWj+rDijJoMe215cc8Fq1APtC1WExW3/wJ5FMOpnoM1f09GlZ2sx9L00W
         0zWIiE1hV+iP/wOAQiqQ4z1g9krCdDIXpm+ual6LUfVXi9U2dp/KKF/y1tQwoZ2go+Ut
         73CXkOgrC0a+TQj1+umhsE2xi5X/j6MaWZi1oCpizVgf9RXniqPOtNjfI6+nDLUAmfjM
         T21w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NDf7QpKn;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 190sor50636069pfc.65.2019.07.31.13.38.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NDf7QpKn;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1OFhZYB7REGpAAmdzyA7otQ/hGEth32oUJ6nOIibRSY=;
        b=NDf7QpKnwte7o2e/AQwdvefCheNM2JdcDcBOF3wBDKoSgnTGFpCO9saXeQGplF+LTO
         pQeKjSPhi4mSD/xCCu8EReRtXylQ4qDXgMtQ6/pFUUqkBxhBGT7FX0Ys7NVUU5Irf0vL
         OQpPbWODiN95XCblrujJIMXYzVhYePWixrN3JAsghy5vnHTnvu6u/bt/+K6dtQx6HlHI
         xYaL+1H47ngKC9c4g9inXLp+PCRlaxa06Sk4PZLMzKdYA4T8VBg59Ucq/e7F0gplKOhm
         IvoTDlFg56dZD93W0+jiPZa3X2p3XAYbozan0337sMlmGrQoIguBwzz8vNGHqBqoHe58
         eO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1OFhZYB7REGpAAmdzyA7otQ/hGEth32oUJ6nOIibRSY=;
        b=IsdCbn/ajv6K6H34KkB88t2w0JTHIGkU3qpXz+S3F4bCGyq9omuyb/vdz44dF4Ft4l
         asSlK4RJjp3qJptc2ZLUIEXMkEV5sgPELfY7hIv8XuLWqim0f0rpGRs9YQVWwvB9vepf
         XGS229t3vrCh/MXCz0JPQy8k3ZLRn2pZ56OSAazkUnyV6DEawlHrROwAnLxKitLZbn88
         vGo2jHped+84djJmEu4XUciYE/qEEVL+bfYLB7EEJcD71fEa7cjik1qMCOGHhE1Z/wk2
         +YYe3Vmz70GSxT+fNjYVkbG2CdzC3126tgFpEIJmHQQl2ELgKv4XNhIbhE7Ixwd6SB7R
         1uuw==
X-Gm-Message-State: APjAAAVB+3WkH9yjpLWvGvkQmyLQBNWWwI/Xb2RTF62vf07I3ZRcgWaw
	2FzUeRUGXk6/q6nj9Rd9LZR7WIKb
X-Google-Smtp-Source: APXvYqxGYhWlVndlnlNldzfoXAoz0yztGfhbJKW3XqxS5inma4EnKr9T7KDJpzdp8PCTG2s3KVThDw==
X-Received: by 2002:aa7:956d:: with SMTP id x13mr49793061pfq.132.1564605533112;
        Wed, 31 Jul 2019 13:38:53 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.52
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 31/32] target/arm: check TGE and E2H flags for EL0 pauth traps
Date: Wed, 31 Jul 2019 13:38:12 -0700
Message-Id: <20190731203813.30765-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LirAX5zP3IgQ

From: Alex Bennée <alex.bennee@linaro.org>

According to ARM ARM we should only trap from EL0
when TCG or E2H are 0.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/pauth_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index 42c9141bb7..9fa002068e 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -371,7 +371,9 @@ static void pauth_check_trap(CPUARMState *env, int el, uintptr_t ra)
     if (el < 2 && arm_feature(env, ARM_FEATURE_EL2)) {
         uint64_t hcr = arm_hcr_el2_eff(env);
         bool trap = !(hcr & HCR_API);
-        /* FIXME: ARMv8.1-VHE: trap only applies to EL1&0 regime.  */
+        if (el < 1) {
+            trap &= !(hcr & HCR_TGE) | !(hcr & HCR_E2H);
+        }
         /* FIXME: ARMv8.3-NV: HCR_NV trap takes precedence for ERETA[AB].  */
         if (trap) {
             pauth_trap(env, 2, ra);
-- 
2.17.1
