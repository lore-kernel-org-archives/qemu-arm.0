Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp647989ejn;
        Thu, 20 Oct 2022 15:46:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6kRCZnb5LW3XXW8yYie7SmYluqPdJIOiicBDu61jmnoa0p2vz47X/4BMri98+xuTi0su/+
X-Received: by 2002:ac8:7c4f:0:b0:39c:e074:5b41 with SMTP id o15-20020ac87c4f000000b0039ce0745b41mr13448881qtv.405.1666305993925;
        Thu, 20 Oct 2022 15:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666305993; cv=none;
        d=google.com; s=arc-20160816;
        b=YQzz9wUNa+mUwNKLH+UjumJXVkda7bYXgNN4YRNv8j5P5/Fc/iIFART1QExQ3HZV9x
         7/wDxvt7RuM9548asIVJR8bBK+Np1TY2AJ8k5XU5UQiyXZUzmo7xczpnATWmpH+4LGDg
         imXY0yNvOZdzn1DTQJ2nqDzJTUPc4CmcaYYN4/uDJvsq7RVwyOu8RZtnRCBJHC4FWDMz
         XKgkSzOv/di5HX2wq/juLFk62kfWqdcpllyvOFoX1aD0Fpaw+rGaAmwN4aVsNBJpYFjo
         pq86RCB0rIsIo04+oOrcSC/9B+RfuoGO9jkFq+WBO5LjMSW5Y6GJc3R/b4wFGS7FiBRT
         ErUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b2QyK6qaxKPHmlYeK5hx+cv5ntpv8x7vPZcfjTuC15M=;
        b=unORKx7OYst5naAG9QTBCVJlSL++V//0d5w3raQU70ZQ1+PlRJo5ADEM0AMj1H7HMr
         /h9wDPyY/Y2IGAX+rBJQmGSOic/FSGwbz4oNj7Sk6bjC89+qoajpB5SK2K2pQ4IG2R9b
         biLy2FwdUCo7r01yI9BoxLqCplAxgsMqR7grLlXcw9KljV3ErchZSTbbHKGkCQXxMJ1D
         t0WeAP57SkyYeO/esDJp5xMamcrfuwp9NS+cu2mxPzC38s1GXauErql+onoFUIcSbeIF
         DTl53DQRtHWTQJJWddqGJbitjy0C80cRRy6IdV39TSgtEfR2OAIuJIwbe3QRmixWqvzR
         g7yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tN+e33oI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv23-20020a05620a1b9700b006eed853607dsi8781984qkb.514.2022.10.20.15.46.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 15:46:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tN+e33oI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oleJ7-0003Ry-5O
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 18:46:33 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oleA9-0008MS-RC
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 18:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oleA7-0008Hr-F4
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 18:37:15 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9s-00015I-QZ
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 18:37:15 -0400
Received: by mail-pj1-x1031.google.com with SMTP id pb15so734396pjb.5
 for <qemu-arm@nongnu.org>; Thu, 20 Oct 2022 15:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b2QyK6qaxKPHmlYeK5hx+cv5ntpv8x7vPZcfjTuC15M=;
 b=tN+e33oIK1n/AvyMDJ8cmjcD45Uj2pPDxosrmE5k9j0nKNmVbi/UMqPyNzVZkWyuK7
 5wtXdvB1kLJwJa6Omkpi220UAueuEZuC0ZxpH9otwFI8ySuYL+1rgBzO+KjB+51emh9+
 /gZeFuLm84MpBVOE/N13TXIGP9l32Uw/qGXrwhmgFrraKN5rPPX5CDTtSGcKxlsJpivY
 aflcoxnURS9PB+iS/CN+qdEOzCKgyysF86lthb9CwIIx6YumqdpLRbpI1Weswe9UTsek
 BGXqO8hesZ5H7wUppw2RcvQf/U+nQIq7IfJLLfnK6MAkXSACCZtsJPsfNPoGPAe5SAD1
 u3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b2QyK6qaxKPHmlYeK5hx+cv5ntpv8x7vPZcfjTuC15M=;
 b=IqDr4xoZoQjKMTKFDCQ8uTmj1Gui3aDUkx+Iu3E/PItkgnIeq5zxwcsxiAF1klfexN
 ZFFH1Fxdy3n+7Srk/KNlsFZOTWOjvNyLbDk4dbX3dMK+uGdcxfxKvMALcQqjhTg2SJCA
 eJ5ls2NAGKiN/nxboT0KfhbGuyKS3Zug/LDiv20C8faAiVOLbxgpQLu27MyNXXigmZZA
 /j3kZppwKG78JI/Tj6kDxqRi2njsCIimd6GjlgsCfNNBT3lrbgNNVV6xrHXfM2QTae32
 LtIDkBDmbj0jCg6TnRHww/KfIn6vBBGjpy6TS1YcRlfRfoumIjwtsdEQoCTIworHsi7I
 XpjQ==
X-Gm-Message-State: ACrzQf39Sc1EXKMUxsFCg57y8+Dy9S29gw8FdCOUtuxRSnD4cQVZURm/
 RH6Gd6W6ACZGlU0VhHcw2+DQdA==
X-Received: by 2002:a17:90b:4b02:b0:20d:3937:7ad with SMTP id
 lx2-20020a17090b4b0200b0020d393707admr53800341pjb.145.1666305419465; 
 Thu, 20 Oct 2022 15:36:59 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 r10-20020aa7988a000000b0054cd16c9f6bsm13753841pfl.200.2022.10.20.15.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:36:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 10/14] target/arm: Consider GP an attribute in
 get_phys_addr_lpae
Date: Fri, 21 Oct 2022 08:35:44 +1000
Message-Id: <20221020223548.2310496-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020223548.2310496-1-richard.henderson@linaro.org>
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 00EFHBxW02gG

Both GP and DBM are in the upper attribute block.
Extend the computation of attrs to include them,
then simplify the setting of guarded.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6820c2f4bc..cb2e9072ec 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1077,7 +1077,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint32_t el = regime_el(env, mmu_idx);
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
-    bool guarded = false;
     uint64_t descriptor;
     bool nstable;
 
@@ -1343,7 +1342,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     descaddr &= ~(hwaddr)(page_size - 1);
     descaddr |= (address & (page_size - 1));
     /* Extract attributes from the descriptor */
-    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(52, 12));
+    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
 
     if (regime_is_stage2(mmu_idx)) {
         /* Stage 2 table descriptors do not include any attribute fields */
@@ -1351,7 +1350,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     }
     /* Merge in attributes from table descriptors */
     attrs |= nstable << 5; /* NS */
-    guarded = extract64(descriptor, 50, 1);  /* GP */
     if (param.hpd) {
         /* HPD disables all the table attributes except NSTable.  */
         goto skip_attrs;
@@ -1404,7 +1402,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 
     /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB.  */
     if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
-        result->f.guarded = guarded;
+        result->f.guarded = extract64(attrs, 50, 1); /* GP */
     }
 
     if (regime_is_stage2(mmu_idx)) {
-- 
2.34.1

