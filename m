Received: by 10.25.0.144 with SMTP id 138csp378055lfa;
        Wed, 19 Apr 2017 10:42:01 -0700 (PDT)
X-Received: by 10.55.78.201 with SMTP id c192mr3961070qkb.81.1492623721710;
        Wed, 19 Apr 2017 10:42:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 25si3051565qts.101.2017.04.19.10.42.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Apr 2017 10:42:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org;
       dkim=fail header.i=@codeaurora.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0tc9-0008BF-3M
	for alex.bennee@linaro.org; Wed, 19 Apr 2017 13:42:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tc1-0008Aq-KH
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:41:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tby-0004LI-Iq
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:41:53 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37494)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1d0tby-0004Kl-E2; Wed, 19 Apr 2017 13:41:50 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 8408B6110F; Wed, 19 Apr 2017 17:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623709;
	bh=JglSadC0Al4BPQ25hgChOtMpAlVa9OJ8BceFBOsPFIs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e8BlNJVfnPju4lBlapJsz226A4HuqhGTfYHR6qND/ngjo8H9MWA8KNoZ+Epq+JYmz
	u75wH8LH5DoH/tuP2iTZMOko/2srAP7LSWBjUBZHcvnV1QlVi3O4mCAxvQ7DXkxMOt
	fzgnW3oNTSdESrp7jPOE7E5Qywqxv1oZBI2jYLlc=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 8BE71610DB;
	Wed, 19 Apr 2017 17:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623709;
	bh=JglSadC0Al4BPQ25hgChOtMpAlVa9OJ8BceFBOsPFIs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e8BlNJVfnPju4lBlapJsz226A4HuqhGTfYHR6qND/ngjo8H9MWA8KNoZ+Epq+JYmz
	u75wH8LH5DoH/tuP2iTZMOko/2srAP7LSWBjUBZHcvnV1QlVi3O4mCAxvQ7DXkxMOt
	fzgnW3oNTSdESrp7jPOE7E5Qywqxv1oZBI2jYLlc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8BE71610DB
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Date: Wed, 19 Apr 2017 13:41:13 -0400
Message-Id: <1492623684-25799-3-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
References: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH 02/13] target/arm: Check PMCNTEN for whether
 PMCCNTR is enabled
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
X-TUID: oERbGcZBA95k

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8cb7a94..8888391 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -964,7 +964,7 @@ static inline bool arm_ccnt_enabled(CPUARMState *env)
 {
     /* This does not support checking PMCCFILTR_EL0 register */
 
-    if (!(env->cp15.c9_pmcr & PMCRE)) {
+    if (!(env->cp15.c9_pmcr & PMCRE) || !(env->cp15.c9_pmcnten & (1 << 31))) {
         return false;
     }
 
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

