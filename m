Received: by 10.25.208.211 with SMTP id h202csp88816lfg;
        Fri, 26 Feb 2016 16:22:44 -0800 (PST)
X-Received: by 10.140.134.144 with SMTP id 138mr5968396qhg.63.1456532564777;
        Fri, 26 Feb 2016 16:22:44 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w142si6977262qhb.59.2016.02.26.16.22.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Feb 2016 16:22:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:52697 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZSei-0003Tw-7O
	for alex.bennee@linaro.org; Fri, 26 Feb 2016 19:22:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aZScK-0007qA-L3
	for qemu-devel@nongnu.org; Fri, 26 Feb 2016 19:20:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aZScF-0001Qa-Bh
	for qemu-devel@nongnu.org; Fri, 26 Feb 2016 19:20:16 -0500
Received: from mail-bn1bn0103.outbound.protection.outlook.com
	([157.56.110.103]:16250
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aZScF-0001QU-4T; Fri, 26 Feb 2016 19:20:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=TGb7laz14hxD3SuI11fN1Z36wur8MuU0Q4Q+Bx8wfqI=;
	b=hxdfM5LfxkLp0pbo0vUKiPsz6OMiSKn499BCrhsmuGrML8HzB6GGIuB1FoMjNBl79nxHxo2KmmiOuRU0ZLr8YBYpKJpFJ4Eka4scOS7lJ3xGsH1c2NdvD/40UMLIwmTunPRG3iZ8SQuBJoQ+avTZwjr5Yn8TJ/dHJ6LXT/ouJGs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:f::724)
	by SN1PR0301MB2046.namprd03.prod.outlook.com (10.163.226.155) with
	Microsoft
	SMTP Server (TLS) id 15.1.409.15; Sat, 27 Feb 2016 00:20:09 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 26 Feb 2016 16:16:12 -0800
Message-ID: <1456532174-17432-3-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1456532174-17432-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1456532174-17432-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:f::724]
X-ClientProxiedBy: CO2PR20CA0016.namprd20.prod.outlook.com (25.163.96.26) To
	SN1PR0301MB2046.namprd03.prod.outlook.com (25.163.226.155)
X-MS-Office365-Filtering-Correlation-Id: 1d2cf312-c9e4-43f9-40db-08d33f0bc09b
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	2:OnoqX5XIReLYpP1o8mfWtNsdNQkUQWh2gg+ESd9m5N78NrbEsPGzbu9iW8Yh8cTi3XnWjLiIyh0X6qYpgasYwWr6AMmYrKvR8XtlvRFq9vMWQiohyv9F/lPcRgCzCIXJO3vl+8HCnb1jdCIIZiyY6JvMw8VDybvc0A5WeHNYVMc3xclDZw0/oNuBBP6ku0NC;
	3:/mAjiXdF3KSJRumlOtvSZycSngY7NRhul7WRBjf7yFUk3X9MVbGGVxq2Z4uytWff/qxSSRXGV/KsfSzwDnlfcoiRjRQ+oOGcLmP2uLiaPPKI98xFHRbl+DeqeWv7G7fG;
	25:Ag/vF2WD/nqbiRBgri5YnOoKSUk1zGthEkbQMwufdP0MqZKLCUEc8BYAlfN3joXtFmjJJErH761L37aleCsy0emShpkgzvllZNtYdo7ghRRJmikEbQZ6aHUOid/Jms7IGmXSxoOZkbSRW4OmYcCtES3Nl8EabeayUXFGTcGMidjrlXxm9tJMpvw82smOGnhK6S6A8rl3HuSLl0Q8bHk02UydMWbG7dbod/GfXv5CIkR6q3uu8c3fA8Bd+sfSo5Rv8tGlovLDJqoPhvwFb/5oi8NXtHfpzybSsVAj6GsGFzrZ6PRevZtvv+BsK422BUzlcZZyWYXSZqtSv5k4wRsO8g==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1PR0301MB2046;
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	20:zkWQKhNEY1uhUzO4ETshQCfFl7vWZC00VMuM5kbkhLtQW/3N+Mjo2pQNaAV36eRtqxvNb3USstUO11PCkdHx8LEE9Ui+YrA013OT8WQ7P/N02jrd66320Aa0HDeJlw+jX/b003bfCFcmfC4xSPshEluzhHwGnctOM0lrlIV05alTPRd1Zm4AtcU8XS88OWy5nkWiUtPNvQesPLJso5yzHWOHgKE3tfcOLW4qpovRPO9nfITbG2++D7BcaNm/0MuJSNt0kDwTvGYWXkuikxQCJ6skCSDIpxT0TjwDODcCC/FEzYhlYJC0kMxvRSYdRUiIpcnTrkD78ssxF1ChIFrGgaf+ulmUU2HLj95/u3tuu12Jd5Ht5qDNUG4SVeo9TEw++Ws/VixmcsaN/wIrkPC8fWz1CH6ico559zXGYZxhZUwApxYDlMdyN7RDM5yY4QPcdyAgWJCLLFac/qWiBkDJnagSNG/O8l9I4/U9qfUYouW/VmlBnH+UljPRezlmhyqN;
	4:31F3LV3dByBPBbVk2GfcqQLTFyszrTlAnwPwqOnkh9X3tlAeCVWBPVTt+tMyBbM3irzooqOuANmkM2ZBIHKFwMwiSCjzUmlYD01KbGO+42yeMGLV3VL2lq+1/QYMMIFdw6k0m7epjdtQ1ndgRg84s3CoADOICRpqB0k9/wgRjh5vud/qUZz4Wuo/EddT6Vi2Rwy9sp7vWz7PCVSrmCWoGW/ZtoS/iaqE91xdo9/cC3ICKxJm5fxmcjNKmWuikGFNJUxmMjQ3VdVR6vTxBXuAPvXtzUeD+U9+f6Fp2TsAEHjSGNOPK/zhEa52AQlsug4OIPpLChENK5VFngqdTUgh7ga2AFM6v6ii8xwaNK8WGYucCDAHkMAET23GC13e6gFI
X-Microsoft-Antispam-PRVS: <SN1PR0301MB204691C1E62C1D733332878C9EB80@SN1PR0301MB2046.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:SN1PR0301MB2046; BCL:0; PCL:0; RULEID:;
	SRVR:SN1PR0301MB2046; 
X-Forefront-PRVS: 086597191B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(36756003)(122386002)(87976001)(5003940100001)(10090500001)(86612001)(50226001)(40100003)(50986999)(86362001)(76176999)(189998001)(4326007)(47776003)(5005710100001)(10290500002)(5008740100001)(4001430100002)(92566002)(2351001)(6116002)(229853001)(586003)(1096002)(42186005)(110136002)(19580405001)(50466002)(77096005)(2950100001)(2906002)(107886002)(19580395003)(5001960100002)(48376002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN1PR0301MB2046;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR0301MB2046;
	23:i7mSZnMpBdwY80pIqdmw5GpwVXWEDvRtKIJ8jYz?=
	=?us-ascii?Q?4GXDVKr5Ssjepa2o/yGJ4yCDoCqFlTSuGPAV632sXwp4+/WsP2ESNBgtAOHk?=
	=?us-ascii?Q?XUKrASrTQWiRDe2s2jydsu7abB7p/dY+OtboLWUYrYKH4Y+olnELp4OdMmLA?=
	=?us-ascii?Q?T54NTvwTxrWdo0PlErrpq3AZzkPvI/QqGkB1jj7OHQFPqClEgIvjRZmyAyBJ?=
	=?us-ascii?Q?1qQ51DQ/JOt5qOFTBTqpd6n5nzHYM+ME+bpOlQoc90aR0TLqmk4+Cs4d2nw/?=
	=?us-ascii?Q?PQ8Cq13BeTAbQ4q2xxfutR19F9qIvV/K4HMUu1QLsAwFt/jKCdcTnUNV4vDZ?=
	=?us-ascii?Q?C7JfZqrWMOTcobIe1lhz7LotC4H+RDJ4n8bOHUC4dAlHPiX2VVIBmI8jCVTq?=
	=?us-ascii?Q?XZSQdhEd9M9qQEQ/SyulE8AUkVwYKBcOP5nO1J6GmwEjePms99J4xtoX5Vzb?=
	=?us-ascii?Q?f5DmHsI1ew7iiVskxGNONGvc3pKYsTV2OR2F8XwwTNCYuVBuXcO0gT96YxrM?=
	=?us-ascii?Q?jZ26r42JgPHW5b1/bcv/75vaAot6LxDYANmQrJkbLJFkn9SQ1E62LHsDfx4n?=
	=?us-ascii?Q?vyTtGKlxms8iUWr+xo5t8eftjsx5gNXxfxrdXtU7tk6qfmYjDHGVOYvWEWSR?=
	=?us-ascii?Q?fehBY5IKF2Wz9p4zH22h4QLbQOKRbR+OD01CMzWk5YDUOxFhWDTs7YnZr9xL?=
	=?us-ascii?Q?yx1z5emTe7zSKi164IoB+8pXbBXe3gcaC5YvCUaNuLmSRiz2mUz7q+hIrO7K?=
	=?us-ascii?Q?vViidKC78CQfxPuU3KS0AlVg1QjBp25dNlgsFIQ06g+eZ7JXsUctOuQq+r47?=
	=?us-ascii?Q?qD3YPq7XuX2EhrdroZmJbxnCItCmnFo3TdfatSgb2QNrITDXfiGXkDhbaMVA?=
	=?us-ascii?Q?HnOdVRfbiLyAMI50IlFjV8OwQBWAmNG7RF40yqq5f1K3JlEyW0LAhN6XihBN?=
	=?us-ascii?Q?p45b/NiOLGjWAXlzbB41XYZupY4hHvVeSkyOy0q/5c9aZb3m0GPWvjiaAke4?=
	=?us-ascii?Q?2nNlw1mlIX+QjzR+zCoGMA/4GBU5WVnKJ9E/zd/QyCS3ZXw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	5:ZpONaXC3lKXn6Fd9CSeQa0HPKAt5k9An3qc6gWy0101d5zodmb0KAe/MssLF+nR5CFYdGGxPhchtA550upM+pyaLp3PCVjHRfK4XfgAqlYwcMq40EeTM8X37hJfUaIe1P/PWTP0rHIVbfIhHzlk+sg==;
	24:JuKmCodLcg/aaFBU3nunMWcrZClapr60bpTESVlz1I9wj2dHCIIcVItAsmhTlbOxWIajTucRxJCbSW9EFzPYY+Yj6/25uZKYrXfU2GCn7J8=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2016 00:20:09.2805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR0301MB2046
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.103
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH 2/4] bcm2835_aux: add emulation of BCM2835 AUX
	(aka UART1) block
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
X-TUID: mT6hwrTEOHUc

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---
 hw/arm/bcm2835_peripherals.c         |  18 +++
 hw/char/Makefile.objs                |   1 +
 hw/char/bcm2835_aux.c                | 241 +++++++++++++++++++++++++++++++++++
 include/hw/arm/bcm2835_peripherals.h |   2 +
 include/hw/char/bcm2835_aux.h        |  31 +++++
 5 files changed, 293 insertions(+)
 create mode 100644 hw/char/bcm2835_aux.c
 create mode 100644 include/hw/char/bcm2835_aux.h

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 6ce9cd1..103a330 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -48,6 +48,11 @@ static void bcm2835_peripherals_init(Object *obj)
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
@@ -131,6 +136,19 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
                                INTERRUPT_UART));
 
+    /* AUX / UART1 */
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
index 0000000..c2f71e5
--- /dev/null
+++ b/hw/char/bcm2835_aux.c
@@ -0,0 +1,241 @@
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
+ */
+
+#include "qemu/osdep.h"
+#include "hw/char/bcm2835_aux.h"
+
+#define AUX_ENABLES     0x4
+#define AUX_MU_IO_REG   0x40
+#define AUX_MU_IER_REG  0x44
+#define AUX_MU_IIR_REG  0x48
+#define AUX_MU_LSR_REG  0x54
+#define AUX_MU_STAT_REG 0x64
+
+static void bcm2835_aux_update(BCM2835AuxState *s)
+{
+    bool status = (s->rx_int_enable && s->read_count != 0) || s->tx_int_enable;
+    qemu_set_irq(s->irq, status);
+}
+
+static uint64_t bcm2835_aux_read(void *opaque, hwaddr offset, unsigned size)
+{
+    BCM2835AuxState *s = opaque;
+    uint32_t c, res;
+
+    switch (offset) {
+    case AUX_ENABLES:
+        return 1; /* mini UART enabled */
+
+    case AUX_MU_IO_REG:
+        c = s->read_fifo[s->read_pos];
+        if (s->read_count > 0) {
+            s->read_count--;
+            if (++s->read_pos == 8) {
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
+        res = 0;
+        if (s->rx_int_enable) {
+            res |= 0x2;
+        }
+        if (s->tx_int_enable) {
+            res |= 0x1;
+        }
+        return res;
+
+    case AUX_MU_IIR_REG:
+        res = 0xc0;
+        if (s->tx_int_enable) {
+            res |= 0x1;
+        } else if (s->rx_int_enable && s->read_count != 0) {
+            res |= 0x2;
+        }
+        return res;
+
+    case AUX_MU_LSR_REG:
+        res = 0x60; /* tx idle, empty */
+        if (s->read_count != 0) {
+            res |= 0x1;
+        }
+        return res;
+
+    case AUX_MU_STAT_REG:
+        res = 0x302; /* space in the output buffer, empty tx fifo */
+        if (s->read_count > 0) {
+            res |= 0x1; /* data in input buffer */
+            assert(s->read_count < 8);
+            res |= ((uint32_t)s->read_count) << 16; /* rx fifo fill level */
+        }
+        return res;
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
+        ch = value;
+        if (s->chr) {
+            qemu_chr_fe_write(s->chr, &ch, 1);
+        }
+        break;
+
+    case AUX_MU_IER_REG:
+        s->rx_int_enable = (value & 0x2) != 0;
+        s->tx_int_enable = (value & 0x1) != 0;
+        break;
+
+    case AUX_MU_IIR_REG:
+        if (value & 0x1) {
+            s->read_count = 0;
+        }
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
+    return s->read_count < 8;
+}
+
+static void bcm2835_aux_put_fifo(void *opaque, uint32_t value)
+{
+    BCM2835AuxState *s = opaque;
+    int slot;
+
+    slot = s->read_pos + s->read_count;
+    if (slot >= 8) {
+        slot -= 8;
+    }
+    s->read_fifo[slot] = value;
+    s->read_count++;
+    if (s->read_count == 8) {
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
+static void bcm2835_aux_event(void *opaque, int event)
+{
+    if (event == CHR_EVENT_BREAK) {
+        bcm2835_aux_put_fifo(opaque, 0x400);
+    }
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
+        VMSTATE_UINT32_ARRAY(read_fifo, BCM2835AuxState, 8),
+        VMSTATE_UINT8(read_pos, BCM2835AuxState),
+        VMSTATE_UINT8(read_count, BCM2835AuxState),
+        VMSTATE_BOOL(rx_int_enable, BCM2835AuxState),
+        VMSTATE_BOOL(tx_int_enable, BCM2835AuxState),
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
+    /* FIXME use a qdev chardev prop instead of qemu_char_get_next_serial() */
+    s->chr = qemu_char_get_next_serial();
+
+    if (s->chr) {
+        qemu_chr_add_handlers(s->chr, bcm2835_aux_can_receive,
+                              bcm2835_aux_receive, bcm2835_aux_event, s);
+    }
+}
+
+static void bcm2835_aux_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = bcm2835_aux_realize;
+    dc->vmsd = &vmstate_bcm2835_aux;
+    /* Reason: realize() method uses qemu_char_get_next_serial() */
+    dc->cannot_instantiate_with_device_add_yet = true;
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
index 0000000..f917619
--- /dev/null
+++ b/include/hw/char/bcm2835_aux.h
@@ -0,0 +1,31 @@
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
+typedef struct {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    /*< public >*/
+
+    MemoryRegion iomem;
+    CharDriverState *chr;
+    qemu_irq irq;
+
+    uint32_t read_fifo[8];
+    uint8_t read_pos, read_count;
+    bool rx_int_enable, tx_int_enable;
+} BCM2835AuxState;
+
+#endif
-- 
2.5.3

