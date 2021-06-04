Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id h1sm10457784wmq.0.2021.06.04.09.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:12:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0ECFD1FFE7;
	Fri,  4 Jun 2021 16:53:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 76/99] target/arm: restrict rebuild_hflags_a64 to TARGET_AARCH64
Date: Fri,  4 Jun 2021 16:52:49 +0100
Message-Id: <20210604155312.15902-77-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5QyxsWRuD+os

From: Claudio Fontana <cfontana@suse.de>

this work is in preparation of making sve_zcr_len_for_el AARCH64-only.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v14
  - fix merge failure with CPUARMTBflags update
---
 target/arm/helper-a64.h |  2 ++
 target/arm/helper.h     |  1 -
 target/arm/tcg/helper.c | 12 ++++++++++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 7b706571bb..c89406e656 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -118,3 +118,5 @@ DEF_HELPER_FLAGS_2(st2g_stub, TCG_CALL_NO_WG, void, env, i64)
 DEF_HELPER_FLAGS_2(ldgm, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_3(stgm, TCG_CALL_NO_WG, void, env, i64, i64)
 DEF_HELPER_FLAGS_3(stzgm_tags, TCG_CALL_NO_WG, void, env, i64, i64)
+
+DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 23ccb0f72f..e8df4f7625 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -94,7 +94,6 @@ DEF_HELPER_FLAGS_1(rebuild_hflags_m32_newel, TCG_CALL_NO_RWG, void, env)
 DEF_HELPER_FLAGS_2(rebuild_hflags_m32, TCG_CALL_NO_RWG, void, env, int)
 DEF_HELPER_FLAGS_1(rebuild_hflags_a32_newel, TCG_CALL_NO_RWG, void, env)
 DEF_HELPER_FLAGS_2(rebuild_hflags_a32, TCG_CALL_NO_RWG, void, env, int)
-DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)
 
 DEF_HELPER_FLAGS_5(probe_access, TCG_CALL_NO_WG, void, env, tl, i32, i32, i32)
 
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 38cc7c6a3d..7136c82795 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -999,6 +999,8 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
+#ifdef TARGET_AARCH64
+
 static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                         ARMMMUIdx mmu_idx)
 {
@@ -1122,6 +1124,14 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
 }
 
+#else
+
+QEMU_ERROR("this should have been optimized away!")
+CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
+                                 ARMMMUIdx mmu_idx);
+
+#endif /* TARGET_AARCH64 */
+
 static CPUARMTBFlags rebuild_hflags_internal(CPUARMState *env)
 {
     int el = arm_current_el(env);
@@ -1183,6 +1193,7 @@ void HELPER(rebuild_hflags_a32)(CPUARMState *env, int el)
     env->hflags = rebuild_hflags_a32(env, fp_el, mmu_idx);
 }
 
+#ifdef TARGET_AARCH64
 void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
 {
     int fp_el = fp_exception_el(env, el);
@@ -1190,6 +1201,7 @@ void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
 
     env->hflags = rebuild_hflags_a64(env, el, fp_el, mmu_idx);
 }
+#endif /* TARGET_AARCH64 */
 
 static inline void assert_hflags_rebuild_correctly(CPUARMState *env)
 {
-- 
2.20.1
