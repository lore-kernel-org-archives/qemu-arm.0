Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp719395wro;
        Thu, 25 Oct 2018 06:40:54 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fxyIPC/sZf9BYHx25asBpWo1Y1kD+mnlt+zHo7DSdvCkkrJsm9igY/CItMDTJhsml2FXHe
X-Received: by 2002:ae9:e515:: with SMTP id w21-v6mr1436110qkf.105.1540474854862;
        Thu, 25 Oct 2018 06:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540474854; cv=none;
        d=google.com; s=arc-20160816;
        b=Y1ctpQ09b9GKB8iEvJqh1aHwWxH0f6TdMi207FxmZ5nNrVkiRZ9GsBSMDm2Hu8Ay2P
         fiF3y9vlKVq/9LqnQ3pZGyPaMbRnCL9C2P+aQzCjdtW1ns+X9BckHdLMSryVUrvyC9mF
         +yvtZFknoyq0ucGjMeNC63Pu6BrefiQDHz2U9oVutze5ElLecVapw1XpXhADKtxSm8qm
         mswD36FysxWS4ibBJtaJflBPcIBtwz58i5Pk5BCqpJZ1jdDDyRDYT8dPm65ml2NqtFqV
         tA8PWfo1i3S14KeVxlgu/OCuEIfEfakoYKTwQo78q2qamW3Nen4r2qEJt/uaEkC5toXr
         nirw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=OMhIhCY8vmoX1mmdYqX89wb6n6pFG+Y3+lJmfYvSafk=;
        b=xnjvPJ8cWeLDAnXFIQN9807NqMTGn6Rq6MYAjp3m73LiovRbGUy3odf00moc5+LFVG
         8M8GNXO/LCi5kZw87SbLmdVVtSiY6H4WUfc0b8n9yLbxI2eLSQGV5DKGrk7FtFtzfv8i
         2CGvkjwwnQv40Bmamm25Ku1qWcu1Ca52r3OYIWjl3d09CgdDVtF+lLxqP3A8JJW5jwhR
         J8hWniQ+cquA7x7bpxXJpjnVJ90NY125Z0HNJG5a8OJWS5RJOGXt5pKV4//No3FbdwWd
         6cQiv1HXjRRRthJPM74RDMcjqVOZ2RLYJeqyTOCyh7is/QAau09Pw1qY/y+yUMqgOQoI
         juog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y4-v6si5275215qke.85.2018.10.25.06.40.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:40:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54512 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFfsc-0007Hg-A4
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:40:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfmj-00026L-NU
	for qemu-devel@nongnu.org; Thu, 25 Oct 2018 09:34:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfmI-0007cu-HX
	for qemu-devel@nongnu.org; Thu, 25 Oct 2018 09:34:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48092)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfmD-0007W8-OI; Thu, 25 Oct 2018 09:34:18 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04C17308FF23;
	Thu, 25 Oct 2018 13:34:16 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B4DC7604A2;
	Thu, 25 Oct 2018 13:34:09 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:27 -0300
Message-Id: <20181025133301.16578-10-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 25 Oct 2018 13:34:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 09/43] hw/pci-host/bonito: Use
 DeviceState::realize rather than SysBusDevice::init
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, Alexander Graf <agraf@suse.de>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8ixThKPhCIEY

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Move from the legacy SysBusDevice::init method to using DeviceState::real=
ize.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20181002212522.23303-7-f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/pci-host/bonito.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 9868e2eccc..9f33582706 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -595,7 +595,7 @@ static const VMStateDescription vmstate_bonito =3D {
     }
 };
=20
-static int bonito_pcihost_initfn(SysBusDevice *dev)
+static void bonito_pcihost_realize(DeviceState *dev, Error **errp)
 {
     PCIHostState *phb =3D PCI_HOST_BRIDGE(dev);
=20
@@ -603,8 +603,6 @@ static int bonito_pcihost_initfn(SysBusDevice *dev)
                                      pci_bonito_set_irq, pci_bonito_map_=
irq,
                                      dev, get_system_memory(), get_syste=
m_io(),
                                      0x28, 32, TYPE_PCI_BUS);
-
-    return 0;
 }
=20
 static void bonito_realize(PCIDevice *dev, Error **errp)
@@ -684,7 +682,6 @@ PCIBus *bonito_init(qemu_irq *pic)
     pcihost->pic =3D pic;
     qdev_init_nofail(dev);
=20
-    /* set the pcihost pointer before bonito_initfn is called */
     d =3D pci_create(phb->bus, PCI_DEVFN(0, 0), TYPE_PCI_BONITO);
     s =3D PCI_BONITO(d);
     s->pcihost =3D pcihost;
@@ -726,9 +723,9 @@ static const TypeInfo bonito_info =3D {
=20
 static void bonito_pcihost_class_init(ObjectClass *klass, void *data)
 {
-    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
-    k->init =3D bonito_pcihost_initfn;
+    dc->realize =3D bonito_pcihost_realize;
 }
=20
 static const TypeInfo bonito_pcihost_info =3D {
--=20
2.18.0.rc1.1.g3f1ff2140

