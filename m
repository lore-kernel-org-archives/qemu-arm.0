Received: by 10.80.166.35 with SMTP id d32csp804068edc;
        Thu, 27 Oct 2016 12:50:56 -0700 (PDT)
X-Received: by 10.176.4.75 with SMTP id 69mr7321051uav.20.1477597856894;
        Thu, 27 Oct 2016 12:50:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m184si3944610vkb.28.2016.10.27.12.50.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Oct 2016 12:50:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@roeck-us.net;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44221 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzqhU-0004Fh-8o
	for alex.bennee@linaro.org; Thu, 27 Oct 2016 15:50:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1bzqeD-0001fq-GX
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 15:47:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1bzqeA-0006gB-ST
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 15:47:33 -0400
Received: from bh-25.webhostbox.net ([208.91.199.152]:49927)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <linux@roeck-us.net>)
	id 1bzqeA-0006fp-NG; Thu, 27 Oct 2016 15:47:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default;
	h=References:In-Reply-To:Message-Id:Date:Subject:
	Cc:To:From; bh=FkGkhDZ097leiEDPfXYaYk0TMCUFecQTuz64avNkNnY=;
	b=F0vTqw3PtJNo6j
	BpYWIiXvaKlOnBN8hjWQWsRIr/PTixpMfnSquGBrFySfQGLu34IUKKtRbrpasmlcoAY7MLNm+dL6L
	O6fTKxR0cz+IMqNEMn0TjtMBoFru6VOGmDUb5uVAret2JKRKPGej9IXSBp5okQn2gnqJANpg7HrfS
	X/tX/yqBA47Y6Fu2YkvxtaEB5zCI70otzCpzugpU5xiQIMqtQ/OFlZEsjtN4tTdzOwHTcW5O2yAWU
	bDqq1UieKmlwtP4KHlW2H72mQTgdWmjuHHaVmQOLylqFQTQXG/0Q9OG2ImWSZdVtnshNAZO5Qnaoy
	1pkiNsg4b/T3sHrbUJKQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
	([108.223.40.66]:60622 helo=localhost)
	by bh-25.webhostbox.net with esmtpa (Exim 4.86_1)
	(envelope-from <linux@roeck-us.net>)
	id 1bzqe6-003CxH-0j; Thu, 27 Oct 2016 19:47:26 +0000
From: Guenter Roeck <linux@roeck-us.net>
To: Andrzej Zaborowski <balrogg@gmail.com>
Date: Thu, 27 Oct 2016 12:47:26 -0700
Message-Id: <1477597646-24111-2-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1477597646-24111-1-git-send-email-linux@roeck-us.net>
References: <1477597646-24111-1-git-send-email-linux@roeck-us.net>
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
	guenter@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 208.91.199.152
Subject: [Qemu-arm] [PATCH 2/2] hw/arm/tosa: Fix reset handling
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CaWJHj6OANJt

Using the CPU reset handler for resets triggered by writing into
gpio pins other than GPIO01 is not appropriate and does not work,
since the reset triggered by writing into GPIO01 is configurable.
Use a separate reset handler for tosa to reset the entire system
and not just the CPU.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/tosa.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index 2db6650..1ee12f4 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -25,6 +25,7 @@
 #include "sysemu/block-backend.h"
 #include "hw/sysbus.h"
 #include "exec/address-spaces.h"
+#include "sysemu/sysemu.h"
 
 #define TOSA_RAM    0x04000000
 #define TOSA_ROM	0x00800000
@@ -86,6 +87,12 @@ static void tosa_out_switch(void *opaque, int line, int level)
     }
 }
 
+static void tosa_reset(void *opaque, int line, int level)
+{
+    if (level) {
+        qemu_system_reset_request();
+    }
+}
 
 static void tosa_gpio_setup(PXA2xxState *cpu,
                 DeviceState *scp0,
@@ -93,13 +100,16 @@ static void tosa_gpio_setup(PXA2xxState *cpu,
                 TC6393xbState *tmio)
 {
     qemu_irq *outsignals = qemu_allocate_irqs(tosa_out_switch, cpu, 4);
+    qemu_irq reset;
+
     /* MMC/SD host */
     pxa2xx_mmci_handlers(cpu->mmc,
                     qdev_get_gpio_in(scp0, TOSA_GPIO_SD_WP),
                     qemu_irq_invert(qdev_get_gpio_in(cpu->gpio, TOSA_GPIO_nSD_DETECT)));
 
     /* Handle reset */
-    qdev_connect_gpio_out(cpu->gpio, TOSA_GPIO_ON_RESET, cpu->reset);
+    reset = qemu_allocate_irq(tosa_reset, cpu, 0);
+    qdev_connect_gpio_out(cpu->gpio, TOSA_GPIO_ON_RESET, reset);
 
     /* PCMCIA signals: card's IRQ and Card-Detect */
     pxa2xx_pcmcia_set_irq_cb(cpu->pcmcia[0],
-- 
2.5.0

