Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5239338wrm;
        Tue, 8 Oct 2019 07:31:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzxbyXe15+Lot7oetZEcG6lMuXP5jvsZtPHCi630pu3QMKUFqtTT9aDwjnRJ/zVzUpYlFB7
X-Received: by 2002:a50:f703:: with SMTP id g3mr34114967edn.43.1570545091382;
        Tue, 08 Oct 2019 07:31:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570545091; cv=none;
        d=google.com; s=arc-20160816;
        b=Mw8molvyjpOKjSSWAZv2WzjSYc3UhuXPWkoXRVZ3ylAre1iXQnnUSVb08AwcULMix8
         f8u3sucl0Cv/BKhVYAf/3tZ3klZ/N+4v7VLyTZOHiJqncSKYPK+qBO02Wx48lepIb5WA
         VApenMNpPXlASkqI2noNG9YPqsdNUWaemld1naOIhV9mJPoMKI2Qjk1x/nd5R+bmHeIl
         SiFAEP056zIw5+sXqeP8K7eHBw7zT/9seogz8HXbPAL3qg0/Ho+AjA/K3GMtrfrl49Ig
         znH20zbIEbuAv+LodvnLWBAJvIHIbdSLCVB9c5VQgkpUu8i8edGf04iBHij95I6m8Ich
         zzaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=G4LEKofkk16EHnrCbi5ExxXd4xUxFyEM0+K8TMVmR0E=;
        b=qGM+jYdhD88MmGdMD9gByZtJMpeEPdu1MspTMF6A+EO+ncefpHq2iAeu1NIYIK8UI7
         +4dd7y/u3DH0g+unBV/KsXLReRZpNGWMIj5/ic0M/+2WoWHohd88y+wE7puUumCstVSG
         WXmyofyhROIWEj/DQavv6sY2zra7ob3uWjV96udxAf+ATHOCGRkov62XRM5xXQyfZieC
         5dQA9XbhGlZP2lTUJCyHjtOuI2ZzquDICaXMsyBeKEMAoXmV+0FvB2uiZ1IFFyIL7bzE
         zyR147ztMSxwSIYdgcNEK3mK3N+k73S1KvzXJrTtRt7/Hq/Nly2k/YWe/R5Hiq8EtNRg
         3TJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u23si9025207ejr.204.2019.10.08.07.31.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 07:31:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHqWQ-0002GD-9g
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 10:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50102)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iHqS3-0006pB-FY
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 10:27:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iHqS2-0000IK-CF
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 10:26:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:6337)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iHqRt-0000E5-RK; Tue, 08 Oct 2019 10:26:49 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CBF8810CC1FF;
 Tue,  8 Oct 2019 14:26:48 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-43.brq.redhat.com [10.40.204.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7E5919C69;
 Tue,  8 Oct 2019 14:26:40 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] hw/ide/sii3112: Convert reset handler to DeviceReset
Date: Tue,  8 Oct 2019 16:25:35 +0200
Message-Id: <20191008142539.7793-5-philmd@redhat.com>
In-Reply-To: <20191008142539.7793-1-philmd@redhat.com>
References: <20191008142539.7793-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Tue, 08 Oct 2019 14:26:49 +0000 (UTC)
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
X-TUID: IWgp/UqfF+jz

The SiI3112A SATA controller is a PCI device, it will be reset
when the PCI bus it stands on is reset.

Convert its reset handler into a proper Device reset method.

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

