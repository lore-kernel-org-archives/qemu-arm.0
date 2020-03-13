Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2176482lfc;
        Fri, 13 Mar 2020 07:02:39 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv4/CR+lb5CPGkedncNiuzdmL9qRiPr150SyuClzD4MvgvnC5+v9XD1YHDrkdEpJlVcJKnC
X-Received: by 2002:a37:7c47:: with SMTP id x68mr13396057qkc.8.1584108158243;
        Fri, 13 Mar 2020 07:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584108158; cv=none;
        d=google.com; s=arc-20160816;
        b=b92ZAQPTlf81mHDrYQyH4qj1ehP0fQDYvhwnza3+CyCrHSyGIOPJh1V23yLXuZLPze
         JnqHOivjvOgwbR3/RHosOamqTQFu0SVK21sRCsUuRRX4LAPes3zEyHhs25sW4K7ZEUXf
         OKrKDrePMNt/R/uAISOgtiaJFR4bU6UeYKBjYJX6SDDFIzHDjRQP5bdGn/+BYAUJYT23
         rZ/YVLJWah0Fx9G7ZHGDSMZqXlEFs8sJdDNL1R2C6aydkTPl1enqAsBlrW9pxUYmMoPF
         vvAJorMLq/taQN3WBVE2vp1/twUMdEjQpbUKnVJ0/Lr23KnXuDtig2WoIOsZv8pu3cnV
         qYtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=gPIHWn+7p+/PvXYBm2MeAO8GEl2StCHzBSa7YN42yz0=;
        b=uJcNWd9qG2e8QDgZECEQ54aHLDk/QOD+seNMmYJp0rWXMM9J7qWzdtAK/ivI6gAjbG
         WRAi7UvQI80koCwZ9pUXzConoNOwKv10X0Pkh5lCxMUBAAL9KozGpnqZQGpiS91VBRDO
         5WklMa5w3BWJCQCFHKM9o0a/zpk9jsjqO9VURsOTN1SQA8Ch6ZwuoYnw8+fIjv3FTNqv
         2vf7q143eDCmzpDwTOs6yjcYlfw/UBz9WpSnevcomdnyCQbe8s3OyGh9Agex58rDv2vh
         F86YOigyBHDcG9nk1XHBTbgkn0VBWrKexvXMHo1EooANALaq1sT/xOoycR6l9GhIdvHe
         gdGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t129si3376758qke.87.2020.03.13.07.02.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 07:02:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCktZ-0000RM-Gz
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 10:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42697)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>) id 1jCkrX-0005XT-7O
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 10:00:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <remi@remlab.net>) id 1jCkrV-0000im-IU
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 10:00:31 -0400
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:49722
 helo=ns207790.ip-94-23-215.eu) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <remi@remlab.net>)
 id 1jCkrR-0000XA-D7; Fri, 13 Mar 2020 10:00:29 -0400
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 166455FAA2;
 Fri, 13 Mar 2020 15:00:24 +0100 (CET)
From: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
To: qemu-arm@nongnu.org
Subject: [PATCH 1/5] target/arm: MTE processor state
Date: Fri, 13 Mar 2020 16:00:19 +0200
Message-Id: <20200313140023.83844-1-remi@remlab.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:41d0:2:5a1a::
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nI2VeSV62vWQ

From: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>

This adds architectural definitions and internal processor state for
the ARMv8.5-MemTag, a.k.a. MTE extension:
 - a new ISAR register feature field,
 - new ATA flag bits for tag access in SCR, HCR and SCTLR registers,
 - a TCO flag in PSTATE and SPSR_ELx registers,
 - new CPU registers for pseudo-random tags generation.

Signed-off-by: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/cpu.h        | 17 +++++++++++++++++
 target/arm/helper-a64.c |  2 ++
 target/arm/helper.c     | 17 +++++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4ffd991b6f..e19ce0d746 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -267,6 +267,14 @@ typedef struct CPUARMState {
     uint64_t elr_el[4]; /* AArch64 exception link regs  */
     uint64_t sp_el[4]; /* AArch64 banked stack pointers */
=20
+    /* Tag registers */
+    uint64_t gcr_el1;
+    uint64_t rgsr_el1;
+    union {
+        uint64_t tfsre0_el1;
+        uint64_t tfsr_el[4];
+    };
+
     /* System control coprocessor (cp15) */
     struct {
         uint32_t c0_cpuid;
@@ -1259,6 +1267,7 @@ void pmu_init(ARMCPU *cpu);
 #define PSTATE_SS (1U << 21)
 #define PSTATE_PAN (1U << 22)
 #define PSTATE_UAO (1U << 23)
+#define PSTATE_TCO (1U << 25)
 #define PSTATE_V (1U << 28)
 #define PSTATE_C (1U << 29)
 #define PSTATE_Z (1U << 30)
@@ -2949,6 +2958,9 @@ typedef enum ARMASIdx {
     ARMASIdx_S =3D 1,
 } ARMASIdx;
=20
+#define ARM_LOG2_TAG_GRANULE 4
+#define ARM_TAG_GRANULE (UINT64_C(1) << ARM_LOG2_TAG_GRANULE)
+
 /* Return the Exception Level targeted by debug exceptions. */
 static inline int arm_debug_target_el(CPUARMState *env)
 {
@@ -3777,6 +3789,11 @@ static inline bool isar_feature_aa64_bti(const ARM=
ISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, BT) !=3D 0;
 }
=20
+static inline unsigned isar_feature_aa64_mte(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, MTE);
+}
+
 static inline bool isar_feature_aa64_pmu_8_1(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >=3D 4 &&
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index bc0649a44a..5c8d081d4c 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -1036,6 +1036,8 @@ void HELPER(exception_return)(CPUARMState *env, uin=
t64_t new_pc)
=20
         env->aarch64 =3D 1;
         spsr &=3D aarch64_pstate_valid_mask(&env_archcpu(env)->isar);
+        /* TCO bit is copied from CPSR, not SPSR */
+        spsr =3D (spsr & ~PSTATE_TCO) | (env->pstate & PSTATE_TCO);
         pstate_write(env, spsr);
         if (!arm_singlestep_active(env)) {
             env->pstate &=3D ~PSTATE_SS;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b61ee73d18..38500e4f92 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1993,6 +1993,9 @@ static void scr_write(CPUARMState *env, const ARMCP=
RegInfo *ri, uint64_t value)
     if (cpu_isar_feature(aa64_pauth, cpu)) {
         valid_mask |=3D SCR_API | SCR_APK;
     }
+    if (cpu_isar_feature(aa64_mte, cpu) >=3D 2) {
+        valid_mask |=3D SCR_ATA;
+    }
=20
     /* Clear all-context RES0 bits.  */
     value &=3D valid_mask;
@@ -4691,6 +4694,11 @@ static void sctlr_write(CPUARMState *env, const AR=
MCPRegInfo *ri,
         value &=3D ~SCTLR_M;
     }
=20
+    if (cpu_isar_feature(aa64_mte, cpu) < 2) {
+        /* ATA and ATA0 are RES0 without full MTE implementation */
+        value &=3D ~(SCTLR_ATA | SCTLR_ATA0);
+    }
+
     raw_write(env, ri, value);
     /* ??? Lots of these bits are not implemented.  */
     /* This may enable/disable the MMU, so do a TLB flush.  */
@@ -5226,6 +5234,15 @@ static void do_hcr_write(CPUARMState *env, uint64_=
t value, uint64_t valid_mask)
         if (cpu_isar_feature(aa64_pauth, cpu)) {
             valid_mask |=3D HCR_API | HCR_APK;
         }
+        switch (cpu_isar_feature(aa64_mte, cpu)) {
+        default:
+            valid_mask |=3D HCR_ATA;
+            /* fall through */
+        case 1:
+            valid_mask |=3D HCR_DCT;
+        case 0:
+            break;
+        }
     }
=20
     /* Clear RES0 bits.  */
--=20
2.25.1

