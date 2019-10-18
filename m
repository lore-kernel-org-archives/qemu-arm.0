Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1091462wrm;
        Fri, 18 Oct 2019 08:47:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwWo9009sDwuu6stNmeHO7PjGM7wYE/HTC0opBkGOhc8tB/pjc02U0ZQDUFZZS4cTFueiSg
X-Received: by 2002:a37:9d85:: with SMTP id g127mr9485290qke.128.1571413643308;
        Fri, 18 Oct 2019 08:47:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571413643; cv=none;
        d=google.com; s=arc-20160816;
        b=T9tl/QzRQ7MxbsoNXqHcMJ33xLDBAgWNAwLyLAOP9Kzoiv3pKYXthJOnPxMTPPaxH9
         6JulX8sLZBYZAU3AIl3oH7DfRxzP695TV29KJ+DWWkRdNMlWT5ye9ZhdhUBl4ivTmuWd
         cTv7JSUm52DJ8iAL0yZmUOzH1TZLr+d54fEZtRyJMC9LgNYn/6bw4ONyhw90rnztlNtJ
         BtGqlm45i4mDtO6EmegO1WCyvbezp1QNdnUl77IfPjJLJNpi/7nUmMuQq5EHThYxFPHO
         bgAvp1BIBpZgJd5QLWh4RQOH9olMdzEwyx4Kny0EIxhkm0jgQaWgJGghIx2fPhpwyQHB
         YLxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=IHZ49jn/WVLrkBVEBEbOdzRfY3Fq0r4sx/ZefdiyPrk=;
        b=XJqsFvbxypoP/p7VGtX/E893UT3ai4fmqitkpgoINjWJm5U2dVsnfPuq7gLYr7Fjfz
         +rdJEiljeHge3kssbc8ynqT3lr1s7AD8s31QjXIIeJS9kQEIEEZ1AFAZTZOG0HpwR6Ep
         kSGnDtSIo1qODCacokn0YxjaA8PYLton1tDqsaisR+BOlM7B4vtFb3dP5nI5mXQWzh3G
         p7avFNpw8pdcLIgPL03bEc+nJkpMapStiyMahyNqwISv5cabfWHUm2h4bkbBgUZDe7/p
         XYck8j6E1oL5KFJA1BVIb/sQlRBlXko81N2wtIPsArBLY/DvRb5cqlGTz9ifKu4ngSAG
         zG7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d201si5629797qkb.103.2019.10.18.08.47.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 08:47:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLUTK-0004JM-DH
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 11:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44693)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUQ3-0001n3-0H
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 11:44:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iLUQ1-0007hL-IA
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 11:43:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52722)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iLUPy-0007eB-5X; Fri, 18 Oct 2019 11:43:54 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 394733090FEC;
 Fri, 18 Oct 2019 15:43:53 +0000 (UTC)
Received: from localhost (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED2BB60925;
 Fri, 18 Oct 2019 15:43:49 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/14] omap-gpio: remove PROP_PTR
Date: Fri, 18 Oct 2019 17:42:10 +0200
Message-Id: <20191018154212.13458-13-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-1-marcandre.lureau@redhat.com>
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 18 Oct 2019 15:43:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nWQObF3UaPPm

Since clock are not QOM objects, replace PROP_PTR of clocks with
setters methods.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/arm/omap1.c        |  2 +-
 hw/arm/omap2.c        | 13 +++++++------
 hw/gpio/omap_gpio.c   | 42 +++++++++++++++---------------------------
 include/hw/arm/omap.h | 17 +++++++++++++++++
 4 files changed, 40 insertions(+), 34 deletions(-)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index fe55c44c7e..f13d46afaa 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -4014,7 +4014,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryReg=
ion *system_memory,
=20
     s->gpio =3D qdev_create(NULL, "omap-gpio");
     qdev_prop_set_int32(s->gpio, "mpu_model", s->mpu_model);
-    qdev_prop_set_ptr(s->gpio, "clk", omap_findclk(s, "arm_gpio_ck"));
+    omap_gpio_set_clk(OMAP1_GPIO(s->gpio), omap_findclk(s, "arm_gpio_ck"=
));
     qdev_init_nofail(s->gpio);
     sysbus_connect_irq(SYS_BUS_DEVICE(s->gpio), 0,
                        qdev_get_gpio_in(s->ih[0], OMAP_INT_GPIO_BANK1));
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index 046fb6ffb5..d5c20f6486 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -2452,13 +2452,14 @@ struct omap_mpu_state_s *omap2420_mpu_init(Memory=
Region *sysmem,
=20
     s->gpio =3D qdev_create(NULL, "omap2-gpio");
     qdev_prop_set_int32(s->gpio, "mpu_model", s->mpu_model);
-    qdev_prop_set_ptr(s->gpio, "iclk", omap_findclk(s, "gpio_iclk"));
-    qdev_prop_set_ptr(s->gpio, "fclk0", omap_findclk(s, "gpio1_dbclk"));
-    qdev_prop_set_ptr(s->gpio, "fclk1", omap_findclk(s, "gpio2_dbclk"));
-    qdev_prop_set_ptr(s->gpio, "fclk2", omap_findclk(s, "gpio3_dbclk"));
-    qdev_prop_set_ptr(s->gpio, "fclk3", omap_findclk(s, "gpio4_dbclk"));
+    omap2_gpio_set_iclk(OMAP2_GPIO(s->gpio), omap_findclk(s, "gpio_iclk"=
));
+    omap2_gpio_set_fclk(OMAP2_GPIO(s->gpio), 0, omap_findclk(s, "gpio1_d=
bclk"));
+    omap2_gpio_set_fclk(OMAP2_GPIO(s->gpio), 1, omap_findclk(s, "gpio2_d=
bclk"));
+    omap2_gpio_set_fclk(OMAP2_GPIO(s->gpio), 2, omap_findclk(s, "gpio3_d=
bclk"));
+    omap2_gpio_set_fclk(OMAP2_GPIO(s->gpio), 3, omap_findclk(s, "gpio4_d=
bclk"));
     if (s->mpu_model =3D=3D omap2430) {
-        qdev_prop_set_ptr(s->gpio, "fclk4", omap_findclk(s, "gpio5_dbclk=
"));
+        omap2_gpio_set_fclk(OMAP2_GPIO(s->gpio), 4,
+                            omap_findclk(s, "gpio5_dbclk"));
     }
     qdev_init_nofail(s->gpio);
     busdev =3D SYS_BUS_DEVICE(s->gpio);
diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c
index 41e1aa798c..85c16897ae 100644
--- a/hw/gpio/omap_gpio.c
+++ b/hw/gpio/omap_gpio.c
@@ -40,10 +40,6 @@ struct omap_gpio_s {
     uint16_t pins;
 };
=20
-#define TYPE_OMAP1_GPIO "omap-gpio"
-#define OMAP1_GPIO(obj) \
-    OBJECT_CHECK(struct omap_gpif_s, (obj), TYPE_OMAP1_GPIO)
-
 struct omap_gpif_s {
     SysBusDevice parent_obj;
=20
@@ -212,10 +208,6 @@ struct omap2_gpio_s {
     uint8_t delay;
 };
=20
-#define TYPE_OMAP2_GPIO "omap2-gpio"
-#define OMAP2_GPIO(obj) \
-    OBJECT_CHECK(struct omap2_gpif_s, (obj), TYPE_OMAP2_GPIO)
-
 struct omap2_gpif_s {
     SysBusDevice parent_obj;
=20
@@ -747,21 +739,13 @@ static void omap2_gpio_realize(DeviceState *dev, Er=
ror **errp)
     }
 }
=20
-/* Using qdev pointer properties for the clocks is not ideal.
- * qdev should support a generic means of defining a 'port' with
- * an arbitrary interface for connecting two devices. Then we
- * could reframe the omap clock API in terms of clock ports,
- * and get some type safety. For now the best qdev provides is
- * passing an arbitrary pointer.
- * (It's not possible to pass in the string which is the clock
- * name, because this device does not have the necessary information
- * (ie the struct omap_mpu_state_s*) to do the clockname to pointer
- * translation.)
- */
+void omap_gpio_set_clk(omap_gpif *gpio, omap_clk clk)
+{
+    gpio->clk =3D clk;
+}
=20
 static Property omap_gpio_properties[] =3D {
     DEFINE_PROP_INT32("mpu_model", struct omap_gpif_s, mpu_model, 0),
-    DEFINE_PROP_PTR("clk", struct omap_gpif_s, clk),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
@@ -784,15 +768,19 @@ static const TypeInfo omap_gpio_info =3D {
     .class_init    =3D omap_gpio_class_init,
 };
=20
+void omap2_gpio_set_iclk(omap2_gpif *gpio, omap_clk clk)
+{
+    gpio->iclk =3D clk;
+}
+
+void omap2_gpio_set_fclk(omap2_gpif *gpio, uint8_t i, omap_clk clk)
+{
+    assert(i <=3D 5);
+    gpio->fclk[i] =3D clk;
+}
+
 static Property omap2_gpio_properties[] =3D {
     DEFINE_PROP_INT32("mpu_model", struct omap2_gpif_s, mpu_model, 0),
-    DEFINE_PROP_PTR("iclk", struct omap2_gpif_s, iclk),
-    DEFINE_PROP_PTR("fclk0", struct omap2_gpif_s, fclk[0]),
-    DEFINE_PROP_PTR("fclk1", struct omap2_gpif_s, fclk[1]),
-    DEFINE_PROP_PTR("fclk2", struct omap2_gpif_s, fclk[2]),
-    DEFINE_PROP_PTR("fclk3", struct omap2_gpif_s, fclk[3]),
-    DEFINE_PROP_PTR("fclk4", struct omap2_gpif_s, fclk[4]),
-    DEFINE_PROP_PTR("fclk5", struct omap2_gpif_s, fclk[5]),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index 08ee0c7702..97115891f8 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -86,6 +86,23 @@ typedef struct OMAPI2CState OMAPI2CState;
 void omap_i2c_set_iclk(OMAPI2CState *i2c, omap_clk clk);
 void omap_i2c_set_fclk(OMAPI2CState *i2c, omap_clk clk);
=20
+/* omap_gpio.c */
+#define TYPE_OMAP1_GPIO "omap-gpio"
+#define OMAP1_GPIO(obj)                                         \
+    OBJECT_CHECK(struct omap_gpif_s, (obj), TYPE_OMAP1_GPIO)
+
+#define TYPE_OMAP2_GPIO "omap2-gpio"
+#define OMAP2_GPIO(obj)                                         \
+    OBJECT_CHECK(struct omap2_gpif_s, (obj), TYPE_OMAP2_GPIO)
+
+typedef struct omap_gpif_s omap_gpif;
+typedef struct omap2_gpif_s omap2_gpif;
+
+void omap_gpio_set_clk(omap_gpif *gpio, omap_clk clk);
+
+void omap2_gpio_set_iclk(omap2_gpif *gpio, omap_clk clk);
+void omap2_gpio_set_fclk(omap2_gpif *gpio, uint8_t i, omap_clk clk);
+
 /* OMAP2 l4 Interconnect */
 struct omap_l4_s;
 struct omap_l4_region_s {
--=20
2.23.0.606.g08da6496b6

