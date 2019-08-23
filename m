Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp663220wrs;
        Fri, 23 Aug 2019 07:41:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyr6IvwOfmDI8vQcwvm2fsF8AOQGd0TSGtaUIHZk26l0xm79XxUAScOEXJvFvn6C8o3obvc
X-Received: by 2002:a17:906:58f:: with SMTP id 15mr4571912ejn.19.1566571271803;
        Fri, 23 Aug 2019 07:41:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566571271; cv=none;
        d=google.com; s=arc-20160816;
        b=wUUeCf3ZE2aXv9fGDOm5/PHQz7LchvoTmwatmhXZZ5KYmqn4WC5LO398VY9gS6Stty
         sFG2lvSFkVlx+num2t6lMtTrJuYg2ZM6AymrQNYWcv1UNIIqVpDvBZWCFlKwwtozIAie
         5UurDB7//h6CCavv9/eLVVnShAGxPeQ8TGPJclGbnIuMUigm+xbhzY3BBPfreu53q9nd
         /GkFX1gLfpL6ZJ5XX90DrJASO5AR3iv0mVshxTorSjHKqRw4+Psb2zrw8ZFCwlhvt/bD
         9wUEEIkz0EUig9KKI0y7tCF/vlQ9DVb4H4QTd0YSJdDuBCk2u8pa1DQZDCb/F/w/HLXS
         kHVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=aZP19L+pcxVH2AbRP0FfTlSg46SEG5chIz084mRLMl0=;
        b=lfJfdiEhn8bZFrACjES/BKjS9iVpgIUBA6HWYReTrglf07jBEDZDzIgh0Xjpuxhelu
         M9dT0HrHZsyFSjnhxGbsvJl7dLvmOsrWxMGSKazGY2ZfuTRfz0Vl7+pXW0KgsbTi1pD/
         Ir0byRbcmDwM63peQEqCF2E6K9WVW+ujtyg2P2Rt+DuxG90/skt3Vfqy2VB+/DgXQqx8
         wFVLv7Lt+tym2V6Ma285Gcoh0DJLYMk7UzpNCIBBvrAH2v+5XDkVzMeXZ9p7ESnH2FW2
         mt72rC4HYFV0qxYttu4F0r57KMTM0HMfiWhiz53Ael9aKHgRMEn6bMKFgXIjMyI+C39Y
         AZCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6si1590566ejc.230.2019.08.23.07.41.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 07:41:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1AkX-0007BS-Jk
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 10:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50566)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i1Ada-0000iK-Oz
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:33:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i1AdZ-0002CN-Ji
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 10:33:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41026)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i1AdV-00023V-4b; Fri, 23 Aug 2019 10:33:54 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 699737F776;
 Fri, 23 Aug 2019 14:33:52 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-118.brq.redhat.com [10.40.204.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DD465D9CA;
 Fri, 23 Aug 2019 14:33:46 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2019 16:32:49 +0200
Message-Id: <20190823143249.8096-7-philmd@redhat.com>
In-Reply-To: <20190823143249.8096-1-philmd@redhat.com>
References: <20190823143249.8096-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Fri, 23 Aug 2019 14:33:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 6/6] hw/net/xilinx_axi: Use
 object_initialize_child for correct ref. counting
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vo1fDIzZVTla

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
 hw/net/xilinx_axienet.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index d8716a1f73..2c8c065401 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -994,15 +994,14 @@ static void xilinx_enet_init(Object *obj)
     XilinxAXIEnet *s =3D XILINX_AXI_ENET(obj);
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
=20
-    object_initialize(&s->rx_data_dev, sizeof(s->rx_data_dev),
-                      TYPE_XILINX_AXI_ENET_DATA_STREAM);
-    object_initialize(&s->rx_control_dev, sizeof(s->rx_control_dev),
-                      TYPE_XILINX_AXI_ENET_CONTROL_STREAM);
-    object_property_add_child(OBJECT(s), "axistream-connected-target",
-                              (Object *)&s->rx_data_dev, &error_abort);
-    object_property_add_child(OBJECT(s), "axistream-control-connected-ta=
rget",
-                              (Object *)&s->rx_control_dev, &error_abort=
);
-
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
     sysbus_init_irq(sbd, &s->irq);
=20
     memory_region_init_io(&s->iomem, OBJECT(s), &enet_ops, s, "enet", 0x=
40000);
--=20
2.20.1

