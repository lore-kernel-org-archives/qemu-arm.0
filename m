Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp146383wrq;
        Tue, 22 Oct 2019 09:38:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw4kNtA1lEVwAKqqIDnEq5baSLZfIZ5/IOzRFoQNHCAq/kjElPvt82RKsrBlrSZb7mpB2WK
X-Received: by 2002:a05:6402:149a:: with SMTP id e26mr31960429edv.123.1571762290042;
        Tue, 22 Oct 2019 09:38:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571762290; cv=none;
        d=google.com; s=arc-20160816;
        b=DJ6u7o5Ah009mmu1TsUc1RGsBB/yCG0QD3qCroWz89G3OHKK2xar/o2awdioleh/PJ
         7zC0N15pJkMUHbUrpoNoVN93LGhUICjKgHOqL63M9REeaRV+FsBatHm2x/q8bEp/xv2p
         i70anDqLWSaX2MWN6dAwoAfKouZ/vX+AWxZmccfBarPxoU0K3m2g/p+SEEcqlbvDHYne
         BQ8Ucslm3bZb29+Rnnyy6unESJ1MMPtWcDzsiwnqnqkVYRrrT6v7TJUqk8Fwze9ZYDei
         F8bF3nd7flMmVoQhfddeguHHfaKBnRkklXd+oeFN+1oGF3FJ9ww6h1az/t0aKmCUkx0o
         Px0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KVUJzhtSHVFJVm9GCImiFn7d34MIIMIDbiXCgMcrOJw=;
        b=ajxMmIg5CadW1Idqrj0Fi7nhJltyrJXPfgvlWS9XQnm07MbhzfFwjr5P42ZywVMhIl
         jV7L5T18F2r/q6YS++YnzOVc8jI4xFUBPqenm2wooXJSvogX9HM1hv7gzpKhhMFeQZQo
         sOuzsRKjrjSnMoCUyUo4jo5RIdLurhiRgqos6kMZz8+zM3gDbiD1gUXOqrW2pgfgatKK
         6h02BeeXepIPvdl9cdwTlyhmydVyQY46TZ5DOTkUnODmbsCwZMxM5Ud4UVmIoeGvSQVe
         u+/7mIssKKfMTUVaZ5HztQpeSlQR41Piv+shKWdlUX1gsimDDloTWyNPO/sTLCGqUZo2
         gq6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JOxotoGK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8si1085496edf.428.2019.10.22.09.38.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 09:38:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JOxotoGK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMxAe-0006py-Ga
	for alex.bennee@linaro.org; Tue, 22 Oct 2019 12:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38924)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iMwxn-0000co-H6
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 12:24:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iMwxm-00085g-4A
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 12:24:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51761
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iMwxm-00085P-02
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 12:24:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571761489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KVUJzhtSHVFJVm9GCImiFn7d34MIIMIDbiXCgMcrOJw=;
 b=JOxotoGKL2OFLpMyFm6ZD1dtvntaVDACoI2KquBAEjlJDjKNmDHjJztaAHN+lIiQlUJUBq
 EcZ27XZwbwIVHCNrHZ+stG9PVIXp0BsBmcieijbZakMUtg5PfAMUHB3M7b9ujq+UFXdkQr
 n243ONFpuDyUIq2A8sCULsnIz5oe8Jc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-6xjsH9LKML6IQXiifrL3Eg-1; Tue, 22 Oct 2019 12:24:45 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46729107AD31;
 Tue, 22 Oct 2019 16:24:42 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A9385D6B0;
 Tue, 22 Oct 2019 16:24:35 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/28] omap-intc: remove PROP_PTR
Date: Tue, 22 Oct 2019 18:21:33 +0200
Message-Id: <20191022162137.27161-25-marcandre.lureau@redhat.com>
In-Reply-To: <20191022162137.27161-1-marcandre.lureau@redhat.com>
References: <20191022162137.27161-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 6xjsH9LKML6IQXiifrL3Eg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-TUID: UPfBegUWkWRu

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
index 0400593805..c5583b10e0 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -3891,7 +3891,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryRegio=
n *system_memory,
=20
     s->ih[0] =3D qdev_create(NULL, "omap-intc");
     qdev_prop_set_uint32(s->ih[0], "size", 0x100);
-    qdev_prop_set_ptr(s->ih[0], "clk", omap_findclk(s, "arminth_ck"));
+    omap_intc_set_iclk(OMAP_INTC(s->ih[0]), omap_findclk(s, "arminth_ck"))=
;
     qdev_init_nofail(s->ih[0]);
     busdev =3D SYS_BUS_DEVICE(s->ih[0]);
     sysbus_connect_irq(busdev, 0,
@@ -3901,7 +3901,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryRegio=
n *system_memory,
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
index bd7ddff983..726a628e64 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -2311,8 +2311,8 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRegi=
on *sysmem,
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
index 2fda996648..5cf3b5ba14 100644
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

