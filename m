Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b798d3sm14364723f8f.100.2025.06.17.09.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:33:52 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id F3F655F845;
	Tue, 17 Jun 2025 17:33:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
	qemu-arm@nongnu.org,
	Mark Burton <mburton@qti.qualcomm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 01/11] target/arm: allow gdb to read ARM_CP_NORAW regs (!upstream)
Date: Tue, 17 Jun 2025 17:33:41 +0100
Message-ID: <20250617163351.2640572-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250617163351.2640572-1-alex.bennee@linaro.org>
References: <20250617163351.2640572-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LBdSH9UhreZQ

Before this we suppress all ARM_CP_NORAW registers being listed under
GDB. This includes useful registers like CurrentEL which gets tagged
as ARM_CP_NO_RAW because it is one of the ARM_CP_SPECIAL_MASK
registers. These are registers TCG can directly compute because we
have the information at compile time but until now with no readfn.

Add a .readfn to return the CurrentEL and then loosen the restrictions
in arm_register_sysreg_for_feature to allow ARM_CP_NORAW registers to
be read if there is a readfn available.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-ID: <20250507165840.401623-1-alex.bennee@linaro.org>

---
vRFC
  - this is a useful debugging aid but a bit haphazard for
    up-streaming. See thread comments for details.
---
 target/arm/gdbstub.c |  6 +++++-
 target/arm/helper.c  | 15 ++++++++++++++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index ce4497ad7c..029678ac9a 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -282,7 +282,11 @@ static void arm_register_sysreg_for_feature(gpointer key, gpointer value,
     CPUARMState *env = &cpu->env;
     DynamicGDBFeatureInfo *dyn_feature = &cpu->dyn_sysreg_feature;
 
-    if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_NO_GDB))) {
+    if (!(ri->type & ARM_CP_NO_GDB)) {
+        /* skip ARM_CP_NO_RAW if there are no helper functions */
+        if ((ri->type & ARM_CP_NO_RAW) && !ri->readfn) {
+            return;
+        }
         if (arm_feature(env, ARM_FEATURE_AARCH64)) {
             if (ri->state == ARM_CP_STATE_AA64) {
                 arm_gen_one_feature_sysreg(&param->builder, dyn_feature,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7631210287..8501c06b93 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4996,6 +4996,17 @@ static void ic_ivau_write(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 #endif
 
+/*
+ * Normally the current_el is known at translation time and we can
+ * emit the result directly in TCG code. However this helper exists
+ * only so we can also expose CURRENTEL to gdb.
+ */
+static uint64_t aa64_currentel_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    int el = arm_current_el(env);
+    return el;
+}
+
 static const ARMCPRegInfo v8_cp_reginfo[] = {
     /*
      * Minimal set of EL0-visible registers. This will need to be expanded
@@ -5034,7 +5045,9 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     },
     { .name = "CURRENTEL", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .opc2 = 2, .crn = 4, .crm = 2,
-      .access = PL1_R, .type = ARM_CP_CURRENTEL },
+      .access = PL1_R, .type = ARM_CP_CURRENTEL,
+      .readfn = aa64_currentel_read
+    },
     /*
      * Instruction cache ops. All of these except `IC IVAU` NOP because we
      * don't emulate caches.
-- 
2.47.2
