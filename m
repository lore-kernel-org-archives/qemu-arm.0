Received: by 10.28.4.212 with SMTP id 203csp4250352wme;
        Tue, 17 Apr 2018 13:39:12 -0700 (PDT)
X-Google-Smtp-Source: AIpwx499JMUJsdHq9vFZOtUy9BAVjk/1ogt1Rie1EEfHAMkSjKAS07A6/E592JNSITYjL+I3TDZA
X-Received: by 10.55.188.196 with SMTP id m187mr3655010qkf.71.1523997552027;
        Tue, 17 Apr 2018 13:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523997552; cv=none;
        d=google.com; s=arc-20160816;
        b=HlKlmhLM4Pnr/lShYX4fHWqk7yo68y9axeMhBlY5/u4N6iFmfzAV3wFlggdwWv7D6Y
         WwvLxRVUNfqA7Kpz8mi8PWfg+ad8ZHOVHVJbHwn+3Cy6XASWJ/EeYg/iiyY/wl4Ggjb3
         T1dEip/NHfQT+4pvI5ZBb9RVzsgBUuuEG/smvos5/gbjY2wgP6BGJKJDNO7wgJ0gkod1
         j6kfTWNRJWNuxXLVbxYUKxs/PrWLrMMltktCqCcbPPYb4VvUc7+qnVJXy6T/kSxnOt8v
         oVO+7OPKK3oOtiLVpUQXXjOQIcS1YbG5YcQ5YUICtXPGYFqURWcqmcQpVl3pIzUYLPZH
         lWGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=MSF4TvpPYJH1sdV42HyWeyn1oQfEJBIJDY4Rv1fs3ic=;
        b=p3TqlcwflF6dzvK2M+PDKtE2IqsW8Wu3SkBUwu1INk10cDWy/L+PIWriVNsGm+dDn7
         9r7Bhpt2DrJM4Gp8UssEXBiVQ7WmHjOlCS9wPBdF+o/uboqA07GffdF4QWbvvtr3anaA
         4hPYcnKYyo37Wb9mWDmR4VPxPxSSthnrClbl6lj/N8G/58qCc2XK94FFJBbFZS07TRyy
         1RV/MoyfuzuTbYYdwAZ25r+MM4WlTht6lMs08LtkVy2MPiOZJ8JMUXsJcT/Ho3KToiDl
         uzF7eB+p4XynF2s7/6Uzp9uoEN01/Iyj7/nhS9ETFl04J0YNZ+XwJmDGDGdoahprRf8P
         s8jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=nRG5aolh;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=nRG5aolh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a5si5732779qkf.13.2018.04.17.13.39.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 13:39:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=nRG5aolh;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=nRG5aolh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33281 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8XNf-0002qn-Gk
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 16:39:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNO-0002n9-IW
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:38:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNN-0004dN-2t
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:38:54 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39386)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8XNM-0004UD-MJ; Tue, 17 Apr 2018 16:38:52 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id BD60A60863; Tue, 17 Apr 2018 20:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997531;
	bh=8ZwGt9S8wN+TDtUgrUeeQPvEJTdcwJRbebjS9C603ZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nRG5aolhEtgB1O5GiPg+3b8iY0d+8hPR6pxlB8VUv0iDCHOJTt2pLJthhWUkbTB/N
	v21lSYsxnUT6mG2MT1l1aYDydecZOHZ4VXih58wS6XX/XdtEzrt3eFKr2kbK+qFVWc
	vSWv+iLhdRYjNDoKk5x269vSszU7VF77m6vlM5AQ=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 7603F60F74;
	Tue, 17 Apr 2018 20:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997531;
	bh=8ZwGt9S8wN+TDtUgrUeeQPvEJTdcwJRbebjS9C603ZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nRG5aolhEtgB1O5GiPg+3b8iY0d+8hPR6pxlB8VUv0iDCHOJTt2pLJthhWUkbTB/N
	v21lSYsxnUT6mG2MT1l1aYDydecZOHZ4VXih58wS6XX/XdtEzrt3eFKr2kbK+qFVWc
	vSWv+iLhdRYjNDoKk5x269vSszU7VF77m6vlM5AQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7603F60F74
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 17 Apr 2018 16:37:49 -0400
Message-Id: <1523997485-1905-6-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v4 05/21] target/arm: Fetch GICv3 state directly
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
X-TUID: PhGJwnYOryZg

This eliminates the need for fetching it from el_change_hook_opaque, and
allows for supporting multiple el_change_hooks without having to hack
something together to find the registered opaque belonging to GICv3.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 10 ++--------
 target/arm/cpu.h          | 10 ----------
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 26f5eed..cb9a3a5 100644
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
index 04041db..ff349f5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2915,16 +2915,6 @@ void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHook *hook,
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

