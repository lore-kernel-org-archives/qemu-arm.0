Received: by 10.80.166.35 with SMTP id d32csp802893edc;
        Thu, 27 Oct 2016 12:47:41 -0700 (PDT)
X-Received: by 10.176.83.12 with SMTP id x12mr8676981uax.131.1477597661727;
        Thu, 27 Oct 2016 12:47:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f66si4252228vkc.176.2016.10.27.12.47.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Oct 2016 12:47:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@roeck-us.net;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44199 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzqeL-0001iv-37
	for alex.bennee@linaro.org; Thu, 27 Oct 2016 15:47:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1bzqeE-0001gg-Ub
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 15:47:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1bzqeA-0006fe-4U
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 15:47:35 -0400
Received: from bh-25.webhostbox.net ([208.91.199.152]:49907)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <linux@roeck-us.net>)
	id 1bzqe9-0006fR-UK; Thu, 27 Oct 2016 15:47:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Message-Id:Date:Subject:Cc:To:From;
	bh=Cw0Grd5hSMME3XxrQeE4f2ZN29IpYBuSEArlu9/UrV8=;
	b=5hgW9kYQUIkLZs/WC3J8rRrd3s
	VBbgimrEG4QTQKQ6yONG6Ztv0jXeRKSR8dw6PAAG/GnfWYbdqIdy0JQD2hiWvCDHUAG0ZUwLwclkf
	LTbMaxMqYRqp9P0uGMk4lnCiQUKVZzN0NGbVojBuFTnkPCrrky68ucF5QlU2wGfeJJwYtfNRa9RQj
	V/1XHeAwUxt4u9RTD61cI02SuOgn76gkFf04KZPzJUOg/AgOvLziVSy3EuZk9rBvwxz8YvzGUa193
	NWJJdJSy36QmjSv+ioQo54+kq92aAj+u+FSUruXAf5J8VQn96FmPOEhHNTgEqYF7Byhgevo9qFFPP
	k3F62xtw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
	([108.223.40.66]:60620 helo=localhost)
	by bh-25.webhostbox.net with esmtpa (Exim 4.86_1)
	(envelope-from <linux@roeck-us.net>)
	id 1bzqe4-003Cta-N2; Thu, 27 Oct 2016 19:47:25 +0000
From: Guenter Roeck <linux@roeck-us.net>
To: Andrzej Zaborowski <balrogg@gmail.com>
Date: Thu, 27 Oct 2016 12:47:25 -0700
Message-Id: <1477597646-24111-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.5.0
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
Subject: [Qemu-arm] [PATCH 1/2] hw/arm/spitz: Fix reset handling
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
X-TUID: flwLg3FbcWmY

Using the CPU reset handler for resets triggered by writing into
gpio pins other than GPIO01 is not appropriate and does not work,
since the reset triggered by writing into GPIO01 is configurable.
Use a separate reset handler for spitz to reset the entire system
and not just the CPU.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/spitz.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 41cc2ee..949a15a 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -29,6 +29,7 @@
 #include "sysemu/block-backend.h"
 #include "hw/sysbus.h"
 #include "exec/address-spaces.h"
+#include "sysemu/sysemu.h"
 
 #undef REG_FMT
 #define REG_FMT			"0x%02lx"
@@ -844,9 +845,18 @@ static void spitz_lcd_hsync_handler(void *opaque, int line, int level)
     spitz_hsync ^= 1;
 }
 
+static void spitz_reset(void *opaque, int line, int level)
+{
+    if (level) {
+        qemu_system_reset_request();
+    }
+}
+
 static void spitz_gpio_setup(PXA2xxState *cpu, int slots)
 {
     qemu_irq lcd_hsync;
+    qemu_irq reset;
+
     /*
      * Bad hack: We toggle the LCD hsync GPIO on every GPIO status
      * read to satisfy broken guests that poll-wait for hsync.
@@ -867,7 +877,8 @@ static void spitz_gpio_setup(PXA2xxState *cpu, int slots)
     qemu_irq_raise(qdev_get_gpio_in(cpu->gpio, SPITZ_GPIO_BAT_COVER));
 
     /* Handle reset */
-    qdev_connect_gpio_out(cpu->gpio, SPITZ_GPIO_ON_RESET, cpu->reset);
+    reset = qemu_allocate_irq(spitz_reset, cpu, 0);
+    qdev_connect_gpio_out(cpu->gpio, SPITZ_GPIO_ON_RESET, reset);
 
     /* PCMCIA signals: card's IRQ and Card-Detect */
     if (slots >= 1)
-- 
2.5.0

