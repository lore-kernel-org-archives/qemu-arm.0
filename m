Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2831345wrt;
        Thu, 18 Oct 2018 13:31:48 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61hukyQifUm0He+VEPvTKr1pgehLvmbi0nZ2w136Yqd29geJd9M5fgsa1iXWXcUk1KbCAin
X-Received: by 2002:a37:8984:: with SMTP id l126-v6mr29176300qkd.195.1539894708722;
        Thu, 18 Oct 2018 13:31:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539894708; cv=none;
        d=google.com; s=arc-20160816;
        b=j2BAHkSvRg0WQb1vPnKoJiT46SplBr+VPU/LA/tdltbPbTD6ZAQ61JjH+6jLSNr8P9
         3G9T54Loc9QvbWhl5A/ACT4ZJO+qGbmczjK8WHsfSd1xOpJV7IGLn9mmk4tS3LB1suq/
         G+320qBEoJdDFq0YrlI8P7HaHDMnUtlLqglPtrDmBIZhTyaOgIoH2LW+ZksSQxZd9nD0
         2bl/wRj1Qkr/uFGaTHbK/q13KqffDeAD2o5tFe/hvZi3BrNgTZOJ+BP+ql8veB9ujt0a
         R+AtqAomz9RlV1xqPn8BGgShB6TZ5Esfdm2rIoVkiXSfGBp7HFFMn0zNUhvBGV0ADhfz
         4SpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=7PYwjUBarUUUPKosorOe4Waae3jZuOZJ8jMfySpSZGQ=;
        b=NglkLKMWjfVY0+u2DtN/wU6AimxNYpvBU98Z/uSzKYK9RHpzI0v5tMxqi3MxuuOjGS
         r2d/+5h1kJ8/HfCBUcqB7oypd7+DVH6mZRmJ7IPz8CfEx/c8MS/BNdi/OJwHkK3o5KTk
         tqjm0vm9zGAPwQetKmebEdClL3KxaDePUleUKZHiPKv41zW6qgbrZbgkuo3mA8WeOJnr
         EMGg4CFl6nwMklCP4OQheo7XbXYfMyDuKxq6x/5fc+KR5yK8TL2oF/MajZRhHXm/Ljv2
         Ne03BJQOFlcbgZXdwLv/1T7rMOq15qj4ydkysthm5ACo5MBHN3kY2yQRlg8zsORD1SO8
         le4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g14-v6si537816qto.141.2018.10.18.13.31.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:31:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44456 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDExQ-0006Lj-3o
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:31:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEbP-0003Ar-UA
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:09:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEbP-0003QQ-2u
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:09:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41150)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEbO-0003Mf-Og; Thu, 18 Oct 2018 16:09:02 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9EF1A81DE1;
	Thu, 18 Oct 2018 20:09:01 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6301768B2A;
	Thu, 18 Oct 2018 20:08:56 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:04:11 -0300
Message-Id: <20181018200422.4358-35-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 18 Oct 2018 20:09:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 34/45] net: etraxfs_eth: convert SysBus init
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
X-TUID: +jC47uWK+oS/

From: C=C3=A9dric Le Goater <clg@kaod.org>

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20181001063803.22330-2-clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/net/etraxfs_eth.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/net/etraxfs_eth.c b/hw/net/etraxfs_eth.c
index a6932432b1..64ab3df1ae 100644
--- a/hw/net/etraxfs_eth.c
+++ b/hw/net/etraxfs_eth.c
@@ -23,6 +23,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "net/net.h"
 #include "hw/cris/etraxfs.h"
@@ -584,14 +585,14 @@ static NetClientInfo net_etraxfs_info =3D {
     .link_status_changed =3D eth_set_link,
 };
=20
-static int fs_eth_init(SysBusDevice *sbd)
+static void etraxfs_eth_realize(DeviceState *dev, Error **errp)
 {
-    DeviceState *dev =3D DEVICE(sbd);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
     ETRAXFSEthState *s =3D ETRAX_FS_ETH(dev);
=20
     if (!s->dma_out || !s->dma_in) {
-        error_report("Unconnected ETRAX-FS Ethernet MAC");
-        return -1;
+        error_setg(errp, "Unconnected ETRAX-FS Ethernet MAC");
+        return;
     }
=20
     s->dma_out->client.push =3D eth_tx_push;
@@ -611,7 +612,6 @@ static int fs_eth_init(SysBusDevice *sbd)
=20
     tdk_init(&s->phy);
     mdio_attach(&s->mdio_bus, &s->phy, s->phyaddr);
-    return 0;
 }
=20
 static Property etraxfs_eth_properties[] =3D {
@@ -625,9 +625,8 @@ static Property etraxfs_eth_properties[] =3D {
 static void etraxfs_eth_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
-    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
=20
-    k->init =3D fs_eth_init;
+    dc->realize =3D etraxfs_eth_realize;
     dc->props =3D etraxfs_eth_properties;
     /* Reason: pointer properties "dma_out", "dma_in" */
     dc->user_creatable =3D false;
--=20
2.18.0.rc1.1.g3f1ff2140

