Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id h5-20020a5d4305000000b002c559405a1csm8290661wrq.20.2023.02.22.03.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 03:01:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D295E1FFB7;
	Wed, 22 Feb 2023 11:01:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH] target/arm: properly document FEAT_CRC32
Date: Wed, 22 Feb 2023 11:01:04 +0000
Message-Id: <20230222110104.3996971-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Q7iUPSZ0EJNn

This is a mandatory feature for Armv8.1 architectures but we don't
state the feature clearly in our emulation list. While checking verify
our cortex-a76 model matches up with the current TRM by breaking out
the long form isar into a more modern readable FIELD_DP code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu64.c            | 29 ++++++++++++++++++++++++++---
 target/arm/cpu_tcg.c          |  2 +-
 3 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 2062d71261..2c4fde5eef 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -14,6 +14,7 @@ the following architecture extensions:
 - FEAT_BBM at level 2 (Translation table break-before-make levels)
 - FEAT_BF16 (AArch64 BFloat16 instructions)
 - FEAT_BTI (Branch Target Identification)
+- FEAT_CRC32 (CRC32 instruction)
 - FEAT_CSV2 (Cache speculation variant 2)
 - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
 - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 4066950da1..12e1a532ab 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -912,6 +912,8 @@ static void aarch64_a72_initfn(Object *obj)
 static void aarch64_a76_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    uint64_t t;
+    uint32_t u;
 
     cpu->dtb_compatible = "arm,cortex-a76";
     set_feature(&cpu->env, ARM_FEATURE_V8);
@@ -928,7 +930,18 @@ static void aarch64_a76_initfn(Object *obj)
     cpu->ctr = 0x8444C004;
     cpu->dcz_blocksize = 4;
     cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
-    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
+
+    /* per r4p1 of the Cryptographic Extension TRM */
+    t = cpu->isar.id_aa64isar0;
+    t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
+    t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
+    t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 1);     /* FEAT_SHA512 */
+    t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);    /* FEAT_CRC32 */
+    t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);   /* FEAT_LSE */
+    t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);      /* FEAT_RDM */
+    t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);       /* FEAT_DotProd */
+    cpu->isar.id_aa64isar0 = t;
+
     cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
     cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
     cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
@@ -942,7 +955,17 @@ static void aarch64_a76_initfn(Object *obj)
     cpu->isar.id_isar2 = 0x21232042;
     cpu->isar.id_isar3 = 0x01112131;
     cpu->isar.id_isar4 = 0x00010142;
-    cpu->isar.id_isar5 = 0x01011121;
+
+    /* per r4p1 of the Cryptographic Extension TRM */
+    u = cpu->isar.id_isar5;
+    u = FIELD_DP32(t, ID_ISAR5, SEVL, 1);
+    u = FIELD_DP32(t, ID_ISAR5, AES, 2);          /* FEAT_PMULL */
+    u = FIELD_DP32(t, ID_ISAR5, SHA1, 1);         /* FEAT_SHA1 */
+    u = FIELD_DP32(t, ID_ISAR5, SHA2, 1);         /* FEAT_SHA256 */
+    u = FIELD_DP32(t, ID_ISAR5, CRC32, 1);        /* FEAT_CRC32 */
+    u = FIELD_DP32(t, ID_ISAR5, RDM, 1);          /* FEAT_RDM */
+    cpu->isar.id_isar5 = u;
+
     cpu->isar.id_isar6 = 0x00000010;
     cpu->isar.id_mmfr0 = 0x10201105;
     cpu->isar.id_mmfr1 = 0x40000000;
@@ -1167,7 +1190,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
     t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
     t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 2);     /* FEAT_SHA512 */
-    t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);    /* FEAT_CRC32 */
     t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);   /* FEAT_LSE */
     t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);      /* FEAT_RDM */
     t = FIELD_DP64(t, ID_AA64ISAR0, SHA3, 1);     /* FEAT_SHA3 */
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index df0c45e523..961d2fd9ba 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -34,7 +34,7 @@ void aa32_max_features(ARMCPU *cpu)
     t = FIELD_DP32(t, ID_ISAR5, AES, 2);          /* FEAT_PMULL */
     t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);         /* FEAT_SHA1 */
     t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);         /* FEAT_SHA256 */
-    t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
+    t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);        /* FEAT_CRC32 */
     t = FIELD_DP32(t, ID_ISAR5, RDM, 1);          /* FEAT_RDM */
     t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);         /* FEAT_FCMA */
     cpu->isar.id_isar5 = t;
-- 
2.39.1
