Received: by 10.25.0.23 with SMTP id 23csp26622lfa;
        Fri, 2 Jun 2017 09:45:16 -0700 (PDT)
X-Received: by 10.55.140.65 with SMTP id o62mr9752248qkd.127.1496421916250;
        Fri, 02 Jun 2017 09:45:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496421916; cv=none;
        d=google.com; s=arc-20160816;
        b=v0BnVg6fJNGfmxQE6hRs0w6zRuW5tOVGVPy3lVWzbEEs87OD5HyUsvyIISvfiX8otH
         v/og0/JIh2SW+KcR4N4WwMMW4R5y+CIVQL+bDUrdsHiTmOK23eyeencaxxbHXt3EObjO
         TO+zaE3TUBYUL3OkeaopiY53jly6pzp3uRMHvO5cArtb5rAw3pALoMk9BQKXlxP/UsVL
         A18x6rPqGjhcnlW0R4D4TIBzk51zYWa01e/eriva0QN6N+R+Cnc9yOTtmskFT7n8/6Zt
         ZoUZCtIOQpijmUNB/8SPZlb0FiR+QJGir8CSIcmknjupOwY3806lROQltZ54gpL0la1A
         S5Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=u2NUglntJNdmBcyRuCSFzC6f5z46DWi65x/RJcrIlb0=;
        b=b6Ni5uZDY2MSFEVW9sN8P6aGXkvv78iEQJssJT5EW4eU4JO5tR7EKVuchlFXX6xAbY
         9oeGt+QZRf7FO8Y6A6bPAuMeJX4M0p0g5yImYwd9NtserMbY5XyeL+t/WKZk7vhx/6ov
         deBNfjYBVBrhT73JMUJN/5jySl6UE4VWtKyyeChb+j7Y/MGP/iCik1v31q9uStKkkkq8
         +qZkYruDQbDmxNr6STw7F7m+0YnPSvKMBmPTzxIw+gJQHFvsoG9MXmYLaoiD7TWpvvLw
         sdQMS2g8QlHfp9yIfXOPd4YBiwELjGSRdxqKXTcXxFoVAyY0JQPGYh5vVkY3Du9dd+sx
         EMZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z51si664256qta.307.2017.06.02.09.45.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Jun 2017 09:45:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50770 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGphJ-0001G5-Oz
	for alex.bennee@linaro.org; Fri, 02 Jun 2017 12:45:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dGpZB-0001Eh-Bl
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 12:36:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dGpZA-0007iu-CU
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 12:36:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:53942)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1dGpZA-0007hs-6i; Fri, 02 Jun 2017 12:36:48 -0400
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BA14823A09;
	Fri,  2 Jun 2017 16:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA14823A09
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  2 Jun 2017 18:36:17 +0200
Message-Id: <20170602163618.6369-8-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170602163618.6369-1-krzk@kernel.org>
References: <20170602162857.6065-1-krzk@kernel.org>
	<20170602163618.6369-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-arm] [PATCH v4 8/9] hw/intc/exynos4210_gic: Constify array of
 combiner interrupts
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
X-TUID: TkvV8IEdcoBV

The static array of interrupt combiner mappings is not modified so it
can be made const for code safeness.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/intc/exynos4210_gic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index 62acede72f62..b6b00a4f5891 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -116,7 +116,7 @@ enum ExtInt {
  * which is INTG16 in Internal Interrupt Combiner.
  */
=20
-static uint32_t
+static const uint32_t
 combiner_grp_to_gic_id[64-EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][8] =3D {
     /* int combiner groups 16-19 */
     { }, { }, { }, { },
--=20
2.9.3

