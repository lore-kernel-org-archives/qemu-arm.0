Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4033198wru;
        Tue, 14 Aug 2018 05:47:07 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxvxBFMbRhWHDGp5dYL8clPaKEFnA8zLjxHQQZeKDuf2rOpt3vKqVpj3KSo9XAGALylQixQ
X-Received: by 2002:a0c:81c8:: with SMTP id 8-v6mr18209295qve.53.1534250826871;
        Tue, 14 Aug 2018 05:47:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534250826; cv=none;
        d=google.com; s=arc-20160816;
        b=lHzoNjSy4VvL9L9Rb2O2JEQ9i4pQmLvYzTmMOhHVYUy6JHd+KFAF3Qq+/XpWYSlxRo
         /xYEq6LGb9HHJCWHdN9Fz/9t5Q6EzlEo5ZvX+ZrlvMNjUCp3Bc2FNbM3ICWQSCzlJcDg
         9hXBtM7zPi70NKjHT9Np5VcklPHclwVtQ1yO2F1udOrXSEcmd2+TZKKBH35iU/2HD7W9
         /veIi+dsz/G8aMejvb6bVMbG9I9pXJdxq/XmQMVAiLKQIAbBsKPTM+mLQs5DctMN9Gh0
         iEqYpEsN8bJgrSX9RZnZZNiqm7jz62uXP2nwiNZnj3ySyUiynLwN3gPKnN3MgqJi1FAP
         1OeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Azkn5eXy41NiO7+5yVHVOlgsS+60C6Z2xTtLFfPoiio=;
        b=xyqzp4b8v1VVgHIAueGzbBaJbEzeQKRuAUDEx7ZKZ5WOkuv70GscLTGL5vce72kxWO
         ea6YnmTgs6m6DuHzTqWd6607mkpae5udPzakb1lfJDKAJRRyzqwNAu+LzIewsDIh/lEW
         3nkzlUtg48Kf+y2Cct9SJjd4MNzYbsEPKoepIHyeZQZWRkCl6fcRdU3gdLka4ZFC3dFg
         pKVhy0F1G5wJ+tEQEuQtcvmNRxA6pWz1S3TWXkIGUkA6VMvytWQ9MmeOh++c28WAgZyL
         U75dVvsHWIev3aFbhm0Z7EdtfDGps6ldNVvhRqATy7cd7jUz8WT/IORmMC4XCdP0cfpz
         AUnw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v9-v6si7050305qva.234.2018.08.14.05.47.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 05:47:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44182 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpYj4-000064-Ap
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 08:47:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpYfL-0005ZR-1M
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 08:43:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpYfK-0002Ot-2g
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 08:43:14 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44334)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fpYfH-0002F2-IW; Tue, 14 Aug 2018 08:43:11 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fpYf8-0006oW-4w; Tue, 14 Aug 2018 13:43:02 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 14 Aug 2018 13:42:47 +0100
Message-Id: <20180814124254.5229-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180814124254.5229-1-peter.maydell@linaro.org>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 03/10] target/arm: Implement RAZ/WI HACTLR2
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgari@xilinx.com, Luc Michel <luc.michel@greensocs.com>,
	patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uGVglnoCHb2+

The AArch32 HACTLR2 register maps to bits [63:32] of ACTLR_EL2.
We implement ACTLR_EL2 as RAZ/WI, so make HACTLR2 also RAZ/WI.
(We put the regdef next to ACTLR_EL2 as a reminder in case we
ever make ACTLR_EL2 something other than RAZ/WI).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 466c8ae492e..14fd78f587a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5436,6 +5436,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 0, .opc2 = 1,
               .access = PL2_RW, .type = ARM_CP_CONST,
               .resetvalue = 0 },
+            /* HACTLR2 maps to ACTLR_EL2[63:32] */
+            { .name = "HACTLR2", .state = ARM_CP_STATE_AA32,
+              .cp = 15, .opc1 = 4, .crn = 1, .crm = 0, .opc2 = 3,
+              .access = PL2_RW, .type = ARM_CP_CONST,
+              .resetvalue = 0 },
             { .name = "ACTLR_EL3", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 0, .opc2 = 1,
               .access = PL3_RW, .type = ARM_CP_CONST,
-- 
2.18.0

