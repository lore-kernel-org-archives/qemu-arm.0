Received: by 10.25.208.211 with SMTP id h202csp2132186lfg;
        Tue, 8 Mar 2016 12:07:23 -0800 (PST)
X-Received: by 10.140.18.168 with SMTP id 37mr34626179qgf.59.1457467643851;
        Tue, 08 Mar 2016 12:07:23 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k41si4600964qgk.72.2016.03.08.12.07.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Mar 2016 12:07:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adNud-0006AZ-41
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 15:07:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1adNt9-0003s6-Gh
	for qemu-devel@nongnu.org; Tue, 08 Mar 2016 15:05:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1adNt4-0004Gh-4y
	for qemu-devel@nongnu.org; Tue, 08 Mar 2016 15:05:51 -0500
Received: from mail-bl2on0108.outbound.protection.outlook.com
	([65.55.169.108]:28317
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1adNt3-0004GY-VX; Tue, 08 Mar 2016 15:05:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=6xTOlIwvDTIo8H5BMi6sCerxAH6FPTtcEQcvU2F/UXU=;
	b=c5TvFK6dBibkangGNiZuUkz9LIubLM8/Nn/8pW20yN/scWTh8NV8ChZf9eYEzEYx9g8nXnUfhbsLwpmoHCy/Nwh8mkIIsWEZv1X+tqDjciyQ2ILlzECIlB1lKX9ocZdp4JzMkUrMqQ1iny1W70YfXHpUh5fJ0Kv/gwJVgprej6s=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8::5f2)
	by BLUPR0301MB2036.namprd03.prod.outlook.com (10.164.22.26) with
	Microsoft
	SMTP Server (TLS) id 15.1.427.16; Tue, 8 Mar 2016 20:05:43 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 8 Mar 2016 12:05:23 -0800
Message-ID: <1457467526-8840-3-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1457467526-8840-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1457467526-8840-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8::5f2]
X-ClientProxiedBy: BY1PR10CA0031.namprd10.prod.outlook.com (25.160.197.41) To
	BLUPR0301MB2036.namprd03.prod.outlook.com (25.164.22.26)
X-MS-Office365-Filtering-Correlation-Id: 77f0749d-5dc2-4699-947a-08d3478d083c
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2036;
	2:hyugMgu0BJ5Ch0DRufOBlJWRfpdyrfRRP/9gcN5PFj+VQvd2j+GjbgfxFiCb8fYMBmd8moV0GS3qp4X3dnDlgIRpJZ3zsljgtzbPasjR6ajkeNNdxehIkNX91TZPQFzq3KUvMROXdHEFJ7/bQdHOrGN3+OjA/woG691iudB2EAU1bO+nVMCmj9MqJuNbR1tw;
	3:T3mE2cxq3pr6B8q8QrWCawANKL7PMqAv+r1cNl6/Fyh53Fc1+UM1BS0Oa4v2PiiYC4jNRGtgHPreVdE8j7pggriSTUqDIQQjyxKCdoOwid3r5NWbER898TZvT/F3SJMi;
	25:ubDrWiKOp70HSZDgeMvPV/nShpg2YMYuCdjb5kNg26XaCPTAVMOWrALW19t2G9Nw3PtUdJ4SXyBGaFB0ynrzoPPXr5/3zLrUUhrngeY2Axy/bnbGVH+aQ66+eyKcf8UPQ0Jqxv/Ox4in57lg7PhHWyvFtZYP/0Tm8Y004ikMrKCWbyZbe5ZEdQwYnpQHpocGkMjkiw4C/dQMwYt1EZliwNwsURQsRBefDDuKx584vFcICzKl9ffMlRvyFFDpPjRzTsl3VuxAbFPfp8+bPWy3Cw4v+CZCZIabwrPBiNGhyeegj8YJ2cIRf3nWxH1UjXzLvbRxTX0XZZ5zPQQSUy1k7A==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2036;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2036;
	20:Y/i8U/FWQbOaI+7ASjmxkeyTKn6rHrgvN2NNTeWwy+NhB8mBrazJ5JZwDmS6hRhiDUU/Zv6WG3PcKDc6L8V5IVr5nzVvjfp2YsaWu/bdXSNuVfd4XeL6rJ4eWF4+R4SCo72tR6sAUKkqIGp3kHBfVU9EDvwUVrhDFvaZA+6Zm+NGR2kfBb32Hcez+pcDjmn6Z99wRhxqnh8XX3lrP4hC1HNsfv8ASf1j6Ac1DQR68xAbqSvNcLmKSiJ3lKGtSZFX5d8f72Gah3EaBCV+0S4/+xMIDH783AYkvQJvGmznlAQ+SjNBKqCA5RvIYj6kozPVeN4Tl7xigz13/kagh3vLWvAmX8GECLuRl7b0EdAMykc5BXZVrPRAs6Mff3qh+3VY1uPoCwtePjg/ztV/KobGyCnkdLr1QlVKkHbRy+kseh8STI9KuMbLi7jmHfNCh8UxTt6qfduDWt5i3HtDn777NqrNR3P2jhdvDWWUqUsTguV3q2yqXQxqrQg3w7o2BYjK;
	4:6g4mRNXLa4MdHaTnTLeUm8Ce946YVLx0UZPmz+DgK2AaQFeatj06wsur55bkpXq5jHk7lPFY7EJJEqy+QOv1xZwbac9MYcSCIBx+GkI2CCNkkfAVkjBSj8rapN+4lzqfPe0iwh76PxZz6q7YnzjY7hrNFAUo39X1R81HJ17bm6pTPgqOdlWBtoeg1UfFM+Pt7tVLoOUwllBi9G25XqCe9BkFkYnYZ87sDlNSLQd6tqkLzsXYEP08BzNrCbJljuzveBLgOmdbdzFTCC+cuJcT8DVb0Co6PsrI/19O3GJ1S+FuaWv0TIURGrqm+jr74Opd3N6HFgItWRleg6FO4Kcl6hgFM3Q+UboZL23aEF9E4//Ht909nT3HuloW6rk2eLxC
X-Microsoft-Antispam-PRVS: <BLUPR0301MB203667C82206FDC55DB4475C9EB20@BLUPR0301MB2036.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:BLUPR0301MB2036; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2036; 
X-Forefront-PRVS: 08756AC3C8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(10290500002)(47776003)(5005710100001)(2950100001)(86362001)(575784001)(189998001)(86612001)(5003940100001)(36756003)(10090500001)(19580395003)(42186005)(2906002)(6116002)(586003)(5008740100001)(4001430100002)(50986999)(76176999)(48376002)(92566002)(50466002)(77096005)(2351001)(229853001)(19580405001)(110136002)(107886002)(5004730100002)(81166005)(1096002)(4326007)(50226001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2036;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2036;
	23:roYZYVWJtXnhyX6G+sCAXsM/ebtdm9CaI8cggAJ?=
	=?us-ascii?Q?CWXR4rlxLoJW24L0nfV2uLRLfUeR4ZmdJsgYAjQ4l2tJJcWgrMS2XgcLQPny?=
	=?us-ascii?Q?yM8cQx1Y+nbi8d2WSNvAKqZL8ei+zrHHTHWlZuqv3AbQLRJMfBSRnRMFV4Ag?=
	=?us-ascii?Q?5d7vFB3iG2Junbj4TUjv20BPC4GLy+AyOyFISUNf6jr6d8USt5sywt+nPlpf?=
	=?us-ascii?Q?JI5QSP0G1bFirk0pNR0xwN8JgzzjiL382U6BsCYd1L1lZP2dtexiHyGp/nkO?=
	=?us-ascii?Q?z1sfPNsVZ8TVUWwHD2mBF4DzclI7KRwackCsLiuEandZCsrkG5B6pe567iQV?=
	=?us-ascii?Q?g1BQC7U5RdWO2hWerZhI+VxVVsgjjR7n9Kr2/hL7+N9gSyyQjMPr33rH+0An?=
	=?us-ascii?Q?NTxQ2w2jM+v84PpcH1QPxNbuFkAj225Fn4gMNmLeGWtOhN8kRTlJ40XSoGhm?=
	=?us-ascii?Q?yxoiqLPuCejm50VlWGOuPkizR2uJZ97f2OdC4b6+q4lN/Fy3uTxc9IU08oQn?=
	=?us-ascii?Q?8LmUK/lOKQhuO1CH4Vm54yaDWbNpKG1bbMiT0RMmMU9FdIfI84BAT2qYxVUs?=
	=?us-ascii?Q?v0A6zH5SbP/tiMpNPBLQ6KLP0j24QER2kRXIArPWcYOZQTUlq0K48MW7pX3F?=
	=?us-ascii?Q?lchafiBcBZLDt8R83n/p1sqKT+lOn5NuEZ4++Zg+XBo35o5P/tepIh4+Lvoe?=
	=?us-ascii?Q?gCc/ppDZ9Glea0jl8jjjCj9a0BAeHj5raMaf0qqZv1hB3LnhID3uBxnBXkcG?=
	=?us-ascii?Q?OGLmn6HARMZkAdejWTFbWLsyfiuK8B6ce5laRnlOGB25BlmJeKfp00lXv0lz?=
	=?us-ascii?Q?e9gjZrADlr94cfH5RrOsMR6pLorqmVmWcsjQJhnY/ko5ex95MGHezI4NgiYQ?=
	=?us-ascii?Q?tMYV/j+kPVMXPpDo8fIV7mjKDEpK3rW9Bv0oMEfaATccTVdDxlG43IHpFqCk?=
	=?us-ascii?Q?x8cL2HUScU+MrZzbZFKC1nd2PpZSIBfA0gxPFgDLg1ItILwxipe95Xi/Qk1m?=
	=?us-ascii?Q?qx6kcB6/jri/6h03kwNCOR7q4?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2036;
	5:439ZBw65u5pxG2SM+bruZS2KCU0UqExVIxoQbroZTdSrAnvHpoGycSngStgiOBW7620T1NhuKrwSr5ePS0UN3GxdJn2CnVW8RLGohrqnvkj82Ul+cVb8nXkMtF9RkNrsqCwH9Z+PHiCYGW8yetycKw==;
	24:8erZTGnzrfHD2O3Wr8pLmmVf+I34/ry2LK0DRZVjzOTvoy0q3rxC6oEkdgQVb+D4fdYJzqUFb8WDEW3FqWJ8CFPuy3qnyQ+Vq1H1oyGRDdk=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2016 20:05:43.4513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2036
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.108
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH v3 2/5] bcm2835_aux: add emulation of BCM2835
	AUX (aka UART1) block
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
X-TUID: h3Pms2jLOMW0

At present only the core UART functions (data path for tx/rx) are
implemented, which is enough for UEFI to boot. The following
features/registers are unimplemented:
  * Line/modem control
  * Scratch register
  * Extra control
  * Baudrate
  * SPI interfaces

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---

Notes:
    v3:
     * use qemu_char_get_next_serial() to configure the chardev prop in
       bcm2835_peripherals, rather than reaching into serial_hds[] directly
    
    v2:
     * document unimplemented features, log unimplemented register accesses
     * model read path as 8-bit
     * drop incorrect event (break detection) functionality
     * implement AUX_IRQ register
     * model interrupt enables as a uint8 rather than 2 bools
     * corrected bugs in implementation of IIR bits 0-2
     * use chardev prop rather than qemu_char_get_next_serial(); the
       soc-level (bcm2835_peripherals) handling is still a little messy
       however, because uart0 is a pl011 device which still calls
       qemu_char_get_next_serial()

 hw/arm/bcm2835_peripherals.c         |  32 ++++
 hw/char/Makefile.objs                |   1 +
 hw/char/bcm2835_aux.c                | 316 +++++++++++++++++++++++++++++++++++
 include/hw/arm/bcm2835_peripherals.h |   2 +
 include/hw/char/bcm2835_aux.h        |  33 ++++
 5 files changed, 384 insertions(+)
 create mode 100644 hw/char/bcm2835_aux.c
 create mode 100644 include/hw/char/bcm2835_aux.h

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 6ce9cd1..d6453cc 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -12,6 +12,7 @@
 #include "hw/arm/bcm2835_peripherals.h"
 #include "hw/misc/bcm2835_mbox_defs.h"
 #include "hw/arm/raspi_platform.h"
+#include "sysemu/char.h"
 
 /* Peripheral base address on the VC (GPU) system bus */
 #define BCM2835_VC_PERI_BASE 0x7e000000
@@ -48,6 +49,11 @@ static void bcm2835_peripherals_init(Object *obj)
     object_property_add_child(obj, "uart0", OBJECT(s->uart0), NULL);
     qdev_set_parent_bus(DEVICE(s->uart0), sysbus_get_default());
 
+    /* AUX / UART1 */
+    object_initialize(&s->aux, sizeof(s->aux), TYPE_BCM2835_AUX);
+    object_property_add_child(obj, "aux", OBJECT(&s->aux), NULL);
+    qdev_set_parent_bus(DEVICE(&s->aux), sysbus_get_default());
+
     /* Mailboxes */
     object_initialize(&s->mboxes, sizeof(s->mboxes), TYPE_BCM2835_MBOX);
     object_property_add_child(obj, "mbox", OBJECT(&s->mboxes), NULL);
@@ -79,6 +85,7 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     MemoryRegion *ram;
     Error *err = NULL;
     uint32_t ram_size;
+    CharDriverState *chr;
     int n;
 
     obj = object_property_get_link(OBJECT(dev), "ram", &err);
@@ -131,6 +138,29 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
                                INTERRUPT_UART));
 
+    /* AUX / UART1 */
+    /* TODO: don't call qemu_char_get_next_serial() here, instead set
+     * chardev properties for each uart at the board level, once pl011
+     * (uart0) has been updated to avoid qemu_char_get_next_serial()
+     */
+    chr = qemu_char_get_next_serial();
+    if (chr == NULL) {
+        chr = qemu_chr_new("bcm2835.uart1", "null", NULL);
+    }
+    qdev_prop_set_chr(DEVICE(&s->aux), "chardev", chr);
+
+    object_property_set_bool(OBJECT(&s->aux), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    memory_region_add_subregion(&s->peri_mr, UART1_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->aux), 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->aux), 0,
+        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
+                               INTERRUPT_AUX));
+
     /* Mailboxes */
     object_property_set_bool(OBJECT(&s->mboxes), true, "realized", &err);
     if (err) {
@@ -203,6 +233,8 @@ static void bcm2835_peripherals_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = bcm2835_peripherals_realize;
+    /* Reason: realize() method uses qemu_char_get_next_serial() */
+    dc->cannot_instantiate_with_device_add_yet = true;
 }
 
 static const TypeInfo bcm2835_peripherals_type_info = {
diff --git a/hw/char/Makefile.objs b/hw/char/Makefile.objs
index 5931cc8..69a553c 100644
--- a/hw/char/Makefile.objs
+++ b/hw/char/Makefile.objs
@@ -16,6 +16,7 @@ obj-$(CONFIG_SH4) += sh_serial.o
 obj-$(CONFIG_PSERIES) += spapr_vty.o
 obj-$(CONFIG_DIGIC) += digic-uart.o
 obj-$(CONFIG_STM32F2XX_USART) += stm32f2xx_usart.o
+obj-$(CONFIG_RASPI) += bcm2835_aux.o
 
 common-obj-$(CONFIG_ETRAXFS) += etraxfs_ser.o
 common-obj-$(CONFIG_ISA_DEBUG) += debugcon.o
diff --git a/hw/char/bcm2835_aux.c b/hw/char/bcm2835_aux.c
new file mode 100644
index 0000000..0394d11
--- /dev/null
+++ b/hw/char/bcm2835_aux.c
@@ -0,0 +1,316 @@
+/*
+ * BCM2835 (Raspberry Pi / Pi 2) Aux block (mini UART and SPI).
+ * Copyright (c) 2015, Microsoft
+ * Written by Andrew Baumann
+ * Based on pl011.c, copyright terms below:
+ *
+ * Arm PrimeCell PL011 UART
+ *
+ * Copyright (c) 2006 CodeSourcery.
+ * Written by Paul Brook
+ *
+ * This code is licensed under the GPL.
+ *
+ * At present only the core UART functions (data path for tx/rx) are
+ * implemented. The following features/registers are unimplemented:
+ *  - Line/modem control
+ *  - Scratch register
+ *  - Extra control
+ *  - Baudrate
+ *  - SPI interfaces
+ */
+
+#include "qemu/osdep.h"
+#include "hw/char/bcm2835_aux.h"
+
+#define AUX_IRQ         0x0
+#define AUX_ENABLES     0x4
+#define AUX_MU_IO_REG   0x40
+#define AUX_MU_IER_REG  0x44
+#define AUX_MU_IIR_REG  0x48
+#define AUX_MU_LCR_REG  0x4c
+#define AUX_MU_MCR_REG  0x50
+#define AUX_MU_LSR_REG  0x54
+#define AUX_MU_MSR_REG  0x58
+#define AUX_MU_SCRATCH  0x5c
+#define AUX_MU_CNTL_REG 0x60
+#define AUX_MU_STAT_REG 0x64
+#define AUX_MU_BAUD_REG 0x68
+
+/* bits in IER/IIR registers */
+#define TX_INT  0x1
+#define RX_INT  0x2
+
+static void bcm2835_aux_update(BCM2835AuxState *s)
+{
+    /* signal an interrupt if either:
+     * 1. rx interrupt is enabled and we have a non-empty rx fifo, or
+     * 2. the tx interrupt is enabled (since we instantly drain the tx fifo)
+     */
+    s->iir = 0;
+    if ((s->ier & RX_INT) && s->read_count != 0) {
+        s->iir |= RX_INT;
+    }
+    if (s->ier & TX_INT) {
+        s->iir |= TX_INT;
+    }
+    qemu_set_irq(s->irq, s->iir != 0);
+}
+
+static uint64_t bcm2835_aux_read(void *opaque, hwaddr offset, unsigned size)
+{
+    BCM2835AuxState *s = opaque;
+    uint32_t c, res;
+
+    switch (offset) {
+    case AUX_IRQ:
+        return s->iir != 0;
+
+    case AUX_ENABLES:
+        return 1; /* mini UART permanently enabled */
+
+    case AUX_MU_IO_REG:
+        /* "DLAB bit set means access baudrate register" is NYI */
+        c = s->read_fifo[s->read_pos];
+        if (s->read_count > 0) {
+            s->read_count--;
+            if (++s->read_pos == BCM2835_AUX_RX_FIFO_LEN) {
+                s->read_pos = 0;
+            }
+        }
+        if (s->chr) {
+            qemu_chr_accept_input(s->chr);
+        }
+        bcm2835_aux_update(s);
+        return c;
+
+    case AUX_MU_IER_REG:
+        /* "DLAB bit set means access baudrate register" is NYI */
+        return 0xc0 | s->ier; /* FIFO enables always read 1 */
+
+    case AUX_MU_IIR_REG:
+        res = 0xc0; /* FIFO enables */
+        /* The spec is unclear on what happens when both tx and rx
+         * interrupts are active, besides that this cannot occur. At
+         * present, we choose to prioritise the rx interrupt, since
+         * the tx fifo is always empty. */
+        if (s->read_count != 0) {
+            res |= 0x4;
+        } else {
+            res |= 0x2;
+        }
+        if (s->iir == 0) {
+            res |= 0x1;
+        }
+        return res;
+
+    case AUX_MU_LCR_REG:
+        qemu_log_mask(LOG_UNIMP, "%s: AUX_MU_LCR_REG unsupported\n", __func__);
+        return 0;
+
+    case AUX_MU_MCR_REG:
+        qemu_log_mask(LOG_UNIMP, "%s: AUX_MU_MCR_REG unsupported\n", __func__);
+        return 0;
+
+    case AUX_MU_LSR_REG:
+        res = 0x60; /* tx idle, empty */
+        if (s->read_count != 0) {
+            res |= 0x1;
+        }
+        return res;
+
+    case AUX_MU_MSR_REG:
+        qemu_log_mask(LOG_UNIMP, "%s: AUX_MU_MSR_REG unsupported\n", __func__);
+        return 0;
+
+    case AUX_MU_SCRATCH:
+        qemu_log_mask(LOG_UNIMP, "%s: AUX_MU_SCRATCH unsupported\n", __func__);
+        return 0;
+
+    case AUX_MU_CNTL_REG:
+        return 0x3; /* tx, rx enabled */
+
+    case AUX_MU_STAT_REG:
+        res = 0x30e; /* space in the output buffer, empty tx fifo, idle tx/rx */
+        if (s->read_count > 0) {
+            res |= 0x1; /* data in input buffer */
+            assert(s->read_count < BCM2835_AUX_RX_FIFO_LEN);
+            res |= ((uint32_t)s->read_count) << 16; /* rx fifo fill level */
+        }
+        return res;
+
+    case AUX_MU_BAUD_REG:
+        qemu_log_mask(LOG_UNIMP, "%s: AUX_MU_BAUD_REG unsupported\n", __func__);
+        return 0;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+                      __func__, offset);
+        return 0;
+    }
+}
+
+static void bcm2835_aux_write(void *opaque, hwaddr offset, uint64_t value,
+                              unsigned size)
+{
+    BCM2835AuxState *s = opaque;
+    unsigned char ch;
+
+    switch (offset) {
+    case AUX_ENABLES:
+        if (value != 1) {
+            qemu_log_mask(LOG_UNIMP, "%s: unsupported attempt to enable SPI "
+                          "or disable UART\n", __func__);
+        }
+        break;
+
+    case AUX_MU_IO_REG:
+        /* "DLAB bit set means access baudrate register" is NYI */
+        ch = value;
+        if (s->chr) {
+            qemu_chr_fe_write(s->chr, &ch, 1);
+        }
+        break;
+
+    case AUX_MU_IER_REG:
+        /* "DLAB bit set means access baudrate register" is NYI */
+        s->ier = value & (TX_INT | RX_INT);
+        bcm2835_aux_update(s);
+        break;
+
+    case AUX_MU_IIR_REG:
+        if (value & 0x2) {
+            s->read_count = 0;
+        }
+        break;
+
+    case AUX_MU_LCR_REG:
+        qemu_log_mask(LOG_UNIMP, "%s: AUX_MU_LCR_REG unsupported\n", __func__);
+        break;
+
+    case AUX_MU_MCR_REG:
+        qemu_log_mask(LOG_UNIMP, "%s: AUX_MU_MCR_REG unsupported\n", __func__);
+        break;
+
+    case AUX_MU_SCRATCH:
+        qemu_log_mask(LOG_UNIMP, "%s: AUX_MU_SCRATCH unsupported\n", __func__);
+        break;
+
+    case AUX_MU_CNTL_REG:
+        qemu_log_mask(LOG_UNIMP, "%s: AUX_MU_CNTL_REG unsupported\n", __func__);
+        break;
+
+    case AUX_MU_BAUD_REG:
+        qemu_log_mask(LOG_UNIMP, "%s: AUX_MU_BAUD_REG unsupported\n", __func__);
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+                      __func__, offset);
+    }
+
+    bcm2835_aux_update(s);
+}
+
+static int bcm2835_aux_can_receive(void *opaque)
+{
+    BCM2835AuxState *s = opaque;
+
+    return s->read_count < BCM2835_AUX_RX_FIFO_LEN;
+}
+
+static void bcm2835_aux_put_fifo(void *opaque, uint8_t value)
+{
+    BCM2835AuxState *s = opaque;
+    int slot;
+
+    slot = s->read_pos + s->read_count;
+    if (slot >= BCM2835_AUX_RX_FIFO_LEN) {
+        slot -= BCM2835_AUX_RX_FIFO_LEN;
+    }
+    s->read_fifo[slot] = value;
+    s->read_count++;
+    if (s->read_count == BCM2835_AUX_RX_FIFO_LEN) {
+        /* buffer full */
+    }
+    bcm2835_aux_update(s);
+}
+
+static void bcm2835_aux_receive(void *opaque, const uint8_t *buf, int size)
+{
+    bcm2835_aux_put_fifo(opaque, *buf);
+}
+
+static const MemoryRegionOps bcm2835_aux_ops = {
+    .read = bcm2835_aux_read,
+    .write = bcm2835_aux_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+};
+
+static const VMStateDescription vmstate_bcm2835_aux = {
+    .name = TYPE_BCM2835_AUX,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8_ARRAY(read_fifo, BCM2835AuxState,
+                            BCM2835_AUX_RX_FIFO_LEN),
+        VMSTATE_UINT8(read_pos, BCM2835AuxState),
+        VMSTATE_UINT8(read_count, BCM2835AuxState),
+        VMSTATE_UINT8(ier, BCM2835AuxState),
+        VMSTATE_UINT8(iir, BCM2835AuxState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void bcm2835_aux_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    BCM2835AuxState *s = BCM2835_AUX(obj);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &bcm2835_aux_ops, s,
+                          TYPE_BCM2835_AUX, 0x100);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq);
+}
+
+static void bcm2835_aux_realize(DeviceState *dev, Error **errp)
+{
+    BCM2835AuxState *s = BCM2835_AUX(dev);
+
+    if (s->chr) {
+        qemu_chr_add_handlers(s->chr, bcm2835_aux_can_receive,
+                              bcm2835_aux_receive, NULL, s);
+    }
+}
+
+static Property bcm2835_aux_props[] = {
+    DEFINE_PROP_CHR("chardev", BCM2835AuxState, chr),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void bcm2835_aux_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = bcm2835_aux_realize;
+    dc->vmsd = &vmstate_bcm2835_aux;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+    dc->props = bcm2835_aux_props;
+}
+
+static const TypeInfo bcm2835_aux_info = {
+    .name          = TYPE_BCM2835_AUX,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2835AuxState),
+    .instance_init = bcm2835_aux_init,
+    .class_init    = bcm2835_aux_class_init,
+};
+
+static void bcm2835_aux_register_types(void)
+{
+    type_register_static(&bcm2835_aux_info);
+}
+
+type_init(bcm2835_aux_register_types)
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index 5d888dc..889adf5 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -14,6 +14,7 @@
 #include "qemu-common.h"
 #include "exec/address-spaces.h"
 #include "hw/sysbus.h"
+#include "hw/char/bcm2835_aux.h"
 #include "hw/intc/bcm2835_ic.h"
 #include "hw/misc/bcm2835_property.h"
 #include "hw/misc/bcm2835_mbox.h"
@@ -33,6 +34,7 @@ typedef struct BCM2835PeripheralState {
     qemu_irq irq, fiq;
 
     SysBusDevice *uart0;
+    BCM2835AuxState aux;
     BCM2835ICState ic;
     BCM2835PropertyState property;
     BCM2835MboxState mboxes;
diff --git a/include/hw/char/bcm2835_aux.h b/include/hw/char/bcm2835_aux.h
new file mode 100644
index 0000000..42f0ee7
--- /dev/null
+++ b/include/hw/char/bcm2835_aux.h
@@ -0,0 +1,33 @@
+/*
+ * Rasperry Pi 2 emulation and refactoring Copyright (c) 2015, Microsoft
+ * Written by Andrew Baumann
+ *
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#ifndef BCM2835_AUX_H
+#define BCM2835_AUX_H
+
+#include "hw/sysbus.h"
+#include "sysemu/char.h"
+
+#define TYPE_BCM2835_AUX "bcm2835-aux"
+#define BCM2835_AUX(obj) OBJECT_CHECK(BCM2835AuxState, (obj), TYPE_BCM2835_AUX)
+
+#define BCM2835_AUX_RX_FIFO_LEN 8
+
+typedef struct {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    /*< public >*/
+
+    MemoryRegion iomem;
+    CharDriverState *chr;
+    qemu_irq irq;
+
+    uint8_t read_fifo[BCM2835_AUX_RX_FIFO_LEN];
+    uint8_t read_pos, read_count;
+    uint8_t ier, iir;
+} BCM2835AuxState;
+
+#endif
-- 
2.7.0

