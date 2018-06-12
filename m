Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5152391wrq;
        Tue, 12 Jun 2018 03:45:00 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKo+hkj6dZiVq5QIKKGkiuOb0B/ylX9JSzdGOHmdBawcrilIjcug+sbCfDLyrK5ZBsQ/A7K
X-Received: by 2002:a0c:96ed:: with SMTP id b42-v6mr2761040qvd.135.1528800300703;
        Tue, 12 Jun 2018 03:45:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528800300; cv=none;
        d=google.com; s=arc-20160816;
        b=YihQkL6FlAwSvX0+BTgcNG/rvZFeJkeTXYxWqZUFiV2MyPML7lQ/UOBcZBYaetNrbe
         Z6a9oFQm165LLuFWBOxL7jb8fOzO7uvyGpTihuKytZrj69irmoEBtZgO7Lwx2ijULdbI
         mJp8E+DbAO/OviFwzKO9bd8NT7gtVc3DikRXlSU3zz4DLv8eKumQdhBPuGIzbN8wFZWE
         TyGJx5vtXa3p+Qa5by97dKOkBK+Bl+SNkRDBInTmO6mtxkmIOQYU2+4ECuiKVfYqUQ8q
         NRCYcMvA1Ah392/iswin/zkgUZiWe01/mN1QxfTOpw0/N9FPQvlvVpCedNAqv2Ff2FXy
         XxIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=m7B8DMUGyO2Jk+yqxgL2cxvyM3hkE4aWAx1gM0hLDWM=;
        b=KPYOhfl1aPfkXz57+jQ/HL5BahNjoObDUAEdd9kDJRr2TYnZ1R9oqmCbn1VbVyTmhK
         IPlcWja+8fYDDnL8cOXuXcSQzOTsCgc9m7p487s8hsh3NIvFbBEDSN3P7EBDNRKdwsQ3
         FCMKN0dk+80uR6+NCvoM4wPFF7a6fGF/T5ZJYQjbHLwEWFHBOVjL1APmd3S3MJOVnpXh
         exS5lyLqafohNvG6sRM3++lTvGHU9F46SN3mXHQD64F5EalNrCTxICtcLKNBm9DGlq61
         qpgsQQGkkL/yLXUZJ08c6ejJPQyTsA1pB8d6LMRD9uP5FrbZ1qYxKutM+Y8syhDZOkYe
         BMUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b20-v6si620322qka.169.2018.06.12.03.45.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jun 2018 03:45:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54378 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSgnM-0002pB-2Z
	for alex.bennee@linaro.org; Tue, 12 Jun 2018 06:45:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fSgmy-0002nb-5y
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 06:44:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fSgmv-0007rp-83
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 06:44:36 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58888 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fSgmv-0007r4-28; Tue, 12 Jun 2018 06:44:33 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 643C84000B74;
	Tue, 12 Jun 2018 10:44:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2029D20284D6;
	Tue, 12 Jun 2018 10:44:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 78EDB24EF05; Tue, 12 Jun 2018 12:44:30 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Jun 2018 12:44:23 +0200
Message-Id: <20180612104430.25745-2-kraxel@redhat.com>
In-Reply-To: <20180612104430.25745-1-kraxel@redhat.com>
References: <20180612104430.25745-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Tue, 12 Jun 2018 10:44:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Tue, 12 Jun 2018 10:44:32 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PULL 1/8] usb: update docs
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
Cc: Corey Minyard <minyard@acm.org>, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
	Zhang Chen <zhangckid@gmail.com>, qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J4tuyPUSKxco

xhci is rock solid meanwhile.  So move it up in the docs and feature it
as prefered usb host adapter, instead of the old shy version saying "you
might want try ...".

While being at it rework the text on ehci and companion controllers too.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-id: 20180605132915.3640-1-kraxel@redhat.com
---
 docs/usb2.txt | 99 +++++++++++++++++++++++++++++++++--------------------------
 1 file changed, 55 insertions(+), 44 deletions(-)

diff --git a/docs/usb2.txt b/docs/usb2.txt
index 09df45b5b1..e2fa2cfde0 100644
--- a/docs/usb2.txt
+++ b/docs/usb2.txt
@@ -1,16 +1,42 @@
 
-USB 2.0 Quick Start
-===================
+USB Quick Start
+===============
 
-The QEMU EHCI Adapter can be used with and without companion
-controllers.  See below for the companion controller mode.
+XHCI controller support
+-----------------------
 
-When not running in companion controller mode there are two completely
-separate USB busses: One USB 1.1 bus driven by the UHCI controller and
-one USB 2.0 bus driven by the EHCI controller.  Devices must be
-attached to the correct controller manually.
+QEMU has XHCI host adapter support.  The XHCI hardware design is much
+more virtualization-friendly when compared to EHCI and UHCI, thus XHCI
+emulation uses less resources (especially cpu).  So if your guest
+supports XHCI (which should be the case for any operating system
+released around 2010 or later) we recommend using it:
 
-The '-usb' switch will make qemu create the UHCI controller as part of
+    qemu -device qemu-xhci
+
+XHCI supports USB 1.1, USB 2.0 and USB 3.0 devices, so this is the
+only controller you need.  With only a single USB controller (and
+therefore only a single USB bus) present in the system there is no
+need to use the bus= parameter when adding USB devices.
+
+
+EHCI controller support
+-----------------------
+
+The QEMU EHCI Adapter supports USB 2.0 devices.  It can be used either
+standalone or with companion controllers (UHCI, OHCI) for USB 1.1
+devices.  The companion controller setup is more convenient to use
+because it provides a single USB bus supporting both USB 2.0 and USB
+1.1 devices.  See next section for details.
+
+When running EHCI in standalone mode you can add UHCI or OHCI
+controllers for USB 1.1 devices too.  Each controller creates its own
+bus though, so there are two completely separate USB buses: One USB
+1.1 bus driven by the UHCI controller and one USB 2.0 bus driven by
+the EHCI controller.  Devices must be attached to the correct
+controller manually.
+
+The easiest way to add a UHCI controller to a 'pc' machine is the
+'-usb' switch.  QEMU will create the UHCI controller as function of
 the PIIX3 chipset.  The USB 1.1 bus will carry the name "usb-bus.0".
 
 You can use the standard -device switch to add a EHCI controller to
@@ -19,9 +45,8 @@ the controller so the USB 2.0 bus gets a individual name, for example
 '-device usb-ehci,id=ehci".  This will give you a USB 2.0 bus named
 "ehci.0".
 
-I strongly recommend to also use -device to attach usb devices because
-you can specify the bus they should be attached to this way.  Here is
-a complete example:
+When adding USB devices using the -device switch you can specify the
+bus they should be attached to.  Here is a complete example:
 
     qemu -M pc ${otheroptions}                           \
         -drive if=none,id=usbstick,file=/path/to/image   \
@@ -30,58 +55,44 @@ a complete example:
         -device usb-tablet,bus=usb-bus.0                 \
         -device usb-storage,bus=ehci.0,drive=usbstick
 
-This attaches a usb tablet to the UHCI adapter and a usb mass storage
+This attaches a USB tablet to the UHCI adapter and a USB mass storage
 device to the EHCI adapter.
 
 
 Companion controller support
 ----------------------------
 
-Companion controller support has been added recently.  The operational
-model described above with two completely separate busses still works
-fine.  Additionally the UHCI and OHCI controllers got the ability to
-attach to a usb bus created by EHCI as companion controllers.  This is
-done by specifying the masterbus and firstport properties.  masterbus
-specifies the bus name the controller should attach to.  firstport
-specifies the first port the controller should attach to, which is
-needed as usually one ehci controller with six ports has three uhci
-companion controllers with two ports each.
+The UHCI and OHCI controllers can attach to a USB bus created by EHCI
+as companion controllers.  This is done by specifying the masterbus
+and firstport properties.  masterbus specifies the bus name the
+controller should attach to.  firstport specifies the first port the
+controller should attach to, which is needed as usually one EHCI
+controller with six ports has three UHCI companion controllers with
+two ports each.
 
-There is a config file in docs which will do all this for you, just
-try ...
+There is a config file in docs which will do all this for
+you, just try ...
 
     qemu -readconfig docs/config/ich9-ehci-uhci.cfg
 
-... then use "bus=ehci.0" to assign your usb devices to that bus.
+... then use "bus=ehci.0" to assign your USB devices to that bus.
 
-
-xhci controller support
------------------------
-
-There is also xhci host controller support available.  It got a lot
-less testing than ehci and there are a bunch of known limitations, so
-ehci may work better for you.  On the other hand the xhci hardware
-design is much more virtualization-friendly, thus xhci emulation uses
-less resources (especially cpu).  If you want to give xhci a try
-use this to add the host controller ...
-
-    qemu -device nec-usb-xhci,id=xhci
-
-... then use "bus=xhci.0" when assigning usb devices.
+Using the '-usb' switch for 'q35' machines will create a similar
+USB controller configuration.
 
 
 More USB tips & tricks
 ======================
 
-Recently the usb pass through driver (also known as usb-host) and the
-qemu usb subsystem gained a few capabilities which are available only
+Recently the USB pass through driver (also known as usb-host) and the
+QEMU USB subsystem gained a few capabilities which are available only
 via qdev properties, i,e. when using '-device'.
 
 
 physical port addressing
 ------------------------
 
-First you can (for all usb devices) specify the physical port where
+First you can (for all USB devices) specify the physical port where
 the device will show up in the guest.  This can be done using the
 "port" property.  UHCI has two root ports (1,2).  EHCI has four root
 ports (1-4), the emulated (1.1) USB hub has eight ports.
@@ -94,7 +105,7 @@ Plugging a hub into UHCI port 2 works like this:
 
         -device usb-hub,bus=usb-bus.0,port=2
 
-Plugging a virtual usb stick into port 4 of the hub just plugged works
+Plugging a virtual USB stick into port 4 of the hub just plugged works
 this way:
 
         -device usb-storage,bus=usb-bus.0,port=2.4,drive=...
@@ -143,7 +154,7 @@ practice only a few combinations are useful:
 
 Note that USB 1.1 devices are handled by UHCI/OHCI and USB 2.0 by
 EHCI.  That means a device plugged into the very same physical port
-may show up on different busses depending on the speed.  The port I'm
+may show up on different buses depending on the speed.  The port I'm
 using for testing is bus 1 + port 1 for 2.0 devices and bus 3 + port 1
 for 1.1 devices.  Passing through any device plugged into that port
 and also assign them to the correct bus can be done this way:
-- 
2.9.3

