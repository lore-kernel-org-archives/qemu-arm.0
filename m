Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4030582wru;
        Tue, 14 Aug 2018 05:44:09 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxVk9FrfPVV46il874Nrq6HcMN+iS8WwQ5O8Fiv7qAETV/XJT+g89U70u1hbf3U5NV5Pudi
X-Received: by 2002:a0c:ae71:: with SMTP id z46-v6mr18755636qvc.108.1534250649409;
        Tue, 14 Aug 2018 05:44:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534250649; cv=none;
        d=google.com; s=arc-20160816;
        b=ohKjWTL1mmFVQI1t5x865O/cuIdUQStsMW4kZeTbk3MEWGZgQcniK4bkP3bDy1loSa
         T/U7Agbcvrzerjt4IiNZgx/cV63ztg8UgI8HXjrxcHhwTjzTqtlpDIRnMwlAVDAB29WJ
         ve8Lvh+4UNQXIgotihWioWQgcUVZwRFIhDGsD0BajCt0Qhb11irTCqwPqHBPMa/QUiil
         0JCqQIgV0TTLU8buShH5+mwLES94Ol5PTEbu/dvjzJosCoUpebRYTrOheKr44WKXRDJv
         Qupap7YevNjCtmqJK2h5PFHf0Tuck0ZDcVYDq8MAdK4QBouup529+sI3Av1EhAqdl4kg
         MeEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=YW6XVXxQcUaASyPFJ9Tyi1emgbEmVvzRU91WNAzj894=;
        b=K50vXUKmN4pClMX1Lg/5pyY73JZldKhJVfpmOj//5aLh00L0K89SJutU0hqzuR5jWH
         K4hRr5OZ3GOmtjK5hB1G0UFlcBYLdrjjzuABwobkmBQD8EHAo/M8S61JeEkevDsEgnj6
         a7e4mvwOfZKo40Cy1vL5k1U6dA6R6URbNdLiSGBKoWmcrXb16iFJ3lByfJPLdPl3+bd/
         Vjp9B4b8ruJRtTkqFqMNGcBa9GPMswBZ6FiQhxbYoJJu753aFxA6cWqAQuE2u40rfkpN
         sCOjPebP17eBmZzVaEfRTCb1fJKAW27vuiDDFqXpVGL1oLToYoQ9MvPkPvb3EqhWOK1K
         4jWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s80-v6si2501243qkl.219.2018.08.14.05.44.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 05:44:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44162 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpYgC-0006ES-MA
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 08:44:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpYfJ-0005Xs-Sq
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 08:43:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpYfI-0002M6-P0
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 08:43:13 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44302)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fpYfI-0001z2-FG; Tue, 14 Aug 2018 08:43:12 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fpYf7-0006nt-5Q; Tue, 14 Aug 2018 13:43:01 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 14 Aug 2018 13:42:46 +0100
Message-Id: <20180814124254.5229-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180814124254.5229-1-peter.maydell@linaro.org>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 02/10] target/arm: Add missing .cp = 15 to HMAIR1
 and HAMAIR1 regdefs
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
X-TUID: dRCxnwLwpT3A

ARMCPRegInfo structs will not default to .cp = 15 if they
are ARM_CP_STATE_BOTH, but not if they are ARM_CP_STATE_AA32
(because a coprocessor number of 0 is valid for AArch32).
We forgot to explicitly set .cp = 15 for the HMAIR1 and
HAMAIR1 regdefs, which meant they would UNDEF when the guest
tried to access them under cp15.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
A quick grep suggests these are the only ones we got wrong.
---
 target/arm/helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2c5e02c0b1a..466c8ae492e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3767,14 +3767,14 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
       .access = PL2_RW, .type = ARM_CP_CONST,
       .resetvalue = 0 },
     { .name = "HMAIR1", .state = ARM_CP_STATE_AA32,
-      .opc1 = 4, .crn = 10, .crm = 2, .opc2 = 1,
+      .cp = 15, .opc1 = 4, .crn = 10, .crm = 2, .opc2 = 1,
       .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "AMAIR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 10, .crm = 3, .opc2 = 0,
       .access = PL2_RW, .type = ARM_CP_CONST,
       .resetvalue = 0 },
     { .name = "HAMAIR1", .state = ARM_CP_STATE_AA32,
-      .opc1 = 4, .crn = 10, .crm = 3, .opc2 = 1,
+      .cp = 15, .opc1 = 4, .crn = 10, .crm = 3, .opc2 = 1,
       .access = PL2_RW, .type = ARM_CP_CONST,
       .resetvalue = 0 },
     { .name = "AFSR0_EL2", .state = ARM_CP_STATE_BOTH,
@@ -3917,7 +3917,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.mair_el[2]),
       .resetvalue = 0 },
     { .name = "HMAIR1", .state = ARM_CP_STATE_AA32,
-      .opc1 = 4, .crn = 10, .crm = 2, .opc2 = 1,
+      .cp = 15, .opc1 = 4, .crn = 10, .crm = 2, .opc2 = 1,
       .access = PL2_RW, .type = ARM_CP_ALIAS,
       .fieldoffset = offsetofhigh32(CPUARMState, cp15.mair_el[2]) },
     { .name = "AMAIR_EL2", .state = ARM_CP_STATE_BOTH,
@@ -3926,7 +3926,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .resetvalue = 0 },
     /* HAMAIR1 is mapped to AMAIR_EL2[63:32] */
     { .name = "HAMAIR1", .state = ARM_CP_STATE_AA32,
-      .opc1 = 4, .crn = 10, .crm = 3, .opc2 = 1,
+      .cp = 15, .opc1 = 4, .crn = 10, .crm = 3, .opc2 = 1,
       .access = PL2_RW, .type = ARM_CP_CONST,
       .resetvalue = 0 },
     { .name = "AFSR0_EL2", .state = ARM_CP_STATE_BOTH,
-- 
2.18.0

