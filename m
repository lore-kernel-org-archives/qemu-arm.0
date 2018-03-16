Received: by 10.28.91.67 with SMTP id p64csp1273305wmb;
        Fri, 16 Mar 2018 13:32:25 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsUM0MztFFtlBLVsBdz+ZiCGNZJZFFoqSlt7HoTcUj5JrB/ddxf7p/HK5vQknlanO6mBQAa
X-Received: by 10.200.51.155 with SMTP id c27mr4892602qtb.90.1521232344888;
        Fri, 16 Mar 2018 13:32:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521232344; cv=none;
        d=google.com; s=arc-20160816;
        b=gwtR6MxmGUBKzOc3oOi68z7gfgI0/FVCX8fUuwPiTdk31o4jPhycLBVFR/rVdHG2MU
         X1wwkTlCzya6adYiNhoPR3t+/xKiz5ukmkZ7cYqLNyvASp5DeVjWAEAidrv7dW7uzo5E
         7AgA+2hSlNa0kP/gX+ED+kmMh1eTGmg+fUX0Jw2LOIuy15JBJe5YPJc4cdjD53Htc5V7
         5IPpKjXR3cYR663kJdeGi8czuTQQHkkPnj7CHoDo6/4bv9GKcYe510i3U63zMKTL/2LB
         9oZTk+ShShAWOKHXrIy3gqBdIHdGdYPxlETS8z3EIADOBBMfN7+J3qOvAVmXxvIUREji
         iA+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=1stdysJEzy7FT1v0pUXkFC77RjxUk8j5yj5+S2ppIqQ=;
        b=hOjo05xLsDAMt/D2t+MzBZZSLYA4S7clciIzo9lUdRtmw7NmwQwS7kjFNxqbEYXu2s
         7Cx951xYpgyhbWFUxQ7Udxl2fZkjXnPFxv5hkaRoBTjF60ZGxQeF3M7lQWvYwTjBO2yS
         mmxZdkeEAQzCTkC9Fi+I1OlppNPhcbl+Qvi5OqN1djtyJBYML9wVXL5NZh333n5J9N3F
         wTdbZ4Xy2sFRAEGq7kS++zr4EZfS59lK244nk99WQrAkwoq9KHIlf1qJ7UG6omX5ssst
         7Zz3hcyzyitxpd5BXptqA90i4l0XMUO3/0mT1qASNp6ZHsC1UIFAImoL7NBJUK/X5tF2
         lkZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=kBWMXqb7;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=kBWMXqb7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a20si922905qtk.363.2018.03.16.13.32.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 13:32:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=kBWMXqb7;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=kBWMXqb7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59431 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eww1Y-0005ji-9A
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 16:32:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1B-0005az-3c
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww16-0002wd-TV
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:01 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55236)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eww16-0002vf-NP; Fri, 16 Mar 2018 16:31:56 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id BA15560C5F; Fri, 16 Mar 2018 20:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232315;
	bh=fAmTx2/b74GGKbiY+3IVPm0hnhFIxlupKtSdYtK5Cu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kBWMXqb74K5QB9sNFc9bj+wsEMTLbNjmSSE1S2N849nXKSl2W+Fmd2y0gXdnRiKgk
	XLM9GJWLqimL126nG99OqGeNDUz+Aifjwk85H6OI0rRKIPvZY/nNs4x5XJjkI3r53a
	t5p4U5volyqWFvhHAOYq4mz25OiX0IVxtojko/r0=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 24F6860390;
	Fri, 16 Mar 2018 20:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232315;
	bh=fAmTx2/b74GGKbiY+3IVPm0hnhFIxlupKtSdYtK5Cu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kBWMXqb74K5QB9sNFc9bj+wsEMTLbNjmSSE1S2N849nXKSl2W+Fmd2y0gXdnRiKgk
	XLM9GJWLqimL126nG99OqGeNDUz+Aifjwk85H6OI0rRKIPvZY/nNs4x5XJjkI3r53a
	t5p4U5volyqWFvhHAOYq4mz25OiX0IVxtojko/r0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 24F6860390
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 16 Mar 2018 16:30:59 -0400
Message-Id: <1521232280-13089-2-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v3 01/22] target/arm: A53: Initialize PMCEID[01]
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
X-TUID: baI0/taP0BWq

A53 advertises ARM_FEATURE_PMU, but wasn't initializing pmceid[01].
pmceid[01] are already being initialized to zero for both A15 and A57.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 991d764..8c4db31 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -201,6 +201,8 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->id_isar5 = 0x00011121;
     cpu->id_aa64pfr0 = 0x00002222;
     cpu->id_aa64dfr0 = 0x10305106;
+    cpu->pmceid0 = 0x00000000;
+    cpu->pmceid1 = 0x00000000;
     cpu->id_aa64isar0 = 0x00011120;
     cpu->id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */
     cpu->dbgdidr = 0x3516d000;
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

