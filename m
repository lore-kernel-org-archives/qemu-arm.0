Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2813434wrt;
        Thu, 18 Oct 2018 13:15:32 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63ITbbXmjrkvrliNmP8K34FKoXaXU1iXujbKpUwRc6JZGZJsILqYlx+NoYq5PRWmqRHgjY6
X-Received: by 2002:a37:244c:: with SMTP id w73-v6mr2189848qkg.31.1539893731950;
        Thu, 18 Oct 2018 13:15:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539893731; cv=none;
        d=google.com; s=arc-20160816;
        b=F1R0a9UQEdSgJUjUihD4fdKklYUy5iFe5isrQGfUgW8VfBXLEFsismic19okdp3Ek7
         jhiDwS9QjifmWjZBim1P3XvDHUkMQ3W3g3CUltngsdIvIxvAdlGNrpX1UkpBFG1B8eH1
         iD18kg7kflM4PehbjvZotFgobjRRYbRqkjO9yHkj/mXto0HwxGqH72oFweLJ/PnC5PYk
         fWkYG9rzkyXQddwlbwWIOBvV4eZsUkBZE0x6PvcmH7LoYL1Vi7PhJKKDRM+xcSFIh9M7
         2criuTavs7DH552u8W1j3xfzOq4uPoblzqBCWi6fn8FifMyyfPQ0IKYCagwj9RWkrYU7
         CcSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=zFW/wzB5KbB9uqGoUZY2mDouyH9lB/LspIwiAY0t+AI=;
        b=WLuHYdx8PZJRLWK0bID6zgR/5OwmN4W9C60nsqGhEvL9t5+kmZhDtaQR89hkmfEC4L
         mRoaaAu5ZcALioxqS+uJxZYCWmuJhiMGQs3QpRWcK6Wrfa96Ngl2BoRcept1cdXH2qKT
         F315O104kSOopM8gAfvtOmaDpypwV8VTIvj+1EBYrg0M4shf4Ahqo5hFu10/7AdccAwE
         wXZpH2kcml6MDdbpZnYJHGntTW/mVJ8pdvRJ5HLvkNv/DWeNPKcE8603s8SxcOk5EPup
         0o+4qpuCgr2CptWLmAZSjxoR0UZpgzHsnCUuEUA8nqrEi6Ya0Rh8kEK5AuVtj+F44gb8
         mMAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z141-v6si15306375qkb.38.2018.10.18.13.15.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:15:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44329 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEhf-0000gB-Dk
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:15:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEYM-0008Oj-Tx
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:05:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEYL-0000M0-VK
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:05:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37696)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEYL-0000FG-Lu; Thu, 18 Oct 2018 16:05:53 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4A96130012EE;
	Thu, 18 Oct 2018 20:05:52 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA1BE1974F;
	Thu, 18 Oct 2018 20:05:51 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:03:51 -0300
Message-Id: <20181018200422.4358-15-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 18 Oct 2018 20:05:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 14/45] hw/alpha/typhoon: Remove unuseful code
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
X-TUID: MZXQpIqXUADj

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20181002212522.23303-11-f4bug@amsat.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/alpha/typhoon.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index d74b5b55e1..8004afe45b 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -932,23 +932,10 @@ PCIBus *typhoon_init(ram_addr_t ram_size, ISABus **=
isa_bus,
     return b;
 }
=20
-static int typhoon_pcihost_init(SysBusDevice *dev)
-{
-    return 0;
-}
-
-static void typhoon_pcihost_class_init(ObjectClass *klass, void *data)
-{
-    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
-
-    k->init =3D typhoon_pcihost_init;
-}
-
 static const TypeInfo typhoon_pcihost_info =3D {
     .name          =3D TYPE_TYPHOON_PCI_HOST_BRIDGE,
     .parent        =3D TYPE_PCI_HOST_BRIDGE,
     .instance_size =3D sizeof(TyphoonState),
-    .class_init    =3D typhoon_pcihost_class_init,
 };
=20
 static void typhoon_iommu_memory_region_class_init(ObjectClass *klass,
--=20
2.18.0.rc1.1.g3f1ff2140

