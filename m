Received: by 10.25.150.194 with SMTP id y185csp2497720lfd;
        Tue, 29 Nov 2016 10:40:24 -0800 (PST)
X-Received: by 10.55.99.200 with SMTP id x191mr29266271qkb.62.1480444823908;
        Tue, 29 Nov 2016 10:40:23 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a67si35605174qkc.95.2016.11.29.10.40.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 10:40:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38737 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBnKI-0005Fk-Lo
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 13:40:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBnIp-0004kQ-6W
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 13:38:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBnIl-0008Ri-U5
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 13:38:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:44417
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBnIl-0008RY-Nt
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 13:38:47 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uATIclmE067453
	for <qemu-devel@nongnu.org>; Tue, 29 Nov 2016 13:38:47 -0500
Received: from e06smtp10.uk.ibm.com (e06smtp10.uk.ibm.com [195.75.94.106])
	by mx0a-001b2d01.pphosted.com with ESMTP id 271ah52ptf-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Tue, 29 Nov 2016 13:38:45 -0500
Received: from localhost
	by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <clg@kaod.org>;
	Tue, 29 Nov 2016 18:38:37 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 29 Nov 2016 18:38:34 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com
	(d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 7C42F1B08A97; 
	Tue, 29 Nov 2016 16:34:45 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id uATGWNMX15335804; Tue, 29 Nov 2016 16:32:23 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3ADEDA4091;
	Tue, 29 Nov 2016 15:30:36 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F9E6A4078;
	Tue, 29 Nov 2016 15:30:36 +0000 (GMT)
Received: from smtp.lab.toulouse-stg.fr.ibm.com (unknown [9.101.4.1])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 29 Nov 2016 15:30:19 +0000 (GMT)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(hermes.lab.toulouse-stg.fr.ibm.com [9.101.4.42])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 1564D22067C;
	Tue, 29 Nov 2016 17:07:39 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Tue, 29 Nov 2016 17:07:36 +0100
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480435656-28497-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
	<1480435656-28497-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16112918-0040-0000-0000-0000026BDD61
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16112918-0041-0000-0000-000022C22509
Message-Id: <1480435656-28497-2-git-send-email-clg@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-11-29_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1611290309
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0a-001b2d01.pphosted.com id uATIclmE067453
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: [Qemu-devel] [PATCH for-2.9 30/30] wdt: aspeed: use scu to get
 clock freq
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vpzbux33ffpt

Add a link to the object model and a helper routine to retrieve the
value instead of using a constant value.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/aspeed_soc.c              |  2 ++
 hw/watchdog/wdt_aspeed.c         | 19 +++++++++++++++----
 include/hw/watchdog/wdt_aspeed.h |  2 ++
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 6df76382f007..712ae9d6c54d 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -175,6 +175,8 @@ static void aspeed_soc_init(Object *obj)
     object_initialize(&s->wdt, sizeof(s->wdt), TYPE_ASPEED_WDT);
     object_property_add_child(obj, "wdt", OBJECT(&s->wdt), NULL);
     qdev_set_parent_bus(DEVICE(&s->wdt), sysbus_get_default());
+    object_property_add_const_link(OBJECT(&s->wdt), "scu", OBJECT(&s->sc=
u),
+                                   NULL);
 }
=20
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index cdba3983b7af..01266fb1b76b 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -7,10 +7,12 @@
=20
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qapi/error.h"
 #include "sysemu/watchdog.h"
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
 #include "hw/watchdog/wdt_aspeed.h"
+#include "hw/misc/aspeed_scu.h"
=20
 #define WDT_IO_REGION_SIZE      0x20
=20
@@ -56,8 +58,6 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr of=
fset, unsigned size)
=20
 }
=20
-#define PCLK_HZ 24000000
-
 static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
                              unsigned size)
 {
@@ -82,7 +82,7 @@ static void aspeed_wdt_write(void *opaque, hwaddr offse=
t, uint64_t data,
=20
             if (pclk) {
                 reload =3D muldiv64(s->reg_reload_value, NANOSECONDS_PER=
_SECOND,
-                                  PCLK_HZ) ;
+                                  s->pclk_freq);
             } else {
                 reload =3D s->reg_reload_value * 1000;
             }
@@ -99,7 +99,7 @@ static void aspeed_wdt_write(void *opaque, hwaddr offse=
t, uint64_t data,
=20
             if (pclk) {
                 reload =3D muldiv64(s->reg_reload_value, NANOSECONDS_PER=
_SECOND,
-                                  PCLK_HZ);
+                                  s->pclk_freq);
             } else {
                 reload =3D s->reg_reload_value * 1000;
             }
@@ -177,10 +177,21 @@ static void aspeed_wdt_realize(DeviceState *dev, Er=
ror **errp)
 {
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
     AspeedWDTState *s =3D ASPEED_WDT(dev);
+    Object *obj;
+    Error *err =3D NULL;
=20
     s->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, aspeed_wdt_timer_expir=
ed,
                             dev);
=20
+    obj =3D object_property_get_link(OBJECT(dev), "scu", &err);
+    if (!obj) {
+        error_setg(errp, "%s: required link 'scu' not found: %s",
+                   __func__, error_get_pretty(err));
+        return;
+    }
+
+    s->pclk_freq =3D aspeed_scu_get_clk(ASPEED_SCU(obj));
+
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
                           TYPE_ASPEED_WDT, WDT_IO_REGION_SIZE);
     sysbus_init_mmio(sbd, &s->iomem);
diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_a=
speed.h
index dbf45ae968db..0483335ecee5 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -36,6 +36,8 @@ typedef struct AspeedWDTState {
     uint32_t reg_reload_value;
     uint32_t reg_restart;
     uint32_t reg_ctrl;
+
+    uint32_t pclk_freq;
 } AspeedWDTState;
=20
 #endif  /* ASPEED_WDT_H */
--=20
2.7.4

