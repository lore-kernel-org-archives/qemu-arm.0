X-Received: by 2002:a63:5758:0:b0:34e:b5da:7dac with SMTP id h24-20020a635758000000b0034eb5da7dacmr1338219pgm.515.1645655515901;
        Wed, 23 Feb 2022 14:31:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645655515; cv=none;
        d=google.com; s=arc-20160816;
        b=Pdxkrz+V45w6CtTuMlBMihHuqSM/a3V1+9rrJBYyE3ksPVK9Ds7XVp10HmESxD93WU
         5cIENh/ds82tfbKHpPFlyBrLP4jEP3L91Cfx7zl7Y7BP0kmFU4F/4QfGD0+5yYUBYH/x
         oxAprg5cc0DfBIpuYNE9NKpj5F5c8yhCKyFbodqHpN7mncTEQqKwhqtFPuoY0nFt3XRC
         pDvhvLEdSLcwhG4vvwAUNft3XxiGQA8NzgqAUTMN/aFQreOgzVMJ6Vd9UQxtr3AkZnwm
         xLgHwkhZa0xfbY+yVHQUMV2YmnTGZrgLkTFcYZy1gHKOQW4mPGiOI8gg6jY55q6PKpDK
         w1tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rots8gM6WyEhatQucngAjy7J8H2b6HMDpJoYQByRIgE=;
        b=Cxz21idjrCS1PsW6kFTA/DfDzxoviSvrV+OsoEAv8E5GqZe8DcDmO70/QJjOu+vqvQ
         4bDuPwfaz4NVr3wLhs2f7KtT/Wg6eoR8Xuwy8vtrnmhKX5CtxMMHqCNpJU5VGAt1odpB
         diHO671ZbISDaar0L3oem7xe2oDe+n3JNtQwc/+TIS1qHbJVdGTr54hIphHXDfDxVob3
         OsTFlkDx9tW4/5HqygfexCx+tFIfmcxoeS3ExPqtmewimG03brPuoOLAV35oH0hrLOjj
         eNFnPBtv+ZtI3OIdX9tDihq5QRP84md9u9Nol1L1H5m0nP3FBQs+xE1ARmB8C54ObVkn
         youg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZpoPYSDC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id lk7-20020a17090b33c700b001bc3659ed05sor15406pjb.8.2022.02.23.14.31.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Feb 2022 14:31:55 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZpoPYSDC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rots8gM6WyEhatQucngAjy7J8H2b6HMDpJoYQByRIgE=;
        b=ZpoPYSDCvEQDMS1P7yEcbhrbx3dWfntgn6mAVNCH3+EO8Xf2jcrSOb80Lld9QtVn5X
         j/gD+wwU0Kdn/A+5TDoQRsSRAFphb9b/ef8ZtA719/RBqDjp8dqQOMj8GKzZuUvKlKAP
         ur3AdWq7ntsyT0KpAlJM1mas3YPDvYSsBO7AnomTyzdROva1gdpwM+wkLhtpR1clql+6
         dqWe6UUIvLUcuXmC1OlpaRvbVAaPt8/gG1wcnfryD5IIfJMLyhpY/Fi7WXCsUfBWCCUo
         pjUxff+5qZ6gSO9pXjRXHqMDFUxsWgnkvclK7jzMSLa0WpwwzYh2RKI0jY4/pKkoZXsZ
         +fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rots8gM6WyEhatQucngAjy7J8H2b6HMDpJoYQByRIgE=;
        b=yVhZAQTcA2NbDGM1MbiUBZlMJ9XM8Eol8pZhmGSIy0ILL1NgeX9zlvrfSLPVrt4MIT
         PHnb/G6hPMgACdAXJ5YszXuqT8nkxKagA7i0dvIYS4RSBu8twlv/kUhEosTAFzG84wAA
         B1dKwFZ8AlHSxKE1I7rKlyiyJlFBCuIFHTZ7zoiXZz3NHICce9eslifPBm4pS5ji1Tfo
         mYJd3jSWi/7oVmIy/Lnp3khCjDpBa5MfijYfX8W96wD3wkZB4Lh3dIr354MiSYN772cf
         ECq/iv+SdZ7gYJXV/djuczeOfzV3xK6TJCEq0FnuNe4WGuj3P0WFzgfTRAgKpyypNEd9
         p/Qg==
X-Gm-Message-State: AOAM530rUCLdKqtaJvYtzSOeM6p0OC0vH9KzWIGGyRmDms3+D96mjoQm
	zbLlcqh4cYOECtmDnGMwVG09Sqrc
X-Google-Smtp-Source: ABdhPJyYSbN9htu/ksuJumzYFl+DuGid5n2rv5qDLFCgoHji1Px/cqytToY6kD2gQDjCvqM8ao2Bvw==
X-Received: by 2002:a17:90b:124c:b0:1bc:369b:7db5 with SMTP id gx12-20020a17090b124c00b001bc369b7db5mr11448650pjb.179.1645655515389;
        Wed, 23 Feb 2022 14:31:55 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 14:31:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 09/17] target/arm: Implement FEAT_LVA
Date: Wed, 23 Feb 2022 12:31:29 -1000
Message-Id: <20220223223137.114264-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 40XBQvM7+9vz

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
