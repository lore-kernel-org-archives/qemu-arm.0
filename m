Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp659559wrs;
        Fri, 23 Aug 2019 07:37:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwYT87LSDvuqEDWsBaM7z4WtWPeW/c0yK9ErbHCYwLABKoTqYkxk6ROfwVFfN6qhuxSjTos
X-Received: by 2002:aed:3b9d:: with SMTP id r29mr5060580qte.122.1566571070730;
        Fri, 23 Aug 2019 07:37:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566571070; cv=none;
        d=google.com; s=arc-20160816;
        b=BMOkIeQZUMuI0wA0fggEmhwNkazGcB7fXkiabgUQCUN29dGZPZ3lzcFcOgsw5b18Vs
         +Sw/HLSvZutl7aD0MhXAFZ7zkHFNCWfjhRfmaH8qrLe8GLcqhQHeNab90bywX24egIPR
         Mb7eM5MDE5NtPCfKJlQMCEGpOll8OnMRlTf406JjearACwzmAVnEZEbpOVk8B18ZK2Ou
         AC7dIaKy380ksQkqYZ93wsy3x7WmUCwzehbDD76TWi6wzoWnnO84GfENWtz85EY/COlW
         QkFGd01eTkvxr3q+issqykSopjYNjZddzx7a6e2SemRO1q6otby8YBLb2uSsi2LjBTpA
         hkQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=6kjzhr5yZtERgKJ3rV5MMJPZafqCOdv4C3dSAu0dlAA=;
        b=b2vU83jp+OATykblZgKfxSpDtrQI6nV1cLvb+jM5I0a1njcX7Vtk0M0g6US4iVzJwe
         biYdTCDIjEQWqpROZRBtdsqWSi+KuDC9w+4p310AhSBkfCB0svn1LnZoU8Z/55s0GBVP
         aCUahLthFDeOY6XFoQD7YBbzi6sc9pVmB0UIn1uespqDtts7g2kF2la6HF5sRncjVafT
         IRQqbUAcLGc47OmTENTTIoPRhNxbB2+Wnooe7zny6xYHTkyPJz3BCwUR8GtA6DaYwOAI
         xpak41Rk4HmOPCbZQ/LEKFOyOcmcFiS/Nf51Bfp53i5IBwB2dCDAj8pBvkvAvtyMggnh
         iNww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18si2126165qth.86.2019.08.23.07.37.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 07:37:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1AhJ-0003qX-FI
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 10:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50470)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i1AdT-0000b5-29
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 10:33:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i1AdR-0001yQ-3q
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 10:33:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35438)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i1AdP-0001v2-4L; Fri, 23 Aug 2019 10:33:49 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D441218C4271;
 Fri, 23 Aug 2019 14:33:45 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-118.brq.redhat.com [10.40.204.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EE915D9CA;
 Fri, 23 Aug 2019 14:33:38 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2019 16:32:48 +0200
Message-Id: <20190823143249.8096-6-philmd@redhat.com>
In-Reply-To: <20190823143249.8096-1-philmd@redhat.com>
References: <20190823143249.8096-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Fri, 23 Aug 2019 14:33:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 5/6] hw/dma/xilinx_axi: Use
 object_initialize_child for correct ref. counting
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QE4HBsiLLTpa

As explained in commit aff39be0ed97:

  Both functions, object_initialize() and object_property_add_child()
  increase the reference counter of the new object, so one of the
  references has to be dropped afterwards to get the reference
  counting right. Otherwise the child object will not be properly
  cleaned up when the parent gets destroyed.
  Thus let's use now object_initialize_child() instead to get the
  reference counting here right.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: fix typo ENET -> DMA in TYPE macro name
---
 hw/dma/xilinx_axidma.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index d176df6d44..a254275b64 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -566,14 +566,14 @@ static void xilinx_axidma_init(Object *obj)
     XilinxAXIDMA *s =3D XILINX_AXI_DMA(obj);
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
=20
-    object_initialize(&s->rx_data_dev, sizeof(s->rx_data_dev),
-                      TYPE_XILINX_AXI_DMA_DATA_STREAM);
-    object_initialize(&s->rx_control_dev, sizeof(s->rx_control_dev),
-                      TYPE_XILINX_AXI_DMA_CONTROL_STREAM);
-    object_property_add_child(OBJECT(s), "axistream-connected-target",
-                              (Object *)&s->rx_data_dev, &error_abort);
-    object_property_add_child(OBJECT(s), "axistream-control-connected-ta=
rget",
-                              (Object *)&s->rx_control_dev, &error_abort=
);
+    object_initialize_child(OBJECT(s), "axistream-connected-target",
+                            &s->rx_data_dev, sizeof(s->rx_data_dev),
+                            TYPE_XILINX_AXI_DMA_DATA_STREAM, &error_abor=
t,
+                            NULL);
+    object_initialize_child(OBJECT(s), "axistream-control-connected-targ=
et",
+                            &s->rx_control_dev, sizeof(s->rx_control_dev=
),
+                            TYPE_XILINX_AXI_DMA_CONTROL_STREAM, &error_a=
bort,
+                            NULL);
=20
     sysbus_init_irq(sbd, &s->streams[0].irq);
     sysbus_init_irq(sbd, &s->streams[1].irq);
--=20
2.20.1

