Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2147206njc;
        Mon, 4 Nov 2024 06:26:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX/hH9hu9gaZOWcExxy/l+BoodjRJfPqI2GNyPBae/lyNbhJML8l14crad+cis8FiynxYGvAnUqBhZd6A==@linaro.org
X-Received: by 2002:a17:90b:4d05:b0:2e2:c6c2:b3d5 with SMTP id 98e67ed59e1d1-2e93c14e8a5mr21443388a91.9.1730730382157;
        Mon, 04 Nov 2024 06:26:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730730382; cv=none;
        d=google.com; s=arc-20240605;
        b=g6ivZvyDS63tC/YKAjZh4AYqBCueqdRDNSXGe+xO0CCw7N7gMIH5Ofxf9BtlglGLxf
         zMZjG/BA8ip+ycDLO5zHTZYNixG4/ZlBdQ6a5mxiA/2m61wPC1Iq5YxYmRtMoDtKCk/j
         7lQPZd2Xeoop8f1uIQn6eUJJQ9VdJdfQ4ox60t+n0Vr7kyP9Xp8/5FSCSRERdwUSPmNx
         xsjJDTvnbx37xbU9wMbglXeEt/La1xcexlROVUeRPjUCOYZy5p1+bv5OjQmEHm+rSLq/
         X7LMKy0A8G6cTZK02QyZ8uMYKG075DZZfohtjqqSS6cEMJa/AilyfdnSiYcgT57D6s8O
         rl/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=mLBSNwSWoqUYVY9eOkGeU5SytN91HgHe0GfN/b6c7mk=;
        fh=Pygvq9Vaoi97x/R6aJNVgLxG+Jle0/cUmURZRKjHt50=;
        b=jY9pSEQE3fXQ+d/JyWcnScs5m+zEo5J/Om0vwCdR05kQRIYOAbSne0YHP2CLWltG0j
         7xAYKmdDH2UdDJjHdealCXRQxAwk62A6KJoRpPBufpYGlZbcgm7QQ7kzaQnODCNSFM6K
         gB3aik/UXDajKyUdPXfhRZsamo7DnQM0kGiz9DkKtQ08S8CF5IReLLbTUyakC4vxW/y3
         InhtwX3q9PB/MjVNU8lHvkvw/9e22pSZhGGB2IZJAxUF1Y4LqADq3EywP7Vz0zq0tNh5
         tDH49IrQP0fwTVE7FjiSMxYdOZHch+tK2xb4RyCuhltjF3QeYdxiGT2p+AghVlRdkd/4
         lGKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YX4cDBhg;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-211056f4f9esor80794375ad.4.2024.11.04.06.26.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 04 Nov 2024 06:26:22 -0800 (PST)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YX4cDBhg;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730730382; x=1731335182; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mLBSNwSWoqUYVY9eOkGeU5SytN91HgHe0GfN/b6c7mk=;
        b=YX4cDBhgMZ/EStmbf8IGR8DiumseqjYoXGHmMtqB4pZd4y8NWMsO4V1BKtShrk1u0f
         lCWnRFr6oWaKgypz9S1WI+mYUBLmt98knS+i8WvvwxYHGukicS3Lg96USN0/JA7Q93DN
         I/zuqpaTY8e1O8wdBm2/3lusE7pyscDkL2LLvBnaovFxJGXhNO0AejEhte+W6cHtWerN
         QCznZECiIQ+83Zma19Uq1pT/DwQcb4tStnWY0uHHWOX0Ta5BTlH//UhTD24sMbtnjvOT
         /I7nKA0uPZimkC8d0UuxiWSd7BejyJxeMTQN0ifBBsa0rWLKihaJ1ZCD0r7BH5LUo0c2
         WF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730730382; x=1731335182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLBSNwSWoqUYVY9eOkGeU5SytN91HgHe0GfN/b6c7mk=;
        b=TWtOxhP0lIoO3mpAJF6DJN+U5CcEkYlN3OwKJXMzSZ/rPbOq3LjvtuynJVkJVvE8Ov
         4ATLKTI7Qt8+x1nMKmC2YVKUby1QkoSNHhdicThErQQzrDH16Ob6dMb6pHmLSxBEWiT5
         9+yO1GNqg+7l2yf/2ACs506tLlSReYlEUat2isnN6E318hG8Y8gdm6B7qQedBpmjfBf0
         jKFTotPwYlilZbJpSRlNHDKNovs6InJzy7IazWONwSVYzHEiet/sGeShFL9dUiqCgNKU
         Yti/ehu2hja/wps5e3+Z/q+gwgPIyNGNpWgKIgnIr2FxY/dM0fwhkpOUQFLE6eHcPiwF
         ut4A==
X-Forwarded-Encrypted: i=1; AJvYcCX0XRQjTYuAbwnOWQtZSFlqmI4sgnL9zm3WoHtRN4rQeEDapnL8GBr7st4bpidnIIw7XF/LpHGlrI9LAw==@linaro.org
X-Gm-Message-State: AOJu0YwG7z20YfABPE1PzxAKI9fJF1s8bf0o/tgJel/ZvIvIwlqaSFzP
	64s8txmfI0Iy6qc+jhn6x/Z6kJrSGFeTXJCtKfPLUh1utnoPHXsi0zG0q6v6iNFBZLwqU2wxRqR
	LAqY=
X-Google-Smtp-Source: AGHT+IFI4xxBtDEnokMtPBvDKc7+aTsOopejqiwpc6CakWh6jAtQniJlii93N1H4AfkyIxmVVrYoyg==
X-Received: by 2002:a17:902:ecc5:b0:20c:b8a5:38e8 with SMTP id d9443c01a7336-21103ad1900mr231477885ad.23.1730730381644;
        Mon, 04 Nov 2024 06:26:21 -0800 (PST)
Return-Path: <gustavo.romero@linaro.org>
Received: from amd.. ([2804:7f0:b402:60a7:3e7c:3fff:fe7a:e83b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056ee3e4sm61931205ad.3.2024.11.04.06.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 06:26:21 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	peter.maydell@linaro.org
Cc: gustavo.romero@linaro.org
Subject: [PATCH v2] target/arm: Enable FEAT_CMOW for -cpu max
Date: Mon,  4 Nov 2024 14:26:06 +0000
Message-Id: <20241104142606.941638-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ES/0E3SSSRXu

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
any cache, and rules [2] apply. These rules state that generating any
MMU fault for cache instructions in this topology is also
implementation-defined. Therefore, for FEAT_CMOW, we do not generate any
MMU faults either, instead, we only advertise it in the feature
register.

[1] Rule R_HGLYG of section D8.14.3, Arm ARM K.a.
[2] Rules R_MZTNR and R_DNZYL of section D8.14.3, Arm ARM K.a.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu-features.h     | 5 +++++
 target/arm/cpu.h              | 1 +
 target/arm/helper.c           | 5 +++++
 target/arm/tcg/cpu64.c        | 1 +
 5 files changed, 13 insertions(+)

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
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0a731a38e8..f55e8ced54 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6215,6 +6215,11 @@ static void hcrx_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if (cpu_isar_feature(aa64_nmi, cpu)) {
         valid_mask |= HCRX_TALLINT | HCRX_VINMI | HCRX_VFNMI;
     }
+    /* FEAT_CMOW adds CMOW */
+
+    if (cpu_isar_feature(aa64_cmow, cpu)) {
+        valid_mask |= HCRX_CMOW;
+    }
 
     /* Clear RES0 bits.  */
     env->cp15.hcrx_el2 = value & valid_mask;
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
