Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp713987wro;
        Thu, 25 Oct 2018 06:36:05 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fuLnTY1NMFVbgzBO5xFjRJaFsy5KOPKznCsk1Q0BkNNz9LSfBDnJo5KFZD3aCTnMDD908M
X-Received: by 2002:a37:e30f:: with SMTP id y15-v6mr1403927qki.253.1540474565134;
        Thu, 25 Oct 2018 06:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540474565; cv=none;
        d=google.com; s=arc-20160816;
        b=09Q+7tIakOkPo7P+cNKMP8ZGxtZjsQt1MtUdlyuZQTq8HiciVQgSIBgFcVXn5YFVsM
         aZBuN/efi9Xl5Iq+Iasazj+zxbwxSnqIek3zijs84Yki9U1hNEuZWIPi58hOjb2AbhWP
         pqcNCGqlng9JZrVMOlYgTcuF8vZJBUKCQwp7NQP+tD/MtITT7q1gTddP2LN7HtF2921s
         XqeVLbRWyGrRJbsSrkOPq2P1lb856F01tJOn5GgM2DcjcjvuhJDIb+BDasJNgX7+W7/q
         mDb4JfFgo8l9e5AOH3XKkZSIyDK/+Yqc+hrI9i9IwgD6sUC3JRUOgraG1Chcx2tC6rHh
         rqOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=I9nKnkCGE9FNPzgHKitMkrYh6r6m4r4LkTzDi8kivS4=;
        b=RubQiavtVGp5qKfPI+gS9Li/R5wKMmh6rpFAc+41e8n9HKhMgma3UUWOetc/nlYQCR
         /w39C5+DAMYFUHaMv+VUBLv1OUUKMxo2dG0uKj6eDHsECr3otvvW+a4KDMCAauk2fMQI
         OXAbsINIKbm5f5uoiTwItcnjn93nJ435dKt0lHjxf4vCVKKn/o7TguoO/QNRyJ1VzYsa
         hXNCLi+2s16zKmLdElsjz1NLaVfbbK4SJTkVC/DpaJItTCvx9uhBMcxor6GcATQE3cXl
         Pai8mVnQ4cYwjgpAZ3lVJjRE3YtHWw+zO776G+W1kocwTB6eNzYZjjcqVaBQvKo1R5Ft
         ihyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f60-v6si6408145qtd.93.2018.10.25.06.36.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:36:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54487 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFfnw-00032i-8V
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:36:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfmr-00029S-5N
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:34:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFflw-0007H7-8L
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:34:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:15122)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFflw-0007FV-0C; Thu, 25 Oct 2018 09:34:00 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E0CD14E4C6;
	Thu, 25 Oct 2018 13:33:58 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 900965D9C8;
	Thu, 25 Oct 2018 13:33:54 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:25 -0300
Message-Id: <20181025133301.16578-8-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 25 Oct 2018 13:33:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 07/43] hw/ssi/xilinx_spi: Use
 DeviceState::realize rather than SysBusDevice::init
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
X-TUID: PE+2vLchCjK8

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Move from the legacy SysBusDevice::init method to using DeviceState::real=
ize.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20181002212522.23303-5-f4bug@amsat.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/ssi/xilinx_spi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
index 83585bc8b2..3dae303d5b 100644
--- a/hw/ssi/xilinx_spi.c
+++ b/hw/ssi/xilinx_spi.c
@@ -319,9 +319,9 @@ static const MemoryRegionOps spi_ops =3D {
     }
 };
=20
-static int xilinx_spi_init(SysBusDevice *sbd)
+static void xilinx_spi_realize(DeviceState *dev, Error **errp)
 {
-    DeviceState *dev =3D DEVICE(sbd);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
     XilinxSPI *s =3D XILINX_SPI(dev);
     int i;
=20
@@ -344,8 +344,6 @@ static int xilinx_spi_init(SysBusDevice *sbd)
=20
     fifo8_create(&s->tx_fifo, FIFO_CAPACITY);
     fifo8_create(&s->rx_fifo, FIFO_CAPACITY);
-
-    return 0;
 }
=20
 static const VMStateDescription vmstate_xilinx_spi =3D {
@@ -368,9 +366,8 @@ static Property xilinx_spi_properties[] =3D {
 static void xilinx_spi_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
-    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
=20
-    k->init =3D xilinx_spi_init;
+    dc->realize =3D xilinx_spi_realize;
     dc->reset =3D xlx_spi_reset;
     dc->props =3D xilinx_spi_properties;
     dc->vmsd =3D &vmstate_xilinx_spi;
--=20
2.18.0.rc1.1.g3f1ff2140

