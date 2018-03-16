Received: by 10.28.91.67 with SMTP id p64csp1284385wmb;
        Fri, 16 Mar 2018 13:45:45 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvyshAAv42Z3mOM4HTrOq2DE+cmEHAmtC/Q87VsKeVnlXlltpuFDlTX9uJHdkN1w6CiF4i/
X-Received: by 10.55.134.135 with SMTP id i129mr4552715qkd.177.1521233144991;
        Fri, 16 Mar 2018 13:45:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521233144; cv=none;
        d=google.com; s=arc-20160816;
        b=GIGvCE0W8r/wTczVY2csO0NqS0ST0IwD1r2Fu7cdLUOiKDMblKnVRINppPdv+Et67x
         qnqQ3+r/XbCbhixXWzYciGc1y/5Fb6jBPdtJ3fVe7mFO5krNGjbcEGA94+A9jnUB4169
         JDjWXnHHtS6LcJ3q1JTL/SfK38mHQlmlUKuNshm5vv7yOJWbz+aX1GJqjZ/aaM16KZ6U
         lak4HEM/Gwv2LkiwUXyHGa8AzqAARhBomGn4padhXSL4ch0LxAEn/LwykWc5b5rFUtQd
         Oe6P0ZGhd8Dsvk+2XXIfw0x4OSNC4XqbIY3QtlRP7+NNx2kXp7EiGawxyW+KGw1aAoNk
         J4fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=c2AxPDLD6//kI31zW4wvcop0118hqssNnMrdMh1oNcM=;
        b=vL8Xva7yvnkgf0z0ceG6nja+esJFF5UvlkcoMxDGt8E9VaIGvJVzoag/pGE/837vf9
         gP4u3v7T+goa/ghbyS8ldhsY/w4RFQkHnjlL++XxjVP4FP3XPi7hZQgsC07cSi8t8Cpb
         06FyFdtySKL8PqSjqClfEdoEyDCpui4PO4zIw0c7CJhKG2KGVlAn8dO5sJAJ7ox0xQXF
         MVeMl1RPnzPeIHnQTedOxWd3SHI1e+0WKJV1548uFBNlRlsvxko5lKGO6nlB8mdGLNDX
         kNOAgl/8rEPGZa/tDgdk4iKFy8ra+9sqFw0FgNXQYWOllAivX6rXfX2/6DY3zJGt5waA
         Vrow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=GelHzmf8;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=PLofwU59;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n7si8559401qtl.227.2018.03.16.13.45.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 13:45:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=GelHzmf8;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=PLofwU59;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59530 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ewwER-0000pm-M3
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 16:45:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1j-00068v-AG
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1i-0003j6-Fx
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:35 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56852)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eww1i-0003hn-6m; Fri, 16 Mar 2018 16:32:34 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 0DCDF60C54; Fri, 16 Mar 2018 20:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232353;
	bh=MU0rboX1g0yXQDqkflH/sfVouCJZviPyuhiDzS9Sde8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GelHzmf8CCSBtDEpJUGC925+kMpbPVJOrgqi+DpLhkSm1OSg0ueJTIF5pAgBA5oWe
	Hprf0zn9HufnGpl7O18PSAsIOENoAbuSruqNEeVkAEZAELS07ARDn4GjrHZ1tbhSK+
	44G3hjdybpRXtOQaBK8AyMUET8AVLw0b5HEvyusE=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 0122660FB1;
	Fri, 16 Mar 2018 20:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232345;
	bh=MU0rboX1g0yXQDqkflH/sfVouCJZviPyuhiDzS9Sde8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PLofwU59XexJuPQ8TLd0TWPOs0Lmjlu8C/0L1uDehxQKHifJsIpJ3WbouDHHownrT
	reHuj3PRwMYmWsYncLXea1p4vofS++EI6UNI6s9tvVxBKrxWXr6nVrPcUOgVJwazpb
	Q2rVIn08UmjHJtEpdqIZUacvRA4+8Ipx2r7Wvc/w=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0122660FB1
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 16 Mar 2018 16:31:19 -0400
Message-Id: <1521232280-13089-22-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v3 21/22] target/arm: PMU: Set PMCR.N to 4
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
X-TUID: IdGbKIN+GAx7

This both advertises that we support four counters and adds them to the
implementation because the PMU_NUM_COUNTERS macro reads this value from
the PMCR.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 679897a..06e2e2c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1575,7 +1575,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .access = PL1_W, .type = ARM_CP_NOP },
     /* Performance monitors are implementation defined in v7,
      * but with an ARM recommended set of registers, which we
-     * follow (although we don't actually implement any counters)
+     * follow.
      *
      * Performance registers fall into three categories:
      *  (a) always UNDEF in PL0, RW in PL1 (PMINTENSET, PMINTENCLR)
@@ -5192,7 +5192,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             .access = PL0_RW, .accessfn = pmreg_access,
             .type = ARM_CP_IO,
             .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcr),
-            .resetvalue = cpu->midr & 0xff000000,
+            /* 4 counters enabled */
+            .resetvalue = (cpu->midr & 0xff000000) | (0x4 << PMCRN_SHIFT),
             .writefn = pmcr_write, .raw_writefn = raw_write,
         };
         define_one_arm_cp_reg(cpu, &pmcr);
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

