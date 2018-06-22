Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1251683wrq;
        Fri, 22 Jun 2018 13:36:48 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKOO1YXcBdvqGZ9uFuOpiAopSTVwJ2I3RXuhlAQb3qJCgK+zG7dRfpI9sBU1OfI1zC89slY
X-Received: by 2002:ac8:249:: with SMTP id o9-v6mr2825057qtg.355.1529699808142;
        Fri, 22 Jun 2018 13:36:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529699808; cv=none;
        d=google.com; s=arc-20160816;
        b=yQ7TG//sqJ/KmlP/0GH/EHwzLBbdYMHNX3XGxp9NAoVM6fak7/RP/3WbGiXzo+N3Qr
         e9lp3XxMYk9gpsTX7pJOO3oVJE56eVaXN1NWyhkxns4M/zvCc+LHSBTG3en1sRr1khsr
         HlI/vF2o7m3ANN3s39upQFrMW9rE/5lNdtT+Q9oLOiu8RBrHLN2p9T7M9Wfos7zDKNsE
         EkD52Ynfq1TaF5jHfXXpULasq40WyMDJJ7NNaxFA2jFvOxH56D9crFFXai0MpGoRLe/X
         Tk3XYXSk1aOjQbnW1LC7kXjS9/AW+2mVGxjJOyPdsFW25kO+ydC7sIMN4D3CMmEa1UP9
         mr8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=cRCV9ttg/na8yALKM0ZC1c757ilTZqhba8mDOlKmlmk=;
        b=y1IyC1gs/yN07SYBMfgqn4HiEzXGHjopF3B9n1ScxCbhPen/SG9OTbCNz+NxjYezt4
         JFqxVVppleb2wgOrd6JBg7eRLST3yOXY/SsZp4x+rAJ1m2ekAFnYpC87Nu4gJKXY+db6
         lhb9tKyiGAVsBTsmMxzVQwXWVFiS5Fp2c1AqxpYc3adhQ4t55suSm9BkM1AC38NqFbpw
         wi+5HiN6gXmSIqmv28DeoHHnG9hMhcJ773HAZ3iot9bRYIzTmBruN2lU2mcOP3CNxDMy
         /VTk/KSMeYX/Bcn7t2w3ar2Mu/XL0iLZNYrFsZ3pHEduxcnOTRtVJ7fSTdyV9XYj+jZI
         ibKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=HvHQjRCj;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=iAE5Qlr7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a1-v6si1563495qtk.11.2018.06.22.13.36.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 13:36:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=HvHQjRCj;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=iAE5Qlr7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWSnX-0005Kb-KL
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 16:36:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSjj-0002HX-BL
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:32:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSji-0005VZ-JI
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:32:51 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45986)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1fWSji-0005VB-DT; Fri, 22 Jun 2018 16:32:50 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 844BC60B15; Fri, 22 Jun 2018 20:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699569;
	bh=VPE/xeceM58k5Qp2QWI5nMHZ/gBS9350bVqa2fM8oj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HvHQjRCj/IXre3cUAJV1hLebAH8A4dao30y5KenYRJM9Xp738kQL0uWy0phzuyLFf
	H6/4n7kUdqpqbXE+DhOmdRweoKXfDbKSnz76bSWQpkzfTv1X+vMidJ5OAChC6OHDn/
	B2qO6Q7N+/n6YOBHLQpd1qgaXgvqjt7IDdLblNPw=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id EB53360AD8;
	Fri, 22 Jun 2018 20:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699568;
	bh=VPE/xeceM58k5Qp2QWI5nMHZ/gBS9350bVqa2fM8oj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iAE5Qlr7X2g6puf+z5JbHEsg2rospc3/FKmSEv9Bn95+iP42OhZTFjKVtnqfTv9X8
	FMmVz2+EiCi9zgSFb2kkpzpKYjR0ERxKJV3TG7UKRyEo6n8cM9AvQbGKH5kk3zSSmy
	jS+PX17/gVc5Dtqz+T1+s/FAj5L2SNVqfFLsoYY8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EB53360AD8
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 22 Jun 2018 16:32:26 -0400
Message-Id: <1529699547-17044-13-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v5 12/13] target/arm: Mark PMINTENSET accesses as
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>, Aaron Lindsay <aclindsa@gmail.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tw/pEJexTG0Y

This makes it match its AArch64 equivalent, PMINTENSET_EL1

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 96667e6..38fb6a2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1763,7 +1763,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
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

