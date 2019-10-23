Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1235480wrq;
        Wed, 23 Oct 2019 11:16:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwxezhERYtR4+V0+x6CmM1QiO0gtlfDk4hPxhAvc2fQjm6qPogWtdNG+/6vqNByM/PQ4+Wa
X-Received: by 2002:aa7:df0b:: with SMTP id c11mr39068509edy.101.1571854565815;
        Wed, 23 Oct 2019 11:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571854565; cv=none;
        d=google.com; s=arc-20160816;
        b=vBNzDkBmrjJ2DwXZL4qXprcznuh/j+K1UdnJpYIe8lQ/5eQmiuTKLvWEG/OsgkpD6D
         DY0x1uoQTqyrCtgTNWBxzQzYqxzZikbLdfnemN0SJzjwdzEjCdxzhmn2U9tOXyONmkuL
         8z8XVwKFviy+yizXonnjw1gMDmcF06shqfxFzm7P7neuJVFjJpzjX+nGFS15oo32p7no
         CN6kksukHhvxkVkFyWAbg+iJJ/PP5bs+i1b7VE0aqF1uWNrTNtdwGP9Urlw7PeN0XMvJ
         lbaosjg6vb6mDtFpcrZ2CiaROLOFIzmZn1MHFpZUUUL++EsvRl/FYRY1OE4iH0VF6oQF
         MaMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=p7r68AuXsMfU77fU2UE8Y3Y09All7chVKxAfJMcbRE0=;
        b=ehsBI4NyB7MRmH7W24kSNhonhXwocZIU5R84Y01DDU83T5H3SxRNZLjJaSJvcRfHU8
         RVcrthDeocSt2CFnmxDfqFUGhX2FWnxFg9Ww4uu/GTXMMhuiB8Dc0MvssnO0DTPbjvC0
         HKFAGkbIBpVDsurkGmJ97pfdjo3xqf8RYky8d5nqHXyu9q3BJlb6SMrzy4/phFnT0Dv1
         GXWABNfhwxwrth0RN7e1Ip0EX2PVXXB2wFKD4QD/XDUbJMHvicux2Jg1lsAdWgmhob3l
         UPf3cdXUqWNy9uo6fA9gE8nkbUSvnm5XE6N6q2yjCpufyrJBkeV4XCdF1z82kpt5gpfc
         hUsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ddD8JVRu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hb23si3949910ejb.377.2019.10.23.11.16.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 11:16:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ddD8JVRu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNLAy-00046B-NS
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 14:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60036)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKXm-00061T-33
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:35:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iNKXj-0002iE-KT
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:35:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52919
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iNKXj-0002gz-Gx
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 13:35:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571852131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p7r68AuXsMfU77fU2UE8Y3Y09All7chVKxAfJMcbRE0=;
 b=ddD8JVRu/QfI3seOB79rCihnYzseNFToIcnDO0kkD/e6AL1aFSofdWFDJTHOsGtHQ2PlJi
 Kl6SZVFi2CxA/MUnitTW8m03UvfIb1+PUlFat2ERGTjCpmneCmq00MlRr+JEpNpf9Dto9a
 n6ENuJd/53/SIgcls3b08vDfUXkmaLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-N1RHAHmgN2GIlc349EJVYQ-1; Wed, 23 Oct 2019 13:35:24 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D2C51005512;
 Wed, 23 Oct 2019 17:35:22 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 691775DAAF;
 Wed, 23 Oct 2019 17:35:16 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 29/33] omap-intc: remove PROP_PTR
Date: Wed, 23 Oct 2019 19:31:50 +0200
Message-Id: <20191023173154.30051-30-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-1-marcandre.lureau@redhat.com>
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: N1RHAHmgN2GIlc349EJVYQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-TUID: wunzwmorWv6o

Since clocks are not QOM objects, replace PROP_PTR of clocks with
setters methods.

(in theory there should probably be different methods for omap1 &
omap2 intc, but this is left as a future improvement)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/arm/omap1.c        |  4 ++--
 hw/arm/omap2.c        |  4 ++--
 hw/intc/omap_intc.c   | 17 ++++++++++-------
 include/hw/arm/omap.h | 14 ++++++++++++++
 4 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 6ce038a453..1afd1d3d7f 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -3889,7 +3889,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryRegio=
n *dram,
=20
     s->ih[0] =3D qdev_create(NULL, "omap-intc");
     qdev_prop_set_uint32(s->ih[0], "size", 0x100);
-    qdev_prop_set_ptr(s->ih[0], "clk", omap_findclk(s, "arminth_ck"));
+    omap_intc_set_iclk(OMAP_INTC(s->ih[0]), omap_findclk(s, "arminth_ck"))=
;
     qdev_init_nofail(s->ih[0]);
     busdev =3D SYS_BUS_DEVICE(s->ih[0]);
     sysbus_connect_irq(busdev, 0,
@@ -3899,7 +3899,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryRegio=
n *dram,
     sysbus_mmio_map(busdev, 0, 0xfffecb00);
     s->ih[1] =3D qdev_create(NULL, "omap-intc");
     qdev_prop_set_uint32(s->ih[1], "size", 0x800);
-    qdev_prop_set_ptr(s->ih[1], "clk", omap_findclk(s, "arminth_ck"));
+    omap_intc_set_iclk(OMAP_INTC(s->ih[1]), omap_findclk(s, "arminth_ck"))=
;
     qdev_init_nofail(s->ih[1]);
     busdev =3D SYS_BUS_DEVICE(s->ih[1]);
     sysbus_connect_irq(busdev, 0,
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index 457f152bac..1d7cc435ef 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -2308,8 +2308,8 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRegi=
on *sdram,
     /* Actually mapped at any 2K boundary in the ARM11 private-peripheral =
if */
     s->ih[0] =3D qdev_create(NULL, "omap2-intc");
     qdev_prop_set_uint8(s->ih[0], "revision", 0x21);
-    qdev_prop_set_ptr(s->ih[0], "fclk", omap_findclk(s, "mpu_intc_fclk"));
-    qdev_prop_set_ptr(s->ih[0], "iclk", omap_findclk(s, "mpu_intc_iclk"));
+    omap_intc_set_fclk(OMAP_INTC(s->ih[0]), omap_findclk(s, "mpu_intc_fclk=
"));
+    omap_intc_set_iclk(OMAP_INTC(s->ih[0]), omap_findclk(s, "mpu_intc_iclk=
"));
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
@@ -391,9 +387,18 @@ static void omap_intc_realize(DeviceState *dev, Error =
**errp)
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
@@ -647,8 +652,6 @@ static void omap2_intc_realize(DeviceState *dev, Error =
**errp)
 static Property omap2_intc_properties[] =3D {
     DEFINE_PROP_UINT8("revision", struct omap_intr_handler_s,
     revision, 0x21),
-    DEFINE_PROP_PTR("iclk", struct omap_intr_handler_s, iclk),
-    DEFINE_PROP_PTR("fclk", struct omap_intr_handler_s, fclk),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index f3aa670036..bcecf19f89 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -67,6 +67,20 @@ void omap_clk_setrate(omap_clk clk, int divide, int mult=
iply);
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
+/*
+ * TODO: Ideally we should have a clock framework that
+ * let us wire these clocks up with QOM properties or links.
+ */
+void omap_intc_set_iclk(omap_intr_handler *intc, omap_clk clk);
+void omap_intc_set_fclk(omap_intr_handler *intc, omap_clk clk);
+
 /* OMAP2 l4 Interconnect */
 struct omap_l4_s;
 struct omap_l4_region_s {
--=20
2.23.0.606.g08da6496b6

