Received: by 10.28.91.67 with SMTP id p64csp1273246wmb;
        Fri, 16 Mar 2018 13:32:20 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtbmYMuxEz0mZ8PPQwZwszy4yi2QUCwFiH1eZHAaqjq/7HsNRrnIPSmVer61s1n1+L7T1DN
X-Received: by 10.55.113.6 with SMTP id m6mr4842576qkc.28.1521232340792;
        Fri, 16 Mar 2018 13:32:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521232340; cv=none;
        d=google.com; s=arc-20160816;
        b=QO7Uw5D7kM8jmFPWQs2UpkuHbMg/Jt8GBN5R2IvICrCV5Q4sNkgRMA9TNxuPefOlsQ
         z/7BqeFqC/cmlhSKWWNvQHBYe+GqKCM8cE3c13iz1Xayk4yTWxmqQbvBoJQWJTZOAASo
         ljhdIohWQNKpiFfPIkyx5b07vDpI+muZUcdjhYe4f6S/NoW5DuEskOS8E1UND3wE58yy
         kHdPGu24XqXD9rtCA6yhnqtJKBQl7n2ZrxC6pO4PS/MIdbL93+iwoKIszXBz8+DgUu/d
         1gCjD3DNYDudcpH8PLOi9EiQ1O90Lw6PLwUfuGmO5/nr8VA2S4JW3ea6rqvAy4Ey4e6j
         b+FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=KVYdxzZsa6nhmyCxL5QgSUVhFLnpARTNAbMcOCnBfQE=;
        b=GDeui2tMitXsKlxIfk9CdO7iE7xgZQVnGsrNcnAIiPeRnuiRSnIWJo2V+pPtKS9BF9
         0razLX5tC6epshaLDGx/cZlcsb4J/AcG8vd0hS3cwayL9BA15RmpyI5QJ+bzkZaq0o+z
         gY94oo68xNaQS6Dra31lB4EMUcPdNHpyNkYwHkngdaVI77+XCrFYH1fWg8si1oeEZgsQ
         dVv37y1Ggse2NMtAG60VT/3CbmlucWoFn2fznnw8hC+a8x60w4i4VG3znh6nsjei8VvH
         uUARy1OnzEjd4Yh0edxOTjIP6+MGrHnzbi1qvy3AZ8KLRsDqEF9lIsqtYLjv93c8slJK
         svWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=HVKaHtNi;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=X3UwNDP6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k13si8362058qke.163.2018.03.16.13.32.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 13:32:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=HVKaHtNi;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=X3UwNDP6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59430 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eww1U-0005hg-4n
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 16:32:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1D-0005cT-1m
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1C-00033w-Al
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:03 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55446)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eww1C-00032r-5K; Fri, 16 Mar 2018 16:32:02 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 47B3A60F6D; Fri, 16 Mar 2018 20:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232321;
	bh=QGACvL5j2mW267acZxwzp/A8X9+G3iPASyt8JaZBUI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HVKaHtNinm8L71hSDO9Fvp2W/3Ys2mAV1IUPUkA8yAUBUuUN18xqTou+xf7MS6h+j
	IWAtMdRT3Qb6LtAjVD82cGMRE4rIpZX0ekn60XXwFiNdqa0OSBxToQ4PgYzgODvuXt
	aW9aRzq12MdvTM/3Zx1Z2UQU6hefQnVT8KTRGtGs=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 8E6AF60C5F;
	Fri, 16 Mar 2018 20:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232320;
	bh=QGACvL5j2mW267acZxwzp/A8X9+G3iPASyt8JaZBUI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X3UwNDP6iFtvsa00aCxTJKdRYHJ/YVebPulXW7/aHnlqtPBJMRAWlf10sCzgz9N9a
	cOIgE0kMXDIMsEHRc7cL3N40LFbgpwCMesx4gSPWNj5qOF7Nrj/Iv1kdDQx1Vo53iE
	Y2SChQFmYNwrl5ERvj1ieFkv7ePQfgHIrFh5405Q=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8E6AF60C5F
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 16 Mar 2018 16:31:01 -0400
Message-Id: <1521232280-13089-4-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v3 03/22] target/arm: Check PMCNTEN for whether
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gokv/o9LZer1

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 09893e3..5e48982 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -994,7 +994,7 @@ static inline bool arm_ccnt_enabled(CPUARMState *env)
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

