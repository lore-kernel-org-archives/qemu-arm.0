Received: by 10.25.0.6 with SMTP id 6csp1039884lfa;
        Sun, 21 May 2017 08:39:21 -0700 (PDT)
X-Received: by 10.55.104.66 with SMTP id d63mr16288945qkc.260.1495381161517;
        Sun, 21 May 2017 08:39:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495381161; cv=none;
        d=google.com; s=arc-20160816;
        b=d8nyXvLBaDuWmYHP50GMatIUjXDm8Wooor/l5RL5EMtT47VbIphSr7FerbZYWukGND
         R8r2rMQK+00IwMvPuamAJ/v2OX7ouenc+16xM5hVDNpJUj25g2pF5ddTm7e5mInrW7K2
         FLAoOT9A0gsVPleQLmm6NEsg8fGfX1GyZnHTOdwTVM3fLT4aTsP18Izupk/8P8dMyj6C
         GullXpxbC64U4ppI1kv1WS0CrAKFeZjmZSsPDMCKpvoc+VrI6LS6ToIiEsCqPBUCFV52
         agv5jRNaAWrrKL4JSN2pI3bdYsPdtZHU4zzGiQD2Az6wJPnulXhoeP7iIDT3wmp/gtNx
         Y11w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=ejoC7Dt+DyA5bPJqlPkunroEIDLtMjdHyQy37kdDCFA=;
        b=diScjVLxTJOkjqQqb53kR/TsS/BI/6lbTqyECgr8Gqdr/ojD/FOyRyNTyHhr7JFp0v
         jF+OXC6EnsPGnEyg5JBTbmGx6DRLib8HGoWsKIZBAvtiKurxewuiM9xuSYD1GTM/O+6X
         W0f7U8XUsjVXtnjKOZmHYgaVE6LJCMVgIfkC4QypWACzJNG2UGtq1ufBWiPdiC0zYLBi
         VQBuEWJ1y/VyiXaGUrzfYZOE1+HbANp2iUbVZjjvko6giTNhyr4CGDZovR6We2qkBAFk
         ElGefSnKUu4SIvguujzyZX5GwAGdZBw8PhMkLO+6jNCLIGo2WDA7l0doDLB5GQBXbD+i
         2MNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w12si15174687qtw.225.2017.05.21.08.39.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 May 2017 08:39:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38412 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dCSwy-0000W3-Vd
	for alex.bennee@linaro.org; Sun, 21 May 2017 11:39:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dCSoK-0002Zz-2N
	for qemu-devel@nongnu.org; Sun, 21 May 2017 11:30:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dCSoJ-0007NO-4w
	for qemu-devel@nongnu.org; Sun, 21 May 2017 11:30:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:49856)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1dCSoE-0007LK-Lo; Sun, 21 May 2017 11:30:18 -0400
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 88395239B0;
	Sun, 21 May 2017 15:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88395239B0
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sun, 21 May 2017 17:29:48 +0200
Message-Id: <20170521152949.15338-11-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170521152949.15338-1-krzk@kernel.org>
References: <20170521152949.15338-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-devel] [PATCH v3 10/11] hw/intc/exynos4210_gic: Constify
 array of combiner interrupts
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xM5heXKO0wBU

The static array of interrupt combiner mappings is not modified so it
can be made const for code safeness.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/intc/exynos4210_gic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index 9a2254f0b13c..d79b4cfcc7c9 100644
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

