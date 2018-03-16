Received: by 10.28.91.67 with SMTP id p64csp1278721wmb;
        Fri, 16 Mar 2018 13:38:44 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtchlfxVAMk8q9b7GqXOP3S2yA+Tb2O5tSCnAWHj/HNXiJTZZyGCtukU8xxF0wdDJvWrQX0
X-Received: by 10.55.246.13 with SMTP id y13mr4987157qkj.281.1521232724453;
        Fri, 16 Mar 2018 13:38:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521232724; cv=none;
        d=google.com; s=arc-20160816;
        b=0DAc17BghPmm7DJ0sxsQXyyGv4/dI4t8HnHzVzMNQNnzNkN/9PTYZ95YOvc1snGI4h
         idUYXi/08XmoU+mVT5SiDZeh4O835XknRkgUsFPty85WygJu0nb+6chsP9PrvW8SC+Or
         IQdW3LG0IY7cDURuyvf24AoO7BMliVflunB8TSGD2Q3TgpCK9oxSi4fS26IbHX4Vj2Hx
         YhCGnLjbv5DmWtCg4owrjyyX9yQPj0GhN43frnohbwCJCiSxVYwq0UhaqF9k9hxugN+F
         GKXoKF4GfxuvpqFn2EiRHlBEfeNiiAAm1fnyKuNXEIiEkE0JgO0gia7k/8TPr1dWfYe+
         o9og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=5hp90hKhOYm5eQkvqiUnPcn+FXQ7Oz8qdHC1AMyqTp0=;
        b=jC0vE8a6z/gDCyFKaOMrwBennlqkOEML32bwjvxdsz+SF8aUDqBaQSm4kdeSqyolDv
         +wpiEXf/N00nzIErk6ffMMcpROhYN6tjLLJRRNAPwQXd+7nBkXm4qcPmPCjKKDDa76zs
         W/MZl3aCySP9NQ8ttNm7/RXbi6t/SnWZDxsVf/nv0JTtpgb+/7zh5rOLABohWSp+i56s
         2FjY4+dBcGeuXSFp14YEQ3HfUYqkeH2HGVP7bVhbHAMCL5ZxHudiCtj+eajdI33XhUOH
         MQuBlXB8z7KygvRWQ5eo2vdoSxITIT/3wwC2UUT1cUwyAXm/qE82PVRGqTdlz0TLPXnx
         UwAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Ar6b1QSG;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=RrmDXAJW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n37si1893800qkh.139.2018.03.16.13.38.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 13:38:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Ar6b1QSG;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=RrmDXAJW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eww7f-0002nK-VI
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 16:38:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1L-0005mi-6Y
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1G-0003Au-V5
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:11 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55642)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eww1G-00039t-N8; Fri, 16 Mar 2018 16:32:06 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 7B36360F6B; Fri, 16 Mar 2018 20:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232325;
	bh=D67LeMzl3qQZwvyaGA0rc7Se/+pKvIxUu6uttTandJs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ar6b1QSGUDRtvJ4VwQoHO9sZmnbhdrIjoMk1ypCXok31kXz0c+5N/h37uNU+28S4e
	8ZbWQ6U/VLadxlDNIG7VGfu8iN3zIYsKt+H3upXV4vb44iExDz63NLbh0vo5XOkZCL
	/7SlYoBZ6uU96Pe3e4hs12RvtYqae2MHAFeH0PEw=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id EE7746055D;
	Fri, 16 Mar 2018 20:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232324;
	bh=D67LeMzl3qQZwvyaGA0rc7Se/+pKvIxUu6uttTandJs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RrmDXAJW9Zm9hRUVZ4Kooc51fxZ2ncwVcD4AahKoOplnkMIrYxIVnt74PwWmLRDIr
	abywdH0y0pJD8nMglcbmHpS8+BOlBhRSWqwW/EiY/tKwj51O/5Vb7XZXx5mq08gCcw
	3EX9wAfsCeoA2devtR21Otc7Pdl6FJxQW9ojWL/c=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EE7746055D
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 16 Mar 2018 16:31:04 -0400
Message-Id: <1521232280-13089-7-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v3 06/22] target/arm: Mask PMU register writes
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
X-TUID: wSTSXhb7//1B

This is in preparation for enabling counters other than PMCCNTR

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6480b80..5d5c738 100644
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
@@ -906,6 +901,17 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+/* Definitions for the PMU registers */
+#define PMCRN_MASK  0xf800
+#define PMCRN_SHIFT 11
+#define PMCRD   0x8
+#define PMCRC   0x4
+#define PMCRE   0x1
+
+#define PMU_NUM_COUNTERS(env) ((env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT)
+/* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
+#define PMU_COUNTER_MASK(env) ((1 << 31) | ((1 << PMU_NUM_COUNTERS(env)) - 1))
+
 static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
@@ -1124,14 +1130,14 @@ static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void pmcntenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
-    value &= (1 << 31);
+    value &= PMU_COUNTER_MASK(env);
     env->cp15.c9_pmcnten |= value;
 }
 
 static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
-    value &= (1 << 31);
+    value &= PMU_COUNTER_MASK(env);
     env->cp15.c9_pmcnten &= ~value;
 }
 
@@ -1179,14 +1185,14 @@ static void pmintenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

