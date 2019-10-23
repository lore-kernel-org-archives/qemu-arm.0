Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1231110wrq;
        Wed, 23 Oct 2019 11:12:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw5bQuvO8khQh8UXbnkOYeAGjqeGGdfOYVIBxct5pifIUvx/oN8DRwYhn4au9xzGX2fy5k1
X-Received: by 2002:a81:578c:: with SMTP id l134mr3706202ywb.357.1571854348324;
        Wed, 23 Oct 2019 11:12:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571854348; cv=none;
        d=google.com; s=arc-20160816;
        b=pY6RpdZI1EZ7B0hdHQNVlXqD0VofVwQ3jYLU2gFBE1YSw/arLmKMnPmEg8ktq9NuF0
         E0yWKzM1YkmvoIeyYnj5pFIgIhtb6Blbe8PQ72HgTV3VjdkgpZMI8Ekry38p/ZjQc1ce
         mnZLIJLJ+xFjt3XKJYtjhFT37qYCJV/s0XU7q4ciuCvaLtMQclTlirx0KiSW7qkBa/kv
         uZ0LFLRBam/QYOr6SChAj/yhAqcZrq1FB6Y9+eXFaYvv2iAPxaz2+tBK/YGbeGjdQLfj
         EdZcx08dV81UCS0vG2VZ5N+fULL5RiV7nu2RVrbQCJUoYOQmHKX7Gh1BzEmVlrN7iWg2
         Ccig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KKxnDtWH+IBHEOp1QyHnSnDFsBZXpz4ihyY+6fCgcJ4=;
        b=0tZb6ohJoeEyN3hcb9sVe0Eg48vtHG13k3rsXX8ZUwtiZT9ADC2GWmEQZD9EFxJ38H
         lHcrAID4pn7vj17giceV2fvwspKYyVpBBN65dKqwLiS3rdSz23swHG21eS5MlZish6ml
         PwCTNTmw0H5AwmO8IgDae+9pG6AjF4ALcosrRQLLjN/YZIj9pky1vrLEKKfN1FCqj/E+
         VXmD/lNH5VqZGrvtoAX97EPnYSZl7idfQVCppGTPQOszZ64qbyzJXeQOpjGoUsnR4SEk
         ZmMbb0Q/B+CT/kPFfJbL6YzO5R1yoiJYgtyYmtQrLalruyYNEARFs/fKUPWRTS98mC9Y
         XLyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SkBwHR71;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k36si13153270qte.228.2019.10.23.11.12.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 11:12:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SkBwHR71;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNL7S-0001fo-T4
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 14:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59722)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKX6-0005M5-AY
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:34:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKX2-0002J3-CS
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:34:50 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:42758
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iNKWw-0002Fn-CT
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:34:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571852081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKxnDtWH+IBHEOp1QyHnSnDFsBZXpz4ihyY+6fCgcJ4=;
 b=SkBwHR71LqOuE+wvx4VH3dTWZInSWL9AoPQLNVqgbiv14asDY4FPWJvuXrRb66nzZGzncI
 5a/fSRK7k8VtE5GuOJ9SLY+6EV3ig0v+6ZpEr6CuNzRXRBRW4CarRRdzeYClPFg2N3AJ7G
 MLab7U5pLPKnUDFbHkn5wPfzkh2cp/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-PXrH0LYxPcmZ4cLupWVLlQ-1; Wed, 23 Oct 2019 13:34:38 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 036471005512;
 Wed, 23 Oct 2019 17:34:36 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C16F5C1D4;
 Wed, 23 Oct 2019 17:34:35 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/33] dp8393x: replace PROP_PTR with PROP_LINK
Date: Wed, 23 Oct 2019 19:31:44 +0200
Message-Id: <20191023173154.30051-24-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-1-marcandre.lureau@redhat.com>
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: PXrH0LYxPcmZ4cLupWVLlQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
 Paul Burton <pburton@wavecomp.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 Magnus Damm <magnus.damm@gmail.com>,
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
X-TUID: B3Z88AmhWQRm

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

