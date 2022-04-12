Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp2007177lfq;
        Mon, 11 Apr 2022 17:41:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIhQN+GU6o+ZLBc66GAcJAD3RAbht1rRxfSKvMmAZTbH8/s4sBClXEttyixf9PPWhPveIw
X-Received: by 2002:a05:6902:12c2:b0:633:85ae:afdb with SMTP id j2-20020a05690212c200b0063385aeafdbmr25238285ybu.118.1649724092852;
        Mon, 11 Apr 2022 17:41:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649724092; cv=none;
        d=google.com; s=arc-20160816;
        b=DLEvIZM17IWQeayNX1GJ1ptlArPv17kqcKVjak9+mdu/AAnNvcRKb+2Fyj0qk9jU6g
         qdsbkBstvtPx1e9F8yPSsjV95wy/E/4MZ1uDfifIrFY29vtxT4/ncyqANjSYaFizp3oo
         POE8eCQ2b+dWdBg6w24NPw8F5O3p8ZuzXU7/96SLv05dCMcDCJVHYu0Yt/gkkCHGUvQb
         KUK+dqf7KySafkptqTZ+xovGinik9J0QCsjGXi0T6s+lgO2nVT3PThTOHMUXb/GGn8xd
         z1x5BrmEgoo3tHFDCal3sXBr/Zd8lQ10aAAWoD2mrpLG8fm9aNYRi3h22A9X3SHeg2Fj
         ufzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=O7CK/hn1c4miDXXyB3iPi83XXfs+x8KY/s6DWMX2EPY=;
        b=myB+oRfwAledGUzZx8p56cudK368va17I6H8p04wRj7wje8DQM0jiNYD1ja4oL7FrP
         4p9MbNcNDVlLT5/H044jCrXeebvQw468A/HnJjnlZjKHoWXmd2mycnlyO4aIe4xt9dLf
         NmFy1rlQTXj2i0qqIMNjjIiZoLGjGr1//SJgaImGMVB56R2XC+xb0vAbp/W7dzhKtD3P
         Na1tmfwVKhtRDWgRkKr1uD8/dDTogri8gIvBErl4YuA8OXPxCgZBcxh6Rq0/pwVbhSEe
         8bFo73xoGbXg6Z3HGgXHjASi220N3mYCmhnjubdEOgsbOJP8mO0ierKKrkFGVqJ8U3Kx
         CAuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sPWHGnDL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c63-20020a25e542000000b00641193288e8si4725544ybh.677.2022.04.11.17.41.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 17:41:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sPWHGnDL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ne4b6-0003kX-7t
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 20:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TQ-0001sF-Uf
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:40 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:43582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TO-0001oE-Vl
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:36 -0400
Received: by mail-pf1-x42f.google.com with SMTP id a21so1089965pfv.10
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 17:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O7CK/hn1c4miDXXyB3iPi83XXfs+x8KY/s6DWMX2EPY=;
 b=sPWHGnDL3JbWHl8wqQ8qnAZhd7AePy0hBre7zKpxrXpSkqxOGwXA8za6AMgRKZ8CsO
 dmGG3kdU6UqzVCK4Lrb+K3avpNtD2sKq8yotQdY20+FlOE6J+1yjem6/mxl4jr1xSBZK
 bNxU9zCy3b3K28+PT001xz0Nj8xGgPOFJZBvjawHWlHHfS2oi2zCJMRRilP7N+2KaRvw
 0F41yHVeJbJWZPyMV77RLwl27U1WWY3AmqddQbTjrhSzj46IDMc+e8lJ4+5AvVf75/wI
 A7lvsAKVymxrjdPoYoghBUnVmzXZqpdBiavEWnlGafVhSaLSFlvrsq8x+q5n1LX18rfE
 pqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O7CK/hn1c4miDXXyB3iPi83XXfs+x8KY/s6DWMX2EPY=;
 b=DVi3mqusjqDWL4bHWmUH9RcZJOsTtp2cv8ZXzNI7mymJMwsurKsJfnIqNqYEjGgcsD
 8PQh/5tMq0q0rXsJWWiRO/gyWJY9XauwpWHB9HIeQn468gN4VQExtaTrlTPFVgSM9b4C
 Hlg6FZEVi52i+JOtgATLGKEm9iyHoSIHB+N9hISvFU4drR/32qEfHRWoSKh9kRROPBcD
 /IPafNViIl8TzlHbrIo/TzTtne7w04asOFpiXAMa5E9eZ1SXklaw2qmriv7f4YJQArta
 xChhoMBOOgLENKs/8SLeGm0teJLwuIfsAihFjDzlotJT7/2tJSWs9aj8kRB56IvhWaRU
 zTqw==
X-Gm-Message-State: AOAM533G8Zuf+A7AAKuuehn+1rJHnXhmaKtbLN5jv6H0ZPA84ZvCSqDd
 UEHd3vwh1IfXUK6znk9LGdYXwh3RYfl5Ng==
X-Received: by 2002:a63:d64d:0:b0:374:6edc:989c with SMTP id
 d13-20020a63d64d000000b003746edc989cmr28549691pgj.434.1649723613620; 
 Mon, 11 Apr 2022 17:33:33 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/24] target/arm: Split out arm32_max_features
Date: Mon, 11 Apr 2022 17:33:08 -0700
Message-Id: <20220412003326.588530-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L50GRVyyiXbV

Share the code to set AArch32 max features so that we no
longer have code drift between qemu{-system,}-{arm,aarch64}.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |   2 +
 target/arm/cpu64.c     |  50 +-----------------
 target/arm/cpu_tcg.c   | 114 ++++++++++++++++++++++-------------------
 3 files changed, 65 insertions(+), 101 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 96a57ee68f..ca9782b9f0 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1301,4 +1301,6 @@ static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
 void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
 #endif
 
+void arm32_max_features(ARMCPU *cpu);
+
 #endif
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 67d628c0af..528b0f5e64 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -682,7 +682,6 @@ static void aarch64_max_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint64_t t;
-    uint32_t u;
 
     if (kvm_enabled() || hvf_enabled()) {
         /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
@@ -797,57 +796,12 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);
     cpu->isar.id_aa64zfr0 = t;
 
-    /* Replicate the same data to the 32-bit id registers.  */
-    u = cpu->isar.id_isar5;
-    u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
-    u = FIELD_DP32(u, ID_ISAR5, SHA1, 1);
-    u = FIELD_DP32(u, ID_ISAR5, SHA2, 1);
-    u = FIELD_DP32(u, ID_ISAR5, CRC32, 1);
-    u = FIELD_DP32(u, ID_ISAR5, RDM, 1);
-    u = FIELD_DP32(u, ID_ISAR5, VCMA, 1);
-    cpu->isar.id_isar5 = u;
-
-    u = cpu->isar.id_isar6;
-    u = FIELD_DP32(u, ID_ISAR6, JSCVT, 1);
-    u = FIELD_DP32(u, ID_ISAR6, DP, 1);
-    u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
-    u = FIELD_DP32(u, ID_ISAR6, SB, 1);
-    u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
-    u = FIELD_DP32(u, ID_ISAR6, BF16, 1);
-    u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
-    cpu->isar.id_isar6 = u;
-
-    u = cpu->isar.id_pfr0;
-    u = FIELD_DP32(u, ID_PFR0, DIT, 1);
-    cpu->isar.id_pfr0 = u;
-
-    u = cpu->isar.id_pfr2;
-    u = FIELD_DP32(u, ID_PFR2, SSBS, 1);
-    cpu->isar.id_pfr2 = u;
-
-    u = cpu->isar.id_mmfr3;
-    u = FIELD_DP32(u, ID_MMFR3, PAN, 2); /* ATS1E1 */
-    cpu->isar.id_mmfr3 = u;
-
-    u = cpu->isar.id_mmfr4;
-    u = FIELD_DP32(u, ID_MMFR4, HPDS, 1); /* AA32HPD */
-    u = FIELD_DP32(u, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
-    u = FIELD_DP32(u, ID_MMFR4, CNP, 1); /* TTCNP */
-    u = FIELD_DP32(u, ID_MMFR4, XNX, 1); /* TTS2UXN */
-    cpu->isar.id_mmfr4 = u;
-
     t = cpu->isar.id_aa64dfr0;
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5); /* v8.4-PMU */
     cpu->isar.id_aa64dfr0 = t;
 
-    u = cpu->isar.id_dfr0;
-    u = FIELD_DP32(u, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
-    cpu->isar.id_dfr0 = u;
-
-    u = cpu->isar.mvfr1;
-    u = FIELD_DP32(u, MVFR1, FPHP, 3);      /* v8.2-FP16 */
-    u = FIELD_DP32(u, MVFR1, SIMDHP, 2);    /* v8.2-FP16 */
-    cpu->isar.mvfr1 = u;
+    /* Replicate the same data to the 32-bit id registers.  */
+    arm32_max_features(cpu);
 
 #ifdef CONFIG_USER_ONLY
     /*
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index ac782531a7..94af0c3bda 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -19,6 +19,66 @@
 #include "hw/boards.h"
 #endif
 
+
+/* Share AArch32 -cpu max features with AArch64. */
+void arm32_max_features(ARMCPU *cpu)
+{
+    uint32_t t;
+
+    /* Add additional features supported by QEMU */
+    t = cpu->isar.id_isar5;
+    t = FIELD_DP32(t, ID_ISAR5, AES, 2);
+    t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);
+    t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);
+    t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
+    t = FIELD_DP32(t, ID_ISAR5, RDM, 1);
+    t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);
+    cpu->isar.id_isar5 = t;
+
+    t = cpu->isar.id_isar6;
+    t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);
+    t = FIELD_DP32(t, ID_ISAR6, DP, 1);
+    t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
+    t = FIELD_DP32(t, ID_ISAR6, SB, 1);
+    t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
+    t = FIELD_DP32(t, ID_ISAR6, BF16, 1);
+    t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);
+    cpu->isar.id_isar6 = t;
+
+    t = cpu->isar.mvfr1;
+    t = FIELD_DP32(t, MVFR1, FPHP, 3);     /* v8.2-FP16 */
+    t = FIELD_DP32(t, MVFR1, SIMDHP, 2);   /* v8.2-FP16 */
+    cpu->isar.mvfr1 = t;
+
+    t = cpu->isar.mvfr2;
+    t = FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
+    t = FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
+    cpu->isar.mvfr2 = t;
+
+    t = cpu->isar.id_mmfr3;
+    t = FIELD_DP32(t, ID_MMFR3, PAN, 2); /* ATS1E1 */
+    cpu->isar.id_mmfr3 = t;
+
+    t = cpu->isar.id_mmfr4;
+    t = FIELD_DP32(t, ID_MMFR4, HPDS, 1); /* AA32HPD */
+    t = FIELD_DP32(t, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
+    t = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
+    t = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
+    cpu->isar.id_mmfr4 = t;
+
+    t = cpu->isar.id_pfr0;
+    t = FIELD_DP32(t, ID_PFR0, DIT, 1);
+    cpu->isar.id_pfr0 = t;
+
+    t = cpu->isar.id_pfr2;
+    t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
+    cpu->isar.id_pfr2 = t;
+
+    t = cpu->isar.id_dfr0;
+    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
+    cpu->isar.id_dfr0 = t;
+}
+
 #ifndef CONFIG_USER_ONLY
 static uint64_t l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
@@ -998,7 +1058,6 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
 static void arm_max_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
-    uint32_t t;
 
     /* aarch64_a57_initfn, advertising none of the aarch64 features */
     cpu->dtb_compatible = "arm,cortex-a57";
@@ -1039,58 +1098,7 @@ static void arm_max_initfn(Object *obj)
     cpu->ccsidr[2] = 0x70ffe07a; /* 2048KB L2 cache */
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 
-    /* Add additional features supported by QEMU */
-    t = cpu->isar.id_isar5;
-    t = FIELD_DP32(t, ID_ISAR5, AES, 2);
-    t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);
-    t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);
-    t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
-    t = FIELD_DP32(t, ID_ISAR5, RDM, 1);
-    t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);
-    cpu->isar.id_isar5 = t;
-
-    t = cpu->isar.id_isar6;
-    t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);
-    t = FIELD_DP32(t, ID_ISAR6, DP, 1);
-    t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
-    t = FIELD_DP32(t, ID_ISAR6, SB, 1);
-    t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
-    t = FIELD_DP32(t, ID_ISAR6, BF16, 1);
-    t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);
-    cpu->isar.id_isar6 = t;
-
-    t = cpu->isar.mvfr1;
-    t = FIELD_DP32(t, MVFR1, FPHP, 3);     /* v8.2-FP16 */
-    t = FIELD_DP32(t, MVFR1, SIMDHP, 2);   /* v8.2-FP16 */
-    cpu->isar.mvfr1 = t;
-
-    t = cpu->isar.mvfr2;
-    t = FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
-    t = FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
-    cpu->isar.mvfr2 = t;
-
-    t = cpu->isar.id_mmfr3;
-    t = FIELD_DP32(t, ID_MMFR3, PAN, 2); /* ATS1E1 */
-    cpu->isar.id_mmfr3 = t;
-
-    t = cpu->isar.id_mmfr4;
-    t = FIELD_DP32(t, ID_MMFR4, HPDS, 1); /* AA32HPD */
-    t = FIELD_DP32(t, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
-    t = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
-    t = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
-    cpu->isar.id_mmfr4 = t;
-
-    t = cpu->isar.id_pfr0;
-    t = FIELD_DP32(t, ID_PFR0, DIT, 1);
-    cpu->isar.id_pfr0 = t;
-
-    t = cpu->isar.id_pfr2;
-    t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
-    cpu->isar.id_pfr2 = t;
-
-    t = cpu->isar.id_dfr0;
-    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
-    cpu->isar.id_dfr0 = t;
+    arm32_max_features(cpu);
 
 #ifdef CONFIG_USER_ONLY
     /*
-- 
2.25.1

