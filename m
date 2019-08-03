Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2200960wrv;
        Sat, 3 Aug 2019 11:48:15 -0700 (PDT)
X-Received: by 2002:a17:902:347:: with SMTP id 65mr42082851pld.232.1564858095443;
        Sat, 03 Aug 2019 11:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858095; cv=none;
        d=google.com; s=arc-20160816;
        b=stTtxk8J2xgDHZYUcLrdcT6mt8q8vNKZyeveGKAmUg8MLDE7ctuw2h8R5f5+h11hGa
         kRZKpwYw5kCTsHk9Fzw6Y6yH9YDeTFduebvmzqjYQD19K4xCVA1qgMeHI5RS5+AKhVZ8
         o/c3Ivg9sqYjs/4JNtnkY410UiFOFB1ymbc+I7k2oPuYhdFFbM9+m4afpzq4hJEB9nQ8
         Y9rhpKwFabvCJFBZ5X0ACRKtxulgmFtuKdvyC+z2husVZDUY1Yz7PleWbLBFBSC4G77s
         0pnUiDcpX2w0Ld246A0LERphMtZqyP8dSMglO1DcCp0GhzPR9GQZl5etEh4EYvqE8GSM
         ldYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ebweW1bxG4mlr4zUkxD0Pv+fcpZzn603jNjjqkso5Rc=;
        b=iiuIKylmbfDEju+S6DiJRgQZvls/GxFynpVdtH9joKyDwoNNoumHvuuVdnfgHxUcEv
         TtN/PcuJkLyU9h4CnIwczK+c7yi3Ln5VQ9BXa/bF4PxgPBziAcsBXB8XemnXSxsnHvoN
         t6YTTx9RELbtK5ClLQxAAS1YuJXYJfyz9/u0cK9nyLb5xdr9oIcny3GKeL8gctVGPsAc
         I8yR1qgoGdzPKIX3C8f66nmBUCSLz8Fo7RNeIyFKcuxMXRqL4LaXyN7VasX60u9geY/f
         stAHQQJinUnQ8zdwTNBHdnJ//+0vACB+GoiAsOJ+zULYNjMoiYd8B/Uuk3w2ScEYfzmK
         pgww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dO8sJijZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 9sor58673026pfo.45.2019.08.03.11.48.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dO8sJijZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ebweW1bxG4mlr4zUkxD0Pv+fcpZzn603jNjjqkso5Rc=;
        b=dO8sJijZ1OJHBbtBkNrBGZwgxZqhDR3pnZ17F4RG48Q+rZ2YYG+zmyWKMdUWJgYasD
         npGZFmyiQ+SppHzUz0YshpFHT2cj/buuGGrgh6aROftTUI9XolXqun8J9P5EhmWip+ze
         Bp0dYd2RLKbOSIOmH3ZOElHSGMHsJ0a+RudWjmrdPGtZNqYbT3WSKKumXM3D5Q5ZjFeg
         f0fLiQwKRm/adsq7n+R+xANG4DA6lWtGQfIIjrlDHkyRD2yTYz1fACiEGO3OxFEHVpED
         oErG27FbDZuX3lNsJGA1vopDmV4jeiHvqNwZlt49WL/y73eqCBV908eDQtKxRA7afIxZ
         eaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ebweW1bxG4mlr4zUkxD0Pv+fcpZzn603jNjjqkso5Rc=;
        b=DaJLqQIiHotFDF2LWgfq5fRbF8cJxu2BYUy++QgEy6BQcxOEQttO+FZiaEn19YZ6fk
         ++640Wz9FUiFezGPtO6U1cgEnq6DiBjl5FidIktVstG51MJjNLzCQeaUo7nTzoDVj/gx
         5SMi/BzwFL4KpfI5X/nyBclsIDoyV8Q0IPi2FtuXC05EQYL2CttC+ifu5Wqp/CZw52nI
         WCo06ZXJ7+o2HFizPEsweR3JeCMAlK84TwahpQzdTSXgbkPjdU9ee0FZdWNR8fPZ4MmU
         ItJEGjm7so0/CKWnFTKdWX13q4f+a5hlCSEJ+ZpNo9IKwzqxW8BzzhQiHEd43Maij0wS
         o2Og==
X-Gm-Message-State: APjAAAXA2U7IMsX7uKBC46KGZEfM82Ks9fR368LpFspvOG8h7ursqWpR
	zYjLrEd9H5XhU8FDNoooDCLutU+ovtIQ+Q==
X-Google-Smtp-Source: APXvYqzESc5O7rN+zLAS85mB8ekDyYCTLf/IJJ0EFezaffKKgvlIv9CQteMSbBvCYvSLesZLKBEGdQ==
X-Received: by 2002:a62:e710:: with SMTP id s16mr67733969pfh.183.1564858095005;
        Sat, 03 Aug 2019 11:48:15 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 10/34] target/arm: Update CNTVCT_EL0 for VHE
Date: Sat,  3 Aug 2019 11:47:36 -0700
Message-Id: <20190803184800.8221-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: a/oBaeQVJNnS

The virtual offset may be 0 depending on EL, E2H and TGE.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 40 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8d8b3cc40e..e2fcb03da5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2484,9 +2484,31 @@ static uint64_t gt_cnt_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return gt_get_countervalue(env);
 }
 
+static uint64_t gt_virt_cnt_offset(CPUARMState *env)
+{
+    uint64_t hcr;
+
+    switch (arm_current_el(env)) {
+    case 2:
+        hcr = arm_hcr_el2_eff(env);
+        if (hcr & HCR_E2H) {
+            return 0;
+        }
+        break;
+    case 0:
+        hcr = arm_hcr_el2_eff(env);
+        if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
+            return 0;
+        }
+        break;
+    }
+
+    return env->cp15.cntvoff_el2;
+}
+
 static uint64_t gt_virt_cnt_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-    return gt_get_countervalue(env) - env->cp15.cntvoff_el2;
+    return gt_get_countervalue(env) - gt_virt_cnt_offset(env);
 }
 
 static void gt_cval_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -2501,7 +2523,13 @@ static void gt_cval_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static uint64_t gt_tval_read(CPUARMState *env, const ARMCPRegInfo *ri,
                              int timeridx)
 {
-    uint64_t offset = timeridx == GTIMER_VIRT ? env->cp15.cntvoff_el2 : 0;
+    uint64_t offset = 0;
+
+    switch (timeridx) {
+    case GTIMER_VIRT:
+        offset = gt_virt_cnt_offset(env);
+        break;
+    }
 
     return (uint32_t)(env->cp15.c14_timer[timeridx].cval -
                       (gt_get_countervalue(env) - offset));
@@ -2511,7 +2539,13 @@ static void gt_tval_write(CPUARMState *env, const ARMCPRegInfo *ri,
                           int timeridx,
                           uint64_t value)
 {
-    uint64_t offset = timeridx == GTIMER_VIRT ? env->cp15.cntvoff_el2 : 0;
+    uint64_t offset = 0;
+
+    switch (timeridx) {
+    case GTIMER_VIRT:
+        offset = gt_virt_cnt_offset(env);
+        break;
+    }
 
     trace_arm_gt_tval_write(timeridx, value);
     env->cp15.c14_timer[timeridx].cval = gt_get_countervalue(env) - offset +
-- 
2.17.1
