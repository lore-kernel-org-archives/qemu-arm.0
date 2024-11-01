Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp148768njc;
        Thu, 31 Oct 2024 18:36:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVDBxpduRhFiLf0Gx5U/oo514CwMlTR/tlJLyIiiUoTb9ZZ8zUxE/yl8uB06lwhha580gk+IHU+gkRPyw==@linaro.org
X-Received: by 2002:a17:903:1c6:b0:20c:c15c:96ab with SMTP id d9443c01a7336-2111afd6c30mr24107755ad.48.1730424964272;
        Thu, 31 Oct 2024 18:36:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730424964; cv=none;
        d=google.com; s=arc-20240605;
        b=W5nCofImsEZr0KYaP5KZ4IIstLDGUIqhR/DaWpMdFnWxKcq1e52auQlgnfOtOCvFCn
         ErIKBCTCniQRnxC7Qu7OSidl8Rweo+ZpW/MCNiEOIsDuX+6jsVnTk9loNvudzQz5tX8r
         AbCsm8Kbj4Yfj0bCpnE3v+rPIy2z3qP52IdDxV5aSwJ1uZMfXwrICIIY8+4DikkjBwph
         7Zw91ZqDGbQ5bQ6hTU2eiCjuzXcPUKkncnHj01mx4NDU9+0/VXZ3ZlAIAiM1fSCYXBMo
         IqC/9+bWrZxVC8QbuNSJeCYKTWh6AWZ6Ug5zUxJiEj2KwwDuPKOuUxJvxCthFdmHw2Hp
         mKJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=vsiebkp7yeK+UnSZT8y03VRBqJ6iZEd6SjBUXH3PT1g=;
        fh=B3xJS1J/i+UlfX06ndeUHq7JXhG1P0up6My0e9tQijQ=;
        b=FLHfbpueIYMySKw3tbYoyhl26YfewOLcq7uniUeCaRsIBgSgmyNFhUeBpB3p2FJ8Yr
         n7YMeGk35wz7kG9WcKzKS6neMQehP5vQp3DrCGymrI1qSnBy5GGc4lqz7J9tbah0Qhl6
         bgfNX0w3QrCG6FJnzXwIiGKJY4EL7ljCHD4aQ9p0qG6XEcs5x/vtsRojmfo/aEipar/1
         VwaFVqQaRA5fNWqGUXjohzlssdPewSz1OHgYkpLV8hpam00l49CwptFP+WUqFH5kWBD4
         BFqTkWf1f4BKxoipYucxY1dDifCDTVJ/oVpxnbPvLuD67PJkuvUH4rhtR5z89ORv96TM
         yiFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d8SnxU8i;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-211056f5c23sor21974505ad.3.2024.10.31.18.36.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 31 Oct 2024 18:36:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d8SnxU8i;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730424964; x=1731029764; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vsiebkp7yeK+UnSZT8y03VRBqJ6iZEd6SjBUXH3PT1g=;
        b=d8SnxU8iwqqbV637xEk4tmE3/h8Lr1rcFgnPnaWi+zBi4kYmvu0qoVffRZQYhqKUuM
         6GPPrdUD5rgjB2cUMe6QEc38tkTtOIxIz7fJLiUzIUU4JY96x9U4IAUA/JeizKnRmvEs
         ov5hetfVbHHGUXEU3/oNbxQrxxHiPMBM3L/HRy2H9yNw7aMIz4WpIb78+kLJgaX/WCT1
         QzM7EDhmp+ROtZKt5dJOfNtPGypAUvL7auqhu0QwbGm4e3/SbtQ6i36GKPaLA968TE9a
         RotcPgBxtgaw4puaKHJhf7EFQ1emPZAUgSKzl/QiAyRHqVcG0qIp7cBrtdV1aC5GC2t8
         i0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730424964; x=1731029764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsiebkp7yeK+UnSZT8y03VRBqJ6iZEd6SjBUXH3PT1g=;
        b=OvpVKK/Wcz9URI77JuVvjDsp7grfO5Ut3Isev11mpJU/WQIMqv3FASmb4lhKU2He5m
         HXBu4Ns6gvJhxkrrhFdvZWKNtP9ihJv6LZbomjEQNDPfPnbYRTET8i2jLeMcNb6mBgAi
         SkGZfNfQDPHhYRo9d8dnMr3EjRjxpTvkJvTYZuEp5d5HJ165jfjU4r08tOjtip51BTlJ
         lgBBte5issvQBLke64gSFuuhNkNojVAL46+pV21Y502BoII7TLFd7A1gdBVCMN/a4j3r
         HIHI9Jxmk0aKHIpQmtFapY7cYdXUk9p9BHZ7Tastzag1GmtDgmMB/KZ0kg2i4Z8dYdpD
         Mc1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHVN/KYdXCKyX1D9odhH5SmWSOVL9dzEU+KF+de0kWwgw3zhYFgH1TaFmJix/4BiKHPAzlg+Jv7J6Seg==@linaro.org
X-Gm-Message-State: AOJu0Yy6mvCCN47QS8JlIGQxJTBJdw+tHJymP7W20+LAF5BcS+/coCAA
	KfYA+HniGsIivDtElmNoLl5gU84uiE1wPEhL9eLn6N+w61+YlDP9Ol3AY2ap6+6D4w==
X-Google-Smtp-Source: AGHT+IGkYgPIyYT7mkbfVaX1Xlebk5kU81ToYw9/bNuq9AHvvYXw7vDmfIajMg8R0GooMMMxcfrx3w==
X-Received: by 2002:a17:902:d485:b0:20b:b455:eb4f with SMTP id d9443c01a7336-2111af678abmr24905635ad.25.1730424963766;
        Thu, 31 Oct 2024 18:36:03 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from amd.. ([2804:7f0:b402:60a7:3e7c:3fff:fe7a:e83b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057effe3sm14411495ad.301.2024.10.31.18.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 18:36:03 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	peter.maydell@linaro.org
Cc: gustavo.romero@linaro.org
Subject: [PATCH] target/arm: Enable FEAT_CMOW for -cpu max
Date: Fri,  1 Nov 2024 01:35:41 +0000
Message-Id: <20241101013541.883785-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: b5wO1yi7XAmv

FEAT_CMOW introduces support for controlling cache maintenance
instructions executed in EL0/1 and is mandatory from Armv8.8.

On real hardware, the main use for this feature is to prevent processes
from invalidating or flushing cache lines for addresses they only have
read permission, which can impact the performance of other processes.

QEMU implements all cache instructions as NOPs, and, according to rule
[1], which states that generating any Permission fault when a cache
instruction is implemented as a NOP is implementation-defined, no
Permission fault is generated for any cache instruction when it lacks
read and write permissions.

QEMU does not model any cache topology, so the PoU and PoC are before
any cache, and rules [2] apply. These rules states that generating any
MMU fault for cache instructions in this topology is also
implementation-defined. Therefore, for FEAT_CMOW, we do not generate any
MMU faults either, instead, we only advertise it in the feature
register.

[1] Rule R_HGLYG of section D8.14.3, Arm ARM K.a.
[2] Rules R_MZTNR and R_DNZYL of section D8.14.3, Arm ARM K.a.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu-features.h     | 5 +++++
 target/arm/cpu.h              | 1 +
 target/arm/tcg/cpu64.c        | 1 +
 4 files changed, 8 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 35f52a54b1..a2a388f091 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -26,6 +26,7 @@ the following architecture extensions:
 - FEAT_BF16 (AArch64 BFloat16 instructions)
 - FEAT_BTI (Branch Target Identification)
 - FEAT_CCIDX (Extended cache index)
+- FEAT_CMOW (Control for cache maintenance permission)
 - FEAT_CRC32 (CRC32 instructions)
 - FEAT_Crypto (Cryptographic Extension)
 - FEAT_CSV2 (Cache speculation variant 2)
diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 04ce281826..e806f138b8 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -802,6 +802,11 @@ static inline bool isar_feature_aa64_tidcp1(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, TIDCP1) != 0;
 }
 
+static inline bool isar_feature_aa64_cmow(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, CMOW) != 0;
+}
+
 static inline bool isar_feature_aa64_hafs(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) != 0;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8fc8b6398f..1ea4c545e0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1367,6 +1367,7 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_EnIB    (1U << 30) /* v8.3, AArch64 only */
 #define SCTLR_EnIA    (1U << 31) /* v8.3, AArch64 only */
 #define SCTLR_DSSBS_32 (1U << 31) /* v8.5, AArch32 only */
+#define SCTLR_CMOW    (1ULL << 32) /* FEAT_CMOW */
 #define SCTLR_MSCEN   (1ULL << 33) /* FEAT_MOPS */
 #define SCTLR_BT0     (1ULL << 35) /* v8.5-BTI */
 #define SCTLR_BT1     (1ULL << 36) /* v8.5-BTI */
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 0168920828..2963d7510f 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1218,6 +1218,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR1, ETS, 2);      /* FEAT_ETS2 */
     t = FIELD_DP64(t, ID_AA64MMFR1, HCX, 1);      /* FEAT_HCX */
     t = FIELD_DP64(t, ID_AA64MMFR1, TIDCP1, 1);   /* FEAT_TIDCP1 */
+    t = FIELD_DP64(t, ID_AA64MMFR1, CMOW, 1);     /* FEAT_CMOW */
     cpu->isar.id_aa64mmfr1 = t;
 
     t = cpu->isar.id_aa64mmfr2;
-- 
2.34.1
