Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u14sm8911091wmc.41.2021.06.04.09.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:32:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A886D2000C;
	Fri,  4 Jun 2021 16:53:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 89/99] target/arm: cpu64: some final cleanup on aarch64_cpu_finalize_features
Date: Fri,  4 Jun 2021 16:53:02 +0100
Message-Id: <20210604155312.15902-90-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: JCPcteVuGOOE

From: Claudio Fontana <cfontana@suse.de>

bail out immediately if ARM_FEATURE_AARCH64 is not set,
and add an else statement when checking for accelerators.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu64.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 3058e2c273..ecce8c4308 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -473,26 +473,25 @@ void aarch64_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 {
     Error *local_err = NULL;
 
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        if (!cpu_sve_finalize_features(cpu, &local_err)) {
+    if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+        return;
+    }
+    if (!cpu_sve_finalize_features(cpu, &local_err)) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    /*
+     * KVM does not support modifications to this feature.
+     * We have not registered the cpu properties when KVM
+     * is in use, so the user will not be able to set them.
+     */
+    if (tcg_enabled()) {
+        if (!cpu_pauth_finalize(cpu, &local_err)) {
             error_propagate(errp, local_err);
             return;
         }
-
-        /*
-         * KVM does not support modifications to this feature.
-         * We have not registered the cpu properties when KVM
-         * is in use, so the user will not be able to set them.
-         */
-        if (tcg_enabled()) {
-            if (!cpu_pauth_finalize(cpu, &local_err)) {
-                error_propagate(errp, local_err);
-                return;
-            }
-        }
-    }
-
-    if (kvm_enabled()) {
+    } else if (kvm_enabled()) {
         kvm_arm_steal_time_finalize(cpu, &local_err);
         if (local_err != NULL) {
             error_propagate(errp, local_err);
-- 
2.20.1
