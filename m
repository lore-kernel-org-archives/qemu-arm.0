Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1121796ejc;
        Thu, 9 Mar 2023 12:14:43 -0800 (PST)
X-Google-Smtp-Source: AK7set/t6quMu2liUTXvc7WSENxL6szXnJEfHn5Bko+U42uuwmH4ul3AVLc2v8Tpfp0KMuALXgDK
X-Received: by 2002:a05:600c:1f11:b0:3df:ee64:4814 with SMTP id bd17-20020a05600c1f1100b003dfee644814mr436594wmb.20.1678392883364;
        Thu, 09 Mar 2023 12:14:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678392883; cv=none;
        d=google.com; s=arc-20160816;
        b=yppFCzU8SwtWIFJVZhk99KA1onoImp7vZ+HjSZGWawfS0l4zuzP7l40dqnUW832X6+
         1yhNBplsrBU/poXYwdE9ODoiAqqiyrLR5d1SeSdIv7Y9rqEz3huNJlxgEPsUVdk7Ubdh
         t8D4BTWApDKY5bpt1wUtYxE0K1zg7TBhcsSg0yLN6NgthP82IE8aYsNS8B/L8ynQ4Dx3
         83CC5cLYBbmDoGz65aMcSNmdvLCTW1haPv392ns1GI75O8diOKHk5LL4kYrEIyOvpVFa
         qQdWHs56y8IrnGFXpXQCN7OPIsfXo7iCKZr8Keqa9y9aS0vqlwuN3Cei1sFRZIjXh+c0
         NkXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=nptKRQnsHpIdNNKIq92B/YnmPkxjddmyC7pfo4kLYZI=;
        b=BMNP+Fz+FP0rpzLdXZAnhy5JL2iSnqHw9XJJFrcOFji54qeyEr6ucMnSJs732zSN2H
         bHpXp8ra73Wgo0LzQn9dcQeedlfaD7ymh+CxY4H/hiDw1QcTKljDV/G2PuCNwMWZ8uYi
         3QKfZtOnr19FHzSyh69PfeOw+LjEOukBrGqvVaLLKH1ErNNk4QADjlP9S+3LtqGrIVn0
         +aUgo5p/7EtT+jJgupp3KoPiZ+Od0//FpDFgya5a9dQCKLpHzJb7WCPohvDveDQigHo8
         oRShRSYLAW7raClXftw2D1SbMWxpAkF2I1EgNhmfQCqq7AlCWPxSSOvZ+VsYYroXhdOt
         NJ0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=wPFyILAh;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=Cc2Cxyx9;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id d18-20020adfe852000000b002c3e4d65b71si322203wrn.113.2023.03.09.12.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 12:14:43 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=wPFyILAh;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=Cc2Cxyx9;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E4B12202A9;
	Thu,  9 Mar 2023 20:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678392882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nptKRQnsHpIdNNKIq92B/YnmPkxjddmyC7pfo4kLYZI=;
	b=wPFyILAhO4eiouDpPLnZHxmmazi9FEHAfURfo6BxrXdpgmmxe0RF/r5pEo8VB4qkD44BbB
	m3+NW1HUDV3beMBe6hZShyvBQwgYp5I3GWPYLo/Ukzddz+Q7ChmKyuyBjGh4obDHVJzOYk
	UxB7+/z+2Vs3GwE7oSccMQJSsmmNyS0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678392882;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nptKRQnsHpIdNNKIq92B/YnmPkxjddmyC7pfo4kLYZI=;
	b=Cc2Cxyx9QGqFhFUFGQGulnUANJdSbuoLK/EbRMSktAP0id7rL2VESVw4GE39WOfE/rytaF
	2MLheE6o30fOk7AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 034AE1391B;
	Thu,  9 Mar 2023 20:14:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cFsoLy8+CmTUZwAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 09 Mar 2023 20:14:39 +0000
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
Subject: [PATCH v8 01/11] target/arm: Move cortex sysregs into a separate file
Date: Thu,  9 Mar 2023 17:14:24 -0300
Message-Id: <20230309201434.10831-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230309201434.10831-1-farosas@suse.de>
References: <20230309201434.10831-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: W+7GdcMgrXWg

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
