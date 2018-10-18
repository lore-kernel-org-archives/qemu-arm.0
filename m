Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2835041wrt;
        Thu, 18 Oct 2018 13:35:17 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62+MI4TejNGF7zy71uvDcQUyazufi+c21h8N1cm7QyT6PTGNL9ii1iimQVU4M5CjrxQs93j
X-Received: by 2002:ae9:f118:: with SMTP id k24-v6mr176907qkg.171.1539894917409;
        Thu, 18 Oct 2018 13:35:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539894917; cv=none;
        d=google.com; s=arc-20160816;
        b=OX1+NMy5LPt26j97gINY39Metw1L1JffC+aa3AE8qxSPy5OWEnleb22i/js0BjS0p6
         Zty0Lp3DXtXwJBPGoIZ+47MWYVCMYSv/7QYISztA0Yvxb3J169McsPZbIApb23b0jH/3
         w7jmmE/gONEEbSt/Blwj940qWNlJFHr2p3Ut/ntimLBF4rtFoiI08LfOuCULUNailJ3L
         lMIde77gIPKDbGs7K/mh79RuvhydGXM7omLxEkecWVVT2zZQqCck0LLTmxyx+Az/bRxh
         qDC20YL92I+7FOILs07Z08k0p17PFqRuzb4UNuADOuf85hxWbywqmQHbuX/jO4wiCo0q
         Nsyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=csGigEh0vTOWaiTx8EScCGPoXUmYZEWRe2W+eq3Gnwk=;
        b=KGL6x6QQY+5wQwWKkqlsApyNw9mq1Nx9dRzZze3GIZ7DdjQnxzdanTkT2TI1G4Oys2
         mk1DBAcpI8EC1383sNn+QruzKjQhC4avNzUB4arGJOGwYrhrUfUNTRh8rc6SKHXPAEtS
         vplIGyAn62nFqh6B4qhjIoFD1/FAdM8Cd+CT8tQR450Jvq3R0DpDZCjN9z7f2YsBUzOT
         AlLU5fLoLkw3LLTo3ZXayUtesOFyaIoOxsLVuLT3FVCTSA5D4lohEmzZdvDERC3cCtKY
         6TGksmdbrQU6JnMJ7IdNWVai5Etgw1svRF3nj/krlY3d/AbVqIAt/h7q6Rae1+V4IUcF
         7Fxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h33si3528513qvc.203.2018.10.18.13.35.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:35:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44474 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDF0m-00012u-Se
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:35:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEc6-0003oV-PV
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:09:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEc2-0004PP-9Z
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:09:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44096)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEc0-0004NI-6E; Thu, 18 Oct 2018 16:09:42 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 49B3D308212C;
	Thu, 18 Oct 2018 20:09:39 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D95519940;
	Thu, 18 Oct 2018 20:09:34 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:04:17 -0300
Message-Id: <20181018200422.4358-41-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 18 Oct 2018 20:09:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 40/45] net: opencores_eth: convert SysBus init
 method to a realize method
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
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A2GYdRoGiQqI

From: C=C3=A9dric Le Goater <clg@kaod.org>

Cc: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20181001063803.22330-8-clg@kaod.org>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/net/opencores_eth.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/net/opencores_eth.c b/hw/net/opencores_eth.c
index d42b79c08c..d6f54f8d82 100644
--- a/hw/net/opencores_eth.c
+++ b/hw/net/opencores_eth.c
@@ -715,9 +715,9 @@ static const MemoryRegionOps open_eth_desc_ops =3D {
     .write =3D open_eth_desc_write,
 };
=20
-static int sysbus_open_eth_init(SysBusDevice *sbd)
+static void sysbus_open_eth_realize(DeviceState *dev, Error **errp)
 {
-    DeviceState *dev =3D DEVICE(sbd);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
     OpenEthState *s =3D OPEN_ETH(dev);
=20
     memory_region_init_io(&s->reg_io, OBJECT(dev), &open_eth_reg_ops, s,
@@ -732,7 +732,6 @@ static int sysbus_open_eth_init(SysBusDevice *sbd)
=20
     s->nic =3D qemu_new_nic(&net_open_eth_info, &s->conf,
                           object_get_typename(OBJECT(s)), dev->id, s);
-    return 0;
 }
=20
 static void qdev_open_eth_reset(DeviceState *dev)
@@ -750,9 +749,8 @@ static Property open_eth_properties[] =3D {
 static void open_eth_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
-    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
=20
-    k->init =3D sysbus_open_eth_init;
+    dc->realize =3D sysbus_open_eth_realize;
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
     dc->desc =3D "Opencores 10/100 Mbit Ethernet";
     dc->reset =3D qdev_open_eth_reset;
--=20
2.18.0.rc1.1.g3f1ff2140

