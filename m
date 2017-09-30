Received: by 10.223.197.9 with SMTP id q9csp1227545wrf;
        Fri, 29 Sep 2017 19:09:46 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDqOiqNxCuqkQ6oJehpHSfk0Nl2gQEO5bHXZUN6JNUEAYDS7eEzSpu6IGXXy2IuP/W9vHCO
X-Received: by 10.55.155.7 with SMTP id d7mr4271326qke.55.1506737386160;
        Fri, 29 Sep 2017 19:09:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506737386; cv=none;
        d=google.com; s=arc-20160816;
        b=FBmTmleDC9888BnLVjoC4FM5zFgOhdmO7+KTflq8WpK/tizXRqs5SutKzVwy8B+kth
         OAUqU+d5UMjTrgcgHFt/sbf6EmtlrS6E4C1hlQllZRlD4PQ423EaYmORL5kd4stvdtve
         wOQL50sf4z39Ud9Z/x1sX3h0RfK3IQvaGFib6QWdfh9IhjyrFxWPUl98qGi8otyyL7ZY
         PGLZc7YwVq7w+qXuMyFbPoAXn4HXGLMPLvoeGFWDZd3H7C6QXuHd1Zk7Kv1a5iJJloZk
         xMz9PDHj48yrZS4mAcQETxFYTnungNpN6WtiSdxms6WcT2sCzeqT3htn95EZdJhBXVVo
         PuZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=WbR5lReq65M4t/FNQ4jDSHu+Xs2Yv2lsoF7RDdvUYCk=;
        b=R+cJVDZbtC+x5BaoSPBPEYW2XAWZY/59UFHUxlnKrvUyYEkE6s+LQZUWbkynHP9X0B
         XDqU1fgm7LZbk7NBGlrrU4hV01oeHanr4RsRLAmZeEz4YphBXNgzR+VjXyCG7zmizCiL
         lnPX/7YyirAo+UaKwn3AxSu1kMxFz3VvaBi7nDdpoo8TC6JCcYHaNw62wgKO6RgnWchV
         +ccds0FhVpnzKK5Svg1pY37rnV04ZU5lmYOJmS96e+RoNA5RWCZjjCZxZzx7JE2Z3ILf
         H/YowSahPBFK8aTYTMWOP4iL8QandL5wd9eVeVaw2nnYEv8OoXfLfQZWLlv1koTHitob
         t0JA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=FqnIO7MX;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=FqnIO7MX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o95si1741672qte.440.2017.09.29.19.09.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Sep 2017 19:09:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=FqnIO7MX;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=FqnIO7MX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Received: from localhost ([::1]:37784 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dy7Dr-0002Yk-PT
	for alex.bennee@linaro.org; Fri, 29 Sep 2017 22:09:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7DV-0002Nw-MU
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:09:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7DU-0004wU-Ql
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:09:21 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:34940)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1dy7DU-0004uT-Kn; Fri, 29 Sep 2017 22:09:20 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id B5ADF609C2; Sat, 30 Sep 2017 02:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737359;
	bh=9uC1W/v/TjydkA5wE8+4LdlmXCmIwJKymHm5q/IcQ3w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FqnIO7MXRzbtkrl0Vp171q9fHi7YXPjifBgor+t10AMQqky93yAfBchvdCaaQiA3F
	hvCa0uiaae7kc2M79scfig1KIlwAy8HCb3cpcujXXNfzIimgWlCeJm8jblmN5KnDKa
	KxJ+OQHe3bJMN4FbIXJYZGSJ0P7E/LhrC1pZ/AYk=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 6361A609F2;
	Sat, 30 Sep 2017 02:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737359;
	bh=9uC1W/v/TjydkA5wE8+4LdlmXCmIwJKymHm5q/IcQ3w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FqnIO7MXRzbtkrl0Vp171q9fHi7YXPjifBgor+t10AMQqky93yAfBchvdCaaQiA3F
	hvCa0uiaae7kc2M79scfig1KIlwAy8HCb3cpcujXXNfzIimgWlCeJm8jblmN5KnDKa
	KxJ+OQHe3bJMN4FbIXJYZGSJ0P7E/LhrC1pZ/AYk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6361A609F2
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Wei Huang <wei@redhat.com>
Date: Fri, 29 Sep 2017 22:08:18 -0400
Message-Id: <1506737310-21880-2-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH 01/13] target/arm: A53: Initialize PMCEID[0]
X-BeenThere: qemu-arm@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@gnu.org>
List-Help: <mailto:qemu-arm-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=subscribe>
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
X-TUID: lBl0Rn51OGkc

A53 advertises ARM_FEATURE_PMU, but wasn't initializing pmceid[01]

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.c   | 2 +-
 target/arm/cpu64.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 4300de6..a6c29cf 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1402,7 +1402,7 @@ static void cortex_a15_initfn(Object *obj)
     cpu->id_pfr0 = 0x00001131;
     cpu->id_pfr1 = 0x00011011;
     cpu->id_dfr0 = 0x02010555;
-    cpu->pmceid0 = 0x0000000;
+    cpu->pmceid0 = 0x00000000;
     cpu->pmceid1 = 0x00000000;
     cpu->id_afr0 = 0x00000000;
     cpu->id_mmfr0 = 0x10201105;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 670c07a..7b1642e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -198,6 +198,8 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->id_isar5 = 0x00011121;
     cpu->id_aa64pfr0 = 0x00002222;
     cpu->id_aa64dfr0 = 0x10305106;
+    cpu->pmceid0 = 0x00000000;
+    cpu->pmceid1 = 0x00000000;
     cpu->id_aa64isar0 = 0x00011120;
     cpu->id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */
     cpu->dbgdidr = 0x3516d000;
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.\nQualcomm Technologies, Inc. is a member of the\nCode Aurora Forum, a Linux Foundation Collaborative Project.

