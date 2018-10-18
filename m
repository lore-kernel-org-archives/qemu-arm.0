Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2849475wrt;
        Thu, 18 Oct 2018 13:49:32 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60tfflief1xXxV5txTKGODGWROOo4Q0MaU5syY7yUdNkPTQMXtBM9vLpSVDfMHHJuZg+JKL
X-Received: by 2002:a0c:a425:: with SMTP id w34mr15638911qvw.160.1539895772585;
        Thu, 18 Oct 2018 13:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539895772; cv=none;
        d=google.com; s=arc-20160816;
        b=XciEgzXNJL07/1soVBKlN0en2QvJxX91FxVi2GOrfjWd8pBT63AYgei9ToZjHvMCoF
         ofM1oATLc+zFyZXqVEtPZAwfirSZeJZevzPKD8AIG2aSrOCDExQsa+ZozXzKe3nJ1Nj8
         myFKdI55v6dqTJkXlSjdVNnH7ltynA5ngXQoNxK319F9qkpUOyDo5EEnxuQblnnc8mwh
         JH3rVgbCoxqWQkx66R9jhk2Sh3xmHmNqB4zeQM0WfGdw9CK6i76JG3JkuLBDzI9gkEBT
         Ooh1++J/9YpVe7T3jwykmhjVI+1AoaaSG2d9himPcgzfK6ENcsAsrRFqzzoJs4T/nq9x
         Te+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Sa6M/OD4ybF5EyTmefneKoMk1E/62aJl7O2ViJ8IYPg=;
        b=O9DLac0VSu/8jX9b+EO7w4hNiUupv0JEGU/7RUuwSCV/Qrxg3+ZbHvu8AvBemclvvy
         TKulV15Texe+cxScMk4duPakrHmBsuMgvNkSVF8IjlTUXiIG/MJIT46To//tAWLh1VUO
         PYeQLT9I57ZbgsTI4voigNBmMvairf+JE9aZJ3zMFtjDmEDWCqFRoVsvNAMeWgYBKZHt
         0V8B81vTPzZ7Oc12WUUeA2vlvwzdiAx/vo3ryQqH5lwmrDljQ+TK+tH4+sz3nu3/Hn9i
         uh74V4aimbCcIMrW5kuqR88LT0WbXZ6ARY66BPcFWBfBAbl7N7HpkB5pEe9GyqH4wdCv
         MIXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j20-v6si1954602qkh.104.2018.10.18.13.49.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:49:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44584 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDFEa-00055E-0b
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:49:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEbn-0003Ti-Ae
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:09:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEbl-00040u-F6
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:09:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42620)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEbk-0003ov-R3; Thu, 18 Oct 2018 16:09:25 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 11CCE85A07;
	Thu, 18 Oct 2018 20:09:19 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2A52319489;
	Thu, 18 Oct 2018 20:09:13 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:04:14 -0300
Message-Id: <20181018200422.4358-38-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 18 Oct 2018 20:09:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 37/45] net: lance: convert SysBus init method to a
 realize method
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
X-TUID: NwV+ffwsQfmj

From: C=C3=A9dric Le Goater <clg@kaod.org>

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20181001063803.22330-5-clg@kaod.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/net/lance.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/net/lance.c b/hw/net/lance.c
index a08d5ac6a8..f987b2fd18 100644
--- a/hw/net/lance.c
+++ b/hw/net/lance.c
@@ -97,9 +97,9 @@ static const VMStateDescription vmstate_lance =3D {
     }
 };
=20
-static int lance_init(SysBusDevice *sbd)
+static void lance_realize(DeviceState *dev, Error **errp)
 {
-    DeviceState *dev =3D DEVICE(sbd);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
     SysBusPCNetState *d =3D SYSBUS_PCNET(dev);
     PCNetState *s =3D &d->state;
=20
@@ -115,7 +115,6 @@ static int lance_init(SysBusDevice *sbd)
     s->phys_mem_read =3D ledma_memory_read;
     s->phys_mem_write =3D ledma_memory_write;
     pcnet_common_init(dev, s, &net_lance_info);
-    return 0;
 }
=20
 static void lance_reset(DeviceState *dev)
@@ -144,9 +143,8 @@ static Property lance_properties[] =3D {
 static void lance_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
-    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
=20
-    k->init =3D lance_init;
+    dc->realize =3D lance_realize;
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
     dc->fw_name =3D "ethernet";
     dc->reset =3D lance_reset;
--=20
2.18.0.rc1.1.g3f1ff2140

