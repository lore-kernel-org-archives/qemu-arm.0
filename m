Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a77sm7630225wmd.14.2021.06.04.09.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:32:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4A9B41FFCC;
	Fri,  4 Jun 2021 16:53:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 53/99] target/arm: replace CONFIG_TCG with tcg_enabled
Date: Fri,  4 Jun 2021 16:52:26 +0100
Message-Id: <20210604155312.15902-54-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KBclB68PHKMb

From: Claudio Fontana <cfontana@suse.de>

for "all" builds (tcg + kvm), we want to avoid doing
the psci and semihosting checks if tcg is built-in, but not enabled.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-sysemu.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index 7569241339..e83d55b9f7 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -1141,22 +1141,22 @@ void arm_cpu_do_interrupt(CPUState *cs)
                       env->exception.syndrome);
     }
 
-#ifdef CONFIG_TCG
-    if (arm_is_psci_call(cpu, cs->exception_index)) {
-        arm_handle_psci_call(cpu);
-        qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
-        return;
-    }
-    /*
-     * Semihosting semantics depend on the register width of the code
-     * that caused the exception, not the target exception level, so
-     * must be handled here.
-     */
-    if (cs->exception_index == EXCP_SEMIHOST) {
-        tcg_handle_semihosting(cs);
-        return;
+    if (tcg_enabled()) {
+        if (arm_is_psci_call(cpu, cs->exception_index)) {
+            arm_handle_psci_call(cpu);
+            qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
+            return;
+        }
+        /*
+         * Semihosting semantics depend on the register width of the code
+         * that caused the exception, not the target exception level, so
+         * must be handled here.
+         */
+        if (cs->exception_index == EXCP_SEMIHOST) {
+            tcg_handle_semihosting(cs);
+            return;
+        }
     }
-#endif /* CONFIG_TCG */
     /*
      * Hooks may change global state so BQL should be held, also the
      * BQL needs to be held for any modification of
-- 
2.20.1
