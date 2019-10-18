Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1096725wrm;
        Fri, 18 Oct 2019 08:51:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQpi9bGW0ewS3kOTHVNzF3Wa1LpBKeUF5SSm6PcsC/xRA9EdrQJk6ncEqcER/yFa7J3Xpk
X-Received: by 2002:a17:906:1f44:: with SMTP id d4mr9201077ejk.16.1571413916519;
        Fri, 18 Oct 2019 08:51:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571413916; cv=none;
        d=google.com; s=arc-20160816;
        b=O2alCwuOyWM81GNygGLQwINq2sf9jwXI9ezRLKhUBtHhoi/wy4Maa/UgzzUiCNgI4v
         JhyEGaRj9Fyh2QQdR3Xi14NqJ7H1CQejVnOP1Lx2veG3FlhRCRHix3CxoH5a74btbLq0
         gAeyXxy7B4C0xAWM10gLTouf8prnvJ8uA8yQYQzKcHJYs9n39iZMdPB10fBoxxsmw43I
         ViXiYJgV1coYz0qLq4un2ik++/D/IbL/T5jCPDlLnrHVzuI4U6woIvLA5nKFy09gVVnt
         NgydUDDq6FfZfinV+/eNwreXwU6EGZ7ottOQFtZDHuhX5RBEiTxrPOENptC8D2eVSD73
         2/0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=F1Q0ucWavt8/isdk4GuLAYKci7rceR89Fa3BJhyVztg=;
        b=MJQxAGzbKMxDkIsAlyaS4NHrIQ+cC4jlg6IHWCLGKSnt+taXgJJEQBxX8dGrAjlwh9
         1nHuDFpNjWm0YpzFkty5i6ekERnN+Y6w3nwj8Ze3Y0QEXNTDcs0zum8RBkOzE1Q6WkEl
         ZtmpI8sVOUJC/JSdWWX9GB8Gk00KrVnhIZ0fsiMt8aM/tH5Te4y2prAbK0osFVAMBk4v
         ze3GvtQVpX1GT2scFHEH/MySMPYLSq84KfDA/8H+KyPLhi8RU7TaXz++nnOU31GEkHvu
         SL4DWtA3pO0OghCPTtFECGns+y5o71ygVQ3TE/ReB+zs0CKYUz6mogyCVRkk2//7km+I
         nW6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15si3464376ejx.211.2019.10.18.08.51.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 08:51:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLUXi-0001OP-Qa
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 11:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44545)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUPn-0001OH-H1
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 11:43:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUPm-0007N0-4r
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 11:43:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37464)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iLUPl-0007MK-St; Fri, 18 Oct 2019 11:43:42 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E75E52B8F;
 Fri, 18 Oct 2019 15:43:40 +0000 (UTC)
Received: from localhost (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78CA8600C8;
 Fri, 18 Oct 2019 15:43:37 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/14] omap-intc: remove PROP_PTR
Date: Fri, 18 Oct 2019 17:42:08 +0200
Message-Id: <20191018154212.13458-11-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-1-marcandre.lureau@redhat.com>
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Fri, 18 Oct 2019 15:43:41 +0000 (UTC)
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
X-TUID: OI77hDZFGVCy

Since clock are not QOM objects, replace PROP_PTR of clocks with
setters methods.

(in theory there should probably be different methods for omap1 &
omap2 intc, but this is left as a future improvement)

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/arm/omap1.c        |  4 ++--
 hw/arm/omap2.c        |  4 ++--
 hw/intc/omap_intc.c   | 17 ++++++++++-------
 include/hw/arm/omap.h | 10 ++++++++++
 4 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 0400593805..c5583b10e0 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -3891,7 +3891,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryReg=
ion *system_memory,
=20
     s->ih[0] =3D qdev_create(NULL, "omap-intc");
     qdev_prop_set_uint32(s->ih[0], "size", 0x100);
-    qdev_prop_set_ptr(s->ih[0], "clk", omap_findclk(s, "arminth_ck"));
+    omap_intc_set_iclk(OMAP_INTC(s->ih[0]), omap_findclk(s, "arminth_ck"=
));
     qdev_init_nofail(s->ih[0]);
     busdev =3D SYS_BUS_DEVICE(s->ih[0]);
     sysbus_connect_irq(busdev, 0,
@@ -3901,7 +3901,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryReg=
ion *system_memory,
     sysbus_mmio_map(busdev, 0, 0xfffecb00);
     s->ih[1] =3D qdev_create(NULL, "omap-intc");
     qdev_prop_set_uint32(s->ih[1], "size", 0x800);
-    qdev_prop_set_ptr(s->ih[1], "clk", omap_findclk(s, "arminth_ck"));
+    omap_intc_set_iclk(OMAP_INTC(s->ih[1]), omap_findclk(s, "arminth_ck"=
));
     qdev_init_nofail(s->ih[1]);
     busdev =3D SYS_BUS_DEVICE(s->ih[1]);
     sysbus_connect_irq(busdev, 0,
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index bd7ddff983..726a628e64 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -2311,8 +2311,8 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRe=
gion *sysmem,
     /* Actually mapped at any 2K boundary in the ARM11 private-periphera=
l if */
     s->ih[0] =3D qdev_create(NULL, "omap2-intc");
     qdev_prop_set_uint8(s->ih[0], "revision", 0x21);
-    qdev_prop_set_ptr(s->ih[0], "fclk", omap_findclk(s, "mpu_intc_fclk")=
);
-    qdev_prop_set_ptr(s->ih[0], "iclk", omap_findclk(s, "mpu_intc_iclk")=
);
+    omap_intc_set_fclk(OMAP_INTC(s->ih[0]), omap_findclk(s, "mpu_intc_fc=
lk"));
+    omap_intc_set_iclk(OMAP_INTC(s->ih[0]), omap_findclk(s, "mpu_intc_ic=
lk"));
     qdev_init_nofail(s->ih[0]);
     busdev =3D SYS_BUS_DEVICE(s->ih[0]);
     sysbus_connect_irq(busdev, 0,
diff --git a/hw/intc/omap_intc.c b/hw/intc/omap_intc.c
index 854b709ca0..73bb1c2af4 100644
--- a/hw/intc/omap_intc.c
+++ b/hw/intc/omap_intc.c
@@ -38,10 +38,6 @@ struct omap_intr_handler_bank_s {
     unsigned char priority[32];
 };
=20
-#define TYPE_OMAP_INTC "common-omap-intc"
-#define OMAP_INTC(obj) \
-    OBJECT_CHECK(struct omap_intr_handler_s, (obj), TYPE_OMAP_INTC)
-
 struct omap_intr_handler_s {
     SysBusDevice parent_obj;
=20
@@ -391,9 +387,18 @@ static void omap_intc_realize(DeviceState *dev, Erro=
r **errp)
     }
 }
=20
+void omap_intc_set_iclk(omap_intr_handler *intc, omap_clk clk)
+{
+    intc->iclk =3D clk;
+}
+
+void omap_intc_set_fclk(omap_intr_handler *intc, omap_clk clk)
+{
+    intc->fclk =3D clk;
+}
+
 static Property omap_intc_properties[] =3D {
     DEFINE_PROP_UINT32("size", struct omap_intr_handler_s, size, 0x100),
-    DEFINE_PROP_PTR("clk", struct omap_intr_handler_s, iclk),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
@@ -647,8 +652,6 @@ static void omap2_intc_realize(DeviceState *dev, Erro=
r **errp)
 static Property omap2_intc_properties[] =3D {
     DEFINE_PROP_UINT8("revision", struct omap_intr_handler_s,
     revision, 0x21),
-    DEFINE_PROP_PTR("iclk", struct omap_intr_handler_s, iclk),
-    DEFINE_PROP_PTR("fclk", struct omap_intr_handler_s, fclk),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index 2fda996648..6b7897ba27 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -67,6 +67,16 @@ void omap_clk_setrate(omap_clk clk, int divide, int mu=
ltiply);
 int64_t omap_clk_getrate(omap_clk clk);
 void omap_clk_reparent(omap_clk clk, omap_clk parent);
=20
+/* omap_intc.c */
+#define TYPE_OMAP_INTC "common-omap-intc"
+#define OMAP_INTC(obj)                                              \
+    OBJECT_CHECK(omap_intr_handler, (obj), TYPE_OMAP_INTC)
+
+typedef struct omap_intr_handler_s omap_intr_handler;
+
+void omap_intc_set_iclk(omap_intr_handler *intc, omap_clk clk);
+void omap_intc_set_fclk(omap_intr_handler *intc, omap_clk clk);
+
 /* OMAP2 l4 Interconnect */
 struct omap_l4_s;
 struct omap_l4_region_s {
--=20
2.23.0.606.g08da6496b6

