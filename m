Received: by 10.25.0.23 with SMTP id 23csp26038lfa;
        Fri, 2 Jun 2017 09:43:30 -0700 (PDT)
X-Received: by 10.200.8.99 with SMTP id x32mr9704593qth.195.1496421810451;
        Fri, 02 Jun 2017 09:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496421810; cv=none;
        d=google.com; s=arc-20160816;
        b=spP88burV/r4TxFYrrPTGbkkf1Hr3Ayk//N/UKufckQT00BUbZv5v92sQzbshlUuuh
         5+l3zCe+m9WnIhfTvc9ima4euv5HWUANupobA77YcKE4ppOis9AYyHThcOqgh3ayMC1P
         aIL0lnPdMnInWOhdAYfRfLihH7UQaQlfrmfji4E4NzkkJkVNvl3XuMenXjJsBdSZ/Jy9
         qtRA1PY6aOsmTYX0jrtj0u4HLm0P1mDc7HnHc3oMpnvy+Fb1kLO7QBLol8Sc9oTJJgvp
         P0zI2uHrHHC5dz35WAj1gQD42d+0/NOalVLt9A1FLVCMaJRIjoi6QNSzdocyHl8rfFnr
         XE9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=T03Rdf+Vx8oBmcCLThkqJW95XvIu1/XQYtka4LL9C8c=;
        b=kalRAREoyt5uV8FymOQzNO8QnM931j60z2/iQDF4ppoBXJxDNpOhWp+DrcP5qP9N54
         KJdVpwxJ4GqIowUqg5szevIGamWwsLDI2vTv6j43AxfjoBHf1nUV0HWaMCo8VrwoXHSn
         Zgl6dcNJSTHDIIw7+X0EwRb3cCDdGE77YRZe/CGdJcQ7N1vmTXnqJShBmKiyvBGDYHTe
         35WfPwbxcowIOKUbgjVkpY/wR6XK9Ql+LYpGE+WYIw9LPqoACE9PjLphWq1ulj7gGgFI
         NTKtetpM7mAv8JrB18n584xNAJVOULEkDBq4NhYCgJwy3sEJHV6gFDDoNVzkeRnke+Un
         x2aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d143si22989074qke.153.2017.06.02.09.43.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Jun 2017 09:43:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50753 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGpfb-0007vZ-Lb
	for alex.bennee@linaro.org; Fri, 02 Jun 2017 12:43:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dGpZB-0001EX-5r
	for qemu-devel@nongnu.org; Fri, 02 Jun 2017 12:36:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dGpZA-0007j3-EC
	for qemu-devel@nongnu.org; Fri, 02 Jun 2017 12:36:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:53926)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1dGpZ8-0007gc-F8; Fri, 02 Jun 2017 12:36:46 -0400
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id DE8E423A25;
	Fri,  2 Jun 2017 16:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE8E423A25
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  2 Jun 2017 18:36:16 +0200
Message-Id: <20170602163618.6369-7-krzk@kernel.org>
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
Subject: [Qemu-devel] [PATCH v4 7/9] hw/arm/exynos: Use type define instead
 of hard-coded a9mpcore_priv string
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
X-TUID: j5LVBpQHQbrm

Use a define for a9mpcore_priv device type name instead of hard-coded
string.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/arm/exynos4210.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 27a7bf28a5a9..0050626a6967 100644
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
@@ -211,7 +212,7 @@ Exynos4210State *exynos4210_init(MemoryRegion *system=
_mem)
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

