Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071236wrv;
        Wed, 31 Jul 2019 13:38:25 -0700 (PDT)
X-Received: by 2002:aa7:9191:: with SMTP id x17mr49330649pfa.23.1564605505566;
        Wed, 31 Jul 2019 13:38:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605505; cv=none;
        d=google.com; s=arc-20160816;
        b=1Ei7BCItNtc2jZnmRF68dit2OtWLPBj1n1JIFq00bXVb3KpAa5cCb+7vhMR6jdFXp9
         eJNreIC96ND8dblXCN2mQuSSnQuJI1J6SS8ifAXAvr7MYyoW0jKzl3m0EQ8RB0aiXptP
         qBEexaNKBys8DquRHkd6OkuCzsJSvvEYPnqkdFSZTisUhhd88yE5/zH0WWDiFmYkH/BD
         qmDHGu2d+Vj2/PrliQStp/1U9WH+XanBN6H/SlR+MLaDekKeeBJhiHvkTUxVKLiHoy43
         vR5NF8YAAwdNr/a/oW2d73Cz7voC69CAeU6Kt78UOqVIXkbtC5ehzyO7lJEpT8NKBrRm
         cXqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BmJBoz3ocCwfjPIQpLnVRF2wr3dk36b5G/HujhxQoNg=;
        b=wcHn8RHmDJZYZyEYGLxPh6FLjLI0tU7CU5YcVmMXxXVyR2/y7Z8K8ZS47baRd3vO11
         mALQEAD/Oe8KhMIA3l20Cg2Qh/cEpA07d+xB2ymml3rUgjR54kZV2qVUEqVTvqWVpQVI
         J7YSbNNAOiO0udiKOxmJK1SBqq59pb6MDGBtWU/hSiqFeediJvIgBY71l5ilQq4IqBBp
         /CLftjgtFrhG5BP3IYFDKEayw6O+XrU0iLF+flBPJ5tX3m3hDc8IT7qtnu3BxL2sj8sx
         piiupWSo0DCR/uV2pVIaxwpmBZrW6EFfK8RQS+B7r+L1PnvtBeAB9vfS2dc14I3IvYZe
         JdUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dq6i1Hs9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 13sor50706108pfi.28.2019.07.31.13.38.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dq6i1Hs9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BmJBoz3ocCwfjPIQpLnVRF2wr3dk36b5G/HujhxQoNg=;
        b=Dq6i1Hs91zq16uGduehbgnzKRhAalaBIaKorKOpFS3H0qN/HcGntn1JbQwgg+s7Ew1
         GqApdJQUGjWAxY/aMF00+P9eOlfn99eKYnNQ0sCAQ0KpVVUDXlWA5m/3TwR6jsxqt0Xj
         IQM7HjUKo8dWTW3mgc0mkxqQmTYr+yZ4jfBsGljgZ8K5KPvfyXP6ZhUc6k6uWgCKT3l0
         /d6q2IGejlSyIrwYMz3R13QENJgCD3q2nwCdiFPhusW/aFArl8lIjzL/OHZv3PmlXN4N
         7VRzrHfFj9fKlr/q3Y5cdzxzuJFL1Bnfu1bLTgWtjP6F/GhXJEJ32mGhFYUPXAPidLVz
         O+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BmJBoz3ocCwfjPIQpLnVRF2wr3dk36b5G/HujhxQoNg=;
        b=doZjSRiQT+SCyIkG0F2jPyZCTDbMvNJH977J6L3elLyurEzWvMhFs9vomqftIDisTu
         qEILjQBZbY/g9LpvXlOKcY98k58CQePA4vM6iXj4W9VSzx7XbQQX8RF8+QMmMnIXyC+5
         Z1rFL+9l358iQKXsduE4AgXNhtAjAjafbeMtJrD/8xB0AkyTislf5vAZceuzi9FhL+90
         sg2b8ttRAlARXoDGkwJS/R3sl9FrwmEpDysIeVIppNs4eR+66tdCVSszYxz+b6Ua67n5
         2EyUQ0HOKDcWvpkT3om7fDjP1wL+reqY8UkvfXuJUHTdXfqlvdcSgCG+3os7ZGEE4g63
         TAPA==
X-Gm-Message-State: APjAAAWlqhn15L1hdjwnV2mI7xwj12469Lzny5pCD8U6MD1Ewg6UmHez
	Ro0Wf0EtCdF6TFT4JHbG4bja1UhZ
X-Google-Smtp-Source: APXvYqyCL2CMqPxgwL8CQNGuInvavMSrrVdR9gHFBtMu2xxN/27T3RG46re5lp2XLkfCb17S0cH4zA==
X-Received: by 2002:a62:3895:: with SMTP id f143mr48675062pfa.116.1564605505099;
        Wed, 31 Jul 2019 13:38:25 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 08/32] target/arm: Add CONTEXTIDR_EL2
Date: Wed, 31 Jul 2019 13:37:49 -0700
Message-Id: <20190731203813.30765-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: W2miRvfb961C

Not all of the breakpoint types are supported, but those that
only examine contextidr are extended to support the new register.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/debug_helper.c | 50 +++++++++++++++++++++++++++++----------
 target/arm/helper.c       | 11 +++++++++
 2 files changed, 49 insertions(+), 12 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index dde80273ff..2e3e90c6a5 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -20,6 +20,7 @@ static bool linked_bp_matches(ARMCPU *cpu, int lbn)
     int ctx_cmps = extract32(cpu->dbgdidr, 20, 4);
     int bt;
     uint32_t contextidr;
+    uint64_t hcr_el2;
 
     /*
      * Links to unimplemented or non-context aware breakpoints are
@@ -40,24 +41,44 @@ static bool linked_bp_matches(ARMCPU *cpu, int lbn)
     }
 
     bt = extract64(bcr, 20, 4);
-
-    /*
-     * We match the whole register even if this is AArch32 using the
-     * short descriptor format (in which case it holds both PROCID and ASID),
-     * since we don't implement the optional v7 context ID masking.
-     */
-    contextidr = extract64(env->cp15.contextidr_el[1], 0, 32);
+    hcr_el2 = arm_hcr_el2_eff(env);
 
     switch (bt) {
     case 3: /* linked context ID match */
-        if (arm_current_el(env) > 1) {
-            /* Context matches never fire in EL2 or (AArch64) EL3 */
+        switch (arm_current_el(env)) {
+        default:
+            /* Context matches never fire in AArch64 EL3 */
             return false;
+        case 2:
+            if (!(hcr_el2 & HCR_E2H)) {
+                /* Context matches never fire in EL2 without E2H enabled. */
+                return false;
+            }
+            contextidr = env->cp15.contextidr_el[2];
+            break;
+        case 1:
+            contextidr = env->cp15.contextidr_el[1];
+            break;
+        case 0:
+            if ((hcr_el2 & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
+                contextidr = env->cp15.contextidr_el[2];
+            } else {
+                contextidr = env->cp15.contextidr_el[1];
+            }
+            break;
         }
-        return (contextidr == extract64(env->cp15.dbgbvr[lbn], 0, 32));
-    case 5: /* linked address mismatch (reserved in AArch64) */
+        break;
+
+    case 7:  /* linked contextidr_el1 match */
+        contextidr = env->cp15.contextidr_el[1];
+        break;
+    case 13: /* linked contextidr_el2 match */
+        contextidr = env->cp15.contextidr_el[2];
+        break;
+
     case 9: /* linked VMID match (reserved if no EL2) */
     case 11: /* linked context ID and VMID match (reserved if no EL2) */
+    case 15: /* linked full context ID match */
     default:
         /*
          * Links to Unlinked context breakpoints must generate no
@@ -66,7 +87,12 @@ static bool linked_bp_matches(ARMCPU *cpu, int lbn)
         return false;
     }
 
-    return false;
+    /*
+     * We match the whole register even if this is AArch32 using the
+     * short descriptor format (in which case it holds both PROCID and ASID),
+     * since we don't implement the optional v7 context ID masking.
+     */
+    return contextidr == (uint32_t)env->cp15.dbgbvr[lbn];
 }
 
 static bool bp_wp_matches(ARMCPU *cpu, int n, bool is_wp)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9a18ecf8f6..8baeb3f319 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6801,6 +6801,17 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, lor_reginfo);
     }
 
+    if (arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu)) {
+        static const ARMCPRegInfo vhe_reginfo[] = {
+            { .name = "CONTEXTIDR_EL2", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 1,
+              .access = PL2_RW,
+              .fieldoffset = offsetof(CPUARMState, cp15.contextidr_el[2]) },
+            REGINFO_SENTINEL
+        };
+        define_arm_cp_regs(cpu, vhe_reginfo);
+    }
+
     if (cpu_isar_feature(aa64_sve, cpu)) {
         define_one_arm_cp_reg(cpu, &zcr_el1_reginfo);
         if (arm_feature(env, ARM_FEATURE_EL2)) {
-- 
2.17.1
