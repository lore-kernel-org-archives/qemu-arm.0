Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FEAE9539B
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Feb 2026 13:14:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnchn-0006Yo-TS; Wed, 04 Feb 2026 08:14:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vnchn-0006XU-5V
 for qemu-arm@nongnu.org; Wed, 04 Feb 2026 08:14:03 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vnchl-0000cY-3y
 for qemu-arm@nongnu.org; Wed, 04 Feb 2026 08:14:02 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6582e8831aeso10399463a12.1
 for <qemu-arm@nongnu.org>; Wed, 04 Feb 2026 05:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770210838; x=1770815638; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ddHqE3wsLOoUWKgCDcSl6HfZDeo+Nc4hEYigGKAOnAA=;
 b=n8KvPVHjPUiFCCv0ooLmkmjTpI+td9fHMMzAA/waaxPB9mVbnVOy1unMejCoi+W4In
 rtq0S/CNfVK37HyLzrh6KivvYesUDgfmzhefcuEqaMadqxVrVlT2ZCA3aAx3Qm0YAWTQ
 XovB74OT/CfwvTgQzStR+73cwTr2iRk1//pU2yIjR3c6BJVhAEeFcGJ4OeP6IeoZw2sd
 dqdfjGhnnI6RdLR37jGeadR2MQ6ZRrGjqM9Qxb6f9pNidBaNJ1PMavPZeRjawbkb61xx
 cFHDfUf/7H61SJYyMA3pFaZBHHgTGgJQgmVplDD+96kirstyQEt2o+e+guLU/DQQYHLT
 oHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770210838; x=1770815638;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ddHqE3wsLOoUWKgCDcSl6HfZDeo+Nc4hEYigGKAOnAA=;
 b=NH4kjjBZury+rB82dpBeTlozm9QzI7mg9cf70JMn+81Ld7oVxAsmVP0SvQciOXWlp6
 1PwF/pNc88H1tKCanKamJhcAKciiZWC/Sd2iKybTX1i+MRxDTXbiROoC40zGnLNqbUtn
 v5/8H5DAKaGPdSxnSVhJTg3wsAqSqzhqAvkx/uXKhMpyAMXOSYyYVGLWQ+uS+2FBlI5y
 my2nQa3nfVuvTDXYgK/yZRUI+wK0+uKbcwY6xVDT8wgPcaS78UfgWc2f1iz65tdjzBLm
 7osGJY+1hW1ZH/TKMqeQLxpGxNfl7snq7x4vuyaiWqfxJWQrsEpAaczK/hLgO6RB/UjU
 MCig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRxkh32xUuk+L58gP9QrLty96Ah6/Zmxa5A4lhr9xfjSgpsxmysVJdLokywf7u1+1UnvG0mO0OJQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy9hSWa1VDzJg7q/2zke75upcvlKd/0zRY/DG9PQYj4QQcyY/EC
 ho/icjT/GWNo6D6nWi+UHkZijWKJnClCSF98+bNeRinxTjqTwn5dcHlhsLoxr4Z0O7E=
X-Gm-Gg: AZuq6aKmFsEyeoQJzgLGw6yJ6j95Fy+LIyK27B6b1y0lzCc1Yh2dO01Y6wTekvWFX7e
 gcHvWbYDDPdFgNXKp5J6LUqcqUddvtWrLq4rYWyweJ1gqjgGwvY2xgqByQLbFnERXl5D53mK6xX
 1m3Y/u4Bb/WwhkY+FIZY+9Q5ofyZOyPiKisY/UYIuG+K/mh7zTt0o7MXOZvi0LsjAgoItmJSVAQ
 UDV6rgqmZQxCDNerSRQvszJo69bIdWwTIlpxhWbBGdFybvho6SOm6kzC2dxB+Z/95N0fmerguKa
 KrIpcbWzZEl13aHSoyKLzy1kk4opJ6mE+NppgcV9SZbdghXviSEt0e3OSG0dPg26OsRmcq4kth+
 7IYJ4bSXga/3nFo9KMvNFSqhh6oLw/y9t54HRgVp5o00P6RUYL2aNzXs9wA4wkNqjLKBw/9t5cZ
 Tjkg+frkjfrAk=
X-Received: by 2002:a17:907:9723:b0:b80:4030:1eca with SMTP id
 a640c23a62f3a-b8e9f161e1emr200756066b.2.1770210838373; 
 Wed, 04 Feb 2026 05:13:58 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8ea00455adsm124120266b.60.2026.02.04.05.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 05:13:57 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B2CF85F80E;
 Wed, 04 Feb 2026 13:13:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v2] target/arm: implement FEAT_E2H0
Date: Wed,  4 Feb 2026 13:13:53 +0000
Message-ID: <20260204131353.2977855-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52a.google.com
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

FEAT_E2H0 is a formalisation of the existing behaviour of HCR_EL2.E2H
being programmable to switch between EL2 host mode and the
"traditional" nVHE EL2 mode. This implies at some point we might want
to model CPUs without FEAT_E2H0 which will always have EL2 host mode
enabled.

There are two values to represent no E2H0 systems of which 0b1110 will
make HCR_EL2.NV1 RES0 for FEAT_NV systems. For FEAT_NV2 the NV1 bit is
always valid.

Message-ID: <20260130181648.628364-1-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - new helper and properly handling NV1
---
 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu-features.h     | 12 ++++++++++++
 target/arm/helper.c           | 16 +++++++++++++---
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index e0d5f9886e1..7787691853e 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -54,6 +54,7 @@ the following architecture extensions:
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_DoubleFault (Double Fault Extension)
 - FEAT_E0PD (Preventing EL0 access to halves of address maps)
+- FEAT_E2H0 (Programming of HCR_EL2.E2H)
 - FEAT_EBF16 (AArch64 Extended BFloat16 instructions)
 - FEAT_ECV (Enhanced Counter Virtualization)
 - FEAT_EL0 (Support for execution at EL0)
diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index e0b7a45b7bd..78ff761ae06 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -347,6 +347,7 @@ FIELD(ID_AA64MMFR3, ADERR, 56, 4)
 FIELD(ID_AA64MMFR3, SPEC_FPACC, 60, 4)
 
 FIELD(ID_AA64MMFR4, ASID2, 8, 4)
+FIELD(ID_AA64MMFR4, E2H0, 24, 4)
 
 FIELD(ID_AA64DFR0, DEBUGVER, 0, 4)
 FIELD(ID_AA64DFR0, TRACEVER, 4, 4)
@@ -1378,6 +1379,17 @@ static inline bool isar_feature_aa64_asid2(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64MMFR4, ASID2) != 0;
 }
 
+static inline bool isar_feature_aa64_e2h0(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64MMFR4, E2H0) == 0;
+}
+
+static inline bool isar_feature_aa64_noe2h0_and_nv1_res0(const ARMISARegisters *id)
+{
+    /* 0b1110 is not permitted unless we have FEAT_NV */
+    return isar_feature_aa64_nv(id) && FIELD_EX64_IDREG(id, ID_AA64MMFR4, E2H0) == 0b1110;
+}
+
 static inline bool isar_feature_aa64_mec(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64MMFR3, MEC) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 390ea32c218..c3f4054a0b0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3776,7 +3776,8 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
     }
 
     if (arm_feature(env, ARM_FEATURE_AARCH64)) {
-        if (cpu_isar_feature(aa64_vh, cpu)) {
+        if (cpu_isar_feature(aa64_vh, cpu) &&
+            cpu_isar_feature(aa64_e2h0, cpu)) {
             valid_mask |= HCR_E2H;
         }
         if (cpu_isar_feature(aa64_ras, cpu)) {
@@ -3801,10 +3802,13 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
             valid_mask |= HCR_GPF;
         }
         if (cpu_isar_feature(aa64_nv, cpu)) {
-            valid_mask |= HCR_NV | HCR_NV1 | HCR_AT;
+            valid_mask |= HCR_NV | HCR_AT;
+            if (!cpu_isar_feature(aa64_noe2h0_and_nv1_res0, cpu)) {
+                valid_mask |= HCR_NV1;
+            }
         }
         if (cpu_isar_feature(aa64_nv2, cpu)) {
-            valid_mask |= HCR_NV2;
+            valid_mask |= HCR_NV1 | HCR_NV2;
         }
     }
 
@@ -3823,6 +3827,12 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         value |= HCR_RW;
     }
 
+    /* Strictly E2H is RES1 unless FEAT_E2H0 relaxes the requirement */
+    if (arm_feature(env, ARM_FEATURE_AARCH64) &&
+        !cpu_isar_feature(aa64_e2h0, cpu)) {
+        value |= HCR_E2H;
+    }
+
     /*
      * These bits change the MMU setup:
      * HCR_VM enables stage 2 translation
-- 
2.47.3


