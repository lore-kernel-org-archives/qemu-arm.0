Received: by 10.223.197.9 with SMTP id q9csp1229433wrf;
        Fri, 29 Sep 2017 19:12:49 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCEhFu1WCGPWw7zU1MmEHFy2a9svn2sZ9AMNFlStXkHbXJk35QCG8qk3PL8nhSiYVlmEBzf
X-Received: by 10.200.46.216 with SMTP id i24mr9320772qta.257.1506737569851;
        Fri, 29 Sep 2017 19:12:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506737569; cv=none;
        d=google.com; s=arc-20160816;
        b=Ece5FavovcyyQnBvQMPQTLQIR1uol+F9+lF4O6vJpAiKaZKHY3vmDzfl21DSapw5dH
         MCRayS12h/KjaAOnlQvlidtQz+yIdMgbDT0GN38EABE0H+WQMnzqorgON6ZlzicmDcnG
         0eyiRc+283WZgqIhFGG0adzYZAN0JmhO4Pl3VlWvJtVQZt3nHdwDG9P2yywO0s7ckTzO
         i+gNCgIivb1N6uNoHcz6Z6FjZm+G465f2CQGmxG5vDqKLWik7O9hbGGp/cPVuj8SkYAt
         mw/WSjs9WRha9/jtqZM4QbT3isPPkr6hVVzHm8nUbOw8vjiIzREObebrgJ7tKWqUSTsJ
         oihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=lg/syPqx7uMofviyfk2KO92/6g93Zt1NZnrqr8J3GPk=;
        b=FvMZd6HElZPKhvK3zM2UjxO/oWfraP8asc636VUpTYw5hizZ7C7TSqtsRGdnfAB1ZP
         XF1a5MCplpbfuUjT8Pmlw6shpbz2Bb0PzZQ6STgFg206g0xgFM0bK8GD9V4zgodLIhPy
         MtD/OwNiPIeUzKxpNzTV58pm+EVVAO8Ln8ilp3AO/XZP1TIDjLfbMl0Xo1wnmBiyD+FL
         TO55ZDCyNKeALbw/0kKcVe//TjTUkkHWmRB5Wak2REXnyxTFDqbN1F2X6dThRYbTFyd6
         xPlD+irVj5jSu41pjkMMrE/UHqZS/M13PKnW8bK7SOmcuy9isO+WCLAl3ss2EBKOG3AC
         oyng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=H+auxBdx;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=BdQhzJQx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z76si4831513qkb.404.2017.09.29.19.12.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Sep 2017 19:12:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=H+auxBdx;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=BdQhzJQx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Received: from localhost ([::1]:37805 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dy7Gp-0005Fm-ES
	for alex.bennee@linaro.org; Fri, 29 Sep 2017 22:12:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49438)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7Db-0002Qz-Hu
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:09:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7DZ-00055p-El
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:09:27 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35186)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1dy7DZ-00054e-5j; Fri, 29 Sep 2017 22:09:25 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 5124160C54; Sat, 30 Sep 2017 02:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737364;
	bh=y/zQEPpgcrgI8gRNCjjN/fhf5jDcFR3XAUkj+w3ybYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H+auxBdxSO6/7MXHKTZqHneP1szI1FpaYRCpxuZGH8O4pNVtMNIoEEOr/I4wY6kq1
	0whaA5V4qPkAwdiU5c54WVpjkbw6/HxSyHkCl1nb6YGq7C19QT/kx4cq22vYeHWNaM
	8hGR+1fSPsNwOhVe3CozZOWcfDayPqfnDRxfYH18=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 0A30F60B74;
	Sat, 30 Sep 2017 02:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737363;
	bh=y/zQEPpgcrgI8gRNCjjN/fhf5jDcFR3XAUkj+w3ybYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BdQhzJQxx9mWn5byoRxME+jl2QS4AAkcXm78lmRqTJHIQIQCbPrQv6XrL2rXGx64F
	IgfXrJ9YC/JwbJu62f2kCHu6zwislGwN15Km6qyVG9DqpONDREVsqOTXIhyWlVLQdV
	XuYHXkM/3dbMNpj6Zb/oBgPUWO0SW7/5pAs9fABs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0A30F60B74
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Wei Huang <wei@redhat.com>
Date: Fri, 29 Sep 2017 22:08:22 -0400
Message-Id: <1506737310-21880-6-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH 05/13] target/arm: Allow AArch32 access for
 PMCCFILTR
X-BeenThere: qemu-arm@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@gnu.org>
List-Help: <mailto:qemu-arm-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=subscribe>
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
X-TUID: RAx65Y4eEo0W

Also fix the existing bitmask for writes.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 54070a3..fcc2fcf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1059,10 +1059,25 @@ static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
     pmccntr_sync(env);
-    env->cp15.pmccfiltr_el0 = value & 0x7E000000;
+    env->cp15.pmccfiltr_el0 = value & 0xfc000000;
     pmccntr_sync(env);
 }
 
+static void pmccfiltr_write_a32(CPUARMState *env, const ARMCPRegInfo *ri,
+                            uint64_t value)
+{
+    pmccntr_sync(env);
+    env->cp15.pmccfiltr_el0 = (env->cp15.pmccfiltr_el0 & 0x04000000) |
+        (value & 0xf8000000); /* M is not visible in AArch32 */
+    pmccntr_sync(env);
+}
+
+static uint64_t pmccfiltr_read_a32(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /* M is not visible in AArch32 */
+    return env->cp15.pmccfiltr_el0 & 0xf8000000;
+}
+
 static void pmcntenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
@@ -1280,6 +1295,12 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .type = ARM_CP_IO,
       .readfn = pmccntr_read, .writefn = pmccntr_write, },
 #endif
+    { .name = "PMCCFILTR", .cp = 15, .opc1 = 0, .crn = 14, .crm = 15, .opc2 = 7,
+      .writefn = pmccfiltr_write_a32, .readfn = pmccfiltr_read_a32,
+      .access = PL0_RW, .accessfn = pmreg_access,
+      .type = ARM_CP_ALIAS,
+      .fieldoffset = offsetoflow32(CPUARMState, cp15.pmccfiltr_el0),
+      .resetvalue = 0, },
     { .name = "PMCCFILTR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 15, .opc2 = 7,
       .writefn = pmccfiltr_write,
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.\nQualcomm Technologies, Inc. is a member of the\nCode Aurora Forum, a Linux Foundation Collaborative Project.

