Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2603056wru;
        Mon, 1 Jul 2019 05:32:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqziy/OVFSrAMWnDQiXojUD77LGf5KPwVGf333a5QOJxRA/8PYFqUTGfppkS5RU1ya6ZRyKc
X-Received: by 2002:a17:906:d6a:: with SMTP id s10mr22480195ejh.180.1561984362677;
        Mon, 01 Jul 2019 05:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561984362; cv=none;
        d=google.com; s=arc-20160816;
        b=zrCMpJ4s0/bd75oNa/TF4Ra3UI3kVE3XKQEV70V/WecjhIk065JOSngImXG50T0ZNK
         bBNVCb5Alu4SnsL6x9vcrUg/DniadA0dApY+DS/iof7niE8Sfx3syFiFLomN6XYgIEKB
         kqWdnipSn7mXvv0my8/2AwcLkK6evjtwWzy0+ngcxOKO4v2i0Z9izj25etuBbz4Q+Q+y
         3F0i1ihH4VQwQlnrv4Z4Hd1yqw8rHfKtyhX8Ne/UrjuR69o8TVjqYuIgzxiMl+W+fi9T
         lOr1fPvIMJthLfycM7zZmfGyXJwuGocTEcXL9k2XG3GnUhegJvY5M9pR3dEbSKekU/UB
         S+pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=kDnwkJsFjiFqSF1WSsqEN+u26dLU8R0rIOyuwxi0hMo=;
        b=yyDU0pPUqUR7UJyeX0W/SJsBMhzTVbFq2O8FrAWXQf+mcclQDTY48Dn2gcwkXjhsxM
         o26w+TZHSloAUcM/QoPlj0SxA1WT2SH7e3bho64Q7zT80c5ocDHQhpfSaLB5I21Tzycn
         Dx+dfK0tCxDuowmiPP5NbBmHrpxZXYqzbj+DWCUtL2L3gSiNnOqlmHUlmhHX1xoZpjsm
         sVlDOXcV9Pq+ISpVVto8F8pl0agj2ScVEsr8zTfxMCl+H8GqeQajo1/njsG8GDsGgcIE
         94KxyqruCaMk49PdztROPRydax2lcPROqEDCnbYS8/CIpXE3oPGx1+Wr5su/Q5vvNb6x
         ZPBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15si7259277ejz.273.2019.07.01.05.32.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 05:32:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhvU9-0006Il-M1
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 08:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57709)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hhvTN-00066r-Oa
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 08:31:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hhvTM-0002wn-EN
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 08:31:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48056)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hhvTK-0002oy-O8; Mon, 01 Jul 2019 08:31:51 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8475F31628E3;
 Mon,  1 Jul 2019 12:31:46 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 297B517CC0;
 Mon,  1 Jul 2019 12:31:42 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Jul 2019 14:31:07 +0200
Message-Id: <20190701123108.12493-6-philmd@redhat.com>
In-Reply-To: <20190701123108.12493-1-philmd@redhat.com>
References: <20190701123108.12493-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Mon, 01 Jul 2019 12:31:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 5/6] hw/dma/xilinx_axi: Use
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fgBBzkA8zAYU

As explained in commit aff39be0ed97:

  Both functions, object_initialize() and object_property_add_child()
  increase the reference counter of the new object, so one of the
  references has to be dropped afterwards to get the reference
  counting right. Otherwise the child object will not be properly
  cleaned up when the parent gets destroyed.
  Thus let's use now object_initialize_child() instead to get the
  reference counting here right.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/dma/xilinx_axidma.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 921be178d9..91f5ec587f 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -563,14 +563,14 @@ static void xilinx_axidma_init(Object *obj)
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
+                            TYPE_XILINX_AXI_ENET_DATA_STREAM, &error_abo=
rt,
+                            NULL);
+    object_initialize_child(OBJECT(s), "axistream-control-connected-targ=
et",
+                            &s->rx_control_dev, sizeof(s->rx_control_dev=
),
+                            TYPE_XILINX_AXI_ENET_CONTROL_STREAM, &error_=
abort,
+                            NULL);
=20
     sysbus_init_irq(sbd, &s->streams[0].irq);
     sysbus_init_irq(sbd, &s->streams[1].irq);
--=20
2.20.1

