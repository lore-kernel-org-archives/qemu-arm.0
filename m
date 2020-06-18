Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1259419lfm;
        Wed, 17 Jun 2020 21:27:36 -0700 (PDT)
X-Received: by 2002:a62:780c:: with SMTP id t12mr1806701pfc.317.1592454456281;
        Wed, 17 Jun 2020 21:27:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592454456; cv=none;
        d=google.com; s=arc-20160816;
        b=A9llMgEERtZNnNKYUxbdujaeaO9iXMCRk3eBcVIJbSh1VTm5JpHKBvANfOG8nMTG1X
         +pQV2mygQqDZ2NUN6ymWZm6TdWJxRfqtDlryZL9/oqITTYIu1xgczX3hn9XraBaNhfL1
         sAABDrAAMI1TzizBPZnfdNabCsZ0DL+gOvfDJKPPew7yBj0AdmxpIsZ9GanXSJDlM0jR
         8+uUK25iq7qCXCwx7PmZS+247+T8OqENwlndFRi/5j/E9HYAFdVhumdkYQHRWHoeHDCS
         Hem0hu5i/cLx1cFZGz0hOwmR7lOF3yrIq3nDIS7cI98KhUGg7n4W3QfaOsaMdhmC25EB
         D8hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nrIaSFnyyPMIbXqZiRuw109mXnGYvmTKpfGMlwgvLXw=;
        b=oofFXbDyGTIe1REnoTfKV7kXU2uLTR/Jz4euCGUD6LzgNVn242TVm6KWZtuV2Ygbbn
         rMuuv0UcMsg5o7mi6JmlKfE+vHHNYrBVu5tWEcPYT+iLdmsFR7zTVP5zN+34Oa68hgQY
         e2o8ddX+xnhJfSXvedUxpVzW/6J7AoUWJ64ULGAcZMFA2xY1fhKDt0/F+TnZE6cL6Uli
         X6l0+IyQwNVcWlA8GJER11zr2QDQzRT6eq4Pzj2HFzdRjvnE08zI6jTN+GOdoVwUzpoV
         qwbHuerib2P9nvVsoCqdLsvlDMBep8Sak0+lLpQPyKqRMyVY5W+/KfN900zqWynn15IM
         x6sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S44Ds6b0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id bc3sor2627720plb.31.2020.06.17.21.27.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 17 Jun 2020 21:27:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S44Ds6b0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nrIaSFnyyPMIbXqZiRuw109mXnGYvmTKpfGMlwgvLXw=;
        b=S44Ds6b0BUwJkjjV8t3/mW55UuB5vYhdLWEWdX1ljAh7sBpxt+5anQnc1RrSqZfvJE
         5NmzqDEaT2RAhgb3Y08MSVdxtJ1gmDi6VsFSAF4hAnZQ/mbUU1PSCruyRgenONyGbL81
         fzYrQD038R1zrSitOBROFu3LajMmbrOobhn+uYEDkEXVTyOlWOjEGz1u6WVnu2ztB4ri
         nlNpPNB9cC+jAH/T++1VP/22dyYNuC2X/3InkFVvF8/0nqd2yRw0F0rAvBUiBGdfLgdA
         BoUsWO1WqeUtf41KtzRRNUjxSq+TNg29uTya++D6qXTivUeCgYZ16gxMwlfOgY9ws9aa
         PFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nrIaSFnyyPMIbXqZiRuw109mXnGYvmTKpfGMlwgvLXw=;
        b=rDW/nyP8f+xvzb9ewblD90O92+TeUg/5SVRCN/Jclop37DUbnWA+fdS6IgjdczA+sL
         vjfz5UwHAKa2j7yWAvLMXAuAYhQiqv7RnnN348DfCm2Ich+jdXtQlbN8SozYlYzY6Fcd
         1Bwp6c2+CIBlmOs12j4zZnwOUDPysvSRgB6BgVhPUSAsM0BLXzJ/VqXQRsBshVDJDZXy
         8rGkAEPRc2wySH65m8VFY0WdInwG2u+wWagFXCAgVosCyqsI7w8xajWxebNXw6tdZMCH
         d0ayxA6SHmYxkIlFK5DrW3nScJNjsVr2M1aa9f348mJoo9tepz+PHmyW+CHdlcKKiVww
         jhGw==
X-Gm-Message-State: AOAM531j1Rwxg0OM1VqIXm52dwydg6EKg63EJaDkawr2p2g81ze3Lc8y
	DnyyHGz1WiDaZUuS46iuNHu6P15C
X-Google-Smtp-Source: ABdhPJz+Oy1PTgvHHixiNZ8S3Ptd1cOHHq2TykD5I6YRJpOlwGYWCNkIPowj0HPSQo2og1qtot3g7g==
X-Received: by 2002:a17:902:102:: with SMTP id 2mr2122896plb.86.1592454455742;
        Wed, 17 Jun 2020 21:27:35 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net. [174.21.143.238])
        by smtp.gmail.com with ESMTPSA id u61sm964897pjb.7.2020.06.17.21.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 21:27:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: steplong@quicinc.com,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 014/100] target/arm: Add ID_AA64ZFR0 fields and isar_feature_aa64_sve2
Date: Wed, 17 Jun 2020 21:25:18 -0700
Message-Id: <20200618042644.1685561-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: gTvr0Ii4LPI7

Will be used for SVE2 isa subset enablement.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Do not read zfr0 from kvm unless sve is available.
---
 target/arm/cpu.h    | 16 ++++++++++++++++
 target/arm/helper.c |  3 +--
 target/arm/kvm64.c  | 11 +++++++++++
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 677584e5da..e9f56e67c7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -907,6 +907,7 @@ struct ARMCPU {
         uint64_t id_aa64mmfr2;
         uint64_t id_aa64dfr0;
         uint64_t id_aa64dfr1;
+        uint64_t id_aa64zfr0;
     } isar;
     uint64_t midr;
     uint32_t revidr;
@@ -1866,6 +1867,16 @@ FIELD(ID_AA64DFR0, PMSVER, 32, 4)
 FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
 FIELD(ID_AA64DFR0, TRACEFILT, 40, 4)
 
+FIELD(ID_AA64ZFR0, SVEVER, 0, 4)
+FIELD(ID_AA64ZFR0, AES, 4, 4)
+FIELD(ID_AA64ZFR0, BITPERM, 16, 4)
+FIELD(ID_AA64ZFR0, BFLOAT16, 20, 4)
+FIELD(ID_AA64ZFR0, SHA3, 32, 4)
+FIELD(ID_AA64ZFR0, SM4, 40, 4)
+FIELD(ID_AA64ZFR0, I8MM, 44, 4)
+FIELD(ID_AA64ZFR0, F32MM, 52, 4)
+FIELD(ID_AA64ZFR0, F64MM, 56, 4)
+
 FIELD(ID_DFR0, COPDBG, 0, 4)
 FIELD(ID_DFR0, COPSDBG, 4, 4)
 FIELD(ID_DFR0, MMAPDBG, 8, 4)
@@ -3846,6 +3857,11 @@ static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SVEVER) != 0;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 972a766730..51b97c2196 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7232,8 +7232,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 4,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              /* At present, only SVEver == 0 is defined anyway.  */
-              .resetvalue = 0 },
+              .resetvalue = cpu->isar.id_aa64zfr0 },
             { .name = "ID_AA64PFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 5,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index f09ed9f4df..ff46d8418d 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -549,6 +549,17 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr2,
                               ARM64_SYS_REG(3, 0, 0, 7, 2));
 
+        /*
+         * Before v5.1, KVM did not support SVE and did not expose
+         * ID_AA64ZFR0_EL1 even as RAZ.  Afterward, KVM still does
+         * not expose the register to "user" requests like this
+         * unless the host supports SVE.
+         */
+        if (isar_feature_aa64_sve(&ahcf->isar)) {
+            err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
+                                  ARM64_SYS_REG(3, 0, 0, 4, 4));
+        }
+
         /*
          * Note that if AArch32 support is not present in the host,
          * the AArch32 sysregs are present to be read, but will
-- 
2.25.1
