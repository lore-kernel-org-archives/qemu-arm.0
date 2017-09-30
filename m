Received: by 10.223.197.9 with SMTP id q9csp1229307wrf;
        Fri, 29 Sep 2017 19:12:38 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAvBiEAOQD9RE1Wjb+iiqKHzOOISIpYwBJnupUACOzCYknMW2HDvmKug9+oqjDdylA/4UR0
X-Received: by 10.200.49.202 with SMTP id i10mr8798421qte.63.1506737558820;
        Fri, 29 Sep 2017 19:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506737558; cv=none;
        d=google.com; s=arc-20160816;
        b=aH0m0xqt/E633sIzJ0uHs/lbKG3UOY5L3StIsDzr0v/HUfFHCqznI/xEhc0u+9XTxQ
         bgErjaJCbvlT20pz1+x8NyA+MOs3vEQw//AvMDvM8UtaEI/zINh7xWP2iCAdFSUx2XEs
         RFnp6P4OMGi332CYeT8PaCvU8F7Btw6Oi+QWt0h0zfzfwiVVAXevvlI7mGep/fhOG/u1
         CSglNeVlOfob2VaMhfMBjrJ1qqaAs6hAAn7LhpA4yGKdkGYN/H85NyEAJsj/0t/yEWDR
         GwFprQcNUUVFTLXFdn0VpEtMzwy0m2jmE52S+UQWEqLgNmwvPXM6snw+jqbcwUCE0teM
         zlKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=QRYWbpMepR6Tz9wPwtwxfUiJpGP++UIfm0jcM55XE+I=;
        b=AzvM0yvVSAgB2met2slMsUVlm4ieeSzC9dNlZcexUSSgPmrL9EYSfq1jUp6UhSbZ+F
         b0t84A8nejzgLziIaXgNQIAtye6YVoszJvOKMG25X84p0wXYe/IEmQjhWGz7Ybpc10bQ
         wMlpgOr23DyB6IKjQ6sHSxEo9fy6MaMFh1ibbfu1Oxv4fW8AIi59coWJTXNnYz8AxAQx
         fFs6J2ERhi38l4bPEgqFCxgZvb6SqKqdW50RlL6Y8Hf9SQU8MNzP3sc9DoJys/0CAB11
         rjb3w9nt0nHMliu3Qu+Ct7d22qyDgBkDwxVP0EjgHpk5GwHE633Q5jCgHE/zc11KCcdO
         BOqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=M6IBaxdG;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=EId7clZG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m74si847724qkl.157.2017.09.29.19.12.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Sep 2017 19:12:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=M6IBaxdG;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=EId7clZG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Received: from localhost ([::1]:37801 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dy7Gd-00052v-Da
	for alex.bennee@linaro.org; Fri, 29 Sep 2017 22:12:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7Db-0002R0-Jr
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:09:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7DY-000548-5K
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:09:27 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35116)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1dy7DX-00052T-Te; Fri, 29 Sep 2017 22:09:24 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 2AD9360B7E; Sat, 30 Sep 2017 02:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737363;
	bh=0zPPECZO2kflUetuEdF33evjAtEqnW+wz/n7+jPWsxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M6IBaxdG6E8GwB6SQGjpy20r7/ug33EUcOnC+oIKFmt2ikgQaoCv7GPROA22rNjWh
	RH+oBgNB/d9ZoC503tyOkL2rHEJOkEXETO9YIXImukPTspXf0DJGqpGs/wCmU/r6pv
	n2+lD4F6ttVTHY2+83mKr5/Gv29/3QeQKR5Aa48w=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id D423460B62;
	Sat, 30 Sep 2017 02:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737362;
	bh=0zPPECZO2kflUetuEdF33evjAtEqnW+wz/n7+jPWsxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EId7clZG3O86m82HuTMloHeTJleeAG6iij1JY78Xi6W2GeLRFna2zQYE5v16rh3pn
	CEM6yCksYDaWgyD9GJSTSHBa/pVsLA5pno+I3FDEx6JxQavtDGUDEMCo6AB0e2Ns7C
	R/cOrAhxs4LsqmoY2ke/TCKAAKdqetfgwCIpN34s=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D423460B62
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Wei Huang <wei@redhat.com>
Date: Fri, 29 Sep 2017 22:08:21 -0400
Message-Id: <1506737310-21880-5-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH 04/13] target/arm: Mask PMU register writes based
 on PMCR_EL0.N
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
X-TUID: weM5TD+X+tcO

This is in preparation for enabling counters other than PMCCNTR

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ecf8c55..54070a3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -30,11 +30,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
                                hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
                                target_ulong *page_size_ptr, uint32_t *fsr,
                                ARMMMUFaultInfo *fi);
-
-/* Definitions for the PMCCNTR and PMCR registers */
-#define PMCRD   0x8
-#define PMCRC   0x4
-#define PMCRE   0x1
 #endif
 
 static int vfp_gdb_get_reg(CPUARMState *env, uint8_t *buf, int reg)
@@ -876,6 +871,17 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+/* Definitions for the PMU registers */
+#define PMCRN   0xf800
+#define PMCRN_SHIFT 11
+#define PMCRD   0x8
+#define PMCRC   0x4
+#define PMCRE   0x1
+
+#define PMU_NUM_COUNTERS(env) ((env->cp15.c9_pmcr & PMCRN) >> PMCRN_SHIFT)
+/* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
+#define PMU_COUNTER_MASK(env) ((1 << 31) | ((1 << PMU_NUM_COUNTERS(env)) - 1))
+
 static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
@@ -1060,14 +1066,14 @@ static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void pmcntenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
-    value &= (1 << 31);
+    value &= (PMU_COUNTER_MASK(env) | (1 << 31));
     env->cp15.c9_pmcnten |= value;
 }
 
 static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
-    value &= (1 << 31);
+    value &= (PMU_COUNTER_MASK(env) | (1 << 31));
     env->cp15.c9_pmcnten &= ~value;
 }
 
@@ -1115,14 +1121,14 @@ static void pmintenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
     /* We have no event counters so only the C bit can be changed */
-    value &= (1 << 31);
+    value &= PMU_COUNTER_MASK(env);
     env->cp15.c9_pminten |= value;
 }
 
 static void pmintenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
-    value &= (1 << 31);
+    value &= PMU_COUNTER_MASK(env);
     env->cp15.c9_pminten &= ~value;
 }
 
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.\nQualcomm Technologies, Inc. is a member of the\nCode Aurora Forum, a Linux Foundation Collaborative Project.

