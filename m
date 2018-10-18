Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2810869wrt;
        Thu, 18 Oct 2018 13:13:19 -0700 (PDT)
X-Google-Smtp-Source: ACcGV623kqvnciztCyYKEUvI29L8w8fPOGQvvuqgyd+ccCZ2Mg+dwmf5rD6/Z8/+LAtsLqrhG1SE
X-Received: by 2002:a0c:9946:: with SMTP id i6mr27218729qvd.71.1539893599820;
        Thu, 18 Oct 2018 13:13:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539893599; cv=none;
        d=google.com; s=arc-20160816;
        b=NKsowWOqttmc9m7zQirUjZ3MMkOJ+XVe//C5xmqwFlBLeg/fVkJSyjoTCsHrN8ncef
         c8wxZr/XBz7LWlyY5sOBFW97zQE5dD0jWXql2CRn1Cvgg9oMoYwKkMyBCNb8jFh+FulL
         LkT7VvtqQ3dNDlK66Gw7aIQP3bt/k0r05Xk30uecLDgys++RPyiRh5wbWXnOSKVDKgc/
         LBAPfU9mi+/cRHVI5r4/ToLGV3uXWAzGuWBjfbdxz4XBOWpL7RbQ1RvMqhomW5m3Uq0R
         BORrXXRJ/Z0nhP3Mx6gf9MNIh5daA8eZBs284DcHk+KtCEX7NO4L/+gS4jRgaTeiqejs
         J5HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=PUSHmlOswUnxlGdNxeZrGVTOr6382rAQcWwzoPIyJUg=;
        b=lLxF3xaJaR7x1F8cpEKxKIYfjawmdcTqJdc0JeHWIiBQzJcBSzK0DtTY4Hak0eGXih
         7kSF/22BvaE3j40d6qaVJ4SrnWdeFSxl+yLIfeT/CACTBNsRSDKNyLQAAVe5GYe7Fp6g
         4lGHKEZB7MRxee2We39dKvXlTNWtb7iDUIQAyLn84kDi3SzCnarj3iYtg5dhMefWzJRR
         2oikjxdJZiSVb4RuY19MbCdgjgQYB6LoYxc/CN3y6kQDs1FY4TYE/68CoKHvLLvJ4Zvg
         2a1BPdU2QlWSlIqBMDHFtJXQ6vPD1inEBTd57UHI+89jEcOhbt1KV6cJSshBdE4jzlWO
         oUyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b23si4144714qvh.103.2018.10.18.13.13.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:13:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44309 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEfX-000629-7d
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:13:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38889)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEYC-0008E1-ID
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:05:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEYB-0008DN-J0
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:05:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56460)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEY7-0007qZ-51; Thu, 18 Oct 2018 16:05:39 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 31D8FC0587CE;
	Thu, 18 Oct 2018 20:05:26 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F078A1974F;
	Thu, 18 Oct 2018 20:05:19 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:03:46 -0300
Message-Id: <20181018200422.4358-10-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 18 Oct 2018 20:05:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 09/45] hw/sh4/sh_pci: Use DeviceState::realize
 rather than SysBusDevice::init
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
X-TUID: LWETLKz6VhOF

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Move from the legacy SysBusDevice::init method to using DeviceState::real=
ize.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20181002212522.23303-6-f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/sh4/sh_pci.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/hw/sh4/sh_pci.c b/hw/sh4/sh_pci.c
index 4ec2e35500..379d0685ed 100644
--- a/hw/sh4/sh_pci.c
+++ b/hw/sh4/sh_pci.c
@@ -120,16 +120,15 @@ static void sh_pci_set_irq(void *opaque, int irq_nu=
m, int level)
     qemu_set_irq(pic[irq_num], level);
 }
=20
-static int sh_pci_device_init(SysBusDevice *dev)
+static void sh_pci_device_realize(DeviceState *dev, Error **errp)
 {
-    PCIHostState *phb;
-    SHPCIState *s;
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
+    SHPCIState *s =3D SH_PCI_HOST_BRIDGE(dev);
+    PCIHostState *phb =3D PCI_HOST_BRIDGE(s);
     int i;
=20
-    s =3D SH_PCI_HOST_BRIDGE(dev);
-    phb =3D PCI_HOST_BRIDGE(s);
     for (i =3D 0; i < 4; i++) {
-        sysbus_init_irq(dev, &s->irq[i]);
+        sysbus_init_irq(sbd, &s->irq[i]);
     }
     phb->bus =3D pci_register_root_bus(DEVICE(dev), "pci",
                                      sh_pci_set_irq, sh_pci_map_irq,
@@ -143,13 +142,12 @@ static int sh_pci_device_init(SysBusDevice *dev)
                              &s->memconfig_p4, 0, 0x224);
     memory_region_init_alias(&s->isa, OBJECT(s), "sh_pci.isa",
                              get_system_io(), 0, 0x40000);
-    sysbus_init_mmio(dev, &s->memconfig_p4);
-    sysbus_init_mmio(dev, &s->memconfig_a7);
+    sysbus_init_mmio(sbd, &s->memconfig_p4);
+    sysbus_init_mmio(sbd, &s->memconfig_a7);
     s->iobr =3D 0xfe240000;
     memory_region_add_subregion(get_system_memory(), s->iobr, &s->isa);
=20
     s->dev =3D pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "sh_pci_host=
");
-    return 0;
 }
=20
 static void sh_pci_host_realize(PCIDevice *d, Error **errp)
@@ -187,9 +185,9 @@ static const TypeInfo sh_pci_host_info =3D {
=20
 static void sh_pci_device_class_init(ObjectClass *klass, void *data)
 {
-    SysBusDeviceClass *sdc =3D SYS_BUS_DEVICE_CLASS(klass);
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
-    sdc->init =3D sh_pci_device_init;
+    dc->realize =3D sh_pci_device_realize;
 }
=20
 static const TypeInfo sh_pci_device_info =3D {
--=20
2.18.0.rc1.1.g3f1ff2140

