Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c23sm9282915wme.37.2021.06.04.10.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 10:12:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B17C01FFF5;
	Fri,  4 Jun 2021 16:53:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 81/99] target/arm: tcg-sve: rename the narrow_vq and change_el functions
Date: Fri,  4 Jun 2021 16:52:54 +0100
Message-Id: <20210604155312.15902-82-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: t7tp0cw0DI2g

From: Claudio Fontana <cfontana@suse.de>

make them canonical for the module name.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/tcg-sve.h         | 6 +++---
 linux-user/syscall.c             | 2 +-
 target/arm/cpu-exceptions-aa64.c | 2 +-
 target/arm/tcg/cpregs.c          | 2 +-
 target/arm/tcg/helper-a64.c      | 2 +-
 target/arm/tcg/tcg-sve.c         | 6 +++---
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/tcg/tcg-sve.h b/target/arm/tcg/tcg-sve.h
index 5855bb4289..46e42d1139 100644
--- a/target/arm/tcg/tcg-sve.h
+++ b/target/arm/tcg/tcg-sve.h
@@ -21,9 +21,9 @@ uint32_t tcg_sve_disable_lens(unsigned long *sve_vq_map,
 bool tcg_sve_validate_lens(unsigned long *sve_vq_map, uint32_t max_vq,
                            Error **errp);
 
-void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
+void tcg_sve_narrow_vq(CPUARMState *env, unsigned vq);
 
-void aarch64_sve_change_el(CPUARMState *env, int old_el,
-                           int new_el, bool el0_a64);
+void tcg_sve_change_el(CPUARMState *env, int old_el,
+                       int new_el, bool el0_a64);
 
 #endif /* TCG_SVE_H */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index db4b7b1e46..4cfbe72b21 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -10877,7 +10877,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 vq = MIN(vq, cpu->sve_max_vq);
 
                 if (vq < old_vq) {
-                    aarch64_sve_narrow_vq(env, vq);
+                    tcg_sve_narrow_vq(env, vq);
                 }
                 env->vfp.zcr_el[1] = vq - 1;
                 arm_rebuild_hflags(env);
diff --git a/target/arm/cpu-exceptions-aa64.c b/target/arm/cpu-exceptions-aa64.c
index adaf3bab17..1a3e1d6458 100644
--- a/target/arm/cpu-exceptions-aa64.c
+++ b/target/arm/cpu-exceptions-aa64.c
@@ -119,7 +119,7 @@ void arm_cpu_do_interrupt_aarch64(CPUState *cs)
          * Note that new_el can never be 0.  If cur_el is 0, then
          * el0_a64 is is_a64(), else el0_a64 is ignored.
          */
-        aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
+        tcg_sve_change_el(env, cur_el, new_el, is_a64(env));
     }
 
     if (cur_el < new_el) {
diff --git a/target/arm/tcg/cpregs.c b/target/arm/tcg/cpregs.c
index 9d3c9ae841..9d4ac66281 100644
--- a/target/arm/tcg/cpregs.c
+++ b/target/arm/tcg/cpregs.c
@@ -5814,7 +5814,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      */
     new_len = sve_zcr_len_for_el(env, cur_el);
     if (new_len < old_len) {
-        aarch64_sve_narrow_vq(env, new_len + 1);
+        tcg_sve_narrow_vq(env, new_len + 1);
     }
 }
 
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index f261f13b2c..e169c03c63 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -1042,7 +1042,7 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
      * Note that cur_el can never be 0.  If new_el is 0, then
      * el0_a64 is return_to_aa64, else el0_a64 is ignored.
      */
-    aarch64_sve_change_el(env, cur_el, new_el, return_to_aa64);
+    tcg_sve_change_el(env, cur_el, new_el, return_to_aa64);
 
     qemu_mutex_lock_iothread();
     arm_call_el_change_hook(env_archcpu(env));
diff --git a/target/arm/tcg/tcg-sve.c b/target/arm/tcg/tcg-sve.c
index 908d2c2f2c..25d5a5867c 100644
--- a/target/arm/tcg/tcg-sve.c
+++ b/target/arm/tcg/tcg-sve.c
@@ -95,7 +95,7 @@ bool tcg_sve_validate_lens(unsigned long *sve_vq_map, uint32_t max_vq,
  * may well be cheaper than conditionals to restrict the operation
  * to the relevant portion of a uint16_t[16].
  */
-void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq)
+void tcg_sve_narrow_vq(CPUARMState *env, unsigned vq)
 {
     int i, j;
     uint64_t pmask;
@@ -124,7 +124,7 @@ void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq)
 /*
  * Notice a change in SVE vector size when changing EL.
  */
-void aarch64_sve_change_el(CPUARMState *env, int old_el,
+void tcg_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -162,6 +162,6 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
 
     /* When changing vector length, clear inaccessible state.  */
     if (new_len < old_len) {
-        aarch64_sve_narrow_vq(env, new_len + 1);
+        tcg_sve_narrow_vq(env, new_len + 1);
     }
 }
-- 
2.20.1
