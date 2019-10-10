Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp2371368wrm;
        Thu, 10 Oct 2019 06:23:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqykpImugySntpmOp6gi3RyoHXwn3XovakE+0B18Qfg5SWiolbsukjQbULbqN12GzzRPAIq/
X-Received: by 2002:a05:620a:a17:: with SMTP id i23mr9600255qka.325.1570713815307;
        Thu, 10 Oct 2019 06:23:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570713815; cv=none;
        d=google.com; s=arc-20160816;
        b=j3j8hNsTOe4sNHm+m07VEPM460IqpftCLvHPhzJy20b9Z9d0YnHT44NMOFpEes5Z2/
         XcPaMNbKNTg4hKfmkci/xArbUYRiqsFKgHCPkZIpdAAPLme8xiYITIQhxXWg/RsoHPUl
         9hVjsJlGFO8EbVnqJngZk4k0S1Bib1fmaFikgL59C2qB9Gi+1xvn+YRR6Q05fyJSESyg
         c1f9vGLEdXj+99/M0KXPICMCWGJDGUSpeSL8rZsHGAYaBiFEmH7Or+vB9pFTfoYVhQyH
         EPFqKqzXTxKfZBY47pR1fX35nqpBQak6EDEZigZYMtnzT8s4xAAo17Ug9POdF/Cb84ja
         Cxwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=BlpXGMJgm9AYzn+Z+5JIGHke9H+8v+/QP8gxuh2SmeY=;
        b=RvaLPkpSBCMidEAA1Qu6deDtdW8l2aznGe9UKpjNCRR4TTLIzLQB5EZxj/C/Zk2aOH
         8X/q+8ggUelJpcjPl6pKLGcJYH9pegNx1WVIWre8EernOEAPZEx/M0Q2veiAXfcI8wpf
         rWZd60PPZnK8M2Vak0ZWwkKfG16oCXgLvr96wNUZ/AKeyH2fxoUYgbFT724FeiNw4/EJ
         CiyN3Gt5KjXVZYeWSGW0Z5jaRAAlyhmih3tHMj8UG8cBtHJj9Dsj797YgWV+PplGPN58
         irEZ5UxIt3Ohzvx8Ezoabbtui/P2EtK8lyJqnf/KSM1fLPlk0zLAo6U2cp/uu8jr+Wk8
         MVhA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 70si5836568qkg.180.2019.10.10.06.23.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2019 06:23:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIYPm-0008LH-Aw
	for alex.bennee@linaro.org; Thu, 10 Oct 2019 09:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40486)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iIYJ2-0000AQ-4l
 for qemu-arm@nongnu.org; Thu, 10 Oct 2019 09:16:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iIYJ1-0002AM-2q
 for qemu-arm@nongnu.org; Thu, 10 Oct 2019 09:16:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51874)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iIYJ0-0002A2-Tm; Thu, 10 Oct 2019 09:16:35 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EF56A8D5D84;
 Thu, 10 Oct 2019 13:16:33 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EA79600C4;
 Thu, 10 Oct 2019 13:16:13 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 3/8] hw/ide/piix: Convert reset handler to DeviceReset
Date: Thu, 10 Oct 2019 15:15:22 +0200
Message-Id: <20191010131527.32513-4-philmd@redhat.com>
In-Reply-To: <20191010131527.32513-1-philmd@redhat.com>
References: <20191010131527.32513-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Thu, 10 Oct 2019 13:16:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QVRTMTnHYCha

The PIIX/IDE is a PCI device within a PIIX chipset, it will be reset
when the PCI bus it stands on is reset.

Convert its reset handler into a proper Device reset method.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v3: Also convert PIIX4 (Li Qiang)
---
 hw/ide/piix.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index fba6bc8bff..db313dd3b1 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -30,7 +30,6 @@
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/dma.h"
-#include "sysemu/reset.h"
=20
 #include "hw/ide/pci.h"
 #include "trace.h"
@@ -103,9 +102,9 @@ static void bmdma_setup_bar(PCIIDEState *d)
     }
 }
=20
-static void piix3_reset(void *opaque)
+static void piix_ide_reset(DeviceState *dev)
 {
-    PCIIDEState *d =3D opaque;
+    PCIIDEState *d =3D PCI_IDE(dev);
     PCIDevice *pd =3D PCI_DEVICE(d);
     uint8_t *pci_conf =3D pd->config;
     int i;
@@ -154,8 +153,6 @@ static void pci_piix_ide_realize(PCIDevice *dev, Erro=
r **errp)
=20
     pci_conf[PCI_CLASS_PROG] =3D 0x80; // legacy ATA mode
=20
-    qemu_register_reset(piix3_reset, d);
-
     bmdma_setup_bar(d);
     pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
=20
@@ -247,6 +244,7 @@ static void piix3_ide_class_init(ObjectClass *klass, =
void *data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
=20
+    dc->reset =3D piix_ide_reset;
     k->realize =3D pci_piix_ide_realize;
     k->exit =3D pci_piix_ide_exitfn;
     k->vendor_id =3D PCI_VENDOR_ID_INTEL;
@@ -273,6 +271,7 @@ static void piix4_ide_class_init(ObjectClass *klass, =
void *data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
=20
+    dc->reset =3D piix_ide_reset;
     k->realize =3D pci_piix_ide_realize;
     k->exit =3D pci_piix_ide_exitfn;
     k->vendor_id =3D PCI_VENDOR_ID_INTEL;
--=20
2.21.0

