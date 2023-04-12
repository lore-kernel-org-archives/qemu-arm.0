Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp281063ejc;
        Wed, 12 Apr 2023 05:18:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350aSyxr47z7Caz6V4DcI/W6xYfg++P/AAoHpAYYnoUdolL9X5+xyrlXZSHiy7G7gyOnJZOsE
X-Received: by 2002:adf:dc8f:0:b0:2f4:fcd:98dd with SMTP id r15-20020adfdc8f000000b002f40fcd98ddmr2426625wrj.4.1681301919615;
        Wed, 12 Apr 2023 05:18:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681301919; cv=none;
        d=google.com; s=arc-20160816;
        b=Dr28feAz91667xh7x2gKLm5jQm5Yo0dJN6xoOx8gitPEiX4pX9JePBLdWySFfcTHRs
         IViHl5E/LMPa4rSdk94xbN3zOSstW6MVyp0lZlwZ8yBeJB2DhnldGZgtbo39ZTO7kGz8
         1Vkd0dZCTOAPzMbPbiIRDo/R9RNteAx2Jcd1jaOHdaiW7O67HSiTiKr9YZubo9fPKBLl
         KXh4XtsLOC0o5pca5ywOgUo4s1YLDlyezgK+L96ZitTsYTo2wzCdOo1wKdqvHE2wtzWe
         fW6RgwytW6Bwz//3JQZKext/jtPiToMOB9ESS9B+xqMvVu+UXsPuBGgkOwi+XD66z3fD
         ypXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=5ZsFpAOzynsL1MNCKIbnATj1swZgjRFQ/7HgcqreBqQ=;
        b=oimdsiHDWnN8VGuYjARmiWnarYkZzKWUzJaQKYQ8x/GgiP/BOkAFlnRwqqnk+Lf3C0
         FkfrW2v/Bs6IMp7O24lt5cs86/uBezsB7+KZ07C+DeDdAv4ElQ/YqH9g7LGyO6waiE2n
         JFTaELhxwOR38zYhXuG6WXwvC9kIf11Bz9AkG79mYSCcM+y+KBTwuMgZnSLePjfQjryH
         FC0FzC+xMXC004QPJuZwCqva9Kc5dAkFK8KUzZaip8WkcZ/z5JkUzB8kylAvxDZqG7vm
         e37J6YlZo2HvKblJCFWOnJStex4kg510I+dzMbP/d5MRVktE7jC7FZHduhnI4bFrpcli
         8atg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=NbfppvxP;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id k7-20020a5d66c7000000b002ef7428c6e7si11256566wrw.480.2023.04.12.05.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 05:18:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=NbfppvxP;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4190721972;
	Wed, 12 Apr 2023 12:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681301919; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ZsFpAOzynsL1MNCKIbnATj1swZgjRFQ/7HgcqreBqQ=;
	b=NbfppvxPjTxIAQOjrWIUuHpfJNHiS+66IN8as9l8Yzg/Km3fROLSub+UzSAHcnvdcVQubg
	0cShdY/B18A3TZ4yRXP5v2mKIljDnkn9u1F18DI4j154zewHEIZ/oFLp0o7NxZql9GCjE6
	TnK0MLOaaKid8LIN/FURmofSU1FifPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681301919;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ZsFpAOzynsL1MNCKIbnATj1swZgjRFQ/7HgcqreBqQ=;
	b=Y0KhajOJQU7x4DYZComSiEGpCb+BAAyRaK3fi8q+m9c0iauZmLLTjyjvmjLTFhsUE4EX3x
	Z2yjoNgPdbXyhWCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 37956132C7;
	Wed, 12 Apr 2023 12:18:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cPZYO5uhNmSMUgAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 12 Apr 2023 12:18:35 +0000
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
Subject: [PATCH v10 01/11] target/arm: Move cortex sysregs into a separate file
Date: Wed, 12 Apr 2023 09:18:19 -0300
Message-Id: <20230412121829.14452-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230412121829.14452-1-farosas@suse.de>
References: <20230412121829.14452-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: +hV1lSfTABKy

The file cpu_tcg.c is about to be moved into the tcg/ directory, so
move the register definitions into a new file.

Also move the function declaration to the more appropriate cpregs.h.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index 0fb07cc7b6..61a6b52aa6 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -30,6 +30,7 @@
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
index c2c70d5918..b73c540e7e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1376,12 +1376,6 @@ uint32_t arm_v7m_mrs_control(CPUARMState *env, uint32_t secure);
 uint32_t *arm_v7m_get_sp_ptr(CPUARMState *env, bool secure,
                              bool threadmode, bool spsel);
 
-#ifdef CONFIG_USER_ONLY
-static inline void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu) { }
-#else
-void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU *cpu);
-#endif
-
 bool el_is_in_host(CPUARMState *env, int el);
 
 void aa32_max_features(ARMCPU *cpu);
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 6226098ad5..3469926295 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -21,6 +21,7 @@ arm_softmmu_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
   'arm-qmp-cmds.c',
+  'cortex-regs.c',
   'machine.c',
   'ptw.c',
 ))
-- 
2.35.3
