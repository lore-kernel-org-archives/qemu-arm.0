Received: by 10.28.91.67 with SMTP id p64csp1275941wmb;
        Fri, 16 Mar 2018 13:35:30 -0700 (PDT)
X-Google-Smtp-Source: AG47ELs0z8VpnUG0gSDYxtbgOSyrb1Q1ZoNvuwRoyssdxYwQUjRWi6cSyq5cJuVdHm6Isxgtpzme
X-Received: by 10.55.11.144 with SMTP id 138mr4934608qkl.258.1521232529950;
        Fri, 16 Mar 2018 13:35:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521232529; cv=none;
        d=google.com; s=arc-20160816;
        b=oX8XanvXg55th5L3Xcm4KMXwbdzKkZbbqOGHTLPGvOrQKMaUatIcrz2ryLvCzmC+92
         VWIe253vp0PPY9aFrQlQHds4P5oRhUwJSuWC1C7LmNbh6bm2EWJnRUhoTXM6xjtWQD/C
         dWp8bqlNFuYQ4pUF6n76ONprmRkikbV7H+diT3nRKIp94bf2kFD8NIBji15KPo2rKT/Q
         xhHPLbf4cRssEs+ah8gK6wgBlse44spjuZOg+s9p4gDH/ejik34DwUV+AigP3F7YZKD1
         TpbPFtXSoAiWnrKPHcbkI4ryU6QVTce8cRSIV1R12bvMu0Bw9GmtnB0fcGVYmmoQZY4q
         zBcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=0E7ygOffJJOdd0s+Nm4l5q2pkMpofL5WcJvBdZ6RyYw=;
        b=T3pLS+UGggAMAE4AXciczpT7HdJhelbi2sjjfiyXWfRgASKd68LxTsKn+tbqOPJXwA
         hptXnljDe+2cXTeLWzkc0NeCNIjfTMrifgwtWfYay4ovTNWpFbjoiw/7WZzr8NXyXFko
         OHvU15NvXXG6yH1qSn0slhLCursYb/yCk8SVhNCq4SkxrgCTSHBcLnrS2+r0jbO+Q3bv
         7FK09jlyjEAQMBm/YxDPT5pQ8a1Lj5v6bPWwtAZaiyizT9+h1OHYuxUgnnxhIG1AmcP+
         agVv8f+3DrmMSVcPh1edD73uhtN01zHdQKSEDR4ENzU36JJ51wn2S/ByYVbqbhdYRzw9
         Ozuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=nJjdAXHj;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=nJjdAXHj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v1si1409626qtg.203.2018.03.16.13.35.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 13:35:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=nJjdAXHj;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=nJjdAXHj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59445 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eww4X-0008H7-Eu
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 16:35:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1B-0005bU-S1
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1B-00032I-1t
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:01 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55364)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eww1A-000315-RT; Fri, 16 Mar 2018 16:32:00 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id E2D7360C66; Fri, 16 Mar 2018 20:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232319;
	bh=TidfQxPX4pOaIvomEefQibfdPlA8IL9evII85VkavH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nJjdAXHjQ6CdzN5ZiLThdOH+M3Ude9JZmLQYp++GIDDsCIwMrtL/1OIyQqxycGokb
	5X4VWgDvIhC3dgDUO+HfajVVG9aBGXYTfS14nqzRURv6pHXI0wGxd51s1O368Uc3N8
	lYFtaM6B8QgiMpRSBS6ctWrtXJvQV+FXOEyzdUZ4=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 6CBFA60C4F;
	Fri, 16 Mar 2018 20:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232319;
	bh=TidfQxPX4pOaIvomEefQibfdPlA8IL9evII85VkavH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nJjdAXHjQ6CdzN5ZiLThdOH+M3Ude9JZmLQYp++GIDDsCIwMrtL/1OIyQqxycGokb
	5X4VWgDvIhC3dgDUO+HfajVVG9aBGXYTfS14nqzRURv6pHXI0wGxd51s1O368Uc3N8
	lYFtaM6B8QgiMpRSBS6ctWrtXJvQV+FXOEyzdUZ4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6CBFA60C4F
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 16 Mar 2018 16:31:00 -0400
Message-Id: <1521232280-13089-3-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v3 02/22] target/arm: A15 PMCEID0 initialization
 style nit
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
X-TUID: RDy7PBtlPPoE

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 022d8c5..072cbbf 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1524,7 +1524,7 @@ static void cortex_a15_initfn(Object *obj)
     cpu->id_pfr0 = 0x00001131;
     cpu->id_pfr1 = 0x00011011;
     cpu->id_dfr0 = 0x02010555;
-    cpu->pmceid0 = 0x0000000;
+    cpu->pmceid0 = 0x00000000;
     cpu->pmceid1 = 0x00000000;
     cpu->id_afr0 = 0x00000000;
     cpu->id_mmfr0 = 0x10201105;
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

