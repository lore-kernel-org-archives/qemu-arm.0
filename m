Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp366301ejc;
        Wed, 9 Aug 2023 19:37:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGej0++PE9BKuUXHx9Q5Bx8tQiNU9hUMvqrVgMDVxJdClnte6zGIcY1pwzV7vOZb6Lg0VPj
X-Received: by 2002:a05:622a:5c6:b0:403:b849:a18d with SMTP id d6-20020a05622a05c600b00403b849a18dmr1630454qtb.30.1691635033292;
        Wed, 09 Aug 2023 19:37:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691635033; cv=none;
        d=google.com; s=arc-20160816;
        b=0bR6CsfJWDm99ChS7gxJetDMEis5eUWBSUNbSqfEDNMxQ26O10Emdg9VVzElHMPtXC
         crnmxUIGj5b0w5zAp4JhkDWG2yWr1Xijq2n+uTHddC3ybLOTQK8F0DDO5mmfjzZE3Af8
         Vs5YSaeq8Wo+hzJMEjOFbzmvRT+7nfpWefR0jbboskbA/WCBktaeghM/V6vagnW7MTjw
         H7P7q9iCzp7BXYQRKuNVDtw/yex/VJ10OrEiep7nZxyVZZTMVp9pwp/KMmUT+xs6m+4p
         AuBpx2DmWdNm6I+FdGZFh8c2+D8XUvUnFWf3i5LsBi3QKFpd+TtvrsIvmyNR+R4JELu6
         5n+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Nf9XjMu3LHBxXgSXZqt7S0nPQIM+HaIPhW4YZS55L/M=;
        fh=oweadga+1U1BKjDqlK8hSmEWEC1EUfcsKuPkDinEDsU=;
        b=G+ekaHp15xe7huLWak8lHZ0CcGbucWphc3B63qLoCvgSNkrvgHuZuTPmvQrEUxAAWo
         yKD2xq6CkWSzSCeuUgnt38KihXPxCZqU1ys+JXnykuGNf4r7sA2pqvyODBCaGogP6UGh
         GNt3n9rFDN1cWH+yR460U5MnY6Z5w9dWS58lUHLRHJpmqmiVtVxcAyros9tVwKRHKHMc
         SUKXiGe0wu2c8XQpKFjnEHZlij+CCvXbZnn2UjjzFyMwOz2m+C8hpQSyzfsB4oqH9f6g
         VwhOStuOwansaA4GM042XvciIrUkvCQp+mHRg2l14OL6m2JY79ajWI/ab75zF5xBX+i1
         wyRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BY3fq7DT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6-20020a0ce186000000b0062dde9e4960si229715qvl.128.2023.08.09.19.37.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Aug 2023 19:37:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BY3fq7DT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qTvWq-000105-Io; Wed, 09 Aug 2023 22:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTvWm-0000wk-2t
 for qemu-arm@nongnu.org; Wed, 09 Aug 2023 22:35:57 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTvWk-0004xm-1f
 for qemu-arm@nongnu.org; Wed, 09 Aug 2023 22:35:55 -0400
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-765a7768f1dso33208185a.0
 for <qemu-arm@nongnu.org>; Wed, 09 Aug 2023 19:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691634953; x=1692239753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nf9XjMu3LHBxXgSXZqt7S0nPQIM+HaIPhW4YZS55L/M=;
 b=BY3fq7DTH1R8/mWIJh41Tbldrn7lZoQn9OFh9Eq4rZSq+en2APuk6TI6ocT+qBcg+f
 dGvr4UzJ0SJghLhapRh/s2IaevB7OOPdW9FNH4vvUTll3IhJmoMscePcz2ulf9N+7Elz
 gys/VIGsxW4VyOJ8bjLRHlrR2xRF9zf84QDS41ndOCGOiWhZwiqbcSv1iqdK0Q1lPYzJ
 pidYXRmuYMYKADxoNFzTU8CDeK7F5OaI+bo8Oo0Biruvic79V6SKf9p9Ch/kaId3yDdz
 BkmvhbEFSHdT8bEwwb5l0G51AHI7bXhASet+lhwbaS1dH81BT/s6RMC/tLs5KtVSpCCL
 P57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691634953; x=1692239753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nf9XjMu3LHBxXgSXZqt7S0nPQIM+HaIPhW4YZS55L/M=;
 b=SD07VZFMk94/u7R6xV+E2MseAa5pgDxgxjjIXNg/eurGZQoo3MjMhoC+kkDKjVagUI
 B5ahhqpCzoqKIWk9g/D+PKG4YWAVsywUrVAcEC6SO5V74Yp49azfI+wWffS+xA0ASior
 fsFptfdtLKc1m/NfBxaj6qZnjzJ8spQvr6cTJAW+nJ9EK92Sya9G/Zwo8MrUOoFf8RGs
 /iXAZHjmPdEsPeN3M6l5LUVYD+uSpgtLr514DzvbX1o3m0XV722hp+fNAFeesjz7YZVU
 oN43yi10vXj4kjc3vNobunPXPyyWsgfEF1+i+b71ecot8lfh9ttNLhYK+rsc3vKpOB63
 QE7g==
X-Gm-Message-State: AOJu0Yz/n3S89WsCkn/mx4Ns7GvhSYHOPq8QeiFgt5yHq8j4nBds0lvq
 Tzr8u3NBh4KMiRRpmq1Mym7hOA==
X-Received: by 2002:a05:620a:3953:b0:768:14a8:9eb with SMTP id
 qs19-20020a05620a395300b0076814a809ebmr1113205qkn.9.1691634952888; 
 Wed, 09 Aug 2023 19:35:52 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:6bf0:9674:6ac4:f74c])
 by smtp.gmail.com with ESMTPSA id
 z7-20020aa791c7000000b0066ebaeb149dsm287283pfa.88.2023.08.09.19.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 19:35:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 3/5] target/arm: Allow cpu to configure GM blocksize
Date: Wed,  9 Aug 2023 19:35:46 -0700
Message-Id: <20230810023548.412310-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810023548.412310-1-richard.henderson@linaro.org>
References: <20230810023548.412310-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
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
X-TUID: yBXokdGszjJx

Previously we hard-coded the blocksize with GMID_EL1_BS.
But the value we choose for -cpu max does not match the
value that cortex-a710 uses.

Mirror the way we handle dcz_blocksize.

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
index 60e5f034d9..5ca9070c14 100644
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

