Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1283017dyc;
        Fri, 4 Jul 2025 08:15:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUFIGDTASahqeil7TSczYJB8NReAtl2nAfYQkuX4GqBzCzX/798GEV9+5n8DXII2ONEpiQ8E7V690pRPA==@linaro.org
X-Received: by 2002:a05:6214:568c:b0:6fb:6732:a2c6 with SMTP id 6a1803df08f44-702c8b86506mr30673326d6.12.1751642113466;
        Fri, 04 Jul 2025 08:15:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751642113; cv=none;
        d=google.com; s=arc-20240605;
        b=gucqyNM1Y5T4PLcTD+THuZKc3JTXpfUjIYoluYzpiRYIvUYYv1EOBO6x6vBYzwMKy4
         uIlNViVGnlq/BkAacBnOURUYsUZ70hLgrpPRwbBAInZbThsxHHOcDue6b9lSxF+KEdOj
         BYEUboKCymayof5YsVW40IlCJEmUDviqhPhc6+TigUQ/dnj9wzrdOdzeVVhROT0gWaNm
         sx++OZia4ugCj1LHO0235BrC2VaUqhkpv7YqNblhE+6yG5wqGy0SJVHgUG4GcRMTDZgh
         LIi8Z2oN07FqnwwRJ8lmS0U8m15AZVxXGmSXuYB1pIA1I2meXzxZF8uXmJO+Xj76mK7e
         frqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Mp+FS8nNFswUhOtJAecxTCYZShRBLW2IyvTVb/fmyBo=;
        fh=R7wG/6IaBWc35UVtt4J+tGRfEycONQX379Ss1k75hXE=;
        b=CsIkWc/dW06xU/KNqD0tLiCSGeFUACoYrr6lT8dU/0TQbf8YZqM6Bp6G1i0uEH5ZQq
         +dRV7i98Zo7IL96PQl9tjBQybV/XxDd+3UYjC292mbb0nfJ5EmCNdRDfRpPaoc64ZNwx
         7gsAJkh3qgJUGvgeFhvh2DxzeMPjBjGYaTn+IwsNp+1sT5Aa+a4smeax6i/KwnKWL3Jl
         VKLou0SsjUih0xqhrCBezcdIzNcqJvLdZm6Yr3GyL+K2uG8fCGH3HPm58lw20JxGYKEO
         bl3xGgcf8p6harMGiMC4EKMr9nJFTMqn6G1SvoopsxquQXqPDank2po6d5WgqVJDik4u
         QPfg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RiO+lfz2;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 6a1803df08f44-702c4d1f125sor13160456d6.7.2025.07.04.08.15.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jul 2025 08:15:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RiO+lfz2;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751642113; x=1752246913; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mp+FS8nNFswUhOtJAecxTCYZShRBLW2IyvTVb/fmyBo=;
        b=RiO+lfz272n2qRR0kFeBZ03Go7k4lCjkPTuuWTLsELef92eIVT5juLCoD12MO6zlrW
         Oo83sPYPrZ4SUZxtu4GtmvyR0yRjSJ92Uuun/tzVdQKwLZbbFVJeRCcqbp7i7ubWMWzS
         3+w5j5qY5Vy8F9IrX0kr7SZ1rvQmgjdMLsOhi4wOQZD6jVDoQ4EdFsLVUFo8jSoINaOe
         JilV9EJPtLmkkBwPpadm/1QPbvsSINtTBsj6uwOm85lLeszlPqsFcW42DxbiPDLdbDuj
         wHvhsX7V9fuT2653ABZ0mUej7gSpPSrfX0Z+lco9B331cG+yCK5iKHnUmFzqEra6il8e
         ff2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642113; x=1752246913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mp+FS8nNFswUhOtJAecxTCYZShRBLW2IyvTVb/fmyBo=;
        b=Wwb/2rv85gdPSQP1eb5G/eHSV8Tw6ScaC2/OpBMDXrb33B8De7GhC9Mj/f3xRc7ABo
         yIJgzdEAlS+/5xbKvJnjxV8Z402FY1mE1NsI8ys/s9buR/dP/TPf2jrywqKwHr8enSUM
         O4gyxQJB4c7/6udJDApi8p1WT6FwOEVWeZDtpjQ2ENaHKhjwQomrRLgklebkZ8siGTq8
         MaeNiSmnvvreRPWE6VlPNNide9dm0JB94Zj+Ws4+SdUxghDr0DPJFKU0DayqlWke3C+/
         AkYCNwy3vjQvssvuzjsKmP0nMo0kVT9hrxCYgW1Mu0EuXISH/5jXZcrGs7m848N3EB4W
         w+2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/8QZpgfDs+kMCD9vA1OUDEGxnod2kHuRy0CNSdhfgYjN5Re8AfSXP+UnYI00h+WjqY2vVLl7X8QjNgA==@linaro.org
X-Gm-Message-State: AOJu0YyQ7ryQpI3LAFMQ+AmtnRoUkO/FfdIZ6aaHLty592ompUvaMh0m
	PNWbtbnBkITJ+wAkL0o13uv6iv9Th3pCdG4uBn4v/r6X1GHS1+MqcHnroWpIjjhMim22R0yVy8O
	OUC4/twI=
X-Gm-Gg: ASbGncv+f5A4R2uXylAVGSl0lmCmrnbtySkf/KOXcWcVD5w/8TRoX6yhU0szsWidaH6
	csS/0U0vndIIsxlK+MumAUKj4Xv4fzyeS+u4KLpHoNUP79a/Y6c7W2sA42AZ8fCtvpiDjciMJ2A
	BK38F20lJNKR43gNWswXeN44slsiSvCkcfRwejoct9lydnmuV5pfKCTLOYKn+zkGebWTRunhgA2
	30JqRlKQO2cey2qQDv2p5ItU9gKVgAGpDH6JqGvLhzl29+3Q10SQuZHfBxBR21RvQpFicHmf6UZ
	y8FnnOW+bCCb4FdVA0S00FMUAkpbm9jCEKeHDalED+WyhqmB37ZP5B/cn/RCjroxfPhMqCNIn79
	fog==
X-Google-Smtp-Source: AGHT+IGnPSYZa7NKK/KNBH2+GrMrOd8yqr+MDF3k1dQh6bc7B4U5EVpM8oPAZSh2FEpcPsy+qHCMTw==
X-Received: by 2002:a05:6214:4993:b0:6fa:980d:52f with SMTP id 6a1803df08f44-702c8bcec02mr31874706d6.23.1751642112712;
        Fri, 04 Jul 2025 08:15:12 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([189.110.24.38])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d6039fsm13658666d6.111.2025.07.04.08.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:15:12 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org,
	gustavo.romero@linaro.org
Subject: [WIP-for-10.1 v2 4/5] target/arm: Add FEAT_TCR2
Date: Fri,  4 Jul 2025 15:14:30 +0000
Message-Id: <20250704151431.1033520-5-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704151431.1033520-1-gustavo.romero@linaro.org>
References: <20250704151431.1033520-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: R1reqNfyqSi2

Add FEAT_TCR2, which introduces TCR2_EL1 and TCR2_EL2 registers. These
registers are extensions of the TCR_ELx registers and provide top-level
control of the EL10 and EL20 translation regimes.

Since the bits in these registers depend on other CPU features, and only
FEAT_MEC is supported at the moment, the FEAT_TCR2 registers only
implement the bits related to FEAT_MEC for now.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu-features.h     |  5 +++++
 target/arm/cpu.h              |  1 +
 target/arm/helper.c           | 40 +++++++++++++++++++++++++++++++++++
 target/arm/internals.h        | 18 ++++++++++++++++
 5 files changed, 65 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 5a82c602f2..611d7385d8 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -143,6 +143,7 @@ the following architecture extensions:
 - FEAT_SPECRES (Speculation restriction instructions)
 - FEAT_SSBS (Speculative Store Bypass Safe)
 - FEAT_SSBS2 (MRS and MSR instructions for SSBS version 2)
+- FEAT_TCR2 (Support for TCR2_ELx)
 - FEAT_TGran16K (Support for 16KB memory translation granule size at stage 1)
 - FEAT_TGran4K (Support for 4KB memory translation granule size at stage 1)
 - FEAT_TGran64K (Support for 64KB memory translation granule size at stage 1)
diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index a42d1133c2..e6a731472f 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -485,6 +485,11 @@ static inline bool isar_feature_aa64_xs(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, XS) != 0;
 }
 
+static inline bool isar_feature_aa64_tcr2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr3, ID_AA64MMFR3, TCRX) != 0;
+}
+
 /*
  * These are the values from APA/API/APA3.
  * In general these must be compared '>=', per the normal Arm ARM
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ac38306873..6fd984a22f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -355,6 +355,7 @@ typedef struct CPUArchState {
         uint64_t vsttbr_el2; /* Secure Virtualization Translation Table. */
         /* MMU translation table base control. */
         uint64_t tcr_el[4];
+        uint64_t tcr2_el[3];
         uint64_t vtcr_el2; /* Virtualization Translation Control.  */
         uint64_t vstcr_el2; /* Secure Virtualization Translation Control. */
         uint32_t c2_data; /* MPU data cacheable bits.  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 413672174b..c34aa18ee3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7887,6 +7887,42 @@ static const ARMCPRegInfo sctlr2_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.sctlr2_el[3]) },
 };
 
+static CPAccessResult tcr2_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
+{
+    return CP_ACCESS_OK;
+};
+
+static void tcr2_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                       uint64_t value)
+{
+    int el = arm_current_el(env);
+    uint64_t valid_mask = 0ULL;
+
+    valid_mask |= TCR2_AMEC0;
+    if (el_is_in_host(env, el)) {
+        if (cpu_isar_feature(aa64_mec, env_archcpu(env))) {
+            valid_mask |= TCR2_AMEC1;
+	}
+    }
+
+    value &= valid_mask;
+    raw_write(env, ri, value);
+}
+
+static const ARMCPRegInfo tcr2_reginfo[] = {
+    { .name = "TCR2_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .opc2 = 3, .crn = 2, .crm = 0,
+      .access = PL1_RW, .accessfn = tcr2_access,
+      .writefn = tcr2_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.tcr2_el[1]) },
+    { .name = "TCR2_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .opc2 = 3, .crn = 2, .crm = 0,
+      .access = PL2_RW, .accessfn = tcr2_access,
+      .writefn = tcr2_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.tcr2_el[2]) },
+};
+
 void register_cp_regs_for_features(ARMCPU *cpu)
 {
     /* Register all the coprocessor registers based on feature bits */
@@ -9157,6 +9193,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, sctlr2_reginfo);
     }
 
+    if (cpu_isar_feature(aa64_tcr2, cpu)) {
+        define_arm_cp_regs(cpu, tcr2_reginfo);
+    }
+
     if (cpu_isar_feature(any_predinv, cpu)) {
         define_arm_cp_regs(cpu, predinv_reginfo);
     }
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3360de9150..a4886f9406 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -201,6 +201,24 @@ FIELD(CPTR_EL3, TCPAC, 31, 1)
 #define TTBCR_SH1    (1U << 28)
 #define TTBCR_EAE    (1U << 31)
 
+#define TCR2_PNCH    (1ULL << 0)
+#define TCR2_PIE     (1ULL << 1)
+#define TCR2_E0POE   (1ULL << 2)
+#define TCR2_POE     (1ULL << 3)
+#define TCR2_AIE     (1ULL << 4)
+#define TCR2_D128    (1ULL << 5)
+#define TCR2_PTTWI   (1ULL << 10)
+#define TCR2_HAFT    (1ULL << 11)
+#define TCR2_AMEC0   (1ULL << 12)
+#define TCR2_AMEC1   (1ULL << 13)
+#define TCR2_DISCH0  (1ULL << 14)
+#define TCR2_DISCH1  (1ULL << 15)
+#define TCR2_A2      (1ULL << 16)
+#define TCR2_FNG0    (1ULL << 17)
+#define TCR2_FNG1    (1ULL << 18)
+#define TCR2_FNGNA0  (1ULL << 20)
+#define TCR2_FNGNA1  (1ULL << 21)
+
 FIELD(VTCR, T0SZ, 0, 6)
 FIELD(VTCR, SL0, 6, 2)
 FIELD(VTCR, IRGN0, 8, 2)
-- 
2.34.1
