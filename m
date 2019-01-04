Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp859640wrt;
        Fri, 4 Jan 2019 09:59:58 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6sUQmwO7HhvqPuS1iH9pxKddackPs3RIsIsQfcQY3vtbGsb0HhMYeJAu85izmvE6WWs6m5
X-Received: by 2002:aed:2314:: with SMTP id h20mr50738798qtc.286.1546624798654;
        Fri, 04 Jan 2019 09:59:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546624798; cv=none;
        d=google.com; s=arc-20160816;
        b=pTmnfsKH234tYV6m4+IMCJqENFTEWeljsVF7snuTRxIYsHP+sAa5SL2djfDZJ4WIkW
         3wnj6egzquGf4hQWL7C9JpzR0fWvxmEyKDHaC+raqk23HEbVhf8Du7aY+3Ay0MO8mrCJ
         JNAVLcUtHu6bGreRwixOes295tLGotssm7rxiGanhhYrcC+xsHCTzj8G039lCFPc3tp0
         M7ZmEgMc8FxalV4ek3VdwjcRZ3Mb/2IGZTo/t4aid/W8zoVXOo3eeetfg1IXSZDzMD/r
         wwFqZr0c2mV8ZPcSM+szOcNhM/OYqprVVy4A+2nEKz0s5iT604h2uk7Z0TJAAH9dQlnU
         E5Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=MXmlIEpq4CESEuuQgf7S0VRRVBgfI7iJslQSqgMuYAw=;
        b=mHvMSCmRF3nu7k49oP0/q+Ss1foEMJhr7OPmXb5gEUXmaiwiCkgSrIgqCxTGaGYRR2
         VRW1FZoTc/uUXo/a06Gr3cicAvshnASmWpq3koj9VlYluV5nixIT1s53RYwzc0KELaAr
         fnqMm7SFxrQRAH472cvWfXMVGpCgJrGF27B1zm44lHHRNreFkQlR0UkYGj6RJdpXgxVN
         7oxAiCUzjEmhsAF30a2Bsh7lhuWOZyLIVpbd2U/juvNfsaN918yAvVp+2DGXhGci0vzL
         f32dLBZ5IEPSLoS9hCD5TMFkCUuqZ4AcAPH7ylxBziyxalnib9Dl1UtnlVv43JX4h8ht
         Vg9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id a127si745374qkf.126.2019.01.04.09.59.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 09:59:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37683 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfTlG-0002yg-3b
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 12:59:58 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTku-0002n8-EO
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 12:59:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gfTkr-0004Kz-98
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 12:59:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55284)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gfTkr-0004KV-1f; Fri, 04 Jan 2019 12:59:33 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 07D1D7F3FA;
	Fri,  4 Jan 2019 17:59:32 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-119.brq.redhat.com [10.40.204.119])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 838735D6A9;
	Fri,  4 Jan 2019 17:59:19 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Date: Fri,  4 Jan 2019 18:58:33 +0100
Message-Id: <20190104175847.6290-3-philmd@redhat.com>
In-Reply-To: <20190104175847.6290-1-philmd@redhat.com>
References: <20190104175847.6290-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 04 Jan 2019 17:59:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 02/16] hw: Remove unused 'hw/devices.h' include
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Joel Stanley <joel@jms.id.au>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WKdZbZFww4MX

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/alpha/typhoon.c                       | 1 -
 hw/arm/allwinner-a10.c                   | 1 -
 hw/arm/collie.c                          | 1 -
 hw/arm/cubieboard.c                      | 1 -
 hw/arm/highbank.c                        | 1 -
 hw/arm/mps2-tz.c                         | 1 -
 hw/arm/musicpal.c                        | 1 -
 hw/arm/nrf51_soc.c                       | 1 -
 hw/arm/spitz.c                           | 1 -
 hw/arm/virt.c                            | 1 -
 hw/arm/z2.c                              | 1 -
 hw/display/sm501.c                       | 1 -
 hw/hppa/dino.c                           | 1 -
 hw/intc/allwinner-a10-pic.c              | 1 -
 hw/lm32/lm32_boards.c                    | 1 -
 hw/lm32/milkymist.c                      | 1 -
 hw/microblaze/petalogix_ml605_mmu.c      | 1 -
 hw/microblaze/petalogix_s3adsp1800_mmu.c | 1 -
 hw/net/dp8393x.c                         | 1 -
 hw/ppc/virtex_ml507.c                    | 1 -
 hw/sh4/r2d.c                             | 1 -
 hw/tricore/tricore_testboard.c           | 1 -
 hw/usb/tusb6010.c                        | 1 -
 23 files changed, 23 deletions(-)

diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index 8004afe45b..90aa71eb01 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -11,7 +11,6 @@
 #include "qapi/error.h"
 #include "cpu.h"
 #include "hw/hw.h"
-#include "hw/devices.h"
 #include "sysemu/sysemu.h"
 #include "alpha_sys.h"
 #include "exec/address-spaces.h"
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 9fe875cdb5..8c07086a01 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -20,7 +20,6 @@
 #include "qemu-common.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
-#include "hw/devices.h"
 #include "hw/arm/allwinner-a10.h"
=20
 static void aw_a10_init(Object *obj)
diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index 48b732c176..3ca4e078fe 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -12,7 +12,6 @@
 #include "hw/hw.h"
 #include "hw/sysbus.h"
 #include "hw/boards.h"
-#include "hw/devices.h"
 #include "strongarm.h"
 #include "hw/arm/arm.h"
 #include "hw/block/flash.h"
diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 32f1edd2fa..84187d3916 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -20,7 +20,6 @@
 #include "qemu-common.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
-#include "hw/devices.h"
 #include "hw/boards.h"
 #include "hw/arm/allwinner-a10.h"
=20
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index fb9efa02c3..96ccf18d86 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -21,7 +21,6 @@
 #include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "hw/arm/arm.h"
-#include "hw/devices.h"
 #include "hw/loader.h"
 #include "net/net.h"
 #include "sysemu/kvm.h"
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 82b1d020a5..1232d6ff95 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -49,7 +49,6 @@
 #include "hw/arm/iotkit.h"
 #include "hw/dma/pl080.h"
 #include "hw/ssi/pl022.h"
-#include "hw/devices.h"
 #include "net/net.h"
 #include "hw/core/split-irq.h"
=20
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index d22532a11c..de4a12e496 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -15,7 +15,6 @@
 #include "cpu.h"
 #include "hw/sysbus.h"
 #include "hw/arm/arm.h"
-#include "hw/devices.h"
 #include "net/net.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index b89c1bdea0..d53b45a094 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -14,7 +14,6 @@
 #include "hw/arm/arm.h"
 #include "hw/sysbus.h"
 #include "hw/boards.h"
-#include "hw/devices.h"
 #include "hw/misc/unimp.h"
 #include "exec/address-spaces.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index c4bc3deedf..22f5958b9d 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -21,7 +21,6 @@
 #include "hw/ssi/ssi.h"
 #include "hw/block/flash.h"
 #include "qemu/timer.h"
-#include "hw/devices.h"
 #include "hw/arm/sharpsl.h"
 #include "ui/console.h"
 #include "hw/audio/wm8750.h"
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c2641e56ea..f02d157be6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -37,7 +37,6 @@
 #include "hw/vfio/vfio-calxeda-xgmac.h"
 #include "hw/vfio/vfio-amd-xgbe.h"
 #include "hw/display/ramfb.h"
-#include "hw/devices.h"
 #include "net/net.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/numa.h"
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 697a822f1e..7afa352a96 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -15,7 +15,6 @@
 #include "hw/hw.h"
 #include "hw/arm/pxa.h"
 #include "hw/arm/arm.h"
-#include "hw/devices.h"
 #include "hw/i2c/i2c.h"
 #include "hw/ssi/ssi.h"
 #include "hw/boards.h"
diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 4a8686f0f5..2122291308 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -32,7 +32,6 @@
 #include "hw/hw.h"
 #include "hw/char/serial.h"
 #include "ui/console.h"
-#include "hw/devices.h"
 #include "hw/sysbus.h"
 #include "hw/pci/pci.h"
 #include "hw/i2c/i2c.h"
diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index 31e09942b5..25c3178097 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -15,7 +15,6 @@
 #include "qapi/error.h"
 #include "cpu.h"
 #include "hw/hw.h"
-#include "hw/devices.h"
 #include "sysemu/sysemu.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
diff --git a/hw/intc/allwinner-a10-pic.c b/hw/intc/allwinner-a10-pic.c
index 11f13663c8..1aa628cbbb 100644
--- a/hw/intc/allwinner-a10-pic.c
+++ b/hw/intc/allwinner-a10-pic.c
@@ -17,7 +17,6 @@
=20
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
-#include "hw/devices.h"
 #include "sysemu/sysemu.h"
 #include "hw/intc/allwinner-a10-pic.h"
 #include "qemu/log.h"
diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
index fd8eccca14..6b2fac55fb 100644
--- a/hw/lm32/lm32_boards.c
+++ b/hw/lm32/lm32_boards.c
@@ -25,7 +25,6 @@
 #include "hw/sysbus.h"
 #include "hw/hw.h"
 #include "hw/block/flash.h"
-#include "hw/devices.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "elf.h"
diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
index 63c6894c95..08e39260d3 100644
--- a/hw/lm32/milkymist.c
+++ b/hw/lm32/milkymist.c
@@ -27,7 +27,6 @@
 #include "hw/block/flash.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/qtest.h"
-#include "hw/devices.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "elf.h"
diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogi=
x_ml605_mmu.c
index c730878d25..18048d3555 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -35,7 +35,6 @@
 #include "net/net.h"
 #include "hw/block/flash.h"
 #include "sysemu/sysemu.h"
-#include "hw/devices.h"
 #include "hw/boards.h"
 #include "hw/char/serial.h"
 #include "exec/address-spaces.h"
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/pet=
alogix_s3adsp1800_mmu.c
index 5cf7b84c79..4ab343b44b 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -33,7 +33,6 @@
 #include "net/net.h"
 #include "hw/block/flash.h"
 #include "sysemu/sysemu.h"
-#include "hw/devices.h"
 #include "hw/boards.h"
 #include "exec/address-spaces.h"
 #include "hw/char/xilinx_uartlite.h"
diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index b53fcaa8bc..98cb4e58c7 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -19,7 +19,6 @@
=20
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
-#include "hw/devices.h"
 #include "net/net.h"
 #include "qapi/error.h"
 #include "qemu/timer.h"
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 5177120574..8142d68ca2 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -31,7 +31,6 @@
 #include "hw/block/flash.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/qtest.h"
-#include "hw/devices.h"
 #include "hw/boards.h"
 #include "sysemu/device_tree.h"
 #include "hw/loader.h"
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 6a5fc46a47..64590c2b9b 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -31,7 +31,6 @@
 #include "hw/sysbus.h"
 #include "hw/hw.h"
 #include "hw/sh4/sh.h"
-#include "hw/devices.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
 #include "hw/pci/pci.h"
diff --git a/hw/tricore/tricore_testboard.c b/hw/tricore/tricore_testboar=
d.c
index a58096f05e..364321735a 100644
--- a/hw/tricore/tricore_testboard.c
+++ b/hw/tricore/tricore_testboard.c
@@ -24,7 +24,6 @@
 #include "qemu-common.h"
 #include "cpu.h"
 #include "hw/hw.h"
-#include "hw/devices.h"
 #include "net/net.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
diff --git a/hw/usb/tusb6010.c b/hw/usb/tusb6010.c
index 501706e2b2..f76b59afe8 100644
--- a/hw/usb/tusb6010.c
+++ b/hw/usb/tusb6010.c
@@ -24,7 +24,6 @@
 #include "hw/usb.h"
 #include "hw/arm/omap.h"
 #include "hw/irq.h"
-#include "hw/devices.h"
 #include "hw/sysbus.h"
=20
 #define TYPE_TUSB6010 "tusb6010"
--=20
2.17.2

