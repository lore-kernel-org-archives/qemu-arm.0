Received: by 10.25.77.65 with SMTP id a62csp883659lfb;
        Sat, 28 Jan 2017 18:40:46 -0800 (PST)
X-Received: by 10.55.16.67 with SMTP id a64mr15720107qkh.226.1485657646025;
        Sat, 28 Jan 2017 18:40:46 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e1si6827711qkc.172.2017.01.28.18.40.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 28 Jan 2017 18:40:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aosc.xyz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53902 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cXfQ3-000449-Fr
	for alex.bennee@linaro.org; Sat, 28 Jan 2017 21:40:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <icenowy@aosc.xyz>) id 1cXdre-0003jQ-08
	for qemu-arm@nongnu.org; Sat, 28 Jan 2017 20:01:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <icenowy@aosc.xyz>) id 1cXdrZ-0004i9-4g
	for qemu-arm@nongnu.org; Sat, 28 Jan 2017 20:01:06 -0500
Received: from forward6h.cmail.yandex.net ([87.250.230.217]:38252)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <icenowy@aosc.xyz>) id 1cXdrY-0004hw-TG
	for qemu-arm@nongnu.org; Sat, 28 Jan 2017 20:01:01 -0500
Received: from smtp2h.mail.yandex.net (smtp2h.mail.yandex.net [84.201.187.145])
	by forward6h.cmail.yandex.net (Yandex) with ESMTP id E44162192C;
	Sun, 29 Jan 2017 04:00:56 +0300 (MSK)
Received: from smtp2h.mail.yandex.net (localhost.localdomain [127.0.0.1])
	by smtp2h.mail.yandex.net (Yandex) with ESMTP id 4F5BC7810E8;
	Sun, 29 Jan 2017 04:00:53 +0300 (MSK)
Received: by smtp2h.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
	8alEJCSfiJ-0og4sqdm; Sun, 29 Jan 2017 04:00:52 +0300
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client certificate not present)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.xyz; s=mail;
	t=1485651653; bh=vyIiMcR68unIRldkckZcDXF1gZpr0pEmRiD7LuMge+Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=os8Kzv0de51rE8+cuu1n+fLDUELeLWJ9fCbnpt9gyK/5ehbOOQMZ+rgOW71aVt8Yp
	CWs5IE0WiyJ4vXSq8hNVBZooeP7YbRL57NKu1yQ+UPxBAe33nKNWX+2apZZZ4Sfpu1
	0BG19dlMfXNxGIKjpjTE3iTokDx6Sfw/M1KVKHgE=
Authentication-Results: smtp2h.mail.yandex.net; dkim=pass header.i=@aosc.xyz
X-Yandex-ForeignMX: US
X-Yandex-Suid-Status: 1 0,1 0,1 0,1 0,1 1130000036118848
From: Icenowy Zheng <icenowy@aosc.xyz>
To: Beniamino Galvani <b.galvani@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Date: Sun, 29 Jan 2017 09:00:13 +0800
Message-Id: <20170129010013.29637-2-icenowy@aosc.xyz>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170129010013.29637-1-icenowy@aosc.xyz>
References: <20170129010013.29637-1-icenowy@aosc.xyz>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.250.230.217
X-Mailman-Approved-At: Sat, 28 Jan 2017 21:40:35 -0500
Subject: [Qemu-arm] [PATCH 2/2] arm: allwinner-a10: Add OHCI/EHCI
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
Cc: qemu-arm@nongnu.org, Icenowy Zheng <icenowy@aosc.xyz>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5d8skTifqdnX

Add the Allwinner OHCI/EHCI controller modules to the SoC.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
 hw/arm/allwinner-a10.c         | 6 ++++++
 include/hw/arm/allwinner-a10.h | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index ca15d1c8cc..e3417ca2cf 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -46,6 +46,12 @@ static void aw_a10_init(Object *obj)
 
     object_initialize(&s->sata, sizeof(s->sata), TYPE_ALLWINNER_AHCI);
     qdev_set_parent_bus(DEVICE(&s->sata), sysbus_get_default());
+
+    sysbus_create_simple(TYPE_ALLWINNER_EHCI, AW_A10_EHCI0_BASE, s->irq[39]);
+    sysbus_create_simple(TYPE_ALLWINNER_EHCI, AW_A10_EHCI1_BASE, s->irq[40]);
+
+    sysbus_create_simple("sysbus-ohci", AW_A10_OHCI0_BASE, s->irq[64]);
+    sysbus_create_simple("sysbus-ohci", AW_A10_OHCI1_BASE, s->irq[65]);
 }
 
 static void aw_a10_realize(DeviceState *dev, Error **errp)
diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index 6b32a99e21..1ea5f18b51 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -9,6 +9,7 @@
 #include "hw/net/allwinner_emac.h"
 #include "hw/ide/pci.h"
 #include "hw/ide/ahci.h"
+#include "hw/usb/hcd-ehci.h"
 
 #include "sysemu/sysemu.h"
 #include "exec/address-spaces.h"
@@ -19,6 +20,10 @@
 #define AW_A10_UART0_REG_BASE   0x01c28000
 #define AW_A10_EMAC_BASE        0x01c0b000
 #define AW_A10_SATA_BASE        0x01c18000
+#define AW_A10_EHCI0_BASE	0x01c14000
+#define AW_A10_EHCI1_BASE	0x01c1c000
+#define AW_A10_OHCI0_BASE	0x01c14400
+#define AW_A10_OHCI1_BASE	0x01c1c400
 
 #define AW_A10_SDRAM_BASE       0x40000000
 
-- 
2.11.0

