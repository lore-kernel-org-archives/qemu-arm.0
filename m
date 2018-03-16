Received: by 10.28.91.67 with SMTP id p64csp1276863wmb;
        Fri, 16 Mar 2018 13:36:31 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvgZeE7aFief1kPzkbSJxwYz5IKJTGcRYpzq9s1AGf1hXrFzoqnOdSwRpJVyD/d6tfz0mMw
X-Received: by 10.237.47.165 with SMTP id m34mr5025193qtd.178.1521232591821;
        Fri, 16 Mar 2018 13:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521232591; cv=none;
        d=google.com; s=arc-20160816;
        b=skGfpECPiD5Q7GjnhGb/Cvtv2RBdbMDNhJO+44FsS8JOSpJqBj5+O5Vx2cQxFJrQiQ
         iTDH16tlkb4H+/HGyExD2hztmU7e6WnXWWcBZ+WSLziq5wx5CpaQqme0VCufzm6QbXnI
         wevIzmWSrAJVIV801Ym5uD+bJe6f3DvSWh6SgaGjReIV7vuknXFNsZNW1IXWaQKPtZhT
         bVPTjizbs4OSk3IsJmyh5A7cHxrnpkaPCOS+jIiCET/4hM1MD+YXxkTVUqOPPAr+67Zz
         wNVvyGcm6KNDGMpfD5fr72dPAKu4p8GD4XRxK4zT6Via3+epvLttelRaJ6XH3K68ROlG
         XqMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=iRXB+yLz+U8KioyvXOBBQ/ewMBUx8e+kYfwd7XBysqE=;
        b=XrI6rInOC71PV3OEClR6ZKmU7R8YieJQVRfIEiErkVsBd4Jhk3gwuXOA/tzT3U/GBH
         gvACilyH43ikENy//ZhPoMOPFjgWVaJZBGsB9gRcl5qlZriJU1QCu25aAKXideagE5bt
         UMbDQsswjXYy+DSYL9hHQ5Dd4a11hz1VePxpdqiZo6NxPpq0WmWWmeWJfC262S/+w05G
         /LxGy/7K7olmfWOVmEAdNUDlOowUZHtOg8CQpE+Qx7eeMzGXnkRZ4zKGUxKhHKHfsOM5
         5S4Iy8e/utAs1ZMlWAdtsAVvqxQT6EVfPPazvrk90C9MpC6mzyQZsDd3lpq8JerNoS4w
         SRQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Ad0hi1kD;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=FKzOinkM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o66si1315535qkf.456.2018.03.16.13.36.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 13:36:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Ad0hi1kD;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=FKzOinkM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59455 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eww5X-0000kv-CL
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 16:36:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1E-0005fx-F9
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1D-00035T-Hx
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:04 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55512)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eww1D-00034I-8B; Fri, 16 Mar 2018 16:32:03 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 4B94560F71; Fri, 16 Mar 2018 20:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232322;
	bh=F0eczBJ8qIiSvzJV57Z/jtH2JVu0o4r0fUmil4HtDUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ad0hi1kDngS68clfk0K9kdtkC/14hdhfKtE15cE8o/1AGEcj9HDpSD1zoz2FwdiVU
	QFIq6/No2RnCxV3+gFHh3IIujjfI+hC4k6/p7B3WtIC8xJAst8jf9edy+6SUkKIH2q
	a36QLmJXGCkNySAMpjjeIpytlNthxoUHZWEiBGkU=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id B3C5060F5C;
	Fri, 16 Mar 2018 20:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232321;
	bh=F0eczBJ8qIiSvzJV57Z/jtH2JVu0o4r0fUmil4HtDUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FKzOinkMW71Gjme2wGt35AVAKPEYno5uMSPj7vcD/NYJ7YSzk10BJJKbxhfZ4K3Oa
	iHh/yBDHaC8qhQLIwRIC4Hc3GZg3oV7+mWqeINVlXoUHuVAO+2N0tq2p58Q8Hi7b5h
	QafrLnZ6l+zZH9YxVmsK3XjlvCcQq8ZS+VEPf0YQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B3C5060F5C
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 16 Mar 2018 16:31:02 -0400
Message-Id: <1521232280-13089-5-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v3 04/22] target/arm: Treat PMCCNTR as alias of
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
X-TUID: OJyG1vgPgoBc

They share the same underlying state

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5e48982..5634561 100644
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

