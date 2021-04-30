Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp466409lfg;
        Fri, 30 Apr 2021 13:26:12 -0700 (PDT)
X-Received: by 2002:aa7:8010:0:b029:254:f083:66fa with SMTP id j16-20020aa780100000b0290254f08366famr6401012pfi.17.1619814372351;
        Fri, 30 Apr 2021 13:26:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619814372; cv=none;
        d=google.com; s=arc-20160816;
        b=L8lK/nsytALwhqeeygXRs8XVS9jBmWBia3DqxYqheRumi0YhCdhsIh8YADlY7O0X/L
         FfUEitLS6vL1xwIPgh1vSH6PYwkZKbPU4iwE3Sg2Mb3SLvHqWh3qhdyJJZCyeys/zgbL
         +U2pJbaeyA3YkY8tsUXe0dvw+hTxL6OG9PKVf4zIGfTdEaTjLNzTNoKd1a4rdpHegfrF
         cxWjbkCdJUvobo/6yHSogyX05uIc0KTIcZemuvSW1WmGp3AgOV9HWJlFdf+QDZcecrU8
         M3xMjMeb4FN2G7chC9ainugekOWMjTueXjN91TGWkOa1N7zdGQw4oYOpOfp1JAksoiD1
         3Utw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1UThjLBSb/XmVkkzs/Oev6mcIHSACdRwZzotytFesXI=;
        b=e55tl4E/Hazhy/ra2ic2nm0fnRGxRV/HNIqEbY2voOdSQd4+88bx7p2oWzCTwg+JUN
         fQQ9X0lMn0T6BUusJcFEkCQPkMvdyAJS69Schf8b8W0IhTlg0rGtJi7cz6Hvp4yPCmaU
         fiaZc0HecPXDJSGCVxQh1TDNmAPMLGa4CZ5ElIyJKUM+2shcQaxRzWp7BYT5MHfwdsdh
         LjXPCln1gXM5zIiOb7dl0yQjcjBjRpnX2E74wV1ovB2zxJMzPwbGg2Y0L8St14quHtqr
         FPEYMzv8I5AhIf2Y+gNfoar5/qLd75trN1dPjA8f46+1Y0udRS3bpHsvCWOK/aFCYnpl
         J/Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cNLHONW+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t8sor4400180plr.55.2021.04.30.13.26.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 30 Apr 2021 13:26:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cNLHONW+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1UThjLBSb/XmVkkzs/Oev6mcIHSACdRwZzotytFesXI=;
        b=cNLHONW+YFgQKZ2/axzcHwBr4YBzMah9n+gwaeVweoI3j/YXVc8aFIk4mJ4Qfkmdov
         7SXTjZdzZgy1/RCowPKv1WInS7KBnMO/18GvHiqGpkIOuMIPXcgaDfY81yoIodvscjok
         3zRA5epdBoxXOose2c8A7fjBukt7jn/reAmkF+ki3F1ha83DhaGNIZV8rRD2vrM+zqNk
         3QNIuVuS/jy8WksY6W9RJ4kQOaVm/DFaulD/72c/IWOucrw6gEQtx4LdoLFqsLJ8UShB
         34JLtGU3zn4CSi9m4aquihhy5magy+NeOXEHZGn1KPAlFzUH+BjBTNp8rJeMafDdLdg/
         H4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1UThjLBSb/XmVkkzs/Oev6mcIHSACdRwZzotytFesXI=;
        b=kRRIn8pKpceXa7/TjLxgPdu+12lYKbubbKuOYIZ/tnpPG+9jrKNauVkjuIlcBI237V
         HO1WVh/jHKvDezzCQG8qPVHLu1tFWGWIyzbuOqvjiKT/IiPmdt/2h/pV0rNRQgqHwM4q
         5RZrJ2sZamv2N+zjO3cIVODxVQHKLepYU0b21UGuR/bFTkOizedYXZDqjpejat3REEh9
         dNpQsS2nbooXSLZ3tpyN36h895vbMc64uKhWgK97V0/YZpo/Hccql23WEt1xKIe1mPSC
         sXR8x/bkWe01gXREzfYiu74u0iZqPaMQD9U+/QFvQ702qeQQrCJJwh5YO09BuiXWXs9z
         Kolw==
X-Gm-Message-State: AOAM532J0QWv74FGD7w1LxX8XwDYCHo1XZGmSclQ4HEyHEBp7yBmdd0n
	qHZ33UlrKDplFejMtf5V9PYmaCyWHZPM/iEc
X-Google-Smtp-Source: ABdhPJyO4EhsspFUspdh+5e3YUKnC1ef3kLVIVwd3safxcNYJdgMnaNREh63mQQR1TEX3ZSO++uNrg==
X-Received: by 2002:a17:902:501:b029:eb:7a1b:c96c with SMTP id 1-20020a1709020501b02900eb7a1bc96cmr7177337plf.76.1619814371770;
        Fri, 30 Apr 2021 13:26:11 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.144.24])
        by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 13:26:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v6 01/82] target/arm: Add ID_AA64ZFR0 fields and isar_feature_aa64_sve2
Date: Fri, 30 Apr 2021 13:24:49 -0700
Message-Id: <20210430202610.1136687-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5MTJoELUXq03

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
index 9b1b98705f..f47dd96076 100644
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
