Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp378538ejb;
        Mon, 13 Mar 2023 08:11:08 -0700 (PDT)
X-Google-Smtp-Source: AK7set+lO01LDFODHX0ZFkebquNadzoLKqVJ42u7L5eOe7UQPX8i/ra2z8wtzU0FMaJ4++YIEdTd
X-Received: by 2002:a05:600c:1d97:b0:3ea:f132:63d8 with SMTP id p23-20020a05600c1d9700b003eaf13263d8mr11613613wms.5.1678720268488;
        Mon, 13 Mar 2023 08:11:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678720268; cv=none;
        d=google.com; s=arc-20160816;
        b=kqb6rlBDWWMd+ur3ndgtMYldql3+4kqVUbh/qXfCPoQ3eshd/nK+a2SJ+XDSt+OAJ7
         +hg0OeDFCvHSIC7tTyj7rNMdu4RXrmlQGCl5l5ApSbWp0JpNUrygWyQdMhR7EBcaKZ7y
         /UID22MhinbNwb/vhmqW4UjJXGbsvcKzylYQIwMVc1d68mqv9ylEmDEFIdNTgJaB7Fty
         YK26ZxC/3+/797/1S1sz+EDKct67KKnheBw7siqoJ4tPkjQsWLrewnL5YT3/N7OhCL2E
         OkxxAlblEmVCgXeAtNEW+gLQuE6QA4lrQSAGMptYXM15fYYLrs7S/bWhel5JiVZN45Ly
         oWag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=nptKRQnsHpIdNNKIq92B/YnmPkxjddmyC7pfo4kLYZI=;
        b=TURQH7aUxKsCkQbGbZVftMalkxpEHu7C1x/YWYqqGG1TRhxPos8lbh2qPnfcRCHc9y
         /D2pJg/evn0lXFqbz+1Tpox0DrShBlqNNGcSbxqTFTTI/pp25JSCdwhIeWaDBP/pNCfU
         Yz9OqCj8aR+2aAVlHet064CBwXETKkxqBcWjWZqeaouAk5hG5+sN8bEqrfgbgGLCVa3r
         XSpbri7MdIYIgfolqNspK6pBPvw+GgwjZKgz5ldC2jMFLmPQb5XlhgYgEezDfuHDAO8r
         7gzSH5mF0vhlak/+49gcBjdKqwCBEoQmAUTdlRtbsL1N0sflXnYpKMcpsR/uHwvVCKCT
         E6RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=zSVtpe+B;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=+FAt7f0h;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id s6-20020a05600c384600b003dd1a489258si6308985wmr.226.2023.03.13.08.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 08:11:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=zSVtpe+B;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=+FAt7f0h;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D314B22ADB;
	Mon, 13 Mar 2023 15:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678720267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nptKRQnsHpIdNNKIq92B/YnmPkxjddmyC7pfo4kLYZI=;
	b=zSVtpe+BEX6qfweF8OHBlqlL1aWqTEuilrheoYDdJ7qz1T/SO0JJmYCPLrQQ5FbNQIl+2D
	/t1I6fggvxjtYj5VmS991YoDXTSI+yLHvb9rLm2zo/vUr9oTfcucNfQuIzoYKe57/QeF01
	TBzaL8+z8oTa6urYGfwtvQGWHbGA1YM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678720267;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nptKRQnsHpIdNNKIq92B/YnmPkxjddmyC7pfo4kLYZI=;
	b=+FAt7f0hvZkRAbonQfIb3SSj+2KoEBqctLKY+vRu4i/4PemzwaPWPNRtthxFFqhdsNodZN
	+5/puTl8arWTUeCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F324213582;
	Mon, 13 Mar 2023 15:11:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id INk3Lgg9D2R1YwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Mar 2023 15:11:04 +0000
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
Subject: [PATCH v9 01/10] target/arm: Move cortex sysregs into a separate file
Date: Mon, 13 Mar 2023 12:10:49 -0300
Message-Id: <20230313151058.19645-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230313151058.19645-1-farosas@suse.de>
References: <20230313151058.19645-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 4SCn4cPAPo+Y

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
index b1ef05963f..46a1d06e15 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1370,12 +1370,6 @@ uint32_t arm_v7m_mrs_control(CPUARMState *env, uint32_t secure);
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
