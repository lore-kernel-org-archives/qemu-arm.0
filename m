Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id k25-20020a05600c1c9900b004067e905f44sm13340971wms.9.2023.11.06.10.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 10:51:13 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D242B6573E;
	Mon,  6 Nov 2023 18:51:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 04/22] target/arm: hide all versions of DBGD[RS]AR from gdbstub
Date: Mon,  6 Nov 2023 18:50:54 +0000
Message-Id: <20231106185112.2755262-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231106185112.2755262-1-alex.bennee@linaro.org>
References: <20231106185112.2755262-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: u5yjPXgFR3Un

This avoids two duplicates being presented to gdbstub. As the
registers are RAZ anyway it is unlikely their value would be of use to
someone using gdbstub anyway.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231103195956.1998255-5-alex.bennee@linaro.org>
---
 target/arm/debug_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 79a3659c0c..dc783adba5 100644
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
@@ -1065,9 +1065,9 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
 static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
     /* 64 bit access versions of the (dummy) debug registers */
     { .name = "DBGDRAR", .cp = 14, .crm = 1, .opc1 = 0,
-      .access = PL0_R, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
+      .access = PL0_R, .type = ARM_CP_CONST | ARM_CP_64BIT | ARM_CP_NO_GDB, .resetvalue = 0 },
     { .name = "DBGDSAR", .cp = 14, .crm = 2, .opc1 = 0,
-      .access = PL0_R, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
+      .access = PL0_R, .type = ARM_CP_CONST | ARM_CP_64BIT | ARM_CP_NO_GDB, .resetvalue = 0 },
 };
 
 static void dbgwvr_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.39.2
