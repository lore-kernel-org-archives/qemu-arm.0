Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2801969wrt;
        Thu, 18 Oct 2018 13:06:02 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63kwXTiJ5LtIuh2lv+h34t7LKxVyTu/J9WjfF1lnQYXClWSLFQmoqa5aMwh4HUwY6/qoA6w
X-Received: by 2002:a0c:f5d2:: with SMTP id q18mr8164967qvm.172.1539893162848;
        Thu, 18 Oct 2018 13:06:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539893162; cv=none;
        d=google.com; s=arc-20160816;
        b=pVJbmS7NVcdy4GQ/J1QB26i/Mh9qtGr4ZBywa7SDM9LxqmjcI4GB6eLOZamvWyW6xd
         bF1WEDC0FPEdne6+8D5ez+IjYAaQmJLd5F3cqQ0fSUtDI3RLp1fY5TSeX64DP0RDQE+L
         eEeahYGLG4iAj1TT+q9lfxMLgIbaUishgVeIm3FV6qGCZSuvwdMrbP72MdsiYsXNoJKR
         5tXQn1Ds6AmNxIq8/zLqTClbkC9KiI6nrRKJ9JdgwK48CI4Uph35J2JVin33ztC5M31n
         vyyapDMufecEE5yG91bu2ixN5C91yxnZIBwu1f2PgXGy+bKG8M8bGgQjaAsi4rgUONn6
         YvsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=0ZGSgo1msQVlu7xLted3UD9Xk8rtZ+wvSsWV52+jVgM=;
        b=S0+ulNnoNJAqm4ZZUEVluteqklmoEK48JJjW1JjShhb8ZekaUilYnkt9Bq6N84Qc1l
         yt8cHt0xHZ0a73n9T2eWkpdoYp0h6P1jWjvCi4qFWl4ANmboV3rselCReyfSHcXS6nRJ
         2cuX1+aAm4jMxH7n20EEevyXBityHrllEWhiiWrE2+bG68cvt/LEd1WZ2yC4kwthUNe8
         kLPi/8rxIvMhkIZbDBwx0M37Sk8F8c8U8RL6/OGOEdJDWf8L/gJNmR2LokuqXfqhHfu8
         cl6ZBzgJhvUsS9IEit1P72dB7cDF2ES1FxW7CdyJ+dyauscuepI7LXqk2BCMWGr10oaK
         LEGg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y8si13452930qvp.104.2018.10.18.13.06.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:06:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44265 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEYU-0008JQ-3Z
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:06:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEYA-0008BU-Et
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:05:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEY9-00089B-GD
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:05:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59918)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEY9-00086o-81; Thu, 18 Oct 2018 16:05:41 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E4C283082B4C;
	Thu, 18 Oct 2018 20:05:39 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 848AF60160;
	Thu, 18 Oct 2018 20:05:32 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:03:48 -0300
Message-Id: <20181018200422.4358-12-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 18 Oct 2018 20:05:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 11/45] hw/mips/gt64xxx_pci: Convert
 gt64120_reset() function into Device reset method
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
X-TUID: rv+uRmpZtet7

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Convert the gt64120_reset() function into a proper Device reset method.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20181002212522.23303-8-f4bug@amsat.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/mips/gt64xxx_pci.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 24ad0ad024..dcd1a66329 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -992,9 +992,9 @@ static void gt64120_pci_set_irq(void *opaque, int irq=
_num, int level)
 }
=20
=20
-static void gt64120_reset(void *opaque)
+static void gt64120_reset(DeviceState *dev)
 {
-    GT64120State *s =3D opaque;
+    GT64120State *s =3D GT64120_PCI_HOST_BRIDGE(dev);
=20
     /* FIXME: Malta specific hw assumptions ahead */
=20
@@ -1184,16 +1184,6 @@ PCIBus *gt64120_register(qemu_irq *pic)
     return phb->bus;
 }
=20
-static int gt64120_init(SysBusDevice *dev)
-{
-    GT64120State *s;
-
-    s =3D GT64120_PCI_HOST_BRIDGE(dev);
-
-    qemu_register_reset(gt64120_reset, s);
-    return 0;
-}
-
 static void gt64120_pci_realize(PCIDevice *d, Error **errp)
 {
     /* FIXME: Malta specific hw assumptions ahead */
@@ -1241,9 +1231,8 @@ static const TypeInfo gt64120_pci_info =3D {
 static void gt64120_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
-    SysBusDeviceClass *sdc =3D SYS_BUS_DEVICE_CLASS(klass);
=20
-    sdc->init =3D gt64120_init;
+    dc->reset =3D gt64120_reset;
     dc->vmsd =3D &vmstate_gt64120;
 }
=20
--=20
2.18.0.rc1.1.g3f1ff2140

