Received: by 10.25.0.23 with SMTP id 23csp25747lfa;
        Fri, 2 Jun 2017 09:42:46 -0700 (PDT)
X-Received: by 10.237.63.199 with SMTP id w7mr9135051qth.135.1496421765999;
        Fri, 02 Jun 2017 09:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496421765; cv=none;
        d=google.com; s=arc-20160816;
        b=hWl4VlNfgt3mYn+4v+UHBhvABQFatiM75iFwVGSI/YqCecXb8Z3GFM2Ol5nF1UqB2O
         D6qqoLkcneLb2QLjBzD4xh1gbtA1YGFXANH4OMKpIceSShjupWqXewHKP5nmyaAdWjr/
         8wG8JPMGMx1ioDXfTqrSly9z3zQRrOPHCmpObx19POsVdat7M2qBf+xdPzGiWaiAWpwX
         JXqerV7J8fB/kFqHIo1+kbpcFdR4EOojQDh9vZDZ2eCyf0a/z0n5smvHSiz1FhaVzUkE
         4bJR4cJKc5dB1qRTexPGXUsAAQEnrNrF/ADplM5jsEkmmLLNtjRyH2qeAdP8C23q8MAp
         8CvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=rtWAjh/yh8iQTxHDjOaENX8nI+qx3bgju44RC1uvbHw=;
        b=DUfeRtcreB7I78fqu7hZbnJwbn1VGz5yaVRbw/9FdW0Xb9M336LPMTZSAUXtIWPLBL
         8LUvf0sa40zu6pL5WUzOSxFWv/HajN3HWB51GUOtTM5OcRPNEfInM7Z9OYj6ch8PleT2
         TASuQ5xCOskDeqb9j8qTkr8vO4+4IZWK0eEzzEeGDX8k85dStyCuay9cxI6+EQ0GZySN
         dmqd/SSju7tBFFX2qwNMP7ZDSCPid9waOhdtyeE3UdMl6mBhFUZ5xExMI0ZHb3YHcl4i
         QJDZYLTgUqPocvEgklQ1pql46mxt9+qrNwzQiAVTuDLaVkucnVl/M6adVSB+PJrBnNMH
         JKjg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h52si23930165qtb.296.2017.06.02.09.42.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Jun 2017 09:42:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50749 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGpet-0007bp-E2
	for alex.bennee@linaro.org; Fri, 02 Jun 2017 12:42:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dGpZ3-00015L-M9
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 12:36:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dGpZ3-0007ce-1W
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 12:36:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:53882)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1dGpZ2-0007bh-Rb; Fri, 02 Jun 2017 12:36:40 -0400
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5B30E23A09;
	Fri,  2 Jun 2017 16:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B30E23A09
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  2 Jun 2017 18:36:13 +0200
Message-Id: <20170602163618.6369-4-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170602163618.6369-1-krzk@kernel.org>
References: <20170602162857.6065-1-krzk@kernel.org>
	<20170602163618.6369-1-krzk@kernel.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-arm] [PATCH v4 4/9] hw/timer/exynos4210_mct: Remove unused
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
Cc: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BxTd6VgcDqSY

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

