Received: by 10.25.208.211 with SMTP id h202csp2131964lfg;
        Tue, 8 Mar 2016 12:06:55 -0800 (PST)
X-Received: by 10.55.217.17 with SMTP id u17mr31299786qki.108.1457467614259;
        Tue, 08 Mar 2016 12:06:54 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b7si4601454qgb.59.2016.03.08.12.06.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Mar 2016 12:06:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=neutral (body hash did not verify) header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:36995 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adNu9-0005gn-K8
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 15:06:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1adNtE-00041t-B0
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 15:06:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1adNtC-0004Me-Nt
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 15:05:56 -0500
Received: from mail-bl2on0141.outbound.protection.outlook.com
	([65.55.169.141]:24032
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1adNt6-0004Hl-3r; Tue, 08 Mar 2016 15:05:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Kdr44e/jK16Osoe9P/vea+AYiijg7nnM4I1WbCxJjEU=;
	b=b/1p3yWRo+A9ltD5XAPRR6vpASU3yNzXeCpwVoMq6EqN05HLhUlajQYWATXqALW1ce2Bx255SPyerFWbMk3ms7HjUnqo72bTyKtwS0mS9CJmrfC+rjlzlYEruQobffnmsSO/37CvE69KszSIfSgvpDw9OLRhBHK9knRx4l2gse0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8::5f2)
	by BLUPR0301MB2036.namprd03.prod.outlook.com (10.164.22.26) with
	Microsoft
	SMTP Server (TLS) id 15.1.427.16; Tue, 8 Mar 2016 20:05:45 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 8 Mar 2016 12:05:25 -0800
Message-ID: <1457467526-8840-5-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1457467526-8840-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1457467526-8840-1-git-send-email-Andrew.Baumann@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:4898:80e8::5f2]
X-ClientProxiedBy: BY1PR10CA0031.namprd10.prod.outlook.com (25.160.197.41) To
	BLUPR0301MB2036.namprd03.prod.outlook.com (25.164.22.26)
X-MS-Office365-Filtering-Correlation-Id: b0c65733-b546-4201-8b5d-08d3478d09b6
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2036;
	2:kyQWBk0tN91WPyz6lTp0HQTs1HLyFXyH6oSrN204pkgR1d8Ya6+6JnX7Ay0hY/hhvtHuHpoDh/RjfFaZcqHzFw5LvBCi9vsMs5IXDBWaLKBJfUvbh04XpLLjWVuobsVe15nGxzwz4taot8lBdkh3i22gtOgEyCXlOUwZMhZEloOSu/PRbP03h9swe62VslMb;
	3:e8mLQKELvSmKUJJoaGjcZjT34r5MGfc8DeZ9fnZYfHChFDvm4r7XhNTm86OD1JcxB281wV3SMAjeYSeOT+3WK2d3veZn4VmxFB96cYtn1W8sMRHmDpLoZqA62g4J9yaT;
	25:yWBvj8M1hAMV5THM5eUVjIt2+n5PmFp1kwnScy3C/2zsLEvPgdKl5eo7Ov50QV6kXmSia9PfY5i0KsWh6t14c+pNo/W9lImmKthmN33IQHLMB1JedqQ3/0tjL4CpbQsPHXk4c/CZltuRL1JOFNBiasR+JHbZsJnpE5/l/yBSqed7HW20bO4xCpr5Cc92CvzalrFsAPOLE0+FDlItKDL+jfJ/5oTrO5BO72VybHvSZ0HAQUKPPAb0N/3q0cyhHfpTSHSp6EfNKH7Z7JQRxuq+4VdoDada30XrTDV34joAa/cz5fArKknhRIYbJTedBkxsAShx6vWHeMnoPBsXFVranYuc1X0f583IpKt0PQeXUtM=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2036;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2036;
	20:8U8yM0mrnJvoVa5IO9fneZ9yZ76WOgg54sAY65DHL5EkaQG9tfnGXhw0jQ6a6kTBUoGPhI1NnQ25kZxrkhfsnruq/gekDITCQvRZ8tpgk+/KK56xDEMqeMXDu8xPjbh73T9wiPbGl7y3RqXQ9Kgxl/LXNrkR3rr2uyRUloHyrIWBiwXV0W/cA+9JElEr2eaY4Aw9WMO6IDNnCBt7RdALiicx2ISwMDLfu1O8+BP7Dd2pX+ojjcfRu4IhxpE3GrfFKhB8mdV2kg9LO7Rt1dhirZFKzHhFNqX4FOog1iA6XdlsUnxaohW7FxYh+xW860Vx9a5toyb7E8IytN6pQYJZuNgHkmA6ima+va7ZkGJsivgYm5IlZ/0OwrBl7VS/Y1s3sis/k1oOngbPf6M/51ztz73iJG5ZRluwatl+0e4hgaFV/8nwrY6rHrxLH5W8UDshnN8YIiGG8ylB+/lNf51gZuW7MNqTdoc3mvpuHfhGQ705LwCPFheVfGZWhy8J1d29;
	4:rmSWQVdXNmSEAKOE2izQTQr3GsuSbHhzIyqLRyT5C88pV69NfVPj2Fm9x1+M3O9YMKnlJqdlUUlzOyuOdl0eTDZqCAYqaKs9GWji25wxD5rso7guPoaZTij7hAQ4FyStUfzIyMsu/sXqQcj4isQhOUBZCNBlfZ+Co0FmSXRT3ReMtYYNLMbCEcf9x4QeITpkYor2gfIMmNHeOtBggLy/1tgSqqES2eFoYKxYiSUUwQKjYJTqGVBmJDxU5Elaa45dVELHiZR33z6ppyQNaAYQcMYcTCKvipXFxUUOmln5DvtPrTmon4JXcU+aWUJ7y6e8oZnmnkJ9d3JX4J32SDfBWHA+7z61ypuCn/u0M5wib7yJjIjKwjV6mAbeIdmHKwo1
X-Microsoft-Antispam-PRVS: <BLUPR0301MB2036C17B1A0E77CE8A2661869EB20@BLUPR0301MB2036.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:BLUPR0301MB2036; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2036; 
X-Forefront-PRVS: 08756AC3C8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(10290500002)(47776003)(5005710100001)(2950100001)(86362001)(189998001)(86612001)(36756003)(10090500001)(19580395003)(42186005)(2906002)(6116002)(23676002)(586003)(2870700001)(5008740100001)(4001430100002)(50986999)(5820100001)(76176999)(92566002)(50466002)(77096005)(2351001)(229853001)(19580405001)(110136002)(107886002)(5004730100002)(81166005)(1096002)(4326007)(50226001)(15760500001)(21314002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2036;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2036;
	23:ZlOOYfxCCb5J4CQwBpdLqkqMIGtGtbSG89zZlMc?=
	=?us-ascii?Q?/rVsBjl9ekmTCAQJFT4uPyWndiDLWDskSF7LtTbm/DYiGU+138kRYLL4Dlzn?=
	=?us-ascii?Q?xJxrJLZxurSdvJJOc7KPQ6kRJrisE4CN7dcB+DVmSGtzNtNWkHkyfTw4v4Cu?=
	=?us-ascii?Q?ZGgtnimvRqkd3k4FKn3SeIy1S4p3qaqzAihe+chyGRHkvOje5i9vH8ljq3DJ?=
	=?us-ascii?Q?udRKdOz4S/DGFbzwka6MifnmZh4FGtLf3aBfcNDhezL5EmzcotPB1TsXGV5L?=
	=?us-ascii?Q?VwdLRAp5YzIm5oyzMnUfibfXokUSWmpLYtww7G0L1Win2NaWFIdvxJCAqkz2?=
	=?us-ascii?Q?4Bh49Ng5J1mPcZWnoQpiZK3agJg9eJj+ac/iSdu6kC+APVQZSeHpUbnTw+kK?=
	=?us-ascii?Q?l8rTQgC6yj8ScMZpzqYJ7viGq8m+k8aSVLMvp7+kt6JZf1N6W3Gqwe+s1KF6?=
	=?us-ascii?Q?/zbOORJuTZMBE42rSeCXrfyfp6Ymd7wTOVZfEjFfpQQbwPqHMadPoOerVB0d?=
	=?us-ascii?Q?/bo1aDji4ump5B3UadP6BqXWxYLv5b95t9Z6FxBshxmNvG0+ON459kdlvFgY?=
	=?us-ascii?Q?w4tuiQa1qJHckGgv6oU2FdH4tGOsbamgytvso7B2yWgGIWlvrI4QgMqUEnee?=
	=?us-ascii?Q?XfVuuonvYJOn0ksYYoAyVjN6pJqK1n8l3CnCrRGVDBxWR7qU35X7Di2w20fj?=
	=?us-ascii?Q?ZsDGZ+XVVq+QiQs3VsZW4f45IbpLZEKWVuJCVawewx0zAFKjWU0SfCqjAwku?=
	=?us-ascii?Q?eiLnc8QhoxXhgZbw15Tllxnu9VPB6ExKpFAztsDPm7GLBt9hETZ4nUk73g9X?=
	=?us-ascii?Q?8nlWnlP+BmAql2JUFoYgYnhELKXcJtLjC7C3yHRD62t6Tp3oEfRRtdptDWxZ?=
	=?us-ascii?Q?laQhqOE8rVraPTeNPu/CaYAynASykHxjRCkzFQPA6zFKyTqcilrMwtccjdjV?=
	=?us-ascii?Q?B8lfZSqg+ELV3fedKwT70YqqYMWYkFALKwUi4wY7Ew29jVGR0EV5V9EzArEn?=
	=?us-ascii?Q?Bqm14Qt1DmP8Y2EDH7kZUPIZv5vyLwdPZAbQUNyteKK+s7i3OfJoWjPGZ1Oi?=
	=?us-ascii?Q?h0KKVAAE=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2036;
	5:QjNAbBMPNng01iB9Z/CSTzKL2PRqj3a9k/998k7dOIBH/I+OyrTKtQbCSd2J5I46Bbeu4bMWHjXNfU7RHm/DFqCIDCgK+dHaZk/ZCHo7GVSfUtPg6AWkWBM45CDCMMJq3F3nTGDeRua+K7bEB7MsNg==;
	24:iPqug6Db+mpBrRJy7U3jD2ucvO8rJnvtCxy3NsnOPNFffM4pvwXYWNwL/Pg8lQTKX4OdrngkULhzRHPbEixPtVV/hNg6+sd86r0ZDe+IhWY=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2016 20:05:45.9283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2036
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.141
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Gr=C3=A9gory=20ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-arm] [PATCH v3 4/5] bcm2835_property: implement framebuffer
	control/configuration properties
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
X-TUID: ZQJdkEFzVXcM

From: Gr=C3=A9gory ESTRADE <gregory.estrade@gmail.com>

The property channel driver now interfaces with the framebuffer device
to query and set framebuffer parameters. As a result of this, the "get
ARM RAM size" query now correctly returns the video RAM base address
(not total RAM size), and the ram-size property is no longer relevant
here.

Signed-off-by: Gr=C3=A9gory ESTRADE <gregory.estrade@gmail.com>
[AB: cleanup/refactoring for upstream submission]
Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---

Notes:
    v2:
     * avoid ldl/stl_phys
     * move code to increase default pi2 memory size from preceding patch h=
ere
       (it was incorrect without the property channel implementation change=
s)

 hw/arm/bcm2835_peripherals.c       |   8 +--
 hw/arm/raspi.c                     |   7 +-
 hw/misc/bcm2835_property.c         | 139 +++++++++++++++++++++++++++++++++=
+++-
 include/hw/misc/bcm2835_property.h |   5 +-
 4 files changed, 144 insertions(+), 15 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index c2fe6b7..4d74a18 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -79,6 +79,8 @@ static void bcm2835_peripherals_init(Object *obj)
                               "board-rev", &error_abort);
     qdev_set_parent_bus(DEVICE(&s->property), sysbus_get_default());
=20
+    object_property_add_const_link(OBJECT(&s->property), "fb",
+                                   OBJECT(&s->fb), &error_abort);
     object_property_add_const_link(OBJECT(&s->property), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr), &error_abort);
=20
@@ -211,12 +213,6 @@ static void bcm2835_peripherals_realize(DeviceState *d=
ev, Error **errp)
                        qdev_get_gpio_in(DEVICE(&s->mboxes), MBOX_CHAN_FB))=
;
=20
     /* Property channel */
-    object_property_set_int(OBJECT(&s->property), ram_size, "ram-size", &e=
rr);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-
     object_property_set_bool(OBJECT(&s->property), true, "realized", &err)=
;
     if (err) {
         error_propagate(errp, err);
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 5498209..83fe809 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -164,11 +164,6 @@ static void raspi2_machine_init(MachineClass *mc)
     mc->no_floppy =3D 1;
     mc->no_cdrom =3D 1;
     mc->max_cpus =3D BCM2836_NCPUS;
-
-    /* XXX: Temporary restriction in RAM size from the full 1GB. Since
-     * we do not yet support the framebuffer / GPU, we need to limit
-     * RAM usable by the OS to sit below the peripherals.
-     */
-    mc->default_ram_size =3D 0x3F000000; /* BCM2836_PERI_BASE */
+    mc->default_ram_size =3D 1024 * 1024 * 1024;
 };
 DEFINE_MACHINE("raspi2", raspi2_machine_init)
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 41fbbe3..15dcc02 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -17,6 +17,11 @@ static void bcm2835_property_mbox_push(BCM2835PropertySt=
ate *s, uint32_t value)
     uint32_t tot_len;
     size_t resplen;
     uint32_t tmp;
+    int n;
+    uint32_t offset, length, color;
+    uint32_t xres, yres, xoffset, yoffset, bpp, pixo, alpha;
+    uint32_t *newxres =3D NULL, *newyres =3D NULL, *newxoffset =3D NULL,
+        *newyoffset =3D NULL, *newbpp =3D NULL, *newpixo =3D NULL, *newalp=
ha =3D NULL;
=20
     value &=3D ~0xf;
=20
@@ -60,7 +65,14 @@ static void bcm2835_property_mbox_push(BCM2835PropertySt=
ate *s, uint32_t value)
             /* base */
             stl_le_phys(&s->dma_as, value + 12, 0);
             /* size */
-            stl_le_phys(&s->dma_as, value + 16, s->ram_size);
+            stl_le_phys(&s->dma_as, value + 16, s->fbdev->vcram_base);
+            resplen =3D 8;
+            break;
+        case 0x00010006: /* Get VC memory */
+            /* base */
+            stl_le_phys(&s->dma_as, value + 12, s->fbdev->vcram_base);
+            /* size */
+            stl_le_phys(&s->dma_as, value + 16, s->fbdev->vcram_size);
             resplen =3D 8;
             break;
         case 0x00028001: /* Set power state */
@@ -122,6 +134,114 @@ static void bcm2835_property_mbox_push(BCM2835Propert=
yState *s, uint32_t value)
             resplen =3D 8;
             break;
=20
+        /* Frame buffer */
+
+        case 0x00040001: /* Allocate buffer */
+            stl_le_phys(&s->dma_as, value + 12, s->fbdev->base);
+            stl_le_phys(&s->dma_as, value + 16, s->fbdev->size);
+            resplen =3D 8;
+            break;
+        case 0x00048001: /* Release buffer */
+            resplen =3D 0;
+            break;
+        case 0x00040002: /* Blank screen */
+            resplen =3D 4;
+            break;
+        case 0x00040003: /* Get display width/height */
+        case 0x00040004:
+            stl_le_phys(&s->dma_as, value + 12, s->fbdev->xres);
+            stl_le_phys(&s->dma_as, value + 16, s->fbdev->yres);
+            resplen =3D 8;
+            break;
+        case 0x00044003: /* Test display width/height */
+        case 0x00044004:
+            resplen =3D 8;
+            break;
+        case 0x00048003: /* Set display width/height */
+        case 0x00048004:
+            xres =3D ldl_le_phys(&s->dma_as, value + 12);
+            newxres =3D &xres;
+            yres =3D ldl_le_phys(&s->dma_as, value + 16);
+            newyres =3D &yres;
+            resplen =3D 8;
+            break;
+        case 0x00040005: /* Get depth */
+            stl_le_phys(&s->dma_as, value + 12, s->fbdev->bpp);
+            resplen =3D 4;
+            break;
+        case 0x00044005: /* Test depth */
+            resplen =3D 4;
+            break;
+        case 0x00048005: /* Set depth */
+            bpp =3D ldl_le_phys(&s->dma_as, value + 12);
+            newbpp =3D &bpp;
+            resplen =3D 4;
+            break;
+        case 0x00040006: /* Get pixel order */
+            stl_le_phys(&s->dma_as, value + 12, s->fbdev->pixo);
+            resplen =3D 4;
+            break;
+        case 0x00044006: /* Test pixel order */
+            resplen =3D 4;
+            break;
+        case 0x00048006: /* Set pixel order */
+            pixo =3D ldl_le_phys(&s->dma_as, value + 12);
+            newpixo =3D &pixo;
+            resplen =3D 4;
+            break;
+        case 0x00040007: /* Get alpha */
+            stl_le_phys(&s->dma_as, value + 12, s->fbdev->alpha);
+            resplen =3D 4;
+            break;
+        case 0x00044007: /* Test pixel alpha */
+            resplen =3D 4;
+            break;
+        case 0x00048007: /* Set alpha */
+            alpha =3D ldl_le_phys(&s->dma_as, value + 12);
+            newalpha =3D &alpha;
+            resplen =3D 4;
+            break;
+        case 0x00040008: /* Get pitch */
+            stl_le_phys(&s->dma_as, value + 12, s->fbdev->pitch);
+            resplen =3D 4;
+            break;
+        case 0x00040009: /* Get virtual offset */
+            stl_le_phys(&s->dma_as, value + 12, s->fbdev->xoffset);
+            stl_le_phys(&s->dma_as, value + 16, s->fbdev->yoffset);
+            resplen =3D 8;
+            break;
+        case 0x00044009: /* Test virtual offset */
+            resplen =3D 8;
+            break;
+        case 0x00048009: /* Set virtual offset */
+            xoffset =3D ldl_le_phys(&s->dma_as, value + 12);
+            newxoffset =3D &xoffset;
+            yoffset =3D ldl_le_phys(&s->dma_as, value + 16);
+            newyoffset =3D &yoffset;
+            resplen =3D 8;
+            break;
+        case 0x0004000a: /* Get/Test/Set overscan */
+        case 0x0004400a:
+        case 0x0004800a:
+            stl_le_phys(&s->dma_as, value + 12, 0);
+            stl_le_phys(&s->dma_as, value + 16, 0);
+            stl_le_phys(&s->dma_as, value + 20, 0);
+            stl_le_phys(&s->dma_as, value + 24, 0);
+            resplen =3D 16;
+            break;
+        case 0x0004800b: /* Set palette */
+            offset =3D ldl_le_phys(&s->dma_as, value + 12);
+            length =3D ldl_le_phys(&s->dma_as, value + 16);
+            n =3D 0;
+            while (n < length - offset) {
+                color =3D ldl_le_phys(&s->dma_as, value + 20 + (n << 2));
+                stl_le_phys(&s->dma_as,
+                            s->fbdev->vcram_base + ((offset + n) << 2), co=
lor);
+                n++;
+            }
+            stl_le_phys(&s->dma_as, value + 12, 0);
+            resplen =3D 4;
+            break;
=20
         case 0x00060001: /* Get DMA channels */
             /* channels 2-5 */
@@ -147,6 +267,13 @@ static void bcm2835_property_mbox_push(BCM2835Property=
State *s, uint32_t value)
         value +=3D bufsize + 12;
     }
=20
+    /* Reconfigure framebuffer if required */
+    if (newxres || newyres || newxoffset || newyoffset || newbpp || newpix=
o
+        || newalpha) {
+        bcm2835_fb_reconfigure(s->fbdev, newxres, newyres, newxoffset,
+                               newyoffset, newbpp, newpixo, newalpha);
+    }
+
     /* Buffer response code */
     stl_le_phys(&s->dma_as, s->addr + 4, (1 << 31));
 }
@@ -241,6 +368,15 @@ static void bcm2835_property_realize(DeviceState *dev,=
 Error **errp)
     Object *obj;
     Error *err =3D NULL;
=20
+    obj =3D object_property_get_link(OBJECT(dev), "fb", &err);
+    if (obj =3D=3D NULL) {
+        error_setg(errp, "%s: required fb link not found: %s",
+                   __func__, error_get_pretty(err));
+        return;
+    }
+
+    s->fbdev =3D BCM2835_FB(obj);
+
     obj =3D object_property_get_link(OBJECT(dev), "dma-mr", &err);
     if (obj =3D=3D NULL) {
         error_setg(errp, "%s: required dma-mr link not found: %s",
@@ -259,7 +395,6 @@ static void bcm2835_property_realize(DeviceState *dev, =
Error **errp)
=20
 static Property bcm2835_property_props[] =3D {
     DEFINE_PROP_UINT32("board-rev", BCM2835PropertyState, board_rev, 0),
-    DEFINE_PROP_UINT32("ram-size", BCM2835PropertyState, ram_size, 0),
     DEFINE_PROP_END_OF_LIST()
 };
=20
diff --git a/include/hw/misc/bcm2835_property.h b/include/hw/misc/bcm2835_p=
roperty.h
index df889ea..edcab60 100644
--- a/include/hw/misc/bcm2835_property.h
+++ b/include/hw/misc/bcm2835_property.h
@@ -9,6 +9,7 @@
 #include "hw/sysbus.h"
 #include "exec/address-spaces.h"
 #include "net/net.h"
+#include "hw/display/bcm2835_fb.h"
=20
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
--=20
2.7.0

