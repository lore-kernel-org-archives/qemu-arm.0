Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e268de2sm181468295e9.40.2025.06.17.09.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:33:52 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 15EEF5F873;
	Tue, 17 Jun 2025 17:33:52 +0100 (BST)
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
Subject: [RFC PATCH 02/11] target/arm: re-arrange debug_cp_reginfo
Date: Tue, 17 Jun 2025 17:33:42 +0100
Message-ID: <20250617163351.2640572-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250617163351.2640572-1-alex.bennee@linaro.org>
References: <20250617163351.2640572-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: heu0hgjJGAjf

Although we are using structure initialisation the order of the
op[012]/cr[nm] fields don't match the rest of the code base.
Re-organise to be consistent and help the poor engineer who is
grepping for system registers.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/debug_helper.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 69fb1d0d9f..8130ff78de 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -948,19 +948,21 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
      * DBGDSAR is deprecated and must RAZ from v8 anyway, so it has no AArch64
      * accessor.
      */
-    { .name = "DBGDRAR", .cp = 14, .crn = 1, .crm = 0, .opc1 = 0, .opc2 = 0,
+    { .name = "DBGDRAR", .cp = 14,
+      .opc0 = 0, .crn = 1, .crm = 0, .opc1 = 0, .opc2 = 0,
       .access = PL0_R, .accessfn = access_tdra,
       .type = ARM_CP_CONST | ARM_CP_NO_GDB, .resetvalue = 0 },
     { .name = "MDRAR_EL1", .state = ARM_CP_STATE_AA64,
-      .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 0,
+      .opc0 = 2, .crn = 1, .crm = 0, .opc1 = 0, .opc2 = 0,
       .access = PL1_R, .accessfn = access_tdra,
       .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "DBGDSAR", .cp = 14, .crn = 2, .crm = 0, .opc1 = 0, .opc2 = 0,
+    { .name = "DBGDSAR", .cp = 14,
+      .opc0 = 0, .opc1 = 0, .crn = 2, .crm = 0,.opc2 = 0,
       .access = PL0_R, .accessfn = access_tdra,
       .type = ARM_CP_CONST | ARM_CP_NO_GDB, .resetvalue = 0 },
     /* Monitor debug system control register; the 32-bit alias is DBGDSCRext. */
-    { .name = "MDSCR_EL1", .state = ARM_CP_STATE_BOTH,
-      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 2,
+    { .name = "MDSCR_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
+      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_tda,
       .fgt = FGT_MDSCR_EL1,
       .nv2_redirect_offset = 0x158,
-- 
2.47.2
