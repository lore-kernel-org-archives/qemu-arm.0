Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5234613wrm;
        Tue, 8 Oct 2019 07:27:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz+CoSJvT886i5CHu7/wP0ApaTbj0XnbImcOFPBLZ7baJXNIu0qwlcdiMTRxi6TBchus5Pl
X-Received: by 2002:a50:9402:: with SMTP id p2mr34380907eda.111.1570544823060;
        Tue, 08 Oct 2019 07:27:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570544823; cv=none;
        d=google.com; s=arc-20160816;
        b=NuBkcZ9DzjnkrWkkpilcL3pk3TJAAEf3xGDwiVpLtt/Ok6I23JHYwtrxD8KN+8bMEc
         MT0W1A1V6SfaKUQqbuBxXautpSsrjySPEpliNsk5b3/9BHcWFCqgV+0rEPcp3cJ8C6Og
         jmLZRoD10opvRrsKMawSQGUr0b1x4QXXklhBfiHxOLRrYT0DPeMDbFjscFsf1q6dr6iO
         47DYOyul/jmUmOicyfN3bPpn0Ufic23OeywdgeIFf3AtIMquQ07ZJ0y15QnaNn50Qpf4
         jOEjij4YkIpYEMQ1hlWWJ85FoAjIcBf3/tbrEZnH4w1/RhOdD6H74BN3No4vo4kEJcsa
         2h3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=+l2PLW95Vl42Xo0sDRztMQ4hH2qd5NSV4gHmaaOrRdc=;
        b=JMYB7lbKWc3eCFtnFyNDT6vCvYyLzWZbvu9K9o1C7atQFLgSqtG0DZsiEjKOFjSTHz
         QKc6CJ7rs2jFIp/lX/As3E+jyjaY2WR4OkrLTZbkBaFD6HTONuEk+ueExNoA0i+16eMx
         W9YeXB22EJA55BkG5/Y6eZKB7HPlSq7aRXf4eVQOzzFIjGEyR9rH+zyNlwSc22DdFQwd
         kZ02xCO0ndQ2XzOEqdDZFkiW8VbXz7ZJsZPJcfMlOefR2jyXa9+EORJkF4BmR4UfqH69
         C0BRUx6U0/r/69GlEWbBMqH/k3mbiz3/8xY7mLYmqqe1LYn0EC+B4t9xhJSeiIJM67Nt
         1DpA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14si10526976eda.181.2019.10.08.07.27.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 07:27:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHqS5-0006Y0-GG
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 10:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49955)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iHqRZ-0006GM-Uf
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 10:26:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iHqRY-0008Sm-Hp
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 10:26:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42058)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iHqRX-0008RO-Vo; Tue, 08 Oct 2019 10:26:28 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2108AC034E71;
 Tue,  8 Oct 2019 14:26:27 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-43.brq.redhat.com [10.40.204.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4427919C69;
 Tue,  8 Oct 2019 14:26:18 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/8] hw/isa/piix4: Convert reset handler to DeviceReset
Date: Tue,  8 Oct 2019 16:25:33 +0200
Message-Id: <20191008142539.7793-3-philmd@redhat.com>
In-Reply-To: <20191008142539.7793-1-philmd@redhat.com>
References: <20191008142539.7793-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 08 Oct 2019 14:26:27 +0000 (UTC)
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
X-TUID: o2kzGsJ4xTWe

The PIIX4/ISA is a PCI device within the PIIX4 chipset, it will be reset
when the PCI bus it stands on is reset.

Convert its reset handler into a proper Device reset method.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/isa/piix4.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 3294056cd5..890d999abf 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -28,7 +28,6 @@
 #include "hw/isa/isa.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
-#include "sysemu/reset.h"
=20
 PCIDevice *piix4_dev;
=20
@@ -40,9 +39,9 @@ typedef struct PIIX4State {
 #define PIIX4_PCI_DEVICE(obj) \
     OBJECT_CHECK(PIIX4State, (obj), TYPE_PIIX4_PCI_DEVICE)
=20
-static void piix4_reset(void *opaque)
+static void piix4_isa_reset(DeviceState *dev)
 {
-    PIIX4State *d =3D opaque;
+    PIIX4State *d =3D PIIX4_PCI_DEVICE(dev);
     uint8_t *pci_conf =3D d->dev.config;
=20
     pci_conf[0x04] =3D 0x07; // master, memory and I/O
@@ -97,7 +96,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
     piix4_dev =3D &d->dev;
-    qemu_register_reset(piix4_reset, d);
 }
=20
 int piix4_init(PCIBus *bus, ISABus **isa_bus, int devfn)
@@ -118,6 +116,7 @@ static void piix4_class_init(ObjectClass *klass, void=
 *data)
     k->vendor_id =3D PCI_VENDOR_ID_INTEL;
     k->device_id =3D PCI_DEVICE_ID_INTEL_82371AB_0;
     k->class_id =3D PCI_CLASS_BRIDGE_ISA;
+    dc->reset =3D piix4_isa_reset;
     dc->desc =3D "ISA bridge";
     dc->vmsd =3D &vmstate_piix4;
     /*
--=20
2.21.0

