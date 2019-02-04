Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4113428wrt;
        Mon, 4 Feb 2019 15:21:44 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbKvinQ4gFe1UeAs5KGjLQeCBgnEVPuBDh4xFJJUNwZUn9xTR/OsbvRfjQ6cJ7vTCYHhOKH
X-Received: by 2002:a25:848c:: with SMTP id v12mr1627360ybk.353.1549322504064;
        Mon, 04 Feb 2019 15:21:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549322504; cv=none;
        d=google.com; s=arc-20160816;
        b=y/hB1suSOzpVAqgKl0/vmPJZtlLFAXSWeZnPcSRyCogApVD42PXV0/qBIakHiHobD9
         3srvRk1eEHVvfPUOnWBG1B+aSdubiKd8aP17t6G+4u2H6w7VE0UpS1kpKydPnhfJ83aW
         NDDORzwV+j4oErLSse4wqQ8zj1rLpfG/9l9XQna6G4akxzBul+7ZQrPxMBXqvAFy+pvx
         0OrBAnrypa/a8PoKRxJz4kV18ciuCWAwKP5dTM9BdSaFQMH2KRVPeersgPnq0CKyAVhr
         mk2GKiXnEPhWFqtZ9487ozZ1eC65tM9Dcb7FFBLTEy/ieVa9YPchb2TCp7r46LA7jpPB
         ZM6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=aANtH7eB0JScbOE7VJJDRCaGhonItJYdbm/I3kcwd10=;
        b=cpN+mxU8CwMYu9Ggqe5jgPj4c+1j+FBRcRCOlfxEio5DS0eDeZmanUMK9MtQrrlreW
         BEqzjgYpi23hQbA4UysMlnxCCh9V2z5qljxw3BiccfyqQ/LiC0kyGndDCrknyjKp1Weh
         OH9mbCLdhegYCjMXBofMDF6faLWpksPLdxyfo87eExx4uZN0XMxvwwr0A1VY9Qs0nopX
         tcS9FzbuI0V85qyelhSmFqfq2icM3cXjqKOEq71j+Ymf4BV0XEHzST01rZQkzTnNp1vF
         P+zdtR2ezIansU12Tgza3HMtiDfV72Ilkfn3YVxqthSlvuteKByWej9pV+u4K6eAXkd+
         lSOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 141si893963ybn.297.2019.02.04.15.21.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Feb 2019 15:21:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50942 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gqnYd-0002Rp-Cv
	for alex.bennee@linaro.org; Mon, 04 Feb 2019 18:21:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnVv-0000gu-N2
	for qemu-devel@nongnu.org; Mon, 04 Feb 2019 18:18:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnVu-0000Yc-AE
	for qemu-devel@nongnu.org; Mon, 04 Feb 2019 18:18:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49370)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gqnVo-0000LO-V6; Mon, 04 Feb 2019 18:18:49 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D1426C05D3F2;
	Mon,  4 Feb 2019 23:18:47 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-98.brq.redhat.com [10.40.204.98])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF5E117987;
	Mon,  4 Feb 2019 23:18:36 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  5 Feb 2019 00:18:06 +0100
Message-Id: <20190204231815.29661-3-philmd@redhat.com>
In-Reply-To: <20190204231815.29661-1-philmd@redhat.com>
References: <20190204231815.29661-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 04 Feb 2019 23:18:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 02/11] hw: Remove unused 'hw/devices.h'
 include
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	Joel Stanley <joel@jms.id.au>, Richard Henderson <rth@twiddle.net>,
	Thomas Huth <thuth@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RsMFZeO0Cufg

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Tested-by: Thomas Huth <thuth@redhat.com>
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
index 397e2dcdc7..9d57361c67 100644
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
index df0d079ad0..06ec6f4dc8 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -20,7 +20,6 @@
 #include "qemu-common.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
-#include "hw/devices.h"
 #include "hw/arm/allwinner-a10.h"
 #include "hw/misc/unimp.h"
=20
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
index f5f0b0e0fa..f79f090a4a 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -56,7 +56,6 @@
 #include "hw/arm/armsse.h"
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
index bbaf050103..3e633d160e 100644
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
index 99c2b6e60d..396804f0e5 100644
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
index 26a2398354..be351d96dc 100644
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
index b9f0b0d06e..a0edaf867c 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -33,7 +33,6 @@
 #include "net/net.h"
 #include "hw/block/flash.h"
 #include "sysemu/sysemu.h"
-#include "hw/devices.h"
 #include "hw/boards.h"
 #include "hw/misc/unimp.h"
 #include "exec/address-spaces.h"
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
index 5b399e7161..bbcf3eda33 100644
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
2.20.1

