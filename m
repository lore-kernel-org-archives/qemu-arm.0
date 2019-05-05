Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1428470wrh;
        Sun, 5 May 2019 06:57:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxMaw1C5Ui5xtB6AtKtt4a/cF+PJ7BDyVyRBh2pQHOmTOLELYTeKc2E6pIyHGLt9HduozLn
X-Received: by 2002:a5d:5551:: with SMTP id g17mr15713990wrw.50.1557064679021;
        Sun, 05 May 2019 06:57:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557064679; cv=none;
        d=google.com; s=arc-20160816;
        b=iJW0/xpp+qVZ0eA4LI/b56i8fGfipiu4/qmTjqX16A9TGbeM+YatScXegMDz5AcClX
         IXOln1jiaB5q+nmVHALEasfMr68FEqHFxeKXSJIzIrmXu4TFD7xLVuzS+QLdwBCZVZWp
         lCFzk5yfQsFr+SBjs3HeVRaVRyKp2xVqHPZFa+6+qS1XyyTpKvkP1nJUyjgc1ZLbbhtm
         7alDQervYbVCH/NS8yuLyERiI/QKxSYB1QwrJlGbAT+7xyS3uiAvx6wJ4SdZ/FgxVojo
         noYQvxzhsZ1QmfPaAbHx/nTubDV7o4Sjc+b/f+Xmi5vhmrm29ASPM26R4Ogga8QjMLHM
         UizA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=7HvJ1fGolWFAIU2L1jcxfH6Jvn5tL775n1FOc/CclyI=;
        b=daZQklpStONvmb59Bgxmuoqx/nBqb5ZW7WPTJanNzKu68QIfpLqR9OlZbQAyF/sF2K
         ZNgMoPL8lIJaDBvdCmRufx3usZfImn6ozI7kIFKzJmasHRVRHvtvdDL95kGRmEiXsqbI
         p/7hfIl2i/E1X1KCaNWbuogXTqm3y5N0g42NzzkvYCIvvNmK36C0m0C1Shz0j5mFRk67
         Hf2KYWjzy+y/5+ACghUAggF0ny5bJ9HMlPbJPxCwmMHFeYmtDrNj+8HE0bSSx2awMeHf
         c1IT9FrMpsD9f2qHmX8BNxQ4B0LXyyiEPnr22Nm04RJ9vq6kvckexn4SQ5OQBbwvVo7Y
         EATQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t78si3590296wmt.40.2019.05.05.06.57.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 06:57:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41356 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHeQ-0004IS-2n
	for alex.bennee@linaro.org; Sun, 05 May 2019 09:57:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHdr-00041q-K8
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHdq-0004Xf-M2
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59958)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHdq-0004XC-HA; Sun, 05 May 2019 09:57:22 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD78881E1B;
	Sun,  5 May 2019 13:57:21 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C116A60C5F;
	Sun,  5 May 2019 13:57:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:56:48 +0200
Message-Id: <20190505135714.11277-3-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Sun, 05 May 2019 13:57:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 02/28] hw/ide/ahci: Add a Kconfig switch for the
 AHCI-ICH9 device
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
X-TUID: YgPThCnbaYrT

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
 hw/ide/Kconfig       | 6 +++++-
 hw/ide/Makefile.objs | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

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

