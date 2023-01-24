Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3294167ejc;
        Mon, 23 Jan 2023 16:01:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvDSpjCAwT4jyX4OPrwAxOiVIySNPvK/FIbYiHH0cZub8Z+H1OvJQKuJcCmXgY24bwsfafd
X-Received: by 2002:a05:6830:1291:b0:686:7743:8fb with SMTP id z17-20020a056830129100b00686774308fbmr8306942otp.31.1674518497273;
        Mon, 23 Jan 2023 16:01:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674518497; cv=none;
        d=google.com; s=arc-20160816;
        b=yiVOoA/CkIQKAJyIC0zoea5ug5rGq3qcW+yx4ZAZQwsfOoglxl6m5Y/D6iydzlobyS
         RP020LmuFX5g/YBo6pUWd+QNGMyY1dbMAdNr0ZFKBFIrILRyt5lnotG0Vk1zPhU9R7Pf
         nx/NNRvJr6nsCQ13KDrslwjEcqaUPgiGBE+1LiXY4zJHnucqPXNiHtgnAY6D0ub35EpH
         5XzNarEYr4zPu6cDNUbmG3xuizcT+aUQVb7FHKQv5GE0vbrtTeAev+COJQntwHII83pT
         L+wHSHbNrgDTPoVDe7pJ+eulUO9aoRUrXJ1Hz3fFnYcObaLSGSsNSsqM/6Lw/g+cVwy2
         JiYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=F6JnjYYyfWuQ76nLJMJggCd96mltrDtBeLHdFG+/fn0=;
        b=S5eHVu1zX31AkwOvzURHTIp16EYV4705Yxy2f1iNg9PQ6GgUbEJwF4KQTzxCTF5Jbb
         vWscqaIHTQXD2d08UzsU3NZgxDsxvfbse0mQK4r/PsLTO+FJhcJCFczxDzUWGwVw5wTI
         vWmah8DEsrpKnB2wmqNDVqdBxcd88h3tPHmJ4AgJ/CHjnZ1EVkVmwoqPiktoEfjovgPK
         Qvkh/u1W4H9FfLhF/10uJUjhunSyzjLu3g0ZO0DC557EpqwRGoMDNMYzZO4ONrjn/Qom
         JGeLgaH4A/CVt33fyBvRZZvLqLYrXgBLsaLg9AufTIiKgVLMhRiX+/lNI/A012K1w10w
         aHbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZH8SXape;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3-20020a37de03000000b007061a0f0e46si431735qkj.624.2023.01.23.16.01.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 16:01:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZH8SXape;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pK6kJ-0008Lu-6s; Mon, 23 Jan 2023 19:01:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kG-0008BX-Oh
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 19:01:01 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kE-0001s3-GC
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 19:01:00 -0500
Received: by mail-pg1-x536.google.com with SMTP id r18so10224989pgr.12
 for <qemu-arm@nongnu.org>; Mon, 23 Jan 2023 16:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F6JnjYYyfWuQ76nLJMJggCd96mltrDtBeLHdFG+/fn0=;
 b=ZH8SXapeW/ubErkQQ/SgQzs5hDrtcJWJfftxwX/CkHCCVYrX5vQB0t8gC/wBtMPHHf
 SNBoSM0YMU7KABdhHyd4XQiIEhhQYRuW+489A5RVdeSSU8N8MC0GOYiXIva9AeR5wvMr
 HmL3EveaJzWy01eomOF3Q5kRftrPUFkHJYukrZQV7j9G8YsqKg7aHWR329/Xo6hvMY7X
 Dp9PTRAIDfz3G0su1RNQGyaa4UtU0SnLm7XOtoHx5m/nxte+qIcY/FG/NW1a3kc7dIAv
 gTio2B9N9hpf4wAb1Q47xfXAeInwKzQRWn5mYYrnOHXV4y83HSC0cf2OyOPR3RpMdDNf
 1Hig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F6JnjYYyfWuQ76nLJMJggCd96mltrDtBeLHdFG+/fn0=;
 b=YoNYkPq5C7L8OSzIfgmgNZRyzqq4Bf5A4nMRnnzmFR654MrWeT3mWxfMPxAeo1/uY5
 BXMkLmh+mu6R4hW5XTBC2Tq9EIglprnDooao3nCJXO6H6WHs7P0tvCDojEzvrNhKoBii
 gQGO4HblOzIK1NyXiqQ0QxPWBYhIocpKzEunGxb6uemQZPvVW8mZZ4sZvH8bv569hzEl
 Uriv7xcOvAh5hoEpdGq9dxowA/Evm1zr4QESGbnqrQZo9KhJLEZZKYQqwwst03EEIs4X
 l5NiVbpw4Yt2pXADgkxb61kbQoBeP8ivVUNuqny2J1V4eqxNZNYFMpC46OaJoBmCpnaC
 KU7w==
X-Gm-Message-State: AFqh2kqDjN4ntTezoQLHiez1DIHanrOHwalbQ1V4ZJNox1Fv4EakZZaH
 EifwK8xVY8hkeaiQsNhNZNAS5g==
X-Received: by 2002:a05:6a00:190e:b0:58b:c1a1:4006 with SMTP id
 y14-20020a056a00190e00b0058bc1a14006mr32861709pfi.18.1674518457191; 
 Mon, 23 Jan 2023 16:00:57 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:00:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 06/22] target/arm: Add RME cpregs
Date: Mon, 23 Jan 2023 14:00:11 -1000
Message-Id: <20230124000027.3565716-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
X-TUID: XjjKlfh7CQD9

This includes GPCCR, GPTBR, MFAR, the TLB flush insns PAALL,
PAALLOS, RPALOS, RPAOS, and the cache flush insn CIPAPA.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 19 ++++++++++++
 target/arm/helper.c | 74 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9d1a6b346d..26bdd6e465 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -529,6 +529,11 @@ typedef struct CPUArchState {
         uint64_t disr_el1;
         uint64_t vdisr_el2;
         uint64_t vsesr_el2;
+
+        /* RME registers */
+        uint64_t gpccr_el3;
+        uint64_t gptbr_el3;
+        uint64_t mfar_el3;
     } cp15;
 
     struct {
@@ -1031,6 +1036,7 @@ struct ArchCPU {
     uint64_t reset_cbar;
     uint32_t reset_auxcr;
     bool reset_hivecs;
+    uint8_t reset_l0gptsz;
 
     /*
      * Intermediate values used during property parsing.
@@ -2324,6 +2330,19 @@ FIELD(MVFR1, SIMDFMAC, 28, 4)
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
index 783b675bd1..7bd15e9d17 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6848,6 +6848,77 @@ static const ARMCPRegInfo sme_reginfo[] = {
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
 #endif /* TARGET_AARCH64 */
 
 static void define_pmu_regs(ARMCPU *cpu)
@@ -8915,6 +8986,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_tlbios, cpu)) {
         define_arm_cp_regs(cpu, tlbios_reginfo);
     }
+    if (cpu_isar_feature(aa64_rme, cpu)) {
+        define_arm_cp_regs(cpu, rme_reginfo);
+    }
 #ifndef CONFIG_USER_ONLY
     /* Data Cache clean instructions up to PoP */
     if (cpu_isar_feature(aa64_dcpop, cpu)) {
-- 
2.34.1

