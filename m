Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2802467wrt;
        Thu, 18 Oct 2018 13:06:25 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62d1G82uCyhuO0Gx2oyxn/xehXvYSvnzgEWU+ORpag68KsZTNxRdgHp0OpT5LtKnexBDUJ5
X-Received: by 2002:a37:b101:: with SMTP id a1-v6mr29878199qkf.222.1539893185167;
        Thu, 18 Oct 2018 13:06:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539893185; cv=none;
        d=google.com; s=arc-20160816;
        b=mhJQBXw8ebsdkqOmx6us/LLkybi8O+hKA819maokEUpw/Qf2nBte9GIW8I5000Im6S
         aMYy2BRP+Cnqt7njtzCr7fyENaEJfshwdJ+IhfH4p4ldshfMa07+f6RGMFmk1Z+euqm6
         VyoXW7il8z3+DS221ogRyWvbgFM+J54RkjNAh03x24KOnl6l7xY/PLuGC+a5R7YBOFQK
         tctyTlvcespzguR1Z0g8iM4ofhaVj6w52SvEa5woR2m8SZlWJkY/juag2dqpH+xhXrKB
         4N++AcSfRrcrfP6UJaGGZr20BoDgoM4MEBlUssf7GCIYuOnvONFpX4Xet+SkZOcVdIg/
         9pdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=I9nKnkCGE9FNPzgHKitMkrYh6r6m4r4LkTzDi8kivS4=;
        b=OGmWdQnVB+mTXvxtZ0lQfWqjnOyqXH15EkasnzK+b9RGB9EX37BkQI3Oj7Dg3nZVe+
         7aYP2xDSOQE5xcnrjeqFYD5Io8Rel9H9PTY1fEXU7ThQPBVExfMy2P5y0xxJ01ST7CcM
         W7pYcjB4KX5MHRTXUVBcBBbx63fWM+D5eUp5Yfzmobr+/kf9ailwXVXMGBvAzsnri5tT
         kaO+qkAA3fKMiV2h1zu2MwZ1Y8gkVH5CWU8UHi38AtE4NhO5Gwc41fWcpDGQvKK1ihss
         x1dIRmf9rb4G+ydogBqweQEMMq9ISv/zpm7UeQ/GlTdYZV165raTWqOJZL62VNHfiF4T
         vauA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q82-v6si1880065qkq.116.2018.10.18.13.06.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:06:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44268 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEYq-00008x-G5
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:06:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEYA-0008BP-Dj
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:05:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEY7-000839-2T
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:05:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43948)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEY2-0007ma-Jg; Thu, 18 Oct 2018 16:05:35 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4EE4680F6C;
	Thu, 18 Oct 2018 20:05:18 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BAB4A5D75C;
	Thu, 18 Oct 2018 20:05:17 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:03:45 -0300
Message-Id: <20181018200422.4358-9-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 18 Oct 2018 20:05:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 08/45] hw/ssi/xilinx_spi: Use DeviceState::realize
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
X-TUID: SIlXQ5sngYHG

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

