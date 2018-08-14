Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4030348wru;
        Tue, 14 Aug 2018 05:43:54 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyNesF0WmIUx/hqA+0fXT8C0/+j6T+F04TfqFhI1ldn7RRjqgCkkdEfcKaybctvn4F0Bmn9
X-Received: by 2002:a37:b001:: with SMTP id z1-v6mr19662838qke.156.1534250634094;
        Tue, 14 Aug 2018 05:43:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534250634; cv=none;
        d=google.com; s=arc-20160816;
        b=SgqwfiOBQWFgsKe8WkgKMr2cFB9JJtLBot02PYQ19oUllyUGTwlLzmhRU7nRRGjhIs
         v4gK35GXq2OyQPVdUnGJl53jSA4zQsQsKN4H+gc76TUGg7P6eYJS3Bm9duEQz5qixG6L
         xw6PfbdfxWDiZVooA+YnrV4YA8zObGnF9iJCviA62q067UMXz37vtA7bnthl+xgdazPK
         swbTN4nXLLmzHJpTyEXGfsqv7jsrnN8Dt5AZVKW7GguDqLH1JiINaXAh7oZwedZm6/EM
         zxoOFxMPlqAKZZvUXSIAxubXEiY4RB0xDGA77CTdWS7e6R1KuIM8MbqVAwAexsFY/mJ4
         aqGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=8MwzJ9f/vxLE1fxiIaPq2ABIdXNCoD1QTj1Ix0bVFW4=;
        b=wuvuK4j0eAguSzKTjypLUIo7e/jXme3aopNfRF67QoBwsgRaWNzBIoNK1WlzJgPr+u
         +PZbkvnK+Eq1/FMBQewNOwlrCQSekoURQ/V63zgHUYSffWJwaIToA4slTAKJS15u3L09
         UQzmB7iwQHdP992eJmCmSTatiGYEQkBJyOAMH+FApBb2O6WJNP9C00+f0rppW92Pvvi9
         iA0206GNVLp0WvX/S7NpK+sVIgGM502TPSZbOQ9DOIn+3WBTwCwWwgUEQhwYospyVXIT
         Te8K+wxOConEtvUQFp8KNgka7ChlADUVbMp6cXH8SANdmgkbu55G6Cer4JBDAceJB4K2
         Xypw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g2-v6si2616257qtj.99.2018.08.14.05.43.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 05:43:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44160 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpYfx-00062W-Gw
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 08:43:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpYfH-0005VM-Th
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 08:43:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpYfG-0002IB-Ow
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 08:43:11 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44302)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fpYfG-0001z2-GB; Tue, 14 Aug 2018 08:43:10 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fpYfB-0006pY-Na; Tue, 14 Aug 2018 13:43:05 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 14 Aug 2018 13:42:49 +0100
Message-Id: <20180814124254.5229-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180814124254.5229-1-peter.maydell@linaro.org>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 05/10] target/arm: Implement AArch32 HCR and HCR2
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
X-TUID: BRueTp1crRBc

The AArch32 HCR and HCR2 registers alias HCR_EL2
bits [31:0] and [63:32]; implement them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 39 +++++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b6412fe9d1f..9701e413859 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3754,11 +3754,15 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 0, .opc2 = 0,
       .access = PL2_RW,
       .readfn = arm_cp_read_zero, .writefn = arm_cp_write_ignore },
-    { .name = "HCR_EL2", .state = ARM_CP_STATE_AA64,
+    { .name = "HCR_EL2", .state = ARM_CP_STATE_BOTH,
       .type = ARM_CP_NO_RAW,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL2_RW,
-      .readfn = arm_cp_read_zero, .writefn = arm_cp_write_ignore },
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "HCR2", .state = ARM_CP_STATE_AA32,
+      .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 4,
+      .access = PL2_RW,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "CPTR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 2,
       .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
@@ -3872,10 +3876,26 @@ static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
      * HCR_PTW forbids certain page-table setups
      * HCR_DC Disables stage1 and enables stage2 translation
      */
-    if ((raw_read(env, ri) ^ value) & (HCR_VM | HCR_PTW | HCR_DC)) {
+    if ((env->cp15.hcr_el2 ^ value) & (HCR_VM | HCR_PTW | HCR_DC)) {
         tlb_flush(CPU(cpu));
     }
-    raw_write(env, ri, value);
+    env->cp15.hcr_el2 = value;
+}
+
+static void hcr_writehigh(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    /* Handle HCR2 write, i.e. write to high half of HCR_EL2 */
+    value = deposit64(env->cp15.hcr_el2, 32, 32, value);
+    hcr_write(env, NULL, value);
+}
+
+static void hcr_writelow(CPUARMState *env, const ARMCPRegInfo *ri,
+                         uint64_t value)
+{
+    /* Handle HCR write, i.e. write to low half of HCR_EL2 */
+    value = deposit64(env->cp15.hcr_el2, 0, 32, value);
+    hcr_write(env, NULL, value);
 }
 
 static const ARMCPRegInfo el2_cp_reginfo[] = {
@@ -3883,6 +3903,17 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
       .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.hcr_el2),
       .writefn = hcr_write },
+    { .name = "HCR", .state = ARM_CP_STATE_AA32,
+      .type = ARM_CP_ALIAS,
+      .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 0,
+      .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.hcr_el2),
+      .writefn = hcr_writelow },
+    { .name = "HCR2", .state = ARM_CP_STATE_AA32,
+      .type = ARM_CP_ALIAS,
+      .cp = 15, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 4,
+      .access = PL2_RW,
+      .fieldoffset = offsetofhigh32(CPUARMState, cp15.hcr_el2),
+      .writefn = hcr_writehigh },
     { .name = "ELR_EL2", .state = ARM_CP_STATE_AA64,
       .type = ARM_CP_ALIAS,
       .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 0, .opc2 = 1,
-- 
2.18.0

