Received: by 10.28.91.67 with SMTP id p64csp1283874wmb;
        Fri, 16 Mar 2018 13:45:03 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtgW9cnKr9WCWJa1OPFirq7UL1RI4smgjGE+PJUUgbYXmImTuEs994fl1SAhlg2gEfURqh8
X-Received: by 10.55.1.194 with SMTP id u63mr3592433qkg.47.1521233103326;
        Fri, 16 Mar 2018 13:45:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521233103; cv=none;
        d=google.com; s=arc-20160816;
        b=lgBrFojr2YgFMfxNP2Im2TKfQEGkPnXEKKZaGr5knqaOeuaaSxUrVCUjPC5axryf0z
         BV1+Nv+iWxyS2jfk5Nc0/oQZ4kwMOID8XBkdxKgV16aoYbHQ6+diM9BpI0g1d0YDhzdp
         nB+4U7yfHGxMHcYM1mFUKkfj6Y53R6cOk8GRaAMsp9gnygSc+AvttCxoqhMOGoZWOOEK
         TslX5tmrm4EwlH2SC+Zw+P8WyOK7ADKPjvT8DoYDXzYWZPDwXdpxsFyuu/pYPdBoFXZ6
         Rs3Cpfw3+Oltw3FjWf1h1MJOSeYQSGv5JNt743x+/tqNLRAaDePtxQDrtI77UrPK3hri
         x9SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=VRldEIdZ7fLPfHqjzegosydE5GcY0/Qw60KEPHKNnak=;
        b=ioOwN3dg38TLDfL46z3gKo2Ih5AbmHKeLGFID5lGCdFq5dky8+Z18Gvvd2ocSbcj3m
         tOtukRU+XmRigvqzbbLS1IoG/LF8SLnpDqI9KwQsLPYlBFo5jMzYaQIqTCaT+4ifhjT2
         GePRgCoIBCWCO9LLa8x7VHnlvKVFFJWvKmJLO9NIw5vLW4E4nuyHdQpi/CiF03NmQ79G
         RHaBfGd4M++o0XtFvrAcLEUx4S257A0zruDd5YhFyP1BOmJQ94owtpmJnetYFYlOc6q0
         2jBFiTa6f+uTuw8FPe0qtED5+jdLsHsqhBXFJig+8VKVs+rnSAHpWLB9vBeFWylLONbe
         Jczw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=gQgJUgFp;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=GFB6/60+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i10si658621qkm.430.2018.03.16.13.45.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 13:45:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=gQgJUgFp;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=GFB6/60+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59522 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ewwDm-0008Ot-Q0
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 16:45:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1k-0006Ab-RU
	for qemu-devel@nongnu.org; Fri, 16 Mar 2018 16:32:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1j-0003lj-SZ
	for qemu-devel@nongnu.org; Fri, 16 Mar 2018 16:32:36 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56608)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eww1b-0003ZA-OP; Fri, 16 Mar 2018 16:32:28 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 6A13360C54; Fri, 16 Mar 2018 20:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232346;
	bh=eG1gJdVM0L+S3BQp9pYDN7H+pP36YyBh7KdF2OSGB2Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gQgJUgFp7c+RphSMQR61YiCuuYMu+PpDW9RPXlSZ52WbLOsf4ZMTDmZ7W5AYNx1Il
	CvB375GcXWVwlYVkja+aeHxqhGJ2TTnfyMHaG+/OqFfug36+kxkCHlma54wIq5BKyC
	o2bQP1FGw3cXH2G44fNZPAFcWP4+19ThqpocfPks=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id B06CA60F61;
	Fri, 16 Mar 2018 20:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232337;
	bh=eG1gJdVM0L+S3BQp9pYDN7H+pP36YyBh7KdF2OSGB2Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GFB6/60+mFwpeipSOYAerrn3/pGcxYW+6/dkQRltOP+Z+PzzukFVfm/AKVxQ9d5Dn
	ANF/Lx8IXq5LMsincQrxBOMmIzFsDMGrSSx5VzgRWOnPgEKpee0fMTPwbr+oeGSED1
	WIng1rpSXcFhk2S4pVauhpAnbGo7PoWRC9zsoQ1M=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B06CA60F61
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 16 Mar 2018 16:31:14 -0400
Message-Id: <1521232280-13089-17-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-devel] [PATCH v3 16/22] target/arm: Implement PMOVSSET
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
Cc: Michael Spradling <mspradli@codeaurora.org>, qemu-devel@nongnu.org,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x6yvENkHwt1P

Adding an array for v7VE+ CP registers was necessary so that PMOVSSET
wasn't defined for all v7 processors.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d4f06e6..f5e800e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1241,9 +1241,17 @@ static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void pmovsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                          uint64_t value)
 {
+    value &= PMU_COUNTER_MASK(env);
     env->cp15.c9_pmovsr &= ~value;
 }
 
+static void pmovsset_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                         uint64_t value)
+{
+    value &= PMU_COUNTER_MASK(env);
+    env->cp15.c9_pmovsr |= value;
+}
+
 static void pmxevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
@@ -1406,7 +1414,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcnten),
       .writefn = pmcntenclr_write },
     { .name = "PMOVSR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 3,
-      .access = PL0_RW, .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
+      .access = PL0_RW, .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmovsr),
       .accessfn = pmreg_access,
       .writefn = pmovsr_write,
       .raw_writefn = raw_write },
@@ -1592,6 +1600,25 @@ static const ARMCPRegInfo v7mp_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+static const ARMCPRegInfo v7ve_cp_reginfo[] = {
+    /* Performance monitor registers which are not implemented in v7 before
+     * v7ve:
+     */
+    { .name = "PMOVSSET", .cp = 15, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 3,
+      .access = PL0_RW, .accessfn = pmreg_access,
+      .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmovsr),
+      .writefn = pmovsset_write,
+      .raw_writefn = raw_write },
+    { .name = "PMOVSSET_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 14, .opc2 = 3,
+      .access = PL0_RW, .accessfn = pmreg_access,
+      .type = ARM_CP_ALIAS,
+      .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
+      .writefn = pmovsset_write,
+      .raw_writefn = raw_write },
+    REGINFO_SENTINEL
+};
+
 static void teecr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
@@ -4943,6 +4970,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         !arm_feature(env, ARM_FEATURE_PMSA)) {
         define_arm_cp_regs(cpu, v7mp_cp_reginfo);
     }
+    if (arm_feature(env, ARM_FEATURE_V7VE)) {
+        define_arm_cp_regs(cpu, v7ve_cp_reginfo);
+    }
     if (arm_feature(env, ARM_FEATURE_V7)) {
         /* v7 performance monitor control register: same implementor
          * field as main ID register, and we implement only the cycle
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

