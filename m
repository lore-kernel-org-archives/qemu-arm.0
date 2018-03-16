Received: by 10.28.91.67 with SMTP id p64csp1282068wmb;
        Fri, 16 Mar 2018 13:42:37 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtTmToXsLYzEfUb9tOFpO73LEhMcT2fkc03oIQGpW0ZUOi6x7ZJOqw1zzGJvBe16dOxH6G/
X-Received: by 10.55.99.88 with SMTP id x85mr4783385qkb.142.1521232957378;
        Fri, 16 Mar 2018 13:42:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521232957; cv=none;
        d=google.com; s=arc-20160816;
        b=KhsoQQPEgFeWcJXMLQmpmzcsAoexH3s5abTdyrq6GW1dO/bFk1tq4NowGXPe/DI8pe
         J+pDxRijN7KLXD788c9oS0KvvczdBESIVFpybJB7fOFbmhwdVJArOAWBoEZUb7IFxFrq
         YySiB6zgffVel9H+4J2NjIvwRM5gtJRzqKj/WAMx5wP3h58ps/lnYFpUG1myVpsL4Z3b
         2tt6StC+NQi5QieLncBK/1jcsfFlzsClcGvPGXDX6oWWEDONhXszYK1ARm5eXMribdre
         EFMIV15+hcUj67k6ubxZRdhuoZytteGkeS57Yy3IzJz5J/Ta+5tzKYfugQsBsfmSyFTH
         8Ecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=cf08+3ofaO0UuREe3rZMk7XONrzEESQqEEFpTzIlFv8=;
        b=jl9y/R9gW6b+DIbSOFLwWhkhkTxuGlwXwkPn4Q5sBC7xmy7RNiHPcOEAtby1qap9/l
         GuKjofL+gcEb8S375Z5Or9Xx2nzdVMP3pR8YGTxJyOqs/kdnQKZ07I1+xmUPksU/9Ewe
         BO5DSxHo3cOdmhUWCrEJtpVH2g0wLOVx3Yd9qXSyKSC7rEcivjU6NWlKcLAsz2Ge9pAy
         3fxIo7TT0kirvMCkUyEmIj7B0T75iVc79C3xe6+OiBuMDK/quH/1sIG9Cq0K0S2MTcSz
         5mIHIRYqnoEKYowX+X53fO5I4e0impSxarybuMvNmImveeOfHHM/sVbMQ8VkXzuD449T
         ArjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=l6zjIb64;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=I88OiByO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u125si1008062qkh.30.2018.03.16.13.42.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 13:42:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=l6zjIb64;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=I88OiByO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59500 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ewwBQ-0006M4-R9
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 16:42:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1R-0005sv-EH
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1Q-0003Lw-J3
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:17 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56094)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eww1Q-0003Kv-CT; Fri, 16 Mar 2018 16:32:16 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 2975E60591; Fri, 16 Mar 2018 20:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232335;
	bh=Mei56ULqGTG+C/oz1buEngvG2VoWQjuJdwMqt+rhk5Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l6zjIb64i0/xm1FeD2+KNVs71xvIEyAVEabv+NzJ4HnEc6Tt8CKafBdb0ItHSdXFI
	5geDGJ2GIJJmGy+JLKj4F0fb5t19N2QvDGdE1R0/62gxi+6lyI0FDIWOL/bk4SL2Mp
	68RITqvlPjFJaU8e+RGCdmrpvtvTRhcwVOhrnywM=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id B97A360F94;
	Fri, 16 Mar 2018 20:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232330;
	bh=Mei56ULqGTG+C/oz1buEngvG2VoWQjuJdwMqt+rhk5Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I88OiByOZlYos5hFdMp1VbRCWT5SkacFLp49X0JrxCu/kFNE+VFoTFO1TRb781GoP
	T8j56YorD4kHPmF75lD+fItxA1XsqVtZKNdrNtDKRvnQGisdSygEjnaBM635ZlDGZv
	TWmOX2CW5NCHebwvnQKeklsVVNrB4NpSA6YFTfkk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B97A360F94
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 16 Mar 2018 16:31:09 -0400
Message-Id: <1521232280-13089-12-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v3 11/22] target/arm: Fix bitmask for PMCCFILTR
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
X-TUID: L1929J0eVcId

It was shifted to the left one bit too few.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 50eaed7..0102357 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1123,7 +1123,7 @@ static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
     uint64_t saved_cycles = pmccntr_op_start(env);
-    env->cp15.pmccfiltr_el0 = value & 0x7E000000;
+    env->cp15.pmccfiltr_el0 = value & 0xfc000000;
     pmccntr_op_finish(env, saved_cycles);
 }
 
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

