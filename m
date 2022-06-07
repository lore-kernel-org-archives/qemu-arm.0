Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2404634lfb;
        Tue, 7 Jun 2022 13:40:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvSvtnn7RmRscbkmLH0E/0jY641lNUhIwNEiX4FELThRXLEfEnaoAG4jTH4Vnb4ivSMP07
X-Received: by 2002:ad4:5190:0:b0:464:4f18:8f8b with SMTP id b16-20020ad45190000000b004644f188f8bmr36687840qvp.91.1654634433435;
        Tue, 07 Jun 2022 13:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654634433; cv=none;
        d=google.com; s=arc-20160816;
        b=gK8ouDDt2PDSSVuK0zNmI63NN1U2t+Q5/sJ11V9QzSAwMf42/8gwS0NHlv2UNWNsW8
         N5J2CUO3Wwit51XXaZOOio0MKC+xHULwBP1CQwbWwAwXLrvpc6jZZMWajsA20T951QxJ
         Myho6gnW3gz+M9efeVxv0Driam/7cBLGf4Ad4Zf3ptXbq4HBBFlOyDTZw8l+DeU2l0VY
         jfRsP3bqCEg6f+h+FzH0HbczaK7V+W+lKAD9i1zUyIgqYIWG61ciFS5RDE0V+3QVBmBc
         RGaMKBPrRlnvxGkFESQRsnzvsIY6w2Z66+Oc4yWp+3w0aSP4jmJ6X3dEXXXEQ3Hru/H8
         OOIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ReHRR17phjztnIWJ+KLGspDttklUzkMcS8o12wYY8cA=;
        b=r60bZvnMVVMmt1VjR2BBLnD9JsgEWMA9qdUpei3bZ9enUNc6/NgEcQGeuHrzvH9kPm
         4dPwrPN6tSe/VhQ7EAvPNW5+4u2yTtu1zfcvYC0KXjW/Zu2dKuWDzYqg2yhESk5FMfp2
         MWYfzcc8yY/8SBUJGlK02iGsH1ToAq1Fef6G0maQlIm1UE/xAD2f4akPr90Rcv8BFgzM
         btVwnJuJuL4ot7h0R7hlLL9gPILQyUQKMAMMWIfkdlHf9Yw6W+GNaK3TZrR89dLXeXxT
         oHAsGJSwcAnR31FY24dWGaKi0YRs+ez+AaniSqun+yO4OAf9OT1HVU4NRgr/OI9x2e2p
         w58w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e9BN7/xS";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 89-20020aed3162000000b00304a5c5f331si8520579qtg.595.2022.06.07.13.40.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 13:40:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e9BN7/xS";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyg08-0003Hh-SX
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 16:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftD-0007WL-TS
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:23 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:44594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyft7-0007ES-AV
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:23 -0400
Received: by mail-pf1-x42c.google.com with SMTP id g205so16481156pfb.11
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ReHRR17phjztnIWJ+KLGspDttklUzkMcS8o12wYY8cA=;
 b=e9BN7/xSLuPtXuL6vRHjV9as0GFq/GnZODWXpriRnrJm3RvSAsqX9AdN8nZTIHxB+C
 DJ5LfEsRqjkCGIZ29Qoj8GEKwIvVcUbV8Eh9lqbIW4tE1zdpjNnJAbxi3RjN1JwofBft
 Tz9lZF+IwOIbawWLp88v8Xtc2pC20y+tx3+HfBvVjfm3zWRmmIFvNSGVw+lWI56B4K10
 9fWOCzW88C6CumY6yK3MW504OkZT8ffKjbKdVG51lvYRzNDqe6nKa3PHksjZrJVHEnOE
 actxDmItbH/BF0XO2XMJVi3LQJd4VipkRForI2JcrwwykY1v2+wP/Mmotqu4RL+d/VrL
 LEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ReHRR17phjztnIWJ+KLGspDttklUzkMcS8o12wYY8cA=;
 b=bhZDj/sWcQk2xglF9JQWcX3CUIZ+zhIrbzPFF1q7VB0MaxcwpK4IMUHHldf2DOpq1a
 meUjU0UroPAwjHk+p00aFL815ALyCwCN6sD+Nv6I2fHJzMeb1/iE2AzlegHCMa+U8N2x
 xhXSlKJUvPWC+bhtAxJyXzP6GCT7mElDMGZWyykZ4tLXojk1vNiS6TyE2FGJ2GMYwfj4
 VrD0/iqw2YTwBDCLw9pf3m5YGtx+zsf9tJhb/vecsPWEf4BpCSHLQ66dY2vE8cl+/pfW
 zsq4SPU3ukU8Jgzly0FetPbqotXCpSKTPylJzmnr9W9VmPiC0c34GviXr3fQNSS0/OEg
 Q7bA==
X-Gm-Message-State: AOAM5315nW4+vVYMSSanKLsEnEzA/uKrguRFhHIlEJrmJSZdHzQdhtqO
 K4K+wfkr95xz0rFv4oe3Q35Uwv9cMgvw/w==
X-Received: by 2002:a63:5607:0:b0:3fc:910a:15e9 with SMTP id
 k7-20020a635607000000b003fc910a15e9mr26964535pgb.553.1654633994692; 
 Tue, 07 Jun 2022 13:33:14 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 08/71] target/arm: Hoist arm_is_el2_enabled check in
 sve_exception_el
Date: Tue,  7 Jun 2022 13:32:03 -0700
Message-Id: <20220607203306.657998-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v7B4DtXPloAZ

This check is buried within arm_hcr_el2_eff(), but since we
have to have the explicit check for CPTR_EL2.TZ, we might as
well just check it once at the beginning of the block.

Once this is done, we can test HCR_EL2.{E2H,TGE} directly,
rather than going through arm_hcr_el2_eff().

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7319c91fc2..dc8f1e44cc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6193,15 +6193,12 @@ int sve_exception_el(CPUARMState *env, int el)
         }
     }
 
-    /*
-     * CPTR_EL2 changes format with HCR_EL2.E2H (regardless of TGE).
-     */
-    if (el <= 2) {
-        uint64_t hcr_el2 = arm_hcr_el2_eff(env);
-        if (hcr_el2 & HCR_E2H) {
+    if (el <= 2 && arm_is_el2_enabled(env)) {
+        /* CPTR_EL2 changes format with HCR_EL2.E2H (regardless of TGE). */
+        if (env->cp15.hcr_el2 & HCR_E2H) {
             switch (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, ZEN)) {
             case 1:
-                if (el != 0 || !(hcr_el2 & HCR_TGE)) {
+                if (el != 0 || !(env->cp15.hcr_el2 & HCR_TGE)) {
                     break;
                 }
                 /* fall through */
@@ -6209,7 +6206,7 @@ int sve_exception_el(CPUARMState *env, int el)
             case 2:
                 return 2;
             }
-        } else if (arm_is_el2_enabled(env)) {
+        } else {
             if (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, TZ)) {
                 return 2;
             }
-- 
2.34.1

