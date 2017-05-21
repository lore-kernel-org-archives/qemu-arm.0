Received: by 10.103.124.15 with SMTP id x15csp1047627vsc;
        Sun, 21 May 2017 08:30:43 -0700 (PDT)
X-Received: by 10.200.3.79 with SMTP id w15mr17876992qtg.203.1495380643125;
        Sun, 21 May 2017 08:30:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495380643; cv=none;
        d=google.com; s=arc-20160816;
        b=0pjHy5sMyCbuNyjwehDmk9qk0KkVG+dETHqzu1yNR6Q51sHrMt8GXc/VVKLNp8zuxr
         O271JJk/k+bDRNAPDdWTPDH0GNbCQ+ca8S811ssSXgY3Wjv6N+do0R/NV/Ip4VT9W2Ac
         eK5nZKZdzuKTXud70onKpzMVZ8P5/Pw09ob2zCxjbWISuKSsM+tJea7UspgGw9Romkbr
         X7HNKc//s2lVKtUbznGbi9RS6Q8F5+OAX8YGmFrXQPAXUso8bqK0+wDfwNIfLsCoJH27
         hSGMyInrH8frifexy65wgkzhiUJPgV4EzQJewcFUqlGBH/X0CJn4Ex3t2IJXo/igRFOf
         TnQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=rtWAjh/yh8iQTxHDjOaENX8nI+qx3bgju44RC1uvbHw=;
        b=oigjLxgYcEoxaPo/e8OcSdVBqGLT43qoSnx3DhQ3BJW9c4WOdHvv6tgVW4iEXqo9X3
         D2nQmI9py5LrAz5RDEYnicAIiGzw8i8hETeOb2nxddTiCnOAVwy1XT/IOdpNmM0PMcvS
         8Bklw+W7fNplzZnQI4T0HSQYg1Dn22cj+ykfAiovFH1oo8sOHX8nnNZH6jSnzrfaU2qu
         r6mWYjhZrDrDIix9d3bfE5Inx/AKeg+eOTlVLdbKdHZX6taEPy06AczCeOlqsu3Da9/4
         Dwx9MkCjJOotUHW87mMdYFyqFW3/KimAftGJpYexOI3432kwktXVVmcAcGptcafPTBW3
         iB5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y68si6809251qkc.250.2017.05.21.08.30.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 May 2017 08:30:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38375 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dCSoc-0002m8-L0
	for alex.bennee@linaro.org; Sun, 21 May 2017 11:30:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53571)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dCSo6-0002Mh-MR
	for qemu-arm@nongnu.org; Sun, 21 May 2017 11:30:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dCSo5-0007FP-Ts
	for qemu-arm@nongnu.org; Sun, 21 May 2017 11:30:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:49680)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1dCSo5-0007Eq-OS; Sun, 21 May 2017 11:30:09 -0400
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1CEB4239A1;
	Sun, 21 May 2017 15:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CEB4239A1
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sun, 21 May 2017 17:29:43 +0200
Message-Id: <20170521152949.15338-6-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170521152949.15338-1-krzk@kernel.org>
References: <20170521152949.15338-1-krzk@kernel.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-arm] [PATCH v3 05/11] hw/timer/exynos4210_mct: Remove unused
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M8hbn/6DA/Vt

Remove defines not used anywhere.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/exynos4210_mct.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index ea5f99d9a41b..e4ef4cfd3625 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -173,13 +173,10 @@ enum LocalTimerRegCntIndexes {
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

