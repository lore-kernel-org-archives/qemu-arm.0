Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c7sm7120966wrs.23.2021.06.04.10.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 10:12:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E742A1FFC9;
	Fri,  4 Jun 2021 16:53:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 50/99] target/arm: fix style of arm_cpu_do_interrupt functions before move
Date: Fri,  4 Jun 2021 16:52:23 +0100
Message-Id: <20210604155312.15902-51-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qhQ07Qh4XFk5

From: Claudio Fontana <cfontana@suse.de>

before refactoring the exception code, fix the style of the
functions being moved.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/helper.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 7a9eaec5cb..5b32329895 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -896,10 +896,11 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         new_mode = ARM_CPU_MODE_UND;
         addr = 0x04;
         mask = CPSR_I;
-        if (env->thumb)
+        if (env->thumb) {
             offset = 2;
-        else
+        } else {
             offset = 4;
+        }
         break;
     case EXCP_SWI:
         new_mode = ARM_CPU_MODE_SVC;
@@ -985,7 +986,8 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         /* High vectors. When enabled, base address cannot be remapped. */
         addr += 0xffff0000;
     } else {
-        /* ARM v7 architectures provide a vector base address register to remap
+        /*
+         * ARM v7 architectures provide a vector base address register to remap
          * the interrupt vector table.
          * This register is only followed in non-monitor mode, and is banked.
          * Note: only bits 31:5 are valid.
@@ -1094,7 +1096,8 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
 
     if (cur_el < new_el) {
-        /* Entry vector offset depends on whether the implemented EL
+        /*
+         * Entry vector offset depends on whether the implemented EL
          * immediately lower than the target level is using AArch32 or AArch64
          */
         bool is_aa64;
@@ -1285,7 +1288,8 @@ static void handle_semihosting(CPUState *cs)
 }
 #endif
 
-/* Handle a CPU exception for A and R profile CPUs.
+/*
+ * Handle a CPU exception for A and R profile CPUs.
  * Do any appropriate logging, handle PSCI calls, and then hand off
  * to the AArch64-entry or AArch32-entry function depending on the
  * target exception level's register width.
@@ -1330,7 +1334,8 @@ void arm_cpu_do_interrupt(CPUState *cs)
     }
 #endif
 
-    /* Hooks may change global state so BQL should be held, also the
+    /*
+     * Hooks may change global state so BQL should be held, also the
      * BQL needs to be held for any modification of
      * cs->interrupt_request.
      */
-- 
2.20.1
