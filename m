Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a15sm8466956wrs.63.2021.06.04.08.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 08:53:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E274D1FF96;
	Fri,  4 Jun 2021 16:53:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 75/99] target/arm: make is_aa64 and arm_el_is_aa64 a macro for !TARGET_AARCH64
Date: Fri,  4 Jun 2021 16:52:48 +0100
Message-Id: <20210604155312.15902-76-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZGdvG8ex+mJ2

From: Claudio Fontana <cfontana@suse.de>

when TARGET_AARCH64 is not defined, it is helpful to make
is_aa64() and arm_el_is_aa64 macros defined to "false".

This way we can make more code TARGET_AARCH64-only.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.h | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b9b9bd8b01..8614948543 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1060,6 +1060,11 @@ void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
 
+static inline bool is_a64(CPUARMState *env)
+{
+    return env->aarch64;
+}
+
 /*
  * SVE registers are encoded in KVM's memory in an endianness-invariant format.
  * The byte at offset i from the start of the in-memory representation contains
@@ -1089,7 +1094,10 @@ static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
 static inline void aarch64_sve_change_el(CPUARMState *env, int o,
                                          int n, bool a)
 { }
-#endif
+
+#define is_a64(env) ((void)env, false)
+
+#endif /* TARGET_AARCH64 */
 
 void aarch64_sync_32_to_64(CPUARMState *env);
 void aarch64_sync_64_to_32(CPUARMState *env);
@@ -1098,11 +1106,6 @@ int fp_exception_el(CPUARMState *env, int cur_el);
 int sve_exception_el(CPUARMState *env, int cur_el);
 uint32_t sve_zcr_len_for_el(CPUARMState *env, int el);
 
-static inline bool is_a64(CPUARMState *env)
-{
-    return env->aarch64;
-}
-
 /* you can call this signal handler from your SIGBUS and SIGSEGV
    signal handlers to inform the virtual CPU of exceptions. non zero
    is returned if the signal was handled by the virtual CPU.  */
@@ -2212,13 +2215,7 @@ static inline bool arm_is_el2_enabled(CPUARMState *env)
 }
 #endif
 
-/**
- * arm_hcr_el2_eff(): Return the effective value of HCR_EL2.
- * E.g. when in secure state, fields in HCR_EL2 are suppressed,
- * "for all purposes other than a direct read or write access of HCR_EL2."
- * Not included here is HCR_RW.
- */
-uint64_t arm_hcr_el2_eff(CPUARMState *env);
+#ifdef TARGET_AARCH64
 
 /* Return true if the specified exception level is running in AArch64 state. */
 static inline bool arm_el_is_aa64(CPUARMState *env, int el)
@@ -2253,6 +2250,20 @@ static inline bool arm_el_is_aa64(CPUARMState *env, int el)
     return aa64;
 }
 
+#else
+
+#define arm_el_is_aa64(env, el) ((void)env, (void)el, false)
+
+#endif /* TARGET_AARCH64 */
+
+/**
+ * arm_hcr_el2_eff(): Return the effective value of HCR_EL2.
+ * E.g. when in secure state, fields in HCR_EL2 are suppressed,
+ * "for all purposes other than a direct read or write access of HCR_EL2."
+ * Not included here is HCR_RW.
+ */
+uint64_t arm_hcr_el2_eff(CPUARMState *env);
+
 /* Function for determing whether guest cp register reads and writes should
  * access the secure or non-secure bank of a cp register.  When EL3 is
  * operating in AArch32 state, the NS-bit determines whether the secure
-- 
2.20.1
