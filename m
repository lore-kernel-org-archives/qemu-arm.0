Received: by 10.28.4.212 with SMTP id 203csp4251473wme;
        Tue, 17 Apr 2018 13:40:42 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/+AFxLf+bH+LB8fAfWMoNtTL63WwQ7ploqkT8WgavOgJLR6IoGbIyk6fAK1MQsyAf9Pzzd
X-Received: by 10.55.187.3 with SMTP id l3mr3630222qkf.32.1523997642695;
        Tue, 17 Apr 2018 13:40:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523997642; cv=none;
        d=google.com; s=arc-20160816;
        b=r0pHXnu/p98upO5iPVKrzfXQCoQBb3C+3+UMc0NvszKv/vmiIKx0RGMVOqZWodit30
         oj288aOj4GLhh3l5SVQMndHe8C4jLxJnTCgY70GOszFKz6CfoxjapFw95ZE9zK12SlH2
         9rhFDPVWTSPrcVAywz//6g38rE8FUeMbYmqZyFeX63fto93s654wOnv925gYmgOgwTrX
         XQAN95symtelCgN1HJ7GxuMAAzfdKKfRr+BbopcNtMsJn6ujsa2v8PQNy5L1mzDrtfl2
         6bglzbt4p7gh1G7FFdVgkNhHWZNkoiqJy3RCNfVr2/bqux/AngtXNBNM0GcwikBpFqWE
         terw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=wtyPWa4Qq6KaYqNBUulu/Gbu15K/W487EsoAclFlWvs=;
        b=kheZdCgEeQJKQuaDjom060ZpIs2sd7hTIPkcrXtq1gsePwrWLz0xrbEqJke2sBh0vY
         eCocT4rWtJhIoqRiYDWVzqniNaYPH6XodQlTWQgxEBWZZuVOqHjJKZndUUavTgOf1dwS
         eCrPZcIZT2wc3w6pgUx0hxcPOfwwfDEglFh240Ty3RJzX5Wj7y1cE9VfKbeVx1YSf4s5
         RrSr4OHXyT2npeuYi1h1T+/yANP20E4Z7BtvUoAie17H6hUt8Z+2oScpOHIya38lXioi
         j/ha02h5Kuvw4ojCahPIvk7Ez/8IWX0gxzdxE4+QMr33eU/1xg0V5xlklTKzvQM2kKT7
         co7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=LXqHadV0;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=M1Mo1VNO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t188si1942897qkd.80.2018.04.17.13.40.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 13:40:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=LXqHadV0;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=M1Mo1VNO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33304 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8XP8-0004F7-5y
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 16:40:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNZ-0002vs-E0
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNX-0005j5-1z
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:05 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39876)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8XNW-0005Yb-JO; Tue, 17 Apr 2018 16:39:02 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 3452C60385; Tue, 17 Apr 2018 20:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997540;
	bh=UFRgdKCmmuTY6FeEV+15k75f+f3CCVlk8OSTn072RkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LXqHadV0QI+EtZEZMJnepVcqhm4nB6J1M+AFFky11WPUn8x7JdlbqyX1T+Hmzd5Pw
	evpRiC/pVKcG7GZ2DvSQ9FYxIFRRaysUxdFXgaxozjN1tlKBjWb4Ube64YhP3lkZkS
	HHu/3ybcCiDP4ov2eWbGEflU14VSpSesjVHz48fI=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 8F4276109C;
	Tue, 17 Apr 2018 20:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997538;
	bh=UFRgdKCmmuTY6FeEV+15k75f+f3CCVlk8OSTn072RkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M1Mo1VNOLBcA/GnQrV6YyzS7isROVTH4C/htaM3YfL20KQ1jisFbZL7vDKRGr/XE7
	Eotg+itz1gtMxVrR1v96jL8zco9sWm1PTlYhLKGVd08fYpGMTDmIDzTByerSer39UK
	A++luVY2k64G5d1AyF8CDaYrhr56NOARKaJGBefQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8F4276109C
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 17 Apr 2018 16:37:55 -0400
Message-Id: <1523997485-1905-12-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v4 11/21] target/arm: Allow AArch32 access for
 PMCCFILTR
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: puaaZcTe0Ilw

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5953980..62cace7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -918,6 +918,10 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
 #define PMXEVTYPER_MT         0x02000000
 #define PMXEVTYPER_EVTCOUNT   0x000003ff
 
+#define PMCCFILTR             0xf8000000
+#define PMCCFILTR_M           PMXEVTYPER_M
+#define PMCCFILTR_EL0         (PMCCFILTR | PMCCFILTR_M)
+
 static inline uint32_t pmu_num_counters(CPUARMState *env)
 {
   return (env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT;
@@ -1221,10 +1225,26 @@ static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
     pmccntr_op_start(env);
-    env->cp15.pmccfiltr_el0 = value & 0xfc000000;
+    env->cp15.pmccfiltr_el0 = value & PMCCFILTR_EL0;
     pmccntr_op_finish(env);
 }
 
+static void pmccfiltr_write_a32(CPUARMState *env, const ARMCPRegInfo *ri,
+                            uint64_t value)
+{
+    uint64_t saved_cycles = pmccntr_op_start(env);
+    /* M is not accessible from AArch32 */
+    env->cp15.pmccfiltr_el0 = (env->cp15.pmccfiltr_el0 & PMCCFILTR_M) |
+        (value & PMCCFILTR);
+    pmccntr_op_finish(env, saved_cycles);
+}
+
+static uint64_t pmccfiltr_read_a32(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /* M is not visible in AArch32 */
+    return env->cp15.pmccfiltr_el0 & PMCCFILTR;
+}
+
 static void pmcntenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
@@ -1442,6 +1462,11 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .type = ARM_CP_IO,
       .readfn = pmccntr_read, .writefn = pmccntr_write, },
 #endif
+    { .name = "PMCCFILTR", .cp = 15, .opc1 = 0, .crn = 14, .crm = 15, .opc2 = 7,
+      .writefn = pmccfiltr_write_a32, .readfn = pmccfiltr_read_a32,
+      .access = PL0_RW, .accessfn = pmreg_access,
+      .type = ARM_CP_ALIAS | ARM_CP_IO,
+      .resetvalue = 0, },
     { .name = "PMCCFILTR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 15, .opc2 = 7,
       .writefn = pmccfiltr_write,
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

