Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5235033wrm;
        Tue, 8 Oct 2019 07:27:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqySk2dSApKOM3aUdv0gGlTQfW41GV5mt3mL0M4+I9ksxkrQRKg3NstjNxw8AMK0/Tr2dcGx
X-Received: by 2002:a50:eb8b:: with SMTP id y11mr33348697edr.200.1570544847163;
        Tue, 08 Oct 2019 07:27:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570544847; cv=none;
        d=google.com; s=arc-20160816;
        b=Pb1zltyWRCMYodHAWAGCr7LUHC5hBfuIAxN3x1fZ9+EG6XQyF2qGj6h+VKxNLPYHl1
         v//JrFROwSjwCfu5DbBTLL41pxF9rH1CsVDtNToh/jqiQG47bQyHZ+lRhkZuCAF1sfx3
         h1QbZmfbKhUqe9nYHb4Ph/Y3HvfcOOha/0poorRB1DiH19Fj/bnU1ZJiBgCcyHZvliQR
         vuZ5lF2ox/Blchmbr4ITrl3v7Dyy9uhVOd2OpyMESKG++vC6+Yi/zOa5my8jMh3uRzvK
         859yQB/wTw9JbjaUrnod3g5k3PHwW8eyzElfA6+q5TUk6uFKiyHYpJ7FfongAXaM8V7Z
         k+7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=7bPZdy9PxvHFJ8EAAbjBgMudhQq8S7uBtlge1o04RDk=;
        b=ibnU0hN0za4laZk2VWUHO7nS4qBOHWB46u4y4KgTeqNb0+CKh3ab1F2gI9/053OipF
         kYpCXo9zSoGN/VZ8rF1hb8zBfDvNAtrZjuGb259mpRamG6qsp4wHqfygBCZSAGcB7gBL
         zDrEFqPPPHGaX/JBhjxgPaUyCxKwq8dIJ+5tKZAToVqIdzQU1bdocFY7FQZqHbD0tyo2
         z9YyyFbe6K0SUPj9JIIa2+m7+cmCUvB13gG+/0fJX8iHxqBaJCus5e0Bki3l66KVEDFs
         YBTtWHdUleTT9YVXnU1gXGwV3bosRyN6aQa+qOn9aweBXjt6xHEk7GFrbJNmCP/Z/BwM
         y5ig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14si10051403edx.197.2019.10.08.07.27.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 07:27:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHqST-0006wZ-Kh
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 10:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50017)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iHqRm-0006R1-CL
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 10:26:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iHqRl-00005j-7r
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 10:26:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:23807)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iHqRl-00005W-2U; Tue, 08 Oct 2019 10:26:41 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3C9D77FDF0;
 Tue,  8 Oct 2019 14:26:40 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-43.brq.redhat.com [10.40.204.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD2A919C69;
 Tue,  8 Oct 2019 14:26:27 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] hw/ide/piix: Convert reset handler to DeviceReset
Date: Tue,  8 Oct 2019 16:25:34 +0200
Message-Id: <20191008142539.7793-4-philmd@redhat.com>
In-Reply-To: <20191008142539.7793-1-philmd@redhat.com>
References: <20191008142539.7793-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Tue, 08 Oct 2019 14:26:40 +0000 (UTC)
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r5JGebRP/rgt

The PIIX3/IDE is a PCI device within the PIIX3 chipset, it will be reset
when the PCI bus it stands on is reset.

Convert its reset handler into a proper Device reset method.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ide/piix.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index fba6bc8bff..18b2c3b722 100644
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
+static void piix3_ide_reset(DeviceState *dev)
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
+    dc->reset =3D piix3_ide_reset;
     k->realize =3D pci_piix_ide_realize;
     k->exit =3D pci_piix_ide_exitfn;
     k->vendor_id =3D PCI_VENDOR_ID_INTEL;
--=20
2.21.0

