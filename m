Received: by 10.25.159.19 with SMTP id i19csp769622lfe;
        Fri, 15 Jan 2016 16:01:57 -0800 (PST)
X-Received: by 10.55.77.216 with SMTP id a207mr16611033qkb.80.1452902517445;
        Fri, 15 Jan 2016 16:01:57 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g6si16013276qhd.43.2016.01.15.16.01.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 16:01:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:49442 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aKEJY-0000Gp-QY
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 19:01:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aKEH9-0004W7-RS
	for qemu-devel@nongnu.org; Fri, 15 Jan 2016 18:59:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aKEH4-00011C-U7
	for qemu-devel@nongnu.org; Fri, 15 Jan 2016 18:59:27 -0500
Received: from mail-bl2on0133.outbound.protection.outlook.com
	([65.55.169.133]:6848
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aKEH4-000117-Ny; Fri, 15 Jan 2016 18:59:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=eKaRcDyChoXUgJUh5NqzMK6Ztk5ogbKnGzmKX7T3U28=;
	b=QimcuAoOwMnJEHaVM9D7tHnKLsRbbHXDgtqrXCU6Elz3qByJ2nanu3y6SpJAeQcsTbPE68KaJN64wIfddmIvcAXuXlThVSiCnNt3JWLOY0anczcoR0Fey/Pi/3I7ZvN8FBTZI0FnuzIPUTfXp+wip2cM5vrmu02HHgFa8KuDbN0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:5::724)
	by BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with
	Microsoft
	SMTP Server (TLS) id 15.1.365.19; Fri, 15 Jan 2016 23:59:20 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 15 Jan 2016 15:58:50 -0800
Message-ID: <1452902337-13844-2-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:5::724]
X-ClientProxiedBy: BY1PR16CA0020.namprd16.prod.outlook.com (25.162.29.30) To
	BLUPR0301MB2033.namprd03.prod.outlook.com (25.164.22.23)
X-MS-Office365-Filtering-Correlation-Id: b6b187b3-6ee5-424f-6293-08d31e07e2e6
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	2:a6hOm+evYVEJKDTthX7Q/wYBX6sXIQtIkoP+cxyMKQzJslDDpcmzfbbD8Lq/q8SbtH5UySxr9j+gTk9ZLKmaE8bi6FHUGBFxk09t1sTy0eEE5IMWc85ITBlVp8oL4qBFDQ0Or9iZ33q5GJmSgVgpata5DKaJikkqP7Q+jn25UpwhOkpQL0MtV2noRjhFGE5e;
	3:pkxH7o49GDIh2cm/7utaU/NyNoUFjgxs065KHakvcUmDdVi04AsnzSLTDRyl3UPVa5rvSfrK91SnWElr4PoenK0OF8OE4wl5sQBHEP+gMXSMcaCK4eRVR6SqH+0TGUwL;
	25:I0l0TY5cLBm6/aj4B5kQn1cYdf3lv34S7wpA4yydBNunlyRot/hjiiI3zldRRRvtPekwzZo2BEy4OVpVlBsy7ERUbsaQIaBM5CY2DuDTEN0ciCca5Ibqp8dtY2ooT9HHtzpeoFRcTkR/YeN5PTIZI4U5AV+R39DGy0XSPQGlfb+lLcjmfxRIvqjrlhQaEZpkuuTIQ/1B485yNjqmQkzNtsrHctQKk3Y65Lf2aVZ9zk1DVfm9PTdJ1ACINqsgWjnPr9iN7JLBaF3m5YlMEzZRIFD+uJ+6leI64RlpwIe3Cms=
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; UriScan:; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	20:sywTNCn9wDRmASzW1suPqa+tjhTyTfgtGdQ3+wbXVs3zoLVakROERybb2R76mWUE1LBTwkCara+sG9GhDW1E5k/PL+hroY72lUTEpE8SyGjduWo+xoDpvmZUBd/QoZk+NbIYVD+7tdQp6m79XcOSSjBiOVnaOixckXLC8a5G+jN7OcotazN1QGhoVi7+8UZCVDy01EZUbAKF9/RVk2mcBLZ2Be6RIKScyWvpgkQW2FJHuSgqC/cEeEGT7fiy7YzIIfU28imhqRGFO3xymoz2BT6WZeSEhmf9eHug7J7yBAbqHllSmlColhbpwZMtn8boTBW2IXuea1tdIxLEmDrRnJP01q12gA32lSzLvlUH1eOUGtcOAnSxRtpVYy0S71fjMwxlWrYGri7KAMsfK0GF0YvqS0Ma2kHjC22xqFgXUqgsi84pYYe2ZVbRhBLDKgWRrUUidZwl2HrPhlzWakjYEyjKmRtwz8z0bLkbiI1Y3AdGD72l6wuPIKBndaZM1Xxs;
	4:R7/nF2ALz0GPRvooAvFSLCvhnENIkXLtq38tX5D3mkN78CtYVVoNz5dHkoTytXc+Dszq0zQD9257koQyWDNTNSzeXfM75uBPB9DQva/Qz5gO6U4E9u7aLJBLcJFMNRIcpckGtdtbWsVufiTbURDIM+J9X6NpOaq2TDdBWYrqWWy0AQl7b8TObAOcMAqkbI5BH2IqKJKPvqjxiGDve2bz/rsSohHdDcs57vjkvt/TWmqNgK6clKjdI53UtmfDjBuv4/o5WzBHAoCq0QiGO5j6Hb0trsR1sKNjAGbdovbuHK7SyEsxzPxUR5FFrH+FnjsbZ6aMccm91SBbN73BoDgGhnnc9zz1BY4oSAqLd8oAuY6WAfRJJqauQhh2MIGSZPPd
X-Microsoft-Antispam-PRVS: <BLUPR0301MB20332073BD76F0E6018977659ECD0@BLUPR0301MB2033.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(520078)(3002001)(10201501046);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
X-Forefront-PRVS: 08220FA8D6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(4001430100002)(575784001)(106356001)(15975445007)(86362001)(2351001)(2950100001)(2906002)(586003)(77096005)(189998001)(42186005)(5008740100001)(229853001)(50986999)(1096002)(47776003)(4326007)(6116002)(87976001)(48376002)(76176999)(5004730100002)(92566002)(122386002)(5005710100001)(86612001)(40100003)(101416001)(50466002)(107886002)(50226001)(10090500001)(110136002)(5001960100002)(81156007)(5003940100001)(97736004)(19580395003)(105586002)(36756003)(19580405001)(10290500002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2033;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2033;
	23:PD08RIPAAcwlH4tABtHCrq4OCg8TSfvMK1qRpUS?=
	=?us-ascii?Q?in0dfw9ify5+HMlWa2ZieTo5Fgp2Bp01zjTvQ3Xd+lrskJgDAeQvodthKOew?=
	=?us-ascii?Q?dJxHGt9UJkW6ujwtgPw6C6WRD3GvJnq/to5dBbSRLFRe+TkUA4/j1FdgMMc2?=
	=?us-ascii?Q?ipbvZlZG7GzH5nST2XEarEg9OSUM77EI/1GNb2cM7cFYvQPK2gk7BjEOUGtt?=
	=?us-ascii?Q?w6G8Y4msMGGTXJ12hce4sQcIpDXGeQZ8r3kEJBLp1riBDP/887s1d8iPfUJ/?=
	=?us-ascii?Q?x2NIxwKs3Byps40TyfJps/175yl+3640rxYo+eexVQMSvdj5L8r8kicDbhZ/?=
	=?us-ascii?Q?RFAMEjRLMJrPgBuWwFtSWRORedEhHF6YY0Ye3Z4xgWDyCDL/K4sc+jvrpP69?=
	=?us-ascii?Q?em1G7kUMkn6Op6+9p9GX5UhFTJCQmG44PXtlwgx6gH9Pr+xrJl+EnSQaiPkq?=
	=?us-ascii?Q?L1Ot+7JMMe1csbzS6rs3IibKRYgaZSExLMF42WBKUNAOvxcfWqLsd3eItmMe?=
	=?us-ascii?Q?O69fvW7rHJ7hH9MgmxlRkjT2h+ku4sNtW+YXwnEDFd/eQUzr3AbLSt6CReNn?=
	=?us-ascii?Q?XlGmvkSBQoM2PHzAFsrizzVd8Spv+PJutN85xtLZGJLzjrg/xEv3J19ZvsEP?=
	=?us-ascii?Q?oy4E4I5YMEG4Z/dNz4S/xFzxixveFE4Y78R0E4jWSI5qRXMlIYnsTdQ5FUn8?=
	=?us-ascii?Q?NCPqnFKqa8MjRS8xuEC6J5gtD9CNdL92JfELTQimDPlQGex/ImE3fgixKKhk?=
	=?us-ascii?Q?2I1Ts9lQfXr/sZEz51qB616bQtqbUA9QVMZDufrnk9MacOUhrbdlich4G1Gg?=
	=?us-ascii?Q?RPrzMLx1WQmUF7b4RThbzqL3JTmFQMJySHGZkHUYJSSKNUQ7XRgHg6UFgsaq?=
	=?us-ascii?Q?aJZ3lL+opdvvGtlPaBPsIf8uU74e+0//Tr5B7bqk3yNRdkuOHgCX/CLs3XUk?=
	=?us-ascii?Q?JqiGjX58YsrPxzVjuuhdbE7pH0BFgTRIcIBUcOxDSOIdMrLoERgYKZGPrtfH?=
	=?us-ascii?Q?nwPQoGwplBppTC8Soh49JH9yB8Jm5sZgjUmOPM87nQDKAy0AtIG0a7RzlhRq?=
	=?us-ascii?Q?lN8DONV5KBuh7MlebeL6rPYUNmNsX3P0MbsK2HEudKazBwEx6l9cmRlrsPPb?=
	=?us-ascii?Q?2yk9RP/tLVwg+sRn1NoujtvxNKz/oCekXCpyvf7el9HURaUibNYsiSh+3Y74?=
	=?us-ascii?Q?eBaeLEC2n1sejOO5zK/k/02NCB7X647J7EKxrjJq4TvJ0mIpUCFmspOCOCby?=
	=?us-ascii?Q?utpAPi5dbR7gaReJh9BM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	5:3wCLVLTO8A4lwe1+qicwKXOlTxx7JdjSF4dljjbos5w+AIhnMStIOouF7A1u3Xzxy1xzp+d3C10Uef0Ybq0cvUC7K8r6KLot+/NAdTaR1bUQBUCJX+58ia5lIBbWIsl1P/0NnkEuzlEcp68alh/L+Q==;
	24:XczVGmnekhsn7k3J1YhnVrF522Qj2jveIkizr8aai/rkuLBafHz0P+I0/6UoE1IOHFnzj/n3NBDSt+a50T1vt4G8tSFiTYWKVRcmaqD188o=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2016 23:59:20.0350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.133
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: [Qemu-devel] [PATCH v4 1/8] bcm2835_mbox: add BCM2835 mailboxes
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
X-TUID: 2BKL7S+yLtER

This adds the system mailboxes which are used to communicate with a
number of GPU peripherals on Pi/Pi2.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---

Notes:
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
 include/hw/misc/bcm2835_mbox.h      |  37 ++++
 include/hw/misc/bcm2835_mbox_defs.h |  27 +++
 5 files changed, 399 insertions(+)
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
index 0000000..167bf59
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
+     * as long as it's not full */
+    for (n = 0; n < MBOX_CHAN_COUNT; n++) {
+        while (s->available[n] && !(s->mbox[0].status & ARM_MS_FULL)) {
+            value = ldl_phys(&s->mbox_as, n << MBOX_AS_CHAN_SHIFT);
+            assert(value != MBOX_INVALID_DATA); /* Pending interrupt but no data */
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
index 0000000..32ae077
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

