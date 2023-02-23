Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp709681ejc;
        Thu, 23 Feb 2023 05:11:24 -0800 (PST)
X-Google-Smtp-Source: AK7set9YU6yX1GP/jMm9FgDehmTpTZZ48OmMSpJ2IUW2fjViZkwPHsSQ+Ztdq9ZGOU6KqzcdYsAT
X-Received: by 2002:a5d:654c:0:b0:2c3:f4bd:2582 with SMTP id z12-20020a5d654c000000b002c3f4bd2582mr10818009wrv.46.1677157884423;
        Thu, 23 Feb 2023 05:11:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677157884; cv=none;
        d=google.com; s=arc-20160816;
        b=pw1ppTdaRob5zn5S3YyXYrTJktLI0P0ODW7/qfsiY0RaiollzEreOu50ZEJHaNyOSw
         KbCdZ2DZz/Ed1VUT26JacaORa83DwhKJVHmF6CRWhj4rjtigmfV/l/EsbnwVWZixcN7q
         rizPWgSHPmBovioQfld+z9QmeldKXsPWTSpRHL7GkI9BW9XhkVyWNQIluNvQ6Eb7IHHE
         O3QadrveRCKlLUgnkkJKfEPV+SO3I7/okFGy3coCjSXv2KU1Y+Jb8s8X6NGMq5MwllTi
         mFol0E41VvAnDeU6RRCb6s1+sta/EY2+rJMuzOdjRAtuJvo0zwKOFEQ7G048RPT1QsU+
         CPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=Kxbm3wfmuc0f5meXU20v3GSO9b4xyRbTiSELPIsPqRs=;
        b=trYJaTrRBK2Q/ajqrP0Ol0E5lXy9TO88WjqlkSWv0K2atoj4jTgm6eBKN1DYQ7ihKA
         A+E8iqNqDLTXRfLQpE7aQ/IYvtUtqFIpdBAEFAeD6p+OFpNCG1Gpc0P9a2xoo9NSc/gR
         uVG13PIdfKukTaqMQBLz17lDSqMC1hWsL5SdMT9KH2LZG40KR01B5z3arSLFdY0vRR6v
         Ij0IsLQZbiIDjZmDcZspx8yfGOFKbuQ37necJXQakQTiFsXfT2mCANjvdkZUSIWgMV4/
         NUw0YFcLR9dyrvk4uK/gpMjw3vwVMSHBWUzATJ3lUlattw0gK/JdFGPsUdS+1CTpFFXX
         qs+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=UlxDjuyG;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id k14-20020a5d66ce000000b002c5509a830dsi9760890wrw.27.2023.02.23.05.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 05:11:24 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=UlxDjuyG;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 14C3E33817;
	Thu, 23 Feb 2023 13:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677157884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kxbm3wfmuc0f5meXU20v3GSO9b4xyRbTiSELPIsPqRs=;
	b=UlxDjuyG9IModJ6z3Hz37xSrk/XfTKgX/DxyLM43/khksIv1/4HjWiXjvBnvIQqXBH2Cl0
	2hRaq1Xjzr9jby0YAmEN+GHRmORgWcblDAX6C1nB3CRkA/7Ab6mZCmFzYHM9L9ygmmXgIW
	syEIc7I99kSNZ7ZV7gLL5cFvmVc0TsM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677157884;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kxbm3wfmuc0f5meXU20v3GSO9b4xyRbTiSELPIsPqRs=;
	b=r8M5JD9WvbYvKFpGlBsXU/VHpitf1mxfZghaBaoRue7Yup0wsXUBmF/XAVxfpYFBrNbw5o
	kb9nvuxApGwAcgAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C0AEC139B5;
	Thu, 23 Feb 2023 13:11:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sIUMIvhl92MLawAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 23 Feb 2023 13:11:20 +0000
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
	Alexander Graf <agraf@csgraf.de>,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v7 11/20] target/arm: Move cortex sysregs into a separate file
Date: Thu, 23 Feb 2023 10:08:32 -0300
Message-Id: <20230223130841.25916-12-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230223130841.25916-1-farosas@suse.de>
References: <20230223130841.25916-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: AzvwCsuNI3bR

The file cpu_tcg.c is about to be moved into the tcg/ directory, so
move the register definitions into a new file.

Also move the function declaration to the more appropriate cpregs.h.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/cortex-regs.c | 69 ++++++++++++++++++++++++++++++++++++++++
 target/arm/cpregs.h      |  6 ++++
 target/arm/cpu64.c       |  1 +
 target/arm/cpu_tcg.c     | 59 ----------------------------------
 target/arm/internals.h   |  6 ----
 target/arm/meson.build   |  1 +
 6 files changed, 77 insertions(+), 65 deletions(-)
 create mode 100644 target/arm/cortex-regs.c

diff --git a/target/arm/cortex-regs.c b/target/arm/cortex-regs.c
new file mode 100644
index 0000000000..17708480e7
--- /dev/null
+++ b/target/arm/cortex-regs.c
@@ -0,0 +1,69 @@
+/*
+ * ARM Cortex-A registers
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "cpregs.h"
+
+
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
diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 1ee64e99de..b04d344a9f 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -1071,4 +1071,10 @@ static inline bool arm_cpreg_in_idspace(const ARMCPRegInfo *ri)
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
index 4066950da1..9f193927d8 100644
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
index df0c45e523..6ce728134f 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -93,65 +93,6 @@ void aa32_max_features(ARMCPU *cpu)
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
index 680c574717..9a033daa28 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1352,12 +1352,6 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
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
diff --git a/target/arm/meson.build b/target/arm/meson.build
index a5191b57e1..d236112684 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -20,6 +20,7 @@ arm_softmmu_ss = ss.source_set()
 arm_softmmu_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
+  'cortex-regs.c',
   'machine.c',
   'monitor.c',
   'ptw.c',
-- 
2.35.3
