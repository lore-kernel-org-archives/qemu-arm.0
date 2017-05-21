Received: by 10.25.0.6 with SMTP id 6csp1038952lfa;
        Sun, 21 May 2017 08:35:58 -0700 (PDT)
X-Received: by 10.176.0.22 with SMTP id 22mr9545666uai.97.1495380958704;
        Sun, 21 May 2017 08:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495380958; cv=none;
        d=google.com; s=arc-20160816;
        b=QA+9Z0qC5zzmIaHsFaaUEJYNr6XSlLWxVH4Vpl94w1ceEOaYeNlt0Blp39GQ6Ygfco
         bJhLRfAeLMKf+QCK2RexovF42ZF+Qz2nBCpef/GBl93bT9JdxIs5WS+s1xpceZpLx6J/
         qT6EofAJ9Q5vlHo9SSfz5xLjRye1vz1934bwgQL3f70zmQcwbMDTUyVldsIzu5e483qq
         wXNJ/hFuBMsife12hwwvuSxRhn/GCYZxoa0v9ktruHJM9iE4b2cOK2OICrYAXC7ICOjr
         eplZyDtR3ApMpdehDnjYcCLYKN5B3pb3h436UZK9ONdVunEF/v/DWm2NMkpbuCDOeq9O
         OFWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=83U/p9fJzR6J95rqsgDRjWAjGs+gU85zSFh7NM4NFdI=;
        b=lf2OXpWyfzNc+XCkBzf3z97ES+4sv+SXS3sP1g5qA+iO4zZoT7oz5qF/BlGq9n5WLR
         mv2mVv7sabEsEnMKwF4st/jD7CFK22hEldjz7Sk83nWVe9/i4IsAiIGg2QwwnHpKA+mQ
         TsUs0KgUxdWYGYfqjIYXh4gUsArhaAiMl0PoKFwya6FGGg0KANiU8zvZ/WAdTLFpXBNU
         6iB4g5cViuEHscSqYMTBwwmGfSZrIDK8rqaeJls9qUTmw2pTrjz+LWM2c3wezyd9krx6
         gBBVlEAxaXi6mkKap2RdVqMd8FT7jUS7+64WvrviyuRqOouBRDI675e2Le1oRx/t/jQg
         e3EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s194si570847vkf.195.2017.05.21.08.35.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 May 2017 08:35:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dCSti-0006ju-42
	for alex.bennee@linaro.org; Sun, 21 May 2017 11:35:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dCSoD-0002SQ-VU
	for qemu-arm@nongnu.org; Sun, 21 May 2017 11:30:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dCSoD-0007KU-50
	for qemu-arm@nongnu.org; Sun, 21 May 2017 11:30:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:49822)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1dCSoC-0007Jo-Vb; Sun, 21 May 2017 11:30:17 -0400
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D355D239A1;
	Sun, 21 May 2017 15:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D355D239A1
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sun, 21 May 2017 17:29:47 +0200
Message-Id: <20170521152949.15338-10-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170521152949.15338-1-krzk@kernel.org>
References: <20170521152949.15338-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-arm] [PATCH v3 09/11] hw/arm/exynos: Use type define instead
 of hard-coded a9mpcore_priv string
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
X-TUID: /qLocTRf7DoO

Use a define for a9mpcore_priv device type name instead of hard-coded
string.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/arm/exynos4210.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 034fc8be9d76..a9e221c5b7fe 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -26,6 +26,7 @@
 #include "qemu-common.h"
 #include "qemu/log.h"
 #include "cpu.h"
+#include "hw/cpu/a9mpcore.h"
 #include "hw/boards.h"
 #include "sysemu/sysemu.h"
 #include "hw/sysbus.h"
@@ -212,7 +213,7 @@ static void exynos4210_init(Object *obj)
     }
=20
     /* Private memory region and Internal GIC */
-    dev =3D qdev_create(NULL, "a9mpcore_priv");
+    dev =3D qdev_create(NULL, TYPE_A9MPCORE_PRIV);
     qdev_prop_set_uint32(dev, "num-cpu", EXYNOS4210_NCPUS);
     qdev_init_nofail(dev);
     busdev =3D SYS_BUS_DEVICE(dev);
--=20
2.9.3

