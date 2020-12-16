Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp740559lfq;
        Wed, 16 Dec 2020 14:13:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzV4D2R5cTWmO2FvXddzzL91sok65NBxZ8FuUcvc+HTBZ2LNP/Soeeuk0rOpTGQ6YBBbNbc
X-Received: by 2002:a25:b703:: with SMTP id t3mr4728301ybj.96.1608156804490;
        Wed, 16 Dec 2020 14:13:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608156804; cv=none;
        d=google.com; s=arc-20160816;
        b=0rnnSB0d1rybO3uhjwVdGfCZRBgFnwk90utubazbJiTOICzsPuO2dSSU4LLEpa4n+m
         ptrX0k+XyrhFxyoeYi+y9I2HHJe/+DLS8OQ1rIwVvqTu/JWyAFAr03EXPrU3eUq7gM7p
         TJZ50DUEsoCtTYotU9bOCzAmk+Fi18rghhwCh1Yl3A1wZI3oH7G8PQCHOt72iDoQc1P9
         vuhMVVqAExdoi5edANx/WES6fzftji+RvCiAo1qDGvrnCnwpvSDqu/ZLD14ZBG70k36+
         K4yNVMQl5uXseS38Yd/qTy0NQvD2YMKnDjiPgWWiNK+sg7yh0aei6+6un5Rbm28PO/j8
         OHcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=S71bGf+d3Q9K4n22xNAE85mdlMNKNCchTQ3JrM9w/AI=;
        b=DBhBmoWpkaL+7fqGR78lI+dfNxGjvQzl7aDjyw4iEpubTRT7VjxCd8i42i/38fjQl+
         auOyHTvIsgUT9v46czv42y/hfI/HxyWNP+iS6YK5ucrKfkjKpicAvWwhJOguZ9A6DndS
         GAb5p0t0HAn4dhM6hDUKaztS75dWL1KjAsXR82HeoWs+YyJ4dM94YfHMfjWfXKxgsjto
         kNDPLd4pojj9eNPBg/z3xPFdMHLtMB+svaX7tsyttUK+yBJFafHI1Weaajsqg8KTmROA
         5DBT50W34iHn7AjqCbSg0nScSSL2v/HviC4mJLjfJmFXL7FmiPhPtLKe0mv4t8RzFLgW
         4UEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="vw/7rSjE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3si2246057ybk.3.2020.12.16.14.13.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Dec 2020 14:13:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="vw/7rSjE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpf2x-0003Bx-Pp
	for alex.bennee@linaro.org; Wed, 16 Dec 2020 17:13:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpf2b-00038s-UY
 for qemu-arm@nongnu.org; Wed, 16 Dec 2020 17:13:01 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:32832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpf2T-0006Cg-GF
 for qemu-arm@nongnu.org; Wed, 16 Dec 2020 17:12:56 -0500
Received: by mail-ot1-x335.google.com with SMTP id b24so7452117otj.0
 for <qemu-arm@nongnu.org>; Wed, 16 Dec 2020 14:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S71bGf+d3Q9K4n22xNAE85mdlMNKNCchTQ3JrM9w/AI=;
 b=vw/7rSjE79042wlO6pSZMNHvFpRE47tcNo08ccB+HP9X+mKckKb5wi3+6996YRyusG
 nkJlzOlbghYb+XzBBLwhsMHwFUrI44VpfXR0CnkxeUBWBTlQb6qn7IyVqATaj6MeznOu
 aLQcUjRYoy0O6R2HtXFQKM5OehDSG7cb2djBU8e+uqNff7EUU2S3hmSS7EoqJOHZF803
 Trm9phPP1mWjvXv831Pp9LNGUfI6K2OV5TyAK8YMdm59gmjkr3niv3HdXCEeoKfPvPl1
 qNSEzsmIpwpv8FnAPPUP/0aYB31tHw3W5kOXnEcijdl7aPLeKAXknc8UW3STDE5CkuHL
 W9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S71bGf+d3Q9K4n22xNAE85mdlMNKNCchTQ3JrM9w/AI=;
 b=iBvV3yXCC+49OAc4KfAGM2T0Lmm6uOKkuI/x6suUbEtzLC6OD5OYVM/VpBCYuah3HP
 5MWEdm4nJIDz3v3obs5sVWdaomLWja1rAweYLyckkJZN7LqhYMrDt6Kcass5MjkhcWS0
 pebTio3MW0h4JlEnMtMukEtoBATIKxzUfjTiEJXJt7PpskMHxIG8ZQ+PB3vt/wB7Yavq
 U0AL2H9J+9byiKzKyC90l49eDZvmXxub96zyDStOrSPlg56sZ3JkaIEYf7Wp9rScwZLh
 P1fiQs518ZjHvrBZ4O4wH8ZMe2m1OdtvqYEGA8KE3fp5Ir51rCmjcopl3XLE/b8LczwG
 tWuA==
X-Gm-Message-State: AOAM530i1Itz71DXYCMq0DyZ2xqjlbbA2xlsVHtcshVs/mcXGCyxuYTA
 OFYSU7oU0hyNWqVD1D+csIOAfEveGJ4rKw3f
X-Received: by 2002:a05:6830:402c:: with SMTP id
 i12mr27612233ots.25.1608156772336; 
 Wed, 16 Dec 2020 14:12:52 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id z9sm758965ote.13.2020.12.16.14.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 14:12:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/3] target/arm: Add cpu properties to control pauth
Date: Wed, 16 Dec 2020 16:12:46 -0600
Message-Id: <20201216221247.522686-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201216221247.522686-1-richard.henderson@linaro.org>
References: <20201216221247.522686-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
X-TUID: 60gm1ghj+uGL

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
---
 target/arm/cpu.h               | 10 +++++++++
 target/arm/cpu.c               | 13 +++++++++++
 target/arm/cpu64.c             | 40 ++++++++++++++++++++++++++++++----
 target/arm/monitor.c           |  3 ++-
 tests/qtest/arm-cpu-features.c | 13 +++++++++++
 5 files changed, 74 insertions(+), 5 deletions(-)

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
index d6188f6566..5c5fb16114 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1321,6 +1321,19 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
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
index 169d8a64b6..0898be5de7 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -103,7 +103,8 @@ static const char *cpu_model_advertised_features[] = {
     "sve128", "sve256", "sve384", "sve512",
     "sve640", "sve768", "sve896", "sve1024", "sve1152", "sve1280",
     "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
-    "kvm-no-adjvtime", "kvm-steal-time",
+    "kvm-no-adjvtime",
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

