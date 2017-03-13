Received: by 10.25.77.4 with SMTP id a4csp1275147lfb;
        Mon, 13 Mar 2017 11:05:42 -0700 (PDT)
X-Received: by 10.200.45.112 with SMTP id o45mr36453122qta.92.1489428342322;
        Mon, 13 Mar 2017 11:05:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u8si994448qtc.229.2017.03.13.11.05.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Mar 2017 11:05:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53670 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cnULj-0003lw-Kt
	for alex.bennee@linaro.org; Mon, 13 Mar 2017 14:05:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cnULX-0003jX-EF
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 14:05:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cnULU-0001KD-5y
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 14:05:27 -0400
Received: from mail.kernel.org ([198.145.29.136]:50684)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1cnULT-0001Ju-SF; Mon, 13 Mar 2017 14:05:24 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id AF1B8203B1;
	Mon, 13 Mar 2017 18:05:21 +0000 (UTC)
Received: from localhost.localdomain (bzq-79-180-56-222.red.bezeqint.net
	[79.180.56.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id DE5CE203B0;
	Mon, 13 Mar 2017 18:05:17 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon, 13 Mar 2017 20:04:28 +0200
Message-Id: <20170313180432.7067-2-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170313180432.7067-1-krzk@kernel.org>
References: <20170313180432.7067-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-arm] [PATCH v2 1/5] hw/intc/exynos4210_gic: Fix GIC memory
 mappings for secondary CPU
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a1ruPhNJav5Q

Recent Linux kernel (tested next-20170224) was complaining about missing
GIC mask and was unable to bring up secondary CPU:

    [ =C2=A0 =C2=A00.000000] NR_IRQS:16 nr_irqs:16 16
    [    0.000000] GIC CPU mask not found - kernel will fail to boot.
    ...
    [ =C2=A0 =C2=A00.400492] smp: Bringing up secondary CPUs ...
    [ =C2=A0 =C2=A01.413184] CPU1: failed to boot: -110
    [ =C2=A0 =C2=A01.423981] smp: Brought up 1 node, 1 CPU

In its instance_init() call, the Exynos GIC driver was setting GIC
memory mappings for each CPU, from 1 up to "num-cpu" property.  The
Exynos4210 machine init call on the other hand, first created Exynos GIC
device and then set the "num-cpu" property which was too late.  The init
already happened with default "num-cpu" value of 1 thus GIC mappings
were created only for the first CPU.

Split the Exynos GIC init code into realize function so the code will
see updated "num-cpu" property.  This fixes the warning and brings
second CPU:
    [    0.435780] CPU1: thread -1, cpu 1, socket 9, mpidr 80000901
    [    0.451838] smp: Brought up 1 node, 2 CPUs

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/exynos4210_gic.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index 2a55817b7660..222cfd6c6387 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -283,9 +283,20 @@ static void exynos4210_gic_set_irq(void *opaque, int=
 irq, int level)
=20
 static void exynos4210_gic_init(Object *obj)
 {
-    DeviceState *dev =3D DEVICE(obj);
     Exynos4210GicState *s =3D EXYNOS4210_GIC(obj);
-    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
+
+    memory_region_init(&s->cpu_container, obj, "exynos4210-cpu-container=
",
+            EXYNOS4210_EXT_GIC_CPU_REGION_SIZE);
+    memory_region_init(&s->dist_container, obj, "exynos4210-dist-contain=
er",
+            EXYNOS4210_EXT_GIC_DIST_REGION_SIZE);
+
+}
+
+static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
+{
+    Exynos4210GicState *s =3D EXYNOS4210_GIC(dev);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
+    Object *obj =3D OBJECT(dev);
     uint32_t i;
     const char cpu_prefix[] =3D "exynos4210-gic-alias_cpu";
     const char dist_prefix[] =3D "exynos4210-gic-alias_dist";
@@ -306,11 +317,6 @@ static void exynos4210_gic_init(Object *obj)
     qdev_init_gpio_in(dev, exynos4210_gic_set_irq,
                       EXYNOS4210_GIC_NIRQ - 32);
=20
-    memory_region_init(&s->cpu_container, obj, "exynos4210-cpu-container=
",
-            EXYNOS4210_EXT_GIC_CPU_REGION_SIZE);
-    memory_region_init(&s->dist_container, obj, "exynos4210-dist-contain=
er",
-            EXYNOS4210_EXT_GIC_DIST_REGION_SIZE);
-
     for (i =3D 0; i < s->num_cpu; i++) {
         /* Map CPU interface per SMP Core */
         sprintf(cpu_alias_name, "%s%x", cpu_prefix, i);
@@ -346,6 +352,7 @@ static void exynos4210_gic_class_init(ObjectClass *kl=
ass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
+    dc->realize =3D exynos4210_gic_realize;
     dc->props =3D exynos4210_gic_properties;
 }
=20
--=20
2.9.3

