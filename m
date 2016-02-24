Received: by 10.25.208.211 with SMTP id h202csp2485244lfg;
        Wed, 24 Feb 2016 13:59:18 -0800 (PST)
X-Received: by 10.55.212.1 with SMTP id l1mr25694221qki.93.1456351158883;
        Wed, 24 Feb 2016 13:59:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j201si4734234qhc.131.2016.02.24.13.59.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Feb 2016 13:59:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:38684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYhSo-0006mc-G4
	for alex.bennee@linaro.org; Wed, 24 Feb 2016 16:59:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aYhSg-0006a3-Sf
	for qemu-arm@nongnu.org; Wed, 24 Feb 2016 16:59:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aYhSf-0001kx-Rc
	for qemu-arm@nongnu.org; Wed, 24 Feb 2016 16:59:10 -0500
Received: from mail-bl2on0109.outbound.protection.outlook.com
	([65.55.169.109]:25976
	helo=na01-bl2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aYhSZ-0001jP-Hi; Wed, 24 Feb 2016 16:59:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=wfL1IBH5WXqEWvANDTXoCCkzgT78wE9vCgSnZtT8zC4=;
	b=oniXXEIq2XM3JftdbdFbkJbdyaEJDBdbnqkW7oPofALML7wJ8pBbvWM8DbM9Sev6kT2Hbk52HKeGNJgEmG9ApsfDcyFgqtk22sN2QgVM+agEDTknXFsDaRWPRd5i3ipLclvAGJoOp9H/RKoOzj4wL7f2XLJOK3mDEH6RuJcU1tI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org;
	dmarc=none action=none header.from=microsoft.com; 
Received: from baumann-desk.redmond.corp.microsoft.com (2001:4898:80e8:a::724)
	by BY2PR0301MB2040.namprd03.prod.outlook.com (10.163.196.154) with
	Microsoft
	SMTP Server (TLS) id 15.1.409.15; Wed, 24 Feb 2016 21:59:01 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 24 Feb 2016 13:58:48 -0800
Message-ID: <1456351128-5560-1-git-send-email-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.5.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:a::724]
X-ClientProxiedBy: BY1PR10CA0004.namprd10.prod.outlook.com (25.160.197.14) To
	BY2PR0301MB2040.namprd03.prod.outlook.com (25.163.196.154)
X-MS-Office365-Filtering-Correlation-Id: 69b2c9e9-a007-45be-3ab4-08d33d65b41a
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB2040;
	2:hB2ovpfw4sj7gPg3FORBQ8csnfxzmQjdpomf6yjGPcPfxqgh9+ntUzQlWIMX7puKHed6MSmV/RIaEFd6DWHVL2vpWUMsfryfJjq4iL0trVPexXGlDOk2IPkkzWXL47MHxtHcAFQwYLYmqKEd8H8B9pdhZyZirPW7eMq+6DG5ikduJorLrk86zgHNHJwKaQRF;
	3:s9edVE/9bnNxbx+bykeVrTAmAb1s+v10wbMrRiHNzvCnuLcsNhxq1PkEE2aTOziMEO2KDQhWV/114rd+uoL8X/ML9KJFpnitdC8GK7CBCnAODp9VHTKQx/BukBlyT3xm;
	25:uYedY0Cr7Rwnh5l45XEsOJWW2G21Zt+mCcEXKF9efvD2LUZRhxD4e5iWga0Duid8Td5fdqH6S37kvndvZx8PHvkqDAMJjdwjfzkKUyIfwHYeM+JmE1Herg3k0ktTaD374Y6zQVt7GCXO3AgaLhsiGyTx2xPjh0IaqGxJgwKYmIVuWE7/xaHXOAqXX+Spmcw3s7yvS3jg+Y4cOT3sdZru7WfCGq47XRDwSsDCXIkhiAEvXv1aO07S5wd9iO/+F8OshoCuwzJS3vqqS0gUdLUBtmmo9My/RItsGU9dy1295EoiDEMoOUXygj7KOX1ITuoAt04tXqCfKGBHGEOkOKC1Og==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR0301MB2040;
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB2040;
	20:HGbfsXlQ30QNfMSNJ3eHwsmDfUrFwWKTHbMItbdLOIRFyX+6OKO/cwn/xwcvU/QItdcMgrzJF1rKu1OT1Eu12P9+AmtjHD2cP3MXfjaVKYrwafYR2KG/97sQTMsC8pJlB9mIj+EN5woM1iXB0ezG6/OWKjQSAP3X2k7VSOylzZsmh4HuXPXw5grk4phT5E9oRbQwh217O08jXf5uGqS1TCa7q/PU3/m6VTDvtS0X2ol+Tqw3ejAfCRHBe+Jktl41d18e23DvjUAgzZxZdMGcV/kHVRl9KxLZjdAADPYayQ7BzT6va5XcPNYfeJm5gqTqRL1iS9cPJlZekSOl4lgFih+9puxrhsJ2X99dMFU1/uTx7A52Im3tPDk20GajsAzefQGVutB+ouzx9se7drZWlb+pZ9PgochJCj0ZJulNpyFxG+Hg0Rh+dL8PEutNdbx0iMiV2m7WgAN7j9Ile/VEQftV7e/EVx65tCvnPKzZVT+N8lFe9Z42vUezQQnPI2uO;
	4:gD8U3YPpy53sssCIWA7vRGApz/ry2QfF+6tUwScAG08Df7MSbGQhNeesmCl4EUBHq0CnDGnLWJTXUN6BM9Benf43GODmiQW/MhblMIlHUc841dRk0QyJqME/UDxs9PYvxFpEpdy29GxCjgGMow227UrnmdYB8aUdeXjUHademgU5uiOyoaBB13Wo1+cVT/elA5lq/aj11QOiCdeCTjCv4qbF4f0bthNWCyBvNIVCQrWwvU/oKsRD03QU1ElxAZ9dmusgjE00t+RNpD5ItxkzZZ8/N3ox1oOeb6sFKx9r2nGhacTfrhOfqoPZRGYOQg7bs2OQJos+akZoBy+6KLWUjOQQoXPrfoUQYVL3zgySFoWtD6faokuVc753J6RowHGi
X-Microsoft-Antispam-PRVS: <BY2PR0301MB2040CFD5A93B1BAA2C00BC159EA50@BY2PR0301MB2040.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:BY2PR0301MB2040; BCL:0; PCL:0; RULEID:;
	SRVR:BY2PR0301MB2040; 
X-Forefront-PRVS: 08626BE3A5
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(42186005)(87976001)(50986999)(1096002)(5001960100002)(107886002)(189998001)(110136002)(4001430100002)(36756003)(86362001)(47776003)(4326007)(5008740100001)(2906002)(586003)(5004730100002)(6116002)(48376002)(15975445007)(40100003)(50466002)(50226001)(2351001)(229853001)(92566002)(10090500001)(86612001)(122386002)(5003940100001)(5005710100001)(10290500002)(19580405001)(19580395003)(77096005)(7059030);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR0301MB2040;
	H:baumann-desk.redmond.corp.microsoft.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR0301MB2040;
	23:LLwymjq2+EGwT57qq8gO/OjO/8kw+lzvmGWBNKR?=
	=?us-ascii?Q?rxxuVXD6tRWGy+mh6fVW+Bd5rRzJZa8kKjR86SLar3GMyR3QBw5IYaMjkU2u?=
	=?us-ascii?Q?0fl1jlP5fSFhsVT3S1+lGfKYGcQpk3Sr9KxvG6HQxLxsphEO9RIe9FCOeDcl?=
	=?us-ascii?Q?xpCIg30Q7N0zLlpdHGBCJx6Rxczp5h4E6UQzBiLcu7p9vNu1SgifpN+wdz6K?=
	=?us-ascii?Q?izC0jBQvfgfKyPr95xkD7vADJl30/XhnRMVmcZZmN7eqyg+HdOAOfjrWAMY3?=
	=?us-ascii?Q?PEsmh/BoKNwJHgHMcgarpEfAcuRKG/97ia8Wy/0VpFq6HAl4OCU1sEyGKQJC?=
	=?us-ascii?Q?b4wqgfxLZF2OJ90z6I0ouXOWtxe7V8dKUKpZyTAjeFQ685PI/AhcPgEe+WPd?=
	=?us-ascii?Q?P0ziPJGCzEOh3zy6YiSsXnv+zr7U9CaY1meVzW/fuMs32Wseunj+LFMa7+Mc?=
	=?us-ascii?Q?qTRw3/MDKh2nPXHBYyBRitw2eoNAlBvLYJP7hMAZcTlPZAvOM0Be07w2dOZC?=
	=?us-ascii?Q?vm0Op0dsGoZpzqarU6uIAU63dyPMK8IvVKQMQ4pYuaNXlLPFaHfxvTJmTGEt?=
	=?us-ascii?Q?2a4XNTAuYsKwDDs8+ZA4tYWR+6+rOO/jVee7wD3i8L4i5b3L8sMqgCWDw9NL?=
	=?us-ascii?Q?D/ZSExJxzs7RnGpeZ2en9pPKuxzgZmXepk1rOcD/k9P5x5SbVQioVIMdRYvG?=
	=?us-ascii?Q?r8IEMp0lgXDSUPs4LvpwBN1B18abRnVISoBwWAO1+YPO+ixvDn6AwjE5yes3?=
	=?us-ascii?Q?lV0RJVQY+AyISTWndY/w4vnO3RbEq86+py/whILnBqXjwWc6xYAlcN6sdfSs?=
	=?us-ascii?Q?74ydI8kcgHS0m8P3qXBlCBCXpf3XfiyyfQCREJhk66tFvHqB16j+su2SYwEm?=
	=?us-ascii?Q?B/51NCfRxNYjkIJDo50/xZuWy7uTonQMvTmJEkG7l4rFZmZhz86MwyeSzAU2?=
	=?us-ascii?Q?1PDc5zp6swcGR2jcHEmNYP4O5XswItVihtgrY3m/dl7G9jTHhm8HiwbCrxjr?=
	=?us-ascii?Q?+FJ7977fKbHRU+tB+K/7aqDRg8/FhzmBlJpJFINLpR7Y4fsHpyd/jiK0O8BL?=
	=?us-ascii?Q?pXOZlKh8=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB2040;
	5:HYf7xeJl+WxSpHXB3O/4tiWprzGMA/Go4N/O27eo7BnDRXPR4LVZ31TyTPv1cRQcJ/NE2rfC8fBI0ZMs5lRxgltyQO4QFpStmW1oiBrfiJRXJWv7ycrlQ6ntuN5NugFxUhTGqyUMjNuNVtNjvtySaQ==;
	24:To/IxE2Hsy+4VWW/ValkqUySsu8Fgo5VcczUPrzFZdYaIcENsbI4iufZFrzU1J7AoZyI72dkkPunkOcRuzi1xAz6G7D5c8U6ejM6djibl/U=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2016 21:59:01.0262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0301MB2040
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 65.55.169.109
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Subject: [Qemu-arm] [PATCH] raspi: fix SD card with recent sdhci changes
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
X-TUID: 2CyOARY+4B3p

Recent changes to sdhci broke SD on raspi. This change mirrors
the logic to create the SD card device at the board level.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---
The relevant change to other boards was:
https://github.com/qemu/qemu/commit/eb4f566bbbe195b2475e8fa5d9ed29ca56a18b02

 hw/arm/bcm2835_peripherals.c |  7 +++++++
 hw/arm/bcm2836.c             |  7 +++++++
 hw/arm/raspi.c               | 16 ++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 72467fd..6d66fa0 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -182,6 +182,13 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
                                INTERRUPT_ARASANSDIO));
+    object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->sdhci), "sd-bus",
+                              &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
 }
 
 static void bcm2835_peripherals_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 15c7622..0321439 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -73,6 +73,13 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->peripherals),
+                              "sd-bus", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
     sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->peripherals), 0,
                             BCM2836_PERI_BASE, 1);
 
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 48d014c..6582279 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -113,6 +113,10 @@ static void setup_boot(MachineState *machine, int version, size_t ram_size)
 static void raspi2_init(MachineState *machine)
 {
     RasPiState *s = g_new0(RasPiState, 1);
+    DriveInfo *di;
+    BlockBackend *blk;
+    BusState *bus;
+    DeviceState *carddev;
 
     object_initialize(&s->soc, sizeof(s->soc), TYPE_BCM2836);
     object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
@@ -133,6 +137,18 @@ static void raspi2_init(MachineState *machine)
                             &error_abort);
     object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_abort);
 
+    /* Create and plug in the SD cards */
+    di = drive_get_next(IF_SD);
+    blk = di ? blk_by_legacy_dinfo(di) : NULL;
+    bus = qdev_get_child_bus(DEVICE(&s->soc), "sd-bus");
+    if (bus == NULL) {
+        error_report("No SD bus found in SOC object");
+        exit(1);
+    }
+    carddev = qdev_create(bus, TYPE_SD_CARD);
+    qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
+    object_property_set_bool(OBJECT(carddev), true, "realized", &error_fatal);
+
     setup_boot(machine, 2, machine->ram_size);
 }
 
-- 
2.5.3

