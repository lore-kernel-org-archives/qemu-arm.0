Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2602394wru;
        Mon, 1 Jul 2019 05:32:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxgU520ZvgNI8ZmVcAycRQvUxv/iins/Db2+4ZKCGE1nfGj24pPFNVuoQm+M4GULLAmanyU
X-Received: by 2002:a50:a3ec:: with SMTP id t41mr28750215edb.43.1561984322570;
        Mon, 01 Jul 2019 05:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561984322; cv=none;
        d=google.com; s=arc-20160816;
        b=bF1mJ2aSXEFoA2tnBQJgrYzqcQ3MhDr1qX3PB/iWTQEH87cxfivSP9x6Y3zALxgG6u
         4jiZjjhmUZbEFnL0Gh230tRKI2XW0pXDNCV0g1CxvVwvxW2UpR2jNXHtFa/SYaB2Z4fY
         GRMa20HAxC0FbQgI5Fal+J9HyClE6eV3wwZiSuUb2uZ/lHgX3+teZAJpGCyHE8oknKPN
         sgDblg+mjN9wqlDXffmxsMUYNsJnlGNaT8c1fJPlm9N29sJzeFAe23SO0OZFEJkudQhv
         BgXozuZ01Zm3GnvujcM/CTE26GrlwJJ2C5nRXmEYg2nSrOl2jC7z0J1jhD+k1YsQpBaG
         soHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=6V13yAbT/9wrvS/64bDVpYzUz3XONF2jfvRYXEJlbCs=;
        b=X4nVfXMlxo6AtNals9OmiHVefFWNfth8j7eTmFbNNHLMJaGANr0e1jcKw+2oyqZBPn
         PdAoVYuc04lZ0b4AH46W1EdKlLpkG2tOvCkEWj6wnZCy6dUNpjiP4f29yF/nFsbYPz2H
         MqinDtP6LhS6/KeXLeNbbZkn8IAAGTUblfsv4IyvMlcIB8zjgHi+MivrtHZMvMKjY8ID
         RWb4muPJeFjGtATjCrjVKLm+1cmlIyjfMcTku0n2RBMW61/0PPUYQgcbRx7lgzEW/rhn
         Gp0NDkvzJ+vGa2ES1PTnkgX9jcCbGSUyaU1Uc5ZMEfKaG7ohh5BoynsJRFrNkh6FNPaY
         EJuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13si8646842eda.130.2019.07.01.05.32.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 05:32:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhvTV-0005zE-Gl
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 08:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57576)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hhvT0-0005xX-O2
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 08:31:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hhvSy-0002ZA-49
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 08:31:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47906)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hhvSx-0002YJ-Qq; Mon, 01 Jul 2019 08:31:28 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 065C13162908;
 Mon,  1 Jul 2019 12:31:27 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FFBA17CC0;
 Mon,  1 Jul 2019 12:31:20 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Jul 2019 14:31:03 +0200
Message-Id: <20190701123108.12493-2-philmd@redhat.com>
In-Reply-To: <20190701123108.12493-1-philmd@redhat.com>
References: <20190701123108.12493-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Mon, 01 Jul 2019 12:31:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/6] hw/arm: Use ARM_CPU_TYPE_NAME() macro when
 appropriate
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
X-TUID: Z7tys5rFPApD

Commit ba1ba5cca introduce the ARM_CPU_TYPE_NAME() macro.
Unify the code base by use it in all places.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/allwinner-a10.c | 3 ++-
 hw/arm/cubieboard.c    | 3 ++-
 hw/arm/digic.c         | 3 ++-
 hw/arm/fsl-imx6.c      | 3 ++-
 hw/arm/fsl-imx6ul.c    | 3 ++-
 hw/arm/xlnx-zynqmp.c   | 8 ++++----
 6 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 35e906ca54..49d4d76686 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -28,7 +28,8 @@ static void aw_a10_init(Object *obj)
     AwA10State *s =3D AW_A10(obj);
=20
     object_initialize_child(obj, "cpu", &s->cpu, sizeof(s->cpu),
-                            "cortex-a8-" TYPE_ARM_CPU, &error_abort, NUL=
L);
+                            ARM_CPU_TYPE_NAME("cortex-a8"),
+                            &error_abort, NULL);
=20
     sysbus_init_child_obj(obj, "intc", &s->intc, sizeof(s->intc),
                           TYPE_AW_A10_PIC);
diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index f7c8a5985a..a4d3d7a6a0 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -80,7 +80,8 @@ static void cubieboard_init(MachineState *machine)
=20
 static void cubieboard_machine_init(MachineClass *mc)
 {
-    mc->desc =3D "cubietech cubieboard";
+    mc->desc =3D "cubietech cubieboard (Cortex-A9)";
+    mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a9");
     mc->init =3D cubieboard_init;
     mc->block_default_type =3D IF_IDE;
     mc->units_per_default_bus =3D 1;
diff --git a/hw/arm/digic.c b/hw/arm/digic.c
index 9015b60c23..05db06be5e 100644
--- a/hw/arm/digic.c
+++ b/hw/arm/digic.c
@@ -36,7 +36,8 @@ static void digic_init(Object *obj)
     int i;
=20
     object_initialize_child(obj, "cpu", &s->cpu, sizeof(s->cpu),
-                            "arm946-" TYPE_ARM_CPU, &error_abort, NULL);
+                            ARM_CPU_TYPE_NAME("arm946"),
+                            &error_abort, NULL);
=20
     for (i =3D 0; i < DIGIC4_NB_TIMERS; i++) {
 #define DIGIC_TIMER_NAME_MLEN    11
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 7129517378..9b259c54b3 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -40,7 +40,8 @@ static void fsl_imx6_init(Object *obj)
     for (i =3D 0; i < MIN(smp_cpus, FSL_IMX6_NUM_CPUS); i++) {
         snprintf(name, NAME_SIZE, "cpu%d", i);
         object_initialize_child(obj, name, &s->cpu[i], sizeof(s->cpu[i])=
,
-                                "cortex-a9-" TYPE_ARM_CPU, &error_abort,=
 NULL);
+                                ARM_CPU_TYPE_NAME("cortex-a9"),
+                                &error_abort, NULL);
     }
=20
     sysbus_init_child_obj(obj, "a9mpcore", &s->a9mpcore, sizeof(s->a9mpc=
ore),
diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index 05505bac56..1cbd8674bf 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -35,7 +35,8 @@ static void fsl_imx6ul_init(Object *obj)
     for (i =3D 0; i < MIN(smp_cpus, FSL_IMX6UL_NUM_CPUS); i++) {
         snprintf(name, NAME_SIZE, "cpu%d", i);
         object_initialize_child(obj, name, &s->cpu[i], sizeof(s->cpu[i])=
,
-                                "cortex-a7-" TYPE_ARM_CPU, &error_abort,=
 NULL);
+                                ARM_CPU_TYPE_NAME("cortex-a7"),
+                                &error_abort, NULL);
     }
=20
     /*
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index a1ca9b5adf..2acd032df6 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -193,8 +193,8 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s=
, const char *boot_cpu,
=20
         object_initialize_child(OBJECT(&s->rpu_cluster), "rpu-cpu[*]",
                                 &s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
-                                "cortex-r5f-" TYPE_ARM_CPU, &error_abort=
,
-                                NULL);
+                                ARM_CPU_TYPE_NAME("cortex-r5f"),
+                                &error_abort, NULL);
=20
         name =3D object_get_canonical_path_component(OBJECT(&s->rpu_cpu[=
i]));
         if (strcmp(name, boot_cpu)) {
@@ -233,8 +233,8 @@ static void xlnx_zynqmp_init(Object *obj)
     for (i =3D 0; i < num_apus; i++) {
         object_initialize_child(OBJECT(&s->apu_cluster), "apu-cpu[*]",
                                 &s->apu_cpu[i], sizeof(s->apu_cpu[i]),
-                                "cortex-a53-" TYPE_ARM_CPU, &error_abort=
,
-                                NULL);
+                                ARM_CPU_TYPE_NAME("cortex-a53"),
+                                &error_abort, NULL);
     }
=20
     sysbus_init_child_obj(obj, "gic", &s->gic, sizeof(s->gic),
--=20
2.20.1

