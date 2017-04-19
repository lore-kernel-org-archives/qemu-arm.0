Received: by 10.25.0.144 with SMTP id 138csp378230lfa;
        Wed, 19 Apr 2017 10:42:35 -0700 (PDT)
X-Received: by 10.200.58.70 with SMTP id w64mr3695156qte.174.1492623755815;
        Wed, 19 Apr 2017 10:42:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b134si3045384qkg.144.2017.04.19.10.42.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Apr 2017 10:42:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org;
       dkim=fail header.i=@codeaurora.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49613 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0tch-0000QM-6a
	for alex.bennee@linaro.org; Wed, 19 Apr 2017 13:42:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tc2-0008Au-EK
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:41:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tc1-0004MK-Ba
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:41:54 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37654)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1d0tc1-0004M7-3M; Wed, 19 Apr 2017 13:41:53 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 3B3ED610DB; Wed, 19 Apr 2017 17:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623712;
	bh=rhqbJ39KYkzAH5VJWU/sowpPX/lF18hOLxDCI1xKXFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nONByaA5jQSEum8w7195N0dtzKKJYp02z+O5rYE4Ky4blqfMGvnbTT0+NgIIDQ+Wj
	JXucVf5lsdN1b0mi+toyjY7qXTbcO4b228U6IsS5j9GyqBWLKB7FF1RJpkW6vaKTWY
	Q4QVBStNZ9Z/1jHsQ5HI7JAExR8B7iRzya2eNOHw=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 3441B610D4;
	Wed, 19 Apr 2017 17:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623711;
	bh=rhqbJ39KYkzAH5VJWU/sowpPX/lF18hOLxDCI1xKXFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CHOdmFrv7QZBEbacvrIwG1rjy4gmE5Ft+OJKUIa7jOTCFVl20P7gXmGCfjvu6R+M+
	uUN55KJDKJ97LqfyswWzQsaK3U+1PmX29BiRGIm0xAfbsNURwryCT4VROnmxjLbPvn
	/lk/OokLE+J63p3zRVdVpGikOiXfclYHpOwL+eRk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3441B610D4
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Date: Wed, 19 Apr 2017 13:41:16 -0400
Message-Id: <1492623684-25799-6-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
References: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH 05/13] target/arm: Allow AArch32 access for
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>, mspradli@codeaurora.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yje/XrPrpR6Z

Also fix the existing bitmask for writes.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e8189b8..530fc7c 100644
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
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

