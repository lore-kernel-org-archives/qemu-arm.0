Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1248985wrq;
        Fri, 22 Jun 2018 13:32:54 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKzu0KSZorOnfizhb/RxqvTseymAWiEQVvmi1TUQROAEeGiNsNmguIZtfuWsRxPKctzHjt6
X-Received: by 2002:a37:3b04:: with SMTP id i4-v6mr2673565qka.389.1529699574830;
        Fri, 22 Jun 2018 13:32:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529699574; cv=none;
        d=google.com; s=arc-20160816;
        b=WtVfFWLwz2AgHRBOdheqC8Xvdpc0O3woiKN2UkQi/A0Z3qxST08dZ47JdHg3wcoM74
         TCa+hdtKYkXueky50ClihuLZiyMjgexwhZmDJYcQHmtq0cPPOtTMl6XcunkXaAiumtQd
         QbLvFlFExM/enKBBiS8y+sjqovB4AY1hh++dobSP0DnwlJsqYs5G9ffLtbwhWGM6YGuP
         Oma3i5Z0x/yEJgBZmfVibelcJkyuoaK5ugfsCTy/ZexX9pAkfdybmgWoapU8huF3VaBF
         Ttr5Ds+dD1BQwwOmaFLC3dW6BHBNTjCb1kuJaD5wETj6KVWjqq406scPcjh20ijvPjwP
         OwFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=69I8GVJ86NrpO4eUsLKXfhfwWX2TbTfPLnTTEa4if7A=;
        b=Gj85X0QoeMf8XWmPYVPRU798U6oXuZ1ayxt2M5X3SS6xwMcR8kZ6JeZ7IDweAQvXFr
         MSl1elJj9r7NGaoDEX3xP1O4kUkN5NMhWqO6cEI25eI5efNCrGFu/12Hmyuyy04mhno+
         jd4tGnix3P0wwM7mYKzEd2GXx3L/uPDdBr19Q3f803JNWcPiqjWMNddcfebXCgUkrfDX
         +zpXljZD5jP0WSbJ4M/leT/APYN/jwA9zFBb0j6kh/h6fwdzPwCbfRlCfCyion89OIZ8
         qGsQAGarfNrnu4gRwUT9RjDdQoDhXLeNNP47+0fo5PHhaKMr9Mb9u+eekZyNK1zHzR8p
         xl9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=PdD7p+Er;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=PdD7p+Er;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p36-v6si2888142qtd.389.2018.06.22.13.32.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 13:32:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=PdD7p+Er;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=PdD7p+Er;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36062 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWSjm-00025i-8U
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 16:32:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSjY-00024X-O1
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:32:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSjX-0005PV-Pw
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:32:40 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45264)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1fWSjX-0005PI-HR; Fri, 22 Jun 2018 16:32:39 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 9DE1960B11; Fri, 22 Jun 2018 20:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699558;
	bh=Kymi//lCrzBqEqszoUIytQdU3BjWSUg5+Pfc4iX+qCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PdD7p+Er+a70X/0fiRJ6I7gCeJof/XPnsQBmtrNj47NVtBA8phqhDZoF4oi3SJxgO
	06AzeDPJFaBlgPL2p3i69wyKLv+dnzTo6ziNMnONAMcZ8aClD869sugUg4Y77hTT2I
	syn2Ejjx/HKX823IB/hkB+e52xQoy5yqHq06zkuQ=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id ED818606FA;
	Fri, 22 Jun 2018 20:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699558;
	bh=Kymi//lCrzBqEqszoUIytQdU3BjWSUg5+Pfc4iX+qCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PdD7p+Er+a70X/0fiRJ6I7gCeJof/XPnsQBmtrNj47NVtBA8phqhDZoF4oi3SJxgO
	06AzeDPJFaBlgPL2p3i69wyKLv+dnzTo6ziNMnONAMcZ8aClD869sugUg4Y77hTT2I
	syn2Ejjx/HKX823IB/hkB+e52xQoy5yqHq06zkuQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ED818606FA
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 22 Jun 2018 16:32:17 -0400
Message-Id: <1529699547-17044-4-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v5 03/13] target/arm: Allow AArch32 access for
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>, Aaron Lindsay <aclindsa@gmail.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aedh0BAIEKDb

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7c66977..7d63bb2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -949,6 +949,10 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
 #define PMXEVTYPER_MT         0x02000000
 #define PMXEVTYPER_EVTCOUNT   0x000003ff
 
+#define PMCCFILTR             0xf8000000
+#define PMCCFILTR_M           PMXEVTYPER_M
+#define PMCCFILTR_EL0         (PMCCFILTR | PMCCFILTR_M)
+
 static inline uint32_t pmu_num_counters(CPUARMState *env)
 {
   return (env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT;
@@ -1252,10 +1256,26 @@ static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
+    pmccntr_op_start(env);
+    /* M is not accessible from AArch32 */
+    env->cp15.pmccfiltr_el0 = (env->cp15.pmccfiltr_el0 & PMCCFILTR_M) |
+        (value & PMCCFILTR);
+    pmccntr_op_finish(env);
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
@@ -1474,6 +1494,11 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
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

