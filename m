Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2834036wrt;
        Thu, 18 Oct 2018 13:34:19 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60WSr1hSkJcDtnrDNawOuDKVsWcbup6ox/igBH9X5gyzSQPsEzzfXQHNeKQ4ClWP9TA1sfj
X-Received: by 2002:ac8:518b:: with SMTP id c11-v6mr12158101qtn.347.1539894859809;
        Thu, 18 Oct 2018 13:34:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539894859; cv=none;
        d=google.com; s=arc-20160816;
        b=t3D2BwxjrNadWEVFzgjVXV5+T97C1g2gjPkSWjQ4xyfdaQNuQ6/VSe31co2sG474Cy
         nyD4X2f+BKO+EO0W7+DxbxlAc22GcSHrHt7W1Q74ZD5rHA5Ffc0525q4FUqi5CsEDcVI
         3GYrI9D4jxvaSc3gV27UKhpyaxrhTYhbdWVoS0J2Jwn6mUJjQArwVCQS4js5fGeoKzKA
         JnEIaqLsl6PT9olvogYuU64Tz6mrxWSr4YFxoBiD9islsk3Un50phh7FF0OjpMm9kdlG
         EoYinBicvUovRy6bQ5DProgblfgyCyQEdLGPMgy1+w8IQ16DMA3VLKoeP2gEYcQe4x87
         a0dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=UAWcBCVrSjfcRmzTt/vNy5OLMMjvf1cfN8wv4ZPq+eM=;
        b=v8vHwK0zuCHrfWcVdKbBzd+13DL3z5mc1dOiRI3A9y8h1lQCvi0VQXM6HmjdS0uWdA
         kxy5nqD+mvMMw0ADdVlgo7l29nn3160OcuqeMzZ5YlxN0Gy6D4HY54w1wrBLNx9ZZiLn
         wZx/lIotcMcHWlAKaN0UamZxDOKXBB+5APXgc9CXRPhIogY+JyFabva8JixsVWLkjO3V
         lD6PY138FUBdkuVBTm0n3iSSNjNWiee482h+nikloS7UPqBdPjzZSiGFOAjlDnbMkCt/
         zSkT6W6f6wjoZeTY26NGnDMQgO1Amon+4O7t1BvkxwQSCI2q1y75kbJsl0lxX0WGLdV+
         eW6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c4si4527958qvr.169.2018.10.18.13.34.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:34:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEzr-0000OF-91
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:34:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEbb-0003LW-07
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:09:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEbT-0003aG-1n
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:09:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43888)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEbQ-0003UA-Uz; Thu, 18 Oct 2018 16:09:05 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 082453082141;
	Thu, 18 Oct 2018 20:09:04 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 688B9790B0;
	Thu, 18 Oct 2018 20:09:03 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:04:12 -0300
Message-Id: <20181018200422.4358-36-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 18 Oct 2018 20:09:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 35/45] net: etraxfs_eth: add a reset method
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
X-TUID: U/GiSKzj0vBG

From: C=C3=A9dric Le Goater <clg@kaod.org>

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20181001063803.22330-3-clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/net/etraxfs_eth.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/hw/net/etraxfs_eth.c b/hw/net/etraxfs_eth.c
index 64ab3df1ae..36855804db 100644
--- a/hw/net/etraxfs_eth.c
+++ b/hw/net/etraxfs_eth.c
@@ -127,7 +127,7 @@ tdk_write(struct qemu_phy *phy, unsigned int req, uns=
igned int data)
 }
=20
 static void
-tdk_init(struct qemu_phy *phy)
+tdk_reset(struct qemu_phy *phy)
 {
     phy->regs[0] =3D 0x3100;
     /* PHY Id.  */
@@ -136,9 +136,6 @@ tdk_init(struct qemu_phy *phy)
     /* Autonegotiation advertisement reg.  */
     phy->regs[4] =3D 0x01E1;
     phy->link =3D 1;
-
-    phy->read =3D tdk_read;
-    phy->write =3D tdk_write;
 }
=20
 struct qemu_mdio
@@ -585,6 +582,27 @@ static NetClientInfo net_etraxfs_info =3D {
     .link_status_changed =3D eth_set_link,
 };
=20
+static void etraxfs_eth_reset(DeviceState *dev)
+{
+    ETRAXFSEthState *s =3D ETRAX_FS_ETH(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+    memset(s->macaddr, 0, sizeof(s->macaddr));
+    s->duplex_mismatch =3D 0;
+
+    s->mdio_bus.mdc =3D 0;
+    s->mdio_bus.mdio =3D 0;
+    s->mdio_bus.state =3D 0;
+    s->mdio_bus.drive =3D 0;
+    s->mdio_bus.cnt =3D 0;
+    s->mdio_bus.addr =3D 0;
+    s->mdio_bus.opc =3D 0;
+    s->mdio_bus.req =3D 0;
+    s->mdio_bus.data =3D 0;
+
+    tdk_reset(&s->phy);
+}
+
 static void etraxfs_eth_realize(DeviceState *dev, Error **errp)
 {
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
@@ -609,8 +627,8 @@ static void etraxfs_eth_realize(DeviceState *dev, Err=
or **errp)
                           object_get_typename(OBJECT(s)), dev->id, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
=20
-
-    tdk_init(&s->phy);
+    s->phy.read =3D tdk_read;
+    s->phy.write =3D tdk_write;
     mdio_attach(&s->mdio_bus, &s->phy, s->phyaddr);
 }
=20
@@ -627,6 +645,7 @@ static void etraxfs_eth_class_init(ObjectClass *klass=
, void *data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
     dc->realize =3D etraxfs_eth_realize;
+    dc->reset =3D etraxfs_eth_reset;
     dc->props =3D etraxfs_eth_properties;
     /* Reason: pointer properties "dma_out", "dma_in" */
     dc->user_creatable =3D false;
--=20
2.18.0.rc1.1.g3f1ff2140

