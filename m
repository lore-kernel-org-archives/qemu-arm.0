Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4843234wro;
        Mon, 29 Oct 2018 16:21:46 -0700 (PDT)
X-Google-Smtp-Source: AJdET5d3dqZDQzzzRS1tZTKPW9yzwVoLImCFd1hzST19jX2WoNOlDRe0Kbo9B5wQr+NfGocUBemp
X-Received: by 2002:a37:25cb:: with SMTP id l72mr3124445qkl.247.1540855306816;
        Mon, 29 Oct 2018 16:21:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540855306; cv=none;
        d=google.com; s=arc-20160816;
        b=CkvFGY05X8npENBQ5xmtXLT5KUI3q3FAxeln4V3IjPuw8fCf68RS5hzUCi/uu7FZsL
         0Ten/Cb7VeeXPtP/T/Y6epOQSha2HjApK62GG5vP5S0FNrgO3NQLObeTABp1J98bY/2g
         Z1BH79tV7VGCXi2uYYYS/MGliMBBSKcoJaUZT/V398O5EApIng6bkyuK0N5QbbS5yzcC
         CW6GuKXQCH4tKOEUGnZdQgz5Hebwt6I6ijK+3osBOA8KbnD2jGy0ZNdExyCqlnJBmUm2
         GPcxqfRjZLcKZzepWOPBgP0r8KHQlrHRGd3Kg8ARM4Ws9NCDi6r8JDIwOm4A/HNBA81i
         qFUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=klLkkh2xKATlmssb8DVfEBYHUG68IVJJ5BR+xul8Z84=;
        b=fzMeqJphfNpi2H39av87spy/1vU02JIqxRvXZ5+vxih1/lMV9wpt940S7ELa8GqIy5
         WJ8A6AAZZ2vgZkKtuSbkOu9fSnM2tm7+JNGBc6Y2obCEDwgML+imHRhuD+zU+VV2bWrU
         89zrsoziaIVkEBW/hT1HLUzsIYEwbiFhRDaVev1d3OZcLrtLxTMQUKf8F70M60IzYXmN
         zBsVAw1gUWWiE+SkSTqexEGb2cEPR0awe3GGaZofItc8oxc3dedWoqjn2RSEJN07PFjn
         zHn+i5ahens7/LIIyqhnm+kJdAAGDQ/U6cJ/tRuXhX0qbg6kKRiAwO4InC/5dsgETzXI
         Offw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t20si11438960qki.262.2018.10.29.16.21.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 16:21:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49537 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHGqw-0001Lw-BB
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 19:21:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHGqi-0001J8-Tt
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 19:21:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHGqc-00004v-D6
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 19:21:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54764)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gHGqZ-0008Tm-UU; Mon, 29 Oct 2018 19:21:25 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 18C264E90D;
	Mon, 29 Oct 2018 23:21:22 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-38.brq.redhat.com [10.40.204.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1FE119489;
	Mon, 29 Oct 2018 23:21:18 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>
Date: Tue, 30 Oct 2018 00:20:59 +0100
Message-Id: <20181029232100.8454-3-philmd@redhat.com>
In-Reply-To: <20181029232100.8454-1-philmd@redhat.com>
References: <20181029232100.8454-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 29 Oct 2018 23:21:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 2/3] hw/dma/pl330: Factor out pl330_init() from
 hw/arm/xilinx_zynq.c
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aYquDg5v9oNu

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS            |  1 +
 hw/arm/xilinx_zynq.c   | 18 ++----------------
 hw/dma/pl330.c         |  2 +-
 include/hw/dma/pl330.h | 41 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 45 insertions(+), 17 deletions(-)
 create mode 100644 include/hw/dma/pl330.h

diff --git a/MAINTAINERS b/MAINTAINERS
index d794bd7a66..647e2aa0d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -452,6 +452,7 @@ F: hw/display/pl110*
 F: hw/dma/pl080.c
 F: include/hw/dma/pl080.h
 F: hw/dma/pl330.c
+F: include/hw/dma/pl330.h
 F: hw/gpio/pl061.c
 F: hw/input/pl050.c
 F: hw/intc/pl190.c
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 57497b0c4d..a4c4d44f00 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -34,6 +34,7 @@
 #include "hw/char/cadence_uart.h"
 #include "hw/net/cadence_gem.h"
 #include "hw/cpu/a9mpcore.h"
+#include "hw/dma/pl330.h"
=20
 #define NUM_SPI_FLASHES 4
 #define NUM_QSPI_FLASHES 2
@@ -278,22 +279,7 @@ static void zynq_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xF8007100);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[39-IRQ_OFFSET]);
=20
-    dev =3D qdev_create(NULL, "pl330");
-    qdev_prop_set_uint8(dev, "num_chnls",  8);
-    qdev_prop_set_uint8(dev, "num_periph_req",  4);
-    qdev_prop_set_uint8(dev, "num_events",  16);
-
-    qdev_prop_set_uint8(dev, "data_width",  64);
-    qdev_prop_set_uint8(dev, "wr_cap",  8);
-    qdev_prop_set_uint8(dev, "wr_q_dep",  16);
-    qdev_prop_set_uint8(dev, "rd_cap",  8);
-    qdev_prop_set_uint8(dev, "rd_q_dep",  16);
-    qdev_prop_set_uint16(dev, "data_buffer_dep",  256);
-
-    qdev_init_nofail(dev);
-    busdev =3D SYS_BUS_DEVICE(dev);
-    sysbus_mmio_map(busdev, 0, 0xF8003000);
-    sysbus_connect_irq(busdev, 0, pic[45-IRQ_OFFSET]); /* abort irq line=
 */
+    pl330_init(0xf8003000, pic[45 - IRQ_OFFSET], 4); /* abort irq line *=
/
     for (n =3D 0; n < ARRAY_SIZE(dma_irqs); ++n) { /* event irqs */
         sysbus_connect_irq(busdev, n + 1, pic[dma_irqs[n] - IRQ_OFFSET])=
;
     }
diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index d071049233..711cf9a605 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -20,6 +20,7 @@
 #include "qemu/timer.h"
 #include "sysemu/dma.h"
 #include "qemu/log.h"
+#include "hw/dma/pl330.h"
=20
 #ifndef PL330_ERR_DEBUG
 #define PL330_ERR_DEBUG 0
@@ -271,7 +272,6 @@ struct PL330State {
=20
 };
=20
-#define TYPE_PL330 "pl330"
 #define PL330(obj) OBJECT_CHECK(PL330State, (obj), TYPE_PL330)
=20
 static const VMStateDescription vmstate_pl330 =3D {
diff --git a/include/hw/dma/pl330.h b/include/hw/dma/pl330.h
new file mode 100644
index 0000000000..9a586c0df9
--- /dev/null
+++ b/include/hw/dma/pl330.h
@@ -0,0 +1,41 @@
+/*
+ * ARM PrimeCell PL330 DMA Controller
+ *
+ * Copyright (c) 2009 Samsung Electronics.
+ * Contributed by Kirill Batuzov <batuzovk@ispras.ru>
+ * Copyright (c) 2012 Peter A.G. Crosthwaite (peter.crosthwaite@petalogi=
x.com)
+ * Copyright (c) 2012 PetaLogix Pty Ltd.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_DMA_PL330_H
+#define HW_DMA_PL330_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_PL330 "pl330"
+
+static inline void pl330_init(uint32_t base, qemu_irq irq, int nreq)
+{
+    SysBusDevice *busdev;
+    DeviceState *dev;
+
+    dev =3D qdev_create(NULL, TYPE_PL330);
+    qdev_prop_set_uint8(dev, "num_chnls", 8);
+    qdev_prop_set_uint8(dev, "num_periph_req", nreq);
+    qdev_prop_set_uint8(dev, "num_events", 16);
+    qdev_prop_set_uint8(dev, "data_width", 64);
+    qdev_prop_set_uint8(dev, "wr_cap", 8);
+    qdev_prop_set_uint8(dev, "wr_q_dep", 16);
+    qdev_prop_set_uint8(dev, "rd_cap", 8);
+    qdev_prop_set_uint8(dev, "rd_q_dep", 16);
+    qdev_prop_set_uint16(dev, "data_buffer_dep", 256);
+    qdev_init_nofail(dev);
+
+    busdev =3D SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(busdev, 0, base);
+    sysbus_connect_irq(busdev, 0, irq);
+}
+
+#endif /* HW_DMA_PL330_H */
--=20
2.17.2

