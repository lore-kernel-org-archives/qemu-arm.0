Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp816426wrd;
        Mon, 20 Aug 2018 08:31:20 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYI7eGmwLpzMDoy/Ck253UrQjzsWhet6pZ4aIZHUk7wf371l3oiwHEUgrOVrnBz2cefle2H
X-Received: by 2002:ac8:2e2b:: with SMTP id r40-v6mr12960852qta.12.1534779080011;
        Mon, 20 Aug 2018 08:31:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534779080; cv=none;
        d=google.com; s=arc-20160816;
        b=rkYSGFN5QK8ZhopbD1moCOW6dUXwpV1QTCEuxmufXgYaHIrsC0BIYhVgu5TpOJRLw+
         PaHote2pdmfA+dt6HnyCMi8b+0kQyZ/JxrEzDdO8QBXdmS+TnGjV9pWFLxXAbj2Hhy9w
         Bv7kEreQkJz6yFH6PVm58lVdVhnh0r1O5wZROgpdzD/fOJYVnuGorbkG9kOswg8SxXJA
         ZVrKOK2JCOcrl7T5+hCi+a6upKfFIBkTDWQDkR4WboyCcU4MelXH/YyIAy0THpsrf9on
         hlfM7oHRRZ+Vx2/Ylxm1cpRlw1giG9B5Eu0TE4xE2oqPV9kg4vLY3SE4Ki9ubCyOp4CV
         gdaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=5aWY2QzfnouwUFPX2On+yVXEoskuSusP6on6y5QeOh8=;
        b=R57KvXkORkbg5EetkTqDF913+YSjrbx3qzUfTehWDJ8wS28dpPcVlYhhHjDWTdoexR
         37yzoEqSP+OxQJxX9cfmPk/HIO5ct34jjABYZS7MZACVSBo62BdFPCMeavV6rwo/8icW
         ReAQOdLxnLIPtCYOkCGgnV8Ouv77avhozlUgRAzeA/1DewAqltQyr6TX7mfb0eOYp2VF
         m+wn7LAMKuRCw/qvgMCVSUkup93YlyX5DJHc2sW67KzB5kYYWbzWgVqquu+WIlnzxYig
         5fLJbr21SnWFaxfnnzwlO/aoNBfQPDOLKQd4ucwYaUa4QbV6UL5Lg3WFwBIlyFGxhDoq
         Hj2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f71-v6si2131970qka.128.2018.08.20.08.31.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 08:31:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47750 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frm9H-00060t-E1
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 11:31:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frm8W-0005at-0o
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 11:30:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frm8V-0004Bk-6a
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 11:30:31 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44712)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frm8U-00044t-Vj; Mon, 20 Aug 2018 11:30:31 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frm8N-0003Xq-PG; Mon, 20 Aug 2018 16:30:23 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 16:30:15 +0100
Message-Id: <20180820153020.21478-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820153020.21478-1-peter.maydell@linaro.org>
References: <20180820153020.21478-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 1/6] target/arm: Implement RAZ/WI HACTLR2
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JcsdARDsrQNs

The v8 AArch32 HACTLR2 register maps to bits [63:32] of ACTLR_EL2.
We implement ACTLR_EL2 as RAZ/WI, so make HACTLR2 also RAZ/WI.
(We put the regdef next to ACTLR_EL2 as a reminder in case we
ever make ACTLR_EL2 something other than RAZ/WI).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
changes from v1: only define in ARMv8, not v7
---
 target/arm/helper.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c9bce1efcb2..22547d8e739 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5459,6 +5459,16 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             REGINFO_SENTINEL
         };
         define_arm_cp_regs(cpu, auxcr_reginfo);
+        if (arm_feature(env, ARM_FEATURE_V8)) {
+            /* HACTLR2 maps to ACTLR_EL2[63:32] and is not in ARMv7 */
+            ARMCPRegInfo hactlr2_reginfo = {
+                .name = "HACTLR2", .state = ARM_CP_STATE_AA32,
+                .cp = 15, .opc1 = 4, .crn = 1, .crm = 0, .opc2 = 3,
+                .access = PL2_RW, .type = ARM_CP_CONST,
+                .resetvalue = 0
+            };
+            define_one_arm_cp_reg(cpu, &hactlr2_reginfo);
+        }
     }
 
     if (arm_feature(env, ARM_FEATURE_CBAR)) {
-- 
2.18.0

