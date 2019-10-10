Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp2369064wrm;
        Thu, 10 Oct 2019 06:21:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx7L4S5JJOeSLckQxyEqp2WIeBohEqnAV2AAOfWGqC+41zcikVUQnXvKK0mqI+VoYXf6Not
X-Received: by 2002:a05:620a:751:: with SMTP id i17mr9487694qki.340.1570713698964;
        Thu, 10 Oct 2019 06:21:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570713698; cv=none;
        d=google.com; s=arc-20160816;
        b=bu4TCSasX1XWsF0a67ANJYGSYzOXn3O2a1L1kas2RmdlR8fIVuVRefv5jQb/8lQetw
         I/5u+k7R7bTA2wVCqdAx15YVezSxZZMonYOQpNTknwzKHKc3I+4ORpbHRwhNZT2kK/jL
         g82ZwHjZze5Vu3Hk35RYsJI6C6AmEL8J+OK+4cutjdRgSLYTQDmP3WM8jodgM0Bpf7bW
         E/cFCQYxoIhsNIDO42sMLC4nwfauiQYJTUsut1LID6CgzSswl1t1PyO4ph4Hw9n8f279
         KZjJkE58vsRAoOcIJyC+VqMjTaONkRFQJYH6LqDw6aVgGjkY7+WGbySI3r/pQBi/ePQF
         ozug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=D5FXIWhaVIx4CNQx8TAUCptfFwEckphvDdLlQQbJW64=;
        b=Q9rMTRUi9uMfwe89vH29n9AOgeepnksSEcLiDVzH3fKzEThRXcTCJa5OfyIxnx7wbj
         8YBF/CUE2/nuYmuiTkrf7K6jlRe6kRHVQptP2wjqaztR1jXbuYP/pzyzAREuXQ+/4EV1
         FWA1QEmWYJQ0oNI8ZwC8VaJjQd43sFdWWTX9CMea8FzlyudmQNIIcH7kfb59Z8gZy9VZ
         9segZMn0ZxPjPbfvd/B9xbs2CStiMLHiMK6n8bsAK9sOx3pW6pmLXsHRvobNjSEjPe+A
         AY0eOEab1H2FqLOItBR0DhrCmq9T3ybHoQGHwnmddrt/AsjHcoKaZ6P1jBGOOylfubIi
         g2Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n130si5410824qkn.312.2019.10.10.06.21.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2019 06:21:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIYNu-0005RU-0C
	for alex.bennee@linaro.org; Thu, 10 Oct 2019 09:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40537)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iIYJA-0000TE-Td
 for qemu-arm@nongnu.org; Thu, 10 Oct 2019 09:16:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iIYJ9-0002Eq-OK
 for qemu-arm@nongnu.org; Thu, 10 Oct 2019 09:16:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54536)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iIYJ9-0002Dh-Il; Thu, 10 Oct 2019 09:16:43 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BE3773084249;
 Thu, 10 Oct 2019 13:16:42 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B76B7600C4;
 Thu, 10 Oct 2019 13:16:34 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 4/8] hw/ide/sii3112: Convert reset handler to DeviceReset
Date: Thu, 10 Oct 2019 15:15:23 +0200
Message-Id: <20191010131527.32513-5-philmd@redhat.com>
In-Reply-To: <20191010131527.32513-1-philmd@redhat.com>
References: <20191010131527.32513-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 10 Oct 2019 13:16:42 +0000 (UTC)
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
X-TUID: i6dmARmTg63q

The SiI3112A SATA controller is a PCI device, it will be reset
when the PCI bus it stands on is reset.

Convert its reset handler into a proper Device reset method.

Reviewed-by: Li Qiang <liq3ea@gmail.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ide/sii3112.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
index 2181260531..06605d7af2 100644
--- a/hw/ide/sii3112.c
+++ b/hw/ide/sii3112.c
@@ -15,7 +15,6 @@
 #include "qemu/osdep.h"
 #include "hw/ide/pci.h"
 #include "qemu/module.h"
-#include "sysemu/reset.h"
 #include "trace.h"
=20
 #define TYPE_SII3112_PCI "sii3112"
@@ -237,9 +236,9 @@ static void sii3112_set_irq(void *opaque, int channel=
, int level)
     sii3112_update_irq(s);
 }
=20
-static void sii3112_reset(void *opaque)
+static void sii3112_reset(DeviceState *dev)
 {
-    SiI3112PCIState *s =3D opaque;
+    SiI3112PCIState *s =3D SII3112_PCI(dev);
     int i;
=20
     for (i =3D 0; i < 2; i++) {
@@ -290,7 +289,6 @@ static void sii3112_pci_realize(PCIDevice *dev, Error=
 **errp)
         s->bmdma[i].bus =3D &s->bus[i];
         ide_register_restart_cb(&s->bus[i]);
     }
-    qemu_register_reset(sii3112_reset, s);
 }
=20
 static void sii3112_pci_class_init(ObjectClass *klass, void *data)
@@ -303,6 +301,7 @@ static void sii3112_pci_class_init(ObjectClass *klass=
, void *data)
     pd->class_id =3D PCI_CLASS_STORAGE_RAID;
     pd->revision =3D 1;
     pd->realize =3D sii3112_pci_realize;
+    dc->reset =3D sii3112_reset;
     dc->desc =3D "SiI3112A SATA controller";
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 }
--=20
2.21.0

