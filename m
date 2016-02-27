Received: by 10.25.208.211 with SMTP id h202csp88464lfg;
        Fri, 26 Feb 2016 16:21:20 -0800 (PST)
X-Received: by 10.55.74.209 with SMTP id x200mr5632436qka.106.1456532480201;
        Fri, 26 Feb 2016 16:21:20 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h34si15600881qgf.80.2016.02.26.16.21.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Feb 2016 16:21:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:52679 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZSdL-0000kV-Fr
	for alex.bennee@linaro.org; Fri, 26 Feb 2016 19:21:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aZScL-0007qP-D1
	for qemu-devel@nongnu.org; Fri, 26 Feb 2016 19:20:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aZScG-0001Qp-T5
	for qemu-devel@nongnu.org; Fri, 26 Feb 2016 19:20:17 -0500
Received: from mail-bn1bn0104.outbound.protection.outlook.com
	([157.56.110.104]:28336
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aZScG-0001Qk-Ly; Fri, 26 Feb 2016 19:20:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=cE+hkzisktja2SH4MfF0R6XBKjarfWbCOdZmEET9lpg=;
	b=jP+6pkfr279Z1S3h/2fGKpqw8MmRNOMp2bPyfHA2uwGCCGgjB8mSEBNHKPSQ+Syil7w9COiuoGSlPmy2Jtn0ba9aJLt6rwegvd3yRDftN/5tc0EErebzi0Zvx2SMRHX1QoUYkUBS/jQIIOst9xskagRTrVXpfRRCZVVXG9QAln0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:f::724)
	by SN1PR0301MB2046.namprd03.prod.outlook.com (10.163.226.155) with
	Microsoft
	SMTP Server (TLS) id 15.1.409.15; Sat, 27 Feb 2016 00:20:10 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 26 Feb 2016 16:16:13 -0800
Message-ID: <1456532174-17432-4-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1456532174-17432-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1456532174-17432-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:f::724]
X-ClientProxiedBy: CO2PR20CA0016.namprd20.prod.outlook.com (25.163.96.26) To
	SN1PR0301MB2046.namprd03.prod.outlook.com (25.163.226.155)
X-MS-Office365-Filtering-Correlation-Id: 7f66bcb1-1146-416e-638a-08d33f0bc11e
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	2:BXXDMGFlNSg3SZHi3rT0IPx62joTmJ8jVI6fkOzI6oFMG4oPhoILtA7ZDYQB75jAdWcmFxwP4ej+cp8uzvXoaGJSNr3Egp+98z8k72gnUZfoZ9fc3WwAGzPfDfor4a161r5hZC/55N7wZhPeopi1DqaU/wSz8n8PH+hYqLEb9uqN0jXOJpAjn5NCMx3xMUKJ;
	3:f7Zh0L65u4FZx6EQZxJYTorrQpFXECTpHRr/Ni1GKh8zFOJVpiwGHH8oDLtDaUntYxziy/Uo32SiBBCnUpWxtFbaqV4qrtsYI/fSxyCraPhzZkXmvSwdSTJPTS/YZZut;
	25:mus2Me4f/7cVT+/MGCzK6ck9BS9MVX7HASpUt9dAXUojmpi2Q247qURqr9FmnZR1eqme9XxIOnE3E2AIwkMdMOQcZN5sjsSsrIMXWB41gG9MRqFVcMBDBvkodyjqXOoKyUTX9Aaf0vbR5f+azLTb4yjz4AGBH/jFqnR0/MKoZRxQiayAgnmgDcuFMrdAUlcqtjbknz1PtH/fUbIhLLEbUgqgxy8ZH9rzgZTDY+xrlyHyasJLtUJxxIrHTh3Lg3beOsxzqZpUKgr1zgqyotXwDpy4vNYOoEDP3HIT281Qu93cmYdmNZv/yRGnxqBH3F60v/6o6tejGf6srIYBIafTJQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1PR0301MB2046;
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	20:woo948sffVGBVN7qpYM253IEL2SK3/ihPePe3eV6emPf8hxZ37l1W+deZ6VnNqf98GyJ3+e4FroutJlI9+xcg3Yzrclv5AJwoi24nR73R6R4O35Ft6mitmdTzuKj/d9xP5oMLwko4tdP0hpwjRhFMaHTzMGIw9xzPIUjghKM/FMsyhdRBWWJoSftWVQZUeM/Lic9k8UnvpTP2YWAkM9FyBO2D33hW7qenJu4f21/ytGhbQreblDUfep9KhyGnqHhmoM1kuyS3q8MXFbMMc3SHe+UDeG5eoNavAKjVAix2sCpsdUA8fCaoXPw0iXB0qz15P+QumEKp4I5I0tUXmsnvUaoecGHsycPMSsNNKfhg/r4h3weKTcVl5VGyCfnEOXDTUQf2A6yc4zSijXsYIrFgqauS52iEU+KMI3m4xOk+jLk+thSLENUTr53mHxCErgxH/n7waW8lwTMEYxHZDbNEZWpyi1/8Zk2EqjNdcpUV1FlY8GPBL2Laco4x/gBu2rU;
	4:gRYoD0PGbYDm3rGLGNOsFs5cAeDT9fpCx3H2S/3IUhmYZEA/sUhpSOJNfE+/82lnsPa/L0Q4GUYFaia2BSZ6UOhA1Dzg0zXGyMfEt3oJvfYqUXVnUFNe9Sk6JKjmrhi0KfGgwkzpAbKrtdGQ1wDhNa5p7uQBSk5Pzb2NMREukLZYjqm0wnrrSxAHHyjTzMYuyBkynfiB7LMbEwIp5jrHd/uMYBKFaIt0Ib4lpxXkXBgaHUCH6P1GTCNyUL3bU5jf3oLOeto1cPd/BReNpygfvZYR74wxMB/yvojIuEjxyLu+y7zZ7yZMJiBQAbUXtYvoligspobzERbjYvgyvD464MV9MW6SmmAiPLGPwmjGsf5PbfklSJHuhn7X4p2o56bX
X-Microsoft-Antispam-PRVS: <SN1PR0301MB20464A3C43A7C2B482B10A039EB80@SN1PR0301MB2046.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:SN1PR0301MB2046; BCL:0; PCL:0; RULEID:;
	SRVR:SN1PR0301MB2046; 
X-Forefront-PRVS: 086597191B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(36756003)(122386002)(87976001)(5003940100001)(10090500001)(86612001)(50226001)(40100003)(50986999)(575784001)(86362001)(76176999)(189998001)(4326007)(47776003)(5005710100001)(10290500002)(5008740100001)(4001430100002)(92566002)(2351001)(6116002)(229853001)(586003)(1096002)(15975445007)(42186005)(110136002)(19580405001)(50466002)(77096005)(2950100001)(2906002)(107886002)(19580395003)(5001960100002)(48376002)(2004002)(21314002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN1PR0301MB2046;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR0301MB2046;
	23:/9v5G4lC5uob5YgxQIW4Glvp/9oY47NUmz4ENLY?=
	=?us-ascii?Q?932hJnReCXm/h60zMByKAG+u3GG4nwUvBZBmVsHjsWLos7rboAmQCfGiQaI3?=
	=?us-ascii?Q?TRIWzo0sy7Q2y/denjqDz4hcY1cGiHgwpcLgLK3BG0pqKD8diBr8lIJLLLd2?=
	=?us-ascii?Q?Le0AVzeRizlH544oT8Kkz9A/kDMeDxnS9y9nBpr08Z1nYZRUfp59pvH4XglX?=
	=?us-ascii?Q?SiUV3fSMU6u+ZEeMCQasAMGFwqZ1ExybyIU55XNPZbFTPIfMSgr5EKnHEwu5?=
	=?us-ascii?Q?vSCzlQHjZWDUVfbkbKmOdhnYbzuribaudB4H6NfGoStxTNK/167tY2XBMZ2T?=
	=?us-ascii?Q?XVocNZimJzMcExgoG1VmvjjDOqE9K6E456yKOS3k4ghLtouqStcg62d0GIBf?=
	=?us-ascii?Q?UikjERWehk+tdQ4tdT4GgsaxYyNTwkgDYZqZAyag0ID6GUGy4s5mxhWGHEIr?=
	=?us-ascii?Q?iXEgBHXbiHGHFMjZokkvATKfSbFSzj78PJWzsxd7B0zZ/nr4GGhAGAqMucRJ?=
	=?us-ascii?Q?4DvuJKKZT2DcW90zTQS9z6h/EaaAYif8Tz01v+rlAUcOI+JjVHdNJ7wfwZUY?=
	=?us-ascii?Q?+5XP4Rp6VXWOisoDT211zTiQmAWYrXqO+XyPXumSxtNWSBVZa3oS9gnE5xTD?=
	=?us-ascii?Q?7QpRt+AtS6DnptC7w5J+Hd+rTNxE3Td5b3kyT4F/+DDZym34gX6qwiwi6myY?=
	=?us-ascii?Q?ap7IqGgd+7ELiqfNIiaQ3mAbtE1iGYAzjqY3bjGxbYdl/bBXiD1tBkLBipkE?=
	=?us-ascii?Q?4YIug3kFyhNunENjgXkBJkJkhwmT0GdRaf/CNJ0k6MgvJA87/b4tgdNvHUuU?=
	=?us-ascii?Q?cDuzCemNBPgLzihasvxUzKIHuDmJ6oB5qEfSS5p/5imu5moPRhFERIHPd/lM?=
	=?us-ascii?Q?LgSWjRveQaaBPy4z7J9R96Dsqr9crLUvQZ2KELwyBwMtslfulXrlF1oL81yI?=
	=?us-ascii?Q?REnYEta+1yweQELaH5ahYftNvktMULNK4SfsHttuTh6D62TJVGJ4fwe0M1jt?=
	=?us-ascii?Q?wcY+gQwVVyH8CHivOApNuRF16wDLgQIETZTlor8ioA3yX1C4Y6+OYTVPKhJh?=
	=?us-ascii?Q?PLGGNla5N0t9UwXMySFUo7fFLmCDYCCvrbHlSXJfwkxIPFjwfD3Gsv24Sups?=
	=?us-ascii?Q?6xFQlFdvIftc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	5:NnjBvSPRfEitOv5HJjSjvzkpGGFI7GVNzbjIDm+dTHrQ7OHaqwCfyiizu8nIygKmsxclbpjIXD7KtQs9q8an4mNwq7ulnfz5FtoKufEj7yimWKZPZ2ARrdDBhSGof3NJ03kr+kvr7kxVR1h60HClSg==;
	24:zt6JORNT+UI0ZsqAlc9zEcgc169+R/rfgpXtV6q0oceueOXSWyUokjsznlI8oJiS2Urj1Hn9elg2rqvbjPE/WoxX7k+ZsiQi+Y91tctFHrY=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2016 00:20:10.1243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR0301MB2046
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.104
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH 3/4] bcm2835_fb: add framebuffer device for
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
X-TUID: 5edjUuXo1UwQ

The framebuffer occupies the upper portion of memory (64MiB by
default), but it can only be controlled/configured via a system
mailbox or property channel (to be added by a subsequent patch).

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---
 hw/arm/bcm2835_peripherals.c         |  38 +++-
 hw/arm/bcm2836.c                     |   2 +
 hw/arm/raspi.c                       |  12 +-
 hw/display/Makefile.objs             |   1 +
 hw/display/bcm2835_fb.c              | 421 +++++++++++++++++++++++++++++++++++
 include/hw/arm/bcm2835_peripherals.h |   2 +
 include/hw/display/bcm2835_fb.h      |  47 ++++
 7 files changed, 515 insertions(+), 8 deletions(-)
 create mode 100644 hw/display/bcm2835_fb.c
 create mode 100644 include/hw/display/bcm2835_fb.h

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 103a330..eff4fa2 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -61,6 +61,16 @@ static void bcm2835_peripherals_init(Object *obj)
     object_property_add_const_link(OBJECT(&s->mboxes), "mbox-mr",
                                    OBJECT(&s->mbox_mr), &error_abort);
 
+    /* Framebuffer */
+    object_initialize(&s->fb, sizeof(s->fb), TYPE_BCM2835_FB);
+    object_property_add_child(obj, "fb", OBJECT(&s->fb), NULL);
+    object_property_add_alias(obj, "vcram-size", OBJECT(&s->fb), "vcram-size",
+                              &error_abort);
+    qdev_set_parent_bus(DEVICE(&s->fb), sysbus_get_default());
+
+    object_property_add_const_link(OBJECT(&s->fb), "dma-mr",
+                                   OBJECT(&s->gpu_bus_mr), &error_abort);
+
     /* Property channel */
     object_initialize(&s->property, sizeof(s->property), TYPE_BCM2835_PROPERTY);
     object_property_add_child(obj, "property", OBJECT(&s->property), NULL);
@@ -83,7 +93,7 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     Object *obj;
     MemoryRegion *ram;
     Error *err = NULL;
-    uint32_t ram_size;
+    uint32_t ram_size, vcram_size;
     int n;
 
     obj = object_property_get_link(OBJECT(dev), "ram", &err);
@@ -162,6 +172,32 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_ARM_IRQ,
                                INTERRUPT_ARM_MAILBOX));
 
+    /* Framebuffer */
+    vcram_size = (uint32_t)object_property_get_int(OBJECT(s), "vcram-size",
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
+    memory_region_add_subregion(&s->mbox_mr, MBOX_CHAN_FB << MBOX_AS_CHAN_SHIFT,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->fb), 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->fb), 0,
+                       qdev_get_gpio_in(DEVICE(&s->mboxes), MBOX_CHAN_FB));
+
     /* Property channel */
     object_property_set_int(OBJECT(&s->property), ram_size, "ram-size", &err);
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
 
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 6582279..83fe809 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -113,6 +113,7 @@ static void setup_boot(MachineState *machine, int version, size_t ram_size)
 static void raspi2_init(MachineState *machine)
 {
     RasPiState *s = g_new0(RasPiState, 1);
+    uint32_t vcram_size;
     DriveInfo *di;
     BlockBackend *blk;
     BusState *bus;
@@ -149,7 +150,9 @@ static void raspi2_init(MachineState *machine)
     qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
     object_property_set_bool(OBJECT(carddev), true, "realized", &error_fatal);
 
-    setup_boot(machine, 2, machine->ram_size);
+    vcram_size = object_property_get_int(OBJECT(&s->soc), "vcram-size",
+                                         &error_abort);
+    setup_boot(machine, 2, machine->ram_size - vcram_size);
 }
 
 static void raspi2_machine_init(MachineClass *mc)
@@ -161,11 +164,6 @@ static void raspi2_machine_init(MachineClass *mc)
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
     mc->max_cpus = BCM2836_NCPUS;
-
-    /* XXX: Temporary restriction in RAM size from the full 1GB. Since
-     * we do not yet support the framebuffer / GPU, we need to limit
-     * RAM usable by the OS to sit below the peripherals.
-     */
-    mc->default_ram_size = 0x3F000000; /* BCM2836_PERI_BASE */
+    mc->default_ram_size = 1024 * 1024 * 1024;
 };
 DEFINE_MACHINE("raspi2", raspi2_machine_init)
diff --git a/hw/display/Makefile.objs b/hw/display/Makefile.objs
index f0cf431..d99780e 100644
--- a/hw/display/Makefile.objs
+++ b/hw/display/Makefile.objs
@@ -27,6 +27,7 @@ endif
 obj-$(CONFIG_OMAP) += omap_dss.o
 obj-$(CONFIG_OMAP) += omap_lcdc.o
 obj-$(CONFIG_PXA2XX) += pxa2xx_lcd.o
+obj-$(CONFIG_RASPI) += bcm2835_fb.o
 obj-$(CONFIG_SM501) += sm501.o
 obj-$(CONFIG_TCX) += tcx.o
 obj-$(CONFIG_CG3) += cg3.o
diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
new file mode 100644
index 0000000..97079fb
--- /dev/null
+++ b/hw/display/bcm2835_fb.c
@@ -0,0 +1,421 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * Refactoring for Pi2 Copyright (c) 2015, Microsoft. Written by Andrew Baumann.
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
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
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
+    BCM2835FBState *s = BCM2835_FB(opaque);
+
+    s->invalidate = true;
+}
+
+static void draw_line_src16(void *opaque, uint8_t *dst, const uint8_t *src,
+                            int width, int deststep)
+{
+    BCM2835FBState *s = opaque;
+    uint16_t rgb565;
+    uint32_t rgb888;
+    uint8_t r, g, b;
+    DisplaySurface *surface = qemu_console_surface(s->con);
+    int bpp = surface_bits_per_pixel(surface);
+
+    while (width--) {
+        switch (s->bpp) {
+        case 8:
+            rgb888 = ldl_phys(&s->dma_as, s->vcram_base + (*src << 2));
+            r = (rgb888 >> 0) & 0xff;
+            g = (rgb888 >> 8) & 0xff;
+            b = (rgb888 >> 16) & 0xff;
+            src++;
+            break;
+        case 16:
+            rgb565 = lduw_p(src);
+            r = ((rgb565 >> 11) & 0x1f) << 3;
+            g = ((rgb565 >>  5) & 0x3f) << 2;
+            b = ((rgb565 >>  0) & 0x1f) << 3;
+            src += 2;
+            break;
+        case 24:
+            rgb888 = ldl_p(src);
+            r = (rgb888 >> 0) & 0xff;
+            g = (rgb888 >> 8) & 0xff;
+            b = (rgb888 >> 16) & 0xff;
+            src += 3;
+            break;
+        case 32:
+            rgb888 = ldl_p(src);
+            r = (rgb888 >> 0) & 0xff;
+            g = (rgb888 >> 8) & 0xff;
+            b = (rgb888 >> 16) & 0xff;
+            src += 4;
+            break;
+        default:
+            r = 0;
+            g = 0;
+            b = 0;
+            break;
+        }
+
+        if (s->pixo == 0) {
+            /* swap to BGR pixel format */
+            uint8_t tmp = r;
+            r = b;
+            b = tmp;
+        }
+
+        switch (bpp) {
+        case 8:
+            *dst++ = rgb_to_pixel8(r, g, b);
+            break;
+        case 15:
+            *(uint16_t *)dst = rgb_to_pixel15(r, g, b);
+            dst += 2;
+            break;
+        case 16:
+            *(uint16_t *)dst = rgb_to_pixel16(r, g, b);
+            dst += 2;
+            break;
+        case 24:
+            rgb888 = rgb_to_pixel24(r, g, b);
+            *dst++ = rgb888 & 0xff;
+            *dst++ = (rgb888 >> 8) & 0xff;
+            *dst++ = (rgb888 >> 16) & 0xff;
+            break;
+        case 32:
+            *(uint32_t *)dst = rgb_to_pixel32(r, g, b);
+            dst += 4;
+            break;
+        default:
+            return;
+        }
+    }
+}
+
+static void fb_update_display(void *opaque)
+{
+    BCM2835FBState *s = opaque;
+    DisplaySurface *surface = qemu_console_surface(s->con);
+    int first = 0;
+    int last = 0;
+    int src_width = 0;
+    int dest_width = 0;
+
+    if (s->lock || !s->xres) {
+        return;
+    }
+
+    src_width = s->xres * (s->bpp >> 3);
+    dest_width = s->xres;
+
+    switch (surface_bits_per_pixel(surface)) {
+    case 0:
+        return;
+    case 8:
+        break;
+    case 15:
+        dest_width *= 2;
+        break;
+    case 16:
+        dest_width *= 2;
+        break;
+    case 24:
+        dest_width *= 3;
+        break;
+    case 32:
+        dest_width *= 4;
+        break;
+    default:
+        hw_error("bcm2835_fb: bad color depth\n");
+        break;
+    }
+
+    if (s->invalidate) {
+        framebuffer_update_memory_section(&s->fbsection, s->dma_mr, s->base,
+                                          s->yres, src_width);
+    }
+
+    framebuffer_update_display(surface, &s->fbsection, s->xres, s->yres,
+                               src_width, dest_width, 0, s->invalidate,
+                               draw_line_src16, s, &first, &last);
+
+    if (first >= 0) {
+        dpy_gfx_update(s->con, 0, first, s->xres, last - first + 1);
+    }
+
+    s->invalidate = false;
+}
+
+static void bcm2835_fb_mbox_push(BCM2835FBState *s, uint32_t value)
+{
+    value &= ~0xf;
+
+    s->lock = true;
+
+    s->xres = ldl_phys(&s->dma_as, value);
+    s->yres = ldl_phys(&s->dma_as, value + 4);
+    s->xres_virtual = ldl_phys(&s->dma_as, value + 8);
+    s->yres_virtual = ldl_phys(&s->dma_as, value + 12);
+    s->bpp = ldl_phys(&s->dma_as, value + 20);
+    s->xoffset = ldl_phys(&s->dma_as, value + 24);
+    s->yoffset = ldl_phys(&s->dma_as, value + 28);
+
+    s->base = s->vcram_base | (value & 0xc0000000);
+    s->base += BCM2835_FB_OFFSET;
+
+    /* TODO - Manage properly virtual resolution */
+
+    s->pitch = s->xres * (s->bpp >> 3);
+    s->size = s->yres * s->pitch;
+
+    stl_phys(&s->dma_as, value + 16, s->pitch);
+    stl_phys(&s->dma_as, value + 32, s->base);
+    stl_phys(&s->dma_as, value + 36, s->size);
+
+    s->invalidate = true;
+    qemu_console_resize(s->con, s->xres, s->yres);
+    s->lock = false;
+}
+
+void bcm2835_fb_reconfigure(BCM2835FBState *s, uint32_t *xres, uint32_t *yres,
+                            uint32_t *xoffset, uint32_t *yoffset, uint32_t *bpp,
+                            uint32_t *pixo, uint32_t *alpha)
+{
+    s->lock = true;
+
+    /* TODO: input validation! */
+    if (xres) {
+        s->xres = *xres;
+    }
+    if (yres) {
+        s->yres = *yres;
+    }
+    if (xoffset) {
+        s->xoffset = *xoffset;
+    }
+    if (yoffset) {
+        s->yoffset = *yoffset;
+    }
+    if (bpp) {
+        s->bpp = *bpp;
+    }
+    if (pixo) {
+        s->pixo = *pixo;
+    }
+    if (alpha) {
+        s->alpha = *alpha;
+    }
+
+    /* TODO - Manage properly virtual resolution */
+
+    s->pitch = s->xres * (s->bpp >> 3);
+    s->size = s->yres * s->pitch;
+
+    s->invalidate = true;
+    qemu_console_resize(s->con, s->xres, s->yres);
+    s->lock = false;
+}
+
+static uint64_t bcm2835_fb_read(void *opaque, hwaddr offset, unsigned size)
+{
+    BCM2835FBState *s = opaque;
+    uint32_t res = 0;
+
+    switch (offset) {
+    case MBOX_AS_DATA:
+        res = MBOX_CHAN_FB;
+        s->pending = false;
+        qemu_set_irq(s->mbox_irq, 0);
+        break;
+
+    case MBOX_AS_PENDING:
+        res = s->pending;
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
+    BCM2835FBState *s = opaque;
+
+    switch (offset) {
+    case MBOX_AS_DATA:
+        /* bcm2835_mbox should check our pending status before pushing */
+        assert(!s->pending);
+        s->pending = true;
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
+static const MemoryRegionOps bcm2835_fb_ops = {
+    .read = bcm2835_fb_read,
+    .write = bcm2835_fb_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+};
+
+static const VMStateDescription vmstate_bcm2835_fb = {
+    .name = TYPE_BCM2835_FB,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
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
+static const GraphicHwOps vgafb_ops = {
+    .invalidate  = fb_invalidate_display,
+    .gfx_update  = fb_update_display,
+};
+
+static void bcm2835_fb_init(Object *obj)
+{
+    BCM2835FBState *s = BCM2835_FB(obj);
+
+    memory_region_init_io(&s->iomem, obj, &bcm2835_fb_ops, s, TYPE_BCM2835_FB,
+                          0x10);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+    sysbus_init_irq(SYS_BUS_DEVICE(s), &s->mbox_irq);
+}
+
+static void bcm2835_fb_reset(DeviceState *dev)
+{
+    BCM2835FBState *s = BCM2835_FB(dev);
+
+    s->pending = false;
+
+    s->xres_virtual = s->xres;
+    s->yres_virtual = s->yres;
+    s->xoffset = 0;
+    s->yoffset = 0;
+    s->base = s->vcram_base + BCM2835_FB_OFFSET;
+    s->pitch = s->xres * (s->bpp >> 3);
+    s->size = s->yres * s->pitch;
+
+    s->invalidate = true;
+    s->lock = false;
+}
+
+static void bcm2835_fb_realize(DeviceState *dev, Error **errp)
+{
+    BCM2835FBState *s = BCM2835_FB(dev);
+    Error *err = NULL;
+    Object *obj;
+
+    if (s->vcram_base == 0) {
+        error_setg(errp, "%s: required vcram-base property not set", __func__);
+        return;
+    }
+
+    obj = object_property_get_link(OBJECT(dev), "dma-mr", &err);
+    if (obj == NULL) {
+        error_setg(errp, "%s: required dma-mr link not found: %s",
+                   __func__, error_get_pretty(err));
+        return;
+    }
+
+    s->dma_mr = MEMORY_REGION(obj);
+    address_space_init(&s->dma_as, s->dma_mr, NULL);
+
+    bcm2835_fb_reset(dev);
+
+    s->con = graphic_console_init(dev, 0, &vgafb_ops, s);
+    qemu_console_resize(s->con, s->xres, s->yres);
+}
+
+static Property bcm2835_fb_props[] = {
+    DEFINE_PROP_UINT32("vcram-base", BCM2835FBState, vcram_base, 0),/*required*/
+    DEFINE_PROP_UINT32("vcram-size", BCM2835FBState, vcram_size,
+                       DEFAULT_VCRAM_SIZE),
+    DEFINE_PROP_UINT32("xres", BCM2835FBState, xres, 640),
+    DEFINE_PROP_UINT32("yres", BCM2835FBState, yres, 480),
+    DEFINE_PROP_UINT32("bpp", BCM2835FBState, bpp, 16),
+    DEFINE_PROP_UINT32("pixo", BCM2835FBState, pixo, 1), /* 1=RGB, 0=BGR */
+    DEFINE_PROP_UINT32("alpha", BCM2835FBState, alpha, 2), /* alpha ignored */
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static void bcm2835_fb_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->props = bcm2835_fb_props;
+    dc->realize = bcm2835_fb_realize;
+    dc->reset = bcm2835_fb_reset;
+    dc->vmsd = &vmstate_bcm2835_fb;
+}
+
+static TypeInfo bcm2835_fb_info = {
+    .name          = TYPE_BCM2835_FB,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2835FBState),
+    .class_init    = bcm2835_fb_class_init,
+    .instance_init = bcm2835_fb_init,
+};
+
+static void bcm2835_fb_register_types(void)
+{
+    type_register_static(&bcm2835_fb_info);
+}
+
+type_init(bcm2835_fb_register_types)
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
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
 
     SysBusDevice *uart0;
     BCM2835AuxState aux;
+    BCM2835FBState fb;
     BCM2835ICState ic;
     BCM2835PropertyState property;
     BCM2835MboxState mboxes;
diff --git a/include/hw/display/bcm2835_fb.h b/include/hw/display/bcm2835_fb.h
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
+#define BCM2835_FB(obj) OBJECT_CHECK(BCM2835FBState, (obj), TYPE_BCM2835_FB)
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
+void bcm2835_fb_reconfigure(BCM2835FBState *s, uint32_t *xres, uint32_t *yres,
+                            uint32_t *xoffset, uint32_t *yoffset, uint32_t *bpp,
+                            uint32_t *pixo, uint32_t *alpha);
+
+#endif
-- 
2.5.3

