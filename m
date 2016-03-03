Received: by 10.25.208.211 with SMTP id h202csp13243lfg;
        Thu, 3 Mar 2016 10:26:09 -0800 (PST)
X-Received: by 10.55.49.11 with SMTP id x11mr4875685qkx.86.1457029568729;
        Thu, 03 Mar 2016 10:26:08 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w13si15724797qka.41.2016.03.03.10.26.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 10:26:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36715 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abXwu-0005J9-23
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 13:26:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1abXvn-0003qR-Db
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 13:25:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1abXvi-0007ZO-TD
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 13:24:59 -0500
Received: from mail-by2on0112.outbound.protection.outlook.com
	([207.46.100.112]:25293
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1abXvi-0007ZJ-F3; Thu, 03 Mar 2016 13:24:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Qoy/xVnKtf9zkao+4tIp+c2dWRmc4/xfahtsancTm0o=;
	b=iGcTEDF3iS/i1i6V6Ir9iM6UqjT8kfC5qdiiQUcBU2aM51kxf0WLxYXhfS/tDCdpNZvlouvukWwNZ5H6bHDM7LF1YaglEEVTBbnNaU/FJq/8pKT2C/2tMpEkKteZR7Aog6ZGz+yfHyI8fZ25gxpqa7czi9wZMVk/RlwNU5H9Ogw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:5::724)
	by CY1PR0301MB2042.namprd03.prod.outlook.com (10.164.2.24) with
	Microsoft
	SMTP Server (TLS) id 15.1.427.16; Thu, 3 Mar 2016 18:24:52 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 3 Mar 2016 10:24:37 -0800
Message-ID: <1457029479-11312-4-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1457029479-11312-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1457029479-11312-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:5::724]
X-ClientProxiedBy: CO2PR20CA0017.namprd20.prod.outlook.com (25.163.96.27) To
	CY1PR0301MB2042.namprd03.prod.outlook.com (25.164.2.24)
X-MS-Office365-Filtering-Correlation-Id: 84f80ae0-06dc-4333-9891-08d343911cdf
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2042;
	2:vJB3oV5iCLSjdVBWXc/26gfR6QzM0lbPom149eBNY0NqscFIWGba5v2fVI+SNi+4e39aTY12l6eNRcNLp6mm1qKGLG+iHrozHF1zifnnXcYmOob4bnnRQJ4jgUuQyGzIfO4m+2rPHoe8/bGMyC/1TANnDQfSxGZxIGJE+uBQ0737LZGF5J70Wk3WaXlrKD0K;
	3:EdmXM7YLvIOp4Z2jn+FM50sdyRy5lW6bbv6sF41GgP7/tTaHMKxoEHC7T8oYASowZxNHmAx+biEdIWQCjF54Zor0l9Q4jUrXDQ0IKA+kzTeMI6BLrz0Kar0tRlJuwKzb;
	25:vgTjO9c208AJpHcsTLEaYnf02rJ+PcS1aJYbox9Ur6rYa4VJoIu7QSFsgykXTdlJYUhk3DCv86hrtopxqE38sqPGW00IdcO6VovolQjRf5IdkP7SuljOSUJWGY/+8SP0XQFv7UxzhrUSC2y+ItPxKdrFGQ92R/QAF+tfyPaqG+4yAeinVv0w7sMTnaETkr5e00LRimSAvK/T8EIHQDHIKePE73Q4xhQnWHhcOb17pnKwnLb41YVH3fDQGMfV0SsR2NKa2CdS3FrRNs9AIHzJmCj/hNIf4hkq+JOLlyGavxIVftqDskXYJAhVSc12CLQAoa0fGpG8IqtE2wdZ2tov2g==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB2042;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2042;
	20:OgESNxplzy6QZTLB1R6uSOqeIBz/cOtSjcxs2ss12KGIWnHOrnGtTSwsf1023VW67ZLaH1ix0wTciU4Hp4y/IlGblAI1nnej3XSc87QQbQY8YFFA/856ek7T4SEvcCcFFURT57ETeEBfimbHvoqlcV48mPCvASU5bslXHEErwlHelrLXFfRqac8pkRxq0Snx1QEShFFYgHfX8jEqX6J9yZA3Q+HY4qjt1Uo+TMfjCHinqTOZnsLVRz8hArSD3TLE/ByZHagjYA3EyVLqhuIWKYsyUjpXJbqFEQLnsjkCjnNDni2d3wPDdTY8d7vVj+9e4UglkU6PYBT/2GAfswsfaFkff6HqzOqlI/zaxoqSKaIpK1IZJDF0wKk7KytvqZ9qzHVk4bIlwkyFHGEcv+4ojDbOwHFlpL+asFr0obTfkXNhbI5oAG7wQfpbL6vcmIMIqPcHaG+UuiEC0XOuhKpZ3h7iba0k0ee+fT7oJU+5RYGNtwCxEUfXeF8VTdrpJbFC;
	4:kJwTwQKDCK60phU2BDeZtOdLv3FlbCcckJKYUwHX4CqTQav+Nm4/Jgv66p56ZV0vSxY2uGBTbN0vpNvF8qgb1jANkd+tkk/nCyTy95fWqRisQXgiu6ju3NYmbXdu+QkQ2RJ/xyCsz2ZShv78LRU989bGMCaawsZOMs7ivv0FMm31lBn0w5r5tdT5gG2CeL5tD+JuxQtHWlWAonf4sCmIuuH7v6xCCyzVwNNxHaaLVthmnLfjywo4Z1IQN+NI8VgvDLRm5AjNX1inkFD38NtN39tjY7rapfQam8LLF0BTO/bELtrV2ThIK2HnJEXGDDYeBN5sJ1jZKYV6EBaZRT6j/5/DUZdHlI+2RzyJLcKAgc03bUwGIe+H8+vKv4wk4tTR
X-Microsoft-Antispam-PRVS: <CY1PR0301MB20429F9933A892D0CCBAB9F69EBD0@CY1PR0301MB2042.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:CY1PR0301MB2042; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB2042; 
X-Forefront-PRVS: 0870212862
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(2351001)(50986999)(4326007)(76176999)(1096002)(2906002)(5005710100001)(87976001)(10290500002)(40100003)(36756003)(4001430100002)(6116002)(47776003)(586003)(122386002)(42186005)(92566002)(86612001)(19580395003)(77096005)(10090500001)(575784001)(5003940100001)(86362001)(19580405001)(189998001)(15975445007)(2950100001)(50226001)(229853001)(48376002)(5008740100001)(110136002)(50466002)(5004730100002)(107886002)(81166005)(2004002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB2042;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB2042;
	23:599Jp2A7Q2EJn/dlZJgrLsb2TPifArIwSStTEBX?=
	=?us-ascii?Q?EPgkL3m7rFAO+hgW05hjJywpqAlZkbTVLd2vzKcpZcYEnrreGYfGRp3EriPV?=
	=?us-ascii?Q?mGLwvcTsOa6Cy3Z+ikgiU8Mym5O4miPkzoFBg8iv5pnYmGSnCNwQ4E3zL2m7?=
	=?us-ascii?Q?E5284j1xT6NGI98a5W1PBXmhueVuoqsWdPWV8aD3aj7Wd5Uqz1ncMNy6f9gp?=
	=?us-ascii?Q?srTdxK190KKpKfkyoOoH4DvE0Qe+N6Pm9E01N9GooSHbUkZELMHBJvWdSbEF?=
	=?us-ascii?Q?Tk3tsDxoyB08FPKRPvTVb/bbB0JKA8mlN1JLmRevU8ddyozpLhBzACd35AXd?=
	=?us-ascii?Q?ua8D52kdWkiTQ313BwZ9J8cIv4wlIbKBzNjo5hDpGOWzXSY7UacGockVaL7Y?=
	=?us-ascii?Q?RDBEPxu5XfhCErxUBqGsEp3kX/enNixpJcg0E4SQMSjRLcI4dW6mKXToAnan?=
	=?us-ascii?Q?7sRzBRgpKEr4YqS4rXbgA70eBQOalmlhAk+k5I8BNko4acIS3FNGK3mfYRBp?=
	=?us-ascii?Q?1VxAjxCEe32D04y99/2xeh1VjojMCKUG7EP6MV0rm/qOwafCIULSyGX7wzaS?=
	=?us-ascii?Q?thq2WxBfIEZ5QD1UmM9Dq9RIt81/HQ8u6WyeahY5Vz0bH3AeiLNfhS/YFL1u?=
	=?us-ascii?Q?/81V23FjhCE1hNE8br6WovmdRLvCmiDDsSRKhtCTtHJST3PjicXb7xWczs/e?=
	=?us-ascii?Q?xgVjhCrSaRTrhYsj7hihL1mCDSFfY1xIICM/HRZA3i6izpT+RuEnL2fv87ka?=
	=?us-ascii?Q?BEtG/GVAbwRfCUOfY8HpMhM+fLxPGn2QmR1h4fnA1ILngDowETs7FfbV2WNh?=
	=?us-ascii?Q?c/mTDd7ZFYUKBPqDhzGNUOUKzA47voFUI+VN7NnifxSoiMAqZy9Z7ZAS4gdb?=
	=?us-ascii?Q?Kkuz/75oJ4ycIgvB+uMbEhEILiPa52/pswjMomIcGAJ2G3+G5ALfm0hwz06r?=
	=?us-ascii?Q?+AprfrAQ8bqBhsOLYKVMi6gV81yoqfzm9PBAOk4iNT/3eDd72TeFXxiF0Pqv?=
	=?us-ascii?Q?vFQvSzTLhTj2jBTfzgz2DBOgG/pqdcGRqCtjnwJLAhN21zXo9ovIYGqBu1T6?=
	=?us-ascii?Q?tXPuTv3N4+GEoiXLx82JveikXK2H+QK4KBSA1T+KKGeZVDTwXtdqO69PqA4S?=
	=?us-ascii?Q?DMypYpuCEJ9jnukazQLd2v2T8BRheSuww?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2042;
	5:MxT1CPB4fdVdc6KCYGP5wsPeO0E56Wmb10NZMx4Z/Q9A0IQ0Fa0DjdarYxjnwCRvaJokWAgDteYmOfav/XApXXSH22AqwMjK+7UVqcBZE4lcA2d+Nn61+f6vpoUB0171nV0tdqyBSVdEeB88SJ0a5A==;
	24:63LsR7cEbYh/LeqZQ+FMsO9BZSNPRyzTXi4yeIioVuSXXfU8QmeLnZ7Ig8LvFU8EBRwqIoT5SUCsZFfBQxe1gGjhUVttL0dvN4oMVbD6yyA=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2016 18:24:52.0137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB2042
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.112
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH v2 3/5] bcm2835_fb: add framebuffer device for
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
X-TUID: ZOdwslUkKa61

The framebuffer occupies the upper portion of memory (64MiB by
default), but it can only be controlled/configured via a system
mailbox or property channel (to be added by a subsequent patch).

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---

Notes:
    v2:
     * avoid ldl_phys
     * move code to increase default pi2 memory size back to the final patch

 hw/arm/bcm2835_peripherals.c         |  38 +++-
 hw/arm/bcm2836.c                     |   2 +
 hw/arm/raspi.c                       |   5 +-
 hw/display/Makefile.objs             |   1 +
 hw/display/bcm2835_fb.c              | 424 +++++++++++++++++++++++++++++++++++
 include/hw/arm/bcm2835_peripherals.h |   2 +
 include/hw/display/bcm2835_fb.h      |  47 ++++
 7 files changed, 517 insertions(+), 2 deletions(-)
 create mode 100644 hw/display/bcm2835_fb.c
 create mode 100644 include/hw/display/bcm2835_fb.h

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 375e341..552611a 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -63,6 +63,16 @@ static void bcm2835_peripherals_init(Object *obj)
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
@@ -85,7 +95,7 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     Object *obj;
     MemoryRegion *ram;
     Error *err = NULL;
-    uint32_t ram_size;
+    uint32_t ram_size, vcram_size;
     CharDriverState *chr;
     int n;
 
@@ -173,6 +183,32 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
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
index 6582279..5498209 100644
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
index 0000000..779b56f
--- /dev/null
+++ b/hw/display/bcm2835_fb.c
@@ -0,0 +1,424 @@
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
+            /* lookup palette starting at video ram base
+             * TODO: cache translation, rather than doing this each time!
+             */
+            rgb888 = ldl_le_phys(&s->dma_as, s->vcram_base + (*src << 2));
+            r = (rgb888 >> 0) & 0xff;
+            g = (rgb888 >> 8) & 0xff;
+            b = (rgb888 >> 16) & 0xff;
+            src++;
+            break;
+        case 16:
+            rgb565 = lduw_le_p(src);
+            r = ((rgb565 >> 11) & 0x1f) << 3;
+            g = ((rgb565 >>  5) & 0x3f) << 2;
+            b = ((rgb565 >>  0) & 0x1f) << 3;
+            src += 2;
+            break;
+        case 24:
+            rgb888 = ldl_le_p(src);
+            r = (rgb888 >> 0) & 0xff;
+            g = (rgb888 >> 8) & 0xff;
+            b = (rgb888 >> 16) & 0xff;
+            src += 3;
+            break;
+        case 32:
+            rgb888 = ldl_le_p(src);
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
+    s->xres = ldl_le_phys(&s->dma_as, value);
+    s->yres = ldl_le_phys(&s->dma_as, value + 4);
+    s->xres_virtual = ldl_le_phys(&s->dma_as, value + 8);
+    s->yres_virtual = ldl_le_phys(&s->dma_as, value + 12);
+    s->bpp = ldl_le_phys(&s->dma_as, value + 20);
+    s->xoffset = ldl_le_phys(&s->dma_as, value + 24);
+    s->yoffset = ldl_le_phys(&s->dma_as, value + 28);
+
+    s->base = s->vcram_base | (value & 0xc0000000);
+    s->base += BCM2835_FB_OFFSET;
+
+    /* TODO - Manage properly virtual resolution */
+
+    s->pitch = s->xres * (s->bpp >> 3);
+    s->size = s->yres * s->pitch;
+
+    stl_le_phys(&s->dma_as, value + 16, s->pitch);
+    stl_le_phys(&s->dma_as, value + 32, s->base);
+    stl_le_phys(&s->dma_as, value + 36, s->size);
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

