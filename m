Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2541985wrg;
        Mon, 13 May 2019 01:30:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyMY7krkbO3g25qPlWjueUWkyUuUewyUPIMYnSDRp5NiuvWwSAMKM2bdXBqjoUjn1aEfxXm
X-Received: by 2002:a50:8682:: with SMTP id r2mr26813215eda.106.1557736231818;
        Mon, 13 May 2019 01:30:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557736231; cv=none;
        d=google.com; s=arc-20160816;
        b=KO0YpwF0uIpgktOyMsiG3uLn8lxJa67dnIQrdP7vi1HgQh7yq8waHCABAeO5lymGe/
         brGzt2qFkWm05AhKSxs7iggLP6OblGHyOjYeSoD/u+EDeLoG7/c6YaY9sVjis1UunK5u
         Pign9PF0hdqc/Gxt6VV/J91EvOKCbY2IAOdnKDc91StJN1V5qBiuWHhY29SsABpf1zkB
         ep1ZjavajjA0Tuxv7XN+zOo5wp9euU2iSZ3iGziZNqokfynkeUfvg7EIBpEEONL7Nrp5
         LG0DL2cTw4/IH6oYOVoG/rXkqLLc8XHk81K92s5u++MYu6ot5H5KRifRvPh5lHla9D6O
         iJyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ZagKkJ0h28oW+CD8VEKaaOMfyvW0nUicV0bv7zp/N1E=;
        b=tn+6m7s36z9XM879eSgP5BuZ9KNFu+tffbn1iEn0CpPcl+ky+o5AG/6YmtMSB4Rd20
         oMUtEHNLSsH/bDkdQ11ltQDRIqeF1a4UmpQ/sn72JJiWTrTm2kfoR3PIjlLG/58k4JL9
         Wjj36m8+1ji+Lt1OiNGv8T9raoB4OlkbYyNb8XBbT9YA8DwJHPiBtzP3YhPWgVmzXZxS
         tO34M+ufdVfPrtmTJ0RTq5VEnILp6ZLRoTyIcOMc+mczaJTERCXm5WM2Lg7Y6SVgihSK
         9Suz2bjD41eTdyeUwRKxaDhpnNr8XkzTdviz6RokYqtvv2w3VZVGYwGHN78YFhjCNWnV
         jq7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11si587181ede.248.2019.05.13.01.30.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 May 2019 01:30:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53128 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQ6Lu-0005f4-O3
	for alex.bennee@linaro.org; Mon, 13 May 2019 04:30:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hQ6Lc-0005dG-U5
	for qemu-arm@nongnu.org; Mon, 13 May 2019 04:30:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hQ6LX-0005Z7-WF
	for qemu-arm@nongnu.org; Mon, 13 May 2019 04:30:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37748)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hQ6LX-0005O9-IC; Mon, 13 May 2019 04:30:07 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C18781DFE;
	Mon, 13 May 2019 08:29:46 +0000 (UTC)
Received: from thuth.com (ovpn-116-122.ams2.redhat.com [10.36.116.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF13B60856;
	Mon, 13 May 2019 08:29:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Mon, 13 May 2019 10:29:40 +0200
Message-Id: <20190513082940.30295-3-thuth@redhat.com>
In-Reply-To: <20190513082940.30295-1-thuth@redhat.com>
References: <20190513082940.30295-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 13 May 2019 08:29:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v3 03/29] hw/ide/ahci: Add a Kconfig switch for
 the AHCI-ICH9 device
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9qHGH8bCUOXr

Some of our machines (like the ARM cubieboard) use CONFIG_AHCI for an AHC=
I
sysbus device, but do not use CONFIG_PCI since they do not feature a PCI
bus. With CONFIG_AHCI but without CONFIG_PCI, currently linking fails:

    ../hw/ide/ich.o: In function `pci_ich9_ahci_realize':
    hw/ide/ich.c:124: undefined reference to `pci_allocate_irq'
    hw/ide/ich.c:126: undefined reference to `pci_register_bar'
    hw/ide/ich.c:128: undefined reference to `pci_register_bar'
    hw/ide/ich.c:131: undefined reference to `pci_add_capability'
    hw/ide/ich.c:147: undefined reference to `msi_init'
    ../hw/ide/ich.o: In function `pci_ich9_uninit':
    hw/ide/ich.c:158: undefined reference to `msi_uninit'
    ../hw/ide/ich.o:(.data.rel+0x50): undefined reference to `vmstate_pci=
_device'

We must only compile ich.c if CONFIG_PCI is available, too, so introduce =
a
new config switch for this device.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/i386/Kconfig      | 2 +-
 hw/ide/Kconfig       | 6 +++++-
 hw/ide/Makefile.objs | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index a6aed7c131..9817888216 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -80,7 +80,7 @@ config Q35
     select PC_ACPI
     select PCI_EXPRESS_Q35
     select LPC_ICH9
-    select AHCI
+    select AHCI_ICH9
     select DIMM
     select SMBIOS
     select VMPORT
diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
index ab47b6a7a3..5d9106b1ac 100644
--- a/hw/ide/Kconfig
+++ b/hw/ide/Kconfig
@@ -43,10 +43,14 @@ config MICRODRIVE
     select IDE_QDEV
=20
 config AHCI
+    bool
+    select IDE_QDEV
+
+config AHCI_ICH9
     bool
     default y if PCI_DEVICES
     depends on PCI
-    select IDE_QDEV
+    select AHCI
=20
 config IDE_SII3112
     bool
diff --git a/hw/ide/Makefile.objs b/hw/ide/Makefile.objs
index a142add90e..faf04e0209 100644
--- a/hw/ide/Makefile.objs
+++ b/hw/ide/Makefile.objs
@@ -9,6 +9,6 @@ common-obj-$(CONFIG_IDE_MMIO) +=3D mmio.o
 common-obj-$(CONFIG_IDE_VIA) +=3D via.o
 common-obj-$(CONFIG_MICRODRIVE) +=3D microdrive.o
 common-obj-$(CONFIG_AHCI) +=3D ahci.o
-common-obj-$(CONFIG_AHCI) +=3D ich.o
+common-obj-$(CONFIG_AHCI_ICH9) +=3D ich.o
 common-obj-$(CONFIG_ALLWINNER_A10) +=3D ahci-allwinner.o
 common-obj-$(CONFIG_IDE_SII3112) +=3D sii3112.o
--=20
2.21.0

