Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2368402lfg;
        Sun, 2 May 2021 22:33:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNShmBqiUQTMwcvMS3x3U/ZldzA1xBHAp+xHgR35KPQoArr+Yyd6rVvU17y3OomiH8a7Ny
X-Received: by 2002:a25:53c8:: with SMTP id h191mr23945075ybb.508.1620020036016;
        Sun, 02 May 2021 22:33:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620020036; cv=none;
        d=google.com; s=arc-20160816;
        b=JDgbeWY88Px6gNi7rGETqJxLHr70ybl2X+W+D28eTPNvd/MdrxdxSNERC/mGqOEycK
         ys3ny/GaqrQL175nwcnVv34O8TseKqajrIq3DlZQQUEewqjeEiduuyUCmE5MgMqOH5ZZ
         0ZOlJ0epBAnRYvlhSWruu6HXTf7BH+0b6oN4BrXb1kA+7A1ASe1w8TkgtOE0JyLt2dSJ
         Loyv3TP1VhnEVKQjDQfDD5ENNLOt7t7wPpsjf+3YzuXbF2mdDnqxOpdTLzRoY1thZPrA
         X6oj0/8EiS0UxG5htiV5V/nzhafj7DFfPdPLGhdEdN3f8+p17QH86Vk3wt5fWwnEHV42
         mSCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=U3DSiURkzuhKCKQKJufJhU9ln+QaV4zHWDSepwNXwDc=;
        b=A//OAR1VbQj1Wx61LRV2F4XCJjZM9CuwHqG7IRWDpPXCBAEZho30hdx6s8YiYhyfP4
         +GXbGKqdkz2ydPIsh2c8Yo/gZHXAl9RUzDZOW39E4OOndXoqMJPRSz/2rAdJew3Y7+Ry
         OvLgkvjDujqjAhzR4VQlXCJ4FlmXFAbwLsspjIa0plw8DE6r+FOD3V/t2xYpc2Kj2pYV
         6r+ue4vM0rScF1yedm94pYC21v3VKC6Q2oqE/CY9q9HC2F2jktNxNNOhwyU7KjoW6gTR
         mPmPVHpRL2g91H2cm0eJiK4YXSCGaoQM3YDV/K0rUm7lkFSRZ4lhFxIQiYdlcttVw93H
         lHow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m26si12475101ybj.355.2021.05.02.22.33.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 May 2021 22:33:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ldRDP-0005eH-B9
	for alex.bennee@linaro.org; Mon, 03 May 2021 01:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldR6L-0004qi-LE; Mon, 03 May 2021 01:26:38 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:3954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ldR6J-00065D-3V; Mon, 03 May 2021 01:26:37 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14352iDi156805; Mon, 3 May 2021 01:26:17 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38a9h29m6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 01:26:17 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1435JC1U025560;
 Mon, 3 May 2021 05:26:14 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 388xm8ggwa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 05:26:14 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1435QCp730671164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 May 2021 05:26:12 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72405A405B;
 Mon,  3 May 2021 05:26:12 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25B83A4054;
 Mon,  3 May 2021 05:26:12 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  3 May 2021 05:26:12 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 5910522007C;
 Mon,  3 May 2021 07:26:11 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/18] aspeed: Integrate HACE
Date: Mon,  3 May 2021 07:25:49 +0200
Message-Id: <20210503052600.290483-8-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503052600.290483-1-clg@kaod.org>
References: <20210503052600.290483-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HrTeKWKraWdxRBZQq71RJ9NLRpWyY4L3
X-Proofpoint-ORIG-GUID: HrTeKWKraWdxRBZQq71RJ9NLRpWyY4L3
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-03_02:2021-04-30,
 2021-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1034
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105030033
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p3dgyS2IFPqR

From: Joel Stanley <joel@jms.id.au>

Add the hash and crypto engine model to the Aspeed socs.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20210409000253.1475587-3-joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 docs/system/arm/aspeed.rst  |  1 -
 include/hw/arm/aspeed_soc.h |  3 +++
 hw/arm/aspeed_ast2600.c     | 15 +++++++++++++++
 hw/arm/aspeed_soc.c         | 16 ++++++++++++++++
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 23a1468cd175..a1911f940316 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -60,7 +60,6 @@ Missing devices
  * PWM and Fan Controller
  * Slave GPIO Controller
  * Super I/O Controller
- * Hash/Crypto Engine
  * PCI-Express 1 Controller
  * Graphic Display Controller
  * PECI Controller
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 9359d6da336d..d9161d26d645 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -21,6 +21,7 @@
 #include "hw/rtc/aspeed_rtc.h"
 #include "hw/i2c/aspeed_i2c.h"
 #include "hw/ssi/aspeed_smc.h"
+#include "hw/misc/aspeed_hace.h"
 #include "hw/watchdog/wdt_aspeed.h"
 #include "hw/net/ftgmac100.h"
 #include "target/arm/cpu.h"
@@ -50,6 +51,7 @@ struct AspeedSoCState {
     AspeedTimerCtrlState timerctrl;
     AspeedI2CState i2c;
     AspeedSCUState scu;
+    AspeedHACEState hace;
     AspeedXDMAState xdma;
     AspeedSMCState fmc;
     AspeedSMCState spi[ASPEED_SPIS_NUM];
@@ -133,6 +135,7 @@ enum {
     ASPEED_DEV_XDMA,
     ASPEED_DEV_EMMC,
     ASPEED_DEV_KCS,
+    ASPEED_DEV_HACE,
 };
=20
 #endif /* ASPEED_SOC_H */
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 2a1255b6a042..e0fbb020c770 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -42,6 +42,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
     [ASPEED_DEV_ETH2]      =3D 0x1E680000,
     [ASPEED_DEV_ETH4]      =3D 0x1E690000,
     [ASPEED_DEV_VIC]       =3D 0x1E6C0000,
+    [ASPEED_DEV_HACE]      =3D 0x1E6D0000,
     [ASPEED_DEV_SDMC]      =3D 0x1E6E0000,
     [ASPEED_DEV_SCU]       =3D 0x1E6E2000,
     [ASPEED_DEV_XDMA]      =3D 0x1E6E7000,
@@ -102,6 +103,7 @@ static const int aspeed_soc_ast2600_irqmap[] =3D {
     [ASPEED_DEV_I2C]       =3D 110,   /* 110 -> 125 */
     [ASPEED_DEV_ETH1]      =3D 2,
     [ASPEED_DEV_ETH2]      =3D 3,
+    [ASPEED_DEV_HACE]      =3D 4,
     [ASPEED_DEV_ETH3]      =3D 32,
     [ASPEED_DEV_ETH4]      =3D 33,
     [ASPEED_DEV_KCS]       =3D 138,   /* 138 -> 142 */
@@ -213,6 +215,9 @@ static void aspeed_soc_ast2600_init(Object *obj)
                             TYPE_SYSBUS_SDHCI);
=20
     object_initialize_child(obj, "lpc", &s->lpc, TYPE_ASPEED_LPC);
+
+    snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
+    object_initialize_child(obj, "hace", &s->hace, typename);
 }
=20
 /*
@@ -494,6 +499,16 @@ static void aspeed_soc_ast2600_realize(DeviceState *=
dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_4,
                        qdev_get_gpio_in(DEVICE(&s->a7mpcore),
                                 sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_=
kcs_4));
+
+    /* HACE */
+    object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(s->dram_mr=
),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_H=
ACE]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
 }
=20
 static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 817f3ba63dfd..8ed29113f79f 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -34,6 +34,7 @@ static const hwaddr aspeed_soc_ast2400_memmap[] =3D {
     [ASPEED_DEV_VIC]    =3D 0x1E6C0000,
     [ASPEED_DEV_SDMC]   =3D 0x1E6E0000,
     [ASPEED_DEV_SCU]    =3D 0x1E6E2000,
+    [ASPEED_DEV_HACE]   =3D 0x1E6E3000,
     [ASPEED_DEV_XDMA]   =3D 0x1E6E7000,
     [ASPEED_DEV_VIDEO]  =3D 0x1E700000,
     [ASPEED_DEV_ADC]    =3D 0x1E6E9000,
@@ -65,6 +66,7 @@ static const hwaddr aspeed_soc_ast2500_memmap[] =3D {
     [ASPEED_DEV_VIC]    =3D 0x1E6C0000,
     [ASPEED_DEV_SDMC]   =3D 0x1E6E0000,
     [ASPEED_DEV_SCU]    =3D 0x1E6E2000,
+    [ASPEED_DEV_HACE]   =3D 0x1E6E3000,
     [ASPEED_DEV_XDMA]   =3D 0x1E6E7000,
     [ASPEED_DEV_ADC]    =3D 0x1E6E9000,
     [ASPEED_DEV_VIDEO]  =3D 0x1E700000,
@@ -117,6 +119,7 @@ static const int aspeed_soc_ast2400_irqmap[] =3D {
     [ASPEED_DEV_ETH2]   =3D 3,
     [ASPEED_DEV_XDMA]   =3D 6,
     [ASPEED_DEV_SDHCI]  =3D 26,
+    [ASPEED_DEV_HACE]   =3D 4,
 };
=20
 #define aspeed_soc_ast2500_irqmap aspeed_soc_ast2400_irqmap
@@ -212,6 +215,9 @@ static void aspeed_soc_init(Object *obj)
     }
=20
     object_initialize_child(obj, "lpc", &s->lpc, TYPE_ASPEED_LPC);
+
+    snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
+    object_initialize_child(obj, "hace", &s->hace, typename);
 }
=20
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
@@ -421,6 +427,16 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
=20
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_kcs_4,
                        qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_kcs_=
4));
+
+    /* HACE */
+    object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(s->dram_mr=
),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_H=
ACE]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
 }
 static Property aspeed_soc_properties[] =3D {
     DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION=
,
--=20
2.26.3

