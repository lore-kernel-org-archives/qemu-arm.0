Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp788463ejb;
        Thu, 25 May 2023 16:28:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4KxVkYj6YGCMEld0m1qYqUiXVQ3twejwTGyaRguX8EALh2H140Ee9uHOHF5/vi/4sUaO4E
X-Received: by 2002:a05:620a:2487:b0:75b:23a0:e7b6 with SMTP id i7-20020a05620a248700b0075b23a0e7b6mr453689qkn.23.1685057299217;
        Thu, 25 May 2023 16:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685057299; cv=none;
        d=google.com; s=arc-20160816;
        b=gQ7BTNhdd6Hpjv+k2iRl/h3idsa1Ullx4JGMZAiGgbOZpSatIuvAR1cBvOt4c8kID8
         5Mv8BNqOR6Cwrpmudz5/RmRNVD8uY23OeJvsXd4EtfGp5IAWxXjGzHEfHsOpyDqj1AgC
         tcaRBzRqMmQcKxtSA1zwsqfpBC8QHb3xF7f3VrD/B1FPNspbmctvv6nZJsywp9Vgw8kA
         WefA2By/IDHN16Z6TnS3xkTImCSfrz2TWGJNZ962eb4Tq6ZQajOFXjYClKh/cfKQS9LX
         ndnX0nNJmoDY3pFHrYgWygjHKwDz6JOdcNAWK7UNXuut7Xj/mU0u8qEjL5ZVHebGRGuX
         wHkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Idgzie8Bagv/okuq3PZRR6bulWfE7VOtkKl3IxnEacg=;
        b=vMZ/uyifd8keKPl048u0KIu52cS0f48jswYf7akR8Ir270KPRSpG9wFGe9zviiBhcL
         PaySE0sn6rYDAWnwdMoicFm+DGsfGx3Czy1Ov8JyEs7bABzW3lJqm8NZ2fh5FI/SYEqQ
         32Typ7wANcSX0vX5qPuhcLpPyjq4RxGiRnbOV/BoO2BHiduOC+kOMe3ncw31znAyd/iI
         CIf0rSDDYMpuypd1bJr5fNweAZQECZQuIHzDUJzumy76zwJq7/zz0CbnTc+opTsth3It
         Fj8Uh/NpUxff6ga2pEE7fh3CBRp0RmB6RBKQHx4ZjGhda4bDrB2dsOKDkyUI2u29F2oV
         O0tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gcI87G3V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s25-20020ae9f719000000b007579762eb52si911880qkg.363.2023.05.25.16.28.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 16:28:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gcI87G3V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q2KLc-0005tv-Cl; Thu, 25 May 2023 19:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2KLb-0005s0-5A
 for qemu-arm@nongnu.org; Thu, 25 May 2023 19:26:19 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2KLV-0005oc-32
 for qemu-arm@nongnu.org; Thu, 25 May 2023 19:26:18 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1ae763f9a94so889955ad.3
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 16:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685057172; x=1687649172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Idgzie8Bagv/okuq3PZRR6bulWfE7VOtkKl3IxnEacg=;
 b=gcI87G3VR68vc31MEkZ2xr8+K5PIgLhe73iBC6tLBAD2vtHiMtsHBHhWtVrlRvSjdg
 WP9CCE1+AtBXAXmLfkipbXajNCGQFVnKCsYbH4HPtuyg8+wLruIQPxZpkd3UiKktCXK8
 u0kdfs+3S9jszPkRloSBew46mt7uv+dysDKOn3NamYObn2UAzLYdbIr7YZcF9SPC6ZC5
 95q33LcgHxO9sajrEq+sJ1379GmLE5ygmBbr9ilMVmGe12frsFgV4kV3SylsVzQHMkHt
 TQNvMXNeuFrQX9SKZL6VDctHBGlSNhtYski/gz4lOHMc+JqiH8RmQVRIdw5Q5xDg9kAB
 Qj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685057172; x=1687649172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Idgzie8Bagv/okuq3PZRR6bulWfE7VOtkKl3IxnEacg=;
 b=cxq0HObDC2/AcepW88sHX+ncwXfJ9jDOUyswhygBuSZmkD1cMHpb7yxZ/wpDNiZV+4
 hiNLIvalpml/yViLw8cDI6eQlrUbCsdGSv5BEn3SDqY5HBX5SC+iDEI3sEtBpyLXOfik
 cWVcKSGEXK0blFX3dGNkLOUGL8JH/NMs0oN/GBTb4qHKLCXcMcgB3AcOZecL9rqMyxJG
 cbchF7V3+KxiVfgH/r3N4RrPPrHjy4MWv6UNyCPA02Kq4ilfTLsC8KczytdQjNooiH0K
 U0tLq1gURfbeaNADpXoacRwgn3AfFvVZwF2Y8evhh43dPUbcY4FRag5awqqP0D9MyPZn
 6okQ==
X-Gm-Message-State: AC+VfDzJQDeiJF5T5021+rZLrQMaDIYrCIB247uJzB9YfpMSmcP9WcNd
 KOSZR6WFMywu0kxRtEhiUsddeA==
X-Received: by 2002:a17:902:e541:b0:1af:cbb1:837 with SMTP id
 n1-20020a170902e54100b001afcbb10837mr360451plf.65.1685057171825; 
 Thu, 25 May 2023 16:26:11 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:7ac5:31cc:3997:3a16])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a170902ea0f00b0019e60c645b1sm1885036plg.305.2023.05.25.16.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 16:26:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 15/20] target/arm: Add SCTLR.nAA to TBFLAG_A64
Date: Thu, 25 May 2023 16:25:53 -0700
Message-Id: <20230525232558.1758967-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525232558.1758967-1-richard.henderson@linaro.org>
References: <20230525232558.1758967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-TUID: AdpyrTy0RIFH

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h               | 3 ++-
 target/arm/tcg/translate.h     | 2 ++
 target/arm/tcg/hflags.c        | 6 ++++++
 target/arm/tcg/translate-a64.c | 1 +
 4 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 36ab66d0c3..23092572d7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1247,7 +1247,7 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_D       (1U << 5) /* up to v5; RAO in v6 */
 #define SCTLR_CP15BEN (1U << 5) /* v7 onward */
 #define SCTLR_L       (1U << 6) /* up to v5; RAO in v6 and v7; RAZ in v8 */
-#define SCTLR_nAA     (1U << 6) /* when v8.4-LSE is implemented */
+#define SCTLR_nAA     (1U << 6) /* when FEAT_LSE2 is implemented */
 #define SCTLR_B       (1U << 7) /* up to v6; RAZ in v7 */
 #define SCTLR_ITD     (1U << 7) /* v8 onward */
 #define SCTLR_S       (1U << 8) /* up to v6; RAZ in v7 */
@@ -3043,6 +3043,7 @@ FIELD(TBFLAG_A64, SVL, 24, 4)
 /* Indicates that SME Streaming mode is active, and SMCR_ELx.FA64 is not. */
 FIELD(TBFLAG_A64, SME_TRAP_NONSTREAMING, 28, 1)
 FIELD(TBFLAG_A64, FGT_ERET, 29, 1)
+FIELD(TBFLAG_A64, NAA, 30, 1)
 
 /*
  * Helpers for using the above.
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 626cf07970..38086a23f4 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -137,6 +137,8 @@ typedef struct DisasContext {
     bool fgt_eret;
     /* True if fine-grained trap on SVC is enabled */
     bool fgt_svc;
+    /* True if FEAT_LSE2 SCTLR_ELx.nAA is set */
+    bool naa;
     /*
      * >= 0, a copy of PSTATE.BTYPE, which will be 0 without v8.5-BTI.
      *  < 0, set by the current instruction.
diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index b2ccd77cff..616c5fa723 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -248,6 +248,12 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         }
     }
 
+    if (cpu_isar_feature(aa64_lse2, env_archcpu(env))) {
+        if (sctlr & SCTLR_nAA) {
+            DP_TBFLAG_A64(flags, NAA, 1);
+        }
+    }
+
     /* Compute the condition for using AccType_UNPRIV for LDTR et al. */
     if (!(env->pstate & PSTATE_UAO)) {
         switch (mmu_idx) {
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 8301d6c8e2..bbcdf31728 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -14163,6 +14163,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->pstate_sm = EX_TBFLAG_A64(tb_flags, PSTATE_SM);
     dc->pstate_za = EX_TBFLAG_A64(tb_flags, PSTATE_ZA);
     dc->sme_trap_nonstreaming = EX_TBFLAG_A64(tb_flags, SME_TRAP_NONSTREAMING);
+    dc->naa = EX_TBFLAG_A64(tb_flags, NAA);
     dc->vec_len = 0;
     dc->vec_stride = 0;
     dc->cp_regs = arm_cpu->cp_regs;
-- 
2.34.1

