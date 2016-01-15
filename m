Received: by 10.25.159.19 with SMTP id i19csp768765lfe;
        Fri, 15 Jan 2016 15:59:38 -0800 (PST)
X-Received: by 10.140.43.69 with SMTP id d63mr16799337qga.18.1452902378414;
        Fri, 15 Jan 2016 15:59:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d201si16068758qkb.37.2016.01.15.15.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 15:59:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:49411 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aKEHJ-0004lQ-LI
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 18:59:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45566)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aKEHE-0004cC-P7
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 18:59:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aKEHC-00014L-TC
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 18:59:32 -0500
Received: from mail-bl2on0119.outbound.protection.outlook.com
	([65.55.169.119]:21024
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aKEH5-00011I-OV; Fri, 15 Jan 2016 18:59:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=yfCYPrr7frCyKCJJmzTHU+RJFdiyRhIgaftcFWX66k0=;
	b=E9/GRihDFVNXFqJgTBGxrYo3ruclDIISZ5FXjJ3HJKPe2mkvA9brY5h+DnBRqI67UrdLZlZQTNHLwVcuk3RjkZWP+VtsqwOAvunySRboUDEHcuesTCK6e9k3A1YpdEHgXFClls0qLhte+f5BfpBne+ZfT9k/X+cXSRB9S9/XAyU=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:5::724)
	by BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with
	Microsoft
	SMTP Server (TLS) id 15.1.365.19; Fri, 15 Jan 2016 23:59:21 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 15 Jan 2016 15:58:51 -0800
Message-ID: <1452902337-13844-3-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:5::724]
X-ClientProxiedBy: BY1PR16CA0020.namprd16.prod.outlook.com (25.162.29.30) To
	BLUPR0301MB2033.namprd03.prod.outlook.com (25.164.22.23)
X-MS-Office365-Filtering-Correlation-Id: 451a5890-1fbf-4363-6ed9-08d31e07e3b3
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	2:sCutjBp394xwWTeB2CCSqmoRoebsrkWZbKQKhv4cDCRFOYrNk3aFVH5GkHhidlu9ra07WGHqqrZbwZeWWmoFDCSRjw3IONUlga86ivSjCpxa/LDzzyKgO9qV3cLWBBAkF045LpjhP+EWGEVFdg9opS0Kx8/6ZIpy/OQsU+bqMCLsamYTh7nrwnPkpwRKu08I;
	3:zoOoSoVkSEnPpR/BoVkjlXsl/VpZzT/r8At3wX4gI66G2pMmyXw0l3VhO+HF1z7FuTIhOZ9UJmz/4oOP26SkQI8EWA65k6Jkhh+cIlIDnJ3PsYG2zoUGKFn9tgX4V4ow;
	25:JewItHvKZErBFlIjAnB7L+kFBWeBdWRcrMDZQjMPLIWqVRDtUKKF2nASSEtu5TMEVnGEx/gQyq+zNDmLKOUdLBU7B72O/oBm1GvFpymXSlSH/Wgvg3Zwxx/a5vsPmVl7c5ezCSqEVI11rtHkXCv96k1jB+Ilo+0zcgxQkYADnJK6izw16j8Bt9UQSCZH7yfbDIfV4WcGZsimYGqfOl1iLqIfW6SlXptmPNzS2JruYDHFFrBB3dpGP+xtdh1QYLMrApQiRf9Cx+Atel4peJNBSFjMGkxhwkpFQtbuxE6cEiE=
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; UriScan:; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	20:JXQu6obD7zJ8FjUOZhNA3F+hhFmmqmUZu63LnQSiHFuRrIWx4AQuaFsKfyXC0aho4eOuLHY+gOX7cTtrPunYMtz1E0bieSGr7/i9C6O1aNIaDagysqVn3PN8lKGiFcMoWf7LK02MHdNjsxpl/laNAEVGCigQHDanQrCQK2tLgoLAfhZFlbhEgzt0sLeMqd+lIGHU+Ugaa0Vu6dXz+Du/VoR6k2qxMuYl4nYc8ewF71PP/tQC2zTgZt+WWKQPE3lFKjuTBPQe2xLUHY0uRj2IbFZERZf5Plq1J5Xj9rLP3ib5B3rXrlP78SH2Yzcx4wUQIbafMjHItO67E8nzHgOocz4F6wqYbaGm4baltbxXg8gcUjFb4jKEdUwkaLPNjKgm+wt5EYXNuoFjWbQfvjRgS3hDzCeHbvuD0TSLztGnzeQqx0e2PH9PgwaAB/XkU34Mjw+2+Zwl/uhp/jkRSldTRo5Qq7FsSovFXRzmSdXubPnxppnB5dR1IZZa9FGv643a;
	4:Nj3f8N9UVAvXgr+QDlczAexJR44Ad/JohxjmKvHo8EiKlADXy9CvGsyQnXoisPPl1eWvVOISQ1exngV5ZAuzr6UmG0hbfV+7uq/Zgi7VYDln5kJjSjVELCRlFwtKa3SNT9jJtxlUz3UmwJJWWy8isV4fWgcyokpUOZ459FGxTyLu63/sJJiUEhvp3HBTGUZTwD60XtXMqyVF9P7mHaMv6VZoqQuncMjMv85STDOUzzCEDBL9rLI4zxCLFfPBS640wvcsT8cj88pteU02K19HeYRR9NtSkdV7b9hHbnCAU+PK09a5yyPnd6zI/KC0HWaujZkldCY3oPaRVXtK0bI+FdJOnyBYLZy4sDNl7cFMyJMQ46iV6JOAVZW/BimThfsn
X-Microsoft-Antispam-PRVS: <BLUPR0301MB2033AC57B7193AA399D366CC9ECD0@BLUPR0301MB2033.namprd03.prod.outlook.com>
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
	23:CqO8jDJphGnnPf3HOBrgBc4ntH0JkXJNB1+Smql?=
	=?us-ascii?Q?+JTLCvvpMbbCxUwuT3TCOoUht1hpZJYfcxxv9kdXslRElozoj2a48+hZjfM5?=
	=?us-ascii?Q?s+evqLHuSRTx7bn8lyt6+hRMHvlbsYA1BdU0ekiTUjbxpWq7Xo4MtXKVUEF8?=
	=?us-ascii?Q?kiY9YxpoBvFZiSXrk3yGvqgoWSSnyDoECQwFaj0XJQmuZXMGQA7aainB9T1a?=
	=?us-ascii?Q?fViXGydrOqbXR++T36xk0x6HU48sR4VsyCNpP2HhEtvzykMpNmVyTDBBbDIE?=
	=?us-ascii?Q?j5zPbDXBud2sTjbXab1FKwzi9rHQk5knopdPrS3vTYd4KsmCEZERAtMJClSC?=
	=?us-ascii?Q?+xwkau8ndwYPk+UGi4thIKtHOGXZxQjoub6M+8juHNtgF7QXToyJB0YJXDpl?=
	=?us-ascii?Q?JYZYdsNQ9LIXvn04dScaedfJOT+caR5UW9PuJBSPVfXrKfSTNVMhcpHz81qx?=
	=?us-ascii?Q?T5EHVQrbHtPPx0yv9uxVHrVgtLMnIa4znKS3T4u4RqWP4vq2hguYozcdGZhh?=
	=?us-ascii?Q?XXw2TTi4r3DEvfXrYOSu7fZGUI0EvvtWNGDGMwbW3+nxnWTa/r83Req0CqH3?=
	=?us-ascii?Q?L9Ef6LS1T2N1z9doc0NX5120E4jb2KzpCbzLllJ4suXOgWhNWoKOKKP5woIz?=
	=?us-ascii?Q?+Qyl/5dfatVxxAul9Sq/9WkoIeg9SKGzm+ChhLVaL4aFlxXZcyR2FTeudTNw?=
	=?us-ascii?Q?pnPS2CBJumIkhLcUDQ1n6UlgoxIa0JNx+LJrRi4r0X9S0cdtAgB74iruuIyx?=
	=?us-ascii?Q?9oxSWXBueLuUuqd5w+gPxdFL4DRI5Jl30XCO9JqtV1CilUfBCHWTIXG5F7s5?=
	=?us-ascii?Q?CcBR1xxSoFZ6WxrgeXhPptiHjylzDTnVRC3diiXP7z7hSCw5Pf8UduPI7vUJ?=
	=?us-ascii?Q?1uMJwpF2G1aOrwnod1qhMAJMzVWeEH3YJysz2QFtxAuAC4k3j+MJaXCFweB1?=
	=?us-ascii?Q?rKfJN6tgF7zALyFzxb0UXS0n4O7MwPCr+Yyf6h/CG9RFt2MlvJsMQBdvWgkk?=
	=?us-ascii?Q?LStjPu/ENLT7MF+Uk9BgKjOwArpYLwFk7xdR9cq+GOtbIX8MjNBsjCdHet2v?=
	=?us-ascii?Q?GxA/6W0hqhXfAgWZN3eVEA335BbtJC94ba/sod/RL2yum7VknEn7q+Ne8lY6?=
	=?us-ascii?Q?13/FbIC4lZ30v7Z6n+B4yJjybtrafx1ZfXrNVw+efjZW8e6udj0obC4feETw?=
	=?us-ascii?Q?Jmn+xOLZd5sdkGnuIx+fCa708Tip3jPvlcDb4iMToWvKwl1SADHAaCnEpi4/?=
	=?us-ascii?Q?DsbTzY7wdCmu+4GYIkZc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	5:PCKrynViZUuYt3a/6tyNZltZ31dyG7dwU8C5Gf6vEFh3tpGXxTgeUFFalE97PFDIIpHcdn3AMhDa6eBGskIicb1C85hN7uJkfPZ4ei8qovh1BIFRdaGdAAOmuQWHAhyNuioLMmtN8LxdRcHUbWKJVw==;
	24:Zef7rbJ1BF1GU6tS78FHuUs3Bu4ypIU3O8ungEo24TbJDs7RhZDXiRWM0HTviONXv3Yq+zpq+whQFx/cVX0Ava2H5zMw0JdxjtYTs4VeXa4=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2016 23:59:21.3631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.119
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Rob Herring <robh@kernel.org>
Subject: [Qemu-arm] [PATCH v4 2/8] bcm2835_property: add bcm2835 property
	channel
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
X-TUID: RikU97dHdx0O

This sits behind the mailbox interface, and implements
request/response queries for system properties. The
framebuffer-related properties will be added in a later patch.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---

Notes:
    v4:
    * added LOG_UNIMP as appropriate
    * use qemu_macaddr_default_if_unset to allocate a MAC address, and dma_memory_write to write it
    * assert that we're not pending, rather than dropping a request on the floor

 hw/misc/Makefile.objs              |   1 +
 hw/misc/bcm2835_property.c         | 286 +++++++++++++++++++++++++++++++++++++
 include/hw/misc/bcm2835_property.h |  31 ++++
 3 files changed, 318 insertions(+)
 create mode 100644 hw/misc/bcm2835_property.c
 create mode 100644 include/hw/misc/bcm2835_property.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index d0ea105..ea6cd3c 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -37,6 +37,7 @@ obj-$(CONFIG_OMAP) += omap_l4.o
 obj-$(CONFIG_OMAP) += omap_sdrc.o
 obj-$(CONFIG_OMAP) += omap_tap.o
 obj-$(CONFIG_RASPI) += bcm2835_mbox.o
+obj-$(CONFIG_RASPI) += bcm2835_property.o
 obj-$(CONFIG_SLAVIO) += slavio_misc.o
 obj-$(CONFIG_ZYNQ) += zynq_slcr.o
 obj-$(CONFIG_ZYNQ) += zynq-xadc.o
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
new file mode 100644
index 0000000..52c9b8d
--- /dev/null
+++ b/hw/misc/bcm2835_property.c
@@ -0,0 +1,286 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#include "hw/misc/bcm2835_property.h"
+#include "hw/misc/bcm2835_mbox_defs.h"
+#include "sysemu/dma.h"
+
+/* https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface */
+
+static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
+{
+    uint32_t tag;
+    uint32_t bufsize;
+    uint32_t tot_len;
+    size_t resplen;
+    uint32_t tmp;
+
+    value &= ~0xf;
+
+    s->addr = value;
+
+    tot_len = ldl_phys(&s->dma_as, value);
+
+    /* @(addr + 4) : Buffer response code */
+    value = s->addr + 8;
+    while (value + 8 <= s->addr + tot_len) {
+        tag = ldl_phys(&s->dma_as, value);
+        bufsize = ldl_phys(&s->dma_as, value + 4);
+        /* @(value + 8) : Request/response indicator */
+        resplen = 0;
+        switch (tag) {
+        case 0x00000000: /* End tag */
+            break;
+        case 0x00000001: /* Get firmware revision */
+            stl_phys(&s->dma_as, value + 12, 346337);
+            resplen = 4;
+            break;
+        case 0x00010001: /* Get board model */
+            qemu_log_mask(LOG_UNIMP,
+                          "bcm2835_property: %x get board model NYI\n", tag);
+            resplen = 4;
+            break;
+        case 0x00010002: /* Get board revision */
+            qemu_log_mask(LOG_UNIMP,
+                          "bcm2835_property: %x get board revision NYI\n", tag);
+            resplen = 4;
+            break;
+        case 0x00010003: /* Get board MAC address */
+            resplen = sizeof(s->macaddr.a);
+            dma_memory_write(&s->dma_as, value + 12, s->macaddr.a, resplen);
+            break;
+        case 0x00010004: /* Get board serial */
+            qemu_log_mask(LOG_UNIMP,
+                          "bcm2835_property: %x get board serial NYI\n", tag);
+            resplen = 8;
+            break;
+        case 0x00010005: /* Get ARM memory */
+            /* base */
+            stl_phys(&s->dma_as, value + 12, 0);
+            /* size */
+            stl_phys(&s->dma_as, value + 16, s->ram_size);
+            resplen = 8;
+            break;
+        case 0x00028001: /* Set power state */
+            /* Assume that whatever device they asked for exists,
+             * and we'll just claim we set it to the desired state */
+            tmp = ldl_phys(&s->dma_as, value + 16);
+            stl_phys(&s->dma_as, value + 16, (tmp & 1));
+            resplen = 8;
+            break;
+
+        /* Clocks */
+
+        case 0x00030001: /* Get clock state */
+            stl_phys(&s->dma_as, value + 16, 0x1);
+            resplen = 8;
+            break;
+
+        case 0x00038001: /* Set clock state */
+            qemu_log_mask(LOG_UNIMP,
+                          "bcm2835_property: %x set clock state NYI\n", tag);
+            resplen = 8;
+            break;
+
+        case 0x00030002: /* Get clock rate */
+        case 0x00030004: /* Get max clock rate */
+        case 0x00030007: /* Get min clock rate */
+            switch (ldl_phys(&s->dma_as, value + 12)) {
+            case 1: /* EMMC */
+                stl_phys(&s->dma_as, value + 16, 50000000);
+                break;
+            case 2: /* UART */
+                stl_phys(&s->dma_as, value + 16, 3000000);
+                break;
+            default:
+                stl_phys(&s->dma_as, value + 16, 700000000);
+                break;
+            }
+            resplen = 8;
+            break;
+
+        case 0x00038002: /* Set clock rate */
+        case 0x00038004: /* Set max clock rate */
+        case 0x00038007: /* Set min clock rate */
+            qemu_log_mask(LOG_UNIMP,
+                          "bcm2835_property: %x set clock rates NYI\n", tag);
+            resplen = 8;
+            break;
+
+        /* Temperature */
+
+        case 0x00030006: /* Get temperature */
+            stl_phys(&s->dma_as, value + 16, 25000);
+            resplen = 8;
+            break;
+
+        case 0x0003000A: /* Get max temperature */
+            stl_phys(&s->dma_as, value + 16, 99000);
+            resplen = 8;
+            break;
+
+
+        case 0x00060001: /* Get DMA channels */
+            /* channels 2-5 */
+            stl_phys(&s->dma_as, value + 12, 0x003C);
+            resplen = 4;
+            break;
+
+        case 0x00050001: /* Get command line */
+            resplen = 0;
+            break;
+
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "bcm2835_property: unhandled tag %08x\n", tag);
+            break;
+        }
+
+        if (tag == 0) {
+            break;
+        }
+
+        stl_phys(&s->dma_as, value + 8, (1 << 31) | resplen);
+        value += bufsize + 12;
+    }
+
+    /* Buffer response code */
+    stl_phys(&s->dma_as, s->addr + 4, (1 << 31));
+}
+
+static uint64_t bcm2835_property_read(void *opaque, hwaddr offset,
+                                      unsigned size)
+{
+    BCM2835PropertyState *s = opaque;
+    uint32_t res = 0;
+
+    switch (offset) {
+    case MBOX_AS_DATA:
+        res = MBOX_CHAN_PROPERTY | s->addr;
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
+static void bcm2835_property_write(void *opaque, hwaddr offset,
+                                   uint64_t value, unsigned size)
+{
+    BCM2835PropertyState *s = opaque;
+
+    switch (offset) {
+    case MBOX_AS_DATA:
+        /* bcm2835_mbox should check our pending status before pushing */
+        assert(!s->pending);
+        s->pending = true;
+        bcm2835_property_mbox_push(s, value);
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
+static const MemoryRegionOps bcm2835_property_ops = {
+    .read = bcm2835_property_read,
+    .write = bcm2835_property_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+};
+
+static const VMStateDescription vmstate_bcm2835_property = {
+    .name = TYPE_BCM2835_PROPERTY,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields      = (VMStateField[]) {
+        VMSTATE_MACADDR(macaddr, BCM2835PropertyState),
+        VMSTATE_UINT32(addr, BCM2835PropertyState),
+        VMSTATE_BOOL(pending, BCM2835PropertyState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void bcm2835_property_init(Object *obj)
+{
+    BCM2835PropertyState *s = BCM2835_PROPERTY(obj);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &bcm2835_property_ops, s,
+                          TYPE_BCM2835_PROPERTY, 0x10);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+    sysbus_init_irq(SYS_BUS_DEVICE(s), &s->mbox_irq);
+}
+
+static void bcm2835_property_reset(DeviceState *dev)
+{
+    BCM2835PropertyState *s = BCM2835_PROPERTY(dev);
+
+    s->pending = false;
+}
+
+static void bcm2835_property_realize(DeviceState *dev, Error **errp)
+{
+    BCM2835PropertyState *s = BCM2835_PROPERTY(dev);
+    Object *obj;
+    Error *err = NULL;
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
+    /* TODO: connect to MAC address of USB NIC device, once we emulate it */
+    qemu_macaddr_default_if_unset(&s->macaddr);
+
+    bcm2835_property_reset(dev);
+}
+
+static Property bcm2835_property_props[] = {
+    DEFINE_PROP_UINT32("ram-size", BCM2835PropertyState, ram_size, 0),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static void bcm2835_property_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->props = bcm2835_property_props;
+    dc->realize = bcm2835_property_realize;
+    dc->vmsd = &vmstate_bcm2835_property;
+}
+
+static TypeInfo bcm2835_property_info = {
+    .name          = TYPE_BCM2835_PROPERTY,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2835PropertyState),
+    .class_init    = bcm2835_property_class_init,
+    .instance_init = bcm2835_property_init,
+};
+
+static void bcm2835_property_register_types(void)
+{
+    type_register_static(&bcm2835_property_info);
+}
+
+type_init(bcm2835_property_register_types)
diff --git a/include/hw/misc/bcm2835_property.h b/include/hw/misc/bcm2835_property.h
new file mode 100644
index 0000000..fcf5f3d
--- /dev/null
+++ b/include/hw/misc/bcm2835_property.h
@@ -0,0 +1,31 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#ifndef BCM2835_PROPERTY_H
+#define BCM2835_PROPERTY_H
+
+#include "hw/sysbus.h"
+#include "exec/address-spaces.h"
+#include "net/net.h"
+
+#define TYPE_BCM2835_PROPERTY "bcm2835-property"
+#define BCM2835_PROPERTY(obj) \
+        OBJECT_CHECK(BCM2835PropertyState, (obj), TYPE_BCM2835_PROPERTY)
+
+typedef struct {
+    /*< private >*/
+    SysBusDevice busdev;
+    /*< public >*/
+    MemoryRegion *dma_mr;
+    AddressSpace dma_as;
+    MemoryRegion iomem;
+    qemu_irq mbox_irq;
+    MACAddr macaddr;
+    uint32_t ram_size;
+    uint32_t addr;
+    bool pending;
+} BCM2835PropertyState;
+
+#endif
-- 
2.5.3

