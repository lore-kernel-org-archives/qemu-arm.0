Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1649340ejc;
        Fri, 11 Aug 2023 14:41:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIdqtKBuX8OTwSLJ09S1Qdwwvm2BmTHulKMMyD7PnhuFBpDuTWX8xzZOptt+9/BVMzVsYW
X-Received: by 2002:a05:6808:1a0f:b0:3a5:98b4:c137 with SMTP id bk15-20020a0568081a0f00b003a598b4c137mr4405447oib.51.1691790102814;
        Fri, 11 Aug 2023 14:41:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691790102; cv=none;
        d=google.com; s=arc-20160816;
        b=qNQV0WEDdQrZBTJbTh7rtaChoj8a2gtcaTPAFq32/93NVB0QlGMeFycdFgo3e5vHs1
         trCEAJs0e+W8fYKfsTWBpDMThXgZAcvW/mO60YSIlQtPL53jissQW+zrk6yM5orjkCM4
         w+cogBpwBYnvxm2jZtCc8NMghMbQiTPkCOrkYazSR4jmhKsbqP7KYvMIonIVQZ+6u0Nn
         s/Il02xV6ACPds4AoqpqsrOs3X+MNcGOEicxXRPQ/bqK23HXFnsOS/g+1D288YhWJeT7
         FCJ8Gxb9m5l55oQcHBxJ6ux/gf0+xg9+Y8n7VQN93nya/EQHQ5rEHCnDsZqnx6wQl/5F
         ZxQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=j1HDlY48l/Qf/ki2iVDsjDhPW4rCIzt7x9Pb1GSFXNc=;
        fh=kxGXlgTeLWlsJR0GV8xa4fdlwcwSpWgmdC59sL6A/3Y=;
        b=c8X2d/b/mNHjeDiZ9cHDtMWSBSPpUtNOhrIXvwy3Im4+QUDsdKmC0LRx5cfKA/2QJC
         alqDVo5UluXx7nLlbNCuqg+ycfkqozwke4DvdoCdyVkl3HvCHIyznbl+QxuevyC3K4GK
         /4DN7T8wIQCF5S6+zQx3/qcHBmBXgNQ0hBV1vAKxLmTZAw8urHqthEMoRWh7w8GRHqCs
         tzFb2UO/ljVpHjngaozVy2VfHa1b86KVSFfJpVY4jkwWs/g4YGcUFMzXxNqzL9Ikidsg
         JBF+v4VW6I80rB9L4ffbB/oyy5261TfmJczlqk1pQiYtLK+aoIF8XelXq359X6bKH2j1
         DZTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qePn2+T/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e17-20020a0caa51000000b0063d16b31feasi2754601qvb.137.2023.08.11.14.41.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 14:41:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qePn2+T/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUZsL-0003FS-94; Fri, 11 Aug 2023 17:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUZsI-0003CG-JM
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 17:40:50 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUZsB-000285-J3
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 17:40:50 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-686f090310dso2240333b3a.0
 for <qemu-arm@nongnu.org>; Fri, 11 Aug 2023 14:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691790035; x=1692394835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j1HDlY48l/Qf/ki2iVDsjDhPW4rCIzt7x9Pb1GSFXNc=;
 b=qePn2+T/hy1hGH7kOke13fTqdFxwPD6Z5Ei0o5cloXoREQ6nyzzQAQ9gzjY+Ha6DTW
 4YvBfFXsLCknR45JPE/peG8fVyj6MS49eFxBgwUMzvi5FFV0IFo7FgWyqz+woSVx/LXk
 qNEKBuWZNwkNNNZa505TmZSBiFG6zvq8fJqsUrIm53BRZIDbUSCo0X+PQHMLQDknvYsf
 To25Na5wLYaiKqGMB8xyw7uOJCzYIS4we88xOO7SJjZCmtvm9Z+40WPS9D33L+XNoLQa
 2Mjw5nvsjkTO8dxtPMD6OAy9cEEYsa1ZlIhjWJU8OY0lCi5Kzj6r2HQV+iv3YjSYpuAG
 4iqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691790035; x=1692394835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j1HDlY48l/Qf/ki2iVDsjDhPW4rCIzt7x9Pb1GSFXNc=;
 b=MoIKcPz1TDUGy7bL4aMIWR+vxMiN5HyLplXD9ujvuffCkGmLPAiysg46SIaQBVc4qN
 YuIJI4DyrAch1v9u7cMn+KTZzadWDC4l3glAkeZBXfhSvuqreYhIxnAVvC9X508aQWWY
 Ku/IezggPgsfyyTD0W4APx0ysGc+R1fVlfX0QlnBw4sOwcqghK1uMTDCUJHA0TgUkp3w
 rLT/yC7w3f2muTMpkAX6LgkaLFcmGTOVcYcOKb1WLyg2O1MKzqeHTPAlP2wj4ZFuyaQf
 KfpQ4xl3sJyb/RBLui80tOC8lzi2oT/mCTOnoO/pdC0pS17eduMWkCpyMd7ZeBNh32ou
 7Nrg==
X-Gm-Message-State: AOJu0YyQM3wEQCfAiMe+x7UZAHZto8kDBk3uEumYJm/bsXFHdh0LbATh
 kKtkl9emTjy+NNZeO3OKVjYLMQ==
X-Received: by 2002:a17:90a:bc01:b0:26b:1da1:58af with SMTP id
 w1-20020a17090abc0100b0026b1da158afmr2757866pjr.47.1691790034677; 
 Fri, 11 Aug 2023 14:40:34 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:e773:351d:2db2:8a8a])
 by smtp.gmail.com with ESMTPSA id
 gk18-20020a17090b119200b00263ba6a248bsm5723840pjb.1.2023.08.11.14.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 14:40:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 02/11] target/arm: Allow cpu to configure GM blocksize
Date: Fri, 11 Aug 2023 14:40:22 -0700
Message-Id: <20230811214031.171020-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230811214031.171020-1-richard.henderson@linaro.org>
References: <20230811214031.171020-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: LQ92syRWNgcL

Previously we hard-coded the blocksize with GMID_EL1_BS.
But the value we choose for -cpu max does not match the
value that cortex-a710 uses.

Mirror the way we handle dcz_blocksize.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h               |  2 ++
 target/arm/internals.h         |  6 -----
 target/arm/tcg/translate.h     |  2 ++
 target/arm/helper.c            | 11 +++++---
 target/arm/tcg/cpu64.c         |  1 +
 target/arm/tcg/mte_helper.c    | 46 ++++++++++++++++++++++------------
 target/arm/tcg/translate-a64.c |  5 ++--
 7 files changed, 45 insertions(+), 28 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7fedbb34ba..dfa02eb4dc 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1075,6 +1075,8 @@ struct ArchCPU {
 
     /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
     uint8_t dcz_blocksize;
+    /* GM blocksize, in log_2(words), ie low 4 bits of GMID_EL0 */
+    uint8_t gm_blocksize;
 
     uint64_t rvbar_prop; /* Property/input signals.  */
 
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 0f01bc32a8..6fcf12c178 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1243,12 +1243,6 @@ void arm_log_exception(CPUState *cs);
 
 #endif /* !CONFIG_USER_ONLY */
 
-/*
- * The log2 of the words in the tag block, for GMID_EL1.BS.
- * The is the maximum, 256 bytes, which manipulates 64-bits of tags.
- */
-#define GMID_EL1_BS  6
-
 /*
  * SVE predicates are 1/8 the size of SVE vectors, and cannot use
  * the same simd_desc() encoding due to restrictions on size.
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index d1cacff0b2..f748ba6f39 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -151,6 +151,8 @@ typedef struct DisasContext {
     int8_t btype;
     /* A copy of cpu->dcz_blocksize. */
     uint8_t dcz_blocksize;
+    /* A copy of cpu->gm_blocksize. */
+    uint8_t gm_blocksize;
     /* True if this page is guarded.  */
     bool guarded_page;
     /* Bottom two bits of XScale c15_cpar coprocessor access control reg */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 50f61e42ca..f5effa30f7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7643,10 +7643,6 @@ static const ARMCPRegInfo mte_reginfo[] = {
       .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 6,
       .access = PL1_RW, .accessfn = access_mte,
       .fieldoffset = offsetof(CPUARMState, cp15.gcr_el1) },
-    { .name = "GMID_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 1, .crn = 0, .crm = 0, .opc2 = 4,
-      .access = PL1_R, .accessfn = access_aa64_tid5,
-      .type = ARM_CP_CONST, .resetvalue = GMID_EL1_BS },
     { .name = "TCO", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 7,
       .type = ARM_CP_NO_RAW,
@@ -9237,6 +9233,13 @@ void register_cp_regs_for_features(ARMCPU *cpu)
      * then define only a RAZ/WI version of PSTATE.TCO.
      */
     if (cpu_isar_feature(aa64_mte, cpu)) {
+        ARMCPRegInfo gmid_reginfo = {
+            .name = "GMID_EL1", .state = ARM_CP_STATE_AA64,
+            .opc0 = 3, .opc1 = 1, .crn = 0, .crm = 0, .opc2 = 4,
+            .access = PL1_R, .accessfn = access_aa64_tid5,
+            .type = ARM_CP_CONST, .resetvalue = cpu->gm_blocksize,
+        };
+        define_one_arm_cp_reg(cpu, &gmid_reginfo);
         define_arm_cp_regs(cpu, mte_reginfo);
         define_arm_cp_regs(cpu, mte_el0_cacheop_reginfo);
     } else if (cpu_isar_feature(aa64_mte_insn_reg, cpu)) {
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 8019f00bc3..4cd73779c8 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -868,6 +868,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
     cpu->dcz_blocksize = 7; /*  512 bytes */
 #endif
+    cpu->gm_blocksize = 6;  /*  256 bytes */
 
     cpu->sve_vq.supported = MAKE_64BIT_MASK(0, ARM_MAX_VQ);
     cpu->sme_vq.supported = SVE_VQ_POW2_MAP;
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index 9c64def081..3640c6e57f 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -421,46 +421,54 @@ void HELPER(st2g_stub)(CPUARMState *env, uint64_t ptr)
     }
 }
 
-#define LDGM_STGM_SIZE  (4 << GMID_EL1_BS)
-
 uint64_t HELPER(ldgm)(CPUARMState *env, uint64_t ptr)
 {
     int mmu_idx = cpu_mmu_index(env, false);
     uintptr_t ra = GETPC();
+    int gm_bs = env_archcpu(env)->gm_blocksize;
+    int gm_bs_bytes = 4 << gm_bs;
     void *tag_mem;
 
-    ptr = QEMU_ALIGN_DOWN(ptr, LDGM_STGM_SIZE);
+    ptr = QEMU_ALIGN_DOWN(ptr, gm_bs_bytes);
 
     /* Trap if accessing an invalid page.  */
     tag_mem = allocation_tag_mem(env, mmu_idx, ptr, MMU_DATA_LOAD,
-                                 LDGM_STGM_SIZE, MMU_DATA_LOAD,
-                                 LDGM_STGM_SIZE / (2 * TAG_GRANULE), ra);
+                                 gm_bs_bytes, MMU_DATA_LOAD,
+                                 gm_bs_bytes / (2 * TAG_GRANULE), ra);
 
     /* The tag is squashed to zero if the page does not support tags.  */
     if (!tag_mem) {
         return 0;
     }
 
-    QEMU_BUILD_BUG_ON(GMID_EL1_BS != 6);
     /*
-     * We are loading 64-bits worth of tags.  The ordering of elements
-     * within the word corresponds to a 64-bit little-endian operation.
+     * The ordering of elements within the word corresponds to
+     * a little-endian operation.
      */
-    return ldq_le_p(tag_mem);
+    switch (gm_bs) {
+    case 6:
+        /* 256 bytes -> 16 tags -> 64 result bits */
+        return ldq_le_p(tag_mem);
+    default:
+        /* cpu configured with unsupported gm blocksize. */
+        g_assert_not_reached();
+    }
 }
 
 void HELPER(stgm)(CPUARMState *env, uint64_t ptr, uint64_t val)
 {
     int mmu_idx = cpu_mmu_index(env, false);
     uintptr_t ra = GETPC();
+    int gm_bs = env_archcpu(env)->gm_blocksize;
+    int gm_bs_bytes = 4 << gm_bs;
     void *tag_mem;
 
-    ptr = QEMU_ALIGN_DOWN(ptr, LDGM_STGM_SIZE);
+    ptr = QEMU_ALIGN_DOWN(ptr, gm_bs_bytes);
 
     /* Trap if accessing an invalid page.  */
     tag_mem = allocation_tag_mem(env, mmu_idx, ptr, MMU_DATA_STORE,
-                                 LDGM_STGM_SIZE, MMU_DATA_LOAD,
-                                 LDGM_STGM_SIZE / (2 * TAG_GRANULE), ra);
+                                 gm_bs_bytes, MMU_DATA_LOAD,
+                                 gm_bs_bytes / (2 * TAG_GRANULE), ra);
 
     /*
      * Tag store only happens if the page support tags,
@@ -470,12 +478,18 @@ void HELPER(stgm)(CPUARMState *env, uint64_t ptr, uint64_t val)
         return;
     }
 
-    QEMU_BUILD_BUG_ON(GMID_EL1_BS != 6);
     /*
-     * We are storing 64-bits worth of tags.  The ordering of elements
-     * within the word corresponds to a 64-bit little-endian operation.
+     * The ordering of elements within the word corresponds to
+     * a little-endian operation.
      */
-    stq_le_p(tag_mem, val);
+    switch (gm_bs) {
+    case 6:
+        stq_le_p(tag_mem, val);
+        break;
+    default:
+        /* cpu configured with unsupported gm blocksize. */
+        g_assert_not_reached();
+    }
 }
 
 void HELPER(stzgm_tags)(CPUARMState *env, uint64_t ptr, uint64_t val)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 5fa1257d32..d822d9a9af 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -3786,7 +3786,7 @@ static bool trans_STGM(DisasContext *s, arg_ldst_tag *a)
         gen_helper_stgm(cpu_env, addr, tcg_rt);
     } else {
         MMUAccessType acc = MMU_DATA_STORE;
-        int size = 4 << GMID_EL1_BS;
+        int size = 4 << s->gm_blocksize;
 
         clean_addr = clean_data_tbi(s, addr);
         tcg_gen_andi_i64(clean_addr, clean_addr, -size);
@@ -3818,7 +3818,7 @@ static bool trans_LDGM(DisasContext *s, arg_ldst_tag *a)
         gen_helper_ldgm(tcg_rt, cpu_env, addr);
     } else {
         MMUAccessType acc = MMU_DATA_LOAD;
-        int size = 4 << GMID_EL1_BS;
+        int size = 4 << s->gm_blocksize;
 
         clean_addr = clean_data_tbi(s, addr);
         tcg_gen_andi_i64(clean_addr, clean_addr, -size);
@@ -13900,6 +13900,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->cp_regs = arm_cpu->cp_regs;
     dc->features = env->features;
     dc->dcz_blocksize = arm_cpu->dcz_blocksize;
+    dc->gm_blocksize = arm_cpu->gm_blocksize;
 
 #ifdef CONFIG_USER_ONLY
     /* In sve_probe_page, we assume TBI is enabled. */
-- 
2.34.1

