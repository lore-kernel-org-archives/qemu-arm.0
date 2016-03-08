Received: by 10.25.208.211 with SMTP id h202csp2132782lfg;
        Tue, 8 Mar 2016 12:08:31 -0800 (PST)
X-Received: by 10.140.42.106 with SMTP id b97mr38727322qga.6.1457467711226;
        Tue, 08 Mar 2016 12:08:31 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 39si4618596qkp.31.2016.03.08.12.08.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Mar 2016 12:08:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=neutral (body hash did not verify) header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:37007 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adNvi-00087o-GF
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 15:08:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52750)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1adNt9-0003sx-Q5
	for qemu-devel@nongnu.org; Tue, 08 Mar 2016 15:05:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1adNt5-0004HN-GR
	for qemu-devel@nongnu.org; Tue, 08 Mar 2016 15:05:51 -0500
Received: from mail-bl2on0106.outbound.protection.outlook.com
	([65.55.169.106]:6208
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1adNt5-0004H3-Ak; Tue, 08 Mar 2016 15:05:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=cd88gZI/dnloyH91ym30h9bMBd7X3A+FEXvmISk2cg8=;
	b=nz7y+E4nYLohteRIJ6XrUfi1IMAaRNUMIuXyGJnV/JExSBpapdz7hrwxyy57aSu3CoErLVRC2tq0nGJTqq/eFazQ/oH1UqOI4Qhuug3swbK6Tch/whewavzVTXAK5iTy8inszywX/B7NQiYixZKMLj2GeqwhCzEgzMvt7lcnFII=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8::5f2)
	by BLUPR0301MB2036.namprd03.prod.outlook.com (10.164.22.26) with
	Microsoft
	SMTP Server (TLS) id 15.1.427.16; Tue, 8 Mar 2016 20:05:44 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 8 Mar 2016 12:05:24 -0800
Message-ID: <1457467526-8840-4-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1457467526-8840-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1457467526-8840-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:4898:80e8::5f2]
X-ClientProxiedBy: BY1PR10CA0031.namprd10.prod.outlook.com (25.160.197.41) To
	BLUPR0301MB2036.namprd03.prod.outlook.com (25.164.22.26)
X-MS-Office365-Filtering-Correlation-Id: 023a074c-e60a-4500-240d-08d3478d08f4
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2036;
	2:h9qplFpqZmD53sD/O9/NI9c42ZxVUTho0+f0oZgRuSZvzVMZVWYYhfc7LF1i/EgexvPKHWUtzv6ImEDf1dhFeNjpMZcnsbVUXyv/PIE6ZxPISNUu5b9Neq5dW8akA8Cj5Yl7pAVjxIXG4qrbiEAwjIoHWh65Ss5k+qnQl2QaJJOPLgZ3pMFk9Io5hxYjiaP8;
	3:iSLToR2wbJgTZRyxnNe3flBN3h2RSJYkfoCMpVzFM9a/LBMw6QOkcifS2Jy0O+sJkeG5c+J2cqLo6QUwB31u8hHnpoGjga4QbnJEeylnwtqpV4+B/QKZ7bkn8NRwOrrm;
	25:gMB7/MAFAZcDR3D2WhSfPhEZxv1rupRAFAJJY7A98bcJCrLtYchkkRBbfnWQ6QxcXCYv9KcgRshHk6i/fLGUijxA4OM/rxyUKb5wKgNNM6jum6xYsf2L3Oij7xqiic2ycvtvYfBs72HR4vW9SORMkXNGn8yRMhRxV6OUqaCEPFAeWaWZZ+1jdC4+N8WuzY2sbFCTGosB853vuJ5Igs2CjYddazx2kWmFYNykdLGU9hdnwITiuYY5Va+6NArVcq3cTEGCWc2hp+KACZx2s1bbnQ9ZBeREb9g3wA1KZFR2Pl1RwZ/uLUaT9ZgaOUbPKNoCL27HVJIoaOW3aWVHE0EtwQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2036;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2036;
	20:xNJ4R6t37pZmsGxzUYl7ftRc6UU+v8RyY7onULFplLq0pmkAeQLNaLlfT/NrVANZm81wwYW0PvnSjXsDHoMq8N/SryJH7G6THWuQQ9ALJ6Mj/4uiDWj3athlY05UUROGXQTCbVcvJN4ZX6XsPZrvmq0OGMCNLinwfnCO+o/K3HUGy/HgRiun2By4s/eh3GYKVokI94It66ifw1UiycScD3Lr+JstrNXdcF2NMzRgxPjrwM6jmdp3kUkz7/mQSwl91lsMFaCQcLbREgJQqf1xH7sd8L9u4AkOFg5ymIB5fcQdWu+JknGnBvJEZe3uszvl2ZHTfYCwTKlV6wLbuuwpodpkD7aMeMI9K5gpjeOs8RXWcNn3/AgW4wWCkuNekzkIq3bPtOIr3WMjyFImfiHtQCjk/mXrAcnpDCOQl+IYaAFaA83lcJ7rvixLrIlVjUz1cTCEYSL302yDqZ/ni/o1+MPrYal7HI7ZRCMgj0PLcndfz5BIs/u6hm2L2xtdhQPq;
	4:EbYqVGEyWBMBtJKnegwUiyLmFwcQGbU+1YcYJHIU5UNEwMMax1hijmfH+f7hy2TAaC3lIYOtwp4irLn3h4tw4Z+E4FSXc7JrJTIvHqJvCRtJ2kwzWN5Bj0D6+nWKi5SuYumz+45noORIVTuz2jF6Io1RJZzCpxC+NKrE/UHtdfqTXJZekuhObjC4QmCgYcJnmXzW4LHl3ijoasJb8PEwBwyFaF41D7vtMZVZasXFx4STWFJjHkO1cdQRAdY8DbgOME8IuQLw9GomLScTghZV4fblpmoUFMFiDbS0bMjctk91j1pWAjHEWNKeu7cpfhkj4TATyFqDAW5IPe/1lN8aFGybFvvOUJgMYCam8uuaozrpxOxvZeutUe8i9ZrIqP7t
X-Microsoft-Antispam-PRVS: <BLUPR0301MB203681E7D89BF4BAD60B8B3D9EB20@BLUPR0301MB2036.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:BLUPR0301MB2036; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2036; 
X-Forefront-PRVS: 08756AC3C8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(10290500002)(47776003)(5005710100001)(2950100001)(86362001)(575784001)(189998001)(86612001)(36756003)(10090500001)(19580395003)(42186005)(2906002)(6116002)(23676002)(586003)(2870700001)(5008740100001)(4001430100002)(50986999)(5820100001)(76176999)(92566002)(50466002)(77096005)(2351001)(229853001)(15975445007)(19580405001)(110136002)(107886002)(5004730100002)(81166005)(1096002)(4326007)(50226001)(2004002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2036;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2036;
	23:11aA0Fd2Z7t4PNSRnKf8tovIi8tHNiQ1wzhDE2V?=
	=?us-ascii?Q?1KIy5ZnNkTWFY2S7UEyVuglxEiuoewJWH0MiMhglPwgWvBZezRV/dDHvW4MR?=
	=?us-ascii?Q?6UEhJt2NJWDcd1eAHcZobOIoZfTffhueg5Dk0Mviim0aM2F7vF3+lV9YAbKb?=
	=?us-ascii?Q?nts+iabheqASDQu3io0FFQTscrrctXS8fx5He0x4L+V6sIEXW6ZbgpZ4JDBB?=
	=?us-ascii?Q?2N6GD3M1TvGkMLTFm06ku2ogJDZ/pJGfZwhiOkb9gjg0Z9zfrnIz/zns6Wik?=
	=?us-ascii?Q?13tFfz4vEa1EvczeYbRPrAja7LG5jqKav72FkM5PQ8zWAev25LS9Skjo9ZpI?=
	=?us-ascii?Q?Nea9ODYxudZ6PChEM6uoHDVbsJQiXhOJOr8f80hLHS2mX81cyQruxxSjhaf0?=
	=?us-ascii?Q?nbNr+HKTV3hEC0EhabvawS/QbUZFCHHKOrqEz52486jxmn1cYVOJcoyjVsvB?=
	=?us-ascii?Q?sj3cSiib4p1wuOMQgHskR00lh/x79ynTiXB3MwdVdTuzCgPyJNPTErhao+Nz?=
	=?us-ascii?Q?G4XcalkOsjcCc/Hx/UBfqM31ejpJV0v5A7FAZlf7a3jz+cyU7nKl54FEO4Ki?=
	=?us-ascii?Q?sg2JoKD0tJpRb4UPnBLdeNYlE6zgcHZJ+JkX5ydBdqvCBVzCu1u3YmPnYVsa?=
	=?us-ascii?Q?vQ0NgFPU3iun2TfEm+SNs5kFaCL7fJdaPSsRzVJQNwdHgsadMbb2ht2cD5+a?=
	=?us-ascii?Q?KEYR0z+YTaqIMt3SyPr+N1R5wcqhkFny8GPP94u4oiD09qpvcHDktGPlnrSB?=
	=?us-ascii?Q?gXAgaXgoUfMrzzv+AviO61nQULnMnRiu4SiZ6RFi0E7JfdWbEaEbMdWmtY6s?=
	=?us-ascii?Q?mNJHnOTxQLheJZHEccoZySN2wcOgZ80UniSZFFjWLvpc35PP28qBeKU7Mjo4?=
	=?us-ascii?Q?qZCsEQ4xWni+q2yabbyU3tjRfB8wZyY9zXRFX1ZBWm+pvRFahrkZby0UiFUy?=
	=?us-ascii?Q?nDsTcoqX/L58+uygliGncpDntOv/eSEgRxVUR2WI4GYdFjZ4b/33MlkNocbw?=
	=?us-ascii?Q?PaAzYuHMgk5LioRr1GU0pAdS91QVZVcg6/W0zNr5oH6pa+aVnsAYj/XorYeg?=
	=?us-ascii?Q?XuSqq+370ZXtYQY9+fFnG6RuaMnOo?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2036;
	5:j6XA0Pvk+bVrOPvKtw2ETFKHwmZkOt2bgVzZRAORRAr3TNavzoXEW5cFixoI6+0i/3LV2sqSCt83RMnlh2MMNv7iVJ6syjbUGiXDz+OJJnxKxu065G++n1pEh5+9SYuQAS58uvirJn7GUxpD47mAmg==;
	24:DtYPOlVgn02hgX7IfZrIL2zcqlsUm8hjBYIOLYI0jYqvfIUg34bb0/gwnh8AukFRSZ39vTDPLl6qeoYakhwmkaLOf1o00PBAiwsH6gYBGU8=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2016 20:05:44.6523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2036
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.106
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH v3 3/5] bcm2835_fb: add framebuffer device for
	Raspberry Pi
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bDSvMk9soKS7

From: Gr=C3=A9gory ESTRADE <gregory.estrade@gmail.com>

The framebuffer occupies the upper portion of memory (64MiB by
default), but it can only be controlled/configured via a system
mailbox or property channel (to be added by a subsequent patch).

Signed-off-by: Gr=C3=A9gory ESTRADE <gregory.estrade@gmail.com>
[AB: added Windows (BGR) support and cleanup/refactoring for upstream submi=
ssion]
Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---

Notes:
    v2:
     * avoid ldl_phys
     * move code to increase default pi2 memory size back to the final patc=
h

 hw/arm/bcm2835_peripherals.c         |  38 +++-
 hw/arm/bcm2836.c                     |   2 +
 hw/arm/raspi.c                       |   5 +-
 hw/display/Makefile.objs             |   1 +
 hw/display/bcm2835_fb.c              | 424 +++++++++++++++++++++++++++++++=
++++
 include/hw/arm/bcm2835_peripherals.h |   2 +
 include/hw/display/bcm2835_fb.h      |  47 ++++
 7 files changed, 517 insertions(+), 2 deletions(-)
 create mode 100644 hw/display/bcm2835_fb.c
 create mode 100644 include/hw/display/bcm2835_fb.h

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index d6453cc..c2fe6b7 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -62,6 +62,16 @@ static void bcm2835_peripherals_init(Object *obj)
     object_property_add_const_link(OBJECT(&s->mboxes), "mbox-mr",
                                    OBJECT(&s->mbox_mr), &error_abort);
=20
+    /* Framebuffer */
+    object_initialize(&s->fb, sizeof(s->fb), TYPE_BCM2835_FB);
+    object_property_add_child(obj, "fb", OBJECT(&s->fb), NULL);
+    object_property_add_alias(obj, "vcram-size", OBJECT(&s->fb), "vcram-si=
ze",
+                              &error_abort);
+    qdev_set_parent_bus(DEVICE(&s->fb), sysbus_get_default());
+
+    object_property_add_const_link(OBJECT(&s->fb), "dma-mr",
+                                   OBJECT(&s->gpu_bus_mr), &error_abort);
+
     /* Property channel */
     object_initialize(&s->property, sizeof(s->property), TYPE_BCM2835_PROP=
ERTY);
     object_property_add_child(obj, "property", OBJECT(&s->property), NULL)=
;
@@ -84,7 +94,7 @@ static void bcm2835_peripherals_realize(DeviceState *dev,=
 Error **errp)
     Object *obj;
     MemoryRegion *ram;
     Error *err =3D NULL;
-    uint32_t ram_size;
+    uint32_t ram_size, vcram_size;
     CharDriverState *chr;
     int n;
=20
@@ -174,6 +184,32 @@ static void bcm2835_peripherals_realize(DeviceState *d=
ev, Error **errp)
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_ARM_IRQ,
                                INTERRUPT_ARM_MAILBOX));
=20
+    /* Framebuffer */
+    vcram_size =3D (uint32_t)object_property_get_int(OBJECT(s), "vcram-siz=
e",
+                                                   &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    object_property_set_int(OBJECT(&s->fb), ram_size - vcram_size,
+                            "vcram-base", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    object_property_set_bool(OBJECT(&s->fb), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    memory_region_add_subregion(&s->mbox_mr, MBOX_CHAN_FB << MBOX_AS_CHAN_=
SHIFT,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->fb), 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->fb), 0,
+                       qdev_get_gpio_in(DEVICE(&s->mboxes), MBOX_CHAN_FB))=
;
+
     /* Property channel */
     object_property_set_int(OBJECT(&s->property), ram_size, "ram-size", &e=
rr);
     if (err) {
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 0321439..89a6b35 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -42,6 +42,8 @@ static void bcm2836_init(Object *obj)
                               &error_abort);
     object_property_add_alias(obj, "board-rev", OBJECT(&s->peripherals),
                               "board-rev", &error_abort);
+    object_property_add_alias(obj, "vcram-size", OBJECT(&s->peripherals),
+                              "vcram-size", &error_abort);
     qdev_set_parent_bus(DEVICE(&s->peripherals), sysbus_get_default());
 }
=20
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 6582279..5498209 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -113,6 +113,7 @@ static void setup_boot(MachineState *machine, int versi=
on, size_t ram_size)
 static void raspi2_init(MachineState *machine)
 {
     RasPiState *s =3D g_new0(RasPiState, 1);
+    uint32_t vcram_size;
     DriveInfo *di;
     BlockBackend *blk;
     BusState *bus;
@@ -149,7 +150,9 @@ static void raspi2_init(MachineState *machine)
     qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
     object_property_set_bool(OBJECT(carddev), true, "realized", &error_fat=
al);
=20
-    setup_boot(machine, 2, machine->ram_size);
+    vcram_size =3D object_property_get_int(OBJECT(&s->soc), "vcram-size",
+                                         &error_abort);
+    setup_boot(machine, 2, machine->ram_size - vcram_size);
 }
=20
 static void raspi2_machine_init(MachineClass *mc)
diff --git a/hw/display/Makefile.objs b/hw/display/Makefile.objs
index f0cf431..d99780e 100644
--- a/hw/display/Makefile.objs
+++ b/hw/display/Makefile.objs
@@ -27,6 +27,7 @@ endif
 obj-$(CONFIG_OMAP) +=3D omap_dss.o
 obj-$(CONFIG_OMAP) +=3D omap_lcdc.o
 obj-$(CONFIG_PXA2XX) +=3D pxa2xx_lcd.o
+obj-$(CONFIG_RASPI) +=3D bcm2835_fb.o
 obj-$(CONFIG_SM501) +=3D sm501.o
 obj-$(CONFIG_TCX) +=3D tcx.o
 obj-$(CONFIG_CG3) +=3D cg3.o
diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
new file mode 100644
index 0000000..779b56f
--- /dev/null
+++ b/hw/display/bcm2835_fb.c
@@ -0,0 +1,424 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * Refactoring for Pi2 Copyright (c) 2015, Microsoft. Written by Andrew Ba=
umann.
+ * This code is licensed under the GNU GPLv2 and later.
+ *
+ * Heavily based on milkymist-vgafb.c, copyright terms below:
+ *  QEMU model of the Milkymist VGA framebuffer.
+ *
+ *  Copyright (c) 2010-2012 Michael Walle <michael@walle.cc>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licens=
es/>.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "hw/display/bcm2835_fb.h"
+#include "hw/display/framebuffer.h"
+#include "ui/pixel_ops.h"
+#include "hw/misc/bcm2835_mbox_defs.h"
+
+#define DEFAULT_VCRAM_SIZE 0x4000000
+#define BCM2835_FB_OFFSET  0x00100000
+
+static void fb_invalidate_display(void *opaque)
+{
+    BCM2835FBState *s =3D BCM2835_FB(opaque);
+
+    s->invalidate =3D true;
+}
+
+static void draw_line_src16(void *opaque, uint8_t *dst, const uint8_t *src=
,
+                            int width, int deststep)
+{
+    BCM2835FBState *s =3D opaque;
+    uint16_t rgb565;
+    uint32_t rgb888;
+    uint8_t r, g, b;
+    DisplaySurface *surface =3D qemu_console_surface(s->con);
+    int bpp =3D surface_bits_per_pixel(surface);
+
+    while (width--) {
+        switch (s->bpp) {
+        case 8:
+            /* lookup palette starting at video ram base
+             * TODO: cache translation, rather than doing this each time!
+             */
+            rgb888 =3D ldl_le_phys(&s->dma_as, s->vcram_base + (*src << 2)=
);
+            r =3D (rgb888 >> 0) & 0xff;
+            g =3D (rgb888 >> 8) & 0xff;
+            b =3D (rgb888 >> 16) & 0xff;
+            src++;
+            break;
+        case 16:
+            rgb565 =3D lduw_le_p(src);
+            r =3D ((rgb565 >> 11) & 0x1f) << 3;
+            g =3D ((rgb565 >>  5) & 0x3f) << 2;
+            b =3D ((rgb565 >>  0) & 0x1f) << 3;
+            src +=3D 2;
+            break;
+        case 24:
+            rgb888 =3D ldl_le_p(src);
+            r =3D (rgb888 >> 0) & 0xff;
+            g =3D (rgb888 >> 8) & 0xff;
+            b =3D (rgb888 >> 16) & 0xff;
+            src +=3D 3;
+            break;
+        case 32:
+            rgb888 =3D ldl_le_p(src);
+            r =3D (rgb888 >> 0) & 0xff;
+            g =3D (rgb888 >> 8) & 0xff;
+            b =3D (rgb888 >> 16) & 0xff;
+            src +=3D 4;
+            break;
+        default:
+            r =3D 0;
+            g =3D 0;
+            b =3D 0;
+            break;
+        }
+
+        if (s->pixo =3D=3D 0) {
+            /* swap to BGR pixel format */
+            uint8_t tmp =3D r;
+            r =3D b;
+            b =3D tmp;
+        }
+
+        switch (bpp) {
+        case 8:
+            *dst++ =3D rgb_to_pixel8(r, g, b);
+            break;
+        case 15:
+            *(uint16_t *)dst =3D rgb_to_pixel15(r, g, b);
+            dst +=3D 2;
+            break;
+        case 16:
+            *(uint16_t *)dst =3D rgb_to_pixel16(r, g, b);
+            dst +=3D 2;
+            break;
+        case 24:
+            rgb888 =3D rgb_to_pixel24(r, g, b);
+            *dst++ =3D rgb888 & 0xff;
+            *dst++ =3D (rgb888 >> 8) & 0xff;
+            *dst++ =3D (rgb888 >> 16) & 0xff;
+            break;
+        case 32:
+            *(uint32_t *)dst =3D rgb_to_pixel32(r, g, b);
+            dst +=3D 4;
+            break;
+        default:
+            return;
+        }
+    }
+}
+
+static void fb_update_display(void *opaque)
+{
+    BCM2835FBState *s =3D opaque;
+    DisplaySurface *surface =3D qemu_console_surface(s->con);
+    int first =3D 0;
+    int last =3D 0;
+    int src_width =3D 0;
+    int dest_width =3D 0;
+
+    if (s->lock || !s->xres) {
+        return;
+    }
+
+    src_width =3D s->xres * (s->bpp >> 3);
+    dest_width =3D s->xres;
+
+    switch (surface_bits_per_pixel(surface)) {
+    case 0:
+        return;
+    case 8:
+        break;
+    case 15:
+        dest_width *=3D 2;
+        break;
+    case 16:
+        dest_width *=3D 2;
+        break;
+    case 24:
+        dest_width *=3D 3;
+        break;
+    case 32:
+        dest_width *=3D 4;
+        break;
+    default:
+        hw_error("bcm2835_fb: bad color depth\n");
+        break;
+    }
+
+    if (s->invalidate) {
+        framebuffer_update_memory_section(&s->fbsection, s->dma_mr, s->bas=
e,
+                                          s->yres, src_width);
+    }
+
+    framebuffer_update_display(surface, &s->fbsection, s->xres, s->yres,
+                               src_width, dest_width, 0, s->invalidate,
+                               draw_line_src16, s, &first, &last);
+
+    if (first >=3D 0) {
+        dpy_gfx_update(s->con, 0, first, s->xres, last - first + 1);
+    }
+
+    s->invalidate =3D false;
+}
+
+static void bcm2835_fb_mbox_push(BCM2835FBState *s, uint32_t value)
+{
+    value &=3D ~0xf;
+
+    s->lock =3D true;
+
+    s->xres =3D ldl_le_phys(&s->dma_as, value);
+    s->yres =3D ldl_le_phys(&s->dma_as, value + 4);
+    s->xres_virtual =3D ldl_le_phys(&s->dma_as, value + 8);
+    s->yres_virtual =3D ldl_le_phys(&s->dma_as, value + 12);
+    s->bpp =3D ldl_le_phys(&s->dma_as, value + 20);
+    s->xoffset =3D ldl_le_phys(&s->dma_as, value + 24);
+    s->yoffset =3D ldl_le_phys(&s->dma_as, value + 28);
+
+    s->base =3D s->vcram_base | (value & 0xc0000000);
+    s->base +=3D BCM2835_FB_OFFSET;
+
+    /* TODO - Manage properly virtual resolution */
+
+    s->pitch =3D s->xres * (s->bpp >> 3);
+    s->size =3D s->yres * s->pitch;
+
+    stl_le_phys(&s->dma_as, value + 16, s->pitch);
+    stl_le_phys(&s->dma_as, value + 32, s->base);
+    stl_le_phys(&s->dma_as, value + 36, s->size);
+
+    s->invalidate =3D true;
+    qemu_console_resize(s->con, s->xres, s->yres);
+    s->lock =3D false;
+}
+
+void bcm2835_fb_reconfigure(BCM2835FBState *s, uint32_t *xres, uint32_t *y=
res,
+                            uint32_t *xoffset, uint32_t *yoffset, uint32_t=
 *bpp,
+                            uint32_t *pixo, uint32_t *alpha)
+{
+    s->lock =3D true;
+
+    /* TODO: input validation! */
+    if (xres) {
+        s->xres =3D *xres;
+    }
+    if (yres) {
+        s->yres =3D *yres;
+    }
+    if (xoffset) {
+        s->xoffset =3D *xoffset;
+    }
+    if (yoffset) {
+        s->yoffset =3D *yoffset;
+    }
+    if (bpp) {
+        s->bpp =3D *bpp;
+    }
+    if (pixo) {
+        s->pixo =3D *pixo;
+    }
+    if (alpha) {
+        s->alpha =3D *alpha;
+    }
+
+    /* TODO - Manage properly virtual resolution */
+
+    s->pitch =3D s->xres * (s->bpp >> 3);
+    s->size =3D s->yres * s->pitch;
+
+    s->invalidate =3D true;
+    qemu_console_resize(s->con, s->xres, s->yres);
+    s->lock =3D false;
+}
+
+static uint64_t bcm2835_fb_read(void *opaque, hwaddr offset, unsigned size=
)
+{
+    BCM2835FBState *s =3D opaque;
+    uint32_t res =3D 0;
+
+    switch (offset) {
+    case MBOX_AS_DATA:
+        res =3D MBOX_CHAN_FB;
+        s->pending =3D false;
+        qemu_set_irq(s->mbox_irq, 0);
+        break;
+
+    case MBOX_AS_PENDING:
+        res =3D s->pending;
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+                      __func__, offset);
+        return 0;
+    }
+
+    return res;
+}
+
+static void bcm2835_fb_write(void *opaque, hwaddr offset, uint64_t value,
+                             unsigned size)
+{
+    BCM2835FBState *s =3D opaque;
+
+    switch (offset) {
+    case MBOX_AS_DATA:
+        /* bcm2835_mbox should check our pending status before pushing */
+        assert(!s->pending);
+        s->pending =3D true;
+        bcm2835_fb_mbox_push(s, value);
+        qemu_set_irq(s->mbox_irq, 1);
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+                      __func__, offset);
+        return;
+    }
+}
+
+static const MemoryRegionOps bcm2835_fb_ops =3D {
+    .read =3D bcm2835_fb_read,
+    .write =3D bcm2835_fb_write,
+    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .valid.min_access_size =3D 4,
+    .valid.max_access_size =3D 4,
+};
+
+static const VMStateDescription vmstate_bcm2835_fb =3D {
+    .name =3D TYPE_BCM2835_FB,
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_BOOL(lock, BCM2835FBState),
+        VMSTATE_BOOL(invalidate, BCM2835FBState),
+        VMSTATE_BOOL(pending, BCM2835FBState),
+        VMSTATE_UINT32(xres, BCM2835FBState),
+        VMSTATE_UINT32(yres, BCM2835FBState),
+        VMSTATE_UINT32(xres_virtual, BCM2835FBState),
+        VMSTATE_UINT32(yres_virtual, BCM2835FBState),
+        VMSTATE_UINT32(xoffset, BCM2835FBState),
+        VMSTATE_UINT32(yoffset, BCM2835FBState),
+        VMSTATE_UINT32(bpp, BCM2835FBState),
+        VMSTATE_UINT32(base, BCM2835FBState),
+        VMSTATE_UINT32(pitch, BCM2835FBState),
+        VMSTATE_UINT32(size, BCM2835FBState),
+        VMSTATE_UINT32(pixo, BCM2835FBState),
+        VMSTATE_UINT32(alpha, BCM2835FBState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static const GraphicHwOps vgafb_ops =3D {
+    .invalidate  =3D fb_invalidate_display,
+    .gfx_update  =3D fb_update_display,
+};
+
+static void bcm2835_fb_init(Object *obj)
+{
+    BCM2835FBState *s =3D BCM2835_FB(obj);
+
+    memory_region_init_io(&s->iomem, obj, &bcm2835_fb_ops, s, TYPE_BCM2835=
_FB,
+                          0x10);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+    sysbus_init_irq(SYS_BUS_DEVICE(s), &s->mbox_irq);
+}
+
+static void bcm2835_fb_reset(DeviceState *dev)
+{
+    BCM2835FBState *s =3D BCM2835_FB(dev);
+
+    s->pending =3D false;
+
+    s->xres_virtual =3D s->xres;
+    s->yres_virtual =3D s->yres;
+    s->xoffset =3D 0;
+    s->yoffset =3D 0;
+    s->base =3D s->vcram_base + BCM2835_FB_OFFSET;
+    s->pitch =3D s->xres * (s->bpp >> 3);
+    s->size =3D s->yres * s->pitch;
+
+    s->invalidate =3D true;
+    s->lock =3D false;
+}
+
+static void bcm2835_fb_realize(DeviceState *dev, Error **errp)
+{
+    BCM2835FBState *s =3D BCM2835_FB(dev);
+    Error *err =3D NULL;
+    Object *obj;
+
+    if (s->vcram_base =3D=3D 0) {
+        error_setg(errp, "%s: required vcram-base property not set", __fun=
c__);
+        return;
+    }
+
+    obj =3D object_property_get_link(OBJECT(dev), "dma-mr", &err);
+    if (obj =3D=3D NULL) {
+        error_setg(errp, "%s: required dma-mr link not found: %s",
+                   __func__, error_get_pretty(err));
+        return;
+    }
+
+    s->dma_mr =3D MEMORY_REGION(obj);
+    address_space_init(&s->dma_as, s->dma_mr, NULL);
+
+    bcm2835_fb_reset(dev);
+
+    s->con =3D graphic_console_init(dev, 0, &vgafb_ops, s);
+    qemu_console_resize(s->con, s->xres, s->yres);
+}
+
+static Property bcm2835_fb_props[] =3D {
+    DEFINE_PROP_UINT32("vcram-base", BCM2835FBState, vcram_base, 0),/*requ=
ired*/
+    DEFINE_PROP_UINT32("vcram-size", BCM2835FBState, vcram_size,
+                       DEFAULT_VCRAM_SIZE),
+    DEFINE_PROP_UINT32("xres", BCM2835FBState, xres, 640),
+    DEFINE_PROP_UINT32("yres", BCM2835FBState, yres, 480),
+    DEFINE_PROP_UINT32("bpp", BCM2835FBState, bpp, 16),
+    DEFINE_PROP_UINT32("pixo", BCM2835FBState, pixo, 1), /* 1=3DRGB, 0=3DB=
GR */
+    DEFINE_PROP_UINT32("alpha", BCM2835FBState, alpha, 2), /* alpha ignore=
d */
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static void bcm2835_fb_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->props =3D bcm2835_fb_props;
+    dc->realize =3D bcm2835_fb_realize;
+    dc->reset =3D bcm2835_fb_reset;
+    dc->vmsd =3D &vmstate_bcm2835_fb;
+}
+
+static TypeInfo bcm2835_fb_info =3D {
+    .name          =3D TYPE_BCM2835_FB,
+    .parent        =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(BCM2835FBState),
+    .class_init    =3D bcm2835_fb_class_init,
+    .instance_init =3D bcm2835_fb_init,
+};
+
+static void bcm2835_fb_register_types(void)
+{
+    type_register_static(&bcm2835_fb_info);
+}
+
+type_init(bcm2835_fb_register_types)
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_=
peripherals.h
index 889adf5..e19d360 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -15,6 +15,7 @@
 #include "exec/address-spaces.h"
 #include "hw/sysbus.h"
 #include "hw/char/bcm2835_aux.h"
+#include "hw/display/bcm2835_fb.h"
 #include "hw/intc/bcm2835_ic.h"
 #include "hw/misc/bcm2835_property.h"
 #include "hw/misc/bcm2835_mbox.h"
@@ -35,6 +36,7 @@ typedef struct BCM2835PeripheralState {
=20
     SysBusDevice *uart0;
     BCM2835AuxState aux;
+    BCM2835FBState fb;
     BCM2835ICState ic;
     BCM2835PropertyState property;
     BCM2835MboxState mboxes;
diff --git a/include/hw/display/bcm2835_fb.h b/include/hw/display/bcm2835_f=
b.h
new file mode 100644
index 0000000..9a12d7a
--- /dev/null
+++ b/include/hw/display/bcm2835_fb.h
@@ -0,0 +1,47 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * Upstreaming code cleanup [including bcm2835_*] (c) 2013 Jan Petrous
+ *
+ * Rasperry Pi 2 emulation and refactoring Copyright (c) 2015, Microsoft
+ * Written by Andrew Baumann
+ *
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#ifndef BCM2835_FB_H
+#define BCM2835_FB_H
+
+#include "hw/sysbus.h"
+#include "exec/address-spaces.h"
+#include "ui/console.h"
+
+#define TYPE_BCM2835_FB "bcm2835-fb"
+#define BCM2835_FB(obj) OBJECT_CHECK(BCM2835FBState, (obj), TYPE_BCM2835_F=
B)
+
+typedef struct {
+    /*< private >*/
+    SysBusDevice busdev;
+    /*< public >*/
+
+    uint32_t vcram_base, vcram_size;
+    MemoryRegion *dma_mr;
+    AddressSpace dma_as;
+    MemoryRegion iomem;
+    MemoryRegionSection fbsection;
+    QemuConsole *con;
+    qemu_irq mbox_irq;
+
+    bool lock, invalidate, pending;
+    uint32_t xres, yres;
+    uint32_t xres_virtual, yres_virtual;
+    uint32_t xoffset, yoffset;
+    uint32_t bpp;
+    uint32_t base, pitch, size;
+    uint32_t pixo, alpha;
+} BCM2835FBState;
+
+void bcm2835_fb_reconfigure(BCM2835FBState *s, uint32_t *xres, uint32_t *y=
res,
+                            uint32_t *xoffset, uint32_t *yoffset, uint32_t=
 *bpp,
+                            uint32_t *pixo, uint32_t *alpha);
+
+#endif
--=20
2.7.0

