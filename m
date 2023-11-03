Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id p12-20020adfe60c000000b0032d886039easm2608269wrm.14.2023.11.03.12.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 12:59:57 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1004665743;
	Fri,  3 Nov 2023 19:59:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Song Gao <gaosong@loongson.cn>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Brian Cain <bcain@quicinc.com>,
	qemu-ppc@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-riscv@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Cleber Rosa <crosa@redhat.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Nicholas Piggin <npiggin@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Bin Meng <bin.meng@windriver.com>,
	Beraldo Leal <bleal@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH 04/29] target/arm: hide all versions of DBGD[RS]AR from gdbstub
Date: Fri,  3 Nov 2023 19:59:31 +0000
Message-Id: <20231103195956.1998255-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103195956.1998255-1-alex.bennee@linaro.org>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ClGYvIgiD/os

This avoids two duplicates being presented to gdbstub. As the
registers are RAZ anyway it is unlikely their value would be of use to
someone using gdbstub anyway.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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
