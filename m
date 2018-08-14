Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4030150wru;
        Tue, 14 Aug 2018 05:43:40 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwRk1ALbvdH7gP+d4F1D18yQByRiqRy5Hoc+bkUAjEJpKfJmBCqwQUuUyFiDOjIekI8jqE3
X-Received: by 2002:a0c:d112:: with SMTP id a18-v6mr19005688qvh.200.1534250619948;
        Tue, 14 Aug 2018 05:43:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534250619; cv=none;
        d=google.com; s=arc-20160816;
        b=VEqw8o8yn+RxhjE0J14pglWqKPrx1LrPWmQZyK+5Qss2ch4JEoTbHPej4AgSz6vSin
         QlnclL4ZkDHmjIdsa83UGt6QZAv3VT5TlQ0tCEQFjsZC0VKzYVbTQa5nObCzWknEolXB
         582IlAdtW7GSQjKcuc2jZSuozJ5iEmwVy65AU9LRIDbjm1n+FaGD08SglvIZ4XJs8eZ/
         RQvmXc1oTaNUxla9c7Ie0I8Lqw/DFzh8w+qZTq3H1ZDaRv3Fy5g8CSxMjFccD1tnsziX
         2H/BIaAGVpUFKSY0ZKl3GOxEwVB9gqpv4PIlwUTIVEtZ+TZyfsrwHTaM5AcksQTedwk+
         scJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=xYOAoL4/cJz9KXqC/kjh7PkfgjwVFAm7tQbTUUbZPLc=;
        b=LFec7qtApyJU6BXk1iPUtQ3emra5W3XxdyTLZPRAq+wDfdJTpCiQPsK/PrgPsaPMKz
         Z23ZA7fct8xAEB0XgtRCa/SGahExEnmHdKmrmKwhqWbwje9hLSdxcmsAt00IGYxVG2Sj
         RcQRoIiPLgjO4Ee3tuxjuvsrKS6f6/p0XcwGGlFbUV7bDdQ6Pgy2icMQW8JUt7xYpBV8
         YvcILHr17CLwTePlCz14XwCZ3RhutYmoDSrsdFG0hmUgTJXrL9LpfCwP/kWrL5VPMARt
         g4e9C+8/FqH/bZSwg5S30jBxSMRxXr1jxZSCB25cSk4Adcr+4G7I7J7Ngzoe4KZjL9/g
         aAiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s63-v6si221752qkc.404.2018.08.14.05.43.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 05:43:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpYfj-0005mn-EE
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 08:43:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpYfH-0005V9-LM
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 08:43:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpYfG-0002IT-Rm
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 08:43:11 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44334)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fpYfG-0002F2-JJ; Tue, 14 Aug 2018 08:43:10 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fpYfA-0006pH-Oo; Tue, 14 Aug 2018 13:43:04 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 14 Aug 2018 13:42:48 +0100
Message-Id: <20180814124254.5229-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180814124254.5229-1-peter.maydell@linaro.org>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 04/10] target/arm: Implement AArch32 HVBAR
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
Cc: edgari@xilinx.com, Luc Michel <luc.michel@greensocs.com>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0ebRtVecFf0Q

Implement the AArch32 HVBAR register; we can do this just by
making the existing VBAR_EL2 regdefs be STATE_BOTH.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 14fd78f587a..b6412fe9d1f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3750,7 +3750,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
 
 /* Used to describe the behaviour of EL2 regs when EL2 does not exist.  */
 static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
-    { .name = "VBAR_EL2", .state = ARM_CP_STATE_AA64,
+    { .name = "VBAR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 0, .opc2 = 0,
       .access = PL2_RW,
       .readfn = arm_cp_read_zero, .writefn = arm_cp_write_ignore },
@@ -3899,7 +3899,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 0, .opc2 = 0,
       .access = PL2_RW,
       .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_HYP]) },
-    { .name = "VBAR_EL2", .state = ARM_CP_STATE_AA64,
+    { .name = "VBAR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 0, .opc2 = 0,
       .access = PL2_RW, .writefn = vbar_write,
       .fieldoffset = offsetof(CPUARMState, cp15.vbar_el[2]),
-- 
2.18.0

