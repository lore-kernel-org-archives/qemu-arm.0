Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp739870wrd;
        Mon, 20 Aug 2018 07:17:31 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPw9fQlernuGBpxmVkFQ+SdpGmODfHuDoB/MApYR3pyHERdZMUlV1gWUnA9V6rF0P6bUcFSu
X-Received: by 2002:a37:4653:: with SMTP id t80-v6mr40115459qka.314.1534774651607;
        Mon, 20 Aug 2018 07:17:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534774651; cv=none;
        d=google.com; s=arc-20160816;
        b=Y5jrHmT70+Cezl9VloWw0tKjUt2WBjTA29ek/Zl0m3v1k/enwc8HbeYzhEcyomPWi7
         S0Lvw2V8vH3tmRUC9SgDE4guF7UP63LMuMGVaaIqMg2KGx8xlF6kYClth9FNO7/9eM+4
         LvrxLz+2LKrroSQdFOxZqYDyUkNCPTOhotM9xFd7oMGdY/tBjM8onlKD2REuBbpyCao4
         0KF1FF6K5NNlcO5Rw162Z0oDX2uzcGxAw0rkQc9saytx0GR9RFatz02Mws0YlL3/zLky
         Oqcd4DH0jbtYQNBp4HoHrOv3FqjM1yE2V/uSlujeYmJQFKj2UUp+EIrE8Wc6QDRs2Edn
         YIMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Cqm2TFWis7S4ESZWWic3XrRhVDoqsy7Wf7mBJOQGJvU=;
        b=YePJKach1dZKW6CekYJcldRLyDCjmYS8T/ezWuRhmQsIbvzmXxPURUpSuOhEly+9Hn
         fwOHqMLDzoyZBLlEyrXRld3j7K0vo9oAcqyM15IHWJSGflyXxfyrIsbaa7JkBBoXgSZm
         TKfPfK42XdAv/I3Ma9zyBYVsI0tNhh7Snk50Ozbl+b8GOoiC0wxuspdMOhv+i1jF1133
         lv3rVl7J5nQznNtUchzaur2qHnEa19YlohhIce7iLn2pXiMi8iHQ0/Zc2hjKDd4/omvw
         MwYc2//b+Jq+QZqo5v83r/OpMth8/+C68wqJKe9DHtnJXlzV2q7cCfhWRxTD+QbPgcTu
         rOCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e25-v6si2759846qtk.87.2018.08.20.07.17.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 07:17:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47325 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frkzr-0000EG-1K
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 10:17:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frkuA-0003b5-Vh
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:11:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frku9-0007Kc-RQ
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:11:38 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44654)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frku9-0007Jz-IW; Mon, 20 Aug 2018 10:11:37 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frku8-0003Sl-Kh; Mon, 20 Aug 2018 15:11:36 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 15:11:09 +0100
Message-Id: <20180820141116.9118-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820141116.9118-1-peter.maydell@linaro.org>
References: <20180820141116.9118-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 15/22] hw/ssi/pl022: Allow use as embedded-struct
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z/IYGotUg/93

Create a new include file for the pl022's device struct,
type macros, etc, so that it can be instantiated using
the "embedded struct" coding style.

While we're adding the new file to MAINTAINERS, add
also the .c file, which was missing an entry.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/ssi/pl022.h | 51 ++++++++++++++++++++++++++++++++++++++++++
 hw/ssi/pl022.c         | 26 +--------------------
 MAINTAINERS            |  2 ++
 3 files changed, 54 insertions(+), 25 deletions(-)
 create mode 100644 include/hw/ssi/pl022.h

diff --git a/include/hw/ssi/pl022.h b/include/hw/ssi/pl022.h
new file mode 100644
index 00000000000..a080519366d
--- /dev/null
+++ b/include/hw/ssi/pl022.h
@@ -0,0 +1,51 @@
+/*
+ * ARM PrimeCell PL022 Synchronous Serial Port
+ *
+ * Copyright (c) 2007 CodeSourcery.
+ * Written by Paul Brook
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 or
+ * (at your option) any later version.
+ */
+
+/* This is a model of the Arm PrimeCell PL022 synchronous serial port.
+ * The PL022 TRM is:
+ * http://infocenter.arm.com/help/topic/com.arm.doc.ddi0194h/DDI0194H_ssp_pl022_trm.pdf
+ *
+ * QEMU interface:
+ * + sysbus IRQ: SSPINTR combined interrupt line
+ * + sysbus MMIO region 0: MemoryRegion for the device's registers
+ */
+
+#ifndef HW_SSI_PL022_H
+#define HW_SSI_PL022_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_PL022 "pl022"
+#define PL022(obj) OBJECT_CHECK(PL022State, (obj), TYPE_PL022)
+
+typedef struct PL022State {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+    uint32_t cr0;
+    uint32_t cr1;
+    uint32_t bitmask;
+    uint32_t sr;
+    uint32_t cpsr;
+    uint32_t is;
+    uint32_t im;
+    /* The FIFO head points to the next empty entry.  */
+    int tx_fifo_head;
+    int rx_fifo_head;
+    int tx_fifo_len;
+    int rx_fifo_len;
+    uint16_t tx_fifo[8];
+    uint16_t rx_fifo[8];
+    qemu_irq irq;
+    SSIBus *ssi;
+} PL022State;
+
+#endif
diff --git a/hw/ssi/pl022.c b/hw/ssi/pl022.c
index c1368018ee3..379d3093987 100644
--- a/hw/ssi/pl022.c
+++ b/hw/ssi/pl022.c
@@ -9,6 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
+#include "hw/ssi/pl022.h"
 #include "hw/ssi/ssi.h"
 #include "qemu/log.h"
 
@@ -41,31 +42,6 @@ do { fprintf(stderr, "pl022: error: " fmt , ## __VA_ARGS__);} while (0)
 #define PL022_INT_RX  0x04
 #define PL022_INT_TX  0x08
 
-#define TYPE_PL022 "pl022"
-#define PL022(obj) OBJECT_CHECK(PL022State, (obj), TYPE_PL022)
-
-typedef struct PL022State {
-    SysBusDevice parent_obj;
-
-    MemoryRegion iomem;
-    uint32_t cr0;
-    uint32_t cr1;
-    uint32_t bitmask;
-    uint32_t sr;
-    uint32_t cpsr;
-    uint32_t is;
-    uint32_t im;
-    /* The FIFO head points to the next empty entry.  */
-    int tx_fifo_head;
-    int rx_fifo_head;
-    int tx_fifo_len;
-    int rx_fifo_len;
-    uint16_t tx_fifo[8];
-    uint16_t rx_fifo[8];
-    qemu_irq irq;
-    SSIBus *ssi;
-} PL022State;
-
 static const unsigned char pl022_id[8] =
   { 0x22, 0x10, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0xb1 };
 
diff --git a/MAINTAINERS b/MAINTAINERS
index b2f8b562dc5..1e81ad8d4b1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -451,6 +451,8 @@ F: hw/gpio/pl061.c
 F: hw/input/pl050.c
 F: hw/intc/pl190.c
 F: hw/sd/pl181.c
+F: hw/ssi/pl022.c
+F: include/hw/ssi/pl022.h
 F: hw/timer/pl031.c
 F: include/hw/arm/primecell.h
 F: hw/timer/cmsdk-apb-timer.c
-- 
2.18.0

