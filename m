Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1997281lfb;
        Fri, 27 Aug 2021 15:41:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJktAFGviaEALCY0vyBXZ07g4hstuWinJLIgRDpgm7bbPnwrXpsPAsHgYHlkgsupznrY2P
X-Received: by 2002:a05:620a:41:: with SMTP id t1mr11359299qkt.77.1630104090951;
        Fri, 27 Aug 2021 15:41:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630104090; cv=none;
        d=google.com; s=arc-20160816;
        b=vOuIZfTqnDAUOjrkelsEkIrRSkvXgHz1IMXZZnK3VZgtoutkHIFD4gogXTkEg+ZYYw
         rUYYboya86iWytLu7T886P7jXqTZme5uwsBTkmhQxXXFy740uZ6f+vq61VlhyZWdzISb
         zc4+t1K1ADLOi5t6Nf/9lgXs02m7G6LGk94t+ChSXCswCYjn+Xrc0XywgynXgWLyzz5S
         ETnX941DJMClXIqSVSzQMR1Ga4EQrGTfRUPLjJwPuhgWXO9pyJ4R3kr2GBvyQxB4bzuY
         g5x2jbT3K2XieA2mRK6bxNv4zeAIa1+ErNIs81wBxph2/5IDa9qKlGcCg5/OWu9U/1a8
         hgPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tDJjVYNbtK148iDxIm9iEAIwpTcMHlAyGoWGjlNolUo=;
        b=JZN4HmUpbu0KLNA5BipSHnBLnBL+gjGG87Q6oTYx5somXxDdDLU5Gxvj54IiMFohXb
         dM0AwzdzDw3Qjzdm/I2ILiZ4RKrX3nyjQOKIJnSCTN5CNtEF2rCY8GPs/L6rB1/mfqyv
         w+rzRaqGvQlX3T9SeKC3lFvtbgh3pwM8bVK1TEMIuW3J0c88+uggAJ69EKwOX5hmKtYx
         iIjP4HdilzZW80DJKqLio6s06dcY0qQvYbeudbkSoAl6wEaJRT16mMUJvzTWy7z6MhWO
         z6pQjBwm8UdV/OMD3PLy8TdA19PiqSqvnlIwA9DKZmEL1OJjJi6vEnl1c8kesKUrx3MT
         xU/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b="XAt5yn/w";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk3si5271786qvb.20.2021.08.27.15.41.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Aug 2021 15:41:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b="XAt5yn/w";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:49642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJkXS-00048T-9L
	for alex.bennee@linaro.org; Fri, 27 Aug 2021 18:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=78736a82b9=pdel@fb.com>)
 id 1mJj3U-0006Yn-J7
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 17:06:28 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:46060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=78736a82b9=pdel@fb.com>)
 id 1mJj3P-0003EL-HX
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 17:06:26 -0400
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17RL6KMF032729
 for <qemu-arm@nongnu.org>; Fri, 27 Aug 2021 14:06:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=tDJjVYNbtK148iDxIm9iEAIwpTcMHlAyGoWGjlNolUo=;
 b=XAt5yn/w2gafCuJL5UrVo3kLEw3Fk3nnTR1oWqm/LZ33+td5KqURp1/l0t6jYnkbjNJW
 k/QWuLvZRAauew+BYCvTudzvOB4a358XNyfne++A8DADyEADQ/jqH0ebm93dEzUSrPnr
 2MsSNERXuC+GD0NGWWj/gcNY5Cr5IZ3EfCk= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3apfpfrk0a-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 27 Aug 2021 14:06:22 -0700
Received: from intmgw002.46.prn1.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:21d::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 27 Aug 2021 14:06:16 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id 941E7E74C19; Fri, 27 Aug 2021 14:06:13 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <joel@jms.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, Peter Delevoryas <pdel@fb.com>
Subject: [PATCH 2/5] hw/arm/aspeed: Select console UART from machine
Date: Fri, 27 Aug 2021 14:04:14 -0700
Message-ID: <20210827210417.4022054-3-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210827210417.4022054-1-pdel@fb.com>
References: <20210827210417.4022054-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-ORIG-GUID: N-Q5NSEESgwnV0Po_Zx1EFOQSGH2cKDJ
X-Proofpoint-GUID: N-Q5NSEESgwnV0Po_Zx1EFOQSGH2cKDJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-27_06:2021-08-27,
 2021-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 mlxlogscore=982
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108270125
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=78736a82b9=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.743, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 27 Aug 2021 18:37:28 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kSZD+E31YrD9

From: Peter Delevoryas <pdel@fb.com>

This change replaces the UART serial device initialization code with mach=
ine
configuration data, making it so that we have a single code path for cons=
ole
UART initialization, but allowing different machines to use different
UART's. This is relevant because the Aspeed chips have 2 debug UART's, UA=
RT5
and UART1, and while most machines just use UART5, some use UART1.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed.c         | 7 +++++++
 hw/arm/aspeed_ast2600.c | 5 -----
 hw/arm/aspeed_soc.c     | 5 -----
 include/hw/arm/aspeed.h | 1 +
 4 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 9d43e26c51..ff53d12395 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -14,6 +14,7 @@
 #include "hw/arm/boot.h"
 #include "hw/arm/aspeed.h"
 #include "hw/arm/aspeed_soc.h"
+#include "hw/char/serial.h"
 #include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/misc/pca9552.h"
@@ -21,6 +22,7 @@
 #include "hw/misc/led.h"
 #include "hw/qdev-properties.h"
 #include "sysemu/block-backend.h"
+#include "sysemu/sysemu.h"
 #include "hw/loader.h"
 #include "qemu/error-report.h"
 #include "qemu/units.h"
@@ -352,6 +354,10 @@ static void aspeed_machine_init(MachineState *machin=
e)
     }
     qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
=20
+    serial_mm_init(get_system_memory(), sc->memmap[amc->serial_dev], 2,
+                   sc->get_irq(&bmc->soc, amc->serial_dev), 38400,
+                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
+
     memory_region_add_subregion(get_system_memory(),
                                 sc->memmap[ASPEED_DEV_SDRAM],
                                 &bmc->ram_container);
@@ -804,6 +810,7 @@ static void aspeed_machine_class_init(ObjectClass *oc=
, void *data)
     mc->no_parallel =3D 1;
     mc->default_ram_id =3D "ram";
     amc->macs_mask =3D ASPEED_MAC0_ON;
+    amc->serial_dev =3D ASPEED_DEV_UART5;
=20
     aspeed_machine_class_props_init(oc);
 }
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 56e1adb343..a27b0de482 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -322,11 +322,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *=
dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
=20
-    /* UART - attach an 8250 to the IO space as our UART5 */
-    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
-                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
-                   38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
-
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr)=
,
                              &error_abort);
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index c373182299..0c09d1e5b4 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -287,11 +287,6 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
=20
-    /* UART - attach an 8250 to the IO space as our UART5 */
-    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
-                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5), 38400,
-                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
-
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr)=
,
                              &error_abort);
diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index c9747b15fc..9f5b9f04d6 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -38,6 +38,7 @@ struct AspeedMachineClass {
     uint32_t num_cs;
     uint32_t macs_mask;
     void (*i2c_init)(AspeedMachineState *bmc);
+    uint32_t serial_dev;
 };
=20
=20
--=20
2.30.2

