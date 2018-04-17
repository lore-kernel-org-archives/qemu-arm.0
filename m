Received: by 10.28.4.212 with SMTP id 203csp4250351wme;
        Tue, 17 Apr 2018 13:39:12 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+c4MUkiBTS/erkoxm1IK9eAdyyKA0VIi7yeTafyrVB4X9G2TJ5flO9RBrUbOKeniMfK7JJ
X-Received: by 10.200.15.225 with SMTP id f30mr3706426qtk.171.1523997551902;
        Tue, 17 Apr 2018 13:39:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523997551; cv=none;
        d=google.com; s=arc-20160816;
        b=Dv+1Ltvkrc7mNWazsOtmbAToiOo0rRS4cgosPRXaBRYjVoVVnrFCNrRjlpLs+EJNDg
         I3+vFV9wx2Jm9CpqAsNSUyJ9teQ7OmvSQwl/indJCoWpS/EJHW4dlaMCAylpUaDqW2Gs
         uNIzQAQreRXzK1cwZ5stvEvbt8WKR+b7tuPBmMoq0vyqUDpNyuwFM6YfCO+BAGzTtLKk
         3hGx66gitLvTsqTJir/nZScrnKGGEv5d2yoAAzStAtuiJXSOTVGxnvSIWno/GOpBSCCf
         cq2DfdvDsQ5K1AHGMBstNF7T96j5jSJL9MJyPb57OKhrBcrTWdicpe1Ho87fvaGvMNGc
         XeTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=Jl1Xo5ExOw8u7lJH+ECcDjJ4G34N5k8HcQSpIozQt7U=;
        b=y7a8AogbqMV7nD232I9MA4dQJzVlmJGEiwt6H6+aMVu3lZgEP18KYZRo5GTgroC8fK
         fig1OKJ7eBAoM6J1Hepi8znkfaJaVndxYY02IQdC5mZkIKXB4droppSRtq8iXDXxjO22
         nVdCkvbdoL4/UpomP5MUMVrYYL05Pxh2YebL2jAg20aHeMTqFcafFVzESLohYDC2+b25
         ri9fo6+W1tQM/Bz0FXMSI8Ncr/EWAPH85vgrGpCcL8YKIcMD3kfu0+uEDSc+jKy+ak5z
         hIHlY4tpwVlXFWm7BM6XYeNgsxoSq35XsoB/1GccDXUBxeQfsAiEa+vUsSzFLnKnZ7xy
         to7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=mP8Bb0fq;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=m9yBr4Ow;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 95si2205508qtb.286.2018.04.17.13.39.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 13:39:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=mP8Bb0fq;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=m9yBr4Ow;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33280 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8XNf-0002pc-CC
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 16:39:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNN-0002mh-Uq
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:38:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNI-00040B-Rd
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:38:53 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39114)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8XNI-0003t3-L2; Tue, 17 Apr 2018 16:38:48 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id A2B3D60AE0; Tue, 17 Apr 2018 20:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997527;
	bh=UbUA2qAduCpBVkHW5MjGyr26VD7c507kIQCd4dlmDLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mP8Bb0fqKrBY28hJvUyoBomtXgZ9uTPPI2LEHmheeJktiLjnUZQl9QQhOofxdQ1Ih
	a7or7elC7Xm4bAi+vgky+ZJUN6MCcwbs4A/po562d0JFJThwwOaIIzt9LaoT4o3M8N
	TVidc+xtSMu2zM2eK0ybvas/16P+YxaEQd91TCc4=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 02C0560385;
	Tue, 17 Apr 2018 20:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997526;
	bh=UbUA2qAduCpBVkHW5MjGyr26VD7c507kIQCd4dlmDLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m9yBr4OwvIqYcyo54C62M8kOdRJiZfWtqQNUBqYD7DEAdUOKHOC6r4IYgt0GG3iM6
	0yqslINzaQpXsKtRbelUTr/euV3S2aHSDiomaNxfWpYhkfOxWmkhVL89zIC0D/dTPk
	KwaDA6uxWZHfI2QE0xVGwiIhnsxOf3zp+v4rwU+g=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 02C0560385
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 17 Apr 2018 16:37:45 -0400
Message-Id: <1523997485-1905-2-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v4 01/21] target/arm: Check PMCNTEN for whether
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
X-TUID: MjqNTQe2ZmBq

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b14fdab..485004e 100644
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

