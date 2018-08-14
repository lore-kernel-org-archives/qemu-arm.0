Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4029896wru;
        Tue, 14 Aug 2018 05:43:24 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwaC1xx24QUOUKK6WgdtDoVvtmWzzybpviLVSZRZIK3CDnhUuSJidpI3DUclblvZLI4hBoD
X-Received: by 2002:a37:3447:: with SMTP id b68-v6mr19405815qka.171.1534250604601;
        Tue, 14 Aug 2018 05:43:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534250604; cv=none;
        d=google.com; s=arc-20160816;
        b=hxAWGkT2TuFZ8tbdolCc7pPl31sljonb+xDYJoa2ZIdRWS7gvDVtJRBKVrWgorGvlK
         SwvSJGmscCZ7MMZ+w7+5pyn/LLS+xaWHQh8RKhAnmHvTDsVvPrdfokHMDFuPd+MNo4XE
         BB6lJkMOsnNe7L9PkfhTxm6kddDggLR0ALGjGw2iMwniQszDqft9xAE2D5bMau+XJo/t
         oevXkNcr2Ft86vBoBtXBGvZepxZwi4nF4Omkn4bMbhrJCjcc4Mi0piqAjwvFp9d8zZ+Z
         z8M/nZQs2kF36wLBy0ICLP1PCzGU/JF+ZcunpNEs4EJTwWY8zPJ1PQjfCFYtB7NKTnrM
         wVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=vbissEZ+heVMTPzGQaRF1s4znKUPWVhKAMIA1/YnTJ8=;
        b=KUQjMn4TXebAFLrOnzfEBmq83Y79ns1M66zdHNw0K2YrUWXgTZPYvTQ4pzfqKL9ZcV
         Fi2fN7uzRp76Qpe3YQWN4CMDQbkSwGTWheflfxCju1ulDp5iqG39IOw35Fnwy7AhXQ/g
         8uvOm0AGnf+F1otE2nteI2rRfDQ1jjpyHMu/0YrzjV9etg8NHBPSKVGSwDcQkYPcSr7R
         HTGRLO1AuXw1+tLHgIFlc3iVRj1BgkvjpIsO/1GNWMfEcY8vuBoURhNFc1729xU+V1Wz
         OKjnkCYibMWNR/ZuTnMNhZx01L+Up3I9xBDZSBAFyaoC9AU+ZVRJLT10yzmzfZ97icvK
         tyoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v52-v6si4700459qvj.5.2018.08.14.05.43.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 05:43:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44153 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpYfU-0005W0-2e
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 08:43:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpYfG-0005Uc-Gy
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 08:43:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpYfF-0002GP-Pc
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 08:43:10 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44302)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fpYfF-0001z2-Gx; Tue, 14 Aug 2018 08:43:09 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fpYfD-0006qa-Jg; Tue, 14 Aug 2018 13:43:07 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 14 Aug 2018 13:42:51 +0100
Message-Id: <20180814124254.5229-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180814124254.5229-1-peter.maydell@linaro.org>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 07/10] target/arm: Implement ESR_EL2/HSR for
 AArch32 and no-EL2
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
X-TUID: QrIgYJ3YBftf

The AArch32 HSR is the equivalent of AArch64 ESR_EL2;
we can implement it by marking our existing ESR_EL2 regdef
as STATE_BOTH. It also needs to be "RES0 from EL3 if
EL2 not implemented", so add the missing stanza to
el3_no_el2_cp_reginfo.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d6e98e9d606..80855302089 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3763,6 +3763,10 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
       .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 4,
       .access = PL2_RW,
       .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "ESR_EL2", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 0,
+      .access = PL2_RW,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "CPTR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 2,
       .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
@@ -3926,7 +3930,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 0, .opc2 = 1,
       .access = PL2_RW,
       .fieldoffset = offsetof(CPUARMState, elr_el[2]) },
-    { .name = "ESR_EL2", .state = ARM_CP_STATE_AA64,
+    { .name = "ESR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 0,
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.esr_el[2]) },
     { .name = "FAR_EL2", .state = ARM_CP_STATE_BOTH,
-- 
2.18.0

