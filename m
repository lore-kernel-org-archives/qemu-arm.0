Received: by 10.25.0.144 with SMTP id 138csp378148lfa;
        Wed, 19 Apr 2017 10:42:19 -0700 (PDT)
X-Received: by 10.200.55.193 with SMTP id e1mr3702384qtc.190.1492623739556;
        Wed, 19 Apr 2017 10:42:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p35si3050534qtg.124.2017.04.19.10.42.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Apr 2017 10:42:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org;
       dkim=fail header.i=@codeaurora.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49610 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0tcP-0008So-5M
	for alex.bennee@linaro.org; Wed, 19 Apr 2017 13:42:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tc1-0008Ao-JT
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:41:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1d0tby-0004L6-Hq
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 13:41:53 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37442)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1d0tby-0004Kc-AV; Wed, 19 Apr 2017 13:41:50 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id BEAE1610D4; Wed, 19 Apr 2017 17:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623708;
	bh=KkxUjiTKVVVc5vlj05G6ZYjENBmdEy+MHa5UHRv5OwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SZD/oGBjzmRVXcouDOheczoH6MtEJawifnsf6F+pJevt502moVjqXnDyEzqKCgBDL
	NfcQ6ZvPpMJrnUoTz6udU9ifJql6ylKuMNTuhGH7c4ZjGJudxsA5kseEEfV1HStT0D
	pKpJvS/yOETIfCXTYPlM/AIecJdCZGsUqnmwEUIM=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id AFC6D6110D;
	Wed, 19 Apr 2017 17:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1492623708;
	bh=KkxUjiTKVVVc5vlj05G6ZYjENBmdEy+MHa5UHRv5OwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SZD/oGBjzmRVXcouDOheczoH6MtEJawifnsf6F+pJevt502moVjqXnDyEzqKCgBDL
	NfcQ6ZvPpMJrnUoTz6udU9ifJql6ylKuMNTuhGH7c4ZjGJudxsA5kseEEfV1HStT0D
	pKpJvS/yOETIfCXTYPlM/AIecJdCZGsUqnmwEUIM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AFC6D6110D
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Date: Wed, 19 Apr 2017 13:41:12 -0400
Message-Id: <1492623684-25799-2-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
References: <1492623684-25799-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH 01/13] target/arm: A53: Initialize PMCEID[0]
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>, mspradli@codeaurora.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r8zoYfiBVJIi

A53 advertises ARM_FEATURE_PMU, but wasn't initializing pmceid[01]

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.c   | 2 +-
 target/arm/cpu64.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 04b062c..921b028 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1342,7 +1342,7 @@ static void cortex_a15_initfn(Object *obj)
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
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

