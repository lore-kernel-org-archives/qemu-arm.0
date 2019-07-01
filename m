Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2610811wru;
        Mon, 1 Jul 2019 05:41:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwBby4EBzOSyOYazR2X6J3aO9VpLe9FuS8Gr4ekryDYsabnnFq1RLYQ1c4Zl3y13UQo6tld
X-Received: by 2002:aa7:d4cf:: with SMTP id t15mr28801486edr.215.1561984882194;
        Mon, 01 Jul 2019 05:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561984882; cv=none;
        d=google.com; s=arc-20160816;
        b=gw8ZoFIe1ShOT+6Utg3Es0Tpe9PwPjh19rjpxYQRBmeCQ8oFkTNmSA+slfzOBGD+Cr
         VcIKz+09YY3i/Q3i0PeBU6vx4iQjUgbMFAwYoDenLY1Z7ID1vYBV+l+WDDmhSHZu65y/
         FSTDfzLbgT8rIJjB0NE8xMvlzz0blUxCk7JpUD0YXRlOBgp4sU56BaUjUd1dMO9FAlyf
         aFBJrvagSHtG7v2zQ5J1CwTaR0TOsOAE4TO5c/8MUOBaQV0TR6q1axCtx9TwJJYm88H+
         Py1CWtqusd+5UvK8TMGr0o3Qtd123U9zFaXYT9UUGL5D4Igz6VgQXY5Y/uBJHRDGENeX
         /rNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=wAc1KcwFyzztVsShu4pbtmjbCFnaMe7RvnF/9uyyXZY=;
        b=u7m19dz58AlpkG901d2XXC0YXT1vAu9DcJ9gHGPZ0DXt2nh4uuxnTOowu0QrURu8e5
         zM/Uf0bPuLn/5nbRuXwkjIB7h1HB+aw2R52noOx7iMOvZTkd5G645xy5L9HaldD7ILO7
         bds8sm/bLDLTjYzyQXPl3w71jOkaKKGjHCUth1Ki2h1iWeT1EKM4Vhq6QCx8K0subIwW
         Ra4k+x779rSRImgrH9JQZoHNhNdCDZW81T9o9EDGSNoa44POs+biz+NkRATauOVjlFSf
         2EKYB5Js0SsvqWoMIhqQak0qDlSlNb0uYW+WVXfGkluZAC17OQR/boGF08tFpNsd88XT
         aWsA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6si8805071edq.358.2019.07.01.05.41.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 05:41:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhvcX-0003yc-AF
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 08:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57778)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hhvTT-00068s-2M
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 08:32:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hhvTQ-00037J-Pf
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 08:31:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:21219)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hhvTM-0002vp-HA; Mon, 01 Jul 2019 08:31:52 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 78BB458E33;
 Mon,  1 Jul 2019 12:31:51 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03F985ED5D;
 Mon,  1 Jul 2019 12:31:46 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Jul 2019 14:31:08 +0200
Message-Id: <20190701123108.12493-7-philmd@redhat.com>
In-Reply-To: <20190701123108.12493-1-philmd@redhat.com>
References: <20190701123108.12493-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 01 Jul 2019 12:31:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 6/6] hw/net/xilinx_axi: Use
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZW+HuElrpoqh

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
 hw/net/xilinx_axienet.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index feeaca680e..aa0ae3c013 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -990,15 +990,14 @@ static void xilinx_enet_init(Object *obj)
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

