Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2954783lfg;
        Tue, 9 Mar 2021 08:20:45 -0800 (PST)
X-Received: by 2002:aca:f5c4:: with SMTP id t187mr3491399oih.127.1615306844967;
        Tue, 09 Mar 2021 08:20:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306844; cv=none;
        d=google.com; s=arc-20160816;
        b=mZEw8mOLPFUmFEwXIb/EyF1gnjgqcwFLmYinTPxsVeO28BSLNF75J8GTU1awVz161Y
         Cw8Goy4i1mdmKJZ89/4Kzspe8tDMg8k3MM6WXRao5vh/BMtcMTfa8wo+V0m98JEVmgmd
         LPdcNPHoZv2N8jqVfnmjE7PeqSIUyiDRLIHcu9vKYcpz96DfXEPNLSxP9C12muXyGsra
         E+yQPPh8sNCptK8ptGyKARoDD5XIGfwZVa50ch0HthP0/LtVf2Qo0peZZATYzr+JHvoc
         +l+3O+2ur/A6dT7tnk+gucw7LSThBcgNMv1F71Yrc9waiiceqC5VWC72JyRalJhN2x1I
         cDBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hYJXwe4FbJfgTdVPMN7My2daIn3Bg5z6ffUixEKobJI=;
        b=RR8HJyfPxHlm3MHVQz9RuK3jZN8IYl7cEXtxJSVxZ4aoWblikUiwJKyeRAMgKMGKh7
         4ctfHRKRs2GAMTuxs0i+9AXr9MVD6HwhDictqBxfN7RNHG2X6qr4bZpWWQVc+pjtACDb
         HrgKR2Frg3YQeFSqg7CHKPz7pRFI2Rs5jYf+N2/5avZ5Ymtuki4qmro/Vhv8OUhpublv
         9Uvt80Z5fv7JjygfVCWBxiM0aPFQU1WxecPqa7POzDZGCkw0b4Oxgi/J8DQ9LMBigYeA
         rOoDJ9NojwcrPBYeiRDE2rU9CHXbV/z967/uuW4u5jW9gvmzbsXSuzlSh8DITU5eDe2D
         qx7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H3usu8MF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y4sor92376oih.18.2021.03.09.08.20.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:20:44 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H3usu8MF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hYJXwe4FbJfgTdVPMN7My2daIn3Bg5z6ffUixEKobJI=;
        b=H3usu8MFzXk95EuTUYgzbCBYkuTSnaT2kJRw72Y3R+tuSgAz56SxHuGNH7gdhC2A5X
         20V3EyL2kLhB+8d6dHZjLP5ErtnVhQNws2df7nyTdpBn35sIuq6oHzv4ZgngRnSfWWYT
         0vQiYV/mLk+MuGF/kc92nIWO3gV9/mu/5T5xmqp8iHJ62HIhIRukH+rkzfp2C3Ls3vbC
         H8y3gDXIMA+zt9iKmT1fl60kydLpCVeXYyuXzb8t4xHfQNcgLheC4UhdbcgI/UTgjnwA
         /EQqoipyJ0FoXdYRbdNczgGpZ+wE63xSijN99T4cNMZdeKgQOIU+tIIEABYiw1pbYWFA
         ilzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hYJXwe4FbJfgTdVPMN7My2daIn3Bg5z6ffUixEKobJI=;
        b=Xl1UHs/RngqyshfgmMI9C7SatvW3wheIpxvm9MZbdb9mswhhz44mcDf4tg4wQeiCQB
         67Yjn/WNl8+pQr87tnt1UbLND8HLymz+mPDi4KjbT4hihxZYNVAjEOUPmKNoA29eVpTV
         D0XxN0FaxGReqXAdMrSB8o6ftwWVG719pDpLo+VXePr9rWsY5AKprbLPDLUpPkLh7SsG
         apxWFT+H5ESRPBhoVosBwzmem5Px8cCmQBG2fvbDjE6f+6VzAk94CMfLEplaPLrODORd
         a6GksZvYRh13jc3SX5JejZIVV/C2vdG37FaXGFdB+zwbb4gk/287Tn+uAoRvo2hYattn
         5PJQ==
X-Gm-Message-State: AOAM5327aV+eZ14Tj7sHJNAt98yRWhkzgX0GjwnMBvX6WGOVV5pasjyb
	3Dbps2CEj/1zHGtiikmuZmo6issijnBSDud5Srk=
X-Google-Smtp-Source: ABdhPJwW6zIlJTjDzJCzNIyM/j0OVjqEKAwt2tyyNg07fSL7Qkjt4rVOmFwynm1WssghTr7WKG5VxA==
X-Received: by 2002:aca:de82:: with SMTP id v124mr3481050oig.125.1615306844573;
        Tue, 09 Mar 2021 08:20:44 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:20:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 01/78] target/arm: Add ID_AA64ZFR0 fields and isar_feature_aa64_sve2
Date: Tue,  9 Mar 2021 08:19:24 -0800
Message-Id: <20210309162041.23124-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UfiRQxMzpYn2

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
index 193a49ec7f..ee92ea876e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -942,6 +942,7 @@ struct ARMCPU {
         uint64_t id_aa64mmfr2;
         uint64_t id_aa64dfr0;
         uint64_t id_aa64dfr1;
+        uint64_t id_aa64zfr0;
     } isar;
     uint64_t midr;
     uint32_t revidr;
@@ -2029,6 +2030,16 @@ FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
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
@@ -4182,6 +4193,11 @@ static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
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
index 904b0927cd..48c00de6ca 100644
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
index dff85f6db9..e8729b53fd 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -567,6 +567,17 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr2,
                               ARM64_SYS_REG(3, 0, 0, 7, 2));
 
+        /*
+         * Before v5.1, KVM did not support SVE and did not expose
+         * ID_AA64ZFR0_EL1 even as RAZ.  After v5.1, KVM still does
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
