Received: by 10.28.4.212 with SMTP id 203csp4252992wme;
        Tue, 17 Apr 2018 13:42:43 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+raNYpJHnbPGKfBZwo01qQAaLEkRBu4WE0XTyazI9b5c44KLz+G0DNMKfFo19Z1m5iDJIg
X-Received: by 10.200.1.143 with SMTP id x15mr991534qtf.413.1523997763511;
        Tue, 17 Apr 2018 13:42:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523997763; cv=none;
        d=google.com; s=arc-20160816;
        b=Pr19TKkWW0ufJseAsrNvWWmWFVebhoAjKz+yXC0Q2Kp3exMG7pamPNHMdRshCqHcbk
         PrbY/at+oqBa5swODTCcmP1k4N2rrf9umczH2ks3ydCLGtVnE+3Pik331E5VPHtB4ksg
         UovxZvBx1Z4a49+cOYUxmSTLAG/69dWZKlyN4ulU6/ctF/UeFx09ISG5jZDdA7BzHeuh
         R94HVpD7J2RFWbRFMwgxXF2zCYvDbrpqXfWue4ksWmJAihCxHK2KQ5Gsyz1b+XzmWZuJ
         zTq5mZqIc1gOl4DNwcAerxZXpssUZUFnFFPMbmvF347MdnR8gyoUAii9M0laIcPozt3x
         /u4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=AMjG8t9e9ciFcuxvcA3R51Pr1G7TEnC276rnZlgjAZA=;
        b=u9bo67oKKIaGmgi4vftT5pICNp2pqSggCI3+jQZgxv1N3yDskspfMJMGC60r7XePOq
         7/zGHT7cG3P+IW5hPKl/kMxft3jLQgpwOpuHIX2ysSB2rNjqNt0Aq4yXUBLEOdgeBrtq
         yLOTs/tlzGqo16vKNXlDXC0e95uqaygmZSrDDqw0TRXWKRTrugSl5kFPOF2eiGX75jTp
         YU+VWYTtyd4et8suvicYHztZU04cjZgvgVb2covfm1OENnoPcdrEaQ8MqYi0DjaP30PZ
         klcnR11tMV0M3wXq56pVCEN0MfP+JrRHjhM3GCGBVwl2hez2CzLfQvdaVCh34xKWei8B
         e5gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=pIRKnN30;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=bwLYS9EK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i27si1090107qte.88.2018.04.17.13.42.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 13:42:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=pIRKnN30;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=bwLYS9EK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33323 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8XR4-0005un-SV
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 16:42:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNU-0002tW-Ob
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNS-0005IW-MK
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:00 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39702)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8XNS-0005Aj-9l; Tue, 17 Apr 2018 16:38:58 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 791BA60246; Tue, 17 Apr 2018 20:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997536;
	bh=KJt8dvo6Ngco2hLCuv7beHgfuwVUP35GryYZcXmYqQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pIRKnN30pzbYEgU+cZpO5WWXuqqR60ISLcgmy5KplinDdELvBdZ1f7vyhfaDyOVVz
	nXExhbGkPp8D6BFrSRYU1q3pFjoU6leYc0GUUVFRB7P7WWZGiPvGGDaJU6xNGTDseK
	Um6DAa+SDHxv4HUk2JbzXydsBkzlLNlN74LT8iME=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id E92356109C;
	Tue, 17 Apr 2018 20:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997535;
	bh=KJt8dvo6Ngco2hLCuv7beHgfuwVUP35GryYZcXmYqQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bwLYS9EKnCmXsT5DdlDIatyvsZYZgYe8+w27yo5w0mwE4A6Uh7hDztQ9TCdo9ht+S
	+oUZdS5l9b5jm4A/0s9WHQwUdwO21XfGKbeh1XaA7bZiO1vWVO8ZP97/4sANlWH8vt
	lrp4fAawsZQjEEkm5vodKc90Kp0yyUFU5wfPZ1UQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E92356109C
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 17 Apr 2018 16:37:53 -0400
Message-Id: <1523997485-1905-10-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v4 09/21] target/arm: Fix bitmask for PMCCFILTR
 writes
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
X-TUID: lVlxioQSENMg

It was shifted to the left one bit too few.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index de3be11..8158d33 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1125,7 +1125,7 @@ static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
     pmccntr_op_start(env);
-    env->cp15.pmccfiltr_el0 = value & 0x7E000000;
+    env->cp15.pmccfiltr_el0 = value & 0xfc000000;
     pmccntr_op_finish(env);
 }
 
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

