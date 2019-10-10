Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp2362523wrm;
        Thu, 10 Oct 2019 06:16:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw2AZqKdj7G+7A6bhLoFRyaydMPLRMr6T0/JnMXlVsl6E6FxA2DREGXAtx/EAQCo1WDQDoV
X-Received: by 2002:a05:6402:1359:: with SMTP id y25mr8003680edw.183.1570713378429;
        Thu, 10 Oct 2019 06:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570713378; cv=none;
        d=google.com; s=arc-20160816;
        b=BCnN70ZH8FqxNqe+xBQIA3RDYmqn2Q1Y5vsI5QZTGTKKW8OzuF3FLDFNMsQSqFXIH8
         jehzMwyOGOkHA064JQLZVKhuSihCwiMDhUE51YF7s90qnqXaQ1VX7oi4lRwc2etBWKCL
         eWW4N7ITNlBtfyNGeuXPHrxo6w1ZThiqaWB9HSYviCQSnuQmeK2zM2LbBszbpT7lonOU
         xgEihInYLVGFgNxMrSK2HYcTo02a5x8NlVn5myK7fVazdWkUQoXS0WODHUUnVuggmHQX
         4h4iwHYicfC7OG6Rn0Pbzsayqy+mBCCsmYY3g6RmFIdw4FarhF5bfFlZrWoQme5o/i7x
         qSIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=6f3veFybJCek5QThzD5hWRpThS8W3xiH10dhJyGoM58=;
        b=CoLG+q3DzdZVBiAorwSPqV3JX0oi8nCQsk8Q9MvWB9psU1s3fBO56PnNvAiWzoPgzR
         m3mG2DIwSuWtvP7SuareCIRbs+N9kzTqjomasT/FrhalYIR6yWuARX0qIeBipCp5MA/v
         k0pe/yuVR93zyO/x79O0vzRJIX8aFtH6yaXoNEevPGZ9AoOhGiaz3nzRPd1z6Mcsp2TL
         +tw2c+Jra0dvnHAd6yV1BgOlADcbJvkgoS6AXnebOsDFKsfznmyY10nf9N6JESspifrc
         sFevTMERvsJMpjgxCY7CumMWKhyVaFfSL2fCk9wrmot5pn6deiD4tIqbmMobvPM7sD3/
         wl4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r3si3062643ejs.415.2019.10.10.06.16.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2019 06:16:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIYIj-0007gD-7O
	for alex.bennee@linaro.org; Thu, 10 Oct 2019 09:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40315)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iIYIQ-0007Wv-6o
 for qemu-arm@nongnu.org; Thu, 10 Oct 2019 09:15:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iIYIO-0001tP-6n
 for qemu-arm@nongnu.org; Thu, 10 Oct 2019 09:15:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43794)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iIYIM-0001sH-6q; Thu, 10 Oct 2019 09:15:55 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2C46F3091D70;
 Thu, 10 Oct 2019 13:15:52 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18889600C4;
 Thu, 10 Oct 2019 13:15:45 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 1/8] hw/acpi/piix4: Convert reset handler to DeviceReset
Date: Thu, 10 Oct 2019 15:15:20 +0200
Message-Id: <20191010131527.32513-2-philmd@redhat.com>
In-Reply-To: <20191010131527.32513-1-philmd@redhat.com>
References: <20191010131527.32513-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Thu, 10 Oct 2019 13:15:52 +0000 (UTC)
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
X-TUID: qobJTHqKiRzf

The PIIX4/PM is a PCI device within the PIIX4 chipset, it will be reset
when the PCI bus it stands on is reset.

Convert its reset handler into a proper Device reset method.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/acpi/piix4.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 5742c3df87..4e079b39bd 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -27,7 +27,6 @@
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
 #include "hw/acpi/acpi.h"
-#include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "qapi/error.h"
@@ -344,9 +343,9 @@ static const VMStateDescription vmstate_acpi =3D {
     }
 };
=20
-static void piix4_reset(void *opaque)
+static void piix4_pm_reset(DeviceState *dev)
 {
-    PIIX4PMState *s =3D opaque;
+    PIIX4PMState *s =3D PIIX4_PM(dev);
     PCIDevice *d =3D PCI_DEVICE(s);
     uint8_t *pci_conf =3D d->config;
=20
@@ -542,7 +541,6 @@ static void piix4_pm_realize(PCIDevice *dev, Error **=
errp)
=20
     s->machine_ready.notify =3D piix4_pm_machine_ready;
     qemu_add_machine_init_done_notifier(&s->machine_ready);
-    qemu_register_reset(piix4_reset, s);
=20
     piix4_acpi_system_hot_add_init(pci_address_space_io(dev),
                                    pci_get_bus(dev), s);
@@ -692,6 +690,7 @@ static void piix4_pm_class_init(ObjectClass *klass, v=
oid *data)
     k->device_id =3D PCI_DEVICE_ID_INTEL_82371AB_3;
     k->revision =3D 0x03;
     k->class_id =3D PCI_CLASS_BRIDGE_OTHER;
+    dc->reset =3D piix4_pm_reset;
     dc->desc =3D "PM";
     dc->vmsd =3D &vmstate_acpi;
     dc->props =3D piix4_pm_properties;
--=20
2.21.0

