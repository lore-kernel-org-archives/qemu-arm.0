Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1872278wru;
        Thu, 9 Aug 2018 06:02:19 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwcHmT599qbtkXlg0QCLVpC/h9IQNQK+x6hzfplIEtIfKZJqzquJ3XDw3/WYUelvd6ZAwQl
X-Received: by 2002:a0c:8797:: with SMTP id 23-v6mr1688426qvj.202.1533819739292;
        Thu, 09 Aug 2018 06:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533819739; cv=none;
        d=google.com; s=arc-20160816;
        b=kw2axJzesyY7aaiXd8vSmgzr/aq6HCI/SPRlDy6Cd8f5jXrwnREeKii0vcRx6JXE0Q
         qkQIZu95yQBDmJPSs3MMJSQyDpeZXjzcQWyGfHy7S6/cxx2LMVDsxK6PnZPEbiXSQwgs
         dIPCAS9RvqWPX884T8wceCnWNsv3kGi0782hm0nawMFuiuAE5vUcWlD/GeSv6/8j3iI2
         xbhyehghr5oX0wGDKpoek9L8I44pDRDDtBkHTO/xG/iq36UjksujpKC5nEKYyjoI1S9M
         3lFIOX8lo7hW8wTaCxcwK/pteUdOydOp0JZIaEvGQa/WL61wgaOxqEweye51XILAxkZT
         Xd+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=kobDFngLI/XKlBst3pxRV5FTylo4OQ8HKEVp/5oGXWM=;
        b=tQofK3fKKWICoUbjK5AMUCj4s6igZoYd+X3wOYq56Soa6Lc05dVMYAaAa5wkUHbTgL
         2wD7IEE7iY3l5QBCsREUSE7j4PBfwr/JYttY3hbtbOlzTwrd2iqS0rX0b8cXdijI0KW6
         YbZPIG2s56MeDyDFFFqma1sWr4NN/0pa4l5MUy8/4Ulu6zhQ+v+54tDCoRYPPlqHGrd8
         HrBb/2CDA2T+frbp+YktVnjMYaE/qTHPiug374eJNv/Dssiczq/gHhulc3/ZsLr4yJEL
         V/YU1rm1ONkrThcjtAEN5vvOqLNdnuT3erIesBiHV15/aJvRoQP5TCZ4VuiaEfsS6wc0
         MYYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b10-v6si6843507qtk.181.2018.08.09.06.02.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 06:02:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50696 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnka2-0006Fi-Oh
	for alex.bennee@linaro.org; Thu, 09 Aug 2018 09:02:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZI-0005ua-OG
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZG-0003Hx-9a
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:32 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44194)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fnkZG-00038J-0s; Thu, 09 Aug 2018 09:01:30 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fnkZE-0003J5-DM; Thu, 09 Aug 2018 14:01:28 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  9 Aug 2018 14:01:09 +0100
Message-Id: <20180809130115.28951-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180809130115.28951-1-peter.maydell@linaro.org>
References: <20180809130115.28951-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 10/16] hw/dma/pl080: Allow use as embedded-struct
 device
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cl6kkzRDlEL1

Create a new include file for the pl081's device struct,
type macros, etc, so that it can be instantiated using
the "embedded struct" coding style.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/dma/pl080.h | 62 ++++++++++++++++++++++++++++++++++++++++++
 hw/dma/pl080.c         | 34 ++---------------------
 MAINTAINERS            |  1 +
 3 files changed, 65 insertions(+), 32 deletions(-)
 create mode 100644 include/hw/dma/pl080.h

diff --git a/include/hw/dma/pl080.h b/include/hw/dma/pl080.h
new file mode 100644
index 00000000000..7deb46c8578
--- /dev/null
+++ b/include/hw/dma/pl080.h
@@ -0,0 +1,62 @@
+/*
+ * ARM PrimeCell PL080/PL081 DMA controller
+ *
+ * Copyright (c) 2006 CodeSourcery.
+ * Copyright (c) 2018 Linaro Limited
+ * Written by Paul Brook, Peter Maydell
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 or
+ * (at your option) any later version.
+ */
+
+/* This is a model of the Arm PrimeCell PL080/PL081 DMA controller:
+ * The PL080 TRM is:
+ * http://infocenter.arm.com/help/topic/com.arm.doc.ddi0196g/DDI0196.pdf
+ * and the PL081 TRM is:
+ * http://infocenter.arm.com/help/topic/com.arm.doc.ddi0218e/DDI0218.pdf
+ *
+ * QEMU interface:
+ * + sysbus IRQ: DMACINTR combined interrupt line
+ * + sysbus MMIO region 0: MemoryRegion for the device's registers
+ */
+
+#ifndef HW_DMA_PL080_H
+#define HW_DMA_PL080_H
+
+#include "hw/sysbus.h"
+
+#define PL080_MAX_CHANNELS 8
+
+typedef struct {
+    uint32_t src;
+    uint32_t dest;
+    uint32_t lli;
+    uint32_t ctrl;
+    uint32_t conf;
+} pl080_channel;
+
+#define TYPE_PL080 "pl080"
+#define TYPE_PL081 "pl081"
+#define PL080(obj) OBJECT_CHECK(PL080State, (obj), TYPE_PL080)
+
+typedef struct PL080State {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+    uint8_t tc_int;
+    uint8_t tc_mask;
+    uint8_t err_int;
+    uint8_t err_mask;
+    uint32_t conf;
+    uint32_t sync;
+    uint32_t req_single;
+    uint32_t req_burst;
+    pl080_channel chan[PL080_MAX_CHANNELS];
+    int nchannels;
+    /* Flag to avoid recursive DMA invocations.  */
+    int running;
+    qemu_irq irq;
+} PL080State;
+
+#endif
diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
index 7724c93b8f2..0f79c2d8a6c 100644
--- a/hw/dma/pl080.c
+++ b/hw/dma/pl080.c
@@ -11,8 +11,8 @@
 #include "hw/sysbus.h"
 #include "exec/address-spaces.h"
 #include "qemu/log.h"
+#include "hw/dma/pl080.h"
 
-#define PL080_MAX_CHANNELS 8
 #define PL080_CONF_E    0x1
 #define PL080_CONF_M1   0x2
 #define PL080_CONF_M2   0x4
@@ -30,36 +30,6 @@
 #define PL080_CCTRL_D   0x02000000
 #define PL080_CCTRL_S   0x01000000
 
-typedef struct {
-    uint32_t src;
-    uint32_t dest;
-    uint32_t lli;
-    uint32_t ctrl;
-    uint32_t conf;
-} pl080_channel;
-
-#define TYPE_PL080 "pl080"
-#define PL080(obj) OBJECT_CHECK(PL080State, (obj), TYPE_PL080)
-
-typedef struct PL080State {
-    SysBusDevice parent_obj;
-
-    MemoryRegion iomem;
-    uint8_t tc_int;
-    uint8_t tc_mask;
-    uint8_t err_int;
-    uint8_t err_mask;
-    uint32_t conf;
-    uint32_t sync;
-    uint32_t req_single;
-    uint32_t req_burst;
-    pl080_channel chan[PL080_MAX_CHANNELS];
-    int nchannels;
-    /* Flag to avoid recursive DMA invocations.  */
-    int running;
-    qemu_irq irq;
-} PL080State;
-
 static const VMStateDescription vmstate_pl080_channel = {
     .name = "pl080_channel",
     .version_id = 1,
@@ -408,7 +378,7 @@ static const TypeInfo pl080_info = {
 };
 
 static const TypeInfo pl081_info = {
-    .name          = "pl081",
+    .name          = TYPE_PL081,
     .parent        = TYPE_PL080,
     .instance_init = pl081_init,
 };
diff --git a/MAINTAINERS b/MAINTAINERS
index 5d1a3645dd4..92ccca716c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -444,6 +444,7 @@ F: hw/char/pl011.c
 F: include/hw/char/pl011.h
 F: hw/display/pl110*
 F: hw/dma/pl080.c
+F: include/hw/dma/pl080.h
 F: hw/dma/pl330.c
 F: hw/gpio/pl061.c
 F: hw/input/pl050.c
-- 
2.17.1

