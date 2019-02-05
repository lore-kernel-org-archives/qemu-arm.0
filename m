Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id s132sm12470668wmf.28.2019.02.05.11.02.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Feb 2019 11:02:25 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8A7031FF81;
	Tue,  5 Feb 2019 19:02:24 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 1/6] target/arm: relax permission checks for HWCAP_CPUID registers
Date: Tue,  5 Feb 2019 19:02:19 +0000
Message-Id: <20190205190224.2198-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205190224.2198-1-alex.bennee@linaro.org>
References: <20190205190224.2198-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pAHSjBfPJmYa

Although technically not visible to userspace the kernel does make
them visible via a trap and emulate ABI. We provide a new permission
mask (PL0U_R) which maps to PL0_R for CONFIG_USER builds and adjust
the minimum permission check accordingly.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.h    | 12 ++++++++++++
 target/arm/helper.c |  6 +++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a68bcc9fed..1616632dcb 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2211,6 +2211,18 @@ static inline bool cptype_valid(int cptype)
 #define PL0_R (0x02 | PL1_R)
 #define PL0_W (0x01 | PL1_W)
 
+/*
+ * For user-mode some registers are accessible to EL0 via a kernel
+ * trap-and-emulate ABI. In this case we define the read permissions
+ * as actually being PL0_R. However some bits of any given register
+ * may still be masked.
+ */
+#ifdef CONFIG_USER_ONLY
+#define PL0U_R PL0_R
+#else
+#define PL0U_R PL1_R
+#endif
+
 #define PL3_RW (PL3_R | PL3_W)
 #define PL2_RW (PL2_R | PL2_W)
 #define PL1_RW (PL1_R | PL1_W)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d070879894..5857c0ba96 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6851,7 +6851,11 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
     if (r->state != ARM_CP_STATE_AA32) {
         int mask = 0;
         switch (r->opc1) {
-        case 0: case 1: case 2:
+        case 0:
+            /* min_EL EL1, but some accessible to EL0 via kernel ABI */
+            mask = PL0U_R | PL1_RW;
+            break;
+        case 1: case 2:
             /* min_EL EL1 */
             mask = PL1_RW;
             break;
-- 
2.20.1
