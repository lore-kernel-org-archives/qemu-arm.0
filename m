Received: by 10.25.0.198 with SMTP id 189csp931996lfa;
        Sun, 7 May 2017 04:36:12 -0700 (PDT)
X-Received: by 10.200.42.29 with SMTP id k29mr53430905qtk.186.1494156971972;
        Sun, 07 May 2017 04:36:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494156971; cv=none;
        d=google.com; s=arc-20160816;
        b=qdPxgYPIVeeNBjQ4DyPY2k1sU8k8r3PdlgTEA6/ypX/XsrYYyFzCThDx1Mcb+ITWCX
         FxJtSiWYA336c+2AHEqDbTU+tTxDfMeC1LDvy+89BMNPAANvXPAbmHQf3CkwmIISOnUD
         WOVh9LVtGib+nn3jdXYxe43qxiZ/2HE3VUa91H2s24kXgDHCqRZunKtlRuGw3LfvBk1Y
         VbRS66SuCKiPV5GwRvod885XOgXSlpbOTOMAPmyHMOkbNoEkSU82rFEDetro8Td6TWgj
         9d4dTJA9xte5lAAgD1tbPEpZlLQ5xj/KIO8VCt3NUBQTABEXtwfX+pQiJg9MSUVgcE9e
         YxOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=tkcMP5nxh4jQ1piel9givoTZrJ/k8FaWxwirVSeJmwg=;
        b=Dcx8HSOkb2kYUJwF7C3f+nDPkR1eLmeYVuH3IX9oq16aFFDdd/TgY9KVCYuFa0ZuAw
         NeQroUfrj9Ao3Z/Vi5PC60dg8dim8Bllm3MjxEbsqHD5Jx4gBxthdsDK44FYIf2by40r
         R1uRVJBbp9MGiYMpm7S32uupsdRWdy+E+hT9EiCdyqlimJ32hHooyNFZ2NM8NCOx83NS
         5qc70JfyFyXd3wv6DIfTsHLOI9juUTZWteYF0ZX4DznBGRXZFjtHr0kyzQHvHe0JlHiR
         Iz/loEhUtn5rqDT8KgC3RcMIy+RQYjpmqwURXQe8tacVlrJXGxvFeS1e1cnyEmd+A5xg
         pdDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r36si9619034qte.315.2017.05.07.04.36.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 07 May 2017 04:36:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54549 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d7KTx-0007gR-96
	for alex.bennee@linaro.org; Sun, 07 May 2017 07:36:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1d7KTk-0007eG-DA
	for qemu-arm@nongnu.org; Sun, 07 May 2017 07:35:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1d7KTh-0004Uh-Tr
	for qemu-arm@nongnu.org; Sun, 07 May 2017 07:35:56 -0400
Received: from mail.kernel.org ([198.145.29.136]:56202)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1d7KTh-0004Ub-O8; Sun, 07 May 2017 07:35:53 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 870122037F;
	Sun,  7 May 2017 11:35:51 +0000 (UTC)
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id F01DB20377;
	Sun,  7 May 2017 11:35:48 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sun,  7 May 2017 13:35:38 +0200
Message-Id: <20170507113540.8687-2-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170507113540.8687-1-krzk@kernel.org>
References: <20170507113540.8687-1-krzk@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-arm] [PATCH 1/3] hw/arm/exynos: Use type define instead of
 hard-coded a9mpcore_priv string
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
X-TUID: vcvh/eqNE2sq

Use a define for a9mpcore_priv device type name instead of hard-coded
string.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
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
 
     /* Private memory region and Internal GIC */
-    dev = qdev_create(NULL, "a9mpcore_priv");
+    dev = qdev_create(NULL, TYPE_A9MPCORE_PRIV);
     qdev_prop_set_uint32(dev, "num-cpu", EXYNOS4210_NCPUS);
     qdev_init_nofail(dev);
     busdev = SYS_BUS_DEVICE(dev);
-- 
2.9.3

