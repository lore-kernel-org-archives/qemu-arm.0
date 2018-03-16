Received: by 10.28.91.67 with SMTP id p64csp1281377wmb;
        Fri, 16 Mar 2018 13:41:45 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuYorcv7cTx9x1x/oOgQ+bfXUv7J+ZoYBoIomfFSiaVFzHQaUm+TG2vNtOqDNVlPfOcjfiJ
X-Received: by 10.55.142.135 with SMTP id q129mr4741605qkd.222.1521232904992;
        Fri, 16 Mar 2018 13:41:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521232904; cv=none;
        d=google.com; s=arc-20160816;
        b=ij+n0roSUGyfflVwbyYxdA8+vemoN5mEx6ZKgxBMBqSIjKSBuoAcgNojrUEVInEYMu
         I6dqtSwq3qn+TcGX/QsbtX4Xloeahf0Pb0+U3UKh+M73XGu86UXW3WQZeAwmywXsRSbf
         PpQqFzcI5pZGTEeSsIOp6wNH9/VIhtZr5MMRylzCWkezOYN72V53D+UBhmBhgZb7AGnJ
         gmGkmwNoKOiuCHyRjp1JxR/h/Js6YqtpRk1SYExIcuBqJ+/z9Aiujl4hP96uu0TYnI1q
         rothg8QoMUc5AoRpCraVwfbrdkZviVwVyi8qntLlANXJIoH2Yg1cxIQ/q6ailTZKwMb7
         e17Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=afFs48gHFmjUkhduHyer8R8QgFVfj8LultpFLziN2qU=;
        b=Wg97gfZyzQs0laI8N2U38TdI1q2Xg92Q+BfznfJsZ3RXMOA6Z5H4/VIp27MMDT5k6B
         qc+kk88dX1aYCrVLdzxCS9iPNkozvK0utmL8R9VkuGCsysIrD5gZNudFnmTttwVXYc4X
         wivbdcnAONMo08tFBxo3/FdNGUEWzNVKkbM+7hiFIQrdK1aqiQiQIkp/TBKlwFKXvQ2l
         GGzQaL6Xks344V0cxPt/aEiOn2UQy506r6sAKrqjEsoMVRj3/MqvzJJ+TgzlZujvxtZY
         T9/orhklModX4iqz0KQf6YykvhiZIoGJEXgH0bQZeftoVP9G5gS72SpTrOQK/s/2WXG7
         Ho0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=h1fBb5Ic;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=nKKsPCbK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r195si8318470qke.466.2018.03.16.13.41.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 13:41:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=h1fBb5Ic;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=nKKsPCbK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ewwAa-0005Yn-Di
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 16:41:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1b-00062h-DJ
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1a-0003YM-GB
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:27 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56522)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eww1Z-0003WZ-RB; Fri, 16 Mar 2018 16:32:26 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id B045F60FEE; Fri, 16 Mar 2018 20:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232344;
	bh=8Ip2lN1UsQjJPYSqRZ/JB3sY3lBmzptrUBIFSp14MBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h1fBb5IcqVNyEA67Dc6Isa+Oh4aImwExoOYCrBoIhf8bq/2hacAwnyp8iEMVdwGv/
	RVGGxidggzYjtyQ2okhb66g4sR2rwoOBoH3cffXlQ3SL/u0u+4QB8pnUABufNn4bco
	TCQy8woQ/m57X1bCUWQr26X+rxqaaaffqdwgFc9U=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 37CAD60F8D;
	Fri, 16 Mar 2018 20:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232339;
	bh=8Ip2lN1UsQjJPYSqRZ/JB3sY3lBmzptrUBIFSp14MBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nKKsPCbKwtphSFbJbOmxt7nC70UK6NIoOuyGhp8JLdqE7qmLr0/UAsJoP9TtfWkul
	nqLTia6rG1zfoo3Ck3Wwl+w23vH/RM94Pg383dd4o2ANvAm5teOFfsLffKi5Yr8QYb
	TAtmyqk4C2wfJrJ+0gyMDvtEn6bhQygToH6d2ris=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 37CAD60F8D
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 16 Mar 2018 16:31:15 -0400
Message-Id: <1521232280-13089-18-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v3 17/22] target/arm: Split arm_ccnt_enabled into
 generic pmu_counter_enabled
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
X-TUID: DrSrG4CWjKmc

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f5e800e..2073d56 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1009,17 +1009,22 @@ static CPAccessResult pmreg_access_ccntr(CPUARMState *env,
     return pmreg_access(env, ri, isread);
 }
 
-static inline bool arm_ccnt_enabled(CPUARMState *env)
+static inline bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
 {
     /* Does not check PMCCFILTR_EL0, which is handled by pmu_counter_filtered */
-
-    if (!(env->cp15.c9_pmcr & PMCRE) || !(env->cp15.c9_pmcnten & (1 << 31))) {
+    if (!(env->cp15.c9_pmcr & PMCRE) ||
+            !(env->cp15.c9_pmcnten & (1 << counter))) {
         return false;
     }
 
     return true;
 }
 
+static inline bool arm_ccnt_enabled(CPUARMState *env)
+{
+    return pmu_counter_enabled(env, 31);
+}
+
 /* Returns true if the counter corresponding to the passed-in pmevtyper or
  * pmccfiltr value is filtered using the current state */
 static inline bool pmu_counter_filtered(CPUARMState *env, uint64_t pmxevtyper)
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

