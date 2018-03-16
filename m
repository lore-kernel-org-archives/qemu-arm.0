Received: by 10.28.91.67 with SMTP id p64csp1279228wmb;
        Fri, 16 Mar 2018 13:39:19 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtc7YQp6JIyejAk1PeoIItk/LunmaXkk0Mjr8kiVMYS94n1LZOBlsnbtiC9oxR/HYhsa0Cy
X-Received: by 10.55.102.19 with SMTP id a19mr4861854qkc.75.1521232759134;
        Fri, 16 Mar 2018 13:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521232759; cv=none;
        d=google.com; s=arc-20160816;
        b=bY8n5t4moPQCwN7jQd2g8LgDZdlX6E8D62/JB7RBS+iE5IO8EJ0XlXy/KkjPxSziV9
         s3zi1iXD9JEwVoN5sXQM/vhytRSNg16Cn37zP1E4jMjm0HzDr71C+mhp+77bFntEKPt8
         nwBjwURs4KOMA2faKk32ZlF/Vt3T0d0Nfngc6s7ofra799oAYGjWtQDIrLCgesparIY7
         d20XwjNtv8EntiSTOhOg42cAQdWzESohIdFYQuanyyFtM7i1oJBHmT9Xi6HXucuGfl/F
         JOsQKsbaezr7/JLMnv6mkgd84niFRJ2/UuZ5aHq4lrBtX4PmmVAaqRQXZRc4RDRV/D15
         7pog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=vRq7vwZYYkq4u+ekSVcEcWJKb+sSzSbL3AC7nvAgAzQ=;
        b=YBiOFrUjDjODGp8npa3Q9j+TncNiULrvat9cTCZJhySLOc2qG72L7NmuqopSIq9HAQ
         TlnNiHQgANjSaF2L8PFrDoUefClDGIEf9ATgsl/gYezlu8BgPV0t92WBSdH5EzI2ia6C
         E9JY/MefFGjuWGdJRB63jDpzOrlWDac6saHc11ONHR8bGRoJkJ6PUVTa6LZYov2XEXn2
         VnrXBVkeU3ixzn1eSdrvjMJqc8LyNHNAa/3+3U1090rymcBkigr/Qf2hSJLHgGleI/ew
         TriHnmrIuRr4VHhwslGVCP7+BtQ9VwL65dGvcnzSojcWmLHOfvQZkp5XcX+XW/1vOfR1
         HiKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=YDMryC0e;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=RhqFqqcw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o3si2010302qtd.213.2018.03.16.13.39.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 13:39:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=YDMryC0e;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=RhqFqqcw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59471 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eww8E-00032Q-KC
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 16:39:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1Y-0005zG-Mi
	for qemu-devel@nongnu.org; Fri, 16 Mar 2018 16:32:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1X-0003Uc-Ni
	for qemu-devel@nongnu.org; Fri, 16 Mar 2018 16:32:24 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56188)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eww1S-0003O2-Nx; Fri, 16 Mar 2018 16:32:18 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 8D09A60FE9; Fri, 16 Mar 2018 20:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232337;
	bh=48LzR25TMpECrCpkAtlTu/zGR0jWMtcfoMzCMPW8niA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YDMryC0e8oJf7moCb9zY959joZgHHsrPhDRZbGpH/OfHCVmZY36a07dfINhwbLOxO
	z3pgq68bnp3jsqgI6jpmbDKiQ6wB646UikOfjQ0IXCMesDTCwtlpcfsX9KzLnxKTeQ
	ddrIAKNAFUkBzj3ewEe+nfr0atkQpJDZJaRHFgn8=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 707B260F94;
	Fri, 16 Mar 2018 20:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232333;
	bh=48LzR25TMpECrCpkAtlTu/zGR0jWMtcfoMzCMPW8niA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RhqFqqcw3WK600ve2IalsGneZQWDjbndLUXOmXSdYB2unq17cTGziznshe6OTQD4z
	TOvHcXZDw/ylV15lJHEMaNrr71poYzAV+GYGlQpMrLDkZmFJGUStUhYStMgSSjttpK
	LJSVsiQ7N5HVKouWKq7p8F41YykivZQZnA6c2ls8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 707B260F94
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 16 Mar 2018 16:31:11 -0400
Message-Id: <1521232280-13089-14-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-devel] [PATCH v3 13/22] target/arm: Allow AArch32 access for
 PMCCFILTR
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
X-TUID: 4YTzoER8pp5d

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 95b09d6..d4f06e6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -917,6 +917,10 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
 #define PMXEVTYPER_MT         0x02000000
 #define PMXEVTYPER_EVTCOUNT   0x000003ff
 
+#define PMCCFILTR             0xf8000000
+#define PMCCFILTR_M           PMXEVTYPER_M
+#define PMCCFILTR_EL0         (PMCCFILTR | PMCCFILTR_M)
+
 #define PMU_NUM_COUNTERS(env) ((env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT)
 /* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
 #define PMU_COUNTER_MASK(env) ((1 << 31) | ((1 << PMU_NUM_COUNTERS(env)) - 1))
@@ -1200,10 +1204,26 @@ static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
     uint64_t saved_cycles = pmccntr_op_start(env);
-    env->cp15.pmccfiltr_el0 = value & 0xfc000000;
+    env->cp15.pmccfiltr_el0 = value & PMCCFILTR_EL0;
+    pmccntr_op_finish(env, saved_cycles);
+}
+
+static void pmccfiltr_write_a32(CPUARMState *env, const ARMCPRegInfo *ri,
+                            uint64_t value)
+{
+    uint64_t saved_cycles = pmccntr_op_start(env);
+    /* M is not accessible from AArch32 */
+    env->cp15.pmccfiltr_el0 = (env->cp15.pmccfiltr_el0 & PMCCFILTR_M) |
+        (value & PMCCFILTR);
     pmccntr_op_finish(env, saved_cycles);
 }
 
+static uint64_t pmccfiltr_read_a32(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /* M is not visible in AArch32 */
+    return env->cp15.pmccfiltr_el0 & PMCCFILTR;
+}
+
 static void pmcntenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
@@ -1421,6 +1441,11 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
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

