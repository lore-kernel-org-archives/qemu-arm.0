Received: by 10.28.4.212 with SMTP id 203csp4250771wme;
        Tue, 17 Apr 2018 13:39:47 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48RgMfkU6nD9v1rObEDVWUbLTMSsB9/MfFzgSenzh/GJ+hjJzBbW4XToUk7JeDSRvX/paxq
X-Received: by 10.55.1.211 with SMTP id u80mr2972723qkg.17.1523997587048;
        Tue, 17 Apr 2018 13:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523997587; cv=none;
        d=google.com; s=arc-20160816;
        b=oz9b6BAQzaKb+pGbcU1UDzxifsEWHaXVzQ0Mfd06n1i4NF79aZBUjtRmTN/ybwnG+Y
         MTcRppH78msqdP6ISFQtuviiTBBbmWMKs+EkT1CYufC1ODjirsdIRAhmI+xN6U1H/48N
         YnD/H5egtfX9F15RhSkHAezkYRu4T0t4gLaayJLhS4Wvm2TdkurhMrvJGwktDRCuqPIJ
         gHGss+ZTORmhoOv6UQ8C9sFzpsMTegD57I8xx/JnALUG0eE8rFK5i8gx5iJqBrgFvKNm
         uLhJJGaPbfza+GujHqnKV7yjnLc78xzmZH4GmVXEJtEeiJoHbALXfii4wq+W0U59kdn4
         b9Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=XiT2HkVnjl8L1632Q+tiel8Lob5M7udfWvYnvVemr/k=;
        b=GtdN+IEarRGZhM9BgRnPS0Ar7k6iTZ3v9LOizYfrYLgix7WuxQGtrVV/z1jrqJH3Ga
         T3yLyVdZ82qtEYy+87XgqAeVvDnb/Q66bmtTRmeQrr2yZiLMtFhY4sxQGsnTBdxUrbal
         OnTDzfK2pwOq+11kv2RuGSooBbhcNoSTS9cytwq92gHSg6AEGRKwUYTZoaT241kHSv1h
         HSbmHX/lC1Y2KxvbOO2wdxalZHmXWH9t/1XVo7I/w/R2aw7fqt9NEJ2F0XZxvjIAY8xi
         bORIUt3BW/WlXkdK+Nw/YdjzjIIR7bZE9TZKZsXk2jNDKPEuGXHGhA0wLC8pcArCCbMA
         SqEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=LE/cBVhm;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=LE/cBVhm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b18si1920771qta.108.2018.04.17.13.39.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 13:39:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=LE/cBVhm;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=LE/cBVhm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33290 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8XOE-0003P0-CH
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 16:39:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNO-0002mo-3z
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:38:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNM-0004W7-A0
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:38:54 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39330)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8XNL-0004Mt-Ua; Tue, 17 Apr 2018 16:38:52 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id EB60560FB1; Tue, 17 Apr 2018 20:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997530;
	bh=m54t/EdXHI6+NMEuDeA91ZwmkdHPxSlAYvTwFkt6Rns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LE/cBVhmBZ0KvclJQuiB/FPMDaVqjm8JfYk8yvK2ZPiru7BzpfYAHMbeIvoaug+so
	nvUQz5+qza4z5qKgVjhT+E0gF/JdWtUF9KHtz+f49UmN87uxQ1OTMy74WsbTBXNuDc
	t/MBDmwwVpYGxPdlQcojzvB72UnYlUXZxTXYdiZs=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 5421260F6D;
	Tue, 17 Apr 2018 20:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997530;
	bh=m54t/EdXHI6+NMEuDeA91ZwmkdHPxSlAYvTwFkt6Rns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LE/cBVhmBZ0KvclJQuiB/FPMDaVqjm8JfYk8yvK2ZPiru7BzpfYAHMbeIvoaug+so
	nvUQz5+qza4z5qKgVjhT+E0gF/JdWtUF9KHtz+f49UmN87uxQ1OTMy74WsbTBXNuDc
	t/MBDmwwVpYGxPdlQcojzvB72UnYlUXZxTXYdiZs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5421260F6D
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 17 Apr 2018 16:37:48 -0400
Message-Id: <1523997485-1905-5-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v4 04/21] target/arm: Mask PMU register writes
 based on PMCR_EL0.N
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
X-TUID: R/AF8e5mKwAP

This is in preparation for enabling counters other than PMCCNTR

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f6269a2..8bec07e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -52,11 +52,6 @@ typedef struct V8M_SAttributes {
 static void v8m_security_lookup(CPUARMState *env, uint32_t address,
                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                 V8M_SAttributes *sattrs);
-
-/* Definitions for the PMCCNTR and PMCR registers */
-#define PMCRD   0x8
-#define PMCRC   0x4
-#define PMCRE   0x1
 #endif
 
 static int vfp_gdb_get_reg(CPUARMState *env, uint8_t *buf, int reg)
@@ -906,6 +901,24 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+/* Definitions for the PMU registers */
+#define PMCRN_MASK  0xf800
+#define PMCRN_SHIFT 11
+#define PMCRD   0x8
+#define PMCRC   0x4
+#define PMCRE   0x1
+
+static inline uint32_t pmu_num_counters(CPUARMState *env)
+{
+  return (env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT;
+}
+
+/* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
+static inline uint64_t pmu_counter_mask(CPUARMState *env)
+{
+  return (1 << 31) | ((1 << pmu_num_counters(env)) - 1);
+}
+
 static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
@@ -1119,14 +1132,14 @@ static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void pmcntenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
-    value &= (1 << 31);
+    value &= pmu_counter_mask(env);
     env->cp15.c9_pmcnten |= value;
 }
 
 static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
-    value &= (1 << 31);
+    value &= pmu_counter_mask(env);
     env->cp15.c9_pmcnten &= ~value;
 }
 
@@ -1174,14 +1187,14 @@ static void pmintenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
     /* We have no event counters so only the C bit can be changed */
-    value &= (1 << 31);
+    value &= pmu_counter_mask(env);
     env->cp15.c9_pminten |= value;
 }
 
 static void pmintenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
-    value &= (1 << 31);
+    value &= pmu_counter_mask(env);
     env->cp15.c9_pminten &= ~value;
 }
 
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

