Received: by 10.25.0.147 with SMTP id 141csp1985071lfa;
        Wed, 1 Mar 2017 10:28:57 -0800 (PST)
X-Received: by 10.237.34.140 with SMTP id p12mr12608553qtc.111.1488392937696;
        Wed, 01 Mar 2017 10:28:57 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c5si951885qkh.2.2017.03.01.10.28.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Mar 2017 10:28:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48152 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cj8zf-0006b3-31
	for alex.bennee@linaro.org; Wed, 01 Mar 2017 13:28:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57496)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cj8xg-00053D-AN
	for qemu-arm@nongnu.org; Wed, 01 Mar 2017 13:26:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cj8xf-0006zb-Lb
	for qemu-arm@nongnu.org; Wed, 01 Mar 2017 13:26:52 -0500
Received: from mail.kernel.org ([198.145.29.136]:41402)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1cj8xf-0006z3-Ft; Wed, 01 Mar 2017 13:26:51 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id C8BAA20218;
	Wed,  1 Mar 2017 18:26:49 +0000 (UTC)
Received: from localhost.localdomain (bzq-109-67-52-244.red.bezeqint.net
	[109.67.52.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 577F520383;
	Wed,  1 Mar 2017 18:26:46 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  1 Mar 2017 20:26:18 +0200
Message-Id: <20170301182618.22395-6-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170301182618.22395-1-krzk@kernel.org>
References: <20170301182618.22395-1-krzk@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-arm] [PATCH 5/5] hw/timer/exynos4210_mct: Remove unused
 defines
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UvVfY2Gl0VHC

Remove defines not used anywhere.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 hw/timer/exynos4210_mct.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 4dd3e441e2e6..6069116942a4 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -172,13 +172,10 @@ enum LocalTimerRegCntIndexes {
     L_REG_CNT_AMOUNT
 };
 
-#define MCT_NIRQ                6
 #define MCT_SFR_SIZE            0x444
 
 #define MCT_GT_CMP_NUM          4
 
-#define MCT_GT_MAX_VAL          UINT64_MAX
-
 #define MCT_GT_COUNTER_STEP     0x100000000ULL
 #define MCT_LT_COUNTER_STEP     0x100000000ULL
 #define MCT_LT_CNT_LOW_LIMIT    0x100
-- 
2.9.3

