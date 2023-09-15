Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1169366ejb;
        Fri, 15 Sep 2023 04:56:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcQEw4+tU/sLFjjRsRDLLhP7S6mIxmBLxOTSnT4/5F3t8rQ5jW2GKaVOwVWIFiqDW7VrfC
X-Received: by 2002:a05:620a:e92:b0:76c:ba9d:3ec7 with SMTP id w18-20020a05620a0e9200b0076cba9d3ec7mr1343034qkm.6.1694778984592;
        Fri, 15 Sep 2023 04:56:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694778984; cv=none;
        d=google.com; s=arc-20160816;
        b=prSoM5ABHPeQ86yoq+2ONlhHADUVvUbwsQJ7qmPJ3Mt7gXy9Tx+pmXqlu39ttEBvHI
         1YjXceDKRd5aPjnRX+XmWpYGtyZ8jcb7OFidibM21W2KxJZvf1g5D2iBZkYCeA/eae2H
         KeFQxloTvJHRsKLeSg5EXIHLKrsGroXtsthzOHk7PJHgL0xkSoZR4G3yJhLVj7UC1GyH
         FHohkqCjtwMoiVXmNtcUOkwK1xSXloN3rE6OMvJxKOfln81DJCUOiGWe7sXEMSOuh2P5
         FGwMzYXHjKHIVLbUR2WNxaPdsy/4OdzvFbUSRBAjOkW3cQ2eSDJIAB85xLhxhOsuaulF
         gusA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5DvEs4xO/6B9ch/QBDA3720rbF8VAaCdkLX4aOBmM1w=;
        fh=OMGGfVUerWjoKT+ZrKe9FOUZoPWdoRXgXkvZIfSNxVE=;
        b=vRpiUI5BChm6xHKv+eTxIfY3TvWsd48LU9WyXCxvXWBj+YoJSdCUsbOaX/oYWl6ukL
         uqZ/F3nZ6N2ppsIzQW5HWWU6LbghGbCl2v7IJGvGpc9MCo0e2ybCJJEINLIw2ngBcMvN
         Jwttc5DZp+WS72oOCmhXrhMSdy2G/g9i/fiL8uEIZ7Uy9sNgG3qd4PxQ/ICH2JBJBlG2
         GLCYcimwkQkDwVdur3sBykFmdjZ0CT0ThBNA/9cH5jJV9JkioFGO4lC4qT8bT8aQ2n0W
         IcZ6yy8ZrFWt19KZs/aqHsJwqeEXXihMZ3jDVTLNuX/pYyYbSySuYFcosxb+bJXBB6RO
         rH9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=izDULcVa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a3-20020a05620a02e300b00767d63de20fsi2211633qko.193.2023.09.15.04.56.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Sep 2023 04:56:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=izDULcVa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qh7QZ-0002Vl-20; Fri, 15 Sep 2023 07:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1qh7QV-0002Tp-61; Fri, 15 Sep 2023 07:55:59 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1qh7QT-0005fy-Hh; Fri, 15 Sep 2023 07:55:58 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38F5V06F031355; Fri, 15 Sep 2023 11:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=5DvEs4xO/6B9ch/QBDA3720rbF8VAaCdkLX4aOBmM1w=;
 b=izDULcVaSmYNhkIrZHSpDOBMKFKxpvQA7Npc72YhnQTG6zxIClDJCWAsfOJzIPfGlUWY
 91ImFSPhN4sgIen7lZA4AtAhbsx3dab0sm0tlGxcrRciEYqYUT040xpji/WZyOH6qg0f
 sqKVo18N7slPQAAreRZwouU731R2JMPRJYPjDAsxcmS+1oBn7nY4tVZZnq+sG85X6kLd
 Vlc2jC8hSObi2h4LU+OZKDpi4zRGeb0JhcRYKg2N3OD0tBlZGF3anFUXEw5GzezsXRjs
 YsijIJYuTAnOg81g08eGD/vIw/r8wiqcUhcSMSAe7evYlnSHuHREpWe1miuFbr8+Z3Gd 5g== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4g070ywk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 11:55:51 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38FBtoBg024107
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 11:55:50 GMT
Received: from qc-i7.qualcomm.com (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 15 Sep
 2023 04:55:49 -0700
From: Leif Lindholm <quic_llindhol@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>, Peter
 Maydell <peter.maydell@linaro.org>, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: [PATCH v1 3/3] hw/arm/sbsa-ref: use bsa.h for PPI definitions
Date: Fri, 15 Sep 2023 12:55:35 +0100
Message-ID: <20230915115535.129834-4-quic_llindhol@quicinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230915115535.129834-1-quic_llindhol@quicinc.com>
References: <20230915115535.129834-1-quic_llindhol@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _yngj1rYPhwN7Yxx_WT2cWVSs_ES2qnR
X-Proofpoint-ORIG-GUID: _yngj1rYPhwN7Yxx_WT2cWVSs_ES2qnR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_08,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=510 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150106
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_llindhol@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XVGdGVbzE+P5

Use the private peripheral interrupt definitions from bsa.h instead of
defining them locally. Refactor to use PPI() to convert from INTID macro
where necessary.

Signed-off-by: Leif Lindholm <quic_llindhol@quicinc.com>
---
 hw/arm/sbsa-ref.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index bc89eb4806..3a4ea4dfdd 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -2,6 +2,7 @@
  * ARM SBSA Reference Platform emulation
  *
  * Copyright (c) 2018 Linaro Limited
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
  * Written by Hongbo Zhang <hongbo.zhang@linaro.org>
  *
  * This program is free software; you can redistribute it and/or modify it
@@ -30,6 +31,7 @@
 #include "exec/hwaddr.h"
 #include "kvm_arm.h"
 #include "hw/arm/boot.h"
+#include "hw/arm/bsa.h"
 #include "hw/arm/fdt.h"
 #include "hw/arm/smmuv3.h"
 #include "hw/block/flash.h"
@@ -55,13 +57,6 @@
 #define NUM_SMMU_IRQS   4
 #define NUM_SATA_PORTS  6
 
-#define VIRTUAL_PMU_IRQ        7
-#define ARCH_GIC_MAINT_IRQ     9
-#define ARCH_TIMER_VIRT_IRQ    11
-#define ARCH_TIMER_S_EL1_IRQ   13
-#define ARCH_TIMER_NS_EL1_IRQ  14
-#define ARCH_TIMER_NS_EL2_IRQ  10
-
 enum {
     SBSA_FLASH,
     SBSA_MEM,
@@ -494,15 +489,19 @@ static void create_gic(SBSAMachineState *sms, MemoryRegion *mem)
         for (irq = 0; irq < ARRAY_SIZE(timer_irq); irq++) {
             qdev_connect_gpio_out(cpudev, irq,
                                   qdev_get_gpio_in(sms->gic,
-                                                   ppibase + timer_irq[irq]));
+                                                   ppibase
+                                                   + PPI(timer_irq[irq])));
         }
 
         qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt", 0,
-                                    qdev_get_gpio_in(sms->gic, ppibase
-                                                     + ARCH_GIC_MAINT_IRQ));
+                                    qdev_get_gpio_in(sms->gic,
+                                                     ppibase
+                                                     + PPI(ARCH_GIC_MAINT_IRQ)));
+
         qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
-                                    qdev_get_gpio_in(sms->gic, ppibase
-                                                     + VIRTUAL_PMU_IRQ));
+                                    qdev_get_gpio_in(sms->gic,
+                                                     ppibase
+                                                     + PPI(VIRTUAL_PMU_IRQ)));
 
         sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
         sysbus_connect_irq(gicbusdev, i + smp_cpus,
-- 
2.30.2

