Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1086860wrm;
        Fri, 18 Oct 2019 08:43:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwOBPsOBh6/0p3GyjRhcoyTddAxexF1h6OGoq8vHr/2f/QweiXU0aozcNM26S6WBnWHoHBc
X-Received: by 2002:a0c:ef11:: with SMTP id t17mr3082964qvr.3.1571413409478;
        Fri, 18 Oct 2019 08:43:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571413409; cv=none;
        d=google.com; s=arc-20160816;
        b=l8RVoaibL2WTmu/whhZNFcAA+o+H2hUKxQo/rw/f2Bo43QazKlO2kELpeynORnuneH
         Xjkf0ZJJ7BIJsPdi2ZqW5LlU3eSl+OrUg7nzhZbiJDLhIMEYYDrw5CBX0RCtKRHU100d
         I/DghdcQF6SAvNZ8+tgKmgOvHv/Xrc9OufYUdxTs+hM7hOmkgjJVxZ6T+vxLljEc/eJr
         ud75mWNPtBE506cSM7ohMR+hrHkAloyYqaRRbgXgTvC8Qw9Yj2zSAip8SqpRIeAOXiEl
         zmVYWboK9pNp/uH7Kt6fzCLi6mPIMYgxLQOxxzrkx0AiBnHqsQd3LnpOamy1b5ZPN+Db
         wiRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=yteuqCB2CSTBoEzFVKcxxiNrkqCk40SP3t01KviQQco=;
        b=emvx1mlvbbkik0YMjTdei/u6pPcfKYDdLVsaeaZzBuj5IYoGzkF2Bu/QhWlWq4bNRR
         YritvGioWu+fHtKbDBLVI44Qusk8hunAqJUmlCdP3ERadNkvu88jWV8LRfd898kmE67d
         C0kGwLUibkpjFwHxxPNKg06LR2/9mkN0+tPV4YaybEqiRvw95Hw2bSIfA+QvraCai/+0
         McdgBg4eabf0kM3QopXjisCucFK0A7qT4yFcvFy2LuvaDhOQkmPhygaBNUneMYVfPEQJ
         t7e1ZlhiX7tl4yXobkEABKMWFs04vJ8ICZyoknd05bmL/ciVuGtCYOvkhPVoy6O3z1Qw
         RzbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a199si5399360qkg.247.2019.10.18.08.43.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 08:43:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLUPX-0000ZR-Cv
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 11:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44273)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUP0-0000IH-UV
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 11:42:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUOy-0006ZL-Qx
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 11:42:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46920)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iLUOw-0006V4-PR; Fri, 18 Oct 2019 11:42:52 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D607F3071D85;
 Fri, 18 Oct 2019 15:42:49 +0000 (UTC)
Received: from localhost (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 690B45D70E;
 Fri, 18 Oct 2019 15:42:44 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/14] dp8393x: replace PROP_PTR with PROP_LINK
Date: Fri, 18 Oct 2019 17:42:03 +0200
Message-Id: <20191018154212.13458-6-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-1-marcandre.lureau@redhat.com>
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 18 Oct 2019 15:42:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-TUID: OsIPmMuoM/fn

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
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
@@ -936,8 +937,6 @@ static void dp8393x_class_init(ObjectClass *klass, vo=
id *data)
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

