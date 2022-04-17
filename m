Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1281057lfk;
        Sun, 17 Apr 2022 11:33:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/60cniiScpmEwtu+PbZ6cERX+FWojYH+koKRND7IoNj+6DRQHdZV7n0rd5yQMMATG+x67
X-Received: by 2002:ac8:5a86:0:b0:2ed:1434:4492 with SMTP id c6-20020ac85a86000000b002ed14344492mr5114827qtc.17.1650220385974;
        Sun, 17 Apr 2022 11:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650220385; cv=none;
        d=google.com; s=arc-20160816;
        b=xUu488kJhdO9pbL9xr6+PHACjtPXHdVANtesmubWyMmBk/rUMUlcqjOjl6qa9FPgpa
         GuvKSRdgSPwRIBzutMLlZao3jCH7AWQxdbea5pLr1NutEzyes5Eb9lm9Y2NyBvZZnnyc
         4YYej6+pmzYQw06k7Ry9RASUxkEJEVraOIbneIMHX5GB9nkneDRhJY6giQuApSwViz00
         lMRtewHZJ9CiJjTwXpjt2bcPqo9mWFLVqFLBvnIRqUeg64eqPR5rDw5a48NNKate+6b2
         Fw06qie9a7/gc/Jn0DOBPyaoDkyG4bVdhQKRNCyXPV07oPkzZqNuIUbf16FkHcYdmFnx
         8L5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ROdZ8Y/MGQK0am4sMfTHzXw787CsxnIyvG7dCwMmzsg=;
        b=TEGaMzxn1j4AvZTFVhRvBiG1U8NwvIeQ+4rjUa8IULJ1LM7R15SXcluFN9GL8l7HMC
         Lp2aiDrJB9Ny9KiBRYDKjWt4PIsObRTROY6IvNjdG/v26hi0+eHil09VPxpiVHUss0kM
         +jrff6iPUwOtFjNAIx3g0cKByQZixBO2hL6sEP4EOZK0woK35gm0dZhkPEcUSCeYHizY
         7QSS5v6WaUvVI51oPWrTjP4wRAheVWYvO9COblCN6wtyxPYQyjMeXLLlKK9qvnHTImDW
         LKvB9Vc3WDsWyvptsIsFatMgMURKf7pTNx2Uhc04d+UHAbznPWDzrUiN6/kqejlJXNW0
         NATQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eji1jbkE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j77-20020a37a050000000b0069c7923cc7dsi2304342qke.305.2022.04.17.11.33.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 11:33:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eji1jbkE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng9hk-0002wB-UO
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 14:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90U-0004gz-Tq
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:19 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90T-00045e-Bj
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:18 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 n33-20020a17090a5aa400b001d28f5ee3f9so736669pji.4
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ROdZ8Y/MGQK0am4sMfTHzXw787CsxnIyvG7dCwMmzsg=;
 b=eji1jbkEL0wsoKqW8CX+3Da7Ve/88N1ePhPItro9WfnLubvEIz+dJYqHw1J2WD3XPP
 sG0h5XLLr7y5YlzU61WktWnIqc3z2+I+VhZcEr+ECXlz6bqnBZ0Il0ndDRTLzJOkSCm4
 6DWDXA7cRsgsraW5XunzgtvN+2HRAZS64R990FpihsBjb63DWNY/n5WaMNpomc/gaksi
 /l50pruFaEVy8Tfwa7z+RxNxnb+O0Bu2q9IJSUMYLhSfBTPobcr+U+GaW5u0IA+NOye6
 4+Kq7X/gA7VlzCSIvD25YUhfuf1X1HJQWu0B0RSIILBZnrmHZgISvhH6MqAwKtGYU9/j
 cl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ROdZ8Y/MGQK0am4sMfTHzXw787CsxnIyvG7dCwMmzsg=;
 b=VWznftLhmVzrEiYJuaDRG77zRRruHbq/4f9AQ5kkc2tlLtrgzDkLcgt5v3pOj86VpZ
 RkjLwlElxcEy87Db6+gAqME1J9hJC4xoJHErkCXRRSgBOB1OcaLdaOkzc6CEcAb2zVuf
 JtXvyDtD5DHnYl/5xyAsyMrROZ4U7ahLVR6kqbTkrKrhygzkonqZJNtPQI0JqbrHZokD
 8CH6UWmqGOMCyxy+JRKHe1gbIk/3vtZOGrovFy9ywg7RxJO9Xgi6R5uUzUsmH4NqbC3/
 poG8yOz9X2yOBxA1oiK5YThbzIGf4YPQcdIImRzMNO8gwd106wnPjuqpIdXildKM9ai8
 pCVg==
X-Gm-Message-State: AOAM531Vf4Oqsn9FWKSH5SWGFK8dOtDip2DQTb4pAOhr78Xw9JkiCsBE
 eXSLPgpWfbK/fZ6L85JUEFO7ksTmP+qY7A==
X-Received: by 2002:a17:902:b7c1:b0:158:9a1b:31d6 with SMTP id
 v1-20020a170902b7c100b001589a1b31d6mr7696921plz.94.1650217696138; 
 Sun, 17 Apr 2022 10:48:16 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020aa78c4e000000b00506475da4cesm9372055pfd.49.2022.04.17.10.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:48:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 53/60] target/arm: Enable FEAT_RAS for -cpu max
Date: Sun, 17 Apr 2022 10:44:19 -0700
Message-Id: <20220417174426.711829-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kCNbs3VUoZ2z

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index c89c344de1..35b6f7d4de 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -41,6 +41,7 @@ the following architecture extensions:
 - FEAT_PMULL (PMULL, PMULL2 instructions)
 - FEAT_PMUv3p1 (PMU Extensions v3.1)
 - FEAT_PMUv3p4 (PMU Extensions v3.4)
+- FEAT_RAS (Reliability, availability, and serviceability)
 - FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)
 - FEAT_RNG (Random number generator)
 - FEAT_SB (Speculation Barrier)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 136590382a..72fe7885f0 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -744,6 +744,7 @@ static void aarch64_max_initfn(Object *obj)
     t = cpu->isar.id_aa64pfr0;
     t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);        /* FEAT_FP16 */
     t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);   /* FEAT_FP16 */
+    t = FIELD_DP64(t, ID_AA64PFR0, RAS, 1);       /* FEAT_RAS */
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 337598e949..c5cf7efe95 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -69,6 +69,7 @@ void aa32_max_features(ARMCPU *cpu)
 
     t = cpu->isar.id_pfr0;
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
+    t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
     cpu->isar.id_pfr0 = t;
 
     t = cpu->isar.id_pfr2;
-- 
2.25.1

