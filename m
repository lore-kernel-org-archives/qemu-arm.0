Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5236445wrm;
        Tue, 8 Oct 2019 07:28:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzb+rbENSnJ3glqlw/xYzzBqSYBJpExngqozJNi1apfcV8xPngxN32Ok1yloLUC+0fam4tN
X-Received: by 2002:a17:90a:3524:: with SMTP id q33mr5938803pjb.37.1570544925291;
        Tue, 08 Oct 2019 07:28:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570544925; cv=none;
        d=google.com; s=arc-20160816;
        b=mna+HuaPHmkNNK9244UMojzHcY+iJxqWbicga4UEeJoPl5GMInyBHYjPEx6ZLy5SWn
         CpOhR7ATNabAXxkuf267db6fZ+tdEcPvWdAaxXBCiqtbzT6VeEqfcaMYnitd/jQ8K5cr
         5mNYIiq4pCtu+OID4M8BXdY5quk3U6L8pGUoedLmMkL6QR8f4yltDHCjgKcT60YUFGqh
         9akjblzs6i6DuMq69sg8sg6DKMx8TxvyT0SZJt/I9TLSrLxoa3w/o6sQboUL72QT1ack
         jbkci13ANR1/7g5KBrkXfsB3bBj9Oqjp3z2H5eHM4tqCZMMRQYQEeIKifLM1KPN9AHcU
         jXUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=ka+Vt6UJZCjlocyhS0uzXeHHlqfKp6vZANg6mDepZ4A=;
        b=ejA5aOiteK87bBHBAt5n+iLJFSZBt4Rq8IR6kgzMqyLhZuTnBPRHFuNAHy/3z99Dp5
         MoahXohvLAaiseZtlQuy0ZjBvhHfVS2JncBrtBNsXCa0LvH7XegOWSRk6Lbj20KyZXL+
         Vu46n9AmlMcFyp5s8XejiLc9SFwDNhTU2NDa8IHnb9RJemAMoAfY4UsrojfagjOISuqa
         GEOJgCw3/NKMMGr7N6P24nYqGnB+xd1rhGz6wwfnXgprSmuUL0Vo/WmM3GUd2KivGeOP
         1l/UgyrQPgXEvpeM7Yh6oPhcxrZcVdcKeIMy4bbugyLq81pbb1p3kmWw0QKT361ewt0D
         Vy6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t19si16845189ply.352.2019.10.08.07.28.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 07:28:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHqTi-0008HD-1i
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 10:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50265)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iHqSU-0007Hi-3n
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 10:27:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iHqSS-0000Sr-Sn
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 10:27:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50556)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iHqSS-0000SU-BV; Tue, 08 Oct 2019 10:27:24 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6EF86308C387;
 Tue,  8 Oct 2019 14:27:23 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-43.brq.redhat.com [10.40.204.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C54DF19C69;
 Tue,  8 Oct 2019 14:27:05 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] hw/isa/vt82c686: Convert reset handler to DeviceReset
Date: Tue,  8 Oct 2019 16:25:37 +0200
Message-Id: <20191008142539.7793-7-philmd@redhat.com>
In-Reply-To: <20191008142539.7793-1-philmd@redhat.com>
References: <20191008142539.7793-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 08 Oct 2019 14:27:23 +0000 (UTC)
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
X-TUID: I+Vm5j+SVClS

The VIA VT82C686 Southbridge is a PCI device, it will be reset
when the PCI bus it stands on is reset.

Convert its reset handler into a proper Device reset method.

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

