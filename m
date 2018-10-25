Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp713735wro;
        Thu, 25 Oct 2018 06:35:50 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eARhmdz/xowYnNo0cAsqhlYLhFmLWuIEklaBL0/W7vuJslDTLcumuwDYNZeYHmqFdWu8IO
X-Received: by 2002:a0c:872a:: with SMTP id 39mr779825qvh.1.1540474550017;
        Thu, 25 Oct 2018 06:35:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540474550; cv=none;
        d=google.com; s=arc-20160816;
        b=J0jxb56362EEjJw3WGA3v4/ocmO+HShQTq9oJ6mL+A/UcnX+vHwh9oOfIHElhWrjmD
         dYw7sLOeR0pEfQhZmjO/xmZn63CagqKNRpOCB5HcAaEXc6Ksxqu+cNgfUztGeO62KXT3
         iMr9DD2Gvw8nUv/1d8L8sMERFmKgwFRCZyT3Ia+SczwA0STm/Wv527EIuwr+P3JIljQS
         FUy4kz6ncZNfu4GpmrU1pj4CQ/TAb86P7mRYxejIaqwSHzlRxal7Aq/9XTz0s8qpij18
         WTrNZ01ddFYAD69f35mdjVq8ayr/FCgnycC4S7D4+DcLNnqmjDUWtW0ZjTOn7adHTcU/
         rudA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=PUSHmlOswUnxlGdNxeZrGVTOr6382rAQcWwzoPIyJUg=;
        b=ws63F62yzDodljzTABj+Y157uTWIWEefnJRTnaVjxakli60QbfbaxrS4qgSflbgrQy
         enaHaQrYqlTRmkmC9UEZqvKnfCFo/TGBy161+k31g9r2pKZ8Vb29f4/xB85CpSpt6mHK
         qWB2iMvRzZ31B6U7uSeSCrz3LVGuLZRTnlVrzCB7thQT0RZjEY1SJamhSRuULlk6V1Js
         fS25a6M5CSzd7DOaopXQua7HQqGNF3u5kSxNHxBmaqPirRZoLJBn5D7vOI/HLV4r92yz
         Fe26YWDEVwNeDRVf18/mHJPcDw8T7PlUuucOXAcRF19rNeK/45/9yg7HAh+7mFls5CvW
         rxsw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q36si1209014qvq.96.2018.10.25.06.35.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:35:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54482 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFfng-0002nh-SV
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:35:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfmp-000259-5n
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:34:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfm5-0007SX-0f
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:34:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46402)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfm4-0007Rf-Le; Thu, 25 Oct 2018 09:34:08 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5FD93308429D;
	Thu, 25 Oct 2018 13:34:07 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BC5E55C21B;
	Thu, 25 Oct 2018 13:34:00 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:26 -0300
Message-Id: <20181025133301.16578-9-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 25 Oct 2018 13:34:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 08/43] hw/sh4/sh_pci: Use DeviceState::realize
 rather than SysBusDevice::init
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>, Rob Herring <robh@kernel.org>,
	Alexander Graf <agraf@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: emG/ZX6cZrI3

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

