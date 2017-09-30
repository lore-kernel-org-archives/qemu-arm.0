Received: by 10.223.197.9 with SMTP id q9csp1233423wrf;
        Fri, 29 Sep 2017 19:19:34 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBxeHryP65vNkHUdjvYxZuWXrOOjhLXdvG8T1RatuMuvPS5NYiCvA1GOXuiWP77Uhp+C18j
X-Received: by 10.237.60.188 with SMTP id d57mr1568qtf.329.1506737974495;
        Fri, 29 Sep 2017 19:19:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506737974; cv=none;
        d=google.com; s=arc-20160816;
        b=s8d88/95C6Hk5/wR1jDnt2uPoufs+TSM0y6vmSniaPa420BumGAtP0YlopQTKGUDKf
         +kQSnXEB1dGMFk52QfG3DFGI49GOuFtVROLIDjUDafR3iqHqDFpiXXfUmWLChkPJ9cL9
         HEssAcAlwqLdsGw/viP5id7tCoOz7uECfkyoJeekRCMvqRzOKqfIwAW1BZlhfpPqGVSq
         tK1fKarFEVKSg7MVKoSvfBtRQcD0ireUZQN+dBfAeERO/fisLuc182Dd5Kx851glt8Sy
         ueoiCdpyLLL8upmOLXSiQVqq406lZp0gXr+xriiIFPKQu+DUSOaHXz/3Im1CQkNTXMRH
         0Tdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=LwGoA1QarDV/EyGm87LVNnWVjXx+zz1k8SyXn+ghHLs=;
        b=Qz1PfdyWT+DtBTPp9xJ7tS7xxMlbDLiBZlSHumaryWfpHX7dJ3XXwtBV5re0ImYyL1
         hJqQo35tg0wTp38m/jP7rbvNit/jdeWwYeMTM2nP1L+P1kS0zMntILDxDYNOPG+oE652
         06x0GYNxzIdmjOzIOdw+8TJ0YQ+601aQsOWHwjUoSt7PXF8z2iq0LBf43qSm1Tw2/QF7
         jwCKt4/lJ5CBjBRQjDFnr/28O79N+VCMb6uVYmpssBwugsD9p2nKmxe+yWJ3oYlnxaS7
         vY2SEWmhhP6jfqZbtH3XR6os+OAWIYTnEQ71aPVqjBex8kVH9sf0U6ZJUpa1T/9daZ3h
         8Zng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=DOP/DV72;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Yd6Tnnni;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r26si295599qki.149.2017.09.29.19.19.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Sep 2017 19:19:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=DOP/DV72;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Yd6Tnnni;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Received: from localhost ([::1]:37839 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dy7NM-0002uZ-5p
	for alex.bennee@linaro.org; Fri, 29 Sep 2017 22:19:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7Dk-0002cS-LQ
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:09:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7Di-0005Jo-0e
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:09:36 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35658)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1dy7Dh-0005Ip-RS; Fri, 29 Sep 2017 22:09:33 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 086BE60D50; Sat, 30 Sep 2017 02:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737373;
	bh=aUPkSpX4wuqc8j5GmbD1K49sX+GQ9BHnWPFMFypHnqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DOP/DV72b5NoktsvTDVlrn5oeecLnyZHDPq/a5sFqxlMgTnZjdngCgMIUPTsCnsBN
	0hOGAW1ZTOQJ3jByZUg3coa1dqm4788s3/XKyOQbjXO/ZvkArVzIVyU2Fisb5DQFnT
	63aW/SdXse9Nf42K8gkv5qRzpu+lYoAZJya7/lFk=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 40C1160D09;
	Sat, 30 Sep 2017 02:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737372;
	bh=aUPkSpX4wuqc8j5GmbD1K49sX+GQ9BHnWPFMFypHnqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yd6TnnniLhQunEjbos8SmfhH8nvzvsM5vBxTRb/wOX1XcLq7mhTXjA2vvh4fq/QrK
	jmFB6QWh4aKm9Nf+zrVm6HtS/TQVGLESBpfWtcKNy0HFgveK4AjgK4EcKd5j1PuYm9
	hXLN7eYfvL42eqIyfRCd5iBdU7+268QdZ5cElzGQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 40C1160D09
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Wei Huang <wei@redhat.com>
Date: Fri, 29 Sep 2017 22:08:29 -0400
Message-Id: <1506737310-21880-13-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH 12/13] target/arm: PMU: Set PMCR.N to 4
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
X-TUID: cEotZtnw6gve

This both advertises that we support four counters and adds them to the
implementation because the PMU_NUM_COUNTERS macro reads this value from
the PMCR.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e48bb67..659b2b8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4926,7 +4926,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             .access = PL0_RW, .accessfn = pmreg_access,
             .type = ARM_CP_IO,
             .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcr),
-            .resetvalue = cpu->midr & 0xff000000,
+            /* 4 counters enabled */
+            .resetvalue = (cpu->midr & 0xff000000) | (0x4 << PMCRN_SHIFT),
             .writefn = pmcr_write, .raw_writefn = raw_write,
         };
         define_one_arm_cp_reg(cpu, &pmcr);
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.\nQualcomm Technologies, Inc. is a member of the\nCode Aurora Forum, a Linux Foundation Collaborative Project.

