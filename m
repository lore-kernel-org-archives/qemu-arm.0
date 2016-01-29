Received: by 10.25.159.19 with SMTP id i19csp1202960lfe;
        Fri, 29 Jan 2016 14:51:52 -0800 (PST)
X-Received: by 10.140.176.206 with SMTP id w197mr14661008qhw.59.1454107912813;
        Fri, 29 Jan 2016 14:51:52 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 89si19938106qgt.32.2016.01.29.14.51.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 14:51:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36789 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPHtQ-0001Nv-AK
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 17:51:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aPHsh-0000Q3-H9
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 17:51:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aPHse-0003Mi-Fm
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 17:51:07 -0500
Received: from mail-bn1bbn0107.outbound.protection.outlook.com
	([157.56.111.107]:20016
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aPHse-0003Lx-9f; Fri, 29 Jan 2016 17:51:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=NqUR5dFrWgdgC9nAwI8yuaTsm4YBJK+a+aS3GIuCfbM=;
	b=cfWNiSQsrnwxGVgCZiMGzo9GqTH4vEYQmVmJjPniYo7waY42+9mwMjDDvwPeJP/OM29VTKLXLSvBxRm69ND1w/HiyxEO70CZ5akPCQpslxuYGPCU9l1Uyl7zNKDMcBiDE9M9ACk/01O1kOYQJXAt8HM49l3uvlg3USVCBtdif84=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:c::724)
	by BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with
	Microsoft
	SMTP Server (TLS) id 15.1.390.13; Fri, 29 Jan 2016 22:51:01 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 29 Jan 2016 14:50:37 -0800
Message-ID: <1454107844-15704-2-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1454107844-15704-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1454107844-15704-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:c::724]
X-ClientProxiedBy: CY1PR17CA0008.namprd17.prod.outlook.com (25.163.68.18) To
	BLUPR0301MB2034.namprd03.prod.outlook.com (25.164.22.24)
X-MS-Office365-Filtering-Correlation-Id: a2d76f38-23cb-4112-4c9d-08d328fea98b
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	2:yYLdixr7XKZM07l5iIXz8/5YIrNCb77NL7AIY38gaADreX2j5wWVW3l7lDTtSC8ddTUkZhsgbndwLyg/isNmqCzgVeSsPAUcenzggSLJv5QHYeU2l1QcWC1foRc6wyM4KN6dwU0YXwPH8iEJvZhc7OukSOm+F7LsxBQXjC5ldImdW7h0x73N6bqph8sPUsYN;
	3:/Dl42W6PLy8qh871RJMNgVjrQUFLA/ekLvAWRD5Rpm4Oizt5sThmfJJiYjUxMgXIPlTelbm0YWpszvJZ2LBaGTRUk4Bc65ViBZfjVT5VPM0UaNesS2s5RZ7oi8zRwL1l;
	25:FmVgWZ7uOCOi7kQ/m/NdF7o48yT37/YurUvD/rIcXBcnbuApPHhOWdQHrnHTe7QbdiIsy6Xq3kxnZeo2fD+gsm2uv/MnlMiT/neWg8Fox43HoFNlRv59pKsv93rtlMJA4f6I5mC4nYQr2FO9iaEuu8tUf5q+KbCQ534CP9zznU4nnqTVc5pzvzqIO10psrXyXwFFqs+fMM4Td1dAd6CbW0RePWIoxUhDcD6j0wX2eQlUbv4KNuC7Bihmrcffgw9xIXqSTzvjjmjEihJ+Q6pDMUUngyVyDn3Yedcs8DZq9yY=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	20:C0mnpJRG9MKCysf0fXEoKgf5UeOXHWtNPIt3sdGhP/7l18O10lX/GHSrvEoYSX9vZPlf+dl/IuDGPL50kfQYizp0RykRogPPPdgxX2YmLm9+SqooZkCHKQMBNH8z4IghRsHW/ZPTDL10g/3wFiwsFsPH4TYablNyYpZVYs1tN90PFTbOum2lt0NUTz+/soyp8z+JZOfuYhNIjTCmoHs/7whZ+XRCcG+lVOOyK76SXZs7RZzgUNfxFAY+aZtEaMQuNao1YcmL2UeNhLqtxB0DTzjeLkmqe+caHzwCsV9cx+p33eHtZCbCcai8jCJWGW8WKeCQPHkGn2jXGoOrhxYWQO0t5vXd31ExIiGjjMms17WyfvDyjLgWJ99e5EyO1Dbw2ofXoJs6AHyT03jwtnYMdtbyzC023lqGG7TqCS3Ysp15oX8vpaubaAQyAbh44xAhJp7ygGlFNIJhWuid8uJKiSonT1nBygEhW4E7tV6By9cJYU7clzNt+Yfw0inQJcv7;
	4:4Uv7SEgBqhlXbDOEWJGxJpdWtV4FnOFSVBwhv84YV2ywIWxbWvPumfIPuMhgpClnqCIIvaLuhG8Dt4kP9zpLJf8BjfSXUIhsioLFmYQopQDeqyT2y8SMHA/85ESKQBOf8ST9rgvNuz9z4GxxmSDKmc3ddBl6guVJ6Bd8rnxtR7RyD9uIApZ3g0BYy0iCfb2exkjg/tdkADAYIFNh+O7ktY+aThfiZJYj5kR8Zv3XH3TcGjHiErMmOAR/FWEtJwBoRVl7hwuOcPQOUq12Ow91GFUC+QyuYHxkjUXQrVImuENuc1wPdUqC1CLK+sDfq+KpCOuRSjFpAHFagK6ND+CfkDTAuN+W8oCaXTr3Qcx4WahGNnqZpm0IOOtfJoxgg3vV
X-Microsoft-Antispam-PRVS: <BLUPR0301MB203436C4A3FB4DC23A51E9009EDB0@BLUPR0301MB2034.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
X-Forefront-PRVS: 083691450C
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(229853001)(2950100001)(1096002)(6116002)(15975445007)(3470700001)(122386002)(107886002)(5003940100001)(110136002)(5001960100002)(40100003)(48376002)(47776003)(86612001)(575784001)(86362001)(50986999)(4001430100002)(189998001)(76176999)(586003)(92566002)(10290500002)(5008740100001)(87976001)(4326007)(50226001)(2351001)(10090500001)(50466002)(36756003)(5005710100001)(5004730100002)(77096005)(19580405001)(2906002)(19580395003)(42186005)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2034;
	23:6yduEKdKAToy0yKyKpmhHgSzvJ3mLMsk9W7GfYd?=
	=?us-ascii?Q?XxE6NG+HP8KvyvaEn0IY3R8v71a2r5Fw0xyvh4xU2TBMsGxdiG/4NUBdVF8K?=
	=?us-ascii?Q?4Zl9ONcfROFuLyZKRYNxC/ir/xOrOJiIjZCBgYPV9JuCtnRtwOlQ7WkWAorW?=
	=?us-ascii?Q?rlCik4RSr+r4cPwaMmut3eg//YU1KtKZK5w7EJMOdrtiyfUyfK6zxhyYA8yu?=
	=?us-ascii?Q?oMa/kIfK0OCpELcLXeV8RNBNplpfsNOuLQNWKnmHQ1iutbAHFm//vzA2erF0?=
	=?us-ascii?Q?pssSq4wmzCkyOIbc1Pg7021MJFyaFTg01XZ5AcAZY1BiZDcX9jtKN2gSpaxT?=
	=?us-ascii?Q?+vx/CsFTqGHSV93BtGDBQvURjLaWLNNq4OhbnAXaZvPJ5qKyyADNFhhiVKE2?=
	=?us-ascii?Q?IWSDT+g0GcPjW0uhYwfr8WDFUFf8Hhv+B7XkgRUF77EqjQqnkNWZe1q4Lw1x?=
	=?us-ascii?Q?tqHKTKr+E4IRe3zhVmI/op+dMdgfAnt8+mlcMrUAqTTrtJaDP1WPs2yWmxhN?=
	=?us-ascii?Q?fr9EyHeGEgvr7k4CCi4hZ3QLFONa0jmaXd5VdliFl0ztAlZ1L+p0pgv6Y/6j?=
	=?us-ascii?Q?5YPjJes525kpgsekWIXMMBvl1OFTlTvkmG3VSmhLhU5yfvDqUqjvVlLUH60T?=
	=?us-ascii?Q?6OAgN4M5Pgv8V8D0qc8v5lCKCtj5Uiv5foSzGJNtTk4M3811RIDXDnhnEgxn?=
	=?us-ascii?Q?7x3zMq2nRPY+ukh4Pv4QQoAZC2t2AsSmhjqjbUFs6kUISqCVam2oLTD3u5N/?=
	=?us-ascii?Q?bTPPSZOl1KO9v/ZLeyg9+A1MbSl+Lg/LFiHboof8N/rTF5lINo5IuQ+BWPHt?=
	=?us-ascii?Q?asl5soqDALlNZqbfGAyQvmPurlL4VQ2xHQDWbbZ6h6CCNkRhofl6Gy+vx3FI?=
	=?us-ascii?Q?4K1FS2abaGg4ROXlnNFPmK6+sfzdrGgZnt5XUGtQhbg7jApZ0fiTCCvVr/B2?=
	=?us-ascii?Q?C22JbDa7VUmv6wQRPRnnMDEQHwcCesDdaWGgIWgK/DXourywUpd7hMupp57x?=
	=?us-ascii?Q?CNHV7VPQRmstnAYdOHSLMxnPGyl6zWEQaFpJxoUtQL2cn2j6YewiRMZ01MMc?=
	=?us-ascii?Q?kufr2YCOYUHNPR9Hf9Tvw+1BSoQJ3PJJKLrVoBx4V4ghyLTgVufYhTCaOdJZ?=
	=?us-ascii?Q?pgYQBAhZ35bqktUfeXkqpJWKL1z4uaSz9?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2034;
	5:5qQz8HExTZmW56yl4KaXur+AIhZ7O9HuIIdVCzZ1QITcyrifaCpgmfnA3LWuxuYt4JvPNfe4LN8upMqxU3z++4wSNY6409PCmDy1QOMjaFqbcvtjjoM2CcY8sezUcMf+c3FT9CCxu5XM8hSQBGWxqQ==;
	24:Iq8WlrPZg+B4ikXDmkKEN2y94k90bJoH3r+kp2Q5gByh8HODolrGAjsVZYlEUrlfZnSWqipRHwFeEY+AIu7PrHhDBufliN2fYf9K70ZqG2M=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2016 22:51:01.2216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.107
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: [Qemu-devel] [PATCH v5 1/8] bcm2835_mbox: add BCM2835 mailboxes
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
X-TUID: XdT3I1st7jw0

This adds the system mailboxes which are used to communicate with a
number of GPU peripherals on Pi/Pi2.

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---

Notes:
    v5:
     * minor style tweaks only
    
    v3:
     * #define register offsets
     * rename mbox_init -> mbox_reset
     * s/_/-/ in property and type names
     * avoid hw_error
     * minor style tweaks
    
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
 hw/misc/bcm2835_mbox.c              | 333 ++++++++++++++++++++++++++++++++++++
 include/hw/misc/bcm2835_mbox.h      |  38 ++++
 include/hw/misc/bcm2835_mbox_defs.h |  27 +++
 5 files changed, 400 insertions(+)
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
index d4765c2..d0ea105 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -36,6 +36,7 @@ obj-$(CONFIG_OMAP) += omap_gpmc.o
 obj-$(CONFIG_OMAP) += omap_l4.o
 obj-$(CONFIG_OMAP) += omap_sdrc.o
 obj-$(CONFIG_OMAP) += omap_tap.o
+obj-$(CONFIG_RASPI) += bcm2835_mbox.o
 obj-$(CONFIG_SLAVIO) += slavio_misc.o
 obj-$(CONFIG_ZYNQ) += zynq_slcr.o
 obj-$(CONFIG_ZYNQ) += zynq-xadc.o
diff --git a/hw/misc/bcm2835_mbox.c b/hw/misc/bcm2835_mbox.c
new file mode 100644
index 0000000..df1d6e6
--- /dev/null
+++ b/hw/misc/bcm2835_mbox.c
@@ -0,0 +1,333 @@
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
+#define MAIL0_PEEK   0x90
+#define MAIL0_SENDER 0x94
+#define MAIL1_STATUS 0xb8
+
+/* Mailbox status register */
+#define MAIL0_STATUS 0x98
+#define ARM_MS_FULL       0x80000000
+#define ARM_MS_EMPTY      0x40000000
+#define ARM_MS_LEVEL      0x400000FF /* Max. value depends on mailbox depth */
+
+/* MAILBOX config/status register */
+#define MAIL0_CONFIG 0x9c
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
+static void mbox_reset(BCM2835Mbox *mb)
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
+    s->mbox_irq_disabled = true;
+
+    /* Get pending responses and put them in the vc->arm mbox,
+     * as long as it's not full
+     */
+    for (n = 0; n < MBOX_CHAN_COUNT; n++) {
+        while (s->available[n] && !(s->mbox[0].status & ARM_MS_FULL)) {
+            value = ldl_phys(&s->mbox_as, n << MBOX_AS_CHAN_SHIFT);
+            assert(value != MBOX_INVALID_DATA); /* Pending interrupt but no data */
+            mbox_push(&s->mbox[0], value);
+        }
+    }
+
+    /* TODO (?): Try to push pending requests from the arm->vc mbox */
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
+     * status changes due to the ldl_phys call within that function
+     */
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
+    case 0x80 ... 0x8c: /* MAIL0_READ */
+        if (s->mbox[0].status & ARM_MS_EMPTY) {
+            res = MBOX_INVALID_DATA;
+        } else {
+            res = mbox_pull(&s->mbox[0], 0);
+        }
+        break;
+
+    case MAIL0_PEEK:
+        res = s->mbox[0].reg[0];
+        break;
+
+    case MAIL0_SENDER:
+        break;
+
+    case MAIL0_STATUS:
+        res = s->mbox[0].status;
+        break;
+
+    case MAIL0_CONFIG:
+        res = s->mbox[0].config;
+        break;
+
+    case MAIL1_STATUS:
+        res = s->mbox[1].status;
+        break;
+
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
+    case MAIL0_SENDER:
+        break;
+
+    case MAIL0_CONFIG:
+        s->mbox[0].config &= ~ARM_MC_IHAVEDATAIRQEN;
+        s->mbox[0].config |= value & ARM_MC_IHAVEDATAIRQEN;
+        break;
+
+    case 0xa0 ... 0xac: /* MAIL1_WRITE */
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
+
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
+    mbox_reset(&s->mbox[0]);
+    mbox_reset(&s->mbox[1]);
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
+    obj = object_property_get_link(OBJECT(dev), "mbox-mr", &err);
+    if (obj == NULL) {
+        error_setg(errp, "%s: required mbox-mr link not found: %s",
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
index 0000000..f4e9ff9
--- /dev/null
+++ b/include/hw/misc/bcm2835_mbox.h
@@ -0,0 +1,38 @@
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
+#define TYPE_BCM2835_MBOX "bcm2835-mbox"
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
+    qemu_irq arm_irq;
+
+    bool mbox_irq_disabled;
+    bool available[MBOX_CHAN_COUNT];
+    BCM2835Mbox mbox[2];
+} BCM2835MboxState;
+
+#endif
diff --git a/include/hw/misc/bcm2835_mbox_defs.h b/include/hw/misc/bcm2835_mbox_defs.h
new file mode 100644
index 0000000..a18e520
--- /dev/null
+++ b/include/hw/misc/bcm2835_mbox_defs.h
@@ -0,0 +1,27 @@
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
+ * 16 bytes of address space, but only two registers are presently defined.
+ */
+#define MBOX_AS_CHAN_SHIFT 4
+#define MBOX_AS_DATA       0 /* request / response data (RW at offset 0) */
+#define MBOX_AS_PENDING    4 /* pending response status (RO at offset 4) */
+
+#endif /* BCM2835_MBOX_DEFS_H */
-- 
2.5.3

