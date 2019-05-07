Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3836781wrh;
        Tue, 7 May 2019 09:39:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzXtiFXUEyJ5qYyWqOb3Dxz2EPOvDvcooCBVOru5cRoSZFv0r+9jPvi7SnjPOlfqfq6tc5G
X-Received: by 2002:a7b:ca50:: with SMTP id m16mr7665092wml.104.1557247157398;
        Tue, 07 May 2019 09:39:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557247157; cv=none;
        d=google.com; s=arc-20160816;
        b=DzLtz4yVllcbnIOABuK2aV1S1bL+KrhszzD5u+lfI6hgO7xDD1JBADR3XkE2Df8XMJ
         CNe8pDVNt3Q7JTkQquw+BOqvGzugQEpIfwPiFl/zi0/HxDD+z+bTnDW2W32xmq5Vgipw
         I4AcI8HmVtBV5Pi3Hp75nQloPnezHjYuW5qu0RNLQ9Y61wUu2Pxh6To22XEMz13jxcc3
         p+6ZnWjC8XREKrlDjYPGPdERPkDEZJPapsSWFsmqU4caclQz7KEonSBHf3PEYqtleP3b
         GG9vL2paFsNNZHltIBd5wWbeHojy6s8/v6yP67YxLybebsGl8vyCWLmm/abdpyy4Ab+H
         +zmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=MVpAYcarMvGI0w9Fa/gz/loZG8Bdz+pXZDW4dSaIaNw=;
        b=pxJQSdA9JptIrJR1wRLiJfC2ZgLQ7IAVA02Ge5GB5RbMTNMRbWKoFUUmSNrU3F3jdV
         9qDRlStErR7XfFepD2MA6uf4qRPZlQm5C170St3g9ZK0WuUQ3fKwsb/hzgiOr0AaQAso
         RzY8RFW+gdpYdeorXNpAs7YDjYiKJ9/iBBHk+7gkfHroRjwu2vinmJTVHJScJkoiitxJ
         W1WeheBlOzUiigQ0wpt2nvmSCgaQ5It4WNrQiWsNAozslu+tm82FGY163vF7pq0XGvVP
         FB3VPfXCohtwshSf5cDPc+Hu8pWXqB33Nmn5CKxl0WV7tn8ag+5ltkbBGmG2TMWOlvlt
         bNKw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4si6969557wrv.26.2019.05.07.09.39.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 09:39:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49816 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hO37c-0004j3-Cy
	for alex.bennee@linaro.org; Tue, 07 May 2019 12:39:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO365-0003Zo-8e
	for qemu-arm@nongnu.org; Tue, 07 May 2019 12:37:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hO364-0004UZ-2i
	for qemu-arm@nongnu.org; Tue, 07 May 2019 12:37:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41688)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hO363-0004Te-RM; Tue, 07 May 2019 12:37:40 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E2751369C4;
	Tue,  7 May 2019 16:37:38 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-58.brq.redhat.com [10.40.204.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCAE18164;
	Tue,  7 May 2019 16:37:29 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Date: Tue,  7 May 2019 18:34:12 +0200
Message-Id: <20190507163416.24647-13-philmd@redhat.com>
In-Reply-To: <20190507163416.24647-1-philmd@redhat.com>
References: <20190507163416.24647-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 07 May 2019 16:37:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 12/16] hw/microblaze/zynqmp: Let the SoC
 manage the IPI devices
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
	Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-ppc@nongnu.org,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bcsGNZEXgHUW

The Inter Processor Interrupt is a block part of the SoC, not the
"machine" (See Zynq UltraScale+ Device TRM UG1085, "Platform
Management Unit", Power Domains and Islands).

Move the IPI management from the machine to the SoC.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/microblaze/xlnx-zynqmp-pmu.c | 36 +++++++++++++++------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-=
pmu.c
index eba9945c19b..20e973edf5f 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -68,6 +68,13 @@ static void xlnx_zynqmp_pmu_soc_init(Object *obj)
=20
     sysbus_init_child_obj(obj, "intc", &s->intc, sizeof(s->intc),
                           TYPE_XLNX_PMU_IO_INTC);
+
+    /* Create the IPI device */
+    for (int i =3D 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
+        object_initialize(&s->ipi[i], sizeof(XlnxZynqMPIPI),
+                          TYPE_XLNX_ZYNQMP_IPI);
+        qdev_set_parent_bus(DEVICE(&s->ipi[i]), sysbus_get_default());
+    }
 }
=20
 static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
@@ -113,6 +120,15 @@ static void xlnx_zynqmp_pmu_soc_realize(DeviceState =
*dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->intc), 0, XLNX_ZYNQMP_PMU_INTC_AD=
DR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->intc), 0,
                        qdev_get_gpio_in(DEVICE(&s->cpu), MB_CPU_IRQ));
+
+    /* Connect the IPI device */
+    for (int i =3D 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
+        object_property_set_bool(OBJECT(&s->ipi[i]), true, "realized",
+                                 &error_abort);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ipi[i]), 0, ipi_addr[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->ipi[i]), 0,
+                           qdev_get_gpio_in(DEVICE(&s->intc), ipi_irq[i]=
));
+    }
 }
=20
 static void xlnx_zynqmp_pmu_soc_class_init(ObjectClass *oc, void *data)
@@ -145,8 +161,6 @@ static void xlnx_zynqmp_pmu_init(MachineState *machin=
e)
     MemoryRegion *address_space_mem =3D get_system_memory();
     MemoryRegion *pmu_rom =3D g_new(MemoryRegion, 1);
     MemoryRegion *pmu_ram =3D g_new(MemoryRegion, 1);
-    qemu_irq irq[32];
-    int i;
=20
     /* Create the ROM */
     memory_region_init_rom(pmu_rom, NULL, "xlnx-zynqmp-pmu.rom",
@@ -166,24 +180,6 @@ static void xlnx_zynqmp_pmu_init(MachineState *machi=
ne)
                               &error_abort);
     object_property_set_bool(OBJECT(pmu), true, "realized", &error_fatal=
);
=20
-    for (i =3D 0; i < 32; i++) {
-        irq[i] =3D qdev_get_gpio_in(DEVICE(&pmu->intc), i);
-    }
-
-    /* Create and connect the IPI device */
-    for (i =3D 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
-        object_initialize(&pmu->ipi[i], sizeof(XlnxZynqMPIPI),
-                          TYPE_XLNX_ZYNQMP_IPI);
-        qdev_set_parent_bus(DEVICE(&pmu->ipi[i]), sysbus_get_default());
-    }
-
-    for (i =3D 0; i < XLNX_ZYNQMP_PMU_NUM_IPIS; i++) {
-        object_property_set_bool(OBJECT(&pmu->ipi[i]), true, "realized",
-                                 &error_abort);
-        sysbus_mmio_map(SYS_BUS_DEVICE(&pmu->ipi[i]), 0, ipi_addr[i]);
-        sysbus_connect_irq(SYS_BUS_DEVICE(&pmu->ipi[i]), 0, irq[ipi_irq[=
i]]);
-    }
-
     /* Load the kernel */
     microblaze_load_kernel(&pmu->cpu, XLNX_ZYNQMP_PMU_RAM_ADDR,
                            machine->ram_size,
--=20
2.20.1

