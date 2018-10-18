Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2805605wrt;
        Thu, 18 Oct 2018 13:08:53 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60YaZnU9+BFJHIegKBZNE+miMzt5Wic046P8ov3Ez4a46VSNV9MILT26TMUgGnvpnSeTsXr
X-Received: by 2002:a37:2848:: with SMTP id o69-v6mr3314335qkh.275.1539893333133;
        Thu, 18 Oct 2018 13:08:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539893333; cv=none;
        d=google.com; s=arc-20160816;
        b=uGCvGM3cHPl8Vi3RJxhaTmJ5cXSlg8qV0QJBgbMfpT9dUQKq5RpV0Fpm/RY7LBUrM6
         4pPkgr0gohjaIviuA8/DyeQdC6s18VE9ND0pXz6NrzfpnWFfq56j9P04s5tMwZ7/9rkY
         9le6X5f4OgBkEi3RrryG0wDEGsC4tLR5R7eidzmtb/0Zzq6vhu8lrP29sJuvjn1DgddD
         2J/YtBG7X/f1ynydB4C4ItemTQo/SkYe/bAnOA5Ut5J7L00yurzcP8W9Qmc+0Y8G9wOb
         ylcTX5n08c26+SBm4w6IV4IzRVqKYM/ro9Oh8Ybh+DFJWfOctS9f8rjgVcLmSkn8aK3U
         8KrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=pHMaGyqq/l1f2Bel3mGx5xpGit6Wq4bbMRy2WnhgrTA=;
        b=wZoIV/qSXVJON6UMXJXf9htOJFFDocewPQDTiQcrS0kVUWjBOe3zCcu99PSWJin3K6
         oL1W55WUPeZ81YcQmSTWOKnFOB3+ZbCoP++Wrl5W1agXLfJmYuPJaFX6l8GZQmChjKhI
         4GQTKcL6hQUEwPoHA5tB3m5/rEglf5Hauqaa8pBb+gp7uCpn2z5B4xUWFvO9a/HTBY0s
         22pT0o8KTmnCvvWqNYiZY3DfzIMRT1749AtqTkEkcAH4pVwRILjj363z6bEVx67f5Y7D
         hIvqQrzgaWgbLklyhDH1FsfB0MIbA4yzFXR7TN0mxKSEnqfkwnTUR8kyEq1RAArhhNCA
         Mjag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y23-v6si6801901qto.342.2018.10.18.13.08.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:08:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44273 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEbE-0001jR-Gc
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:08:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEYB-0008CE-6F
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:05:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEYA-0008BQ-CF
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:05:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33808)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEXn-0007lN-9j; Thu, 18 Oct 2018 16:05:21 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2BBD03002C6E;
	Thu, 18 Oct 2018 20:05:16 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D443C611C7;
	Thu, 18 Oct 2018 20:05:10 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:03:44 -0300
Message-Id: <20181018200422.4358-8-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 18 Oct 2018 20:05:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 07/45] hw/timer/sun4v-rtc: Use
 DeviceState::realize rather than SysBusDevice::init
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
X-TUID: vLZ5B7uGrd4p

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Move from the legacy SysBusDevice::init method to using DeviceState::real=
ize.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20181002212522.23303-4-f4bug@amsat.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/timer/sun4v-rtc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/timer/sun4v-rtc.c b/hw/timer/sun4v-rtc.c
index 13be94f8da..4e7f6a1eff 100644
--- a/hw/timer/sun4v-rtc.c
+++ b/hw/timer/sun4v-rtc.c
@@ -63,21 +63,21 @@ void sun4v_rtc_init(hwaddr addr)
     sysbus_mmio_map(s, 0, addr);
 }
=20
-static int sun4v_rtc_init1(SysBusDevice *dev)
+static void sun4v_rtc_realize(DeviceState *dev, Error **errp)
 {
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
     Sun4vRtc *s =3D SUN4V_RTC(dev);
=20
     memory_region_init_io(&s->iomem, OBJECT(s), &sun4v_rtc_ops, s,
                           "sun4v-rtc", 0x08ULL);
-    sysbus_init_mmio(dev, &s->iomem);
-    return 0;
+    sysbus_init_mmio(sbd, &s->iomem);
 }
=20
 static void sun4v_rtc_class_init(ObjectClass *klass, void *data)
 {
-    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
-    k->init =3D sun4v_rtc_init1;
+    dc->realize =3D sun4v_rtc_realize;
 }
=20
 static const TypeInfo sun4v_rtc_info =3D {
--=20
2.18.0.rc1.1.g3f1ff2140

