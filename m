Received: by 10.28.4.212 with SMTP id 203csp4267840wme;
        Tue, 17 Apr 2018 14:01:28 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49a2SQ8hMaN6DUhApEVJ7rqp/jPTdkpzJxq4AeDpzWPIOn27nvmV1w97rypOihJn4G7p3e2
X-Received: by 2002:a25:ab94:: with SMTP id v20-v6mr2826165ybi.184.1523998888608;
        Tue, 17 Apr 2018 14:01:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523998888; cv=none;
        d=google.com; s=arc-20160816;
        b=OxDF8yQ+Kxv2P3tWoT77TWxj5jsw6N1U0QqgAELx8yqV9eLkdFzV5x2zPsQSqDZrSd
         ig4MitqwNQhzbXtLOmsyZo0Puuey/RQgkYhuMlbIIUGS01zs/e53Zfaa/uh2CVCnGzql
         uCjvd7cmSvaPLQFBRE1mOxzlpZ+NwzVdxATHm5duGqrSTdQAdFz9hgODw60emwcJioe3
         wO8LXHGGm9keq0/gO0KSDZU0XVxXrYgPqyPRAbMws3mQsi6cZnh/U9i9WIIQBTsgnGQ9
         kw9JL++/veXJtWGu7HUtnjSMh63ysfIUdJDgRD/MTv+rRQPH2Fjv4qPj6m9LsmbSAthG
         DUIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=jPnVx0158NfzwAIMne/eaMqzAmzWdX6Rapi/2y0QBU4=;
        b=rq9JT3k5fSS08FE0/Vn8KpbBYiHPpjaVFKDWmPw3pFR+jUeOEB1GmUQsZdGWkNjss3
         0gbtZjQQmAnhw9pMxdEXTzbxCT9dbar+mjVhNV0RK+/ibr61J0en9V2EhaIu3tEdbywC
         QyF0y1F390hzGb0pHtD7LrtmJcy42eqojhVqfYsGA/UXEspJVLu0F46PFiD6B+4rRLwE
         wGatD7ao+vsb6S/wiHAMHfBj/2HfnF3whb7KMaL8+S1sXRgYOkfB3f1hZbf3DqTNiB7f
         DUYRNubqDos+nrL8JKg8yLRbfcisrxm4eH3dWfdqs4w9h2cXXRwC/HSxVC7KqmD62FaT
         jHqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=CJbVFeNS;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=RMQ+R0va;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j61si2562641qtb.147.2018.04.17.14.01.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 14:01:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=CJbVFeNS;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=RMQ+R0va;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33929 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8XjE-0005C5-4U
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 17:01:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNu-0003Iz-09
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNs-00088y-6W
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:25 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:40704)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8XNr-000814-Il; Tue, 17 Apr 2018 16:39:24 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id EE3EF60FEE; Tue, 17 Apr 2018 20:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997562;
	bh=j12t68vWSVksVH18cltTYvpYPrHe0UJSCNa/Cjfrdy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CJbVFeNSW1BgWLBhq4cOpCjCrf9zAzJq6B8C6rIEVN0aMeYPRutuvAHqZOEbzx3Gd
	YWjad0KJjoEk4jnC6Pz+cDTi9/Qio65amO3AV/1H7aGQQ0mdyPsmvSrnrs3D8VhE5w
	fGVNVbKaglX8xqlfHcd92jPlbuGQgScZHLox8LAg=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id B3D9F60246;
	Tue, 17 Apr 2018 20:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997550;
	bh=j12t68vWSVksVH18cltTYvpYPrHe0UJSCNa/Cjfrdy4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RMQ+R0vaXJA69PPOasq/MQxkS45qAT7GMRSMMKU0uewvx5Fzvdwib2PZ987fXeXm4
	dNIqtRS+3pG5PwSvp2HnvXOoObMldGQjuBVuSHtB33S+EFeSxBz56elBsvvlG8ncCh
	yhcSUK7k5e4UwHlI+chkeWG0asfuLVBPwn4OzY9o=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B3D9F60246
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 17 Apr 2018 16:38:04 -0400
Message-Id: <1523997485-1905-21-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v4 20/21] target/arm: Mark PMINTENSET accesses as
 possibly doing IO
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
X-TUID: 5sYIVLBg1KEd

This makes it match its AArch64 equivalent, PMINTENSET_EL1

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3902719..046e37c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1732,7 +1732,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .writefn = pmuserenr_write, .raw_writefn = raw_write },
     { .name = "PMINTENSET", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_tpm,
-      .type = ARM_CP_ALIAS,
+      .type = ARM_CP_ALIAS | ARM_CP_IO,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pminten),
       .resetvalue = 0,
       .writefn = pmintenset_write, .raw_writefn = raw_write },
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

