Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3649870wrh;
        Tue, 7 May 2019 06:45:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy2NEGlCLrZBtqtv2MZcod46LGRCpBVzgB/9nciDvPNxvafCjT1GhVRrTblTHJRJU7pC8B+
X-Received: by 2002:a5d:6189:: with SMTP id j9mr22015056wru.176.1557236748518;
        Tue, 07 May 2019 06:45:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557236748; cv=none;
        d=google.com; s=arc-20160816;
        b=YXsCJfWQIjD1atBoEbq7kpHQTnNEzBpz/TRyYEt37ucArHLsSD4+DYM/rCI0HXtUXu
         ArJAFeS4NcCtWjSHEMZVYB7QnqJjKf2KPb0gz8wperMSjG7L+qy3tcNoMv1bxrdB2OJ5
         8CUmRQyPWt3g/heqwe27c+BrJPeGPNZNvDLH8CHFYkoKhjHG/Gusb5kbIHx0wrzrKJ7E
         hJ8tXCPJaGzLGVKKDlXdahE58uc97eAvLzQQ80xLQ9IFuD1d+C7DZEW/iFGPOD0BZ+8r
         dR7wcNFCGLPJ2cgRf49+KUnnh7bGdb1Dj2kOyNoskmtJ8QJKx7dXsQcGkK9Ee71dKJ0T
         LaRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ZagKkJ0h28oW+CD8VEKaaOMfyvW0nUicV0bv7zp/N1E=;
        b=Vq5YbEaiwDOlunD4/luEZHBF/TpMgT53an4+Qkod9YkPI1izmCOfrWsIYgEnp8wLKu
         Sgcc5iSh3oyx4ZmdoIrXgRv8vNLFKT5Rk9Joj17VKRT0Rkc9T0uahn8vztGWM3WNXi5N
         t+bo9XLSIaouNSXEjj8ooHYEIk19W9sZfoNxBz+/R8WYEHg3fczbu8ls5oCSxMF3hjid
         C7ePg2zCUdt5crm0EzIkYBowIEZNf1fAE140o+KC8QqDWCxqWUco9rcykMnc1Qsi6LqG
         IhO3ygviUzhi+4IQi8mJ3b2zoKeg0BN0rAKb2u80nf6v3tlnE4G4vIRnn/CtY+DrJcWZ
         oZ1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2si10077179wrx.252.2019.05.07.06.45.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 06:45:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:47098 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hO0Pj-0004y3-IY
	for alex.bennee@linaro.org; Tue, 07 May 2019 09:45:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hO0PZ-0004xt-FX
	for qemu-arm@nongnu.org; Tue, 07 May 2019 09:45:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hO0PY-0006zN-7N
	for qemu-arm@nongnu.org; Tue, 07 May 2019 09:45:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:20371)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hO0PY-0006yU-1e; Tue, 07 May 2019 09:45:36 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 53C0AC0AD1DF;
	Tue,  7 May 2019 13:45:35 +0000 (UTC)
Received: from thuth.com (ovpn-116-130.ams2.redhat.com [10.36.116.130])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 201641A4D9;
	Tue,  7 May 2019 13:45:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Tue,  7 May 2019 15:45:21 +0200
Message-Id: <20190507134521.31044-2-thuth@redhat.com>
In-Reply-To: <20190507134521.31044-1-thuth@redhat.com>
References: <20190507134521.31044-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 07 May 2019 13:45:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 02/28] hw/ide/ahci: Add a Kconfig switch for
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
Cc: jsnow@redhat.com, qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PiOPtaxxSYPx

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

