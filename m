Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp725108wro;
        Thu, 25 Oct 2018 06:46:04 -0700 (PDT)
X-Google-Smtp-Source: AJdET5f+F2p+yCqbw9vlt4+0WpMZGQyDnk2G5vj7zD3qONmG1FZbJnCzxINeXXxzf6CP/NU2SBEx
X-Received: by 2002:aed:3923:: with SMTP id l32-v6mr1492820qte.378.1540475164319;
        Thu, 25 Oct 2018 06:46:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540475164; cv=none;
        d=google.com; s=arc-20160816;
        b=n5ct72u+pb5NmvlPwVOmFkxpOQwPYEr7rIuNtOHN0TWr0yP3RG7lNnAwv713XAUWh6
         I1i/DHTbA/RKKpqj96+4wRqiqH01PBzAQW2neKfmYTUv3J0mLMZZebvz1mJ3D3YnyLZ2
         VLtE/q/pZgHqQeJf9PsJHmMnBPUTK5vc9iRtDz+2eA5Xpcn7dA5bhUIg4hv6pzTcihZn
         RxHuyIVfStUUf+lK1NreKhkOljk3Gn1yj4lWZMsIYaQDYqT8hYjZg+krxHIIFHC/i2T2
         WmvarYoVwGgI8K+oKSwYVugFXOw2DZo8pZIM8DnLIHct0IPIaqZFtMRriv2DE0ExDK2b
         hDcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=pHMaGyqq/l1f2Bel3mGx5xpGit6Wq4bbMRy2WnhgrTA=;
        b=o+j/7Uo2/6BdUZOq2/aC+mzsBjVpR+ISbbjgHwJKh9TzuLN7uoSmDAbYbjx7Vxc+/C
         UojYM3SrugFvBAPJyTjmjwhQBGVdhBycugysKTz4vKQcFZcgBf+m63dmY+xGyHLQi9Bz
         KknEjBL3Zq4OVVrpt9jW6kNHJsIsM4JmrcKNT9Gj3Vf1lRmM2rb//0Jq3je5KTmF8+EN
         RHruENzYuUw9B45PeLkiPUlW5r4kZCKqfNAXlMnGTKEjJRyTYerxLYKlNDw3RgR1jc7q
         d/kKlqsZYjHLDx64n2K0fonivDkDKzzgEsofrYyxfQ157N3Jfg6mMCo7sONCaR222Vth
         WIaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p52-v6si1498330qtc.174.2018.10.25.06.46.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:46:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54548 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFfxb-0003YJ-L5
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:46:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfmr-00026L-CO
	for qemu-devel@nongnu.org; Thu, 25 Oct 2018 09:34:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFflr-0007A9-Vv
	for qemu-devel@nongnu.org; Thu, 25 Oct 2018 09:33:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50530)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFflq-00074P-7m; Thu, 25 Oct 2018 09:33:54 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 204E430012EB;
	Thu, 25 Oct 2018 13:33:53 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BCB9560A9E;
	Thu, 25 Oct 2018 13:33:48 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:24 -0300
Message-Id: <20181025133301.16578-7-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 25 Oct 2018 13:33:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 06/43] hw/timer/sun4v-rtc: Use
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
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
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
X-TUID: pR8OwOytDNe+

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

