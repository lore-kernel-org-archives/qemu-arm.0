Received: by 10.223.159.74 with SMTP id f10csp7093725wrg;
        Thu, 14 Dec 2017 19:21:24 -0800 (PST)
X-Google-Smtp-Source: ACJfBovb0zT64Br+GzsdTekmoAPfTQU6tUhmn9bqpaVAOuiIhk1AJZIwh3Ejpl2IW5ao+kZ76ab0
X-Received: by 10.13.235.87 with SMTP id u84mr5701832ywe.253.1513308084565;
        Thu, 14 Dec 2017 19:21:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513308084; cv=none;
        d=google.com; s=arc-20160816;
        b=lht2/zwYGQzuJCurFBMdMMyS0H323gtTW1vFSjoLc7b41qvc5dkHZ29qMs6MbUal1d
         HNoTaLgB2Oz+3pUD5VeY0aJNrylcHID9M5jMUlsPPUUnhzmsw98RJERoCa2e2X3XwVo2
         Qh8Pno/8S+yJbAT4WjmEH19FoADPl7H+6TFSN9R9p6z4aZO7Ve8uchmpJXHBTdpR2gtB
         6bpffYk1e/P4NucqutRJ/Tx5jFOarVRlpdF4ffOcQb/BEHAV1eHQ9aSWve6eefVeKl94
         /xgTzv7N+tKU7gs9hrYAk9Qea28G7mpm5sxAbvV9G3EoXrUmTOoJFiaCOhpi0BiA/5Fk
         dLNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=xqkNs8SvOM6gxrPNRzzlQOMZ5mKL3nMo4tkEs8ZRQIE=;
        b=uSre48qojksrCZmC1yyq++XwUK60YoSlZHIXvg4E24yTTWYNXWXe7qBGCTLHbXW3UC
         QywloBailHgxWkYvxZd+GFLCvQkp5JRXOEDCetwUxLHryzRqvMQxdFT1LAt8xgskHnwQ
         O1pAwtPC9eNrnlh0Rh5IwCGjEmIT0NuyVKAcY2cekxRN8a2l/ROBIKX60poFZfQZ0Z+Q
         l5xYumRQvcLgNw2pLXL9Rkg0zgQg6n9zcYQIzn8Bhoi06p8mdVrwmwzSZQozcCSoTnJt
         m2UzoRLTWYso6p7ShxKzMx3i/+yysZHaNrExhFRmTmTPP/8Hxa202cYZiJDTWAxUXlo4
         FGzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cTETrXDa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a65si1110532ybg.498.2017.12.14.19.21.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 19:21:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cTETrXDa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43977 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePgYu-00012Y-1P
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 22:21:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53733)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUF-0005pO-EY
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 22:16:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUE-00012p-Iu
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 22:16:35 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:45813)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUE-00012d-Fj; Thu, 14 Dec 2017 22:16:34 -0500
Received: by mail-qt0-x243.google.com with SMTP id g10so10522734qtj.12;
	Thu, 14 Dec 2017 19:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xqkNs8SvOM6gxrPNRzzlQOMZ5mKL3nMo4tkEs8ZRQIE=;
	b=cTETrXDa2+c1/pJ+ejByGmDdDKn94r/CwKCeEqpkTHUNtRjtzl9/db4Ful7COOJnzb
	UfDpNHZ80tWAc9wI8a+EoFOYDUcJOiX4VwooLMyla9YPK9V870qM09sI8nHzIhBqLEo1
	Beg8DolYxrXtIli+QGEgv9d5clBIXHds6CLDXYghgyIdCM50pEmq+bsl7QQgRUqJXcT8
	iXp4qN9tIxTfrtmWfvZVOKOwCu/ozQmWYIs2+SKwdh811kWmzQvjaPLTwbKsiTnhJfqg
	fnh736mOHV6eFhmeKYLtnp91ENjmE7wsNkb+BF7jEeqxNvfMW9TPLA5N8O+n0/F6grfI
	Dmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=xqkNs8SvOM6gxrPNRzzlQOMZ5mKL3nMo4tkEs8ZRQIE=;
	b=AdBijcKsem/6as8oduxpk2JAvqbq8AogriGy1073mY548VVlkfBIgEcTTTh4B2puZC
	xY7MaUK1h3QZnJKhvJADpHuCWVtC3Eeftv2P+0hmH8mzAGf01zAp8oi9x2zUdbbqzeMt
	jAyfF2MaIheAHMPFtIFWA9dbpG35oqsmhejTRo2BONHX0tzrk05mtZVuM9uUgAoauz6j
	c9yus8xC36Cly6YZwa2bhc76vv33GQooOX8VOKstj3atuqBAQxr7CPWJLJZjrbj002ir
	evdsY6zCaXhH/aOww0GBD2jtETAh2QGsjR6lgDXtfzEeprURgTJhxtxvA53PPlvLK0VL
	6Kcw==
X-Gm-Message-State: AKGB3mKXEaB3WLidp2eVT9NvtV7cbePh38jNt24xBQS6qNUcuZHcK74T
	sqaoQ+lrcqNOKDQjroaLZvI=
X-Received: by 10.200.54.43 with SMTP id m40mr19334451qtb.286.1513307794064;
	Thu, 14 Dec 2017 19:16:34 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	l125sm3484740qkc.3.2017.12.14.19.16.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:16:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Date: Fri, 15 Dec 2017 00:15:34 -0300
Message-Id: <20171215031547.31006-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215031547.31006-1-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-devel] [PATCH v2 07/20] sdhci: refactor common sysbus/pci
 unrealize() into sdhci_unrealizefn()
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +9USFAsLSSo5

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index f574495b19..53c1f11855 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -31,6 +31,7 @@
 #include "qemu/bitops.h"
 #include "hw/sd/sdhci.h"
 #include "sdhci-internal.h"
+#include "qapi/error.h"
 #include "qemu/log.h"
 
 /* host controller debug messages */
@@ -1200,17 +1201,20 @@ static void sdhci_realizefn(SDHCIState *s, Error **errp)
                           SDHC_REGISTERS_MAP_SIZE);
 }
 
+static void sdhci_unrealizefn(SDHCIState *s, Error **errp)
+{
+    g_free(s->fifo_buffer);
+}
+
 static void sdhci_uninitfn(SDHCIState *s)
 {
     timer_del(s->insert_timer);
     timer_free(s->insert_timer);
     timer_del(s->transfer_timer);
     timer_free(s->transfer_timer);
+
     qemu_free_irq(s->eject_cb);
     qemu_free_irq(s->ro_cb);
-
-    g_free(s->fifo_buffer);
-    s->fifo_buffer = NULL;
 }
 
 static bool sdhci_pending_insert_vmstate_needed(void *opaque)
@@ -1311,6 +1315,8 @@ static void sdhci_pci_realize(PCIDevice *dev, Error **errp)
 static void sdhci_pci_exit(PCIDevice *dev)
 {
     SDHCIState *s = PCI_SDHCI(dev);
+
+    sdhci_unrealizefn(s, &error_abort);
     sdhci_uninitfn(s);
 }
 
@@ -1364,11 +1370,19 @@ static void sdhci_sysbus_realize(DeviceState *dev, Error ** errp)
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
+static void sdhci_sysbus_unrealize(DeviceState *dev, Error **errp)
+{
+    SDHCIState *s = SYSBUS_SDHCI(dev);
+
+    sdhci_unrealizefn(s, errp);
+}
+
 static void sdhci_sysbus_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = sdhci_sysbus_realize;
+    dc->unrealize = sdhci_sysbus_unrealize;
 
     sdhci_class_init(klass, data);
 }
-- 
2.15.1

