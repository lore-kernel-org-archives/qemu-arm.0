Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1282951dyc;
        Fri, 4 Jul 2025 08:15:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWV9ncyt+UVpsgyCExX+bxbaXCPZYhdvzVcvecv9W7aIqJ30JcO3RqkOcVDH6pRHDpCb6mJisoYDBbwKA==@linaro.org
X-Received: by 2002:a05:622a:27c4:b0:4a4:31e0:c834 with SMTP id d75a77b69052e-4a996843417mr32829141cf.46.1751642109275;
        Fri, 04 Jul 2025 08:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751642109; cv=none;
        d=google.com; s=arc-20240605;
        b=JXnrlu/fAqmIV4Fxud+skMPosRK67fcO3KdH1EILAA4vPHTFUqGiYI84DiFhDJDw+Y
         X51h94Nhz6nIKYLkrN9CWjLqm6bFoK7WhG/Q2qmUd8Pxh0xZiSWor9v8jZU5TTMIw11w
         eh/QnD/PDHLTfV5A+d3z2WZ4PKI20CtovdzlbqVjCeVjQNZQQrt/jQpPeGpBn3J2oapS
         YCBPDYaEu/oFfhASoTj52RW2Bx1MvBKDnwoOWLj/4ZMV8iizzeKyJA+fFMJwtczwx9/k
         E7eqz/+4ChBonKmjsiCNK+zHVcOENcjTd7GVw+DJQztT+SgyFaOtilNGqIfjlEXAhu1m
         3MVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=I2pA8Kdl7I3oMXH8ei53t6GkTDaEspN8YWJLUEgwyNk=;
        fh=AI1JKx6GIjUMIeEIkA7lXKZYW/9PUKlrfX3Q1puIi08=;
        b=QLRNOGifRCIG5cO9Poudo1XkqdB/uSBr04nckkVSEZsDLUr6xSoPqV8glP4J8TXEIW
         YLm5PSmuMn6jiPvaHw3QVoq1u/AkI4XJboIMvnWpdzasvRv1Ekzbp1ruCwzdNF/1+YdA
         Myn0d6ej4GzK4LWutMMJ7iMQTS8Ki8F5uc5/qLqyox5nq+ZPe2DihK3QIRwWCtQQA+g9
         X5RQVsgt9ojayfAEBjaGTf+KjgAsjRo++JzxcbvP731HwT7Zk+QAHpmMGZQfemigpIT3
         KK4hp04j6jvLZhSwP0I1WBZXwoumfZEVEGxmW+S+KEiLeSJiZuLn7qX7Wc/OwHzZkIOY
         hOaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dYVfIXAm;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id af79cd13be357-7d5dbe226a0sor149565885a.4.2025.07.04.08.15.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jul 2025 08:15:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dYVfIXAm;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751642109; x=1752246909; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2pA8Kdl7I3oMXH8ei53t6GkTDaEspN8YWJLUEgwyNk=;
        b=dYVfIXAmwozrFQ6EirDUg1f2XUkkeW9WXY8HWpaEXAg3SceBe7uPPIRZ8SBsdjtKhm
         6g+xRajvmC24+QDCjrZxHkxNcv7i9oJN0zVI/q8PmyC14v1h1im2eWxCwn7nNhUOE/c1
         6AEMyjmyYMAWrd9ZuIctlikJmOOfxZ9e4OUdFr7uoovEA4LeYAJqr+nko7kG6bZ9i1M5
         U9KmcEHyw/0EASU4V5Iiv7P0uRws2CWT4coiIrekgxhlT/S/i5KNiLAnKpRNGnFunsKQ
         km27mRQygbDkanuRsuMMP5vCFvnuDjDqYlT2wNtmezB2ebt5MMNy03AqS/qREhS53dDZ
         BvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642109; x=1752246909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2pA8Kdl7I3oMXH8ei53t6GkTDaEspN8YWJLUEgwyNk=;
        b=j+0BeRskqiM5fBBzrEuZapwUwid6iILvls/HdGgb9vWCAs+O51jhRCPp+LLzaw4FJg
         wBRy32IthGnXCIsAGCAcP8B/BTa+gICimsKbZXg+kKADl0jPXjI2AwA2+6+FBJQPP3W2
         4YubHN3K1h5vTByfaA6aLml/bIKctF+bH70eBXe7+ULqipkWREdgfu/IGoGLWLKYidlv
         b7KugPe/wazmOLQJFhUOmeVYCUkYRvkMIj/J1bxyWP8IzphkTdtb2v0CSXcaXn/tfCGE
         /Wcy0y/zliVzxczw5nn7rMDwS5oVQby2wdlNuYBqzspkChre8pijw3xFal4ECNvYlziC
         C/vA==
X-Forwarded-Encrypted: i=1; AJvYcCWTTfIHWcB2VV5Xn4EmPWJNrRB6iT4ZJyRMz4DkXs7mmuWaUgvO0Ye5cnkRLgaISpJ8rrb1PE7hMOlbdQ==@linaro.org
X-Gm-Message-State: AOJu0Yz9mDwnDSNorp9snF0KaHC+/0IgJY4fxL8HBa+B01L9MNSvitcH
	PpovRXwPlxS6YWJYC3wH+JakLo4Ww2ep0KARCM1RxRFZ+6q3AbNeE6kg9c0K4sn5fHVbAw==
X-Gm-Gg: ASbGncuP9vO361SrkMEI8xeg82HCZsKxHAJr0NX2hvBkLGXuU/TKDu9TD935pKPutHO
	dsaXjwU0kVhPkyFdGfjW+WqKnMzSZNo7LNEoARzkm1BCZuGLXYLXYaDrjfvXgZrlc8yO5s2Q/86
	80nA/peoDpPXtLFXv6lZAN4NUrhv7Mc5CY0ZHe9twk5pdWZPZJyAkjiWAs7kqsWXtdgjPzQA5TR
	tB5vDwNs38+za9JUfUiQR8pdnESoj3IpO6F5W0Yhkukow/g6t3xBlOK+DNeigiLtZoo+0/YwqlZ
	SQ88i6AzWmGqhP2krcUAWAM31m+fIEdGZovFsBlVbg0mzKjFu1j+kdJcAHZ7JNAeW2Q=
X-Google-Smtp-Source: AGHT+IHj77mXCr/eo8Y9pVElKQB6QlMeINThWHuNNEHwQi2m0hzBWii/jY6k/xnVh3sxR5m+fSPUHA==
X-Received: by 2002:a05:6214:301a:b0:702:c150:46c2 with SMTP id 6a1803df08f44-702c6d33a2dmr42807526d6.10.1751642108469;
        Fri, 04 Jul 2025 08:15:08 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([189.110.24.38])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d6039fsm13658666d6.111.2025.07.04.08.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:15:07 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org,
	gustavo.romero@linaro.org
Subject: [WIP-for-10.1 v2 2/5] target/arm: Add FEAT_MEC registers
Date: Fri,  4 Jul 2025 15:14:28 +0000
Message-Id: <20250704151431.1033520-3-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704151431.1033520-1-gustavo.romero@linaro.org>
References: <20250704151431.1033520-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: FCW/aGe7bs/f

Add all FEAT_MEC registers.

To work properly, FEAT_MEC also depends on FEAT_SCTLR2 and FEAT_TCR2,
which are not implemented in this commit. The bits in SCTLR2 and TCR2
control which translation regimes use MECIDs, and determine which MECID
is selected.

FEAT_MEC also requires two new cache management instructions, not
included in this commit, that will be implemented in subsequent commits.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 target/arm/cpu.h    | 14 +++++++
 target/arm/helper.c | 98 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8ce30ca857..9509217486 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -565,6 +565,16 @@ typedef struct CPUArchState {
 
         /* NV2 register */
         uint64_t vncr_el2;
+
+        /* MEC registers */
+        uint64_t mecidr_el2;
+        uint64_t mecid_p0_el2;
+        uint64_t mecid_a0_el2;
+        uint64_t mecid_p1_el2;
+        uint64_t mecid_a1_el2;
+        uint64_t mecid_rl_a_el3;
+        uint64_t vmecid_p_el2;
+        uint64_t vmecid_a_el2;
     } cp15;
 
     struct {
@@ -2389,6 +2399,10 @@ FIELD(MFAR, FPA, 12, 40)
 FIELD(MFAR, NSE, 62, 1)
 FIELD(MFAR, NS, 63, 1)
 
+FIELD(MECIDR, MECIDW, 0, 4)
+FIELD(MECID, MECID, 0, 16)
+FIELD(VMECID, MECID, 0, 16)
+
 QEMU_BUILD_BUG_ON(ARRAY_SIZE(((ARMCPU *)0)->ccsidr) <= R_V7M_CSSELR_INDEX_MASK);
 
 /* If adding a feature bit which corresponds to a Linux ELF
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 889d308807..9f8a284261 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6823,6 +6823,100 @@ static const ARMCPRegInfo nmi_reginfo[] = {
       .resetfn = arm_cp_reset_ignore },
 };
 
+static void mecidr_reset(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /* MECIDWidthm1 = 15, i.e. 16 bits is the width of a MECID. */
+    env->cp15.mecidr_el2 = FIELD_DP64(0, MECIDR, MECIDW, 15);
+}
+
+static uint64_t mecidr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    uint64_t valid_mask;
+
+    if (!arm_is_el2_enabled(env)) {
+        /* All bits are RES0. */
+        return 0ULL;
+    }
+
+    valid_mask = R_MECIDR_MECIDW_MASK;
+    return env->cp15.mecidr_el2 & valid_mask;
+}
+
+static CPAccessResult mecid_access(CPUARMState *env,
+                                   const ARMCPRegInfo *ri, bool isread)
+{
+    int el;
+
+    el = arm_current_el(env);
+    if (el == 2 && !(env->cp15.scr_el3 & SCR_MECEN)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+
+    return CP_ACCESS_OK;
+}
+
+static void mecid_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                        uint64_t value)
+{
+    uint64_t valid_mask;
+
+    valid_mask = R_MECID_MECID_MASK;
+    value &= valid_mask;
+    raw_write(env, ri, value);
+}
+
+static uint64_t mecid_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    uint64_t valid_mask;
+
+    valid_mask = R_MECID_MECID_MASK;
+    return raw_read(env, ri) & valid_mask;
+}
+
+static const ARMCPRegInfo mec_reginfo[] = {
+    { .name = "MECIDR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .opc2 = 7, .crn = 10, .crm = 8,
+      .resetfn = mecidr_reset,
+      .access = PL2_RW, .accessfn = mecid_access, .readfn = mecidr_read,
+      .writefn = arm_cp_write_ignore,
+      .fieldoffset = offsetof(CPUARMState, cp15.mecidr_el2) },
+    { .name = "MECID_P0_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .opc2 = 0, .crn = 10, .crm = 8,
+      .access = PL2_RW, .accessfn = mecid_access,
+      .readfn = mecid_read, .writefn = mecid_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.mecid_p0_el2) },
+    { .name = "MECID_A0_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .opc2 = 1, .crn = 10, .crm = 8,
+      .access = PL2_RW, .accessfn = mecid_access,
+      .readfn = mecid_read, .writefn = mecid_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.mecid_a0_el2) },
+    { .name = "MECID_P1_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .opc2 = 2, .crn = 10, .crm = 8,
+      .access = PL2_RW, .accessfn = mecid_access,
+      .readfn = mecid_read, .writefn = mecid_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.mecid_p1_el2) },
+    { .name = "MECID_A1_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .opc2 = 3, .crn = 10, .crm = 8,
+      .access = PL2_RW, .accessfn = mecid_access,
+      .readfn = mecid_read, .writefn = mecid_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.mecid_a1_el2) },
+    { .name = "MECID_RL_A_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .opc2 = 1, .crn = 10, .crm = 10,
+      .access = PL2_RW, .accessfn = mecid_access,
+      .readfn = mecid_read, .writefn = mecid_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.mecid_rl_a_el3) },
+    { .name = "VMECID_P_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .opc2 = 0, .crn = 10, .crm = 9,
+      .access = PL2_RW, .accessfn = mecid_access,
+      .readfn = mecid_read, .writefn = mecid_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.vmecid_p_el2) },
+    { .name = "VMECID_A_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .opc2 = 1, .crn = 10, .crm = 9,
+      .access = PL2_RW, .accessfn = mecid_access,
+      .readfn = mecid_read, .writefn = mecid_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.vmecid_a_el2) },
+};
+
 static void define_pmu_regs(ARMCPU *cpu)
 {
     /*
@@ -9008,6 +9102,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, nmi_reginfo);
     }
 
+    if (cpu_isar_feature(aa64_mec, cpu)) {
+        define_arm_cp_regs(cpu, mec_reginfo);
+    }
+
     if (cpu_isar_feature(any_predinv, cpu)) {
         define_arm_cp_regs(cpu, predinv_reginfo);
     }
-- 
2.34.1
