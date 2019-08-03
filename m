Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2200930wrv;
        Sat, 3 Aug 2019 11:48:13 -0700 (PDT)
X-Received: by 2002:a62:7994:: with SMTP id u142mr66647806pfc.39.1564858093080;
        Sat, 03 Aug 2019 11:48:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858093; cv=none;
        d=google.com; s=arc-20160816;
        b=Eb8Rtv11MtfDDAWK1Wa5lL+id1x2XabQvQS66pZHkhosbk9i0fwiF4LBPArw5DOpMB
         CM5DigKjTtm5LlOFIRjBVTTtyozaFbDDDwS/jvYSb73pXbtnzERe7LWuyxE/YtKwhuGk
         7Zu7v8DAcvBmI3soESO91FSNkRnlhpMtwVoYRyxk1VpwKzzty+qE4zSi2ogW1a746b5v
         QmhNfC4q1wOvz/KwcRZCDQYC2bwWqG/VQXihHaOG8/Ac4P1UN0u9qcjUhvP8kyZvbNPD
         jpJG7n4LDEFlCR6hdQO6wSyzdzysNOcMppePr/vqj7NkaVHkA4/q3IhjQ1qtMsQVMSNY
         c7VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BmJBoz3ocCwfjPIQpLnVRF2wr3dk36b5G/HujhxQoNg=;
        b=dl4gCHQB6/9urD5Zt46HNBJL3CoNULXCQgLYcHjePZWevoWNQ/2pIdBlfK2HgzHeeP
         ZrTVO3JWyXU9gQUa2Q7NTdCyVeM9JggnWJgc47GBnve5QtrCQOYFTs7qVThPh1OBQ+mt
         xt5k4YVpw7cX9DIQ6nIiJ7rkxU4OGDDeCOWtHHoziQb+89f+jP/zJSndC4jeiPOH4D3T
         S+R2Ufrw4FI7Pkt8x5MRdMXvsVAJgx8Zqnonoq5VMuy6Tw5imHy3SEMx+jHaGTsagCw4
         7a1net0bnzWqpy+rv6QsF4EwMPwjdfnDRxpSHdmuAh7bFNDlTUxxIC+56QMGPA+mobNJ
         ubqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XOuKwYgo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 1sor94015979plw.7.2019.08.03.11.48.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XOuKwYgo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BmJBoz3ocCwfjPIQpLnVRF2wr3dk36b5G/HujhxQoNg=;
        b=XOuKwYgouGDpkaX6L6Uu/ztO4LamAjukWRR1TU+AbO+9d8EmzEJYGDgd3wbWL+1eQn
         FoDehmYmUS91lcRg8bfPfB94G6o/PJLpxhj86ESqDCIBvqYfIH3+AH9bJvaa+UdX7iPk
         jvuhHyVBQD1BGOx1IIU+wgGZN8QBO/0omjs6XaXVN7XIdVAHGJE8Qnc7KKnvmQV+/jyF
         FLW5nklHtdH2xKYULu3K82i8NFlqdfNFh2giImdOFsgyivibizZVPqg62mqkrvHKEIF4
         Vq7/+zZCwlmLTqkj/DomwraVUncNHLrHbGLpQc1/lczLH+39ypVYm5oRoVo0WJvRuhQZ
         bXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BmJBoz3ocCwfjPIQpLnVRF2wr3dk36b5G/HujhxQoNg=;
        b=cdpGL3vvwtIxDOdYTeo0FU4afVzaZoMqnwHw2FSmUZVvrjsnThrMRSFB6VVvoc3Fhr
         jHcXjieMbXUgq0AocGe3Uen0ia65LILIaaEQ+lzjZrhbFvUL2+WXfacYg77ZhDHEFB2c
         DFBaTv9DZJXnTcZjazvG+wgLiLgD6HetSIn/Y1s3P5iXF/5SVGazSuCFCcPbXae7MFJ+
         epqP5rZPVMBW/c0fUa6i09MkbgNSzeSH5J0MAIqcR26FLEEdZI7T0kYjUGPP6j14hRyd
         E3WPWYM87VyWRqGYvt4gfrkoBBr+RmcBWTXVPpr6D0+o0A1COAykYnWPgMHFjUr3tHwm
         RRsA==
X-Gm-Message-State: APjAAAWUS1+zPcM9BGLNjXQgsmTRxsLxYhAXIL5LUdFkgKil4bok+bKH
	HjIoIEF1GQxlocOH2GCTQHteFEHtkQ9oeQ==
X-Google-Smtp-Source: APXvYqy3NZ0JwOMcjCjgjaGzWuxYx3JBrhUhZSKO73Lmx08vvEg1w/X1okbZIcUL/2TTKu7mSSGoMQ==
X-Received: by 2002:a17:902:bc83:: with SMTP id bb3mr140601680plb.56.1564858092641;
        Sat, 03 Aug 2019 11:48:12 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 08/34] target/arm: Add CONTEXTIDR_EL2
Date: Sat,  3 Aug 2019 11:47:34 -0700
Message-Id: <20190803184800.8221-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RQ6hRCO/kNj8

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
