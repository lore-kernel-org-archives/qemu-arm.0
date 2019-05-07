Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3840566wrh;
        Tue, 7 May 2019 09:43:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzZHQEC+7dgIVhgveiee7kL2DMEiz/qIp9n1eqtDdDWsKPvyydVn/7tVPJ0xlWx1gZrKYoR
X-Received: by 2002:a1c:9d8b:: with SMTP id g133mr4318575wme.20.1557247386867;
        Tue, 07 May 2019 09:43:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557247386; cv=none;
        d=google.com; s=arc-20160816;
        b=oBxEzA1Ajsi2qmUSyF8PYx+pmYR0vqMyR2/UUjK9srhGw9tz7PyONY/8chKd8WU9Gt
         TxxaJVijDoTXGRlDE8SUEHq8VnD7T3e6npqMWlKpC//m5tK7/UqcyZeO48fQnSEPVzHJ
         eIrvagZwWxPI0H5PhQfFz5dcDw5ZpiGEAorEjYPhbfSs3xlA/CLzTdPxfGT3XIVOFtvv
         7RGYY/tREvNTxLusLlSzpQ3WPCJ1zw4hnhkbU5Hxbt89oCMmKIz9/HJym1nHYLKUKKVZ
         6wY2YpvcshYSwWB/UTLa1TroyuGJClmpXC+438vhiyfNnNvi+ojU1vHyahNnlNYqi+tO
         9oKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=XCjLYCikjNvB73AW0wINVz1NtprR5tqojp9tj1EdAbM=;
        b=mSbFab6UFiMQ11KGmbvgP1BFdNSZpb/+b8zs5CfGJLpI8S2ngel/GibWwYBJPMn1ad
         bGNbflaHWpVfAD2UEi8eBq0lEBgC1dr9mmc199d7ImsmchmXQJVmCL23ZdE9Uqj2BmoY
         DN5m6OD4GRFdgNiuhz9ez/jrD4VQC7mB7B4SCndjjtYkDVebCo+09l7ETBkMpAY+t3vE
         LKV34aDivXXuQqAd5Y6J5Y/bjT8RJXQ+sMeHfGYGVLkUp6TH1iSB60bpumIqNKeRE5Ma
         tWvhSEJsxAfC98hbrzfJXzF0nYuLg/zzxLxAPjQnDpfTSdcsT0Yzwjx+v03ukJpEUedq
         sEiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m18si9965271wrw.339.2019.05.07.09.43.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 09:43:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49891 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hO3BJ-00084B-Qf
	for alex.bennee@linaro.org; Tue, 07 May 2019 12:43:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO37E-0004bg-86
	for qemu-devel@nongnu.org; Tue, 07 May 2019 12:38:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO37D-0005fg-1O
	for qemu-devel@nongnu.org; Tue, 07 May 2019 12:38:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47272)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hO37A-0005ct-Ez; Tue, 07 May 2019 12:38:48 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 862C62DA988;
	Tue,  7 May 2019 16:38:47 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-58.brq.redhat.com [10.40.204.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E8458171;
	Tue,  7 May 2019 16:38:37 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Date: Tue,  7 May 2019 18:34:15 +0200
Message-Id: <20190507163416.24647-16-philmd@redhat.com>
In-Reply-To: <20190507163416.24647-1-philmd@redhat.com>
References: <20190507163416.24647-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 07 May 2019 16:38:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 15/16] hw/arm/mps2: Use
 object_initialize_child for correct reference counting
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Paul Burton <pburton@wavecomp.com>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Joel Stanley <joel@jms.id.au>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d0iJnlF2Th4c

As explained in commit aff39be0ed97:

  Both functions, object_initialize() and object_property_add_child()
  increase the reference counter of the new object, so one of the
  references has to be dropped afterwards to get the reference
  counting right. Otherwise the child object will not be properly
  cleaned up when the parent gets destroyed.
  Thus let's use now object_initialize_child() instead to get the
  reference counting here right.

This patch was generated using the following Coccinelle script:

 @use_sysbus_init_child_obj_missing_parent@
 expression child_ptr;
 expression child_type;
 expression child_size;
 @@
 -   object_initialize(child_ptr, child_size, child_type);
     ...
 -   qdev_set_parent_bus(DEVICE(child_ptr), sysbus_get_default());
     ...
 ?-  object_unref(OBJECT(child_ptr));
 +   sysbus_init_child_obj(OBJECT(PARENT_OBJ), "CHILD_NAME", child_ptr,
 +                         child_size, child_type);

We let the MPS2 boards adopt the cpu core, the FPGA and the SCC children.

While the object_initialize() function doesn't take an
'Error *errp' argument, the object_initialize_child() does.
Since this code is used when a machine is created (and is not
yet running), we deliberately choose to use the &error_abort
argument instead of ignoring errors if an object creation failed.
This choice also matches when using sysbus_init_child_obj(),
since its code is:

  void sysbus_init_child_obj(Object *parent,
                             const char *childname, void *child,
                             size_t childsize, const char *childtype)
  {
      object_initialize_child(parent, childname, child, childsize,
                              childtype, &error_abort, NULL);

      qdev_set_parent_bus(DEVICE(child), sysbus_get_default());
  }

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Inspired-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/mps2-tz.c | 8 ++++----
 hw/arm/mps2.c    | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 7832408bb70..82dce1a7b38 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -214,9 +214,9 @@ static MemoryRegion *make_scc(MPS2TZMachineState *mms=
, void *opaque,
     DeviceState *sccdev;
     MPS2TZMachineClass *mmc =3D MPS2TZ_MACHINE_GET_CLASS(mms);
=20
-    object_initialize(scc, sizeof(mms->scc), TYPE_MPS2_SCC);
+    sysbus_init_child_obj(OBJECT(mms), "scc", scc,
+                          sizeof(mms->scc), TYPE_MPS2_SCC);
     sccdev =3D DEVICE(scc);
-    qdev_set_parent_bus(sccdev, sysbus_get_default());
     qdev_prop_set_uint32(sccdev, "scc-cfg4", 0x2);
     qdev_prop_set_uint32(sccdev, "scc-aid", 0x00200008);
     qdev_prop_set_uint32(sccdev, "scc-id", mmc->scc_id);
@@ -229,8 +229,8 @@ static MemoryRegion *make_fpgaio(MPS2TZMachineState *=
mms, void *opaque,
 {
     MPS2FPGAIO *fpgaio =3D opaque;
=20
-    object_initialize(fpgaio, sizeof(mms->fpgaio), TYPE_MPS2_FPGAIO);
-    qdev_set_parent_bus(DEVICE(fpgaio), sysbus_get_default());
+    sysbus_init_child_obj(OBJECT(mms), "fpgaio", fpgaio,
+                          sizeof(mms->fpgaio), TYPE_MPS2_FPGAIO);
     object_property_set_bool(OBJECT(fpgaio), true, "realized", &error_fa=
tal);
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(fpgaio), 0);
 }
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 54b7395849f..ecb8ae3c14c 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -174,9 +174,9 @@ static void mps2_common_init(MachineState *machine)
         g_assert_not_reached();
     }
=20
-    object_initialize(&mms->armv7m, sizeof(mms->armv7m), TYPE_ARMV7M);
+    sysbus_init_child_obj(OBJECT(mms), "armv7m", &mms->armv7m,
+                          sizeof(mms->armv7m), TYPE_ARMV7M);
     armv7m =3D DEVICE(&mms->armv7m);
-    qdev_set_parent_bus(armv7m, sysbus_get_default());
     switch (mmc->fpga_type) {
     case FPGA_AN385:
         qdev_prop_set_uint32(armv7m, "num-irq", 32);
@@ -308,9 +308,9 @@ static void mps2_common_init(MachineState *machine)
                        qdev_get_gpio_in(armv7m, 10));
     sysbus_mmio_map(SYS_BUS_DEVICE(&mms->dualtimer), 0, 0x40002000);
=20
-    object_initialize(&mms->scc, sizeof(mms->scc), TYPE_MPS2_SCC);
+    sysbus_init_child_obj(OBJECT(mms), "scc", &mms->scc,
+                          sizeof(mms->scc), TYPE_MPS2_SCC);
     sccdev =3D DEVICE(&mms->scc);
-    qdev_set_parent_bus(sccdev, sysbus_get_default());
     qdev_prop_set_uint32(sccdev, "scc-cfg4", 0x2);
     qdev_prop_set_uint32(sccdev, "scc-aid", 0x00200008);
     qdev_prop_set_uint32(sccdev, "scc-id", mmc->scc_id);
--=20
2.20.1

