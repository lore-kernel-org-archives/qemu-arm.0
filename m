Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5243887wrm;
        Tue, 8 Oct 2019 07:35:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyqm75DvUyThpO8FjRzwkinREHGVWkhLd0lg9FOkvKuzGnrCGO1M2GRczhzwwdCklMY8dQl
X-Received: by 2002:ad4:5552:: with SMTP id v18mr33365846qvy.185.1570545332119;
        Tue, 08 Oct 2019 07:35:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570545332; cv=none;
        d=google.com; s=arc-20160816;
        b=yNdK/w4Ms3CjIh0Nnw7Vq3/U7PKCD6orovoEXyrBmcioIYNqySwdW3EXgag9E0WK7f
         myD11ZXfJb5K3YcMvD4AV8QHaflK+bT1tMODnSwEW3bmTkIlIzWzMHt6hGUhucaZDcJ3
         2Mo20HDBKx9ayFd6sJs21Z0YEtQheJB/5zH/AWQQTxzU5BESbxisnQJHosEtdawv9zNs
         bCYN6A5hoMyW2+w07dnOROt7sd8/gAZtcD/WDJ1NGPC/sftH5+1uinn9twzmS3wlMHX7
         l50m31aqNivgBR5h71jf7l2yxnMMeQi8Tm8/mr+FH067NWMlylCFw4FD9fAM1amizbHh
         XpTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=lp3oiMFxAAgp2Sh/f1h9kcIV5p6RXNfXLluTlCgotzA=;
        b=blfsKcfNT21qQdirrIrGudfQ3eXhsauOqFQRnnr2qlaJEpft9oOHCr3Sf+S57/5JdP
         7Jx3cJD+cRc1+adjveSd7QvIwK95bxm4icbzMMzueL8Hf8FPzUWyw1hqgr7M/lJxLfwA
         XcUlwyXAM708f0AKuUDLV4u5psYzccI/xcIwlS9mbIpZE4NyR9rtXNTmTOW8ymBhFj7+
         dpefmS+KJGEZ/1IAyF3Vw4AhdwPIHSOJhJU34ik1oDsrVcVfniQ2HjbpKRn8fA4X4lHi
         fwfo57HyrZ6yH5SwfRsg1WMLenK9P/NSaYdwbe6wExwyEHxpaCqWNhyT08xt6UHdjazY
         OOLw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b28si16671822qvb.24.2019.10.08.07.35.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 07:35:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHqaI-0005kJ-TM
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 10:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50204)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iHqSI-00074R-3m
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 10:27:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iHqSG-0000NV-2I
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 10:27:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:8010)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iHqS9-0000LP-Uf; Tue, 08 Oct 2019 10:27:06 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0630C190C006;
 Tue,  8 Oct 2019 14:27:05 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-43.brq.redhat.com [10.40.204.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7080D19C69;
 Tue,  8 Oct 2019 14:26:49 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] hw/ide/via82c: Convert reset handler to DeviceReset
Date: Tue,  8 Oct 2019 16:25:36 +0200
Message-Id: <20191008142539.7793-6-philmd@redhat.com>
In-Reply-To: <20191008142539.7793-1-philmd@redhat.com>
References: <20191008142539.7793-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Tue, 08 Oct 2019 14:27:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o9iAnvh9AN3S

The VIA82C686B IDE controller is a PCI device, it will be reset
when the PCI bus it stands on is reset.

Convert its reset handler into a proper Device reset method.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ide/via.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/ide/via.c b/hw/ide/via.c
index 7087dc676e..053622bd82 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -29,7 +29,6 @@
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "sysemu/dma.h"
-#include "sysemu/reset.h"
=20
 #include "hw/ide/pci.h"
 #include "trace.h"
@@ -120,10 +119,10 @@ static void via_ide_set_irq(void *opaque, int n, in=
t level)
     }
 }
=20
-static void via_ide_reset(void *opaque)
+static void via_ide_reset(DeviceState *dev)
 {
-    PCIIDEState *d =3D opaque;
-    PCIDevice *pd =3D PCI_DEVICE(d);
+    PCIIDEState *d =3D PCI_IDE(dev);
+    PCIDevice *pd =3D PCI_DEVICE(dev);
     uint8_t *pci_conf =3D pd->config;
     int i;
=20
@@ -172,8 +171,6 @@ static void via_ide_realize(PCIDevice *dev, Error **e=
rrp)
     pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0);
     dev->wmask[PCI_INTERRUPT_LINE] =3D 0xf;
=20
-    qemu_register_reset(via_ide_reset, d);
-
     memory_region_init_io(&d->data_bar[0], OBJECT(d), &pci_ide_data_le_o=
ps,
                           &d->bus[0], "via-ide0-data", 8);
     pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &d->data_bar[0])=
;
@@ -229,6 +226,7 @@ static void via_ide_class_init(ObjectClass *klass, vo=
id *data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
=20
+    dc->reset =3D via_ide_reset;
     k->realize =3D via_ide_realize;
     k->exit =3D via_ide_exitfn;
     k->vendor_id =3D PCI_VENDOR_ID_VIA;
--=20
2.21.0

