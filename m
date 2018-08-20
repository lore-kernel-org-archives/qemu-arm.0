Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp733652wrd;
        Mon, 20 Aug 2018 07:11:35 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwJynWoRRMYdO03CqtDZ2JBdMaGkzYJWFldTOj5/z7Z1m2SOkgHvLAZtBqLSrbjmtvAp6Tg
X-Received: by 2002:aed:3aa4:: with SMTP id o33-v6mr44451365qte.359.1534774295593;
        Mon, 20 Aug 2018 07:11:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534774295; cv=none;
        d=google.com; s=arc-20160816;
        b=yhs4uobH3twAHgsyaKN5xhYNshrdj5emp+889Lz4hAClyrdIFohgcVJuXPDlhjLvMJ
         uW9Obfeo/bqwAMw6C7A0/NgwPvdhbTyVjXU7FDS7h0ZiTjD2yoKwQiHBMfr0ettjVmk6
         IYgsOVGCdjhVrcGmTyU40maptrXCItsObbJF8YeWyapHVwSp1KUQSXqg6RfgZnPkxO6i
         l2F0hd2kF3Ah/8NjMhXI+hOYfvdzLxUOW+cXmjbkqP9v1CxFjZ4Ogc/QEDlYUqYsabHh
         QXOZ4OP/PMfdA1VL9TTwTyaDVPierUZgC1mjBAyFfqoFExNyBKMTDorgvk/nSp7Z1L2a
         LRjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ED7IXS/gqm1INg8UfNKBgtSLpRw8fu1eA2cB+YwWdGE=;
        b=uT0vxS3rl7F57oBVRrmRnQEQMg82dlxGMeMSLE0yvHWhL/dwzF54AQyvlYPOG3eRmf
         HBL+t/yq9G11UYfUhlhyIncMKdGKu/mN0SFtWfCAI51XUygX/AkNoLk6N/fgeCFY7uKc
         b9/FyrW5N1FqWNQ2GeuAaWA7Cycjiyc0T6BNKC9XebZWseMKrSyRUJ3M+gJVmt1ctoju
         z+tTz8R5m3sNR/fidiJeKNpdLMFkV8fU69q95fVZo6Qc3P/xD4FUfjCFlEkY5EzppvYJ
         mSKxbOjd3ohJq1H6/9b65n2dtdrcQBF+4IO8iv0UtyD7+vMrZJ2E6XvrWuuC3GakJErs
         Imhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o4-v6si841060qvi.277.2018.08.20.07.11.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 07:11:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47283 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frku6-0003O1-U5
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 10:11:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frkty-0003Nr-Ga
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:11:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frktx-0007Aw-OY
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:11:26 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44614)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frktx-0007AT-Fm; Mon, 20 Aug 2018 10:11:25 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frktw-0003N2-HX; Mon, 20 Aug 2018 15:11:24 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 15:10:59 +0100
Message-Id: <20180820141116.9118-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820141116.9118-1-peter.maydell@linaro.org>
References: <20180820141116.9118-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 05/22] hw/arm/mps2: Wire up dual-timer in
 mps2-an385 and mps2-an511
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
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FPIDxVQOvSZ0

The MPS2 FPGA images for the Cortex-M3 (mps2-an385 and mps2-511)
both include a CMSDK dual-timer module. Wire this up.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 0a0ae867d9b..564624629d0 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -34,6 +34,7 @@
 #include "hw/misc/unimp.h"
 #include "hw/char/cmsdk-apb-uart.h"
 #include "hw/timer/cmsdk-apb-timer.h"
+#include "hw/timer/cmsdk-apb-dualtimer.h"
 #include "hw/misc/mps2-scc.h"
 #include "hw/devices.h"
 #include "net/net.h"
@@ -64,6 +65,7 @@ typedef struct {
     MemoryRegion blockram_m3;
     MemoryRegion sram;
     MPS2SCC scc;
+    CMSDKAPBDualTimer dualtimer;
 } MPS2MachineState;
 
 #define TYPE_MPS2_MACHINE "mps2"
@@ -297,6 +299,15 @@ static void mps2_common_init(MachineState *machine)
     cmsdk_apb_timer_create(0x40000000, qdev_get_gpio_in(armv7m, 8), SYSCLK_FRQ);
     cmsdk_apb_timer_create(0x40001000, qdev_get_gpio_in(armv7m, 9), SYSCLK_FRQ);
 
+    sysbus_init_child_obj(OBJECT(mms), "dualtimer", &mms->dualtimer,
+                          sizeof(mms->dualtimer), TYPE_CMSDK_APB_DUALTIMER);
+    qdev_prop_set_uint32(DEVICE(&mms->dualtimer), "pclk-frq", SYSCLK_FRQ);
+    object_property_set_bool(OBJECT(&mms->dualtimer), true, "realized",
+                             &error_fatal);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&mms->dualtimer), 0,
+                       qdev_get_gpio_in(armv7m, 10));
+    sysbus_mmio_map(SYS_BUS_DEVICE(&mms->dualtimer), 0, 0x40002000);
+
     object_initialize(&mms->scc, sizeof(mms->scc), TYPE_MPS2_SCC);
     sccdev = DEVICE(&mms->scc);
     qdev_set_parent_bus(sccdev, sysbus_get_default());
-- 
2.18.0

