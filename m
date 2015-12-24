Received: by 10.182.158.201 with SMTP id ww9csp4394904obb;
        Wed, 23 Dec 2015 16:26:04 -0800 (PST)
X-Received: by 10.140.174.68 with SMTP id u65mr47682774qhu.62.1450916764110;
        Wed, 23 Dec 2015 16:26:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d30si13582507qge.54.2015.12.23.16.26.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Dec 2015 16:26:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:58392 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aBtjH-0000Nw-LS
	for alex.bennee@linaro.org; Wed, 23 Dec 2015 19:26:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aBtjD-0000GD-Sd
	for qemu-arm@nongnu.org; Wed, 23 Dec 2015 19:26:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aBtjB-0004vo-T0
	for qemu-arm@nongnu.org; Wed, 23 Dec 2015 19:25:59 -0500
Received: from mail-bn1bon0145.outbound.protection.outlook.com
	([157.56.111.145]:30720
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aBtj3-0004t4-BI; Wed, 23 Dec 2015 19:25:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=vRXe+xlrA8QZRmbNC2mb7b9eVbMD1UbLHLAZH9jnz10=;
	b=oY2TOIE3MVOawXr/GEQLJvV7R1iwTQWl2hnvtABt8VNdEiUJpl9pBf4/CoF/PvPQPm8mmBNEiJZwIrOM5ZPVMgCA0j0q8l0+g4EWXa+h2sAYdlO5jF5Z7LgpOkvyuS8+7gvbFsiJif4S6nh5e1vuQigwh9MYpBgurDxh0cPGtuM=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:4::724)
	by BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with
	Microsoft
	SMTP Server (TLS) id 15.1.361.13; Thu, 24 Dec 2015 00:25:46 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 23 Dec 2015 16:25:25 -0800
Message-ID: <1450916731-5968-2-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1450916731-5968-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1450916731-5968-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:4::724]
X-ClientProxiedBy: BY1PR16CA0031.namprd16.prod.outlook.com (25.162.29.41) To
	BLUPR0301MB2033.namprd03.prod.outlook.com (25.164.22.23)
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	2:K0duSbX/EGdlLLA//wJ47YOoq4M77FbIe6GAvKOeYw6q72Z5QUN1UAZoK/V3RvCOOfbcaZXWjo5jU/5gqoFxFCaIhwJWFaIdJkmUdi4ZAtgWQmJgQDhlGb9VrbNStDs/TlpJbqEXgdGi1YcHt4Okmw==;
	3:Y2oozB9ImHrUrOQ2XSKyiCic869oBejYStbb2vd+SH9gLGyfE9y0FgQqw0VDelU9GSIWN/PI+mK6a5XwFtIO/CPWvR4YkfbiItwMhVA8ts0QtcbOzbLVgwzdX5hFZ61B;
	25:npNvRig3oo3sqsft/AsSkfYejlAxjKlVC3ncED/R9PeHXEadfwUqMJ4yYdeHK3Gu9AmFWZhf/kTcBZDioI2c5OBufTqQnl1QLkCSzMA8mlLL9M8i4j2ky3GEJ0sI0cvHycENVkm/0dVznnim584cYt8/AN2IU03WCDltYt3cISY9HAQJEoZ7cG7bqdrbZQVdLGZY66zMEwfMcu6MdjoogsgPFBVx41zM6CsMGURfL7EJauqv/QXSl1bUqBybLjhIuVsXE7qacvPeDDrn2NACcBKV2pxV+GCht/gxVqRNeRk=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2033;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	20:FjqLeSNAvSKln9FuIIiihrgEFN9uhoIn4Id4JBGx2Y4EaptKBU5nbquaowDsHJFArXNGwktf4e51rdY0+is+Yi5CdbOgSlbx2hV/NcJQdZqoXyaoSfVwRpiRfS2FIJkKnLKtUBeyzHVbgg69Bp+YfkU/0C59vItYSO95wT+g3QmM5zvY1zNpo251FJN6YafIIhrbRkWelKiVEnsT++I1Z9KseFp+8xp6LJl71BSaqbrd+DJpZHDrPWGuRsPJ7bmpsvzv9cH7xjXAl/dUo8lYmCRKa859YSe8P7Xj3RCLooVIoqd1bXW+1w0kozxEjxbhEcI/Rx9UR86gxClIJVberfEWnIuRApvXqrA3YtGr5lk5KoRnKG8UwDfP6cCeaDdw1v+rvTbcgTNftFlxIXYqsn4n4RS/WeJfg+SAWCrAe5OCQVfG3dZ126F3s9y7TAFIW2pgoDOYcftmtZ7+6s8oWl4syYfz2BM+WnKj1AqKcshp+nUOSrb4DH1hRAn2CmIf;
	4:KKIjIgYNgJHdSavkTTnQwXS8vq1vRvUS6deH2QhFPiozuQxejwaSLpHGDjkFPTQJmSIBO++8BivXhpnziBwUop15Yg5Hjw5AVyzQe4GcEMik2pHJ2NqwvzLsTILY8CiwHn/WtisARvnVUDWEdI90SyEtdLYigasjQuxIwN4dR0XY5QXQHuXbVVXmVh+B0fIjhlJ113e87ACXFmrz/JZgXSUZOPttDZ/DrWK2FvfCU/nHZ58Au7aVESApt82b+an5JSTaTXCKD2/ZZlaXWf1eiTO7UZnebZEneSqYrmbWb5QNi9zn/eJd4bCvc0REAUdHBDgxIdTZ9P9DIUOEJTyNbtV7NsytSv+9dZ3md8vV5GzrEc9TgR6sGNyk290i82rl
X-Microsoft-Antispam-PRVS: <BLUPR0301MB2033B3A7B89EF4C46BEF70EF9EE70@BLUPR0301MB2033.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(10201501046)(3002001);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
X-Forefront-PRVS: 0800C0C167
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(19580405001)(42186005)(122386002)(97736004)(586003)(81156007)(1096002)(4001430100002)(19580395003)(92566002)(5008740100001)(40100003)(2950100001)(76176999)(575784001)(101416001)(87976001)(50986999)(48376002)(86612001)(6116002)(5004730100002)(50466002)(5003940100001)(110136002)(105586002)(5005710100001)(10090500001)(47776003)(36756003)(229853001)(189998001)(5001960100002)(2351001)(86362001)(107886002)(50226001)(106356001)(10290500002)(77096005)(15975445007)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2033;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2033;
	23:pCRY8HT2Gc64Yo8Mo5ZQskTcs1Qyod7H/WSqxIC?=
	=?us-ascii?Q?xQ9XQfnxsjbnkD5EK+955Scrn7Ccd3Ow/LJyo0Yt9Nk5t0riYXN9rQAwz1Ho?=
	=?us-ascii?Q?65awbEXKA52W1PycAifc1BINv9WdqHHK1vlhrJnbz3mjHhfcd8LD6MtnQvo8?=
	=?us-ascii?Q?UE/2YiMPX+pc2AxHHNJGGvAcjoB+ZrO4Skn0+rGEcw21TmwrBI0U/DFrVWLj?=
	=?us-ascii?Q?nwZ7bfvX43e5BeA0H5N+N4GQcZs/2bNimYq5IwFq4teW2zolQhOU/e/PbS8i?=
	=?us-ascii?Q?UVKW0tbh3ct1OIhPCF5S8HdPhRAxB374gDYeOcpETJuj+FM+ig+WZ53Tkn9B?=
	=?us-ascii?Q?AbuBRoZWm8iMuwTOPI8DZz3Wg8Tgs5TnpUGcPgkdcTXERa6f7atXt/4iY36C?=
	=?us-ascii?Q?PJIhxrC26QyRk2fLsFc2pLHQvp41jjTggFB6iBwNppVHzXCpXcY2Ozn6epcE?=
	=?us-ascii?Q?zpNl0lerOfFqx0O4QOgjr1InHQrKksVu359c3GE39GSCEU3IcxGOH+nN+w6i?=
	=?us-ascii?Q?LNvRml7fB0J5fJ48XG2PzGhJywlgX5/OXJuvtJoTCvxH4AAm4sBupw+L6TpY?=
	=?us-ascii?Q?3ZlX4c/gVSiCNLL0KEANutvFQn07uMBO6c6W+uI5nrBtIHpGcPgiaCyOQSzd?=
	=?us-ascii?Q?jOLJ3g9zi3wWXeBUmq/dnfl+2YTegYlbNhO+lNGK4fsBrw7yVqU/DFTmKANP?=
	=?us-ascii?Q?ptBj2642XLZ/d00ze10B88LfAvTwPKXsvMF8bC1g9yeDm97AgfbLxErCxLVC?=
	=?us-ascii?Q?kznMj7e9wf7NdWJaYJCJS8Uo/nc03WOhJwp4L6TI8+pIJceGFxw9/5HftiuN?=
	=?us-ascii?Q?3cjEuLBXSFN8TTQD5POikK/6aW+C/mHEQUyO4fQ8WP+/F44Uju6ewO5/Qlx4?=
	=?us-ascii?Q?XrIYwkY4WXTJs78SvNcLSmbPxXFfhlpyWB6MpDvpTbQoT6j4ey3TafQ//7+U?=
	=?us-ascii?Q?g6G+UjllgpVPf1ExFFOHJohoNDz8iD160n8W3R4g8TVaWUrb2RlO96yhA0kY?=
	=?us-ascii?Q?P8y55a2cB/bjxFz7e/AgEJckCaHz1g999L6nOI1j8RyPrxTXB/s7nCb7FcD4?=
	=?us-ascii?Q?baZ7ciFDF0jy1hSYSJb2Z/Le8MfPs/gBHHoj4VZ3BZPSrihQiw3yBxyvOSR9?=
	=?us-ascii?Q?dTY7aDTGPjeDthU0Nl6YT3svikY6A64ZXDBVQK3GgATno8CwHTsAXeWFEvUu?=
	=?us-ascii?Q?+FIiNxpczEtCU8ta6pooCWxH9l3zLCwDPJTfr?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	5:YtJpbup3mrgGU/q8DAaw4IhZxVSpZ4Ow9H6PiZU41JHVP+Z3xrpT8Q8N35cZ7MZcYlUEYtAkIB0Jnoj/EvYI4/3A6k9AkTGQSDrNwgsAl5kPdzioUO2EYQ2OsPs5JPPC5meLvg2USstXQ+InRtmeYA==;
	24:NiHMYfuktqYQUZuZIxTKu6GZjhKF8SCRYibC/cl6YKCHJ0AWHVXGlHJnZCtiaAVmKfwFwaD7oq6qYTi5gGAVAmJwVVtW+AlLuJGeQjETJYM=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2015 00:25:46.7273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.145
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-arm] [PATCH v2 1/7] bcm2835_mbox: add BCM2835 mailboxes
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OTrRZF7XH/5p

This adds the system mailboxes which are used to communicate with a
number of GPU peripherals on Pi/Pi2.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---

Notes:
    v2:
     * renamed bcm2835_sbm to bcm2835_mbox
     * dropped bcm2835_arm_control.h (needed defs moved to bcm2835_mbox.c)
     * documented use of private address space through defines in bcm2835_mbox_defs.h
     * remove unused fields from BCM2835Mbox
     * s/int/bool/ where appropriate
     * cleaned up logic in _update and _mbox_update_status for clarity/simplicity
     * added vmstate
     * misc cleanup

 default-configs/arm-softmmu.mak     |   1 +
 hw/misc/Makefile.objs               |   1 +
 hw/misc/bcm2835_mbox.c              | 323 ++++++++++++++++++++++++++++++++++++
 include/hw/misc/bcm2835_mbox.h      |  37 +++++
 include/hw/misc/bcm2835_mbox_defs.h |  26 +++
 5 files changed, 388 insertions(+)
 create mode 100644 hw/misc/bcm2835_mbox.c
 create mode 100644 include/hw/misc/bcm2835_mbox.h
 create mode 100644 include/hw/misc/bcm2835_mbox_defs.h

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index d9b90a5..a9f82a1 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -79,6 +79,7 @@ CONFIG_TUSB6010=y
 CONFIG_IMX=y
 CONFIG_MAINSTONE=y
 CONFIG_NSERIES=y
+CONFIG_RASPI=y
 CONFIG_REALVIEW=y
 CONFIG_ZAURUS=y
 CONFIG_ZYNQ=y
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index aeb6b7d..e36f2ee 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -34,6 +34,7 @@ obj-$(CONFIG_OMAP) += omap_gpmc.o
 obj-$(CONFIG_OMAP) += omap_l4.o
 obj-$(CONFIG_OMAP) += omap_sdrc.o
 obj-$(CONFIG_OMAP) += omap_tap.o
+obj-$(CONFIG_RASPI) += bcm2835_mbox.o
 obj-$(CONFIG_SLAVIO) += slavio_misc.o
 obj-$(CONFIG_ZYNQ) += zynq_slcr.o
 obj-$(CONFIG_ZYNQ) += zynq-xadc.o
diff --git a/hw/misc/bcm2835_mbox.c b/hw/misc/bcm2835_mbox.c
new file mode 100644
index 0000000..69b8e2a
--- /dev/null
+++ b/hw/misc/bcm2835_mbox.c
@@ -0,0 +1,323 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * This code is licensed under the GNU GPLv2 and later.
+ *
+ * This file models the system mailboxes, which are used for
+ * communication with low-bandwidth GPU peripherals. Refs:
+ *   https://github.com/raspberrypi/firmware/wiki/Mailboxes
+ *   https://github.com/raspberrypi/firmware/wiki/Accessing-mailboxes
+ */
+
+#include "hw/misc/bcm2835_mbox.h"
+
+/* Mailbox status register (...0x98) */
+#define ARM_MS_FULL       0x80000000
+#define ARM_MS_EMPTY      0x40000000
+#define ARM_MS_LEVEL      0x400000FF /* Max. value depends on mailbox depth */
+
+/* MAILBOX config/status register (...0x9C) */
+/* ANY write to this register clears the error bits! */
+#define ARM_MC_IHAVEDATAIRQEN    0x00000001 /* mbox irq enable:  has data */
+#define ARM_MC_IHAVESPACEIRQEN   0x00000002 /* mbox irq enable:  has space */
+#define ARM_MC_OPPISEMPTYIRQEN   0x00000004 /* mbox irq enable: Opp is empty */
+#define ARM_MC_MAIL_CLEAR        0x00000008 /* mbox clear write 1, then  0 */
+#define ARM_MC_IHAVEDATAIRQPEND  0x00000010 /* mbox irq pending:  has space */
+#define ARM_MC_IHAVESPACEIRQPEND 0x00000020 /* mbox irq pending: Opp is empty */
+#define ARM_MC_OPPISEMPTYIRQPEND 0x00000040 /* mbox irq pending */
+/* Bit 7 is unused */
+#define ARM_MC_ERRNOOWN   0x00000100 /* error : none owner read from mailbox */
+#define ARM_MC_ERROVERFLW 0x00000200 /* error : write to fill mailbox */
+#define ARM_MC_ERRUNDRFLW 0x00000400 /* error : read from empty mailbox */
+
+static void mbox_update_status(BCM2835Mbox *mb)
+{
+    mb->status &= ~(ARM_MS_EMPTY | ARM_MS_FULL);
+    if (mb->count == 0) {
+        mb->status |= ARM_MS_EMPTY;
+    } else if (mb->count == MBOX_SIZE) {
+        mb->status |= ARM_MS_FULL;
+    }
+}
+
+static void mbox_init(BCM2835Mbox *mb)
+{
+    int n;
+
+    mb->count = 0;
+    mb->config = 0;
+    for (n = 0; n < MBOX_SIZE; n++) {
+        mb->reg[n] = MBOX_INVALID_DATA;
+    }
+    mbox_update_status(mb);
+}
+
+static uint32_t mbox_pull(BCM2835Mbox *mb, int index)
+{
+    int n;
+    uint32_t val;
+
+    assert(mb->count > 0);
+    assert(index < mb->count);
+
+    val = mb->reg[index];
+    for (n = index + 1; n < mb->count; n++) {
+        mb->reg[n - 1] = mb->reg[n];
+    }
+    mb->count--;
+    mb->reg[mb->count] = MBOX_INVALID_DATA;
+
+    mbox_update_status(mb);
+
+    return val;
+}
+
+static void mbox_push(BCM2835Mbox *mb, uint32_t val)
+{
+    assert(mb->count < MBOX_SIZE);
+    mb->reg[mb->count++] = val;
+    mbox_update_status(mb);
+}
+
+static void bcm2835_mbox_update(BCM2835MboxState *s)
+{
+    uint32_t value;
+    bool set;
+    int n;
+
+    /* Avoid unwanted recursive calls */
+    s->mbox_irq_disabled = true;
+
+    /* Get pending responses and put them in the vc->arm mbox,
+     * as long as it's not full */
+    for (n = 0; n < MBOX_CHAN_COUNT; n++) {
+        while (s->available[n] && !(s->mbox[0].status & ARM_MS_FULL)) {
+            value = ldl_phys(&s->mbox_as, n << MBOX_AS_CHAN_SHIFT);
+            if (value == MBOX_INVALID_DATA) {
+                /* Interrupt pending, but there's no data. Hmmm... */
+                hw_error("%s: spurious interrupt on channel %d", __func__, n);
+            }
+            mbox_push(&s->mbox[0], value);
+        }
+    }
+
+    /* Try to push pending requests from the arm->vc mbox */
+    /* TODO (?) */
+
+    /* Re-enable calls from the IRQ routine */
+    s->mbox_irq_disabled = false;
+
+    /* Update ARM IRQ status */
+    set = false;
+    s->mbox[0].config &= ~ARM_MC_IHAVEDATAIRQPEND;
+    if (!(s->mbox[0].status & ARM_MS_EMPTY)) {
+        s->mbox[0].config |= ARM_MC_IHAVEDATAIRQPEND;
+        if (s->mbox[0].config & ARM_MC_IHAVEDATAIRQEN) {
+            set = true;
+        }
+    }
+    qemu_set_irq(s->arm_irq, set);
+}
+
+static void bcm2835_mbox_set_irq(void *opaque, int irq, int level)
+{
+    BCM2835MboxState *s = opaque;
+
+    s->available[irq] = level;
+
+    /* avoid recursively calling bcm2835_mbox_update when the interrupt
+     * status changes due to the ldl_phys call within that function */
+    if (!s->mbox_irq_disabled) {
+        bcm2835_mbox_update(s);
+    }
+}
+
+static uint64_t bcm2835_mbox_read(void *opaque, hwaddr offset, unsigned size)
+{
+    BCM2835MboxState *s = opaque;
+    uint32_t res = 0;
+
+    offset &= 0xff;
+
+    switch (offset) {
+    case 0x80 ... 0x8c:  /* MAIL0_READ */
+        if (s->mbox[0].status & ARM_MS_EMPTY) {
+            res = MBOX_INVALID_DATA;
+        } else {
+            res = mbox_pull(&s->mbox[0], 0);
+        }
+        break;
+    case 0x90:  /* MAIL0_PEEK */
+        res = s->mbox[0].reg[0];
+        break;
+    case 0x94:  /* MAIL0_SENDER */
+        break;
+    case 0x98:  /* MAIL0_STATUS */
+        res = s->mbox[0].status;
+        break;
+    case 0x9c:  /* MAIL0_CONFIG */
+        res = s->mbox[0].config;
+        break;
+    case 0xb8:  /* MAIL1_STATUS */
+        res = s->mbox[1].status;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+                      __func__, offset);
+        return 0;
+    }
+
+    bcm2835_mbox_update(s);
+
+    return res;
+}
+
+static void bcm2835_mbox_write(void *opaque, hwaddr offset,
+                               uint64_t value, unsigned size)
+{
+    BCM2835MboxState *s = opaque;
+    hwaddr childaddr;
+    uint8_t ch;
+
+    offset &= 0xff;
+
+    switch (offset) {
+    case 0x94:  /* MAIL0_SENDER */
+        break;
+
+    case 0x9c:  /* MAIL0_CONFIG */
+        s->mbox[0].config &= ~ARM_MC_IHAVEDATAIRQEN;
+        s->mbox[0].config |= value & ARM_MC_IHAVEDATAIRQEN;
+        break;
+
+    case 0xa0 ... 0xac:
+        if (s->mbox[1].status & ARM_MS_FULL) {
+            /* Mailbox full */
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: mailbox full\n", __func__);
+        } else {
+            ch = value & 0xf;
+            if (ch < MBOX_CHAN_COUNT) {
+                childaddr = ch << MBOX_AS_CHAN_SHIFT;
+                if (ldl_phys(&s->mbox_as, childaddr + MBOX_AS_PENDING)) {
+                    /* Child busy, push delayed. Push it in the arm->vc mbox */
+                    mbox_push(&s->mbox[1], value);
+                } else {
+                    /* Push it directly to the child device */
+                    stl_phys(&s->mbox_as, childaddr, value);
+                }
+            } else {
+                /* Invalid channel number */
+                qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid channel %u\n",
+                              __func__, ch);
+            }
+        }
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
+                      __func__, offset);
+        return;
+    }
+
+    bcm2835_mbox_update(s);
+}
+
+static const MemoryRegionOps bcm2835_mbox_ops = {
+    .read = bcm2835_mbox_read,
+    .write = bcm2835_mbox_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+};
+
+/* vmstate of a single mailbox */
+static const VMStateDescription vmstate_bcm2835_mbox_box = {
+    .name = TYPE_BCM2835_MBOX "_box",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(reg, BCM2835Mbox, MBOX_SIZE),
+        VMSTATE_UINT32(count, BCM2835Mbox),
+        VMSTATE_UINT32(status, BCM2835Mbox),
+        VMSTATE_UINT32(config, BCM2835Mbox),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+/* vmstate of the entire device */
+static const VMStateDescription vmstate_bcm2835_mbox = {
+    .name = TYPE_BCM2835_MBOX,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .minimum_version_id_old = 1,
+    .fields      = (VMStateField[]) {
+        VMSTATE_BOOL_ARRAY(available, BCM2835MboxState, MBOX_CHAN_COUNT),
+        VMSTATE_STRUCT_ARRAY(mbox, BCM2835MboxState, 2, 1,
+                             vmstate_bcm2835_mbox_box, BCM2835Mbox),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void bcm2835_mbox_init(Object *obj)
+{
+    BCM2835MboxState *s = BCM2835_MBOX(obj);
+    memory_region_init_io(&s->iomem, obj, &bcm2835_mbox_ops, s,
+                          TYPE_BCM2835_MBOX, 0x400);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+    sysbus_init_irq(SYS_BUS_DEVICE(s), &s->arm_irq);
+    qdev_init_gpio_in(DEVICE(s), bcm2835_mbox_set_irq, MBOX_CHAN_COUNT);
+}
+
+static void bcm2835_mbox_reset(DeviceState *dev)
+{
+    BCM2835MboxState *s = BCM2835_MBOX(dev);
+    int n;
+
+    mbox_init(&s->mbox[0]);
+    mbox_init(&s->mbox[1]);
+    s->mbox_irq_disabled = false;
+    for (n = 0; n < MBOX_CHAN_COUNT; n++) {
+        s->available[n] = false;
+    }
+}
+
+static void bcm2835_mbox_realize(DeviceState *dev, Error **errp)
+{
+    BCM2835MboxState *s = BCM2835_MBOX(dev);
+    Object *obj;
+    Error *err = NULL;
+
+    obj = object_property_get_link(OBJECT(dev), "mbox_mr", &err);
+    if (obj == NULL) {
+        error_setg(errp, "%s: required mbox_mr link not found: %s",
+                   __func__, error_get_pretty(err));
+        return;
+    }
+
+    s->mbox_mr = MEMORY_REGION(obj);
+    address_space_init(&s->mbox_as, s->mbox_mr, NULL);
+    bcm2835_mbox_reset(dev);
+}
+
+static void bcm2835_mbox_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = bcm2835_mbox_realize;
+    dc->reset = bcm2835_mbox_reset;
+    dc->vmsd = &vmstate_bcm2835_mbox;
+}
+
+static TypeInfo bcm2835_mbox_info = {
+    .name          = TYPE_BCM2835_MBOX,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2835MboxState),
+    .class_init    = bcm2835_mbox_class_init,
+    .instance_init = bcm2835_mbox_init,
+};
+
+static void bcm2835_mbox_register_types(void)
+{
+    type_register_static(&bcm2835_mbox_info);
+}
+
+type_init(bcm2835_mbox_register_types)
diff --git a/include/hw/misc/bcm2835_mbox.h b/include/hw/misc/bcm2835_mbox.h
new file mode 100644
index 0000000..f24560c
--- /dev/null
+++ b/include/hw/misc/bcm2835_mbox.h
@@ -0,0 +1,37 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#ifndef BCM2835_MBOX_H
+#define BCM2835_MBOX_H
+
+#include "bcm2835_mbox_defs.h"
+#include "hw/sysbus.h"
+#include "exec/address-spaces.h"
+
+#define TYPE_BCM2835_MBOX "bcm2835_mbox"
+#define BCM2835_MBOX(obj) \
+        OBJECT_CHECK(BCM2835MboxState, (obj), TYPE_BCM2835_MBOX)
+
+typedef struct {
+    uint32_t reg[MBOX_SIZE];
+    uint32_t count;
+    uint32_t status;
+    uint32_t config;
+} BCM2835Mbox;
+
+typedef struct {
+    /*< private >*/
+    SysBusDevice busdev;
+    /*< public >*/
+    MemoryRegion *mbox_mr;
+    AddressSpace mbox_as;
+    MemoryRegion iomem;
+    bool mbox_irq_disabled;
+    qemu_irq arm_irq;
+    bool available[MBOX_CHAN_COUNT];
+    BCM2835Mbox mbox[2];
+} BCM2835MboxState;
+
+#endif
diff --git a/include/hw/misc/bcm2835_mbox_defs.h b/include/hw/misc/bcm2835_mbox_defs.h
new file mode 100644
index 0000000..48d8ee4
--- /dev/null
+++ b/include/hw/misc/bcm2835_mbox_defs.h
@@ -0,0 +1,26 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#ifndef BCM2835_MBOX_DEFS_H
+#define BCM2835_MBOX_DEFS_H
+
+/* Constants shared with the ARM identifying separate mailbox channels */
+#define MBOX_CHAN_POWER    0 /* for use by the power management interface */
+#define MBOX_CHAN_FB       1 /* for use by the frame buffer */
+#define MBOX_CHAN_VCHIQ    3 /* for use by the VCHIQ interface */
+#define MBOX_CHAN_PROPERTY 8 /* for use by the property channel */
+#define MBOX_CHAN_COUNT    9
+
+#define MBOX_SIZE          32
+#define MBOX_INVALID_DATA  0x0f
+
+/* Layout of the private address space used for communication between
+ * the mbox device emulation, and child devices: each channel occupies
+ * 16 bytes of address space, but only two registers are presently defined. */
+#define MBOX_AS_CHAN_SHIFT 4
+#define MBOX_AS_DATA       0 /* request / response data (RW at offset 0) */
+#define MBOX_AS_PENDING    4 /* pending response status (RO at offset 4) */
+
+#endif /* BCM2835_MBOX_DEFS_H */
-- 
2.5.3

