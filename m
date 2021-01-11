Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3084801lfq;
        Mon, 11 Jan 2021 15:58:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoIZ0f6WXe7NDsa1GwY6Xvj/xLpEBe9bd+/zN3tb59jpWsTkB+6iBQbJhVWSoiiOEFQBrk
X-Received: by 2002:a25:d24a:: with SMTP id j71mr3168282ybg.13.1610409494726;
        Mon, 11 Jan 2021 15:58:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610409494; cv=none;
        d=google.com; s=arc-20160816;
        b=CoCMcqK/c6L3e9PXtcT8a8+3ZVZS29k1vrirIr9PqEiZjZPNOwo52jyfC9nohopDpb
         CcWSY6kj30KKl2QrruK4nH7QfDgJmLu1JOPoOd3bcBvrLbqOsPYjBoTF7XSxm2FtByp+
         jUzOqJkUH716Ng/eu1HpPcEmUBzMxvzshfam/CzhYN49mWauDEbZ0D91Ibnv7OfFoTHC
         1rVLSyrtI2bmGiSAdKOmEb+ZF5B9w1famvjwyhpXZadA20loCSG4AUZphJF0egJwbEF/
         2Ad6uD/4jFYz5wJaA0LrBw9KlKpljDtvqq9myUo4AhD7V7OMd1RFtoThmpszQt2rw/Rp
         DuEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=P/1CnPUCsHl89eN9FhdQHAGizSgbDLia/I3HSPXWjL0=;
        b=BkoZM38HAJBDCm01xNFoUAi7tqpfqhYeCmP9CsYxEc3debAcknvCLUuuvFE5FcjJiE
         Duvmjp9+Pr5PxylWx07D1BWBw+xRATzS5JPdpBE5sy2wK8yDsyezzukwx9/bEkSdpzJr
         0yAziH7GVnAZ8dflJoC3LXI+n9531Unyz5XnHf1+rqwiXDJC0r1R6pG0L4C+d+COodlD
         0CHkWZwONTqRTngifNphRgHNjTgieNWpr41+6+RFPBuBI50Bzco+324mLuIXZ2zo3FUO
         wJBmjNvUcycv/PJmLYB2x+sMFGZdkfBf7p8lIYsD9gd64RXYtfBg+W22dOjlJiqEHbDw
         ZwcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lJEDjFqK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o138si1142298yba.85.2021.01.11.15.58.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 15:58:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lJEDjFqK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz74g-0005W3-2w
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 18:58:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz74K-0005Sw-B7
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 18:57:54 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:46784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz74H-0003Vd-2p
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 18:57:52 -0500
Received: by mail-pg1-x52d.google.com with SMTP id c22so197305pgg.13
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 15:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P/1CnPUCsHl89eN9FhdQHAGizSgbDLia/I3HSPXWjL0=;
 b=lJEDjFqKAiRNmQyNQm6Y7lLIclTnJ267VMey7EgI7+BQnV2LX8Q+kzIMXPwKL1VPGL
 L5TvQ07ij92Tx2BxkrBg5YGl1hMBffss/5IQQjkdb9jw+6o22JgzD9AD71n2XX2XQn/W
 rogZlgiF0SiSwB9aU09sRMkKZrWAwVBzqWi5ycnyhzvLTrCeJ48+C+TZSmjWNbdv9sji
 1nlrwJOxI4N9WwFoUMTs6fdd5MbQCS0ddW76tCd2SwMed83kL4YGdXSIIzPdxfU2zqUC
 Sb/S5A232aTbsMTZSpzuvx1xdqo3VOaYiDXxD79DUEPWboJzA1XJMa7lUAP1e+fOS8VQ
 NiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P/1CnPUCsHl89eN9FhdQHAGizSgbDLia/I3HSPXWjL0=;
 b=jL09AGsbst5phT+MYPOt9av8HKkloYdr3OLIxqUck2geVQZtAfeyI1H4pZF8GUSnND
 3x55XVLcCAfcjmwTSMUJ4GgDRegY1UPaRyKeXQz7NI+++X+Ydj+pGC7nj9wY1ZNhJrQC
 lUMn+FqCyuIbnP5bdKghRAL2bYZ642PEmfT2y104n5h0X2Ces0lHHkOq/noCLXgCERf2
 SKjpTckRlJXIeAiDK/jt1ma2P0f3lVYF3cMDySRKNJ+7TRNR3IsuVCddYVZgiEs9f0XW
 nxttCm42PzkVHQE5W6BKbbzigtCtBaiCvO+SFzVw4sVOG/fTkZqIRkLlRSIiUyksbOv+
 x/Jw==
X-Gm-Message-State: AOAM530T0zfnnYT0AVyUNk+Nusn23SIqKO3bIOlYp49QKKEYDcpGpnUO
 471/XFpB6XZQcEMw4v0i7k+TCQ==
X-Received: by 2002:a65:534c:: with SMTP id w12mr1853033pgr.179.1610409467459; 
 Mon, 11 Jan 2021 15:57:47 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s67sm872220pgb.60.2021.01.11.15.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 15:57:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 2/3] target/arm: Add cpu properties to control pauth
Date: Mon, 11 Jan 2021 13:57:39 -1000
Message-Id: <20210111235740.462469-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111235740.462469-1-richard.henderson@linaro.org>
References: <20210111235740.462469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, peter.maydell@linaro.org,
 Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kNcyKRFR4fZs

The crypto overhead of emulating pauth can be significant for
some workloads.  Add two boolean properties that allows the
feature to be turned off, on with the architected algorithm,
or on with an implementation defined algorithm.

We need two intermediate booleans to control the state while
parsing properties lest we clobber ID_AA64ISAR1 into an invalid
intermediate state.

Tested-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Use boolean properties instead of an enum (drjones).
v3: Add tests (drjones).
v6: Add documentation (pmm).
---
 docs/system/arm/cpu-features.rst | 21 +++++++++++++++++
 target/arm/cpu.h                 | 10 ++++++++
 target/arm/cpu.c                 | 13 +++++++++++
 target/arm/cpu64.c               | 40 ++++++++++++++++++++++++++++----
 target/arm/monitor.c             |  1 +
 tests/qtest/arm-cpu-features.c   | 13 +++++++++++
 6 files changed, 94 insertions(+), 4 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index 35196a6b75..70e0e4ef78 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -211,6 +211,27 @@ the list of KVM VCPU features and their descriptions.
                            influence the guest scheduler behavior and/or be
                            exposed to the guest userspace.
 
+TCG VCPU Features
+=================
+
+TCG VCPU features are CPU features that are specific to TCG.
+Below is the list of TCG VCPU features and their descriptions.
+
+  pauth                    Enable or disable `FEAT_Pauth`, pointer
+                           authentication.  By default, the feature is
+                           enabled with `-cpu max`.
+
+  pauth-impdef             When `FEAT_Pauth` is enabled, either the
+                           *impdef* (Implementation Definined) algorithm
+                           is enabled or the *architected* QARMA algorithm
+                           is enabled.  By default the impdef algorithm
+                           is disabled, and QARMA is enabled.
+
+                           The architected QARMA algorithm has good
+                           cryptographic properties, but can be quite slow
+                           to emulate.  The impdef algorithm is
+                           non-cryptographic but significantly faster.
+
 SVE CPU Properties
 ==================
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 70e9618d13..06f5169f45 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -197,9 +197,11 @@ typedef struct {
 #ifdef TARGET_AARCH64
 # define ARM_MAX_VQ    16
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
+void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 #else
 # define ARM_MAX_VQ    1
 static inline void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp) { }
+static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
 #endif
 
 typedef struct ARMVectorReg {
@@ -947,6 +949,14 @@ struct ARMCPU {
     uint64_t reset_cbar;
     uint32_t reset_auxcr;
     bool reset_hivecs;
+
+    /*
+     * Intermediate values used during property parsing.
+     * Once finalized, the values should be read from ID_AA64ISAR1.
+     */
+    bool prop_pauth;
+    bool prop_pauth_impdef;
+
     /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
     uint32_t dcz_blocksize;
     uint64_t rvbar;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8387e94b94..be18df5464 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1320,6 +1320,19 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             error_propagate(errp, local_err);
             return;
         }
+
+        /*
+         * KVM does not support modifications to this feature.
+         * We have not registered the cpu properties when KVM
+         * is in use, so the user will not be able to set them.
+         */
+        if (!kvm_enabled()) {
+            arm_cpu_pauth_finalize(cpu, &local_err);
+            if (local_err != NULL) {
+                error_propagate(errp, local_err);
+                return;
+            }
+        }
     }
 
     if (kvm_enabled()) {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 7cf9fc4bc6..d9feaa9cdb 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -28,6 +28,8 @@
 #include "sysemu/kvm.h"
 #include "kvm_arm.h"
 #include "qapi/visitor.h"
+#include "hw/qdev-properties.h"
+
 
 #ifndef CONFIG_USER_ONLY
 static uint64_t a57_a53_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -572,6 +574,36 @@ void aarch64_add_sve_properties(Object *obj)
     }
 }
 
+void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
+{
+    int arch_val = 0, impdef_val = 0;
+    uint64_t t;
+
+    /* TODO: Handle HaveEnhancedPAC, HaveEnhancedPAC2, HaveFPAC. */
+    if (cpu->prop_pauth) {
+        if (cpu->prop_pauth_impdef) {
+            impdef_val = 1;
+        } else {
+            arch_val = 1;
+        }
+    } else if (cpu->prop_pauth_impdef) {
+        error_setg(errp, "cannot enable pauth-impdef without pauth");
+        error_append_hint(errp, "Add pauth=on to the CPU property list.\n");
+    }
+
+    t = cpu->isar.id_aa64isar1;
+    t = FIELD_DP64(t, ID_AA64ISAR1, APA, arch_val);
+    t = FIELD_DP64(t, ID_AA64ISAR1, GPA, arch_val);
+    t = FIELD_DP64(t, ID_AA64ISAR1, API, impdef_val);
+    t = FIELD_DP64(t, ID_AA64ISAR1, GPI, impdef_val);
+    cpu->isar.id_aa64isar1 = t;
+}
+
+static Property arm_cpu_pauth_property =
+    DEFINE_PROP_BOOL("pauth", ARMCPU, prop_pauth, true);
+static Property arm_cpu_pauth_impdef_property =
+    DEFINE_PROP_BOOL("pauth-impdef", ARMCPU, prop_pauth_impdef, false);
+
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
  * otherwise, a CPU with as many features enabled as our emulation supports.
  * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
@@ -627,10 +659,6 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);
         t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR1, APA, 1); /* PAuth, architected only */
-        t = FIELD_DP64(t, ID_AA64ISAR1, API, 0);
-        t = FIELD_DP64(t, ID_AA64ISAR1, GPA, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR1, GPI, 0);
         t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
@@ -720,6 +748,10 @@ static void aarch64_max_initfn(Object *obj)
         cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
         cpu->dcz_blocksize = 7; /*  512 bytes */
 #endif
+
+        /* Default to PAUTH on, with the architected algorithm. */
+        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_property);
+        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
     }
 
     aarch64_add_sve_properties(obj);
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 198b14e95e..80c64fa355 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -95,6 +95,7 @@ static const char *cpu_model_advertised_features[] = {
     "sve640", "sve768", "sve896", "sve1024", "sve1152", "sve1280",
     "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
     "kvm-no-adjvtime", "kvm-steal-time",
+    "pauth", "pauth-impdef",
     NULL
 };
 
diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index bc681a95d5..8252b85bb8 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -427,6 +427,18 @@ static void sve_tests_sve_off_kvm(const void *data)
     qtest_quit(qts);
 }
 
+static void pauth_tests_default(QTestState *qts, const char *cpu_type)
+{
+    assert_has_feature_enabled(qts, cpu_type, "pauth");
+    assert_has_feature_disabled(qts, cpu_type, "pauth-impdef");
+    assert_set_feature(qts, cpu_type, "pauth", false);
+    assert_set_feature(qts, cpu_type, "pauth", true);
+    assert_set_feature(qts, cpu_type, "pauth-impdef", true);
+    assert_set_feature(qts, cpu_type, "pauth-impdef", false);
+    assert_error(qts, cpu_type, "cannot enable pauth-impdef without pauth",
+                 "{ 'pauth': false, 'pauth-impdef': true }");
+}
+
 static void test_query_cpu_model_expansion(const void *data)
 {
     QTestState *qts;
@@ -462,6 +474,7 @@ static void test_query_cpu_model_expansion(const void *data)
         assert_has_feature_enabled(qts, "cortex-a57", "aarch64");
 
         sve_tests_default(qts, "max");
+        pauth_tests_default(qts, "max");
 
         /* Test that features that depend on KVM generate errors without. */
         assert_error(qts, "max",
-- 
2.25.1

