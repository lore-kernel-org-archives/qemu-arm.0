Received: by 10.223.197.9 with SMTP id q9csp1227630wrf;
        Fri, 29 Sep 2017 19:09:53 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBM7Xj6HQSehUtRxCOY55DNrs0PIN9Q8d/JOHgN2ky9agDjw46412mFJTFXj0vhmw/DYUJH
X-Received: by 10.237.62.206 with SMTP id o14mr9286107qtf.286.1506737393528;
        Fri, 29 Sep 2017 19:09:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506737393; cv=none;
        d=google.com; s=arc-20160816;
        b=Zw/9AgFVenc1egBc/nTiiDchIgEijuMuJM7Uk1171XWNOrnX8GJFCKt2uePBJtvtuy
         sZ55CH2X8JMa4H5ojMMIYwuodbsp6gP7vRwrpVam9EU85XqoLlEX16qc0AlX5LBsxjtj
         CxE61/Leur6ROfULMs4ALwDyH7uOZgShZLFPEHMjr+6VTvpNuQixASaBaytFNxetHY1/
         5Ckn0NBNDgqk6gWpsRWaJwGiorSw2MQbmUABoXtuGDg8Lfa8eSAuEl3jgcZrWDx4hU56
         Pa5rs8qpU3l7VvPmZ8SQXleROEvYyQagc21jrkj1BDteS4o2DD/lG1gEAHKFYbHe2vGs
         Hxrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=/5STIS7t9a5qvU13zDT1JRAx5q6EBFHlu4lwKejep5s=;
        b=pXvTW042d1yOtKlmimKmPPDVRx80I74XIvK3IL7ltsAVm207UzAZpFSK1zhTNAXsst
         B1nWccw3QvYnQtw/em9HjHSqniwP+7ztTXqdENrpxdx/7Zy7zU78vucHNp01GDWwyuyY
         m9l3EIX30wpWXC7XHegaIYaa5AYD3QwWOT9zns8F0PGknjyytzRG7i3mTs5TW/erykSr
         qzPZUzQ4d/mebP+y1SEoUvwVoGeh6OLOdaaMv9Dn06CyVhQa5pBaxv1Zav4ajOPNLbtw
         rgFV9p2xR9OmyOwRhrPBR1YnkSzsTjY2pb6zro2VPEa5upRSZN9DpNfaBWUpluNqYEBL
         cQJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=X48Mkcbj;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=X48Mkcbj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p36si3717049qtk.501.2017.09.29.19.09.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Sep 2017 19:09:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=X48Mkcbj;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=X48Mkcbj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Received: from localhost ([::1]:37785 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dy7Dz-0002in-8D
	for alex.bennee@linaro.org; Fri, 29 Sep 2017 22:09:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7Dd-0002Tq-Rv
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:09:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7Dc-0005By-Nn
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:09:29 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35370)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1dy7Dc-0005AW-H6; Fri, 29 Sep 2017 22:09:28 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id BF6DD60CA2; Sat, 30 Sep 2017 02:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737367;
	bh=ufsyfBOcLYFg4J6yFq4pZLtVLSHmh3jUgqwqaMptWco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X48Mkcbjp3fOpxpOiMRXNCp8mrwPvhqmh/FX5j/+tVSdQoI/6QPIFms1luwYwLmbi
	CC9JrYqwqLyI3os06Vhpuncl6XjlCtqbCVtoOxrJWD9xH3zrXv5C6rUZnrYVjwO/sK
	Zs4i05H5njtrWKI14hkLqzMXh6WwmdTLbr+Q88bA=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 6C94460C69;
	Sat, 30 Sep 2017 02:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737367;
	bh=ufsyfBOcLYFg4J6yFq4pZLtVLSHmh3jUgqwqaMptWco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X48Mkcbjp3fOpxpOiMRXNCp8mrwPvhqmh/FX5j/+tVSdQoI/6QPIFms1luwYwLmbi
	CC9JrYqwqLyI3os06Vhpuncl6XjlCtqbCVtoOxrJWD9xH3zrXv5C6rUZnrYVjwO/sK
	Zs4i05H5njtrWKI14hkLqzMXh6WwmdTLbr+Q88bA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6C94460C69
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Wei Huang <wei@redhat.com>
Date: Fri, 29 Sep 2017 22:08:25 -0400
Message-Id: <1506737310-21880-9-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH 08/13] target/arm: Split arm_ccnt_enabled into
 generic pmu_counter_enabled
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
X-TUID: zZixmQQV5YIl

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3932ac0..c0ef367 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -975,17 +975,22 @@ static CPAccessResult pmreg_access_ccntr(CPUARMState *env,
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
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.\nQualcomm Technologies, Inc. is a member of the\nCode Aurora Forum, a Linux Foundation Collaborative Project.

