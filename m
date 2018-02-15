Received: by 10.28.71.27 with SMTP id u27csp2976903wma;
        Thu, 15 Feb 2018 10:24:33 -0800 (PST)
X-Google-Smtp-Source: AH8x2254/V2uATe30Or4MnBu8LpZe0I6lTNfHqK4tov28QBRRE/WznehXJRYBClF3rqhAyPlw6wT
X-Received: by 10.129.97.215 with SMTP id v206mr2809455ywb.153.1518719073270;
        Thu, 15 Feb 2018 10:24:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518719073; cv=none;
        d=google.com; s=arc-20160816;
        b=wPi3njJ+3OkjTP2Onl294o6sjhNMtsjAsJUoTH9yE8UVMCaL6oi4vjQMLt2q4b/R0T
         RE7yZ9SuVLNbJ6MzQhShTetSoxRXFXpsz7tHIm315JHkbmNjIiVnP2Fclt5v5PjLqqlo
         kDT0AtzcdXqTsfO03b1L5W2D6XJeyaCLBeVr/0RnLVGxZE75Uyhwtm/eN1P6MkdB6WaL
         aH9eY913ziLe64nwV6owl2NrVcE2YovTQdnPB00BM/qLNu+4oE+7NJXvVPeeBQ2UMGBQ
         JhMx/opry0k6AdbSD3ovEqJJa1nSJiky4+h7XZk61Q4tkGaZkidnjou2a3AL2GxufPI8
         MRww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=eir5DBExv0OUZXSSYw/qKIHNIbElUCDUaLX0Sfa8RQQ=;
        b=pOudvJeCD34+7ONLH7Z3DVMePDDL2jvcWTG2is+y8ESCeZfrPIrsSrfXxw3c5clqu0
         WJ2B2vz87AUu27c8OD+/tLHEOuofFamg/EzuIGuOkpw7r4qB4PO3CIMGyLXIp9BAoSF3
         KeUz26guD+gX/Qd00Fiaj3NEBpQcYqpzOw4u/9Hu500295UOH5qnV7VOBFuvOaHdVHpl
         kOyvQ692HlrI3vK7zruse5mP4KppxMDeYuWhp2sOr0SG6WAyz270ahJt/GUy7mX8XrAH
         s/AGUAnhE8Sk6tcshC6+DusXYB8dMQLSR46Jcez3NsuxWmBXFPKu4AYIwfoqCsNBFSnQ
         SVsw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g126si264964ywb.41.2018.02.15.10.24.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Feb 2018 10:24:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46628 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1emOCu-0005gV-Q6
	for alex.bennee@linaro.org; Thu, 15 Feb 2018 13:24:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33540)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1emOCn-0005g6-91
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 13:24:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1emOCm-0007sG-AN
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 13:24:25 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46430)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1emOCm-0007qt-0K; Thu, 15 Feb 2018 13:24:24 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1emOCj-000239-Sb; Thu, 15 Feb 2018 18:24:21 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 15 Feb 2018 18:24:21 +0000
Message-Id: <20180215182421.23788-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] target/arm: Fix register definitions for VMIDR
 and VMPIDR
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wrMX0W1L97hU

The register definitions for VMIDR and VMPIDR have separate
reginfo structs for the AArch32 and AArch64 registers. However
the 32-bit versions are wrong:
 * they use offsetof instead of offsetoflow32 to mark where
   the 32-bit value lives in the uint64_t CPU state field
 * they don't mark themselves as ARM_CP_ALIAS

In particular this means that if you try to use an Arm guest CPU
which enables EL2 on a big-endian host it will assert at reset:
 target/arm/cpu.c:114: cp_reg_check_reset: Assertion `oldvalue == newvalue' failed.

because the reset of the 32-bit register writes to the top
half of the uint64_t.

Correct the errors in the structures.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is necessary for 'make check' to pass on big endian
systems with the 'raspi3' board enabled, which is the
first board which has an EL2-enabled-by-default CPU.
---
 target/arm/helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e7586fcf6c..e27957df38 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5068,8 +5068,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "VPIDR", .state = ARM_CP_STATE_AA32,
               .cp = 15, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 0,
               .access = PL2_RW, .accessfn = access_el3_aa32ns,
-              .resetvalue = cpu->midr,
-              .fieldoffset = offsetof(CPUARMState, cp15.vpidr_el2) },
+              .resetvalue = cpu->midr, .type = ARM_CP_ALIAS,
+              .fieldoffset = offsetoflow32(CPUARMState, cp15.vpidr_el2) },
             { .name = "VPIDR_EL2", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 0,
               .access = PL2_RW, .resetvalue = cpu->midr,
@@ -5077,8 +5077,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "VMPIDR", .state = ARM_CP_STATE_AA32,
               .cp = 15, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 5,
               .access = PL2_RW, .accessfn = access_el3_aa32ns,
-              .resetvalue = vmpidr_def,
-              .fieldoffset = offsetof(CPUARMState, cp15.vmpidr_el2) },
+              .resetvalue = vmpidr_def, .type = ARM_CP_ALIAS,
+              .fieldoffset = offsetoflow32(CPUARMState, cp15.vmpidr_el2) },
             { .name = "VMPIDR_EL2", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 5,
               .access = PL2_RW,
-- 
2.16.1

