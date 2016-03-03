Received: by 10.25.208.211 with SMTP id h202csp13821lfg;
        Thu, 3 Mar 2016 10:27:41 -0800 (PST)
X-Received: by 10.55.77.206 with SMTP id a197mr4915967qkb.43.1457029661657;
        Thu, 03 Mar 2016 10:27:41 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j60si13574948qge.40.2016.03.03.10.27.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 10:27:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36731 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abXyP-0008Dg-3F
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 13:27:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1abXvp-0003sQ-7o
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 13:25:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1abXvk-0007Za-6b
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 13:25:01 -0500
Received: from mail-by2on0105.outbound.protection.outlook.com
	([207.46.100.105]:50240
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1abXvj-0007ZS-Qo; Thu, 03 Mar 2016 13:24:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=A4ncqq8uK6Jg2kTydAUxaB++E9qilntfZKbnjopd/+E=;
	b=XVbLU9WKBwyi0Eox1AOl0+rh0uYohNqChLkdlbGlotETnluDr7BVZ1bRoJ43TBKP+zc3blYgI9QXWtYpAewxRSXKPX4yydfPSvE9tltCLmpr8Wc9EeTpXYjuV1bCP5Ptx7NODw1yVf8iMwniA8z2zQOhbvapIzuJq/dlvHh+Ing=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:5::724)
	by CY1PR0301MB2042.namprd03.prod.outlook.com (10.164.2.24) with
	Microsoft
	SMTP Server (TLS) id 15.1.427.16; Thu, 3 Mar 2016 18:24:52 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 3 Mar 2016 10:24:38 -0800
Message-ID: <1457029479-11312-5-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1457029479-11312-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1457029479-11312-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:5::724]
X-ClientProxiedBy: CO2PR20CA0017.namprd20.prod.outlook.com (25.163.96.27) To
	CY1PR0301MB2042.namprd03.prod.outlook.com (25.164.2.24)
X-MS-Office365-Filtering-Correlation-Id: d80e6a2f-06f0-4aa3-1eb0-08d343911d46
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2042;
	2:VSkkthLqyzIbDcPhnp5rCCdeCVKKKAb0khElK2epLgSVG0WkMtjr5ab4iLYhcIGztuuH5chPgmZLMutNl9TFvujeq8AWHXPZpuuwIDgUrxoFCJ8baIacE0XkQkNgFel/fp11rjy46sr3BQQ+j7nmx2RZXmvsCwHyvmPjym7k5lECrf8HFtNiZr3/3n18cs1Y;
	3:87yhwS/g1K8/p75mHcxEjGsZ3T1qkH85uxEVVmf3goRZtRtPIvMizyXsKD6WghaPA+gDlfC/dLbbjH1HLymtiKWGzgY+73GdPxNzkbz1kI2rGjf2rGrHyT0Y/9U0/hWB;
	25:RhujW6qR0HOPQ1CFccOXKgND1q/+2PFr8N8kmHAw4ZW9bZqG0UtYsOqYGkZACL1UedFxw4YrA6mgo/AO8w7aFgVyRjRbqZnTlCDeJCun5SCVUNSjNMcQ6A8u8KUTiDASgo3ZIvUhpMaN33Sgz9ylFCDWJ1oTgCvTpc5lnqrCy+2Neu005CGAeO9+eHRqsFrLRjvE7pD6lT+K8zX+WOdQcVJh46C6o2qHsf/RLQCidoKao87M8Iqfx3ZLu17vb4NH/QPq6nUuYxbW4sE0V9BvpvysPCYiowXAo31DFpg1mK5p/zORqrfxSKw7HSO20gn8LragqWdOLTV1WnU6TWs1Dg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB2042;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2042;
	20:YWudW6rSm4Kc8OGmAGzzS+xIaMeAUBjfL8q5CRKMjm/myOvP+nRPwo+pJXjiEbGuU3TBgrFLZ4X/mkSd2SJDhDx4Nmp7jByUTIX5Dx1HCOXE86Yei8W8dGrLHbT544A0fWmj6Vao0CbwStBluHvUETHRjxuQf2pXk0tPsOKHN/gs3eztqe8QOuPYV9YHsvqZvZdBwhoBGMdy+8hOIlmrW/2MGDbh9iwLITdYbCxJJGW0eD8ZKzodEg859vfEbmELQC/OECj8vu7MMkytjRAMtuTLCfcsZ+kSZZOv8V0k1UxZqJWokGKnbU+nQkg6symWb4fp7sv6eW+QMpeHjFo84/SltI0JZjLSeHnreHy73NwiJslzVFhNY3FTJ9sDHyao3tIX5St5Qqw7ZvMGPu0ur7u+Ow0Sr1l8rtvNxDdGvSN/m12vJ6f4m5LLvUsvS23Xb+4YZXXrIRedzWa4ZJ78AuMkwMhqaiamYuRE9/WMYFY76mo+MV+rC/T9eCxvFSnk;
	4:vgAFp0DYc9GP/H5VtkgAfxGu0zmEdYFSquRvCRFT5A3WslT0AaE0bXrQl7ar+ycr2YJpWGq+gW4pTUnLT3Qf+dPL/JZg3aU7lmRE8JAlljE19yulcv+tuwcw1oOXVeUKzHaauW8AIE/0PWXxKYO/b/nF6H6ZKMvSWo7o2D+kC8jSfEi17LHugIopAMHcd5Y3h4vUfQUKJEdsrK4NJbrDnVM0vmfsrCAO7momrfnJ21YJcLc1rS5NcG95OIPPCkiXrcQVXH18VY8sJ1X5FQROaourH++DLAHOZvuBMeOjmvhQy0X5U20rzIirDd2mkH367EzmNzGf0gpP432Z2Lqv4l4Ub+06EsVevYTE+pyPoE/z3WrLtMh3YdCXU3yiu3CN
X-Microsoft-Antispam-PRVS: <CY1PR0301MB20425C95C3FA9FF4E87EE2939EBD0@CY1PR0301MB2042.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:CY1PR0301MB2042; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB2042; 
X-Forefront-PRVS: 0870212862
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(2351001)(50986999)(4326007)(76176999)(1096002)(2906002)(5005710100001)(87976001)(10290500002)(40100003)(36756003)(4001430100002)(6116002)(47776003)(586003)(122386002)(42186005)(92566002)(86612001)(19580395003)(77096005)(10090500001)(5003940100001)(86362001)(19580405001)(189998001)(2950100001)(50226001)(229853001)(48376002)(5008740100001)(110136002)(50466002)(5004730100002)(107886002)(81166005)(15760500001)(21314002)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB2042;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB2042;
	23:/d7VS1Hb07jD1gVsPIAfxhYKahmJAsmV39tr5LA?=
	=?us-ascii?Q?wkncK1+/Xsv2lKBUdehf1QtutuLFj9dfOdDIhXG6swLTLLhWhmVlb4d1/njZ?=
	=?us-ascii?Q?IQ1JVOzbHN5pVrU2sZIwHpB1W2bneOHV/GEGXz41S7ha7hBIzldeoqMH3Dfk?=
	=?us-ascii?Q?6U0yHTk7FjcJsx5l0VKytPUju4dfML2HWkznUTSBl8nZh6695fwyg2mr+ZKI?=
	=?us-ascii?Q?HIvPMK0k4XXauSU1X/dtaWiJhu2bGfuvO+ejMb624u1GJHF41Qs35G/Xx/p/?=
	=?us-ascii?Q?VthSHyjksx7A8kWIzcYc7Glnwuu+bOCnfIkW8ugc9AHu7AHVuPI5D/1ByF/O?=
	=?us-ascii?Q?MX+cPqiKrq0cDSxNSw+Wc7JrAyEFnK73pNBPzABQKeLu/r4CXb/yHNAd4H6A?=
	=?us-ascii?Q?6feaVr4mOBCn/RP7EVj3vj5f6bZdTDn18PCnnLxYFowmb1bISknRvbP0FWxa?=
	=?us-ascii?Q?L1/2/Z+NUwCWRguYxmTU2bdmGoyoXnFCrEWf5U0y+bmG4EsIhx6VJiVWox0Y?=
	=?us-ascii?Q?Ao83+tv3ZiWlGtJJulprMV0ctXNWtl0zSMldK5ATR+Ra4jDuzYFKxlqfl0+H?=
	=?us-ascii?Q?7YUspt38hCHrX52lO1kgKZTMhmwDPfT6sRYIIPK83FuIWsRL5MNAOmXhZFsY?=
	=?us-ascii?Q?Z7I2oMFB0jwFkb8tQn9FpQjGxQ1YXZTYOSdO+yS58Ha5e/FG5zWAsUHp58EW?=
	=?us-ascii?Q?h/4QFULZ4RaUr+EjG8/M7HpMNMV7gjgL7n5nkmXaxe5Kga8jxBXTopEqXKXc?=
	=?us-ascii?Q?llaFhkkRhGrwPuS/q+W2ZD0gex9ULlMQ322IpxwWkKYtK/NpzB7UFUIVg2C9?=
	=?us-ascii?Q?mAj1R5nrBBLoYUC8O83uZEIzjU1qHTN4+fuO1pta3D/1FYgltEJ6KxaSITVo?=
	=?us-ascii?Q?pIKRw50zWRif+cwY5ZwSMYCQ6CebtDmnvhU2B0tsNUY/dB3YpAv1CL+zeilP?=
	=?us-ascii?Q?hb+MXMBj9Uc/eNVH5XSLh3uuuFFzhMqXMbn23/9lfENlK0RB5zZ9UTVHglbM?=
	=?us-ascii?Q?9zGsNEITrLW0QNY4o9++sQgpgLy+O/kVQQ0daWtqQioonOhmUFbfgrtlUTpP?=
	=?us-ascii?Q?fmm5PHbdpF20nMR52FgBVjWpiGPzOktt1iPHbNlZOT2aI8ufmQ1jMhIcxV+A?=
	=?us-ascii?Q?hJiGHAZqvAT4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2042;
	5:EjusSPcPfI4gYmQkwjSiUZgNOKic/4/nIL9CGJ5SyJPgJKomJ0/fV/t5pFW+hDSTmf71En4xKLcjLTKu31CPtXGATNFfglV3f7hM7UZS0qkD5OhGJFY8EHfgpa0l3ufl2SKRysHMAcZn72BRHftmvA==;
	24:a+oVxrjJm8IiCPMq5ITWeWmS31lIyv8ULjeBEyoirE33Mqb6Q4OxfwdH3sGD1YKZrwE021HrALbqMPWbSHFTBuhpTwdajOwPwl8872SFx7k=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2016 18:24:52.7012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB2042
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.105
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-devel] [PATCH v2 4/5] bcm2835_property: implement framebuffer
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
X-TUID: y1jE2LAhJDT2

The property channel driver now interfaces with the framebuffer device
to query and set framebuffer parameters. As a result of this, the "get
ARM RAM size" query now correctly returns the video RAM base address
(not total RAM size), and the ram-size property is no longer relevant
here.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---

Notes:
    v2:
     * avoid ldl/stl_phys
     * move code to increase default pi2 memory size from preceding patch here
       (it was incorrect without the property channel implementation changes)

 hw/arm/bcm2835_peripherals.c       |   8 +--
 hw/arm/raspi.c                     |   7 +-
 hw/misc/bcm2835_property.c         | 139 ++++++++++++++++++++++++++++++++++++-
 include/hw/misc/bcm2835_property.h |   5 +-
 4 files changed, 144 insertions(+), 15 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 552611a..9b9de99 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -80,6 +80,8 @@ static void bcm2835_peripherals_init(Object *obj)
                               "board-rev", &error_abort);
     qdev_set_parent_bus(DEVICE(&s->property), sysbus_get_default());
 
+    object_property_add_const_link(OBJECT(&s->property), "fb",
+                                   OBJECT(&s->fb), &error_abort);
     object_property_add_const_link(OBJECT(&s->property), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr), &error_abort);
 
@@ -210,12 +212,6 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
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
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 5498209..83fe809 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -164,11 +164,6 @@ static void raspi2_machine_init(MachineClass *mc)
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
     mc->max_cpus = BCM2836_NCPUS;
-
-    /* XXX: Temporary restriction in RAM size from the full 1GB. Since
-     * we do not yet support the framebuffer / GPU, we need to limit
-     * RAM usable by the OS to sit below the peripherals.
-     */
-    mc->default_ram_size = 0x3F000000; /* BCM2836_PERI_BASE */
+    mc->default_ram_size = 1024 * 1024 * 1024;
 };
 DEFINE_MACHINE("raspi2", raspi2_machine_init)
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 41fbbe3..15dcc02 100644
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
             stl_le_phys(&s->dma_as, value + 12, 0);
             /* size */
-            stl_le_phys(&s->dma_as, value + 16, s->ram_size);
+            stl_le_phys(&s->dma_as, value + 16, s->fbdev->vcram_base);
+            resplen = 8;
+            break;
+        case 0x00010006: /* Get VC memory */
+            /* base */
+            stl_le_phys(&s->dma_as, value + 12, s->fbdev->vcram_base);
+            /* size */
+            stl_le_phys(&s->dma_as, value + 16, s->fbdev->vcram_size);
             resplen = 8;
             break;
         case 0x00028001: /* Set power state */
@@ -122,6 +134,114 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             resplen = 8;
             break;
 
+        /* Frame buffer */
+
+        case 0x00040001: /* Allocate buffer */
+            stl_le_phys(&s->dma_as, value + 12, s->fbdev->base);
+            stl_le_phys(&s->dma_as, value + 16, s->fbdev->size);
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
+            stl_le_phys(&s->dma_as, value + 12, s->fbdev->xres);
+            stl_le_phys(&s->dma_as, value + 16, s->fbdev->yres);
+            resplen = 8;
+            break;
+        case 0x00044003: /* Test display width/height */
+        case 0x00044004:
+            resplen = 8;
+            break;
+        case 0x00048003: /* Set display width/height */
+        case 0x00048004:
+            xres = ldl_le_phys(&s->dma_as, value + 12);
+            newxres = &xres;
+            yres = ldl_le_phys(&s->dma_as, value + 16);
+            newyres = &yres;
+            resplen = 8;
+            break;
+        case 0x00040005: /* Get depth */
+            stl_le_phys(&s->dma_as, value + 12, s->fbdev->bpp);
+            resplen = 4;
+            break;
+        case 0x00044005: /* Test depth */
+            resplen = 4;
+            break;
+        case 0x00048005: /* Set depth */
+            bpp = ldl_le_phys(&s->dma_as, value + 12);
+            newbpp = &bpp;
+            resplen = 4;
+            break;
+        case 0x00040006: /* Get pixel order */
+            stl_le_phys(&s->dma_as, value + 12, s->fbdev->pixo);
+            resplen = 4;
+            break;
+        case 0x00044006: /* Test pixel order */
+            resplen = 4;
+            break;
+        case 0x00048006: /* Set pixel order */
+            pixo = ldl_le_phys(&s->dma_as, value + 12);
+            newpixo = &pixo;
+            resplen = 4;
+            break;
+        case 0x00040007: /* Get alpha */
+            stl_le_phys(&s->dma_as, value + 12, s->fbdev->alpha);
+            resplen = 4;
+            break;
+        case 0x00044007: /* Test pixel alpha */
+            resplen = 4;
+            break;
+        case 0x00048007: /* Set alpha */
+            alpha = ldl_le_phys(&s->dma_as, value + 12);
+            newalpha = &alpha;
+            resplen = 4;
+            break;
+        case 0x00040008: /* Get pitch */
+            stl_le_phys(&s->dma_as, value + 12, s->fbdev->pitch);
+            resplen = 4;
+            break;
+        case 0x00040009: /* Get virtual offset */
+            stl_le_phys(&s->dma_as, value + 12, s->fbdev->xoffset);
+            stl_le_phys(&s->dma_as, value + 16, s->fbdev->yoffset);
+            resplen = 8;
+            break;
+        case 0x00044009: /* Test virtual offset */
+            resplen = 8;
+            break;
+        case 0x00048009: /* Set virtual offset */
+            xoffset = ldl_le_phys(&s->dma_as, value + 12);
+            newxoffset = &xoffset;
+            yoffset = ldl_le_phys(&s->dma_as, value + 16);
+            newyoffset = &yoffset;
+            resplen = 8;
+            break;
+        case 0x0004000a: /* Get/Test/Set overscan */
+        case 0x0004400a:
+        case 0x0004800a:
+            stl_le_phys(&s->dma_as, value + 12, 0);
+            stl_le_phys(&s->dma_as, value + 16, 0);
+            stl_le_phys(&s->dma_as, value + 20, 0);
+            stl_le_phys(&s->dma_as, value + 24, 0);
+            resplen = 16;
+            break;
+        case 0x0004800b: /* Set palette */
+            offset = ldl_le_phys(&s->dma_as, value + 12);
+            length = ldl_le_phys(&s->dma_as, value + 16);
+            n = 0;
+            while (n < length - offset) {
+                color = ldl_le_phys(&s->dma_as, value + 20 + (n << 2));
+                stl_le_phys(&s->dma_as,
+                            s->fbdev->vcram_base + ((offset + n) << 2), color);
+                n++;
+            }
+            stl_le_phys(&s->dma_as, value + 12, 0);
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
     stl_le_phys(&s->dma_as, s->addr + 4, (1 << 31));
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

