Received: by 10.28.91.67 with SMTP id p64csp1278474wmb;
        Fri, 16 Mar 2018 13:38:29 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuCammtOeQYuYH7OZgXnp86XbACpEYZHdN75W4V9/vLlRJEaMu4heXuIPnt4Ida2zm4pbPO
X-Received: by 10.55.131.1 with SMTP id f1mr4644043qkd.160.1521232708972;
        Fri, 16 Mar 2018 13:38:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521232708; cv=none;
        d=google.com; s=arc-20160816;
        b=wx6nuVXJ4Bup6suLJTaATqSQJspXoWIpwwnsH4LORPPQZHSdUYQu+H26bs0+fubAJz
         Ge7XGXrlYsIpj/8VjVHEASo7y/y5qnJXtLAwePv4VZw/5cUHawbdDoGtH1sX+k+3buAi
         FS4kG0RGhODtai3At1QdKFB+g1dqJYphG4XzmAsCwk3yLbw/mnbh8axoXv819Cgiftm4
         +BogGBjCNohMOmsYsukHKRa9XX5zKC3vkXQw3FYgreKiIBelexvzgsaBao2ZNXKqE3UW
         VETzRSdWaQvg9XXVY69NrZFsmWuImkJt2KwMyDuVnula8VQ4S0GLbPm2IREB0NXzPw+W
         y2UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=tr1/W7JSLxPYmGNrsilYPo8Hn3UVj0uVYhIp6PT8/Bo=;
        b=HmwFqTgmaFBk2EOpeqwSFm+ScMet9OM1s2o21kIF0qVnk+cItfiIHwU491Pn8Q9o8a
         SF16zhM+3MnQiuD8ZGN35WZ6P5BuAm68FyIiZnZ1PmQLOlF5NhlR0cc4/JieIarLo+H1
         etecgO2xf6LK/zTCIbv9YhG2zYaqP4h2biZHh1876OT/mnCkdDukmkw8yAmkgTWFjBik
         nzI4jILiuvsukdpVNo6RyTSOvCwPybhJ11g0hqReZ+D60HfgSoajqdL1hsOX7a1KMyq7
         ernJXWbvLc0r4jxbD00XJIi4mWRc7R9w4ZYy9tDT5/FUyyrIpg1uDyygNAlhcwP1lvT7
         9sIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=FpA4hhyA;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=lPpN6pTa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y125si8338751qkc.128.2018.03.16.13.38.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 13:38:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=FpA4hhyA;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=lPpN6pTa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59465 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eww7Q-0002X9-Fg
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 16:38:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1L-0005mg-63
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1I-0003Cd-OV
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:11 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55730)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eww1I-0003BW-Eu; Fri, 16 Mar 2018 16:32:08 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 4A23C60F6C; Fri, 16 Mar 2018 20:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232327;
	bh=/eCsgLQSA5KHnEe41gnOXtRGEqqomhKq/bclOqgGKng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FpA4hhyABD8NAJU5GhgoOa2UoVkOUKLoLviJbYO3ljSiEEvxLQJ/KJCpXLt/JaMi3
	z6QqOvqyHQyYe497LiDQWPX4ePxswUEgBcZyWSjafInKl/NmzNmQl8+Se13gdYcTKV
	X7Tghf9WDJJaTBz0bH5JylOVpaO6O6cY4BOQGULQ=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 4936060C66;
	Fri, 16 Mar 2018 20:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232325;
	bh=/eCsgLQSA5KHnEe41gnOXtRGEqqomhKq/bclOqgGKng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lPpN6pTaLEWg2mj8iyxF9aMqakH8ky6yAk2vLRiE2Tyxw24p0cnlvkaXrrvuumQly
	tUZd59ufV74e+mTlIxjsyNNwwMm0auhbm3AP4WFWloMnkJ1mDqz5IIpOksZIhdSavQ
	smwK9pTNcLa6aIVt0QrPeaMS4llVubLB+kAAICsQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4936060C66
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 16 Mar 2018 16:31:05 -0400
Message-Id: <1521232280-13089-8-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v3 07/22] target/arm: Fetch GICv3 state directly
 from CPUARMState
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
X-TUID: 7oMAaD4AaRJ1

This eliminates the need for fetching it from el_change_hook_opaque, and
allows for supporting multiple el_change_hooks without having to hack
something together to find the registered opaque belonging to GICv3.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 hw/intc/arm_gicv3_cpuif.c | 10 ++--------
 target/arm/cpu.h          | 10 ----------
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 5cbafaf..801f91b 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -29,11 +29,7 @@ void gicv3_set_gicv3state(CPUState *cpu, GICv3CPUState *s)
 
 static GICv3CPUState *icc_cs_from_env(CPUARMState *env)
 {
-    /* Given the CPU, find the right GICv3CPUState struct.
-     * Since we registered the CPU interface with the EL change hook as
-     * the opaque pointer, we can just directly get from the CPU to it.
-     */
-    return arm_get_el_change_hook_opaque(arm_env_get_cpu(env));
+    return env->gicv3state;
 }
 
 static bool gicv3_use_ns_bank(CPUARMState *env)
@@ -2615,9 +2611,7 @@ void gicv3_init_cpuif(GICv3State *s)
          * it might be with code translated by CPU 0 but run by CPU 1, in
          * which case we'd get the wrong value.
          * So instead we define the regs with no ri->opaque info, and
-         * get back to the GICv3CPUState from the ARMCPU by reading back
-         * the opaque pointer from the el_change_hook, which we're going
-         * to need to register anyway.
+         * get back to the GICv3CPUState from the CPUARMState.
          */
         define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
         if (arm_feature(&cpu->env, ARM_FEATURE_EL2)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1e7e1f8..f17592b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2904,16 +2904,6 @@ void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHook *hook,
                                  void *opaque);
 
 /**
- * arm_get_el_change_hook_opaque:
- * Return the opaque data that will be used by the el_change_hook
- * for this CPU.
- */
-static inline void *arm_get_el_change_hook_opaque(ARMCPU *cpu)
-{
-    return cpu->el_change_hook_opaque;
-}
-
-/**
  * aa32_vfp_dreg:
  * Return a pointer to the Dn register within env in 32-bit mode.
  */
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

