Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4032612wru;
        Tue, 14 Aug 2018 05:46:25 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPz5aJelDy1+fG4wZgIeZF/TPuya+/gIWdlWi50afdbKyg9s2F7OsNfp4OMhxQT0dzsIW1ro
X-Received: by 2002:ac8:1afc:: with SMTP id h57-v6mr19749599qtk.175.1534250784994;
        Tue, 14 Aug 2018 05:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534250784; cv=none;
        d=google.com; s=arc-20160816;
        b=RgyOhfzRGiEqAc4Sb7vBk0P/SFTVamNmJHTuTecfNEssukExbgJAf+J5EC4Yzm4kes
         DaBj9Tsfa9vOSfJtwIqmAgyZDTFWLvEH/Omum5PE6ASAR9X3Pnt30pqIkwxZq+t7+ZYw
         lt1Ep3GbfOzxqQRH2Sc79XRuIOKoz7NPkCy85IPI07ZyaFER5tIcoQZZMgyby5LJ4P2K
         Ff6XVb2luAJzAyDhz9BPB53i/rLQEu+sFfEM1ZuN5AxAQO+C/c1NX10WM8xBuTVI+RZS
         zvmxomhbEY3jbM46sSPCdHRigL9UuHY3AYXJF0amoAaCHNrk+07weulZiuw6iEp/hxyA
         jwZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=WrmDmfKPM75ARXoFpB2h0JErJMoheUZlZdYBz61fFQ8=;
        b=AfOIJphwWwUe49CPzXa/UbVj/XewzVkgZYz/ERJCHjzPLakkB8y3FT8q7NsSc75AfS
         y4kktyVtfKarbMsCuFqthQEvRctbA42JdVc/G8bCjD80Md1dOb9rLZseVJhNKybWVHK9
         rDeXw6Yw4owG+vwwM1Ajpn5bT4TPkAyg62c2dCnqIiZgjwkYQ/uk8Gfd49FBgZUCiIRK
         XVvTTllYZd0Bmh1xZaNM+o3s/rmefteE/HT2JOZhmyCUCnz13rthW7T76GRDnjHE2bsv
         VUSJu8Ufe2bRrgNafOmPwh7qefjNRr+FoG7h42Eh3cx6aA2pMwCqAng3QIZX8rUYk4ed
         eDyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u58-v6si7739854qtb.195.2018.08.14.05.46.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 05:46:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44178 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpYiO-0008FT-GD
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 08:46:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpYfJ-0005Xd-M4
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 08:43:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpYfI-0002M9-OE
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 08:43:13 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44346)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fpYfI-0002IZ-GR; Tue, 14 Aug 2018 08:43:12 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fpYf6-0006nZ-64; Tue, 14 Aug 2018 13:43:00 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 14 Aug 2018 13:42:45 +0100
Message-Id: <20180814124254.5229-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180814124254.5229-1-peter.maydell@linaro.org>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 01/10] target/arm: Correct typo in HAMAIR1 regdef
 name
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
X-TUID: CY4Pbe//wi/K

We implement the HAMAIR1 register as RAZ/WI; we had a typo in the
regdef, though, and were incorrectly naming it HMAIR1 (which is
a different register which we also implement as RAZ/WI).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8b07bf214ec..2c5e02c0b1a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3773,7 +3773,7 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 4, .crn = 10, .crm = 3, .opc2 = 0,
       .access = PL2_RW, .type = ARM_CP_CONST,
       .resetvalue = 0 },
-    { .name = "HMAIR1", .state = ARM_CP_STATE_AA32,
+    { .name = "HAMAIR1", .state = ARM_CP_STATE_AA32,
       .opc1 = 4, .crn = 10, .crm = 3, .opc2 = 1,
       .access = PL2_RW, .type = ARM_CP_CONST,
       .resetvalue = 0 },
@@ -3925,7 +3925,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .access = PL2_RW, .type = ARM_CP_CONST,
       .resetvalue = 0 },
     /* HAMAIR1 is mapped to AMAIR_EL2[63:32] */
-    { .name = "HMAIR1", .state = ARM_CP_STATE_AA32,
+    { .name = "HAMAIR1", .state = ARM_CP_STATE_AA32,
       .opc1 = 4, .crn = 10, .crm = 3, .opc2 = 1,
       .access = PL2_RW, .type = ARM_CP_CONST,
       .resetvalue = 0 },
-- 
2.18.0

