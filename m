Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp209839lfo;
        Tue, 1 Mar 2022 14:00:17 -0800 (PST)
X-Received: by 2002:a17:90a:588c:b0:1b8:91a6:6cdf with SMTP id j12-20020a17090a588c00b001b891a66cdfmr23968815pji.239.1646172017673;
        Tue, 01 Mar 2022 14:00:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646172017; cv=none;
        d=google.com; s=arc-20160816;
        b=XxgF+5PgvJ7ZvxRltWcvyf4ExFQrhMiA09DjqFWHyfgqBJbqehjMMwvrKCnu2icefS
         iIHviaAkiz5HMzup+L/uiPKqiHC+1W1ljby5nGxywmJ7LYeNl17Km57+MmnZ7nIdaw6S
         Y9O4rkBuGdo0XN+rwrUnVj0JNUzQd+STdvQnvFZWnbvJ+xAIXETWrpNMeUMuiMIDxtXy
         Tko5LPebRttALCbMCmIiRWB0iBB/C1SPbwMQjZjYxBHSeGEdep42NIiyIek38d0/lLqC
         J3qtDqgYwYQI8ZLeoiejS2OQ3guLp4uwAOIX5nV8ADi7IQMBzRM/4eFxzgP8rdAA3RzR
         x2BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rots8gM6WyEhatQucngAjy7J8H2b6HMDpJoYQByRIgE=;
        b=KvkYxGMHK+V3LLncz2Ki7WLCSTDLkThL5HxuKQvIuRAxNLmRbf/NiL+ARwjzxUk6a9
         WqSfi645ZBUrRe/2+if290Ezib7iD6LsMU9QXy+6BeOJRiB8NaiYrX6uIxifOKZgrgAn
         eYnhyI25FJHbyX/7V+e8kjoXKl2nxY+UUjXEPDE8PpEet8gdImQUXFPlw4uqzN/wRcGU
         p0jJFhqHzs3F9NSwEKwQi6Pf32rJLpBdek8l0BQ9iWAlflLxODG1abuFQgwbSYmis+A3
         b/JRgiM+IbjAYAY+SPY9Lp/9Cz5MIfT6J49+K8oIZ2ISw5NcDMagS+VEtdiicMHQhiCG
         uAYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H6bhpnqa;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id na4-20020a17090b4c0400b001bef4ea06b1sor144778pjb.2.2022.03.01.14.00.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Mar 2022 14:00:17 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H6bhpnqa;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rots8gM6WyEhatQucngAjy7J8H2b6HMDpJoYQByRIgE=;
        b=H6bhpnqaEQrN0iJkzFoNsIoXJR2PxZ70ger9l7nmlhzPe19dgaGKmf2V1Tmn7ARzvC
         0cNhjKjY0xVPFxhCROAET7rz+OutjtjzmH9TsVuqzKjyExDB3OydCLxj+bIvOrtPIhQc
         RHgFLhF28i8O59NfDrxzxYBnO77gY32CP0HxNJ6hV8t/U+vf98Bps92gczM02CglzhfZ
         wGSqnhQtAS40stdF1D/GLOw+odRYCRjM8OjXVhpuVoglA1hJh/3cd1ME784xXxBrp51a
         V2dV9wq2uBALgV45TR+oGfjREhC1sRuqO7XQXR2c1e5qAXQg9s4cbysXPoYxUBqJ0K1O
         QpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rots8gM6WyEhatQucngAjy7J8H2b6HMDpJoYQByRIgE=;
        b=lZlguv1rRo2sDE6NK/idFsO98xq5wcbCTcpmTl5bIrSNg6dJCTU4UeWujAJpU64zvl
         Yu6UWjrrEv5nJU3Jt1LqeQPwaMyDpfYiTfE5AsInJiO3c1Se9B8u1t5e59pJQ2NkLtf/
         BIz8ikzjDJTMp+gdoqIHdGx92n/xOn37lbiruSFhtebvHJYAiPm0/TUQKnXHVG/i7Bvj
         +LykXDbiuLiYdZIMTQx6B5OpohVm3vPoBgSIFadg+kFri0zXNAmoItQCsl9gORtnLzpg
         b3MNTDlO+fqQE1s+rnn3k6P42JStDG+vWZAje0IPVOrZ0ADh4pshZktxxCyJKTaJ9+Ih
         pMeA==
X-Gm-Message-State: AOAM5305A/n/75pPSd/6ovce4Ybn/O/lrk9+/ix0Vzwm68DSi6JlMF1x
	ATfFmv8eg8+zE+C+X7QSULOZM9hs
X-Google-Smtp-Source: ABdhPJx+P7b2o82qLqbvjjjZJQGUPp5b+DkgkKsJaPZLteP3W3OlVrNy8YuYzuTLJWS+ybHa3coeFw==
X-Received: by 2002:a17:90a:8d82:b0:1bc:6b54:e798 with SMTP id d2-20020a17090a8d8200b001bc6b54e798mr23979221pjo.77.1646172017192;
        Tue, 01 Mar 2022 14:00:17 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 14:00:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 09/18] target/arm: Implement FEAT_LVA
Date: Tue,  1 Mar 2022 11:59:49 -1000
Message-Id: <20220301215958.157011-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vl4C6ZS1MPao

This feature is relatively small, as it applies only to
64k pages and thus requires no additional changes to the
table descriptor walking algorithm, only a change to the
minimum TSZ (which is the inverse of the maximum virtual
address space size).

Note that this feature widens VBAR_ELx, but we already
treat the register as being 64 bits wide.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu-param.h        | 2 +-
 target/arm/cpu.h              | 5 +++++
 target/arm/cpu64.c            | 1 +
 target/arm/helper.c           | 9 ++++++++-
 5 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 144dc491d9..f3eabddfb5 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -27,6 +27,7 @@ the following architecture extensions:
 - FEAT_LRCPC (Load-acquire RCpc instructions)
 - FEAT_LRCPC2 (Load-acquire RCpc instructions v2)
 - FEAT_LSE (Large System Extensions)
+- FEAT_LVA (Large Virtual Address space)
 - FEAT_MTE (Memory Tagging Extension)
 - FEAT_MTE2 (Memory Tagging Extension)
 - FEAT_MTE3 (MTE Asymmetric Fault Handling)
diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 7f38d33b8e..5f9c288b1a 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -11,7 +11,7 @@
 #ifdef TARGET_AARCH64
 # define TARGET_LONG_BITS             64
 # define TARGET_PHYS_ADDR_SPACE_BITS  48
-# define TARGET_VIRT_ADDR_SPACE_BITS  48
+# define TARGET_VIRT_ADDR_SPACE_BITS  52
 #else
 # define TARGET_LONG_BITS             32
 # define TARGET_PHYS_ADDR_SPACE_BITS  40
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c6a4d50e82..c52d56f669 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4289,6 +4289,11 @@ static inline bool isar_feature_aa64_ccidx(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, CCIDX) != 0;
 }
 
+static inline bool isar_feature_aa64_lva(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, VARANGE) != 0;
+}
+
 static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 1171ab16b9..1de31ffb40 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -811,6 +811,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);
     t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1); /* TTCNP */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
+    t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1); /* FEAT_LVA */
     cpu->isar.id_aa64mmfr2 = t;
 
     t = cpu->isar.id_aa64zfr0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2eff30d18c..28b4347213 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11271,7 +11271,14 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     } else {
         max_tsz = 39;
     }
-    min_tsz = 16;  /* TODO: ARMv8.2-LVA  */
+
+    min_tsz = 16;
+    if (using64k) {
+        if (cpu_isar_feature(aa64_lva, env_archcpu(env))) {
+            min_tsz = 12;
+        }
+    }
+    /* TODO: FEAT_LPA2 */
 
     if (tsz > max_tsz) {
         tsz = max_tsz;
-- 
2.25.1
