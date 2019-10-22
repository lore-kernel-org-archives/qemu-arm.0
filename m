Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp145372wrq;
        Tue, 22 Oct 2019 09:37:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy+7JmRedcjgLcklu9muJpe1Gnl/UImHE1Xa965/8NRUcoJFL/sF0UI8B+tdygF1Nn/iZTG
X-Received: by 2002:a37:4e44:: with SMTP id c65mr3865357qkb.357.1571762237832;
        Tue, 22 Oct 2019 09:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571762237; cv=none;
        d=google.com; s=arc-20160816;
        b=sF9RMriEMIMaX2KkqGoBVYirPCYEIxiYRaTKGVCtr9x6L6INgOu0uDCRwOTCj8SL68
         Jh0jwB8ZSCteT6z+YW0zBB7llEhROJ7ZHuwWk5Xb8sufpYtlR76OItjXnQy1HCzZZTrb
         E8Yrw07oZ1VV3LT+dst0llloYrBasgcqs6BkF2YVpEYTRHh6bUBoG+ttlhFN/ZFOqqiO
         6pLNLBMTeA31fChzqFkrSNiYUFZRt/Rmp50Xv1OmwZIpWRP/vjDXt5DGRQdBR5rVR70m
         a3MJkosMOz2ps4gPBpxvSvHH3uW4RFOklj9Jq+au03+wMkmEX5WaqY0m/dNDyhlMKYPi
         EQ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KKxnDtWH+IBHEOp1QyHnSnDFsBZXpz4ihyY+6fCgcJ4=;
        b=Ld/FO5/QqfJfqzYrDw3kCZoZGhNYEk7uAI/t3lW21mXyepsaFeo08SP/1Ss0NVixRn
         /0Uii9dWpzNQQdFEqgHW/mwvprxFj+/t3NwzKa5GPMfDsjqLyupiOBexPnahso7lGDLb
         vMRjj71GGwPOuP1vsIMGzn97V3YiLLJjG/r0nG0qWSk3UQt/X+o4XRwtW9go6evEMUzM
         d+gaRoMRbA0GnYgvi+QAlCns8Wy79cUK3hZlCjlA6/6VWGBlUYwoqhG/mmKJ1Roo/GtH
         pzxXqh0kpFslPrN4WVMmQ0sDDH8WbYL0pwlZafNYf4DjcvEfJ3SPaNqwt+21W0irdiat
         6Cxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="V/XqgK3M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i54si17410414qvd.206.2019.10.22.09.37.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 09:37:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="V/XqgK3M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMx9o-0006WI-T6
	for alex.bennee@linaro.org; Tue, 22 Oct 2019 12:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38611)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iMwx0-00080a-F0
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:24:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iMwwy-0007nJ-B9
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:24:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42916
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iMwwy-0007mK-13
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:24:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571761439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKxnDtWH+IBHEOp1QyHnSnDFsBZXpz4ihyY+6fCgcJ4=;
 b=V/XqgK3MtmQqeJWBxut2fR5BIUdRpUBg6oIT5JHcQgmt+JhPg+q495fsFN3kpaV6LP5DDF
 gNGm5So0JZCQrA8O7/l6qr3ZwA/g9Zly2kSLI5OMju5oyZsopS0TrPvoFu96XmUohpYj/V
 KPc0zOvacpDEutugVh4Ct3wwsQ3oQR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-n52AM4gmMZKvlnpDdvQVpg-1; Tue, 22 Oct 2019 12:23:56 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EE3380183D;
 Tue, 22 Oct 2019 16:23:54 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9127A5D6A9;
 Tue, 22 Oct 2019 16:23:53 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/28] dp8393x: replace PROP_PTR with PROP_LINK
Date: Tue, 22 Oct 2019 18:21:27 +0200
Message-Id: <20191022162137.27161-19-marcandre.lureau@redhat.com>
In-Reply-To: <20191022162137.27161-1-marcandre.lureau@redhat.com>
References: <20191022162137.27161-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: n52AM4gmMZKvlnpDdvQVpg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8rYtYmHZuUzP

Link property is the correct way to pass a MemoryRegion to a device
for DMA purposes.

Sidenote: as a sysbus device, this remains non-usercreatable
even though we can drop the specific flag here.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/mips/mips_jazz.c | 3 ++-
 hw/net/dp8393x.c    | 7 +++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
index 8d010a0b6e..878925a963 100644
--- a/hw/mips/mips_jazz.c
+++ b/hw/mips/mips_jazz.c
@@ -284,7 +284,8 @@ static void mips_jazz_init(MachineState *machine,
             dev =3D qdev_create(NULL, "dp8393x");
             qdev_set_nic_properties(dev, nd);
             qdev_prop_set_uint8(dev, "it_shift", 2);
-            qdev_prop_set_ptr(dev, "dma_mr", rc4030_dma_mr);
+            object_property_set_link(OBJECT(dev), OBJECT(rc4030_dma_mr),
+                                     "dma_mr", &error_abort);
             qdev_init_nofail(dev);
             sysbus =3D SYS_BUS_DEVICE(dev);
             sysbus_mmio_map(sysbus, 0, 0x80001000);
diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index a5678e11fa..946c7a8f64 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -173,7 +173,7 @@ typedef struct dp8393xState {
     int loopback_packet;
=20
     /* Memory access */
-    void *dma_mr;
+    MemoryRegion *dma_mr;
     AddressSpace as;
 } dp8393xState;
=20
@@ -922,7 +922,8 @@ static const VMStateDescription vmstate_dp8393x =3D {
=20
 static Property dp8393x_properties[] =3D {
     DEFINE_NIC_PROPERTIES(dp8393xState, conf),
-    DEFINE_PROP_PTR("dma_mr", dp8393xState, dma_mr),
+    DEFINE_PROP_LINK("dma_mr", dp8393xState, dma_mr,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
     DEFINE_PROP_UINT8("it_shift", dp8393xState, it_shift, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -936,8 +937,6 @@ static void dp8393x_class_init(ObjectClass *klass, void=
 *data)
     dc->reset =3D dp8393x_reset;
     dc->vmsd =3D &vmstate_dp8393x;
     dc->props =3D dp8393x_properties;
-    /* Reason: dma_mr property can't be set */
-    dc->user_creatable =3D false;
 }
=20
 static const TypeInfo dp8393x_info =3D {
--=20
2.23.0.606.g08da6496b6

