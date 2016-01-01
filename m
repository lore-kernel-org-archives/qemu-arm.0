Received: by 10.182.158.201 with SMTP id ww9csp8832155obb;
        Thu, 31 Dec 2015 16:32:36 -0800 (PST)
X-Received: by 10.140.164.77 with SMTP id k74mr100671352qhk.6.1451608356853;
        Thu, 31 Dec 2015 16:32:36 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e184si6457952qkb.28.2015.12.31.16.32.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Dec 2015 16:32:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:57078 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aEne0-0003oh-Gz
	for alex.bennee@linaro.org; Thu, 31 Dec 2015 19:32:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aEndL-0002mb-Ng
	for qemu-devel@nongnu.org; Thu, 31 Dec 2015 19:31:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aEndH-00063V-0A
	for qemu-devel@nongnu.org; Thu, 31 Dec 2015 19:31:55 -0500
Received: from mail-bl2on0137.outbound.protection.outlook.com
	([65.55.169.137]:60296
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aEndG-00063I-Q2; Thu, 31 Dec 2015 19:31:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=eKaRcDyChoXUgJUh5NqzMK6Ztk5ogbKnGzmKX7T3U28=;
	b=P51QhTORl8a0GbJYATHU39T3dzE8ci/uG4Tl/mID5xmig4OiFnzeUTk1r8g5WR0qlljMLXyWdr7NaY7bqpIqPzV9Bk6RV213t1KeLYumc+pwkEwz5WSQdbr0FqYrZEUk4xnrNZW8/ZFsfZyyf2BizlDSEJoalI3iDBRCwzUiIAw=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:7::724)
	by CY1PR0301MB2043.namprd03.prod.outlook.com (10.164.2.25) with
	Microsoft
	SMTP Server (TLS) id 15.1.361.13; Fri, 1 Jan 2016 00:31:47 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 31 Dec 2015 16:31:28 -0800
Message-ID: <1451608294-16432-2-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:7::724]
X-ClientProxiedBy: CO2PR04CA028.namprd04.prod.outlook.com (10.141.240.156) To
	CY1PR0301MB2043.namprd03.prod.outlook.com (25.164.2.25)
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	2:/FClk4PcK7OS9n//NSfWFzM0RUcCZNNfx23WXssUBd3ZVK4BT1a2LkzT6CYtqhpHwL5GRhuwMUgNsL2Hwgt9/Jn825VFuPwrUeT30jQPgEWPwuCZjKoRE6NOj6Vd62KWdJ6bqtkf68nxzsph6v3GVQ==;
	3:uFQT8WC3VYIoL8lxA45RyG7xnj82cH5LjUmfoZuuaAOb7JTFhYraBpXfsHo9Flus/lf8BZTjMBlHfP9C32eQbnNKCi7AJj3DkL9FqgoTIhWOmYf9KfzZFKL431EFSFdA;
	25:Ya1Wuzy1HLhc9nufM53xdx0zFK5PYDJc+nlPiKmjJPEHRAWUeGLY28hQCOJ3EcyJWyR1xizb9oR7robVWUPd1wKf7zfdEuEkz2umnpIQnzodi9G/HrGtPRHSUibozKpvjXHExZMk9KuIW886SwpxPn5mHxlsTsmoHE1P71zjVGRPDuYDZYdpZyD+XgGJzliSaYUo+qFGHG3r1/fK4NtMglF32GVrcVG0k2KFrzZDthf7IyjEfwrfaFD7iHTM1LMgHNJwt4uUQWDco810gJZUAsenqoTqyCslfhUVMlAMwoA=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB2043;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	20:6kFy4twdSczGF7TQ84Shj1otbh64+N1osLWXGP0JCaETv2LC1pJGgtIH2JL3xIfN1H0Qen1DpK7SsZucJUFXTDAAs0BQ4hQIWQ469/doYqthpLLaciIB8SSsf7x4HxD6nBPs3ZbuW5C1E+UDapjZaSeLdC+nzzc7CNZCXc8ajyW5leeBstg7+eTpyHZ9tI61n0PIOVnFWCjr4WkalzaCliyHzD5X5hp6/aGFdVKmjF+MP+B1wGI1WSyRuQn7DOIlxHkNj3r/K5S3wNNzVwYT5kxCoALv8SEstUdJaigXoJWLrAyUnKpHKgwjVhUF0dfa4gweLy4R132PrK78XfY8XebRmNdyMB5ZqkRnE05NXoS1PJCElZzujZ7lJmAJLa+QkbCiIiqKahsOjfK4tVll4Jt011HueJO+8PRyp2T12blKhM+5FbRP2qEKBPJFhc05C8wYqplyi1qU7bc4JHkPY0XQloEboJZuq00mBRD4Db88FumdQ46Pl5vEGGPMAEqj;
	4:DyCtIeDfjRIwAx/b2u7+XT9sj/6vkbPuFBolcqSdGYqcCg+/T0RNUKc4O6FA1GKFPxUmwVrXQlwn0uxXLYzXADZ1b1GLYWGFKVPcsV3Hla8VGbcfr0OAK+77oxh77h4Xcz50dc+5WAiRAjbnxQfov5Y5FE2wC28AOsNwRN/owS2N4hgLnqFDzS8fmB1WyUkbj1ACVxAZQL52p8Dxre4/V6eSSKOWPkJ/a7hNGMGB2kEbOMp7hm/dvxNNGDmCyJPOZ9svjJYEDEVZgzyoOyv74m/YI7S/ju7ey0kN9s1uINESM0pxyKfhVTtYcNdCIL2UD9l37a7HaUFNJghXVbv16GXgZazU34Mo272LY7sKZ6gTedk4k3i5xEbMZa7L5Gwg
X-Microsoft-Antispam-PRVS: <CY1PR0301MB2043AE25BF5393D9E9427FF49EFF0@CY1PR0301MB2043.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(520078)(5005006)(3002001)(10201501046);
	SRVR:CY1PR0301MB2043; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB2043; 
X-Forefront-PRVS: 0808323E97
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(229853001)(42186005)(40100003)(86362001)(189998001)(6116002)(4001430100002)(575784001)(15975445007)(5001960100002)(50226001)(107886002)(76176999)(101416001)(105586002)(2351001)(86612001)(50986999)(110136002)(47776003)(81156007)(97736004)(122386002)(5008740100001)(5004730100002)(1096002)(36756003)(5005710100001)(87976001)(2950100001)(19580405001)(10290500002)(5003940100001)(106356001)(92566002)(77096005)(48376002)(586003)(50466002)(4326007)(10090500001)(19580395003)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB2043;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB2043;
	23:QJCt1LlK2im9ImHEqfaWgtD2mh/eA0s5NRvsZQb?=
	=?us-ascii?Q?IypqJDuSK0itfpCdo3wBjgJZeVz02K22smHyQFMc8g9VfIbg1dtQQcTTirnJ?=
	=?us-ascii?Q?rpL6WjmaJYxp/cHaj78wdi6lslrebYA1k64uI9h1cGuSzq2nPFcMIGeAewlb?=
	=?us-ascii?Q?g+Kmy1X20QblKmTheVjzizZGlR3geUNGv1ir0RBtx1d5X5hA8mvhtAEt2+Xy?=
	=?us-ascii?Q?NlZ3YaGgsPdW39lV97Is6PseYVarU/JFhMj9SH0uOYAq66U679rngoGbRZTS?=
	=?us-ascii?Q?Z/LhQNN74nDjK0KwVC7VEY23wU2qkbPmDC8ZzXhn66H03ZG8ZnKptMPZDWlY?=
	=?us-ascii?Q?DASNiYSP1vsekx+qO3YHVoyhlxFdwzoWphjt+4CWdzku/9RMtWQ1R/LLsKAP?=
	=?us-ascii?Q?zYLBDl2f8YB9wFUa1SOofowlEhmegssM//A5185XIOvtUUIpjiS+OlOxd5lE?=
	=?us-ascii?Q?JbmDt6V1jEi/PRVeKdQNmtkmC91hmrZ0IxImnHHuY3vdjdofbXQTyHDa8o7Q?=
	=?us-ascii?Q?BWwY8k1WF78v1tRGNmE0s4zUsdakya3di/BsMu6OgRRZBjrCc4feY4KgjsOx?=
	=?us-ascii?Q?5HvaF9iamZSnJvbyTG1mm7+s2J46tbESGTC7SuwAPBV7GOMeZwDHl67u0fZN?=
	=?us-ascii?Q?ZV5OQMtYttprOee24+b/WeIu2BsWXQJ3H1zzBPj0Dbf/p7RZJion66NtqZWx?=
	=?us-ascii?Q?Ql5/Ft2UB/6YamFrkj87dTZAqxrs9KNfG2iqdt2IrM855J/+nCwqg7axrDeb?=
	=?us-ascii?Q?4vrqljYVjt8VPn/FH0092paK5prUfvBs+BaeDEuksMVdQUSFeJC+utK4oG8G?=
	=?us-ascii?Q?BmSMVI1ceBp77ao4cLNI/TIdB5BYgsnmhCyI02ERw6dYOS2FxGSGxkFTcFV2?=
	=?us-ascii?Q?Ry6g+C77Zl0zMtEYo1C9Uw/9aLwys28EE45xDU3uGq1p0Hot6KSBL5fgkDXy?=
	=?us-ascii?Q?vWFSe/2eNCvLbvmCvoiV28SlVPZ+5E35uHZho3tTZgvqFVnaaeVUKgq53Azv?=
	=?us-ascii?Q?shz4ppmvCiBEb9JvUwv6n7YIbk2Xr31e6EOZmkbWpVOZf/mFD4xnhGRHkklW?=
	=?us-ascii?Q?V68+FBIrpC8PCeQUaIS7eNSU2ixFFFvIsyQjhMBll1QdlVR5NJuP8C+A6FIv?=
	=?us-ascii?Q?Wqawpk6rllm7JQbkKwa4i8aKxATmERCSwfFcEx4S5hp8JPZE5mQGQjdYj8og?=
	=?us-ascii?Q?Qm19TydoaGXs2Drt0s1f0rK3yAZ55TKtT3V+NwSuzQDmm0GIgv28+3m2J6A?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2043;
	5:4rKVSEL1dtUwMbmCAJpifZaEkM3tPclBB7aF1uNsiaA2/T2hD0pFy8OOTnJg0rWfeq214Jdb47/mCjB2ukb0TJaoHrJfCfdtEclpErCG8KW6mKzg8rYHEwkzI+pRDzds6YsgiVXHlgNXtlrlD3Po8Q==;
	24:7ce8oyvi6jVVmompf7sGeK2J7Gmqvto4spJG/gytuREMjt81EGh9IP9XILopvUxSO6NadHJ1gud0BIWBN1loQDrzj35AyetrILc+Mh9QMsk=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2016 00:31:47.6539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB2043
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.137
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH v3 1/7] bcm2835_mbox: add BCM2835 mailboxes
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
X-TUID: 0v0PaRdwsnif

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

