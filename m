Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BC1CD4F3D
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:10:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQXzE-0001oR-UK; Fri, 22 May 2026 18:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXxf-0007gK-HY
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:19 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXxd-0007nU-6e
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:19 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-36974217d4eso5051543a91.2
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487396; x=1780092196; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kTHwFIKNbfg9dWrGI6eyMMIObXMK3F2PxjT0NnTAeSI=;
 b=HLkXjfSUK3ilcn+eqMpBM9wrvHS1xCRACMorzTyFEZScIA7YDeCiRVskAIHn4+KqkO
 YZOtZsIQCtMKYvF+9v0yT3jYR+v99fdA8h/VLGq2i04Z9lp4IVkq5QvEZzyMZUATolVW
 fVvnQP+Ag4NibiOnLflnGGHXBNlBqZDmqVy/FF254OUWKfs2UzRRSmSbpAKEwSsiJXQW
 2Cl1IJQqoA00J6knrP0KQ6K0agtoAgZzZ8fQZojbVaCrusg/MFioBH3yfjRh6BartmJ5
 Ik0OTmToY4BuSk4cc4Z4m5s/4onnb00a729WxihFVfKp/YBDER2mbhnGXD94Kp3WoztL
 1/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487396; x=1780092196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kTHwFIKNbfg9dWrGI6eyMMIObXMK3F2PxjT0NnTAeSI=;
 b=eK89zvNfumveALAudNS+btVv7Vh0ck+Zpiz6nPT6ZL5A9dug6IOl6vfz3d2dAvwlVs
 1vEoxZPhPMNUV+CxqVmIvfz3A7F3gEhs0r1kjN0qBHxSkR4spDJaFNjKZa1gWaoMbmly
 8Rm+KHpgmcN6Ez3p6UcEvp8897gwyT5HiSuKNrjnKI8URKaenylxjk+ZOieE+u0aB27P
 nlqgD0L1OrJ8MZEUdl7jf6DwpnGSAQRKKx/AEBOXyCT3i6JBeknNz6DHp0AbqHsSjFmO
 HhHlk/xvNXnpAjsSInFJx/PS2To4RoGlr01mvpKB3uj17z3mPHs5oo9pfMFbtrgUV7/G
 TTtw==
X-Gm-Message-State: AOJu0YwO3/OgI+B5kEQKs5xwSzgNwHWhV1TVlkvT1Jeifgy6ticjycXn
 184yvMN714lTboiQ6mi6soo+Mq1gITbi1XpRaQOKHoFWwsXGzK61/xlzmpqa80EZYQAoJ+MpTtu
 KtONc
X-Gm-Gg: Acq92OHjpaaF4fMPlmgZIJ+94YM+m+Xgdf8R6rfouRJ17giJxzXOpsbbGoltmWEvwt7
 VcIf0j0XrgBULBdB1YtP8bBxSub6sNvci6m0318p2ks27es1yzRlFexaG9nIlQMxlce3vHdGa6S
 bkrdSH+3bok1bw1qKduhVPkFsrmdWIVw20AMnSeXefrrX7zY2BBTETXbzExotrgviE/Ak7IdPM3
 Y0PXAJu09Vj7uULUxnVxJ3JOuFtdkj3UE2ka1NymxClce5+A3zRs8lvGpzW2/ix2AE2zqU3w/FE
 pDlJdE5ds/he/5U4I7NO4kl37nhQA8lcwNZEuqsfUXudubsC0loURnZMHueNeyefbZCvy91/Cy5
 FZ3945aN5SJ24PhN7KSe6nxADaD77XS/t224dN4r66/glzB0r0keU/pvILAhVPqr3KVm5Ng3ZWW
 RxK+J2vZVx/LspmCM0KaAUGaZj1r9TDAIpof5ENU8=
X-Received: by 2002:a17:90b:4e84:b0:36a:95c:7613 with SMTP id
 98e67ed59e1d1-36a67732b8fmr5589676a91.10.1779487395534; 
 Fri, 22 May 2026 15:03:15 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a6772f486sm1726789a91.2.2026.05.22.15.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:03:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v7 08/64] target/arm: Introduce FPMR
Date: Fri, 22 May 2026 15:02:10 -0700
Message-ID: <20260522220306.235200-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Introduce the special register FPMR and its fields.
Migrate it when present.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h       |  5 +++++
 target/arm/cpu-features.h |  5 +++++
 target/arm/cpu.h          |  1 +
 target/arm/internals.h    | 10 ++++++++++
 target/arm/helper.c       | 12 +++++++++++-
 target/arm/machine.c      | 20 ++++++++++++++++++++
 6 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index f5ec7484c1..391c0e322b 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -149,6 +149,11 @@ enum {
      * should not trap to EL2 when HCR_EL2.NV is set.
      */
     ARM_CP_NV_NO_TRAP            = 1 << 22,
+    /*
+     * Flag: Access check for this sysreg is constrained by the
+     * ARM pseudocode function CheckFPMREnabled().
+     */
+    ARM_CP_FPMR                  = 1 << 23,
 };
 
 /*
diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index a7ab7e2a31..e13c1c1331 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1192,6 +1192,11 @@ static inline bool isar_feature_aa64_gcie(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64PFR2, GCIE) != 0;
 }
 
+static inline bool isar_feature_aa64_fpmr(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64PFR2, FPMR) != 0;
+}
+
 static inline bool isar_feature_aa64_tgran4_lpa2(const ARMISARegisters *id)
 {
     return FIELD_SEX64_IDREG(id, ID_AA64MMFR0, TGRAN4) >= 1;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 3c2bf476b2..a549a50b7d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -713,6 +713,7 @@ typedef struct CPUArchState {
          */
         uint64_t fpsr;
         uint64_t fpcr;
+        uint64_t fpmr;
 
         uint32_t xregs[16];
 
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 27ff94565e..4d04e35ec4 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -293,6 +293,16 @@ FIELD(CNTHCTL, EVNTIS, 17, 1)
 FIELD(CNTHCTL, CNTVMASK, 18, 1)
 FIELD(CNTHCTL, CNTPMASK, 19, 1)
 
+FIELD(FPMR, F8S1, 0, 3)
+FIELD(FPMR, F8S2, 3, 3)
+FIELD(FPMR, F8D, 6, 3)
+FIELD(FPMR, OSM, 14, 1)
+FIELD(FPMR, OSC, 15, 1)
+FIELD(FPMR, LSCALE, 16, 7)
+FIELD(FPMR, NSCALE, 24, 8)
+FIELD(FPMR, NSCALE_F16, 24, 5)
+FIELD(FPMR, LSCALE2, 32, 6)
+
 /* We use a few fake FSR values for internal purposes in M profile.
  * M profile cores don't have A/R format FSRs, but currently our
  * get_phys_addr() code assumes A/R profile and reports failures via
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6ad01b345f..ae1dd42dc4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6229,6 +6229,14 @@ static const ARMCPRegInfo aie_reginfo[] = {
       .type = ARM_CP_CONST, .resetvalue = 0 },
 };
 
+static const ARMCPRegInfo fpmr_reginfo[] = {
+    { .name = "FPMR", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 4, .opc2 = 2,
+      .access = PL0_RW, .type = ARM_CP_FPU | ARM_CP_FPMR,
+      .fieldoffset = offsetof(CPUARMState, vfp.fpmr),
+    }
+};
+
 void register_cp_regs_for_features(ARMCPU *cpu)
 {
     /* Register all the coprocessor registers based on feature bits */
@@ -7502,10 +7510,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             define_arm_cp_regs(cpu, mec_mte_reginfo);
         }
     }
-
     if (cpu_isar_feature(aa64_aie, cpu)) {
         define_arm_cp_regs(cpu, aie_reginfo);
     }
+    if (cpu_isar_feature(aa64_fpmr, cpu)) {
+        define_arm_cp_regs(cpu, fpmr_reginfo);
+    }
 
     if (cpu_isar_feature(any_predinv, cpu)) {
         define_arm_cp_regs(cpu, predinv_reginfo);
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 8dc766d322..58f8dfd53c 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -960,6 +960,25 @@ static const VMStateDescription vmstate_syndrome64 = {
     },
 };
 
+static bool fpmr_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+
+    return arm_feature(&cpu->env, ARM_FEATURE_AARCH64)
+           && cpu_isar_feature(aa64_fpmr, cpu);
+}
+
+static const VMStateDescription vmstate_fpmr = {
+    .name = "cpu/fpmr",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = fpmr_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT64(env.vfp.fpmr, ARMCPU),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static int cpu_pre_save(void *opaque)
 {
     ARMCPU *cpu = opaque;
@@ -1323,6 +1342,7 @@ const VMStateDescription vmstate_arm_cpu = {
         &vmstate_syndrome64,
         &vmstate_pstate64,
         &vmstate_event,
+        &vmstate_fpmr,
         NULL
     }
 };
-- 
2.43.0


