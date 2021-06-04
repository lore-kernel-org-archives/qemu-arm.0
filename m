Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id x10sm7152427wrt.65.2021.06.04.08.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 08:53:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5572F20006;
	Fri,  4 Jun 2021 16:53:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 86/99] target/arm: cpu-pauth: change arm_cpu_pauth_finalize name and sig
Date: Fri,  4 Jun 2021 16:52:59 +0100
Message-Id: <20210604155312.15902-87-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: m9xqiuc9SidJ

From: Claudio Fontana <cfontana@suse.de>

make arm_cpu_pauth_finalize return a bool,
and make the name canonical for the module (cpu_pauth_finalize).

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/cpu-pauth.h | 2 +-
 target/arm/cpu.c           | 3 +--
 target/arm/tcg/cpu-pauth.c | 5 ++++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/cpu-pauth.h b/target/arm/tcg/cpu-pauth.h
index af127876fe..a0ef74dc77 100644
--- a/target/arm/tcg/cpu-pauth.h
+++ b/target/arm/tcg/cpu-pauth.h
@@ -26,7 +26,7 @@
 #include "cpu.h"
 
 /* called by arm_cpu_finalize_features in realizefn */
-void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
+bool cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 
 /* add the CPU Pointer Authentication properties */
 void cpu_pauth_add_props(Object *obj);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5359331bff..8709c11784 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -837,8 +837,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
          * is in use, so the user will not be able to set them.
          */
         if (tcg_enabled()) {
-            arm_cpu_pauth_finalize(cpu, &local_err);
-            if (local_err != NULL) {
+            if (!cpu_pauth_finalize(cpu, &local_err)) {
                 error_propagate(errp, local_err);
                 return;
             }
diff --git a/target/arm/tcg/cpu-pauth.c b/target/arm/tcg/cpu-pauth.c
index f821087b14..4f087923ac 100644
--- a/target/arm/tcg/cpu-pauth.c
+++ b/target/arm/tcg/cpu-pauth.c
@@ -25,8 +25,9 @@
 #include "tcg/cpu-pauth.h"
 #include "hw/qdev-properties.h"
 
-void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
+bool cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
 {
+    bool result = true;
     int arch_val = 0, impdef_val = 0;
     uint64_t t;
 
@@ -40,6 +41,7 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
     } else if (cpu->prop_pauth_impdef) {
         error_setg(errp, "cannot enable pauth-impdef without pauth");
         error_append_hint(errp, "Add pauth=on to the CPU property list.\n");
+        result = false;
     }
 
     t = cpu->isar.id_aa64isar1;
@@ -48,6 +50,7 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
     t = FIELD_DP64(t, ID_AA64ISAR1, API, impdef_val);
     t = FIELD_DP64(t, ID_AA64ISAR1, GPI, impdef_val);
     cpu->isar.id_aa64isar1 = t;
+    return result;
 }
 
 static Property arm_cpu_pauth_property =
-- 
2.20.1
