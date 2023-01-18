Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp787763ejc;
        Wed, 18 Jan 2023 11:38:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuz3KsUtLwRmLU2Q+BKSK/zN6Shw/Fkhy5MDDkmhkFPpvDoqQHz0BeEG9kjgNGtGryK07gU
X-Received: by 2002:a5d:5642:0:b0:2bb:d412:9866 with SMTP id j2-20020a5d5642000000b002bbd4129866mr6755086wrw.25.1674070697922;
        Wed, 18 Jan 2023 11:38:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674070697; cv=none;
        d=google.com; s=arc-20160816;
        b=Ds3NzhfpQvxc73ZyECsgxCH4qsUs1ZvsHbLot4536B8Vosx0rekNcnrSlJm9eGm5vZ
         b7wVDdYY8NPeGveY2yhsI3kZvUt07skHgE3w5slalxz0ki1p8YRBsm8ev4JA9VxSZVfC
         H6tr4wLGuXjNCLj1ZazTwTkM+gzKxnpMyLzESBiWhogxYoTcB7bWvmUa7qYg8NHXHFRW
         es50xelmKXRcmhyTRbl1GdvCzSj5BNgms6UzmYvGCsQ15U1rjZY+u1ceCsqcad8alCgh
         DEnJHjVWML/P+wgyO0IbaJDyYrltVFAc6RycNCNI2a6mGBlPev6j+CwKip8fKnvI/Zq6
         igqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=4uCVJBLY0ATu4xQ8d2dfCObPifNrZ/sWtJ93Hm/8iys=;
        b=DpxUU0KeW9KQlAsJcEmyQ/MaiJf+7b3XeQqp/7CP6AN1V9q6IU4mt+E/Y4XeyO3GSC
         oFFISKpCYy2z67rbNr/BCC2saUnlqjfkNsR1pGylO0vgYOjm/MT6cu4Vmqr8ZQ8iO7hp
         NhL/5NQsCAGgtLZU22pRIMooYbXMIRinZUMw4V0xHhHlX75Ti7+FidFr1ne6p6clKBHd
         AdJpgw0Z/fN1Tp9mUZ1cdytHtmulZimVGFaQHlj5OPj9g5JzTOAeMV3oZMM9qC2t6OFF
         DmriT3Jd3XkNjhbxhRYxUVJ+GTXhTcHs9YNlyIgLA4Jo2ppaTckBxg19wNwnifvWjGKi
         20Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=WtFir16r;
       dkim=neutral (no key) header.i=@suse.de header.b="w/fVmHnZ";
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id bj19-20020a0560001e1300b002be173d1456si7501570wrb.460.2023.01.18.11.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 11:38:17 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=WtFir16r;
       dkim=neutral (no key) header.i=@suse.de header.b="w/fVmHnZ";
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8AC073F6D2;
	Wed, 18 Jan 2023 19:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674070697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4uCVJBLY0ATu4xQ8d2dfCObPifNrZ/sWtJ93Hm/8iys=;
	b=WtFir16rHgYmIldSBPJcY9TK17owNO8GqJJAGcO1Stiz3GedfG65OYkAUNAqStvXM2vq5W
	AQVL1SK9ESW2JyYg6t1Fsw5phjXko+tq/0RMrk+Wk85OfkUNbxHpjgjykXG7TdPh5VdwN1
	rkTMefpqwBsam53ukV+/y09f7UI4GsE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674070697;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4uCVJBLY0ATu4xQ8d2dfCObPifNrZ/sWtJ93Hm/8iys=;
	b=w/fVmHnZBSzBGHZVQXHMXEeP534oxiPxykgnVEB8I3iljREuXUubGoDl6QA2YnU5ACT+up
	hyRUftPtDDF0pcAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E1E63139D2;
	Wed, 18 Jan 2023 19:38:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id kM1AKqZKyGOWBwAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 19:38:14 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>
Subject: [PATCH 17/20] target/arm: Move cortex sysregs into cpregs.c
Date: Wed, 18 Jan 2023 16:35:15 -0300
Message-Id: <20230118193518.26433-18-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118193518.26433-1-farosas@suse.de>
References: <20230118193518.26433-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WzcuXf0wzl4E

The file cpu_tcg.c is about to be moved into the tcg/ directory, so
move the register definitions into cpregs.c along with all the others.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.c    | 59 ++++++++++++++++++++++++++++++++++++++++++
 target/arm/cpregs.h    |  6 +++++
 target/arm/cpu64.c     |  1 +
 target/arm/cpu_tcg.c   | 59 ------------------------------------------
 target/arm/internals.h |  6 -----
 5 files changed, 66 insertions(+), 65 deletions(-)

diff --git a/target/arm/cpregs.c b/target/arm/cpregs.c
index c86d29c1c1..50afbc19b2 100644
--- a/target/arm/cpregs.c
+++ b/target/arm/cpregs.c
@@ -9472,3 +9472,62 @@ void arm_cp_reset_ignore(CPUARMState *env, const ARMCPRegInfo *opaque)
 {
     /* Helper coprocessor reset function for do-nothing-on-reset registers */
 }
+
+#ifndef CONFIG_USER_ONLY
+static uint64_t l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    /* Number of cores is in [25:24]; otherwise we RAZ */
+    return (cpu->core_count - 1) << 24;
+}
+
+static const ARMCPRegInfo cortex_a72_a57_a53_cp_reginfo[] = {
+    { .name = "L2CTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 11, .crm = 0, .opc2 = 2,
+      .access = PL1_RW, .readfn = l2ctlr_read,
+      .writefn = arm_cp_write_ignore },
+    { .name = "L2CTLR",
+      .cp = 15, .opc1 = 1, .crn = 9, .crm = 0, .opc2 = 2,
+      .access = PL1_RW, .readfn = l2ctlr_read,
+      .writefn = arm_cp_write_ignore },
+    { .name = "L2ECTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 11, .crm = 0, .opc2 = 3,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "L2ECTLR",
+      .cp = 15, .opc1 = 1, .crn = 9, .crm = 0, .opc2 = 3,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "L2ACTLR", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 0, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUACTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUACTLR",
+      .cp = 15, .opc1 = 0, .crm = 15,
+      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
+    { .name = "CPUECTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 1,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUECTLR",
+      .cp = 15, .opc1 = 1, .crm = 15,
+      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
+    { .name = "CPUMERRSR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 2,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUMERRSR",
+      .cp = 15, .opc1 = 2, .crm = 15,
+      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
+    { .name = "L2MERRSR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 3,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "L2MERRSR",
+      .cp = 15, .opc1 = 3, .crm = 15,
+      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
+};
+
+void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu)
+{
+    define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
+}
+#endif /* !CONFIG_USER_ONLY */
diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index e20078a390..a67f48c4f6 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -591,4 +591,10 @@ static inline bool arm_cpreg_in_idspace(const ARMCPRegInfo *ri)
                                       ri->crn, ri->crm);
 }
 
+#ifdef CONFIG_USER_ONLY
+static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
+#else
+void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
+#endif
+
 #endif /* TARGET_ARM_CPREGS_H */
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 0e021960fb..5dfdae7bd2 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -29,6 +29,7 @@
 #include "qapi/visitor.h"
 #include "hw/qdev-properties.h"
 #include "internals.h"
+#include "cpregs.h"
 
 static void aarch64_a35_initfn(Object *obj)
 {
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index ccde5080eb..64d5a785c1 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -90,65 +90,6 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_dfr0 = t;
 }
 
-#ifndef CONFIG_USER_ONLY
-static uint64_t l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
-{
-    ARMCPU *cpu = env_archcpu(env);
-
-    /* Number of cores is in [25:24]; otherwise we RAZ */
-    return (cpu->core_count - 1) << 24;
-}
-
-static const ARMCPRegInfo cortex_a72_a57_a53_cp_reginfo[] = {
-    { .name = "L2CTLR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 1, .crn = 11, .crm = 0, .opc2 = 2,
-      .access = PL1_RW, .readfn = l2ctlr_read,
-      .writefn = arm_cp_write_ignore },
-    { .name = "L2CTLR",
-      .cp = 15, .opc1 = 1, .crn = 9, .crm = 0, .opc2 = 2,
-      .access = PL1_RW, .readfn = l2ctlr_read,
-      .writefn = arm_cp_write_ignore },
-    { .name = "L2ECTLR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 1, .crn = 11, .crm = 0, .opc2 = 3,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "L2ECTLR",
-      .cp = 15, .opc1 = 1, .crn = 9, .crm = 0, .opc2 = 3,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "L2ACTLR", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 0, .opc2 = 0,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUACTLR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 0,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUACTLR",
-      .cp = 15, .opc1 = 0, .crm = 15,
-      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
-    { .name = "CPUECTLR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 1,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUECTLR",
-      .cp = 15, .opc1 = 1, .crm = 15,
-      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
-    { .name = "CPUMERRSR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 2,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "CPUMERRSR",
-      .cp = 15, .opc1 = 2, .crm = 15,
-      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
-    { .name = "L2MERRSR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 3, .opc1 = 1, .crn = 15, .crm = 2, .opc2 = 3,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "L2MERRSR",
-      .cp = 15, .opc1 = 3, .crm = 15,
-      .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
-};
-
-void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu)
-{
-    define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
-}
-#endif /* !CONFIG_USER_ONLY */
-
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 
diff --git a/target/arm/internals.h b/target/arm/internals.h
index b1fccf13a3..a8fb8aa363 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1366,12 +1366,6 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
 #endif
 
-#ifdef CONFIG_USER_ONLY
-static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
-#else
-void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
-#endif
-
 bool el_is_in_host(CPUARMState *env, int el);
 
 void aa32_max_features(ARMCPU *cpu);
-- 
2.35.3
