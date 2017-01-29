Received: by 10.25.77.65 with SMTP id a62csp883646lfb;
        Sat, 28 Jan 2017 18:40:43 -0800 (PST)
X-Received: by 10.55.130.4 with SMTP id e4mr16499971qkd.65.1485657643066;
        Sat, 28 Jan 2017 18:40:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q124si735456qkb.148.2017.01.28.18.40.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 28 Jan 2017 18:40:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aosc.xyz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53900 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cXfQ0-00040d-EX
	for alex.bennee@linaro.org; Sat, 28 Jan 2017 21:40:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <icenowy@aosc.xyz>) id 1cXdrQ-0003hQ-Lw
	for qemu-arm@nongnu.org; Sat, 28 Jan 2017 20:00:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <icenowy@aosc.xyz>) id 1cXdrM-0004gs-8r
	for qemu-arm@nongnu.org; Sat, 28 Jan 2017 20:00:52 -0500
Received: from forward20h.cmail.yandex.net ([87.250.230.162]:59895)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <icenowy@aosc.xyz>) id 1cXdrL-0004gZ-U6
	for qemu-arm@nongnu.org; Sat, 28 Jan 2017 20:00:48 -0500
Received: from smtp2h.mail.yandex.net (smtp2h.mail.yandex.net
	[IPv6:2a02:6b8:0:f05::116])
	by forward20h.cmail.yandex.net (Yandex) with ESMTP id 5175B22235;
	Sun, 29 Jan 2017 04:00:41 +0300 (MSK)
Received: from smtp2h.mail.yandex.net (localhost.localdomain [127.0.0.1])
	by smtp2h.mail.yandex.net (Yandex) with ESMTP id B6083781F86;
	Sun, 29 Jan 2017 04:00:38 +0300 (MSK)
Received: by smtp2h.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
	8alEJCSfiJ-0YgS1f1h; Sun, 29 Jan 2017 04:00:37 +0300
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client certificate not present)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.xyz; s=mail;
	t=1485651638; bh=hdGStYjmIXvfKflh5ofutP4b17Bx33dTjV51Apj6yI0=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=urOE4iPOn/8HrjiULPWRVzVuT78FGxNBavtbFSM6+MUmIrFGhkb9+0vJlkHgcV+7G
	dWsIa+QynBSoAbqtvy6ia3LVpAdG/NKKzNZVUb0EbWTgTnAC08kxatQKNFF+uQqU13
	ofPVrgDcJsXlqTRsFjJqJ+IDyHKY2ep+50wYpeCY=
Authentication-Results: smtp2h.mail.yandex.net; dkim=pass header.i=@aosc.xyz
X-Yandex-ForeignMX: US
X-Yandex-Suid-Status: 1 0,1 0,1 0,1 0,1 1130000036118848
From: Icenowy Zheng <icenowy@aosc.xyz>
To: Beniamino Galvani <b.galvani@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Date: Sun, 29 Jan 2017 09:00:12 +0800
Message-Id: <20170129010013.29637-1-icenowy@aosc.xyz>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.250.230.162
X-Mailman-Approved-At: Sat, 28 Jan 2017 21:40:35 -0500
Subject: [Qemu-arm] [PATCH 1/2] usb/ehci: Add SysBus EHCI device for
 Allwinner SoCs
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
X-TUID: 7sPZ1RGPyQ09

It uses a register map like the one in Exynos SoCs.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
 hw/usb/hcd-ehci-sysbus.c | 17 +++++++++++++++++
 hw/usb/hcd-ehci.h        |  1 +
 2 files changed, 18 insertions(+)

diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
index 6c20604d07..d99bb4abe7 100644
--- a/hw/usb/hcd-ehci-sysbus.c
+++ b/hw/usb/hcd-ehci-sysbus.c
@@ -218,6 +218,22 @@ static const TypeInfo ehci_fusbh200_type_info = {
     .class_init    = fusbh200_ehci_class_init,
 };
 
+static void ehci_allwinner_class_init(ObjectClass *oc, void *data)
+{
+    SysBusEHCIClass *sec = SYS_BUS_EHCI_CLASS(oc);
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    sec->capsbase = 0x0;
+    sec->opregbase = 0x10;
+    set_bit(DEVICE_CATEGORY_USB, dc->categories);
+}
+
+static const TypeInfo ehci_allwinner_type_info = {
+    .name          = TYPE_ALLWINNER_EHCI,
+    .parent        = TYPE_SYS_BUS_EHCI,
+    .class_init    = ehci_allwinner_class_init,
+};
+
 static void ehci_sysbus_register_types(void)
 {
     type_register_static(&ehci_type_info);
@@ -225,6 +241,7 @@ static void ehci_sysbus_register_types(void)
     type_register_static(&ehci_exynos4210_type_info);
     type_register_static(&ehci_tegra2_type_info);
     type_register_static(&ehci_fusbh200_type_info);
+    type_register_static(&ehci_allwinner_type_info);
 }
 
 type_init(ehci_sysbus_register_types)
diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
index 3fd7038658..89f3c7d922 100644
--- a/hw/usb/hcd-ehci.h
+++ b/hw/usb/hcd-ehci.h
@@ -343,6 +343,7 @@ typedef struct EHCIPCIState {
 #define TYPE_EXYNOS4210_EHCI "exynos4210-ehci-usb"
 #define TYPE_TEGRA2_EHCI "tegra2-ehci-usb"
 #define TYPE_FUSBH200_EHCI "fusbh200-ehci-usb"
+#define TYPE_ALLWINNER_EHCI "allwinner-ehci-usb"
 
 #define SYS_BUS_EHCI(obj) \
     OBJECT_CHECK(EHCISysBusState, (obj), TYPE_SYS_BUS_EHCI)
-- 
2.11.0

