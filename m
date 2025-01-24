Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp933643njk;
        Fri, 24 Jan 2025 08:40:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUUCAmCchgQXwn+JOoroZVGNr4gtOb+rh1RpNBQXec5gtr8lhsxKUZ6mBgojtJYbDdG82/gkoKllkOgiQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHngYR1Gkr0jtnCcIB3o/q/WcGYzTCQjfdvuCfMOc7zOEzs8e5XMA6Uz6xFbLMmkcheQl0U
X-Received: by 2002:a05:6122:6581:b0:517:4fb0:749c with SMTP id 71dfb90a1353d-51d592ba751mr27280399e0c.3.1737736840680;
        Fri, 24 Jan 2025 08:40:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736840; cv=none;
        d=google.com; s=arc-20240605;
        b=kgNxtKXXTXTwfuJw9gfx471y9v45MPW6mldFUJ+9faJo4axX6Q7OG+7joJZ8o+x44K
         PhiAru1QYHM/m5d3Ldy9ZTwjWSuLP6AH3LJWXcGEvctvkoyAB29bSaX8kN+3rWv1kLoG
         vVZV9tstOgxqou2nvaVhWjUQclrjgVnJA5N3k8zwirDPjMw5SOeg6vtah7SDHqSgWGRH
         tFYR04hUm7d3fHcIgcmEI1ucvB33r7jhI9Hc+3nbmtJEflFPZS1KfHvmVCdYOK93+CzV
         rgjEONmllbtMrdzLb8jXoM+CgbfQCQThpNptYxys62jAFCleQpe5MLERymzLzquXKqMl
         QacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qyWI57HjjH2UZcir5oGvHNcHt8Rf9+v9mAHzWsQ/uTM=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=cHe1dUIRA4OZTbUiIPrcsmTVHNQFfqqoHY9Gjy/2MHb6ZpK2ouhvj2plZBcKIErFTL
         O3NNtWMwjBOqlx6uWWCu/VDaQ3mih9CLGy80sY7kHjLYTIks/6AO3jI6JVWiRYljAthx
         hY+ERhdtqF/QZzxD/nHli0j8TO+Pb7D7ZSt1TL4Q3w9KQ0iOX9e3Y84Y+6lUJmMA3AP2
         IlU8du1hI43vNc0+cJFiobIpsjdMAgBFhd/Awad5KFdt8tBO0mGlJ+s+jlhGZ4vfE2Lf
         WODbS2E+bgLNAtN1r7ty8njTG6c6Hs1fapE6CeVzvfXYTGOnREhflUbxpTtcHCA7B+5T
         +nOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=av9luihH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51e4ecc01ccsi999646e0c.233.2025.01.24.08.40.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:40:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=av9luihH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMb6-0001aV-IF; Fri, 24 Jan 2025 11:31:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYg-0004NM-7N
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:26 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYe-0005bb-7A
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:25 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so23482675e9.3
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736163; x=1738340963; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qyWI57HjjH2UZcir5oGvHNcHt8Rf9+v9mAHzWsQ/uTM=;
 b=av9luihHuEU/a3SeTye2+bM2F3N7RcFi48KwaRBVLe1vMaqNJuSsRzRx8RV8HdWIfq
 0thOM25gVYYVW+lSEtyISjkbxVM4iXp5SGXHRt78CpP6SKyAlCRrcomPGP9e/uoK6cTy
 L1x6TsS/njmdMKaxSeAM+gNPi+ZeKHb8PJocG1psKlUvnwHTvFhJmx0AmyNuXa6SVDZq
 9lwKRH8Oyc6ai4gAl1sJ1p8nXNyD5BVqu1/q8/leBsGnULpTltC+nRHrLgq03AFqNWKW
 ssNFETkb0yjyG6LMGG83VzlwTqdBe+AyMGVBM9MfH4MqEWy1p+c1n/EyoonE6ykIt8ji
 37SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736163; x=1738340963;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qyWI57HjjH2UZcir5oGvHNcHt8Rf9+v9mAHzWsQ/uTM=;
 b=AQvAVwQdPbtaU0lZheqpLAQqEFN6sO2RGp1GsB33ROKLcThLZc6q+GHS8ubBiN+fEo
 KbN2gI3QzZd5tPeHf3oJUXRIF3oqiRXpsx5UM2C6iZb9i7q51c0rTxdV3O6+BhM44IDK
 yo4Ju/LA+XArn74u1JREBSjn9POdx5KsPB1OPSSgs9yCKwzM5I22JM0OZ0CZFeE86Av8
 7+MrtrHnlpo6OB828Nbva9k/5pHm48etP+DPLGuO64GkMynpqn+WAI/DDvT1LTM3tB5b
 8PNGO7GG4FVSti7qeeg49pV+5Bt0vtsYWS6T0+aRG5n5bZqwqGZItyZXn16o1YFIWJqB
 YeiQ==
X-Gm-Message-State: AOJu0YyniT9066cLODubaSOm4flnQkHA+59RB/v4RFj3foJ8clZbQikb
 8QOexZ1OD4q1OLhJxP7HkMu3VzaNSrtURhLorGMVtzPdzX4dXQkWTtfSC0axRIlQO0aAUG84a+q
 g
X-Gm-Gg: ASbGncseYxUXKNNhg2olnZbKeRh0tY9vQv2MDpPBbId1gpjJFCYIbRTfMxUj2KBYbkb
 UEDDmchqxEuimpC5J2ExxgEIzrVcPzrljHZLpBXz5RWr95jZWTDWnR47RreDABde5GqnHjivdxh
 Oc+9rIzk640C4q91xqB2JSAoOS3XBpznMBFF1GGypfJAWDCm4DX/k73qaDPUgUiE2wza9zPYlk6
 bWcDhYhSnRPUh5hbJwHLe/2IyqqBcXUXdb7PPEosbxUf0+GKh2czwecwkKDW6gfdwHBZmwG66xe
 86aqxFGNI20=
X-Received: by 2002:a05:600c:1f14:b0:434:f623:a004 with SMTP id
 5b1f17b1804b1-438913e391fmr335798915e9.16.1737736162825; 
 Fri, 24 Jan 2025 08:29:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 36/76] target/arm: Add FPCR.NEP to TBFLAGS
Date: Fri, 24 Jan 2025 16:27:56 +0000
Message-Id: <20250124162836.2332150-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 8fr+CVVsqHTq

For FEAT_AFP, we want to emit different code when FPCR.NEP is set, so
that instead of zeroing the high elements of a vector register when
we write the output of a scalar operation to it, we instead merge in
those elements from one of the source registers.  Since this affects
the generated code, we need to put FPCR.NEP into the TBFLAGS.

FPCR.NEP is treated as 0 when in streaming SVE mode and FEAT_SME_FA64
is not implemented or not enabled; we can implement this logic in
rebuild_hflags_a64().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h               | 1 +
 target/arm/tcg/translate.h     | 2 ++
 target/arm/tcg/hflags.c        | 9 +++++++++
 target/arm/tcg/translate-a64.c | 1 +
 4 files changed, 13 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index cfb16151577..f562e0687c9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3213,6 +3213,7 @@ FIELD(TBFLAG_A64, NV2_MEM_E20, 35, 1)
 /* Set if FEAT_NV2 RAM accesses are big-endian */
 FIELD(TBFLAG_A64, NV2_MEM_BE, 36, 1)
 FIELD(TBFLAG_A64, AH, 37, 1)   /* FPCR.AH */
+FIELD(TBFLAG_A64, NEP, 38, 1)   /* FPCR.NEP */
 
 /*
  * Helpers for using the above. Note that only the A64 accessors use
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 680ca52a181..59e780df2ee 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -157,6 +157,8 @@ typedef struct DisasContext {
     bool nv2_mem_be;
     /* True if FPCR.AH is 1 (alternate floating point handling) */
     bool fpcr_ah;
+    /* True if FPCR.NEP is 1 (FEAT_AFP scalar upper-element result handling) */
+    bool fpcr_nep;
     /*
      * >= 0, a copy of PSTATE.BTYPE, which will be 0 without v8.5-BTI.
      *  < 0, set by the current instruction.
diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index b3a78564ec1..9e6a1869f94 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -407,6 +407,15 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
     if (env->vfp.fpcr & FPCR_AH) {
         DP_TBFLAG_A64(flags, AH, 1);
     }
+    if (env->vfp.fpcr & FPCR_NEP) {
+        /*
+         * In streaming-SVE without FA64, NEP behaves as if zero;
+         * compare pseudocode IsMerging()
+         */
+        if (!(EX_TBFLAG_A64(flags, PSTATE_SM) && !sme_fa64(env, el))) {
+            DP_TBFLAG_A64(flags, NEP, 1);
+        }
+    }
 
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
 }
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 0b3e4ec136d..d34672a8ba6 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -9753,6 +9753,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->nv2_mem_e20 = EX_TBFLAG_A64(tb_flags, NV2_MEM_E20);
     dc->nv2_mem_be = EX_TBFLAG_A64(tb_flags, NV2_MEM_BE);
     dc->fpcr_ah = EX_TBFLAG_A64(tb_flags, AH);
+    dc->fpcr_nep = EX_TBFLAG_A64(tb_flags, NEP);
     dc->vec_len = 0;
     dc->vec_stride = 0;
     dc->cp_regs = arm_cpu->cp_regs;
-- 
2.34.1

