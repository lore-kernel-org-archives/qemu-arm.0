Received: by 10.25.208.211 with SMTP id h202csp1905321lfg;
        Tue, 1 Mar 2016 16:58:02 -0800 (PST)
X-Received: by 10.55.74.14 with SMTP id x14mr30491721qka.70.1456880282301;
        Tue, 01 Mar 2016 16:58:02 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z20si33721802qge.41.2016.03.01.16.58.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 16:58:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:53391 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aav73-0000hI-Pm
	for alex.bennee@linaro.org; Tue, 01 Mar 2016 19:58:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aav70-0000dF-Io
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 19:57:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aav6z-0000KA-8u
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 19:57:58 -0500
Received: from mail-bn1on0141.outbound.protection.outlook.com
	([157.56.110.141]:19682
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aav6t-0000GY-Cw; Tue, 01 Mar 2016 19:57:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=R6oQekRZ3AC8ib2L6g4y1hUObVaLu88ArC3klBkL20A=;
	b=HII7zLXs5x1mx7hQDLsNLw3Bk5NIWhdgUrz7qIsv+Xvujg5z5BjWyyKwQj7dL1jNldzW42kdKOGT4SyqxNEccXO3VC/ihucq86CblBOv/b35SSaZYZ5q2o4cfRryoPjmeQOgK5qyruu/Qi41vdtRVHVKinhlV1L2Xu20C+nyUnI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:6::724)
	by CY1PR0301MB2044.namprd03.prod.outlook.com (10.164.2.26) with
	Microsoft
	SMTP Server (TLS) id 15.1.427.16; Wed, 2 Mar 2016 00:57:48 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 1 Mar 2016 16:57:13 -0800
Message-ID: <1456880233-22568-1-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:6::724]
X-ClientProxiedBy: CO1PR06CA061.namprd06.prod.outlook.com (10.242.160.51) To
	CY1PR0301MB2044.namprd03.prod.outlook.com (25.164.2.26)
X-MS-Office365-Filtering-Correlation-Id: 8681166d-4127-4253-e8c0-08d34235ace6
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2044;
	2:bjPIQkQuZv2GQCE6fBMd1DE/6ib4f6jXLBIoc4MIi2bjoEw5RyVnv6hv1ansX3KUB6n1ArArcxaarVpOYRhi/bnR1SCtJXdj3imlQF7DvLCTb0J1P+aDKC5xxm7zdCqpWn0JQoO6D2pG0a4wpHpwll4uEjHhW3vTm9bC66NxLOWsiz7Vyz8beYxW7vAwHbFI;
	3:d0Sw4sWe8KWGu7JsCfprCSAXdQwOUv6XxyAuvk4BKzIFCF7O9khMee+ICzB/LP/UE2k1/j2ZpFCkn8qzaHN7lIJqzwLDp5qjjY0KmuA1Y1GeU1SFF3wFnVfL9DNwxf3I;
	25:r3Q29PdORZFuvW19+S0m+91sdjNFjv7/ZGsnqy3r2EjDwpQ8QFkvd9YEdo69bnU7VbbQTr4uKGt/SKSM6uaYUTEO5iVhZ4hDbqSL9spMlHsYN+4pM8pIpwORNJy2KX5MhIqXL+oOxJ/8XTRW/o59WisKvo1AickHDFWBWyjSw+2Qp9UpN53RYJkrQU1FHykcY8H6hbbsHCXY21mkH6KNDbg7LD6XIvLQ0u9ENF0WGztMBDtHBV+uO9W8yHIkUyKV4J6jfQco9QeS+oaNhTY68yxmA/mKyvNWH6WjhjEFJvJfBJKHdc4N9cgb1kV6Snd4iYoieyVx7CBWQuaGgRCqgw==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB2044;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2044;
	20:uaqfa6VMxfxn7yA1fA3D9+PznSEu/MBAw7wtPZSSSGRz7WvDh7n/+VEHii7pNY0YM3IzuUfvbHOaNdWRzavDpwv53ZkvjNXbT0Hvrj44scWEfRgyhbTzFOvaaUWHMceNdNAfMn50Y+uAg+wq6ixequzBqc66764ar7PRxcLZI5i5gnewE5EXwVl4ASDRBrLfRTLJDNWckkQXo0hP2UrQReRSXtCVyGO6wjf1iSggv5vTAuJXt8B/JyV6OV9t5LMYsFaxM+Gmah+kDCsQUxKKUBZNG/sv9t1SP5zlI3WcTEfUQUgo23AQI3y/B8tnoL8y61MAkGTStbtaZaujlIn+44mlyfpjDAypdsQGSqA4m9sR2zauLLU4wlUvwwgI8mZ2GVsh31dz/bKy90C0errK8caauwWQ4kweO+yMfld4EV3A1HkHF//gIHLj4Dlh+deAWeq/J6edXETmly9oRlIg5+vGTdnFusCd4qAppmDJ42ZPkwG1Hl7Mg1DdQZen135Y;
	4:wDirO5rsNtdRHnMS2jMB05SFemO5IpCLRFOZyR3zv1xvK4vplQQMJ6sDGlElXt5yTU4JSjTlrDOOnjqkQ2YNV+ppDjmIaqnF1L4cj9gwvZ3MBNimccmQbHbnnFw8wGZnOvZ8xudQtxRqyk1p70xvG11GNfHPJpztlcRzawCY5cBpMsoxlotBcu+X2S79ftbxYcyIxMv9NcQJhp67tg2oGt69TRLmapoUeis0cXHQduew1IxLWCTo0ZvwtnYWi6ED3F6Q9T057GfdvrXoOMg32nXo4coGJ1OoRCPZV3/p4uXX4+AUCvmAvVYhg18bZBbwVBgU6MhR2NbUJr8EjbVZUR5HwLFnNjay3tqBQGsZQ0V+weJP9B6Jf9nOVsopfKz2
X-Microsoft-Antispam-PRVS: <CY1PR0301MB2044A1B095D85E86EA3738009EBC0@CY1PR0301MB2044.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:CY1PR0301MB2044; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB2044; 
X-Forefront-PRVS: 086943A159
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(10290500002)(586003)(50226001)(36756003)(6116002)(4001430100002)(110136002)(10090500001)(5005710100001)(50466002)(1096002)(87976001)(189998001)(81156009)(5001960100004)(40100003)(86362001)(122386002)(48376002)(5004730100002)(77096005)(229853001)(2351001)(4326007)(42186005)(107886002)(50986999)(47776003)(5008740100001)(19580395003)(2906002)(5003940100001)(92566002)(19580405001)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB2044;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB2044;
	23:hlXb/etj4AIiizGHf6+k14G6kLpb+f2zy7C61fj?=
	=?us-ascii?Q?FXmq5YmIuMPdavLyBJ5nLibU9+QWVkGb+T76tG16qgje1Pln32mXb9AiMyY/?=
	=?us-ascii?Q?wsEIxYs+EHUUVqsoJhF0v6xIr+D7AuHmmyoxN2ymYQGLdoMdfMI/EbqBMIdp?=
	=?us-ascii?Q?5jhJkc8xv8zFvta3IlW7G3XvTm9ra11EULsJ3+lyLjCQy2p1BCAO71BsOXXr?=
	=?us-ascii?Q?FV/1SuiBSAdbNiegOug/0LyqM0ABPRUfnYaOCddeOhhLSZjv+a7HZ8KFRGp5?=
	=?us-ascii?Q?2PmtxuA7PWBC85Yh8VZUdvbPODWNTpXB4rQ4v2YIktheLzWwKcu5itK+WBYi?=
	=?us-ascii?Q?c6treytKfeNpLM6VbM0o5ZKVFtTj41sMSgc/YZ80yqtp8RFqCV4rhu/m9XzP?=
	=?us-ascii?Q?qDrQzjVjVtC30NA1u4/ipwa6uAeX1OiPJGBu8A0CVy1i9WGQCAk2iLef2i1B?=
	=?us-ascii?Q?Xt00Br047cdDxgptNxPQpjdjmDtiDq+Q5eBTrzjPEIg5SqthoQ28I3o7hGYv?=
	=?us-ascii?Q?10vpg9L/P5PdZFuOmMIlf0/AifCfvMqyv2S42jZPAGVHjJwlH6fTFkGGzNWA?=
	=?us-ascii?Q?dT/ZkCbFRF+G2fq3ghrD25buyVyBW6uNWdJPUY5Ot1lFd0vt9VH9T/g8g03F?=
	=?us-ascii?Q?ESMD5/XlskdFH/Gllo6PhEDPEz8hB3Uu+cc7HcbMW0QI9S1rKWRBiqPdoiJq?=
	=?us-ascii?Q?APXvIgP0dTMmFllSHzTp6WiBWXnA7IGtx9wMY72wbUbjHMwiyMHuLhC4uS78?=
	=?us-ascii?Q?KpjiyI/aZeV4bAnDAbCwai9vgVJLoBx0+gurZaaBr0nYfj7NJnGiQJIFV/go?=
	=?us-ascii?Q?LYfrkCmzu6QvN3EjOuj2uYD4bPMsSOoiM7urTpmwke+wUXc1oHaiZZEUJc8/?=
	=?us-ascii?Q?a0SjMJ9AmR07i9xUS9jqaM5TmRZu8s+zrMIpkWKLB0rTCmUNWGqBjGu3buhb?=
	=?us-ascii?Q?qV6P8v33IWNcIoAH97oqPo4wc8nZM3RjG2LH51rXxNsQTMMLgER2l3/wYtRb?=
	=?us-ascii?Q?rf5znWO9W5aNeSXT0WDEb1xRi5rL2zfAOlyh1L9E3PAB/Gg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2044;
	5:s+LQ48mZfU+PDj0sXUENxcY3ofgTN1NaFstu/ULupQyxCqQcWhpy3wFSWjS7VVe5DQqYuXX9oXsd7YVHduRLC1+0/FO1I7Z19qA5JbuPanvPWQ9nQ5+NaVkZNSA2u8sK0S1JRgRz0fFfL3EpZAGobw==;
	24:qP12m5HJPMrkKVvVMYYkt/NX/BvboJAiLGsghjItqVkituXBpEz1HTTmxOTh+xgLtwgsptBnL8a4Zxad8BAph3xEUdxjwJlaDVRBZ+VDwk0=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2016 00:57:48.8385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB2044
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.141
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Subject: [Qemu-arm] [PATCH] bcm2835_mbox/property: replace ldl_phys/stl_phys
	with endian-specific accesses
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
X-TUID: A34sBAIEPE9h

PMM pointed out that ldl_phys and stl_phys are dependent on the CPU's
endianness, whereas device model code should be independent of
it. This changes the relevant Raspberry Pi devices to explicitly call
the little-endian variants.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---
bcm2835_property will probably have a trivial conflict with my current
patch series (which to add framebuffer-related properties).

 hw/misc/bcm2835_mbox.c     |  6 +++---
 hw/misc/bcm2835_property.c | 38 +++++++++++++++++++-------------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/hw/misc/bcm2835_mbox.c b/hw/misc/bcm2835_mbox.c
index 500baba..106585a 100644
--- a/hw/misc/bcm2835_mbox.c
+++ b/hw/misc/bcm2835_mbox.c
@@ -98,7 +98,7 @@ static void bcm2835_mbox_update(BCM2835MboxState *s)
      */
     for (n = 0; n < MBOX_CHAN_COUNT; n++) {
         while (s->available[n] && !(s->mbox[0].status & ARM_MS_FULL)) {
-            value = ldl_phys(&s->mbox_as, n << MBOX_AS_CHAN_SHIFT);
+            value = ldl_le_phys(&s->mbox_as, n << MBOX_AS_CHAN_SHIFT);
             assert(value != MBOX_INVALID_DATA); /* Pending interrupt but no data */
             mbox_push(&s->mbox[0], value);
         }
@@ -207,12 +207,12 @@ static void bcm2835_mbox_write(void *opaque, hwaddr offset,
             ch = value & 0xf;
             if (ch < MBOX_CHAN_COUNT) {
                 childaddr = ch << MBOX_AS_CHAN_SHIFT;
-                if (ldl_phys(&s->mbox_as, childaddr + MBOX_AS_PENDING)) {
+                if (ldl_le_phys(&s->mbox_as, childaddr + MBOX_AS_PENDING)) {
                     /* Child busy, push delayed. Push it in the arm->vc mbox */
                     mbox_push(&s->mbox[1], value);
                 } else {
                     /* Push it directly to the child device */
-                    stl_phys(&s->mbox_as, childaddr, value);
+                    stl_le_phys(&s->mbox_as, childaddr, value);
                 }
             } else {
                 /* Invalid channel number */
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 581922a..41fbbe3 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -22,20 +22,20 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
 
     s->addr = value;
 
-    tot_len = ldl_phys(&s->dma_as, value);
+    tot_len = ldl_le_phys(&s->dma_as, value);
 
     /* @(addr + 4) : Buffer response code */
     value = s->addr + 8;
     while (value + 8 <= s->addr + tot_len) {
-        tag = ldl_phys(&s->dma_as, value);
-        bufsize = ldl_phys(&s->dma_as, value + 4);
+        tag = ldl_le_phys(&s->dma_as, value);
+        bufsize = ldl_le_phys(&s->dma_as, value + 4);
         /* @(value + 8) : Request/response indicator */
         resplen = 0;
         switch (tag) {
         case 0x00000000: /* End tag */
             break;
         case 0x00000001: /* Get firmware revision */
-            stl_phys(&s->dma_as, value + 12, 346337);
+            stl_le_phys(&s->dma_as, value + 12, 346337);
             resplen = 4;
             break;
         case 0x00010001: /* Get board model */
@@ -44,7 +44,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             resplen = 4;
             break;
         case 0x00010002: /* Get board revision */
-            stl_phys(&s->dma_as, value + 12, s->board_rev);
+            stl_le_phys(&s->dma_as, value + 12, s->board_rev);
             resplen = 4;
             break;
         case 0x00010003: /* Get board MAC address */
@@ -58,24 +58,24 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             break;
         case 0x00010005: /* Get ARM memory */
             /* base */
-            stl_phys(&s->dma_as, value + 12, 0);
+            stl_le_phys(&s->dma_as, value + 12, 0);
             /* size */
-            stl_phys(&s->dma_as, value + 16, s->ram_size);
+            stl_le_phys(&s->dma_as, value + 16, s->ram_size);
             resplen = 8;
             break;
         case 0x00028001: /* Set power state */
             /* Assume that whatever device they asked for exists,
              * and we'll just claim we set it to the desired state
              */
-            tmp = ldl_phys(&s->dma_as, value + 16);
-            stl_phys(&s->dma_as, value + 16, (tmp & 1));
+            tmp = ldl_le_phys(&s->dma_as, value + 16);
+            stl_le_phys(&s->dma_as, value + 16, (tmp & 1));
             resplen = 8;
             break;
 
         /* Clocks */
 
         case 0x00030001: /* Get clock state */
-            stl_phys(&s->dma_as, value + 16, 0x1);
+            stl_le_phys(&s->dma_as, value + 16, 0x1);
             resplen = 8;
             break;
 
@@ -88,15 +88,15 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
         case 0x00030002: /* Get clock rate */
         case 0x00030004: /* Get max clock rate */
         case 0x00030007: /* Get min clock rate */
-            switch (ldl_phys(&s->dma_as, value + 12)) {
+            switch (ldl_le_phys(&s->dma_as, value + 12)) {
             case 1: /* EMMC */
-                stl_phys(&s->dma_as, value + 16, 50000000);
+                stl_le_phys(&s->dma_as, value + 16, 50000000);
                 break;
             case 2: /* UART */
-                stl_phys(&s->dma_as, value + 16, 3000000);
+                stl_le_phys(&s->dma_as, value + 16, 3000000);
                 break;
             default:
-                stl_phys(&s->dma_as, value + 16, 700000000);
+                stl_le_phys(&s->dma_as, value + 16, 700000000);
                 break;
             }
             resplen = 8;
@@ -113,19 +113,19 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
         /* Temperature */
 
         case 0x00030006: /* Get temperature */
-            stl_phys(&s->dma_as, value + 16, 25000);
+            stl_le_phys(&s->dma_as, value + 16, 25000);
             resplen = 8;
             break;
 
         case 0x0003000A: /* Get max temperature */
-            stl_phys(&s->dma_as, value + 16, 99000);
+            stl_le_phys(&s->dma_as, value + 16, 99000);
             resplen = 8;
             break;
 
 
         case 0x00060001: /* Get DMA channels */
             /* channels 2-5 */
-            stl_phys(&s->dma_as, value + 12, 0x003C);
+            stl_le_phys(&s->dma_as, value + 12, 0x003C);
             resplen = 4;
             break;
 
@@ -143,12 +143,12 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             break;
         }
 
-        stl_phys(&s->dma_as, value + 8, (1 << 31) | resplen);
+        stl_le_phys(&s->dma_as, value + 8, (1 << 31) | resplen);
         value += bufsize + 12;
     }
 
     /* Buffer response code */
-    stl_phys(&s->dma_as, s->addr + 4, (1 << 31));
+    stl_le_phys(&s->dma_as, s->addr + 4, (1 << 31));
 }
 
 static uint64_t bcm2835_property_read(void *opaque, hwaddr offset,
-- 
2.5.3

