Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp2371600wrm;
        Thu, 10 Oct 2019 06:23:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwC3DMn3cwe9PycIfYd5e7M26riY0MQrI4O6LdS3kkwxDa8NauqaUD3gTjubCRT48OOrIP5
X-Received: by 2002:ad4:4dc5:: with SMTP id cw5mr9619255qvb.134.1570713826269;
        Thu, 10 Oct 2019 06:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570713826; cv=none;
        d=google.com; s=arc-20160816;
        b=vgKIwyrI9i8WCwrDMXqRYQgNVWNr5IHZvPtoHMUp8RDnfy18vCRnYslwnwH2o0VoYV
         5O326U1QARZMjxG1RlE26T24URHm+Yii35Z9og0dxT/Db4QTrVRoqHVL17pleMX0BsTh
         3x31KjC9OfbLr+QCuPpMKiECsza+7RuiGU6SYPTRUvyOi0enIHaz9A/hBLCurdKLWdxy
         feo1e8fi3adfF0R1R8tDjW8xvbHTr54Uu+wOKRQaR/izOklXD6CXauViUbqLWrrnzzRk
         Tj9CB2LLeNuVqc43IVwY9UOWZ60DTUBupk/ns5lEda6p1CHh/Csj143R0tkdYDO/C8VG
         Wxbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Lfx+rSrCn7dmMKSFfedUIEoKzK0fnhz01UWv/MjrHAE=;
        b=ykj66BDLCcV+px6AhIKD6tE+3SceXiYpvFONrrkvPRz1Kj2Rg14CYKXShMw/+OmLoE
         JDfVOWupeZlR5PCD/rw5aV7RUOu5lwkq8Kt7KWrCn9rUAxXh8K6YyNEYabs/vcPDlVj4
         jQa3I9PRqOO19jVqHngz+7VDLBFHkQgQaVmps8iWimYyJBa0zGGVkCNZG+2C4tiyTQ1j
         l23bfeeL/dgPzsq00GagcZXxWFOLLIFNRozuwys50yRAnj5exonLt5uYGwF2sgKKGVaj
         2wxBE/L7JJMkeVb9yEnuTYgdQ9Lk/0lJQ55HtGRw7HshqhtuH444D4KCpDKArsf+alYO
         i1sg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2si5669193qkd.272.2019.10.10.06.23.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2019 06:23:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIYPx-0000JP-8H
	for alex.bennee@linaro.org; Thu, 10 Oct 2019 09:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40674)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iIYJo-0001JM-W0
 for qemu-arm@nongnu.org; Thu, 10 Oct 2019 09:17:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iIYJn-0002Tj-Ts
 for qemu-arm@nongnu.org; Thu, 10 Oct 2019 09:17:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46812)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iIYJn-0002Sn-0b; Thu, 10 Oct 2019 09:17:23 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 43A5C307D989;
 Thu, 10 Oct 2019 13:17:21 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F756600F8;
 Thu, 10 Oct 2019 13:17:01 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 6/8] hw/isa/vt82c686: Convert reset handler to DeviceReset
Date: Thu, 10 Oct 2019 15:15:25 +0200
Message-Id: <20191010131527.32513-7-philmd@redhat.com>
In-Reply-To: <20191010131527.32513-1-philmd@redhat.com>
References: <20191010131527.32513-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 10 Oct 2019 13:17:21 +0000 (UTC)
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
X-TUID: 6+RXrJqh//nb

The VIA VT82C686 Southbridge is a PCI device, it will be reset
when the PCI bus it stands on is reset.

Convert its reset handler into a proper Device reset method.

Reviewed-by: Li Qiang <liq3ea@gmail.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/isa/vt82c686.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 50bd28fa82..616f67f347 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -23,7 +23,6 @@
 #include "hw/isa/apm.h"
 #include "hw/acpi/acpi.h"
 #include "hw/i2c/pm_smbus.h"
-#include "sysemu/reset.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "exec/address-spaces.h"
@@ -116,11 +115,10 @@ static const MemoryRegionOps superio_ops =3D {
     },
 };
=20
-static void vt82c686b_reset(void * opaque)
+static void vt82c686b_isa_reset(DeviceState *dev)
 {
-    PCIDevice *d =3D opaque;
-    uint8_t *pci_conf =3D d->config;
-    VT82C686BState *vt82c =3D VT82C686B_DEVICE(d);
+    VT82C686BState *vt82c =3D VT82C686B_DEVICE(dev);
+    uint8_t *pci_conf =3D vt82c->dev.config;
=20
     pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0);
     pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_IO | PCI_COMMAND_ME=
MORY |
@@ -476,8 +474,6 @@ static void vt82c686b_realize(PCIDevice *d, Error **e=
rrp)
      * But we do not emulate a floppy, so just set it here. */
     memory_region_add_subregion(isa_bus->address_space_io, 0x3f0,
                                 &vt82c->superio);
-
-    qemu_register_reset(vt82c686b_reset, d);
 }
=20
 ISABus *vt82c686b_isa_init(PCIBus *bus, int devfn)
@@ -501,6 +497,7 @@ static void via_class_init(ObjectClass *klass, void *=
data)
     k->device_id =3D PCI_DEVICE_ID_VIA_ISA_BRIDGE;
     k->class_id =3D PCI_CLASS_BRIDGE_ISA;
     k->revision =3D 0x40;
+    dc->reset =3D vt82c686b_isa_reset;
     dc->desc =3D "ISA bridge";
     dc->vmsd =3D &vmstate_via;
     /*
--=20
2.21.0

