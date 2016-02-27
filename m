Received: by 10.25.208.211 with SMTP id h202csp88448lfg;
        Fri, 26 Feb 2016 16:21:16 -0800 (PST)
X-Received: by 10.140.28.162 with SMTP id 31mr5618985qgz.81.1456532476562;
        Fri, 26 Feb 2016 16:21:16 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u5si15596660qhu.25.2016.02.26.16.21.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Feb 2016 16:21:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:52677 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZSdH-0000dO-UV
	for alex.bennee@linaro.org; Fri, 26 Feb 2016 19:21:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aZScM-0007rc-3J
	for qemu-devel@nongnu.org; Fri, 26 Feb 2016 19:20:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aZScH-0001Qv-3H
	for qemu-devel@nongnu.org; Fri, 26 Feb 2016 19:20:18 -0500
Received: from mail-bn1bn0104.outbound.protection.outlook.com
	([157.56.110.104]:28336
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aZScG-0001Qk-UN; Fri, 26 Feb 2016 19:20:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=tDHeebByTJSUUaTpLS47zsSmxYWz8GCiaaWUdafHSYU=;
	b=a/LsZOU7enRPOJMHLk+1OrXRc0xjJIbynOuMn//LGAPWtCIJ3prjARvdKkIh96XtdJ7LjJQeibe2NOyY8VGVISifQB7Flb4gej19pOQWHvlm/hDwbpklU0lkMgSaNXyBYh2IMj0ulLU4+Dv2V0R92tLyvnt15s+uQ7YzI69qd/8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:f::724)
	by SN1PR0301MB2046.namprd03.prod.outlook.com (10.163.226.155) with
	Microsoft
	SMTP Server (TLS) id 15.1.409.15; Sat, 27 Feb 2016 00:20:10 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 26 Feb 2016 16:16:14 -0800
Message-ID: <1456532174-17432-5-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1456532174-17432-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1456532174-17432-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:f::724]
X-ClientProxiedBy: CO2PR20CA0016.namprd20.prod.outlook.com (25.163.96.26) To
	SN1PR0301MB2046.namprd03.prod.outlook.com (25.163.226.155)
X-MS-Office365-Filtering-Correlation-Id: 821ed82c-87d4-464c-8626-08d33f0bc1a1
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	2:8+lqzH56mtNpHJ+WHZVKBuQLacON6KR6syTvPmF9mDcaRBHCSLgWeJK9m91IWZPZVbq9VzK3BZfdjVP/c/ku8RNRna8Nw0Ks8LrEmLIoqFzm7BBIE+SiMfFSQuTAh815mlOr6jtGw0KDDiQvyOgiy9pH+wErhW2/bh2Pqa4XfcrU8w6KZmJgaTe1Curc1eIo;
	3:jiYXul3eouNz+ysy8VgU7eEvLtD6vTEzYNLbxraa4uS/y4Emp8JG/J9j16+DVolhNUiUoGIWQqN88UlhTllfqkoEvNMy2Do7RD8y+XvSA+62FyBVcCB1tPx1uHy0LpmP;
	25:0aamEB8A9UZBvSWNK5/AFB482fwNW7GIN6PSzmCMNBet3p9bI4nBe1I8GCuY2UdIxKICII5AQgwWwK1NMGLnBgW+25Ql16aEZysMrlXlD9CO4H0VLzWbwpPNdcTIoqAjZMAy4A9KTPhdgjIwlOBGFBXzHjHbZKSUuHLnaW8CPJhFFq/fc0qxfSUsc3j6z4G7WF0h37y/hCCi6wt7O1jCBcVARFCbex2RQke1MKUxVsxMhKbzyxhNndk/tfk14SwwNIH8Rukiw5SFDmedKvlPDvEdT38K8tZwfVGWZDnscsBFLqIXZQqCzNPuHutK+G+bY3RQvnxolENu0oj+nadm2A==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1PR0301MB2046;
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	20:C120w10k4BWIGzpZWTRbSCOb7AZMa9RD2At/rYF58Hq51n7PkgVARV5QGlFqOH7TmJItUPTDfkQRVVdcscknPESEu28UlRab5QGJNu41HDtGizVrW/LE/imxlYjGHL/JV1eRzlXwQ4hhkEYdv0iYM24Jn/f+aOysKudvxS8acHEjDWJkMqHKDtJTg4893WOhekR25ilLGBgsGLCBBWZomrQjvyXIdtzXlTE51QoZdbZKwqMyUSsi4ctJ0me7s5dxZaPts2aAxh+6mq1eC4zy8OILKmDAKQtW1lkOXRLrL08OFKw54aFVp80sVrLOszEl1fw/lYbhI4Gf2uCrasfNbSt4b+sApHbyLXHrE3w1ZJgmkjHT3NjqiTHunVX5APsyi8p0SrlNN8bDmBoUneS/UhlRS5mwX+S77BkSWteNYL7lczn8ehq3uzZ6Ly+5J4BGnDZrKRcxOVRZxKMH6QtIVmvjLqb408esJLPvbJiH1hXDArvQmTYxoIob2LCQvdlt;
	4:EPNfMER8pqSOQ0s25pNLn3vC3zSyHrM7epLFbdNXjN9EiK1cYsMKH7FvYfPHNtbswaVPZVc3XjRYuOU81wBgmspD6hh+xRwvYvBS7Ju5EEGHkmjPQwasFrlWExKKExSHFOXU5rSrg1k7gOBfMq3YTMFzgCP+4nS0aZKsQphuU5aIQJlqyNtCcgPDv7TkJkyyTwgXZ+nK35tde+/F7vqLDj67cDpVFKzI5bs13FK2oHLM0ze6LXoxubAMJY08YAQP58Jz5EtdCIDJNRdaoMs7oYzexC4nmWOwyAHezbuqA/XbqU5DdH5+shfL4YAppyOUZMBUpXokavlEzQVqAYcl/Kw9ZKm+jwPXNTC/O+epCh1HFA4WRjFhPx+5s67ihQbF
X-Microsoft-Antispam-PRVS: <SN1PR0301MB204637CFD0C95923BFE52CCB9EB80@SN1PR0301MB2046.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:SN1PR0301MB2046; BCL:0; PCL:0; RULEID:;
	SRVR:SN1PR0301MB2046; 
X-Forefront-PRVS: 086597191B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(36756003)(122386002)(87976001)(5003940100001)(10090500001)(86612001)(50226001)(40100003)(50986999)(86362001)(76176999)(189998001)(4326007)(47776003)(5005710100001)(10290500002)(5008740100001)(4001430100002)(92566002)(2351001)(6116002)(229853001)(586003)(1096002)(42186005)(110136002)(19580405001)(50466002)(77096005)(2950100001)(2906002)(107886002)(19580395003)(5001960100002)(48376002)(15760500001)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN1PR0301MB2046;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR0301MB2046;
	23:JrQO4+TZPt6zStGLeIAo2jbAHMwYFfxUT/W505v?=
	=?us-ascii?Q?RobOAuNIDXzb2ugeZQPlxUKU8h5/gZPwdwYbBv7RKG6dtPyD6yPEwWQXranT?=
	=?us-ascii?Q?FMVsZiZ3IjKD0rAgk75CShCSCIWWBfz6FNecXDgRMk8gaIROlho2MVtjj7ik?=
	=?us-ascii?Q?2FNq5Y8ybqXbpOdlQX8pCZT2nTrr0svWjtVxF938NYRDS8Jp1P0ua4zKbBoA?=
	=?us-ascii?Q?pih6vv4Z3SB69/xc0Us8BF/VgF+cW8PCPyOUpX7j2huHHqRny0E+mTBVoN+N?=
	=?us-ascii?Q?7rIjoAcBb03PUQirVmmEUivayEs5FdafisNH37OusymRb3EZtFjYj6mcEIZw?=
	=?us-ascii?Q?pyieomKhnEyBmU00rEIMm/C5WcPvQDZ9dYmPNhGucxSDad617ywEv+qJq2Jh?=
	=?us-ascii?Q?soSO44rCIEnFuMp+XiNmys8hueugZVClCK4Z24GWSl91GzNcN4ZrrU56WicI?=
	=?us-ascii?Q?+kPx/uxOZ+Wv1vJBiHPrsYyg7mOz2neWCK+/gKU3JhTr1AB2BE1AnxZPtDyo?=
	=?us-ascii?Q?63WE0JL6uCk3ftzeXOk2sj07KFdQpFg/JLjbgQbWUegShIhtkVgOptgd5GYk?=
	=?us-ascii?Q?M8IjqSuYbqNVOv1N6VUvtKkCNnfGPA+FpMKRQ4j0dcTXjXr/lLn7TaCUMKQh?=
	=?us-ascii?Q?05fE7RtoGYK1W2AHETlmq19S+HrSVnrjPyGiiN6GKyVU9fqzZ6a/oXHDLuFi?=
	=?us-ascii?Q?r8DM0WrmL2t+iO34DYLf0WqhcKMOGekr6Bb73DmY5rEY5ltrixfoJ7Wxh4de?=
	=?us-ascii?Q?p8ACZ/cEGZHyULmrziMYFt4eZYtrggDcmYCqhpOz+guEfLxb/2r8kdnVxaws?=
	=?us-ascii?Q?dQT2mgIGiHOGBirHl57tFYdrLankMEqYuCYTB8dsT3r43NCe/nmlnNBG5eBI?=
	=?us-ascii?Q?ceO+T3XeRWSB109e9z1O7F3rYI5+YdkhlO8qwGv1RQ4tUayRVbAcs53r2hHD?=
	=?us-ascii?Q?GnL7znLbOAW3IyT8LGfvPHPrZz7jd7yl/6Bj3LmslueztNil4dHV83ahY4tS?=
	=?us-ascii?Q?q/jxpTJ6Y4Cz9bw498Pcm1RgrUT6HdAmrmbKyYfrwDjNPAa4byKsunVLXYWV?=
	=?us-ascii?Q?QkZ44ej4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2046;
	5:Bqr18FeMygo2pY7zajtdDdKYubu8qrVmgyZM8MEmfT86W+tvTkRdkj5mA7PHzSJyUlnAJk1yHj0tsR95SzGtheAHwYNcc5j9VS8Iv6mJfBhcLI71eUdnkV+g26JM2ORgO+qEJVxH2OZC0PT9emWqHQ==;
	24:LzXmLt9sU0bsYBbPmYJgAowzhdvXqq12Iu88fDCY/VUmBb4yeVOwetinDSSQkflGK2chnUdTIfVFRJCjlrnjEqVOkdeQh8JHWqCCMJ0gUoE=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2016 00:20:10.9837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR0301MB2046
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.104
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH 4/4] bcm2835_property: implement framebuffer
	control/configuration properties
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
X-TUID: ah0CG4HCtrK0

The property channel driver now interfaces with the framebuffer device
to query and set framebuffer parameters. As a result of this, the "get
ARM RAM size" query now correctly returns the video RAM base address
(not total RAM size), and the ram-size property is no longer relevant
here.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---
 hw/arm/bcm2835_peripherals.c       |   8 +--
 hw/misc/bcm2835_property.c         | 139 ++++++++++++++++++++++++++++++++++++-
 include/hw/misc/bcm2835_property.h |   5 +-
 3 files changed, 143 insertions(+), 9 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index eff4fa2..c2b812a 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -78,6 +78,8 @@ static void bcm2835_peripherals_init(Object *obj)
                               "board-rev", &error_abort);
     qdev_set_parent_bus(DEVICE(&s->property), sysbus_get_default());
 
+    object_property_add_const_link(OBJECT(&s->property), "fb",
+                                   OBJECT(&s->fb), &error_abort);
     object_property_add_const_link(OBJECT(&s->property), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr), &error_abort);
 
@@ -199,12 +201,6 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
                        qdev_get_gpio_in(DEVICE(&s->mboxes), MBOX_CHAN_FB));
 
     /* Property channel */
-    object_property_set_int(OBJECT(&s->property), ram_size, "ram-size", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-
     object_property_set_bool(OBJECT(&s->property), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 581922a..8bffad9 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -17,6 +17,11 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
     uint32_t tot_len;
     size_t resplen;
     uint32_t tmp;
+    int n;
+    uint32_t offset, length, color;
+    uint32_t xres, yres, xoffset, yoffset, bpp, pixo, alpha;
+    uint32_t *newxres = NULL, *newyres = NULL, *newxoffset = NULL,
+        *newyoffset = NULL, *newbpp = NULL, *newpixo = NULL, *newalpha = NULL;
 
     value &= ~0xf;
 
@@ -60,7 +65,14 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             /* base */
             stl_phys(&s->dma_as, value + 12, 0);
             /* size */
-            stl_phys(&s->dma_as, value + 16, s->ram_size);
+            stl_phys(&s->dma_as, value + 16, s->fbdev->vcram_base);
+            resplen = 8;
+            break;
+        case 0x00010006: /* Get VC memory */
+            /* base */
+            stl_phys(&s->dma_as, value + 12, s->fbdev->vcram_base);
+            /* size */
+            stl_phys(&s->dma_as, value + 16, s->fbdev->vcram_size);
             resplen = 8;
             break;
         case 0x00028001: /* Set power state */
@@ -122,6 +134,114 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             resplen = 8;
             break;
 
+        /* Frame buffer */
+
+        case 0x00040001: /* Allocate buffer */
+            stl_phys(&s->dma_as, value + 12, s->fbdev->base);
+            stl_phys(&s->dma_as, value + 16, s->fbdev->size);
+            resplen = 8;
+            break;
+        case 0x00048001: /* Release buffer */
+            resplen = 0;
+            break;
+        case 0x00040002: /* Blank screen */
+            resplen = 4;
+            break;
+        case 0x00040003: /* Get display width/height */
+        case 0x00040004:
+            stl_phys(&s->dma_as, value + 12, s->fbdev->xres);
+            stl_phys(&s->dma_as, value + 16, s->fbdev->yres);
+            resplen = 8;
+            break;
+        case 0x00044003: /* Test display width/height */
+        case 0x00044004:
+            resplen = 8;
+            break;
+        case 0x00048003: /* Set display width/height */
+        case 0x00048004:
+            xres = ldl_phys(&s->dma_as, value + 12);
+            newxres = &xres;
+            yres = ldl_phys(&s->dma_as, value + 16);
+            newyres = &yres;
+            resplen = 8;
+            break;
+        case 0x00040005: /* Get depth */
+            stl_phys(&s->dma_as, value + 12, s->fbdev->bpp);
+            resplen = 4;
+            break;
+        case 0x00044005: /* Test depth */
+            resplen = 4;
+            break;
+        case 0x00048005: /* Set depth */
+            bpp = ldl_phys(&s->dma_as, value + 12);
+            newbpp = &bpp;
+            resplen = 4;
+            break;
+        case 0x00040006: /* Get pixel order */
+            stl_phys(&s->dma_as, value + 12, s->fbdev->pixo);
+            resplen = 4;
+            break;
+        case 0x00044006: /* Test pixel order */
+            resplen = 4;
+            break;
+        case 0x00048006: /* Set pixel order */
+            pixo = ldl_phys(&s->dma_as, value + 12);
+            newpixo = &pixo;
+            resplen = 4;
+            break;
+        case 0x00040007: /* Get alpha */
+            stl_phys(&s->dma_as, value + 12, s->fbdev->alpha);
+            resplen = 4;
+            break;
+        case 0x00044007: /* Test pixel alpha */
+            resplen = 4;
+            break;
+        case 0x00048007: /* Set alpha */
+            alpha = ldl_phys(&s->dma_as, value + 12);
+            newalpha = &alpha;
+            resplen = 4;
+            break;
+        case 0x00040008: /* Get pitch */
+            stl_phys(&s->dma_as, value + 12, s->fbdev->pitch);
+            resplen = 4;
+            break;
+        case 0x00040009: /* Get virtual offset */
+            stl_phys(&s->dma_as, value + 12, s->fbdev->xoffset);
+            stl_phys(&s->dma_as, value + 16, s->fbdev->yoffset);
+            resplen = 8;
+            break;
+        case 0x00044009: /* Test virtual offset */
+            resplen = 8;
+            break;
+        case 0x00048009: /* Set virtual offset */
+            xoffset = ldl_phys(&s->dma_as, value + 12);
+            newxoffset = &xoffset;
+            yoffset = ldl_phys(&s->dma_as, value + 16);
+            newyoffset = &yoffset;
+            resplen = 8;
+            break;
+        case 0x0004000a: /* Get/Test/Set overscan */
+        case 0x0004400a:
+        case 0x0004800a:
+            stl_phys(&s->dma_as, value + 12, 0);
+            stl_phys(&s->dma_as, value + 16, 0);
+            stl_phys(&s->dma_as, value + 20, 0);
+            stl_phys(&s->dma_as, value + 24, 0);
+            resplen = 16;
+            break;
+        case 0x0004800b: /* Set palette */
+            offset = ldl_phys(&s->dma_as, value + 12);
+            length = ldl_phys(&s->dma_as, value + 16);
+            n = 0;
+            while (n < length - offset) {
+                color = ldl_phys(&s->dma_as, value + 20 + (n << 2));
+                stl_phys(&s->dma_as,
+                         s->fbdev->vcram_base + ((offset + n) << 2), color);
+                n++;
+            }
+            stl_phys(&s->dma_as, value + 12, 0);
+            resplen = 4;
+            break;
 
         case 0x00060001: /* Get DMA channels */
             /* channels 2-5 */
@@ -147,6 +267,13 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
         value += bufsize + 12;
     }
 
+    /* Reconfigure framebuffer if required */
+    if (newxres || newyres || newxoffset || newyoffset || newbpp || newpixo
+        || newalpha) {
+        bcm2835_fb_reconfigure(s->fbdev, newxres, newyres, newxoffset,
+                               newyoffset, newbpp, newpixo, newalpha);
+    }
+
     /* Buffer response code */
     stl_phys(&s->dma_as, s->addr + 4, (1 << 31));
 }
@@ -241,6 +368,15 @@ static void bcm2835_property_realize(DeviceState *dev, Error **errp)
     Object *obj;
     Error *err = NULL;
 
+    obj = object_property_get_link(OBJECT(dev), "fb", &err);
+    if (obj == NULL) {
+        error_setg(errp, "%s: required fb link not found: %s",
+                   __func__, error_get_pretty(err));
+        return;
+    }
+
+    s->fbdev = BCM2835_FB(obj);
+
     obj = object_property_get_link(OBJECT(dev), "dma-mr", &err);
     if (obj == NULL) {
         error_setg(errp, "%s: required dma-mr link not found: %s",
@@ -259,7 +395,6 @@ static void bcm2835_property_realize(DeviceState *dev, Error **errp)
 
 static Property bcm2835_property_props[] = {
     DEFINE_PROP_UINT32("board-rev", BCM2835PropertyState, board_rev, 0),
-    DEFINE_PROP_UINT32("ram-size", BCM2835PropertyState, ram_size, 0),
     DEFINE_PROP_END_OF_LIST()
 };
 
diff --git a/include/hw/misc/bcm2835_property.h b/include/hw/misc/bcm2835_property.h
index df889ea..edcab60 100644
--- a/include/hw/misc/bcm2835_property.h
+++ b/include/hw/misc/bcm2835_property.h
@@ -9,6 +9,7 @@
 #include "hw/sysbus.h"
 #include "exec/address-spaces.h"
 #include "net/net.h"
+#include "hw/display/bcm2835_fb.h"
 
 #define TYPE_BCM2835_PROPERTY "bcm2835-property"
 #define BCM2835_PROPERTY(obj) \
@@ -18,13 +19,15 @@ typedef struct {
     /*< private >*/
     SysBusDevice busdev;
     /*< public >*/
+
     MemoryRegion *dma_mr;
     AddressSpace dma_as;
     MemoryRegion iomem;
     qemu_irq mbox_irq;
+    BCM2835FBState *fbdev;
+
     MACAddr macaddr;
     uint32_t board_rev;
-    uint32_t ram_size;
     uint32_t addr;
     bool pending;
 } BCM2835PropertyState;
-- 
2.5.3

