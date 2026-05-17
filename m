Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B7ACD4F49
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:34:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPPN-0007c0-Lk; Sat, 16 May 2026 20:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOa-00079A-I6
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:17 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOX-0004t2-7R
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:16 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-c80227c9572so381134a12.2
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778977812; x=1779582612; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WK1q3UP9P6NsmMV4Mdmwr5OMlQgZn6qbug7f6ieaup4=;
 b=Rh/3yQYEGV3ZVy1dhtbHxO0RQcL03jDx5llw+XLEO6GBCDP8T3Iq2FzmWGinaTQPJI
 +mOT3LUF8lIpzqWzp6PHAJ64f2hjG3IaFWcbWgu6WfnDli5f9CQuvu+Qm9G57pIOTuN2
 yw62nNov/g/8UE+U/JATUX4XxtSc534IPH7NGctZXWXwOsKmbrZxPrVj63zT4DDT5KZK
 J+/4q7dR8kYU9KSC1wZoyivoznBZgtWCJkGqnEAk4FB6hyjlsJVdhqJS5NZH2P7Tr6np
 lDDNRj9FE1Qbz3nv4UvdNaUGv7KCgnecAnfNWW5oA+DTzRSvEPl4fa68kBJU2k78g9/S
 h7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778977812; x=1779582612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WK1q3UP9P6NsmMV4Mdmwr5OMlQgZn6qbug7f6ieaup4=;
 b=oJIVx7LoaIJm9MK1xGTl6j/jHXZ047AfHQbSA+DhO2FEQbR0lVu4rgwXQCjUINHUxC
 VSvq1u6zzS9AMmnKiGHun+LYPztFse2fs7teYUAP07s04so/dAYJ7/Qs20Twkz4rS17Q
 oRTGXWQRnsc3R19QwRMIJJ0GdxS2lFpGyFlSXbQLO5lZy87J/aWlYsv0ig/IoK42WfAF
 DUwOv9X97LmpK2D/N/ugHhFfygFPHTt/PVWnB2XUTykpZbtt1q+/YRr1b52FtiGQ7Kzy
 Udb3wlurGbVKO9XxvOmfuQ+uPgRnqxT50jaIU662C7cHyWzCfRnAWh3TKnaC5+cFiiuX
 AT5g==
X-Gm-Message-State: AOJu0Yz0/bJ6C0VH64sY5ljYsNLY3AfEP8oN2KdWkLmpTr+Z8uN+NmQ4
 fGvfBIh54lqonJCFp6HLLOlftXnwB2BE3ppGfcqUCc1tXnsWJvWAU9QqHwGWxyCDYNc=
X-Gm-Gg: Acq92OFOT9fwxi+nInZsxuAUFKVv3/FZIiyd0AgKS7ok1SNjZd9oXTxKz+PyIMGCa3l
 BcVCLMhcMiaLpejTatlHIA8r/VX4l/Yi720HaoLcJBybHFYLDOKw5zuT8/X6ZfgzItUIksTP/5J
 0b5RGeXHBKf6xT0k1vKAx2zoEDTPItqWtPmqukA7xcRpigQywdHX39c2A4/31fds5gxb2Kz2VXR
 0Jk+K21eFTx+qWlkxcCTHiqVb74n0lECuJnYiggF8V7sg/dZwXAc6mMuQMiNsCQQMZ4EgFfzxYO
 lsTNDoOzkOhO8PeHn8yuJDYbT3uXKmzVVR7XDAxfs1wxbvvnvTeqnjhbzmdpYZ6+MeaxSe7P5s7
 fIjtw6EbcqdS4FGI6VbyPHFP/BfEjBfGppRqrZrTpcEzGl+JyPurMvN3SgJizKr3flpm6/kClgv
 SDG8s58Y7YPUWrZQ1RqOa57nRZM6tVcC8yC9amRiQ=
X-Received: by 2002:a05:6a00:8d1:b0:824:9bc5:e946 with SMTP id
 d2e1a72fcca58-83f33f2ba2bmr9594570b3a.46.1778977811331; 
 Sat, 16 May 2026 17:30:11 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19663cfdsm12272745b3a.9.2026.05.16.17.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:30:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 09/63] target/arm: Introduce FPMR
Date: Sat, 16 May 2026 17:29:08 -0700
Message-ID: <20260517003002.321430-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Introduce the special register FPMR and its fields.
Migrate it when present.

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
index 0a11dd9002..498af7db08 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -713,6 +713,7 @@ typedef struct CPUArchState {
          */
         uint64_t fpsr;
         uint64_t fpcr;
+        uint64_t fpmr;
 
         uint32_t xregs[16];
 
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 4414be85d9..ff30381fa5 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -292,6 +292,16 @@ FIELD(CNTHCTL, EVNTIS, 17, 1)
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


