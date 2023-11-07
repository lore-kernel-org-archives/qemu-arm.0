Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id h6-20020adfe986000000b003200c918c81sm2457299wrm.112.2023.11.07.06.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 06:23:55 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id F344365759;
	Tue,  7 Nov 2023 14:23:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 04/23] target/arm: hide all versions of DBGD[RS]AR from gdbstub
Date: Tue,  7 Nov 2023 14:23:35 +0000
Message-Id: <20231107142354.3151266-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231107142354.3151266-1-alex.bennee@linaro.org>
References: <20231107142354.3151266-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wxC4AvFhi0il

This avoids two duplicates being presented to gdbstub. As the
registers are RAZ anyway it is unlikely their value would be of use to
someone using gdbstub anyway.

Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231106185112.2755262-5-alex.bennee@linaro.org>

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 79a3659c0c..cbfba532f5 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -937,14 +937,14 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
      */
     { .name = "DBGDRAR", .cp = 14, .crn = 1, .crm = 0, .opc1 = 0, .opc2 = 0,
       .access = PL0_R, .accessfn = access_tdra,
-      .type = ARM_CP_CONST, .resetvalue = 0 },
+      .type = ARM_CP_CONST | ARM_CP_NO_GDB, .resetvalue = 0 },
     { .name = "MDRAR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 0,
       .access = PL1_R, .accessfn = access_tdra,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "DBGDSAR", .cp = 14, .crn = 2, .crm = 0, .opc1 = 0, .opc2 = 0,
       .access = PL0_R, .accessfn = access_tdra,
-      .type = ARM_CP_CONST, .resetvalue = 0 },
+      .type = ARM_CP_CONST | ARM_CP_NO_GDB, .resetvalue = 0 },
     /* Monitor debug system control register; the 32-bit alias is DBGDSCRext. */
     { .name = "MDSCR_EL1", .state = ARM_CP_STATE_BOTH,
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 2,
@@ -1065,9 +1065,11 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
 static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
     /* 64 bit access versions of the (dummy) debug registers */
     { .name = "DBGDRAR", .cp = 14, .crm = 1, .opc1 = 0,
-      .access = PL0_R, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
+      .access = PL0_R, .type = ARM_CP_CONST | ARM_CP_64BIT | ARM_CP_NO_GDB,
+      .resetvalue = 0 },
     { .name = "DBGDSAR", .cp = 14, .crm = 2, .opc1 = 0,
-      .access = PL0_R, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
+      .access = PL0_R, .type = ARM_CP_CONST | ARM_CP_64BIT | ARM_CP_NO_GDB,
+      .resetvalue = 0 },
 };
 
 static void dbgwvr_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.39.2
