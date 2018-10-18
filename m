Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2836047wrt;
        Thu, 18 Oct 2018 13:36:18 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63XXIMf2RXQlrBVJPMkQ0dUDq/9+CPjK9z9P1mvTej4ADF5hc8GfJ4kVmBFah1T2Q03+/u+
X-Received: by 2002:aed:3a82:: with SMTP id o2-v6mr30503498qte.240.1539894978236;
        Thu, 18 Oct 2018 13:36:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539894978; cv=none;
        d=google.com; s=arc-20160816;
        b=THSWAksA56AYr1W9X9v0j2+gJiAFE+EhdD9fcUqXY1UNEW1U4zYH1+SoF0Hn00InvQ
         Kbtfw+F2HeVj5C9EeBq7kd4TQyMiMTxBH+E5xHAREaQGrFx9cx8rm+EEU5cGtMcRfnbk
         gXupiu63+M3iCtVRmlbY8jJY8UftrbafGcxYk4xDXuXrGIfcWn7X1GjCCFDXXyi9ZBTe
         8KcJNf9FwoTnNDw9QUStfisMD+6RO07QSWP4OnOlVsbEOU+ewFC79KUiAgGiJCUG3M84
         /1w8d9Ar67x5G+jZjTxq1P2OUy/uMwXiZLeOzsYYZ2X2knKMMVNGntyNovTwuN9QjYxI
         n04A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=9/IzegdP1pUeKfNvjNNCF5ofCPnRVKMxs0Ek4PCqU5Q=;
        b=cSVzB9hAbUUOHwQv9WbgpL94GaKMj98XKAazg8i+dXgukO0Qsp5GhkyFf9oCLm8HJO
         a4phPFZP4EPFUY7ZWuY+KJOI9PT9sRsmoYrakCtRY8VPkZGhNZXrlFSWdEqHPNZAJ8yX
         T9HdCzzusRf1FyG4ztQfPlmu/dxdIWYk5OrdihDF3g+zivnvDmeOo0C5J40HSHQXrZsm
         uWKmJQVBQML6qpW64symaIgtqfpJVIyQnGE2ZhBcSCye86yQ9r+JwxyKOasyo4rDB0iF
         GzXFytoLbfJhEdBYUPkQLoOnDuYT6ZD0/ougHn0DKNz410AXjb0XScdV0fMQwEncK+SJ
         jyvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 13si6698988qvo.211.2018.10.18.13.36.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:36:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDF1l-0001qT-Kn
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:36:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEc0-0003hk-03
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:09:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEbu-0004AM-3I
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:09:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37224)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEbt-000491-RG; Thu, 18 Oct 2018 16:09:34 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDEBF30026C6;
	Thu, 18 Oct 2018 20:09:32 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 10934105704F;
	Thu, 18 Oct 2018 20:09:26 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:04:16 -0300
Message-Id: <20181018200422.4358-40-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 18 Oct 2018 20:09:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 39/45] net: mipsnet: convert SysBus init method to
 a realize method
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
X-TUID: 3OQFVzw/QLPr

From: C=C3=A9dric Le Goater <clg@kaod.org>

Cc: Aleksandar Markovic <amarkovic@wavecomp.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20181001063803.22330-7-clg@kaod.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/net/mipsnet.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/net/mipsnet.c b/hw/net/mipsnet.c
index 5a63df7ccb..03b3104278 100644
--- a/hw/net/mipsnet.c
+++ b/hw/net/mipsnet.c
@@ -236,9 +236,9 @@ static const MemoryRegionOps mipsnet_ioport_ops =3D {
     .impl.max_access_size =3D 4,
 };
=20
-static int mipsnet_sysbus_init(SysBusDevice *sbd)
+static void mipsnet_realize(DeviceState *dev, Error **errp)
 {
-    DeviceState *dev =3D DEVICE(sbd);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
     MIPSnetState *s =3D MIPS_NET(dev);
=20
     memory_region_init_io(&s->io, OBJECT(dev), &mipsnet_ioport_ops, s,
@@ -249,8 +249,6 @@ static int mipsnet_sysbus_init(SysBusDevice *sbd)
     s->nic =3D qemu_new_nic(&net_mipsnet_info, &s->conf,
                           object_get_typename(OBJECT(dev)), dev->id, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
-
-    return 0;
 }
=20
 static void mipsnet_sysbus_reset(DeviceState *dev)
@@ -267,9 +265,8 @@ static Property mipsnet_properties[] =3D {
 static void mipsnet_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
-    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
=20
-    k->init =3D mipsnet_sysbus_init;
+    dc->realize =3D mipsnet_realize;
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
     dc->desc =3D "MIPS Simulator network device";
     dc->reset =3D mipsnet_sysbus_reset;
--=20
2.18.0.rc1.1.g3f1ff2140

