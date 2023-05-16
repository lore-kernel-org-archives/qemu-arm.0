Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id z21-20020a1c4c15000000b003f508115b25sm1947019wmf.4.2023.05.16.03.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 03:44:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D3D691FFBB;
	Tue, 16 May 2023 11:44:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH] target/arm: add RAZ/WI handling for DBGDTR[TX|RX]
Date: Tue, 16 May 2023 11:44:20 +0100
Message-Id: <20230516104420.407912-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fZeGdnOyCqgl

The commit b3aa2f2128 (target/arm: provide stubs for more external
debug registers) was added to handle HyperV's unconditional usage of
Debug Communications Channel. It turns out that Linux will similarly
break if you enable CONFIG_HVC_DCC "ARM JTAG DCC console".

Extend the registers we RAZ/WI set to avoid this.

Cc: Anders Roxell <anders.roxell@linaro.org>
Cc: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/debug_helper.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index dfc8b2a1a5..d41cc643b1 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -949,8 +949,10 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
       .access = PL0_R, .accessfn = access_tdcc,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     /*
-     * OSDTRRX_EL1/OSDTRTX_EL1 are used for save and restore of DBGDTRRX_EL0.
-     * It is a component of the Debug Communications Channel, which is not implemented.
+     * These registers belong to the Debug Communications Channel,
+     * which is not implemented. However we implement RAZ/WI behaviour
+     * with trapping to prevent spurious SIGILLs if the guest OS does
+     * access them as the support cannot be probed for.
      */
     { .name = "OSDTRRX_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
       .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 0, .opc2 = 2,
@@ -960,6 +962,11 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
       .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_tdcc,
       .type = ARM_CP_CONST, .resetvalue = 0 },
+    /* DBGDTRTX_EL0/DBGDTRRX_EL0 depend on direction */
+    { .name = "DBGDTR_EL0", .state = ARM_CP_STATE_BOTH, .cp = 14,
+      .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 5, .opc2 = 0,
+      .access = PL0_RW, .accessfn = access_tdcc,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
     /*
      * OSECCR_EL1 provides a mechanism for an operating system
      * to access the contents of EDECCR. EDECCR is not implemented though,
-- 
2.39.2
