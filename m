Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1287829lfk;
        Wed, 9 Feb 2022 20:04:59 -0800 (PST)
X-Received: by 2002:a17:903:11d0:: with SMTP id q16mr5506457plh.134.1644465898568;
        Wed, 09 Feb 2022 20:04:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644465898; cv=none;
        d=google.com; s=arc-20160816;
        b=vOFdYvTecijpMti9v7BSoYe5owqVyPoSsjwX3rs9pTzz0kYp35KKEdm+28SiRuF2XG
         7cmIuK2/vzdDFk+qMfvzvHKcn05XetkaE93xDCILiGTB6l56VPbzTn3+R9nqC3qSLCAE
         ymcLWbiBWb+N9de4t6+oPBQ3zmRq1qcNk0aRUF8PMOPpWllwg1zN7JiZD4f4TRWtabA8
         UDMxXxo/QWQVX9B2jOHYsfnRMy434m9SGBWcV1gFWs8+BfTgGj4a1GwvLcFsWSAbGlQT
         L3KwaHIffT11gtwx90uANE/HGAGe81ocQqP1XcCXQIUvee8PVl+BXLWswmL0xr61qB1A
         7WFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Wo37py8XK0LMBdk7Dcs+T7V1N42HxeZfeXF4Go5VbHY=;
        b=cFhiide2xU73MNTl9I+NHGRPyLzvRQHoNsaFQ5ErI3mr3oiCNzfqha9QriBLn9Xbht
         Jci8UbyxONs2wfwj81m9+DGGP2P4dzzKO1cCCERYJbXXpo+cCQ+S/XfnZIE5byPAp/5K
         Iwe8p6QrJC87iIZffp8s+Ehe8JLlpqy3vLxB8jlT3DUQO4BG0LkCTzskXPsKvtxTnlRw
         HWUOlP0DdPSDdN0pULJcncS+T03ziWHpuKj8nmUNBW7smR82+FxRREulIl52wIWYO8Qe
         xbP+B5kpBLwCvGuSIdxjbnMcFrNTWqHeKBVkaXY+XXqIC/BL5srKPmILc6X1xEANpV6E
         NPpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KmilAzqq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t10sor1603124pfg.1.2022.02.09.20.04.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Feb 2022 20:04:58 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KmilAzqq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wo37py8XK0LMBdk7Dcs+T7V1N42HxeZfeXF4Go5VbHY=;
        b=KmilAzqqzzMcK2CxmTEW+WnaO+0sT7KCHt56JNPJ8uY/BNOYDqhCDXj3KYZJx4beUA
         o3zyanFSUTCbH0ewp18YO7jfkDniWacZzHsQ9U/UxOkDyduLs6WR1H+8zCe2aRxfrFHq
         uJw0u8he6XRhPf8yhUJz1B41ouu0Kly0YmW4l1Qgc+dKh9jB6DQMKMzMrwWUgWYZXQt1
         rYNVxt8GWtHjx2MrTk7jYE5ntXLmwcApE8wntYxphPSx9ivxqSPUqzXaeyjxLdNNDBx6
         CiE2N9yHg1mL/yQxZxAAoq8PUqF/5KCr4/m7WjsVvjijDp7Z2sv2IcfbnFXRilm0Gcq4
         nUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wo37py8XK0LMBdk7Dcs+T7V1N42HxeZfeXF4Go5VbHY=;
        b=Bflv1AOaGon2gv1P5Fnqo9rQuwVIrESuLvbh+bdvdeX1foh9Gq5tzZRR1kOQV937va
         8qd8guXoLhlVqikUZWRMEWFGc/4+nNJWRgz9+gGk+wY0jV0hiwBvZfAOmMpQP3ZdmC/R
         BOxqFRmg0BxxzwIUK1bXAA2Ne+sQnVi3lvFq+nCOtHXHP2aKy0YB37QQ3WNK7MXFA/bf
         CLZ6cLeOdf4mkWF3fkq2kdwvmJieTzWOb7ASrCY/WrZfJTf6uD2VHFSUjv6ZWi9zd6ZD
         cpqZlnE7CZEeuBj7iMoIXOJMO5JPjr2kVaw5PkUVFzvmeCBcSApmDIxVCpULfgO3O/Su
         RyhA==
X-Gm-Message-State: AOAM533yQPJ8gpX8ZONPzgVotuLws+1x6nbSQCmpz6zSbyzUhd2AE2VK
	EUrpFgtLM/XiD6hM08Dv8oUF1++4GHoId0suRus=
X-Google-Smtp-Source: ABdhPJxE/VuSory3V8kcYrxRf+ed8yEi0ab6dETq4smU4job76+/y0ApQEcoHbfxQZQTMKhZf1VjNw==
X-Received: by 2002:a05:6a00:a1e:: with SMTP id p30mr5625210pfh.66.1644465898043;
        Wed, 09 Feb 2022 20:04:58 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([124.189.222.164])
        by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 20:04:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 09/15] target/arm: Implement FEAT_LVA
Date: Thu, 10 Feb 2022 15:04:17 +1100
Message-Id: <20220210040423.95120-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: xsY4r0hyRvb2

This feature is relatively small, as it applies only to
64k pages and thus requires no additional changes to the
table descriptor walking algorithm, only a change to the
minimum TSZ (which is the inverse of the maximum virtual
address space size).

Note that this feature widens VBAR_ELx, but we already
treat the register as being 64 bits wide.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h | 2 +-
 target/arm/cpu.h       | 5 +++++
 target/arm/cpu64.c     | 1 +
 target/arm/helper.c    | 9 ++++++++-
 4 files changed, 15 insertions(+), 2 deletions(-)

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
index 8786be7783..d80a7eafac 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -781,6 +781,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);
         t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1); /* TTCNP */
         t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
+        t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1); /* FEAT_LPA */
         cpu->isar.id_aa64mmfr2 = t;
 
         t = cpu->isar.id_aa64zfr0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e5050816cf..62935b06d0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11269,7 +11269,14 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
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
