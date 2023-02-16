Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp78864ejb;
        Wed, 15 Feb 2023 19:10:36 -0800 (PST)
X-Google-Smtp-Source: AK7set9eNLbwvPMwhX6yHelP+r0PXr+nxv6n5Nexl6D3oPXx3efhR8INV/UmPMv17KfTqyHIGJvn
X-Received: by 2002:a05:6214:21a9:b0:532:2d0e:7e3b with SMTP id t9-20020a05621421a900b005322d0e7e3bmr8327604qvc.37.1676517035863;
        Wed, 15 Feb 2023 19:10:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676517035; cv=none;
        d=google.com; s=arc-20160816;
        b=PBFjdRbroFzYyt1c7MQveXYp0B2y4XdKckqsB8Rnung9X61b9JzH6uOGYeGuyyHmPn
         zNewuReSfL6T/2o5XTWpwH8F24fMDH7qEaZakr+HNBoha06h1QLh/0UTgIFkQvTj5YDN
         A7G68PaVMGhjdAVj8cSFNnQUeiMHZA/UCQzgLG7pDieZVL4jTS1WvBnBwH//F8w+gKFG
         t6rq1kmAQyIhpzSAA1ZhLEgyFHH/95s53e0z0cJRjb7fmpGcCr4pO5NrBMvMGbTm5rRI
         Xy+Wct0rE/WkUHxCAOhpIaAj77WOOYSnnO524qd1zTvk9AO8BwmdwGbOFuAIH3HXNqtJ
         8MQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rrGYft0PYoFjdkgdndGx+3sC+bi057jkIwu9gTCtgvM=;
        b=KTfq1Opv2z7ODA1E+2woQJi7dVhSFzP4T80suatKgXOHxd/7vQEo9wT4/FngAKuUw0
         RHiUezp25hx1r6U8Pt6O4GbeaCJ82Sybw93hRF9/x5zv3G1T0p8J0kHlBuHfJg4AYq/t
         rr2P0EgwKuWuviBJyBRtJTp+LPyp5LrSdyotijOHXHsH7Y/vAf4ASqRW8BjohZnV0INt
         NgRp6b31721+ICURDL1VXR7ImpnPYhz7ekVCV+tR5nvqneSi4MKWKhfID47TWMnBhrtF
         FhG+FnxoByk9vY7c6wuGQcE7q9zrPAKAmqin2DR9MgUVY9OOIldZ63Ta8hWgKTcWcvvW
         Qorg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W6tqc5Al;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7-20020a05620a240700b006fb2365e923si418447qkn.291.2023.02.15.19.10.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 19:10:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W6tqc5Al;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSUeC-0007Sx-Uw; Wed, 15 Feb 2023 22:09:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUeB-0007RE-AR
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 22:09:23 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUe9-0000CR-9o
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 22:09:23 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 fu4-20020a17090ad18400b002341fadc370so4462669pjb.1
 for <qemu-arm@nongnu.org>; Wed, 15 Feb 2023 19:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rrGYft0PYoFjdkgdndGx+3sC+bi057jkIwu9gTCtgvM=;
 b=W6tqc5Al7n+lfcfdM7MHYKXstmkf/Wnm1CIiLCfWNMyIiYzXD0vPpD0CbXRUeDbmzL
 kyhUOJJzsUmWYTmZ0VpHRiq8xsAA6HOdgqCi8gy2rFhyRClqm5ISHYASBM7JHjNKEfFQ
 EFJADJq2dcGoVQV4N5Vks/VpLmfxvh2nEp3cUEZQeCZzk7ZIzCh588VOvFm8aI5Tofpi
 rrMBOVG94ad7tH2uNJZ9NNIMgG1DI+en3ad9IkErsEPMz5GYmc/4mnYH72U4warDo/J7
 4zS/LZBLVoBkAwrathClt8q/ely1qjsRfs02Zm7uKR+uw/AbnnP/xg9iHEKp6r1VjKXx
 Nmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rrGYft0PYoFjdkgdndGx+3sC+bi057jkIwu9gTCtgvM=;
 b=vZJo7cu8sXkknNONPF3JPkJQUmBi/ec+5JnI68UmasG0i53UP71P6PfowyCEWotZQr
 UMR5LqlrNmsPkf9OJH7JColXXaM6mpB1y7utNN9Kf5AdLtmY06EORRTwNSjEQskXywCD
 RgivzWxjY01mh4Jtre9HpX2BRnSJcABLDnQ2vNOs7X1GJe9dbhILD8vs1ePvsydPipNb
 ZUPM4XIugAAWNrUNhuN/3pP4LEtyRaI9Bsb2hf9CNXGYeksYQhTkZhvoTfqGlgC6/vV6
 rN+M3N0TxPpHM7ifaaoP1z+U/ImMnA15p0JspWp4h1kHryOkr+s9yns41X3H2m4+hQbF
 nPWw==
X-Gm-Message-State: AO0yUKVKn+LAO6uWPxQlPwgiE4rHfxxC1ak3/xLpjgbrf9zWCbsnPvDM
 iXyWbJbISr/Z6dtUp3HaJk1/gw==
X-Received: by 2002:a05:6a20:a0a4:b0:bc:6ef3:1e74 with SMTP id
 r36-20020a056a20a0a400b000bc6ef31e74mr3459034pzj.37.1676516959986; 
 Wed, 15 Feb 2023 19:09:19 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:09:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 15/19] target/arm: Add SCTLR.nAA to TBFLAG_A64
Date: Wed, 15 Feb 2023 17:08:50 -1000
Message-Id: <20230216030854.1212208-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216030854.1212208-1-richard.henderson@linaro.org>
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
X-TUID: 6H/AP2IcA1K/

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 3 ++-
 target/arm/translate.h     | 2 ++
 target/arm/helper.c        | 6 ++++++
 target/arm/translate-a64.c | 1 +
 4 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2108caf753..b814c52469 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1243,7 +1243,7 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_D       (1U << 5) /* up to v5; RAO in v6 */
 #define SCTLR_CP15BEN (1U << 5) /* v7 onward */
 #define SCTLR_L       (1U << 6) /* up to v5; RAO in v6 and v7; RAZ in v8 */
-#define SCTLR_nAA     (1U << 6) /* when v8.4-LSE is implemented */
+#define SCTLR_nAA     (1U << 6) /* when FEAT_LSE2 is implemented */
 #define SCTLR_B       (1U << 7) /* up to v6; RAZ in v7 */
 #define SCTLR_ITD     (1U << 7) /* v8 onward */
 #define SCTLR_S       (1U << 8) /* up to v6; RAZ in v7 */
@@ -3247,6 +3247,7 @@ FIELD(TBFLAG_A64, SVL, 24, 4)
 /* Indicates that SME Streaming mode is active, and SMCR_ELx.FA64 is not. */
 FIELD(TBFLAG_A64, SME_TRAP_NONSTREAMING, 28, 1)
 FIELD(TBFLAG_A64, FGT_ERET, 29, 1)
+FIELD(TBFLAG_A64, NAA, 30, 1)
 
 /*
  * Helpers for using the above.
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 809479f9b7..46a60f8987 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -137,6 +137,8 @@ typedef struct DisasContext {
     bool fgt_eret;
     /* True if fine-grained trap on SVC is enabled */
     bool fgt_svc;
+    /* True if FEAT_LSE2 SCTLR_ELx.nAA is set */
+    bool naa;
     /*
      * >= 0, a copy of PSTATE.BTYPE, which will be 0 without v8.5-BTI.
      *  < 0, set by the current instruction.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c62ed05c12..d1683155a1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12053,6 +12053,12 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
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
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index caeb91efa5..56c9d63664 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14813,6 +14813,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->pstate_sm = EX_TBFLAG_A64(tb_flags, PSTATE_SM);
     dc->pstate_za = EX_TBFLAG_A64(tb_flags, PSTATE_ZA);
     dc->sme_trap_nonstreaming = EX_TBFLAG_A64(tb_flags, SME_TRAP_NONSTREAMING);
+    dc->naa = EX_TBFLAG_A64(tb_flags, NAA);
     dc->vec_len = 0;
     dc->vec_stride = 0;
     dc->cp_regs = arm_cpu->cp_regs;
-- 
2.34.1

