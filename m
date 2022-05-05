Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1304173lfj;
        Thu, 5 May 2022 12:23:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7r1vL7tZxG1dtHJgJrq/P+QPGuXu54VZOZI4nUSXYrnPM7Abr7UiTxykbiU0p3JmddiBv
X-Received: by 2002:a05:622a:11cc:b0:2f3:ad0d:ac52 with SMTP id n12-20020a05622a11cc00b002f3ad0dac52mr14991611qtk.88.1651778584013;
        Thu, 05 May 2022 12:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651778584; cv=none;
        d=google.com; s=arc-20160816;
        b=mPyqvLBj2rE60PX8NHuhLLi5XY74gIpDPdhx/GV3sj0CK87+yW2KcXngZVO6xUlh7c
         U8WkbM/Kuacy/EPyiUZ6p91HuS6OQ3sGTCgM+2gR2NwvDsHO/mkIZTb8BCmAZrUXClS/
         QuE8yCViv/OGV3tW8/HBmO++0/XQiyD32YF0SmD7eyx+f2L15wctRQiE0d3nIDF0lPQ0
         p3tIRS4tDSIdwx1zzf4Hn48Er1tei18ywSFnCNFlxmB5kkOQKB6/mlmUCDfiwqH2veYq
         lL6bbRawXlMCHWZRqwUW9X0Hw87wPiUY1Kzt5w7y/LI0+PyzQW94+rPGPV63CgSHvmRd
         JL8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PGHFtJCWwmKlydMV+7EArb7n4KOf/foV/LwhKZjMzG4=;
        b=RJg52ikUGxDrAkJWa2VRF2ZIn8DCNnIDQo0BwKnr7rx0A9R8CMLrqTXAZRkOco6K/c
         BhsmRATFxuGsRvIKCXa7Qht3RU1eKLXTqfN8djNEvXLKaA3++Cl9O2CId+hbLOkWQ9Tx
         euakULORmudQ+R4K6q6RMJrYIlG0oi7f8ouqAxt7JL2N42PiHexVu0MFYd9BdMKEIRYS
         jh4EsDjtPQZGiydniUpOZITAj/yFAY4z6zhV7nb4sNvjBZcMKcPxJG0ma3rP1mZQiVd6
         j9CDRnRVkFNWx5RemqGoTDpH6Cch9k8vcAMnIbnvujA7gS/P7dX6Xh6rod4eIpg9DNUR
         SMUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IKbXVDwo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14-20020a05622a000e00b002f367d03bc9si1315545qtw.182.2022.05.05.12.23.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 12:23:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IKbXVDwo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmh43-0008Rc-Ea
	for alex.bennee@linaro.org; Thu, 05 May 2022 15:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYW-0002hb-Cz
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:28 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:40251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYO-0004Pc-QI
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:28 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so5089111fac.7
 for <qemu-arm@nongnu.org>; Thu, 05 May 2022 11:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PGHFtJCWwmKlydMV+7EArb7n4KOf/foV/LwhKZjMzG4=;
 b=IKbXVDwokXPqLmh+9FpoSZ53DDdP1D4E9DZfWdk8kWgDvrBPRsMD0Kvab9IxDaRQ52
 TC9CwyMpU9t3sKD1wPNJElw7fcp+qJy5RYAIJjkrCcAF7dGn2Ym4Qic2nrssQiT8p8rH
 WvoFx0dqSMgloONDvki4lL+SE+0MXzD4/uJ58nx5++5S5YDp5fQx9wiVTzNjIUFomF0F
 KRhEvYKBWJiTVEFOBjP+9iE/v1rQC0oBKBV45sNQwPw6ktzYk0FsfdiRUZrKH6xJJvi9
 489AtdEWlQZjSTgSDkN4f586Qo2Q9mYUEhfqC1uyTaPJaK8XZhuw4Hrvo1SpEi8lSSHX
 c7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PGHFtJCWwmKlydMV+7EArb7n4KOf/foV/LwhKZjMzG4=;
 b=Rzz/A/hZ0RW6qg9scMUlZ2eqEQwOQhtiMW1hdBV66GFpJjeZsxC7+Jtz8i+V0bgAgk
 eVf++/JOz8A+RYkwBzXoD+An5zh7uGfOh4eNjDmnjjKVg0xlb8eQy9AXyxXMtTFpO1uX
 zbs9H//F8dD8h9s6WLJZvIYYc85xlMZ76paoqi97Rk6+NZjYmgz3TFlfKivd7OQjrGC6
 3AN+1eY8kprX1SAR46hl5Z1/n1X8brLloEuSzUBJJ+QheU6mBWndmRbzNp+k4B0rQ2qq
 zytdzN5q02vLlyof7GrYJAtRGaNTPBq5DI7dEaiMy+tIyeYsxfBV3g46mrZIT+r9Zl1T
 rEIQ==
X-Gm-Message-State: AOAM532VVo+GQRoFTykeARnOQB/SJDzjO2l4uAH7RGZUnChlMSdEJuuc
 87tCvf62K8n2PkZoowvT2cwyVOss/vNyFVbk
X-Received: by 2002:a05:6870:ac12:b0:ed:6a2a:68ec with SMTP id
 kw18-20020a056870ac1200b000ed6a2a68ecmr3031551oab.90.1651776619605; 
 Thu, 05 May 2022 11:50:19 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 08/24] target/arm: Split out aa32_max_features
Date: Thu,  5 May 2022 13:49:50 -0500
Message-Id: <20220505185006.200555-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
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
X-TUID: dmUYa5uo9xdg

Share the code to set AArch32 max features so that we no
longer have code drift between qemu{-system,}-{arm,aarch64}.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |   2 +
 target/arm/cpu64.c     |  50 +-----------------
 target/arm/cpu_tcg.c   | 114 ++++++++++++++++++++++-------------------
 3 files changed, 65 insertions(+), 101 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 343b465d51..c563b3735f 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1313,4 +1313,6 @@ static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
 void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
 #endif
 
+void aa32_max_features(ARMCPU *cpu);
+
 #endif
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 33a0a71900..6da42af56e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -682,7 +682,6 @@ static void aarch64_max_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint64_t t;
-    uint32_t u;
 
     if (kvm_enabled() || hvf_enabled()) {
         /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
@@ -799,57 +798,12 @@ static void aarch64_max_initfn(Object *obj)
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
+    aa32_max_features(cpu);
 
 #ifdef CONFIG_USER_ONLY
     /*
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 9aa2f737c1..b0dbf2c991 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -20,6 +20,66 @@
 #endif
 #include "cpregs.h"
 
+
+/* Share AArch32 -cpu max features with AArch64. */
+void aa32_max_features(ARMCPU *cpu)
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
@@ -994,7 +1054,6 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
 static void arm_max_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
-    uint32_t t;
 
     /* aarch64_a57_initfn, advertising none of the aarch64 features */
     cpu->dtb_compatible = "arm,cortex-a57";
@@ -1035,58 +1094,7 @@ static void arm_max_initfn(Object *obj)
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
+    aa32_max_features(cpu);
 
 #ifdef CONFIG_USER_ONLY
     /*
-- 
2.34.1

