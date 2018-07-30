Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3992066wru;
        Mon, 30 Jul 2018 09:57:26 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdjVhrRXQVHyDGvWI421p427MX+OBf9DytIlTdFY3slwztpjuAnKLOcLHvSlt5Ey2EbeH4m
X-Received: by 2002:a37:b445:: with SMTP id d66-v6mr16140891qkf.357.1532969846437;
        Mon, 30 Jul 2018 09:57:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532969846; cv=none;
        d=google.com; s=arc-20160816;
        b=YFHb7riZaZXSYKgc3YdZoNY7RM9VWcN3GUwIiCIXX/D/mcfILYNwNTCBMxE71D1Hfg
         7nijcx3bLuv90waP8Ukp9QLRwFRfjgxXMJTxa0Az4LzGq1/L/hEzy7Kvz+9fLIlMUdAN
         yrRY8AuUobgwxF+FNziLZ6IjYtgBVExOooLcbvVB+Rdn1nbW++pSDu7Yeg2Hbcbvj/cK
         BnCciKcVoN/1n0kdxdR4tM50U21LmfP178H4zVQiwiV3l9kFrvu9v3nU18Y6fQqDPd6n
         3EyU8jSrZdLii14WtPuym7IrpLIGEaQMdektkVUVcsgDOYJyBMT2m1BUU8uhvadVmo0P
         sytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=HxOfsRCZNl2yxK56AkEnIe1tb+9rXfWFzX32j/06Tqw=;
        b=vRrWl77Lm8wr65AxzqCRHCyF4PCpEIvRSvXbNTRoSNI4hjz6gbmPNpScP8VLiY0/GB
         ZSTyWYAeh62+yannWvocV5Xdi1v0EgZVn2D8GLzpf9YGlgvOgUGVeRvQRo7iHWCXyUVl
         +8CbCIBqAJhLodzf76f90PjZQQsSU0I8FLCEnMIcE1vDxo/xJ8CivIkRwCGbvu5Nypcv
         /7DwpFbiew6681PgjIOm6rZY1hxWjfOmbgdNJB2UgA/jzWhPwnRVfadqsh+/nIYOs4Z1
         i+ovXLdf3rpc+1j7kavTJOeRRs1SYbJJftasNNb7Jvmc5EtStqE0iOcJ00ytgLnOVZj1
         oxZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f96-v6si5339537qtb.199.2018.07.30.09.57.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jul 2018 09:57:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53805 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkBU5-00041P-Rh
	for alex.bennee@linaro.org; Mon, 30 Jul 2018 12:57:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fkAyp-0001LO-NA
	for qemu-devel@nongnu.org; Mon, 30 Jul 2018 12:25:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fkAyo-0001D1-J8
	for qemu-devel@nongnu.org; Mon, 30 Jul 2018 12:25:07 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43826)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fkAym-00019i-8w; Mon, 30 Jul 2018 12:25:04 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fkAyk-0004MC-Mh; Mon, 30 Jul 2018 17:25:02 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 30 Jul 2018 17:24:58 +0100
Message-Id: <20180730162458.23186-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180730162458.23186-1-peter.maydell@linaro.org>
References: <20180730162458.23186-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 5/5] hw/arm/mps2: Wire up dual-timer in
 mps2-an385 and mps2-an511
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xTGRUFC4z071

The MPS2 FPGA images for the Cortex-M3 (mps2-an385 and mps2-511)
both include a CMSDK dual-timer module. Wire this up.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index c3946da3173..b0125ca0ebf 100644
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
@@ -296,6 +298,15 @@ static void mps2_common_init(MachineState *machine)
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
2.17.1

