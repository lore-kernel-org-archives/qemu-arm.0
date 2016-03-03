Received: by 10.25.208.211 with SMTP id h202csp13236lfg;
        Thu, 3 Mar 2016 10:26:08 -0800 (PST)
X-Received: by 10.140.249.6 with SMTP id u6mr5252553qhc.83.1457029568535;
        Thu, 03 Mar 2016 10:26:08 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h22si19037792qge.80.2016.03.03.10.26.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 10:26:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abXwt-0005IK-PR
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 13:26:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1abXvl-0003pm-QO
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 13:25:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1abXvh-0007Z6-Lc
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 13:24:57 -0500
Received: from mail-by2on0131.outbound.protection.outlook.com
	([207.46.100.131]:35372
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1abXvh-0007YX-Bf; Thu, 03 Mar 2016 13:24:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Una7TBM/lOxBBFnfgrvGRwqXLTpLr5AupaVel817VNE=;
	b=jrNFV+36w+i66V8+HD36gImvXtO2vSby2Cnxe/GNWplR7PAbagubOnwunCD5exDS67wK7z+qyEsjLtVY9X8v8kfvBpZLHx/HK+QlD2dCBY7XW4BYRNvro8szTiv2x0xA/TEg5Wx3zh4cQJ7jGOjk/TxkEfdKJMuoJ/bQIIPdkfA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:5::724)
	by CY1PR0301MB2042.namprd03.prod.outlook.com (10.164.2.24) with
	Microsoft
	SMTP Server (TLS) id 15.1.427.16; Thu, 3 Mar 2016 18:24:51 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 3 Mar 2016 10:24:36 -0800
Message-ID: <1457029479-11312-3-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1457029479-11312-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1457029479-11312-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:5::724]
X-ClientProxiedBy: CO2PR20CA0017.namprd20.prod.outlook.com (25.163.96.27) To
	CY1PR0301MB2042.namprd03.prod.outlook.com (25.164.2.24)
X-MS-Office365-Filtering-Correlation-Id: 680e503d-38a6-4ad3-fe58-08d343911c84
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2042;
	2:EDZZe44mpHPlka0AiSGcSZULoE1vgQrmAxoGtheWjhpydFIbjL4Zno2RDXIPC1i9/Zm3uNXD2Xyv7LrBzGpTW855o18+R3kH1QZLua0MFT99rPfUPfhsu1c6yZImABF3VWyaVZy51PAZHGDv/jNXe/yJjdl/hHb3hwPjpjmhI3zNCcW+th6mO11vKkD8+CSM;
	3:DJ46S3SDeM6UV7RYGFzRasJkZRwU8OCpJCNxo3pSmc1HrExBOq+RcJxJV9/PErByycuuTSVxbly93dr4jwIVRX3t6qN1wCEeN46JLBOZrYggK01nZSY3rhvHCIRoQtQI;
	25:CnoItTHRlnpkxhra/ZzWaEVAfmivx99sK4u7OgZdGXTeInQLXQAkXY4is/X0Hy5XlsfPFrc6Bt6V9IAxjsi2z6bOtXZZFur5t5HUzqlGgcwgjgrzmy5lyChWS7gXLH+S1G4tru9Gbsu3Zfwezn6VjcKuBQz8/wo2P2pXwqpz4z+mlUvjDr/RoMKRr1vR47CbL44zB8vbVyVMWp6EUEwG0a132fkUtVkKGZklRRvkcVZLuFqxieT+hgQvQsZRsW/wIBT5cm/8INCRzzv1cBR42r+5gcdJQ1W+T+k2LFpidcDP3qTYWDOlgezhcyySS3f+IxzhcI7tnq7UUc9nIO58CZgf8kyWA2N8TiUUIzJ5oag=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB2042;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2042;
	20:0oW/zZitiaHO/mTZrCUIwmZK4gqEPXZsljlwnCwMtXHiE9II+5wMY+wxt6ehtYY8L1W2LrK+WHvcrrx8tdQEdE6I5+DG59G1nxRnmKT4i3bdPXn81p3B0yWiu2ZTaq3EpsYSn3zZSBhaKn3qHug+sKBi8vThxN9B3MMoxy4SwGh1i0062hwuSw5Y4+5Qld8w5Jynn65B05FfSLJ5K31G/RGJAdpZ8sdp3y+TuIJgS5sEdG91GkhBfJRPQL5ysoLM4cwgxobyfFrCSF/sPLoJzlF3lQ/FI4u+SOJ5bBzsakItdsB+p1O27WG+ZUQYzQEWEO4Tr5lXc8PDZqz3z3efWKkC0MEmYLkfT7yuVD23oMm2F5RbNO3REbzrbB7RTAEiveNLLe5fjgxDHInyPBWOz/bQL611ubsI+OLgeQYQwFkwfLgLybIcA60Gau4CUNG1qXNRgMF8Wp5phqR9WnGADlUFqxy2cU02Lav+zxOJRYTH6cFWTjK7benOxKeQpVWt;
	4:zBb4+pk/oVRXgSKltT3zl+udcrtaDIMh0I6FjjYaYpMWGlKcmYIQ/cfZIv83ZG76VAd4LPfRiXNaBUO3gG0h2Vxq1Pmg08nx7jMroX8i1eVBUQWBjnHndxXD/NqRyN3egAnfd74TXXqG3IEtwq1n9V3f8F2qbWJWVVoAJEXpMg0pEsHiqsXrNY7Iq7rd38m5wZjc7bs1snMuYJLChUXrxCh8l865yA4GYNZsgL57dVgqLTNr0Yz+HNA9RUkNhiI1o8xZLc4pHNf9DFA1BZVHX1IwnJWmDlyB0FVJv17MhEhL/xkErea5+gcoS8636uUwzwT5dP1/QRgDpgB28EeqBa6N/vZ5JTWeFJCJ2UMH8azCAU53AvBclVbPSY47UkU9
X-Microsoft-Antispam-PRVS: <CY1PR0301MB20421BB281B09A63536557C79EBD0@CY1PR0301MB2042.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:CY1PR0301MB2042; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB2042; 
X-Forefront-PRVS: 0870212862
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(2351001)(50986999)(4326007)(76176999)(1096002)(2906002)(5005710100001)(87976001)(10290500002)(40100003)(36756003)(4001430100002)(6116002)(47776003)(586003)(122386002)(42186005)(92566002)(86612001)(19580395003)(77096005)(10090500001)(575784001)(5003940100001)(86362001)(19580405001)(189998001)(2950100001)(50226001)(229853001)(48376002)(5008740100001)(110136002)(50466002)(5004730100002)(107886002)(81166005)(21314002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB2042;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB2042;
	23:OCmNOt5FFa9gBIY/Bs60ju/sROYx6rOW8g+wfX4?=
	=?us-ascii?Q?ONHjCalttFLQR60Zqr7BBxBASiiQ+NNPa0lAA/kvJobdKo5t9yOihX3S3By8?=
	=?us-ascii?Q?2eCJsbbxDRXJW96PhoTcMNuvTGygXpF1h3Zz8Zt6QXEMqOOgsSdNca0Mrw2U?=
	=?us-ascii?Q?+zbsxcNDaoCprW4PgWxrpXH0oUkzeINUJyNHUjXYw4UWVYRbNwbMzRmMWAhG?=
	=?us-ascii?Q?M1uDrEJK7GkChcZfRXx3myJma96PfZqgsp/Lsp9Za7ZVUVv1Sa8BbtYZXLy4?=
	=?us-ascii?Q?BAcvifd1V4puNrvtc6nj6yyDw1CjXzqM90fYh2QBSb19K1nZYWxmuq3FRWWJ?=
	=?us-ascii?Q?g5EoLfpsdMce0oyinR2hx0VE7bC29uxTlgPEcmgV2zOpYXtpqsk9BosCsndq?=
	=?us-ascii?Q?2ZYrtOrVHgZgYcmJx+2VeFTZnq2zq01IKD31C+zAilj4BQAGtm9ckxPIdUrr?=
	=?us-ascii?Q?NoBcJSUEQqzheYxj6NsyNILnMV1EZu67LtDo4gfJmNWKCjD61W/5V9atyKon?=
	=?us-ascii?Q?1qOaM1D0tl5bflROackOQ8KxUN1mztVUK55dIqD/ePDeCZP+v03D99Qu4j1s?=
	=?us-ascii?Q?jfJaZHu404Dtj9W+d0BoNICPN6pxm/M35laDTVxlaDIzfpEmeC++YgZxVeQO?=
	=?us-ascii?Q?EAavbJYqQ1vbXI+3wnObSGaTvSCUiChsNqgiH73F2e6slnX68Y3Pt3Eolxtz?=
	=?us-ascii?Q?1lO6AbyA+vX6hQsfgm3iVuPlT+WOs8MbgvfdNanN3ttyCa1Pne1Gtk2RIKAE?=
	=?us-ascii?Q?VBQ2FnXqjtaId48N+6LdYkZ9LMV0zmId5CZvrr6Trmrg0oz1dG+qdiw/UJjC?=
	=?us-ascii?Q?PUmLoDoqKsiWYz+guPfgoSzwQKheiPvTNUvD0cW1grqJ0U6Saa3sonWkYkdy?=
	=?us-ascii?Q?mfVk4HL2N5I5/zrMRq12BLL8LnEWK0utRvuKh2OoKMa+m8sNwinJ64YTk2Ts?=
	=?us-ascii?Q?7I2IqzZZqJmOjQcAM/fa5l4NPWQvfl/yHX0qCpvoppyt1bI1VAFh4bECjwiy?=
	=?us-ascii?Q?zsXv9m7mVryO6i+IN5nEZX30JlYXVWBA9H+5hEVuTNUrl7/80o1+K6EzTrve?=
	=?us-ascii?Q?g3VxUt1sLH9BCvo6AhN6oy+wzd36yDJulaInl5QkGj0Wme8KkNiKqyABsD+Z?=
	=?us-ascii?Q?QHoaNFNj9hBI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2042;
	5:7Gvrk/cqhFjVg+7ECsID7Zos3G5HDgexOuJW5m9lVSOWJz04OLLOHGvm6+s/1s9ciRpcmW/4K1cjL1J4KZXoLaG+V96G7lXPIqQwUV0DdTZIex4o2i6cnIiNXYmD9Ij8zDeKJj2FyJXsyECUKEdqfQ==;
	24:tMROYt9MJeZEgwd+2kqF8QgJeFhO9LcZbDNAicGp7FOTJCgUxQc18LqYXsEZNmNt+aBlLnTg0dY97cUqOVW9GdDMaaFf8fRDtXNApPj/SsQ=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2016 18:24:51.3887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB2042
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.131
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH v2 2/5] bcm2835_aux: add emulation of BCM2835
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
X-TUID: RaWmlpJiL3sN

At present only the core UART functions (data path for tx/rx) are
implemented, which is enough for UEFI to boot. The following
features/registers are unimplemented:
  * Line/modem control
  * Scratch register
  * Extra control
  * Baudrate
  * SPI interfaces

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---

Notes:
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

 hw/arm/bcm2835_peripherals.c         |  29 ++++
 hw/char/Makefile.objs                |   1 +
 hw/char/bcm2835_aux.c                | 316 +++++++++++++++++++++++++++++++++++
 include/hw/arm/bcm2835_peripherals.h |   2 +
 include/hw/char/bcm2835_aux.h        |  33 ++++
 5 files changed, 381 insertions(+)
 create mode 100644 hw/char/bcm2835_aux.c
 create mode 100644 include/hw/char/bcm2835_aux.h

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 6ce9cd1..375e341 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -12,6 +12,8 @@
 #include "hw/arm/bcm2835_peripherals.h"
 #include "hw/misc/bcm2835_mbox_defs.h"
 #include "hw/arm/raspi_platform.h"
+#include "sysemu/char.h"
+#include "sysemu/sysemu.h" /* for serial_hds */
 
 /* Peripheral base address on the VC (GPU) system bus */
 #define BCM2835_VC_PERI_BASE 0x7e000000
@@ -48,6 +50,11 @@ static void bcm2835_peripherals_init(Object *obj)
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
@@ -79,6 +86,7 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     MemoryRegion *ram;
     Error *err = NULL;
     uint32_t ram_size;
+    CharDriverState *chr;
     int n;
 
     obj = object_property_get_link(OBJECT(dev), "ram", &err);
@@ -131,6 +139,27 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
                                INTERRUPT_UART));
 
+    /* AUX / UART1 */
+    /* XXX: pl011 (uart0) uses qemu_char_get_next_serial(), so at this point it
+     * should have claimed the first serial device (if one exists) */
+    chr = serial_hds[1];
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
2.5.3

