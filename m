Received: by 10.25.0.6 with SMTP id 6csp799688lfa;
        Thu, 18 May 2017 09:11:40 -0700 (PDT)
X-Received: by 10.55.187.196 with SMTP id l187mr4828728qkf.185.1495123900581;
        Thu, 18 May 2017 09:11:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495123900; cv=none;
        d=google.com; s=arc-20160816;
        b=czYJnwk4d2h+qA5U7qA4hIBrFs9dVTkW2HCb825sCPfg30CUWw38AeRyh96YLrTLM3
         MttkTlN1ffik99iKAD1NnUtiXo1mULoXAv0ktxlfOhc9bsz8kX4G7R2fhZeYVF+2yrPs
         J42IMjjdgw2LAM4COk5dfsKpeMtbIcplHSxVTMpKHPC63RA7FBe3k7zx2dqxa0mlhjWG
         uM9BEuGX+woXj962+Ku8Ah74QySKwC/eggxegXE8ZdXeC1+GC5WAugwNacy0g0sQNy2j
         CyODC4cOywuqedkRW9lEl0jZcKh3LIKUIYLCJCvdj1ntgH8vR8DfbOuhs1yw7aqrmzvw
         UEoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=HUPFGfmvE4rGgczxsQUcc8GbvlfQI6PvZGJKYeEyd8U=;
        b=c/Fe6dps5LcwAjYyWyl0gwGPsiHNpbI54a+Be1HmpiVjYnMR2yu6PuGMjkh0rUHU9S
         /vgqTBMHYXz4TPYvnIw+fxvDu88LoGF9XQp8TZDUGkmbNy/iiu3DaA85ajvcb+lTZZUJ
         Hh8pgViRB0PH7+K2YwOnfUwpO32V6VpBggAm4KDtWtFuq3T+Qw5NuJ14b7fw2DZxX34z
         KJk7xO2yaI5UbA7+eDWymeA4mIBhals2kKbQgR0nN/LvBAi7tM+R7HNtasMeFDnJPnad
         Ufp6IyipJgt8i6ImTPD07WnzJ+Jx07FNjTQYvbhC7A3Zti06kFTHkud5XPQgqJSvy6g1
         2VFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f26si6075876qtf.233.2017.05.18.09.11.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 May 2017 09:11:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54661 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dBO1b-00029H-Vt
	for alex.bennee@linaro.org; Thu, 18 May 2017 12:11:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1dBO1Y-000298-Cp
	for qemu-arm@nongnu.org; Thu, 18 May 2017 12:11:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1dBO1U-00054i-FO
	for qemu-arm@nongnu.org; Thu, 18 May 2017 12:11:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57366)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1dBO1U-00054Q-8f; Thu, 18 May 2017 12:11:32 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 765EE8124F;
	Thu, 18 May 2017 16:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 765EE8124F
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=wei@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 765EE8124F
Received: from weilaptop.redhat.com (ovpn-120-86.rdu2.redhat.com
	[10.10.120.86])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E690717CE0;
	Thu, 18 May 2017 16:11:29 +0000 (UTC)
From: Wei Huang <wei@redhat.com>
To: qemu-arm@nongnu.org
Date: Thu, 18 May 2017 11:11:29 -0500
Message-Id: <1495123889-32301-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 18 May 2017 16:11:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/1] target/arm: clear PMUVER field of AA64DFR0
 when vPMU=off
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CuXe/HeDXFaM

The PMUv3 driver of linux kernel (in arch/arm64/kernel/perf_event.c)
relies on the PMUVER field of id_aa64dfr0_el1 to decide if PMU support
is present or not. This patch clears the PMUVER field under TCG mode
when vPMU=off. Without it, PMUv3 will init insider guest VMs even
with vPMU=off. This patch also removes a redundant line inside the
if-statement.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 target/arm/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c185eb1..4e8fe1c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -750,8 +750,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
     if (!cpu->has_pmu) {
-        cpu->has_pmu = false;
         unset_feature(env, ARM_FEATURE_PMU);
+        cpu->id_aa64dfr0 &= ~0xf00;
     }
 
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
-- 
1.8.3.1

