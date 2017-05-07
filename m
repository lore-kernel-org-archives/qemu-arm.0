Received: by 10.25.0.198 with SMTP id 189csp932017lfa;
        Sun, 7 May 2017 04:36:16 -0700 (PDT)
X-Received: by 10.55.128.198 with SMTP id b189mr19730119qkd.301.1494156976890;
        Sun, 07 May 2017 04:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494156976; cv=none;
        d=google.com; s=arc-20160816;
        b=OPZk3In05HP/mqDu0ubnoVcnN3IDqR2jexM0BS+4NRVrQuNh/wHlDhpoG8uhX+9+ay
         BXITtDpXew7v8WckMZRpN/lWYLNOXOIX7+eGokzA/4Bl/SPTvNcqiyggvQ/Cjoo2bIFf
         M84+pI/+G8UxaShp/W0g0pa/tHuvY3pm2MtBqgKNRkwCn6LUV+MLsQWrLEj2nbspOLbk
         S68bIsAl9F12og3yLfO1GNXUR60+wELQGQgjPdlgq0JlNkCfOmjSdMqTUAKg18Ix7Jvx
         jVV1j/G1ahMFFprC2Wg+5Ooorot/RNl1o2CTtJlbWvVLa57AX649TxgCEf09jVurRS2S
         z+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=yRsRZWEbOQwp9XRufFNMEDXfbm7TuzISBN3DfJBXsU0=;
        b=uzAWhK1awhWts5/SdLxti30MAXZ5tCniX4wlswB5LVaColKJmfu1cBJS7auQ5O2WWf
         hFNZzmzTDuYhqXpo7JJ+AFqM7r4qQseeBHrIe+JkmhxAMGX+HjrxMJ3bMD6n/+Hz3cIr
         1F2kcQ9eG0x8WtUhrY4kFhGhIYtuSPay+BXdi2rj3Wb1JDPXCtz3mJUVOI7WWWCCdmcM
         HglL+TkcCPZaLDo//WbpbF0vNM1NUN6iGh6/uF1q7b1PQKfQFw1zp5D8kujKYHnqVkVW
         0tSLrgyy8FHms3R1bo46P03qh6Kr09Ln/jcQ/17JghasXHGi71ZpJb0PP7bEwAKvYFvN
         asOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b77si9945753qka.58.2017.05.07.04.36.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 07 May 2017 04:36:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54551 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d7KU2-0007pm-7e
	for alex.bennee@linaro.org; Sun, 07 May 2017 07:36:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1d7KTk-0007eS-Lb
	for qemu-arm@nongnu.org; Sun, 07 May 2017 07:35:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1d7KTj-0004V8-Ti
	for qemu-arm@nongnu.org; Sun, 07 May 2017 07:35:56 -0400
Received: from mail.kernel.org ([198.145.29.136]:56228)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1d7KTj-0004Uy-Mm; Sun, 07 May 2017 07:35:55 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 2964420361;
	Sun,  7 May 2017 11:35:54 +0000 (UTC)
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0AAAB20392;
	Sun,  7 May 2017 11:35:51 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sun,  7 May 2017 13:35:39 +0200
Message-Id: <20170507113540.8687-3-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170507113540.8687-1-krzk@kernel.org>
References: <20170507113540.8687-1-krzk@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-arm] [PATCH 2/3] hw/intc/exynos: Constify array of combiner
 interrupts
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
X-TUID: 7ekSdZitBS4s

The static array of interrupt combiner mappings is not modified so it
can be made const for code safeness.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 hw/intc/exynos4210_gic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index 222cfd6c6387..636dc6dbc1f9 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -116,7 +116,7 @@ enum ExtInt {
  * which is INTG16 in Internal Interrupt Combiner.
  */
 
-static uint32_t
+static const uint32_t
 combiner_grp_to_gic_id[64-EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][8] = {
     /* int combiner groups 16-19 */
     { }, { }, { }, { },
-- 
2.9.3

