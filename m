Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2244318dye;
        Sun, 29 Jun 2025 21:33:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUDYF6iogxrDq3ANWs5eZjsrTYZXhFFQmoFTj976NVPwQD8+0mquqzbd6jUrZQilGrQzccqUSz5Yf4Xuw==@linaro.org
X-Received: by 2002:a05:622a:1301:b0:474:e75e:fccc with SMTP id d75a77b69052e-4a7fcacd83emr204896411cf.35.1751257986238;
        Sun, 29 Jun 2025 21:33:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751257986; cv=none;
        d=google.com; s=arc-20240605;
        b=RDTXFi/LRXCVYQ4L7IDVHlB6GhXr7sWfN5EM+gPQkhaYYeav0MiJBUrEZaLgWFz5Ej
         wTqvUPE6CeL8AVJGsF7+Nzmj53ra5KJOPIF8JF5hLOARMwY2oSNecKITtnV1OFiv8xBV
         uLIWGgbMtWRQ7HGJr9vJZM0okiAT9wKeTgA/1NjcIELyPT8GmUmhBGh9twmAVShe17jq
         HAulGzZUHkZJKm+iXIWMsrlkmXLx3CNDxWxffoL65E/QMxKI5a/6HSP6JFj3P30pNgWO
         yCZ628KgK0xjK8iBhmf4a2SoT8iC3jF5Kma08WCdnwAzyQH1wYs8S3nGhFTa5KORYtVY
         atzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ac/L14+pskdVO/8psuhLq/nvDUBkV5afYQiukb3LTRs=;
        fh=Z+GITwQGu2TCRxmU8onGh4Uz15YSgFTSan30N8a2Poo=;
        b=LgwxvYVWAAO8TO+t5ck7nGmPArSd68/7x1afiV57xVrIqIWWf9sD4Z5DLnAN1zLSLF
         jLiL3+Cwhxhwt6QyqDRP6+7bNpXjE/0xyxu6f1AeRmA3VpbeuKBfW9sre9sP/buOiqrc
         MmHSzTfQASEXGVuY2NrHIi7aqkJFLyPiBrL+zVkoQyi1A+fnQg1o/9OKF1sae7gnWIem
         KjfJ1xsbzSXwFTH+7QpJ4kxniLf1oSpO+aWA9K0z+R4MTs31zhipNb4jdoBYHuVH2Zd7
         g1iMJ+g+H5x3yUzBxLZfccmbaLh/PBCaj8eDnzz5xFaNo+xxbTDKe7ujZvqnT/2SEi4v
         tYaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z7Hh9Juy;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d75a77b69052e-4a7fc1d7a76sor78460031cf.6.2025.06.29.21.33.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 29 Jun 2025 21:33:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z7Hh9Juy;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751257986; x=1751862786; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ac/L14+pskdVO/8psuhLq/nvDUBkV5afYQiukb3LTRs=;
        b=z7Hh9JuyzOmwdk7lAwKVE4IWFQ6J3o4YQBYZA4nhp725FNoD/5fOlMigmXQrMAVFmV
         esPCfLb1oOLkgVkce5o/RJf2IpseE2qq1ZhcbtcxKA9Fl6gUyhtp/sDi+2qxRznY9Pfd
         YN9UPMN5yCnJDIgsMj/GRJBHLmuKfVr3oGQW+Qbc9uMsMgmxr9JshxWZiArU1xEBIQ3d
         lE13kDbL3voxLjhRq9f40rr+2d+jrhZqoUQzB6Fis0+VqePHGqVUcRDyX/gm38sVg1wG
         /g8+qpFB/6MbvOc/qUVfaE0Cwuk4Yp9WsgeJ1cnBnaS9y8BinNjr7GdsVPT1kQVTIeOS
         TvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751257986; x=1751862786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ac/L14+pskdVO/8psuhLq/nvDUBkV5afYQiukb3LTRs=;
        b=i6Gkc6cHCy8bzxNQXPVnIbzgJjV43pQuKDyQ2bWhgTS0vwaenMD+W0m0j1qD5Lr7Jy
         qR25pe1kfgXzINkJHUrBKwZi6+RPtoM7BfoM3CV9uD0jgJQxOYr8Rk36c2DnGzSEZwnl
         hOF/aGaIOx/Zt2qL5wuJHqbzdgNHtAIhhn4oSzebXXTLfXbn67gPWBCEauv524g61Msu
         x9Agw/AIVe+iI5kNTGlv/RK2uVSxq2yeYyyaMXKsbcgQcm6paFS7bm1frzsx+iLyr3hR
         2TPp5pdBKGhK1D6PrhXPOX1zdeNgg3IjyU2jpMEPLfJnf5icK9LepVIK0KRXGigj3gbm
         8fTg==
X-Forwarded-Encrypted: i=1; AJvYcCV43ejy5rqrBzGuQcYDE9UMolLrGtTGK7STbRlgXul5Ho1SRXcQRNZBoE2dC8lNyTrWwzuQrKp5Zr+xbw==@linaro.org
X-Gm-Message-State: AOJu0YzM/aNjzJxYCPXnJS7x8+yQl3DEYBgSD3CzIGNyLOLCatAdh3mu
	mhisBuzH98cV0R4Xk+iEQ0KOpLcuT5rQwB+Kq9u82xTlqaHutTZzTuW6hlLmye2/8ViB1w==
X-Gm-Gg: ASbGncu26fCYJcOUlSKgklIkMJDfPQZNz8FlMqg0drdZIzOHppdKiw9vSHMFKX3N1cF
	KPJXv7n8LiGuD9vWtLymslKyLILz2f9cflg9Q/Z+iBbPW2XF2eQlsd7SH9uVQlwX/1D9m0v81zk
	aRlwlmF5wRdPCDFGorKKVe9+hEhRKTM+CkYDfnbqrQQ2FVkghJYy4AaGRRd0gVYj0nrJb7GE8iK
	xggqz7/DDbi1sqDfvkYYcxrdp06I4YCmxvkVDc3PwsZQqkMMU0XbKvDLmjmCpqWcdJZTGcZVngt
	46y+SCJlZ0rA6fysyykVV/VVGsxk5ZFjJXNGE3BGpgvzFm4Pbpx0l6IrUGAHmKybFCY=
X-Google-Smtp-Source: AGHT+IG0+6eUU7nIhJ/CuImTG1xLG3cPeCWy7xmdAbw1mWBudBCO1TE469WoXtur1MoIfdNnEd9hyA==
X-Received: by 2002:a05:622a:2c43:b0:4a7:234e:6c00 with SMTP id d75a77b69052e-4a7fd683b3dmr139092151cf.2.1751257985650;
        Sun, 29 Jun 2025 21:33:05 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.58.88])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc13971fsm53470171cf.20.2025.06.29.21.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 21:33:04 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	gustavo.romero@linaro.org
Subject: [PATCH 3/3] target/arm: Add FEAT_MEC registers
Date: Mon, 30 Jun 2025 04:32:37 +0000
Message-Id: <20250630043237.996788-4-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250630043237.996788-1-gustavo.romero@linaro.org>
References: <20250630043237.996788-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: IC+7Si4NXVSh

Add FEAT_MEC registers to the arm max cpu.

To work properly, FEAT_MEC also depends on FEAT_SCTLR2 and FEAT_TCR2, which are
not implemented in this commit. The bits in SCTLR2 and TCR2 control which
translation regimes use MECIDs, and determine which MECID is selected.

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
