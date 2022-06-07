Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2412488lfb;
        Tue, 7 Jun 2022 13:58:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6aJqdu5yD/u0GZv1NYhzfpqtkCl+Kzq7nDFNprsEDR/ydEXc/UlSu6DCfoXc3samF03FO
X-Received: by 2002:a05:620a:2981:b0:6a6:49b5:c53d with SMTP id r1-20020a05620a298100b006a649b5c53dmr21173058qkp.718.1654635526179;
        Tue, 07 Jun 2022 13:58:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654635526; cv=none;
        d=google.com; s=arc-20160816;
        b=AQjZLKSO94e3H7p2I2c/VnEOXXRnQCYuEfn+VniNrYKeME/7Wf0R9lfp/kEVmkukhb
         AnN8h03XU13uPexzAmza9xYnCpsCh7idY6/SFOpT34whzeLTpxc9rMlOui1cQNo1332f
         UpiEV9PmvnCFt3NaLqHvXTD7hOaKrItS71Ep8gX4xJI0+mxGVojVzUWhp6qmOXA4TYkz
         YpuWcYnlCfA3gRVBmnaPMVIx/uAI44TdaKTP551+RrxUExfSSZbJuCT4UzY7texbc1kC
         fQgxne4kTucAPUJHHxWwjjI76VIVes32bVqaProtGSMv+CZQMHMi5kcpQ/0ad2LYqPUe
         68/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Im5u11D8yrAC4qQJy1JnWa+rWzoOJ65BBH7IOoUdIyQ=;
        b=LHaPjabYbzl0XURMpeQqXXAy3/8AA4dh7Djr3LOGRegditwmpQm0mbH1WULx9uCH8m
         /IihhlofJ0XZurEDaifTRdvSvmH0fFQo6Fyyone6goUi3blib3/6bpN6c4mZFGGN0NLE
         PnBSiI70Oh97wj/vPNQ/EDynjQcx115UPLbLKpla9wu4l4iBoj8gCm6lU1/PbnYRDtXt
         0QLqmuDHgcm8eu0tjVm3dInxd4fHNqPItFYalEuVpQR3pG97M+Yc9NCOx9WxjXTwPz0i
         MA/IAPbnFm5082EjJmgS/3cPKQu0GfY0LpjdygOXwnrX5+cVo7hjCLscwXUHCIbfPFxA
         D4gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J7y0v9iG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e1-20020a05622a110100b00304b8ea0c1fsi4274192qty.335.2022.06.07.13.58.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 13:58:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J7y0v9iG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygHl-0007DZ-Ks
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 16:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftd-0000Kd-D4
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:49 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:44594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftU-0007ES-SE
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:49 -0400
Received: by mail-pf1-x42c.google.com with SMTP id g205so16481156pfb.11
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Im5u11D8yrAC4qQJy1JnWa+rWzoOJ65BBH7IOoUdIyQ=;
 b=J7y0v9iGUlDOPRh03zbC+4A23pTa9EYfociFC23p5YJ2Us9UuFs90ppQkFkKc9NXGJ
 USavmNA6PahvKQ6So04V1eHIUv6RT0yqWqbkzlG9o6Lus7PpienJh9MNj231macFiVyC
 hAzXIb3IHxgYSTzJ/8BTcthPfuAX5apARy4k9NcQRtWD5TD96OpLyLqh3+SXZzRi5d4d
 g4+JrSrenyecs087twarVewtPduCgVb0/73iLLAAYUa7t+akuUMXTr02dlvCiepmiQUG
 66lViN87wmMx2Y0OopVSipGO24er1RaujcJ2h+jss683ZgeNPQf63wRLmXQAgGgWFWUF
 /REA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Im5u11D8yrAC4qQJy1JnWa+rWzoOJ65BBH7IOoUdIyQ=;
 b=YU9hUhP6pc2QzX2cBniEBI9MvEDrjmRo+MHCj6li7lXyx0HE2aNF6fU2sttfntTIBT
 ZxsbOCU9sK3Tqhu3ZFsEcmI2NTsKGeTxhzVTtIZ0KtjVLxlcbazga+EqA+487/apaWUG
 VSluRwq1HzWO7VUwM3nEn/t+pMxPj+94Q1VjEbpDljBEKFdym8NmCmZ4z2N4CRRI6emc
 YyF2Giwm1flkdQwLS+d0EcZ8YAbLAckfjEV6P1iWoboaCBsXpyluOQ1YpO9AVZSNz88K
 kXudEHTb0XRSeYX/BWckdLrTEsSNFGkhsEvD5PN3xXn4lIVsyZw2RMzQcHs3phQghLt4
 eQCQ==
X-Gm-Message-State: AOAM532qRHcgaudZt68R8jjhB7HLlQLdL4oxqrnpBaqWw4PoJokkNCcA
 yyGfkJzl6s0Y/XgA/UD3cnPJ1YwY4LdMTA==
X-Received: by 2002:a05:6a00:1a87:b0:51c:29f1:13a0 with SMTP id
 e7-20020a056a001a8700b0051c29f113a0mr9000697pfv.13.1654634019983; 
 Tue, 07 Jun 2022 13:33:39 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 35/71] target/arm: Move arm_cpu_*_finalize to internals.h
Date: Tue,  7 Jun 2022 13:32:30 -0700
Message-Id: <20220607203306.657998-36-richard.henderson@linaro.org>
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
X-TUID: WbZLPxhiRfqr

Drop the aa32-only inline fallbacks,
and just use a couple of ifdefs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       | 6 ------
 target/arm/internals.h | 3 +++
 target/arm/cpu.c       | 2 ++
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4e86d143c8..25a77ec676 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -205,14 +205,8 @@ typedef struct {
 
 #ifdef TARGET_AARCH64
 # define ARM_MAX_VQ    16
-void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
-void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
-void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
 #else
 # define ARM_MAX_VQ    1
-static inline void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp) { }
-static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
-static inline void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp) { }
 #endif
 
 typedef struct ARMVectorReg {
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 8bac570475..756301b536 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1309,6 +1309,9 @@ int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg);
 int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg);
 int aarch64_fpu_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg);
 int aarch64_fpu_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg);
+void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
+void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
+void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
 #endif
 
 #ifdef CONFIG_USER_ONLY
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1b5d535788..b5276fa944 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1421,6 +1421,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 {
     Error *local_err = NULL;
 
+#ifdef TARGET_AARCH64
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         arm_cpu_sve_finalize(cpu, &local_err);
         if (local_err != NULL) {
@@ -1440,6 +1441,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             return;
         }
     }
+#endif
 
     if (kvm_enabled()) {
         kvm_arm_steal_time_finalize(cpu, &local_err);
-- 
2.34.1

