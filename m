Received: by 10.28.4.212 with SMTP id 203csp4250526wme;
        Tue, 17 Apr 2018 13:39:27 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49fUWGnEkWUDUL//fTe9LxGsxMH0ObuYDRMEIi4AtLyjMxclkj8BWjt0lO19/YOfi4ephBy
X-Received: by 10.55.74.19 with SMTP id x19mr3538108qka.345.1523997567801;
        Tue, 17 Apr 2018 13:39:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523997567; cv=none;
        d=google.com; s=arc-20160816;
        b=Hhr+Qd6FeQo0zb3lfYeLhlt+FVmVnBAnCe7jBJvbKX5sRzE+e7m6ejSg8CDLii/UbK
         pFOepLWRvrkqt05rGyJbfmIRen0cMC6zAVnmLpyExp63ziu0D/k4+pgZ4CtbEpYsUNzS
         ppcqkOFpVNXrYO7cJE/ewEU0aMAn+Gg6ZjnXC5UBq/bqHGzLiMLakHOCRc/ZeJcfAQ9D
         stPzJXoi3A/7Cfh7wxZstf5HyJ0j5HqjjS3QSUj3+3ALfj4tnOeDOUTleHqgLJxS6J+M
         z4EURC5Qkfw1ie0ewI5GaTN+4WrB9WiF1szTIBYaqyV8Wc/dqpbsnO9zCmnkYdoslEN+
         C10A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=PN7Jo8L+znpH28yG0k7760w4Mk2HJw5ztsDyKWYd0ZQ=;
        b=tGKJ4WePn/6/2WjlFlqAsjqXq3sJL+BhohUnoLrGa7DpUx9U7MayL9AWOONRG1KtDw
         VD+GGkYiuZGT1goWbuq2Pl0845kQHZtnJP/JGTYNCC0H4Hp1OCaMGpsYs0jHvaxXzb2v
         ueg3TMfDhSw0NDbhqmp6nPNfbMNOgWhQenNJdVfy2OgaqGS1OO6aWoxdq42/SP6s5LDE
         iCQ3m0o+blmfl57xZnrxK443cRRFtNUjjoXLlTknASqKgidu3g9quPRqEb9Q29YQvGTh
         9PjAx8wOMPML3Y3kdLcUCzpdsYSRFKh+b77ELNSvr56MKfUNw0BtXkP4dRxYhzksctip
         1FSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=arVWf+km;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=arVWf+km;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k4si6511608qkc.368.2018.04.17.13.39.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 13:39:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=arVWf+km;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=arVWf+km;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33284 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8XNv-00035X-61
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 16:39:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNN-0002me-Rc
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:38:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNJ-00048p-QG
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:38:53 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39184)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8XNJ-00041x-IB; Tue, 17 Apr 2018 16:38:49 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id A72806076C; Tue, 17 Apr 2018 20:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997528;
	bh=NPkptfK8fRjUTa8f6+Q5DstalmW8pPsWuuMCmfr18yY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=arVWf+kmCMBJLWBnakEQ7A4ps4Gvt+2HCe6REhPVX1+nWWTBeVW7kEnlEOkKmwJq5
	Npi9jfRQJtAR6LSIOB/R/r4nUVB+J92yY957RQ0xFFpshE6+4KkxLwj+3uZABRQVNB
	n21ZeEqXWAwkM6L7quQy2JZa+oeUaLtOdeK3eo/k=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 22E906076C;
	Tue, 17 Apr 2018 20:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997528;
	bh=NPkptfK8fRjUTa8f6+Q5DstalmW8pPsWuuMCmfr18yY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=arVWf+kmCMBJLWBnakEQ7A4ps4Gvt+2HCe6REhPVX1+nWWTBeVW7kEnlEOkKmwJq5
	Npi9jfRQJtAR6LSIOB/R/r4nUVB+J92yY957RQ0xFFpshE6+4KkxLwj+3uZABRQVNB
	n21ZeEqXWAwkM6L7quQy2JZa+oeUaLtOdeK3eo/k=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 22E906076C
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 17 Apr 2018 16:37:46 -0400
Message-Id: <1523997485-1905-3-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v4 02/21] target/arm: Treat PMCCNTR as alias of
 PMCCNTR_EL0
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
X-TUID: NAjPYrNt+aUz

They share the same underlying state

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 485004e..83ea8f4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1318,7 +1318,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmselr),
       .writefn = pmselr_write, .raw_writefn = raw_write, },
     { .name = "PMCCNTR", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 0,
-      .access = PL0_RW, .resetvalue = 0, .type = ARM_CP_IO,
+      .access = PL0_RW, .resetvalue = 0, .type = ARM_CP_ALIAS | ARM_CP_IO,
       .readfn = pmccntr_read, .writefn = pmccntr_write32,
       .accessfn = pmreg_access_ccntr },
     { .name = "PMCCNTR_EL0", .state = ARM_CP_STATE_AA64,
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

