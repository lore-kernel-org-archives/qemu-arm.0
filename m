Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4843475wro;
        Mon, 29 Oct 2018 16:22:05 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eAnVTK0Rm8X6QkTR7OZAVK2t4PDYS0XdUT6cBb/RNkD7hn6akI37azasEJsGhvPATwmikn
X-Received: by 2002:ac8:4145:: with SMTP id e5-v6mr372510qtm.330.1540855325734;
        Mon, 29 Oct 2018 16:22:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540855325; cv=none;
        d=google.com; s=arc-20160816;
        b=YN4oerRzs6siCko2i2/VSmvLLt4q+d87yciNUqpSKV2Wou7pB1AVl+MpefnZSyIqJo
         SUTNSYi7irsjXYnPkkEcyizEeTTGp6W5DNMqMsHfau7RxOCEdsgy9V80kX+sGaYw8uwv
         yUXuLAQ0QWXqDzGAf+FP2KRCP5CnxXf/S2rwaUeOidya7JeB8HlhJq+XXawcxxs22PgC
         JRcXyKHzEalrk3t3jARx7xrmOSPBCL6oIbYBMWuSweA4nDbAhTQ+N8kE7hNurqS7A7N/
         awTUSEaCwCp7ybYCAF1y8Bm+u3MrZziQABbxBnCTDekQ+YnsNTDXcybXGnN6ELC3oRXl
         5wsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=C6RJhtXGunjTni3ohvtbzSLKGRj1uP4i8WxkczSNvfM=;
        b=cULv9Tm+O2rjzIjvhWUAefIxaD1jcxD5wLo8YGlH9TCebaYiRG2qlRN5c76c6FXY39
         gXfr9iBlOuSdHiW6Jk9WO9dE3YeLB0Daci7orYGIPINJvV4GqCtEFk56HE3ormMyDoc7
         XwheCldS/0rg/O9aH85ZRL6IxCAeoT7fA5U51i5U+bcfh3VMt1QDl0kD0k75f0vzLvjz
         63yr/0+Bt3vCz3/gnjrtKGWfP3P8qfVumGITb59VwT7YW5pbyyG8vUAvE6YqmjHDQXe9
         s3roxnLQ4LyKjP0XN/4sst5p2m/Bf8zfRxfX6IPxLqwdQvUO+rzFg76uTArrI4tCm2Kn
         O5DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q7si2769991qvc.195.2018.10.29.16.22.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 16:22:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49538 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHGrF-0001P6-61
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 19:22:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHGqo-0001NS-2q
	for qemu-devel@nongnu.org; Mon, 29 Oct 2018 19:21:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHGqn-0000FV-7e
	for qemu-devel@nongnu.org; Mon, 29 Oct 2018 19:21:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40068)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gHGqc-0008W7-F2; Mon, 29 Oct 2018 19:21:26 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A251D85540;
	Mon, 29 Oct 2018 23:21:25 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-38.brq.redhat.com [10.40.204.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95FCC19489;
	Mon, 29 Oct 2018 23:21:22 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>
Date: Tue, 30 Oct 2018 00:21:00 +0100
Message-Id: <20181029232100.8454-4-philmd@redhat.com>
In-Reply-To: <20181029232100.8454-1-philmd@redhat.com>
References: <20181029232100.8454-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 29 Oct 2018 23:21:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/3] arm: exynos4: Add dma support for smdkc210
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ypCjW5dFL4bS

From: Guenter Roeck <linux@roeck-us.net>

QEMU already supports pl330. Instantiate it for smdkc210.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
[PMD: Use pl330_init from "hw/dma/pl330.h"]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/exynos4_boards.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index 750162cc95..b36f407a52 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -32,6 +32,7 @@
 #include "hw/arm/arm.h"
 #include "exec/address-spaces.h"
 #include "hw/arm/exynos4210.h"
+#include "hw/dma/pl330.h"
 #include "hw/boards.h"
=20
 #undef DEBUG
@@ -49,6 +50,9 @@
 #endif
=20
 #define SMDK_LAN9118_BASE_ADDR      0x05000000
+#define SMDK_PL330_BASE0_ADDR       0x12680000
+#define SMDK_PL330_BASE1_ADDR       0x12690000
+#define SMDK_PL330_BASE2_ADDR       0x12850000
=20
 typedef enum Exynos4BoardType {
     EXYNOS4_BOARD_NURI,
@@ -171,6 +175,14 @@ static void smdkc210_init(MachineState *machine)
=20
     lan9215_init(SMDK_LAN9118_BASE_ADDR,
             qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(37, 1)]=
));
+
+    pl330_init(SMDK_PL330_BASE0_ADDR,
+            qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(35, 1)]=
), 32);
+    pl330_init(SMDK_PL330_BASE1_ADDR,
+            qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(36, 1)]=
), 32);
+    pl330_init(SMDK_PL330_BASE2_ADDR,
+            qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(34, 1)]=
), 1);
+
     arm_load_kernel(ARM_CPU(first_cpu), &exynos4_board_binfo);
 }
=20
--=20
2.17.2

