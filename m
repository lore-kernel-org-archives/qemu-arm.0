Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723DBCCD18E
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 20:20:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8lK2-0002gn-Kr; Tue, 14 Oct 2025 16:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lK0-0002fP-1x
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:36 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJ8-0005N3-QR
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:35 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-27ee41e074dso66627565ad.1
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 13:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760472454; x=1761077254; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xuDdploVwOohaJF+BjsThS/WupxUVcdL5+YNe+s9Q/s=;
 b=Cy/lLLnuOvT7THZkV1fXBxr8hTwvuOs6KwSV/tYxSdq+ZKgQ3+FfilNHIJcXW5kdie
 zB8wQO+Fd+spt1Vjhd5BzcBx+bRT3CsILHlwjZmxV8IBFF5XbnUvnv3URuESwokCCkM4
 /AGGWYD41/4IXV3Nb2gPuO9rpNbssvbfcIbTxjQGNgexws4wfbNafqeWDBbdrljM2Vtu
 3B/5CCDGlZwTB/H5oAH662n0t4zBW7tipk1s2QnnJ4onCpUTQomaYzYR5P1J3A4wH0fQ
 b6FKn/a11wZZ4GFlMMy1hILRyk17uCPHxoIb7c5l1oCj4uxiwbxc8pCdGQt/yn/sllIu
 TXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760472454; x=1761077254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xuDdploVwOohaJF+BjsThS/WupxUVcdL5+YNe+s9Q/s=;
 b=KPUIugcU/AVm/JiPtXbAcezv0MLcRUuLWLDWPgwHl5zlLRQbXJJFKsPfrd65g7q3ms
 fvYHY2r5bgaUu91YZ3kUDXFrALap0wDk5kgXDz3yrJLjeZS8N20idbKmH+6khutP/Ph+
 bF/338M2C+0HfZeSMedlJ+vKXj/C1kIkCBDkkhMo/qIVr/Q4QmUKtAHL5AbhlktGlaS2
 8sV8ipJ/Vg5xW6eyk1yyoGKh/5+nGic9r0KrZZw64qv4djuf+OJNtzZiwz8X+IC3VKPg
 fJlK601MzHc1kGsfZVy9y1t7vwI2bQOv3RKi/JS4m8XIsJfJFJUxqKY22wbQTWUqqNJy
 /tQg==
X-Gm-Message-State: AOJu0YxhyWCcB1lR/AXY7UX3FCwzw7el4iWe/jXv7bLgf2Hq4LtDVEsP
 BWBBDhpDr9AOuqFsI2UVyB5QPtVILQxORp0MvDlLu4FyOS6PrEpxseCueRyt2fUdr00=
X-Gm-Gg: ASbGncvJvl0gbCUMOOSv5CUsJHL7f34hImnE8AIMoORQ/dRuSsPyQFJlRwXVLzmCSNd
 xyE0vYxqqH+88+PcLf8N5fcqJM4F1p1z32eRckkVtH2isK8MPdgkyrnxONt3t/1HnT1JBqJlgBA
 lob4dZAqYz9cxQkcDvAMx3D1+/kQEFSnvEW/Ws/ZVlGHmFuu5HobPgYpg0GLxZd5pG4fobnAlp+
 l632Fzz3WTbhqEkVdLZ2v8Q0lJKTYyWdOIETJgqBXzjPLkdIAFpIxLXuFD6vlsg1voSeRhJLB7T
 4Nqw5X5Rm+VzEmiRcAd/nkSwGCA6iBfjbJYQnnxhrxStUmUcNowhPtOQQOx4Omfwn7MjHyAA3lE
 G7SBRktfbG4OiIimPBiadNXDOJTrEZJp1z1C0ICwj6jF4mjaDMsuAeufGXcXXdZUCLq/NggDx
X-Google-Smtp-Source: AGHT+IFNa97sdEi9aFqQfT5nF304TU8bIAG+GMGJJmNSRKsIlL1onZHwtcZXcirNEQcnNnU1yERxJA==
X-Received: by 2002:a17:902:fc4c:b0:28e:7841:d437 with SMTP id
 d9443c01a7336-290272c0474mr360122005ad.38.1760472454256; 
 Tue, 14 Oct 2025 13:07:34 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f93ea2sm172100975ad.126.2025.10.14.13.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 13:07:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 21/37] target/arm: Extend PAR_EL1 to 128-bit
Date: Tue, 14 Oct 2025 13:07:02 -0700
Message-ID: <20251014200718.422022-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014200718.422022-1-richard.henderson@linaro.org>
References: <20251014200718.422022-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Do not yet produce the 128-bit AT format result, but zero the
high bits whenever the low bits are written.  This corresponds
to PAR_EL1.D128 = 0, and bits [127:65] as RES0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 ++++-
 target/arm/internals.h     |  1 +
 target/arm/helper.c        | 18 +++++++++++++++++-
 target/arm/tcg/cpregs-at.c |  4 ++++
 4 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a030539488..e03d832717 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -429,7 +429,8 @@ typedef struct CPUArchState {
         };
         uint64_t hpfar_el2;
         uint64_t hstr_el2;
-        union { /* Translation result. */
+        /* Translation result. */
+        union {
             struct {
                 uint64_t _unused_par_0;
                 uint64_t par_ns;
@@ -438,6 +439,7 @@ typedef struct CPUArchState {
             };
             uint64_t par_el[4];
         };
+        uint64_t par_el1_hi;  /* high 64 bits of 128-bit PAR_EL1 */
 
         uint32_t c9_insn; /* Cache lockdown registers.  */
         uint32_t c9_data;
@@ -1750,6 +1752,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_SCTLR2EN          (1ULL << 44)
 #define SCR_PIEN              (1ULL << 45)
 #define SCR_AIEN              (1ULL << 46)
+#define SCR_D128EN            (1ULL << 47)
 #define SCR_GPF               (1ULL << 48)
 #define SCR_MECEN             (1ULL << 49)
 #define SCR_NSE               (1ULL << 62)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index a65386aaed..bda2400b65 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -251,6 +251,7 @@ FIELD(VSTCR, SA, 30, 1)
 #define HCRX_MSCEN    (1ULL << 11)
 #define HCRX_TCR2EN   (1ULL << 14)
 #define HCRX_SCTLR2EN (1ULL << 15)
+#define HCRX_D128EN   (1ULL << 17)
 #define HCRX_GCSEN    (1ULL << 22)
 
 #define HPFAR_NS      (1ULL << 63)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7800d83f48..f9a2a7d62d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -508,6 +508,20 @@ static CPAccessResult access_tacr(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+static CPAccessResult access_d128(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
+{
+    int el = arm_current_el(env);
+
+    if (el <= 1 && !(arm_hcrx_el2_eff(env) & HCRX_D128EN)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    if (el <= 2 && !(env->cp15.scr_el3 & SCR_D128EN)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
 static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -3279,7 +3293,9 @@ static void define_par_register(ARMCPU *cpu)
         .name = "PAR_EL1", .state = ARM_CP_STATE_AA64,
         .opc0 = 3, .opc1 = 0, .crn = 7, .crm = 4, .opc2 = 0,
         .access = PL1_RW, .fgt = FGT_PAR_EL1,
-        .fieldoffset = offsetof(CPUARMState, cp15.par_el[1])
+        .type = ARM_CP_128BIT, .access128fn = access_d128,
+        .fieldoffset = offsetof(CPUARMState, cp15.par_el[1]),
+        .fieldoffsethi = offsetof(CPUARMState, cp15.par_el1_hi),
     };
 
     static ARMCPRegInfo par64_reginfo[2] = {
diff --git a/target/arm/tcg/cpregs-at.c b/target/arm/tcg/cpregs-at.c
index 0e8f229aa7..9e6af3d974 100644
--- a/target/arm/tcg/cpregs-at.c
+++ b/target/arm/tcg/cpregs-at.c
@@ -353,6 +353,7 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
 
     ss = for_el3 ? arm_security_space(env) : arm_security_space_below_el3(env);
     env->cp15.par_el[1] = do_ats_write(env, value, access_perm, mmu_idx, ss);
+    env->cp15.par_el1_hi = 0;
 }
 
 static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -496,6 +497,7 @@ static void ats_s1e1a(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     ARMSecuritySpace ss = arm_security_space_below_el3(env);
 
     env->cp15.par_el[1] = do_ats_write(env, value, 0, mmu_idx, ss);
+    env->cp15.par_el1_hi = 0;
 }
 
 static void ats_s1e2a(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
@@ -505,12 +507,14 @@ static void ats_s1e2a(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     ARMSecuritySpace ss = arm_security_space_below_el3(env);
 
     env->cp15.par_el[1] = do_ats_write(env, value, 0, mmu_idx, ss);
+    env->cp15.par_el1_hi = 0;
 }
 
 static void ats_s1e3a(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     env->cp15.par_el[1] = do_ats_write(env, value, 0, ARMMMUIdx_E3,
                                        arm_security_space(env));
+    env->cp15.par_el1_hi = 0;
 }
 
 static const ARMCPRegInfo ats1a_reginfo[] = {
-- 
2.43.0


