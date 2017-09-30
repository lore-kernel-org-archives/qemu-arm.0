Received: by 10.223.197.9 with SMTP id q9csp1227473wrf;
        Fri, 29 Sep 2017 19:09:41 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCmOM+8NW0F77Z3ynMuCwxwDBifxuJSwlekPlyrRcX7Agjat7DFkFzuodNA4t6QS4xhdkSq
X-Received: by 10.55.15.65 with SMTP id z62mr6159300qkg.2.1506737381189;
        Fri, 29 Sep 2017 19:09:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506737381; cv=none;
        d=google.com; s=arc-20160816;
        b=ot0p6OkeJJXyq/39zrGtrNBU/A8k8voKDGnP/NdOmwz1yi7OrEXRoscUUYOoS/8sPI
         QSTjMm03UqltNYm106xuTUZggfsw1Av5v9UFvQlLTSaML9eR9qDo+XgigQKUPsLhz0CQ
         XH2SLlbICW2LwwBF8TxO7IFY3ap2Jm6pGQoO/Iy9vTnBXDGjyag/O7hXXxLng7dLj8Dg
         JTQLYSMaeFjCj+Il92OhEySj2IWIXkINAsJCapOQCVrCviycmn/GIvHoHLWYvi/IuK31
         meHwaGhEBMLZ2G/1xWgjo2yXyuluQBjn38Zbe4MfJ10DXPfVOjxmoPZJRXzs5nCZri4s
         v4GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=RHpS0sqFj6ngvhbxnb1eXd+6i0CJcZyinZ7n3vkWjAA=;
        b=E6hLCir305k6mNWOwT1FdsTgeyS98Mg9POk8adrlOOMacCxqSy6mYzL28OOCRvfzZU
         aWZquypuBTMLg8l1DACniQrIykwNrBq47FHpZnYBbRtPKXl355Bi4f1wErhqZdY416zp
         oS4TK9n2w0xJ5iW1REzyGyOTCCNje5hnqb0fcaHINJ6HcicW5V06fxjV1nUeG8/a2lpD
         JsImDnA0uy3AQk5anhaFCisA31ikeao3DwKYgDkl93gt1p5xYLBA4BkPuqIwKZuH1e36
         bWKewQv7VBzTN1+mljh2scYstfDt53g60NFOpxRKxodJ+lvvHDtnKq4TzhvmcXRsS1oR
         015g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=gctg3P1C;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=gctg3P1C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j68si3999245qte.231.2017.09.29.19.09.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Sep 2017 19:09:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=gctg3P1C;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=gctg3P1C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Received: from localhost ([::1]:37782 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dy7Dm-0002Qs-S6
	for alex.bennee@linaro.org; Fri, 29 Sep 2017 22:09:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7DW-0002Ob-Mf
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:09:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7DV-0004yL-UI
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:09:22 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35008)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1dy7DV-0004wi-Nz; Fri, 29 Sep 2017 22:09:21 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id E215E60AFB; Sat, 30 Sep 2017 02:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737360;
	bh=d8XN8xqfuEyhzKJuUP/swrDjX59sbIu3DwelClQUUSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gctg3P1CAuDeEBY9P2twDu2IhaR+skkUr2ac8iOJ5DEUsgxOf3oRT6HZgxaQ6gXM4
	5iaUL5Tf22TRMqUhJlokshlG/hJJxZcRUSt4MEdlesDKwknk6HUnw8r9f1bmAUsOXu
	fx7/FViJSz2m4VBa+N48ADCNcfycGdWKKQ6Ikefo=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 886F76081E;
	Sat, 30 Sep 2017 02:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737360;
	bh=d8XN8xqfuEyhzKJuUP/swrDjX59sbIu3DwelClQUUSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gctg3P1CAuDeEBY9P2twDu2IhaR+skkUr2ac8iOJ5DEUsgxOf3oRT6HZgxaQ6gXM4
	5iaUL5Tf22TRMqUhJlokshlG/hJJxZcRUSt4MEdlesDKwknk6HUnw8r9f1bmAUsOXu
	fx7/FViJSz2m4VBa+N48ADCNcfycGdWKKQ6Ikefo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 886F76081E
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Wei Huang <wei@redhat.com>
Date: Fri, 29 Sep 2017 22:08:19 -0400
Message-Id: <1506737310-21880-3-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH 02/13] target/arm: Check PMCNTEN for whether
 PMCCNTR is enabled
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
X-TUID: vlAYzIBL2EXs

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8be78ea..40c9273 100644
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
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.\nQualcomm Technologies, Inc. is a member of the\nCode Aurora Forum, a Linux Foundation Collaborative Project.

