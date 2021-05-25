Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4015590lfm;
        Mon, 24 May 2021 18:04:01 -0700 (PDT)
X-Received: by 2002:a17:90a:b292:: with SMTP id c18mr2028224pjr.179.1621904640922;
        Mon, 24 May 2021 18:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621904640; cv=none;
        d=google.com; s=arc-20160816;
        b=GGk6G1otv0/lVvP5TFfb4QJzMwk4zBC/zzV7W2cfB2RB8yhw+BIpYtbwSISwQCndtN
         juq1FJynthaWlvkCfox96YJAhqksNYOtbIGWyFmVVyw6euhKzYlGttgG84l7HWIF6c8S
         /EbGNSZh9/FVYPoHnpspgqPRJRayVNbEgX456UrTn+FY5ut81lFR2MwE0xfqaSeOTzHD
         kC3inIgwURAyk7o0B5uWMQLDptwbLDIrf100Sw2Pl16aePqarGRexU4rrRNbwbHN1GsQ
         bOtc1mfhC8GiMbQrW+G8Oc+1rEiXhumc+LTucit4D8futBbVijA4vATjE6Y8A3KWRcMj
         3Nhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jk9xuQuOdWwLhsZNV9U+4ALfnilDyaP5t7dhpaqzQXE=;
        b=JxnnhHwjFVs0bFiwOtsXxgMiK6ugvVkXAmTzJ0+GI3CNvpY+X6BPAYipelO4FPADAq
         Apx5j1YVIKQfgLIVcfn+qkW70ghj0na54yXfVG5IZT562EPB8Hm3vWz1kPKAczIk2E/z
         sAa6aiWrUVXTegBNRSnigkOwTjnRq5hM6EiDxh9xGXWjx0PnH9qmVe7Wk7helw93i5qr
         6rT+INprbgtZADzGJL+M5M48f0L6FxU2uFLx0aE2sTbngWvKWQ8sO1AKhedWzGXDjd4y
         f7VV4cJY+1t8UM9amuyN/ImBecNvTIjflR9Xwhd6ClUvoKbZfstu/fj5ORV9pskKtfi+
         x48w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CgYyAhh2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w69sor7855763pfc.11.2021.05.24.18.04.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 May 2021 18:04:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CgYyAhh2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jk9xuQuOdWwLhsZNV9U+4ALfnilDyaP5t7dhpaqzQXE=;
        b=CgYyAhh2wNdocjFevoKi06EGWL9bbN5tgQ/2qTbbbzWqRFFZHp+fBu/i4y4vbhXfpS
         h5fNoo1ua2jJ0tPTPwbEGSU4eBlGtY/dG30kf6RHlXdpbCxxjvkLwEr7aWJ4iSXLUf7C
         2V5c+KR1POAof6R5dtpnsbti6kCfGs2czvOFiGJAsGDFMcyYL6EI33U0bZ7tSfSwUU8o
         GBtXYfDQ82m5fU1mIiTGUqJ+faecFn5rBKrFsy+/CpDutacV0HQ4uAl0Qqqs20RvJKM8
         DwUw2gEap6P6MS5VztDbY+6AyLq5KvZN/6p3OSa/jpmb4kmy9vwoNeVP01+ovyi6t623
         bXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jk9xuQuOdWwLhsZNV9U+4ALfnilDyaP5t7dhpaqzQXE=;
        b=G+MZZt0QUNrI3evCyLr8J5j7JilPl4NHJLqyhP1bo9PQPPe2Cu75L1cRO4C20VtFql
         IszacB1DA8R4dnMSFJmNXSpE1RbMzh9ga5BjpvYQTrAq5H10D2jd5S9DdUu2kL9BVs6f
         bQVfgov/SdfBvn0nSwNBYsMxCFMRkJnv0fxIvBqWY8jxVEomho51LPcTheb2A2Cot9po
         dK2pDgKqHNx4xZWbPxuZOGlymqo1+7egzMhoSSQ2OSTqFkNn5x6+p3eDVYL8Gl5RK/i7
         7Vo82YtDOpUqL73LxV7CvyQla6uSIoF1PfF90S4F9mE6DDOp6+9AZOQC/EHjHOoFhPDV
         vMVg==
X-Gm-Message-State: AOAM533inimBBJdExpi3WYnqlPn71hx4NBeqf5HISUpWGjLN79d8oGSj
	A1+5VvEyl/Xe4tmgNdSjXog6uV7tljo0Np/T
X-Google-Smtp-Source: ABdhPJznsZE5x1YyAM/VVwAaM6zIaljOu0J0r6/dydjhjwA21TZLWD8O4xMZ76kWqgjjmavN0n3aeA==
X-Received: by 2002:aa7:92da:0:b029:2d5:59bc:a7e4 with SMTP id k26-20020aa792da0000b02902d559bca7e4mr27283842pfa.46.1621904640361;
        Mon, 24 May 2021 18:04:00 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 18:04:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v7 01/92] target/arm: Add ID_AA64ZFR0 fields and isar_feature_aa64_sve2
Date: Mon, 24 May 2021 18:02:27 -0700
Message-Id: <20210525010358.152808-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Y+UF4eoROb6T

Will be used for SVE2 isa subset enablement.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Do not read zfr0 from kvm unless sve is available.
v7: Move zfr0 read inside existing sve_enabled block.
---
 target/arm/cpu.h    | 16 ++++++++++++++++
 target/arm/helper.c |  3 +--
 target/arm/kvm64.c  | 21 +++++++++++++++------
 3 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 616b393253..a6e1fa6333 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -947,6 +947,7 @@ struct ARMCPU {
         uint64_t id_aa64mmfr2;
         uint64_t id_aa64dfr0;
         uint64_t id_aa64dfr1;
+        uint64_t id_aa64zfr0;
     } isar;
     uint64_t midr;
     uint32_t revidr;
@@ -2034,6 +2035,16 @@ FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
 FIELD(ID_AA64DFR0, TRACEFILT, 40, 4)
 FIELD(ID_AA64DFR0, MTPMU, 48, 4)
 
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
@@ -4215,6 +4226,11 @@ static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SSBS) != 0;
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
index 3b365a78cb..696aea2250 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7561,8 +7561,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
index dff85f6db9..37ceadd9a9 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -647,17 +647,26 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 
     sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
 
-    kvm_arm_destroy_scratch_host_vcpu(fdarray);
-
-    if (err < 0) {
-        return false;
-    }
-
     /* Add feature bits that can't appear until after VCPU init. */
     if (sve_supported) {
         t = ahcf->isar.id_aa64pfr0;
         t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
         ahcf->isar.id_aa64pfr0 = t;
+
+        /*
+         * Before v5.1, KVM did not support SVE and did not expose
+         * ID_AA64ZFR0_EL1 even as RAZ.  After v5.1, KVM still does
+         * not expose the register to "user" requests like this
+         * unless the host supports SVE.
+         */
+        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
+                              ARM64_SYS_REG(3, 0, 0, 4, 4));
+    }
+
+    kvm_arm_destroy_scratch_host_vcpu(fdarray);
+
+    if (err < 0) {
+        return false;
     }
 
     /*
-- 
2.25.1
