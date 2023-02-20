Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2706926ejb;
        Mon, 20 Feb 2023 15:27:55 -0800 (PST)
X-Google-Smtp-Source: AK7set+lBJxTV6Xwxxa9AtL8LWuekSne6KMXY2o3pzWaWsIpUdu3Rd4Q/n29vPKckPbmVSBFmouV
X-Received: by 2002:a05:622a:8f:b0:3b9:a63e:35c0 with SMTP id o15-20020a05622a008f00b003b9a63e35c0mr4323987qtw.16.1676935674946;
        Mon, 20 Feb 2023 15:27:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676935674; cv=none;
        d=google.com; s=arc-20160816;
        b=oTdA7PYHqp2qfvCF3X+N0O9xAwG27NjAuIeIR9pn5tCv9Snhh+mvJ1+Vla0ymOgwKf
         TTIy8Xi7JbZFtYfkQQ5JzLu23Mcq3vX9tDzKJwie0QsROSZkAfvDPBfQoiltIgdwswTe
         rRMV1s3N2Ukge8lHec4fWtipAdL78ROzCOeG0z8CvnwWhDuakP56DXFReizXO7BNEVP+
         OCZbIYCtVWEDhibB6Z7B+oqXYfkmCZKD3ekHHPakWu0hGIlgLi1yCZ9nH0S5PSRsJ4Ak
         VRP9MWLEKpg5SNJfKxN8FRFJdlC+B4jE8NSXwGIaGV6orzkEm/uWCNCgeXqa+QDZkR9w
         i50A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kl7nsc9p6BIDSk+FSIUoP/kFXINcnp5gsZ8dnkbWdwU=;
        b=DFFgiVoW3QkSh/Cn1QiszYRGiPRXRMNzVqsh+bQthwCe6+uFuh2fVvgozE1RzOrz9S
         DwDRy/Ecz6I5UBo1lz5qf4leAe972o5iq84nDRzAevS8tpk7KRRiPnyRmaT0Fg6J4Lek
         6jiPgFEAijCzRHhvE0r6Uv42mw/KvQdDP92untMYbZRhVp7Qa1sNh2lOu8BfIKDSacTn
         evpHTxqCFK0uyPzQeRNZ8ftAM4j/Scg65IKcnjIRrmz5yXxgO6GkY2YSpjxI41VI5/QN
         /KW+P1xUopkzk3beUJi83HQ9+O99/odEiZbJdK2H4tlg1utIKJ5lHHF/ITjET/+OF9w0
         ppyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Px0cV/J3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11-20020a05622a110b00b003b9fc920075si1636657qty.199.2023.02.20.15.27.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 15:27:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Px0cV/J3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUFYQ-0003ko-Qs; Mon, 20 Feb 2023 18:26:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYQ-0003jZ-2K
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:26:42 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYO-0000Jk-4X
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:26:41 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 na9-20020a17090b4c0900b0023058bbd7b2so2870370pjb.0
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 15:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kl7nsc9p6BIDSk+FSIUoP/kFXINcnp5gsZ8dnkbWdwU=;
 b=Px0cV/J3cA5nxUSIyPH4WmDlrGXHRfWGHBHPLb9gDVPzqc5DzcQKJSyzqE9QlLI+KI
 MP0WilTKdLe3pXXIH00HYQMyLsx62Pkqwk6Y/a1VB8bKZpfoW7Bizazr8jZyFSj1hq6E
 ASiaiGbPrGXVTacms4f97QAVgpX0FOiK7uTEzf/O7O6hgzlAo4w3JO1TwflpHZIYew6h
 yICHGIc4nhDV/KSmGXZXjCaqbpkBKNmpArxqGPrBv4FQy+j/U1cr+O25W87Znir7OezD
 6WLLXy02d05orj0R+erfCvNimihBA7U8BBPh4y3xIYrv5aXNr7uAJtTLWTEX1Ok7JS/i
 1+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kl7nsc9p6BIDSk+FSIUoP/kFXINcnp5gsZ8dnkbWdwU=;
 b=uBDDWVWQuJ6DwHGMh2tbzlppGrPctV4shh/vRemsaR4XtH7Hcwz25DkYPmfPS6rVJe
 XXONrxkVB2cbrqGm4LFQbJD5V5MHHKPqctestoqqsIYYGxReo6WtkePTL4YVvWfk2PAM
 Rf5GyrPWFWHD699NMjDXFt+Er6JTT9kSOSyut6uKgPg5Y8IFU91GiassCU3fn7DbwCN5
 HXi3ACdZKgM54UwR06vv7ZEG1gV7pjZdGxYUI63lbUElCfaw78cVcTzWNqnWMbvxkfv1
 +T176TbmgJXwz6zK/x+c2lp8VRowIo9g8VoxuvXDu+WAChM1unOWYeWoz51lYvQ80MOx
 xl3w==
X-Gm-Message-State: AO0yUKUfq7S6plCnbR/341XttgJ7Wc1eMH3PccfPRxw9i6N2FxyBVblq
 6yUAUAGe20QajOBig/j9jWXQmw==
X-Received: by 2002:a17:902:d4cc:b0:19b:dc8:c67b with SMTP id
 o12-20020a170902d4cc00b0019b0dc8c67bmr2462597plg.50.1676935598836; 
 Mon, 20 Feb 2023 15:26:38 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 05/21] target/arm: Add RME cpregs
Date: Mon, 20 Feb 2023 13:26:10 -1000
Message-Id: <20230220232626.429947-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-TUID: NDE2U8ddyGo1

This includes GPCCR, GPTBR, MFAR, the TLB flush insns PAALL, PAALLOS,
RPALOS, RPAOS, and the cache flush insns CIPAPA and CIGDPAPA.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 19 +++++++++++
 target/arm/helper.c | 83 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 486baf3924..6a97c727d1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -541,6 +541,11 @@ typedef struct CPUArchState {
         uint64_t fgt_read[2]; /* HFGRTR, HDFGRTR */
         uint64_t fgt_write[2]; /* HFGWTR, HDFGWTR */
         uint64_t fgt_exec[1]; /* HFGITR */
+
+        /* RME registers */
+        uint64_t gpccr_el3;
+        uint64_t gptbr_el3;
+        uint64_t mfar_el3;
     } cp15;
 
     struct {
@@ -1043,6 +1048,7 @@ struct ArchCPU {
     uint64_t reset_cbar;
     uint32_t reset_auxcr;
     bool reset_hivecs;
+    uint8_t reset_l0gptsz;
 
     /*
      * Intermediate values used during property parsing.
@@ -2336,6 +2342,19 @@ FIELD(MVFR1, SIMDFMAC, 28, 4)
 FIELD(MVFR2, SIMDMISC, 0, 4)
 FIELD(MVFR2, FPMISC, 4, 4)
 
+FIELD(GPCCR, PPS, 0, 3)
+FIELD(GPCCR, IRGN, 8, 2)
+FIELD(GPCCR, ORGN, 10, 2)
+FIELD(GPCCR, SH, 12, 2)
+FIELD(GPCCR, PGS, 14, 2)
+FIELD(GPCCR, GPC, 16, 1)
+FIELD(GPCCR, GPCP, 17, 1)
+FIELD(GPCCR, L0GPTSZ, 20, 4)
+
+FIELD(MFAR, FPA, 12, 40)
+FIELD(MFAR, NSE, 62, 1)
+FIELD(MFAR, NS, 63, 1)
+
 QEMU_BUILD_BUG_ON(ARRAY_SIZE(((ARMCPU *)0)->ccsidr) <= R_V7M_CSSELR_INDEX_MASK);
 
 /* If adding a feature bit which corresponds to a Linux ELF
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2ebca3e2b6..c769218763 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6932,6 +6932,83 @@ static const ARMCPRegInfo sme_reginfo[] = {
       .access = PL2_RW, .accessfn = access_esm,
       .type = ARM_CP_CONST, .resetvalue = 0 },
 };
+
+static void tlbi_aa64_paall_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    CPUState *cs = env_cpu(env);
+
+    tlb_flush(cs);
+}
+
+static void gpccr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                        uint64_t value)
+{
+    /* L0GPTSZ is RO; other bits not mentioned are RES0. */
+    uint64_t rw_mask = R_GPCCR_PPS_MASK | R_GPCCR_IRGN_MASK |
+        R_GPCCR_ORGN_MASK | R_GPCCR_SH_MASK | R_GPCCR_PGS_MASK |
+        R_GPCCR_GPC_MASK | R_GPCCR_GPCP_MASK;
+
+    env->cp15.gpccr_el3 = (value & rw_mask) | (env->cp15.gpccr_el3 & ~rw_mask);
+}
+
+static void gpccr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    env->cp15.gpccr_el3 = FIELD_DP64(0, GPCCR, L0GPTSZ,
+                                     env_archcpu(env)->reset_l0gptsz);
+}
+
+static void tlbi_aa64_paallos_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    uint64_t value)
+{
+    CPUState *cs = env_cpu(env);
+
+    tlb_flush_all_cpus_synced(cs);
+}
+
+static const ARMCPRegInfo rme_reginfo[] = {
+    { .name = "GPCCR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 1, .opc2 = 6,
+      .access = PL3_RW, .writefn = gpccr_write, .resetfn = gpccr_reset,
+      .fieldoffset = offsetof(CPUARMState, cp15.gpccr_el3) },
+    { .name = "GPTBR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 1, .opc2 = 4,
+      .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.gptbr_el3) },
+    { .name = "MFAR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 6, .crm = 0, .opc2 = 5,
+      .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.mfar_el3) },
+    { .name = "TLBI_PAALL", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 7, .opc2 = 4,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_paall_write },
+    { .name = "TLBI_PAALLOS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 1, .opc2 = 4,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_paallos_write },
+    /*
+     * QEMU does not have a way to invalidate by physical address, thus
+     * invalidating a range of physical addresses is accomplished by
+     * flushing all tlb entries in the outer sharable domain,
+     * just like PAALLOS.
+     */
+    { .name = "TLBI_RPALOS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 4, .opc2 = 7,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_paallos_write },
+    { .name = "TLBI_RPAOS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 4, .opc2 = 3,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_paallos_write },
+    { .name = "DC_CIPAPA", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 7, .crm = 14, .opc2 = 1,
+      .access = PL3_W, .type = ARM_CP_NOP },
+};
+
+static const ARMCPRegInfo rme_mte_reginfo[] = {
+    { .name = "DC_CIGDPAPA", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 7, .crm = 14, .opc2 = 5,
+      .access = PL3_W, .type = ARM_CP_NOP },
+};
 #endif /* TARGET_AARCH64 */
 
 static void define_pmu_regs(ARMCPU *cpu)
@@ -9123,6 +9200,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_tlbios, cpu)) {
         define_arm_cp_regs(cpu, tlbios_reginfo);
     }
+    if (cpu_isar_feature(aa64_rme, cpu)) {
+        define_arm_cp_regs(cpu, rme_reginfo);
+        if (cpu_isar_feature(aa64_mte, cpu)) {
+            define_arm_cp_regs(cpu, rme_mte_reginfo);
+        }
+    }
 #ifndef CONFIG_USER_ONLY
     /* Data Cache clean instructions up to PoP */
     if (cpu_isar_feature(aa64_dcpop, cpu)) {
-- 
2.34.1

