Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1169295ejb;
        Fri, 15 Sep 2023 04:56:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR7zDVQ5zEjbfUp70a7SMMmfJQwE3jU6g8yfslW6FdzaYSC7mt2jYgWMHl8+pcOVtYhOHD
X-Received: by 2002:a05:620a:2944:b0:772:63b3:1ad2 with SMTP id n4-20020a05620a294400b0077263b31ad2mr1431260qkp.29.1694778977292;
        Fri, 15 Sep 2023 04:56:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694778977; cv=none;
        d=google.com; s=arc-20160816;
        b=lcqmJbDH+AgVVTUZrSlZhpmO4bAXTxbRU1SnbW0OsU/qnDuyFC0fS4JHEHpEVR93FA
         /VCZmbwoA1MxzYHr7Ca/xWPk2UrTG+Ky6qBdZx+T8qSw2/2CRtM1MDtnNTHNEr6X2aVe
         UqTH4y6QhGfcpcVWwd2ZVCLn2FuVJbt8ug2enOn6mRwDf5vExxSamgBQmx80epyWR0IX
         0jFoHNNvfbUcecQCxD0pcErKGfkaaFWhnBKOJNzmosY4rY0SVnBvvs7BVyVKJIgJVI5x
         c9Bq2U0SGhHPQV+ep0096JaooO6xqOxW7jkNcS5wzy+pmvGjaPZMBBIQri1IRsNdhH5e
         +V7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PrkOgQCZH2Q4EgYsCq7gML0NEEoriMloQQM/qQbzSdg=;
        fh=OMGGfVUerWjoKT+ZrKe9FOUZoPWdoRXgXkvZIfSNxVE=;
        b=hWPOuEgVYbKOVSN7Ws5naI5K8SwkhOTyPCvvzkWarPxYSe3/JbQxrjwe2sCNhUB/sM
         iU+hAp8kWdx0z2VEbRRFzIWqnklkNSxjlbGyLtVKmwvMej2XNoGNIicvHFYfOgXKXEkg
         s769jDRwp8HH3tqK/ZiXeOs2fMrstFkvcEZ6b1woEGWF7N+T/1UwtoE7nmroC34UF7c0
         5bVZo1d0RYY0Wg4HbTc5WDC1wG/fgPqpvKxiTS8xsOQhrFy3NimBWSUpiSCU+XFAMKV2
         ezXpCt/EU4zCPyu0gjj6+f5IH7xVzzAHP7G4i+wnOOVYU5q6R+tlthnXl7OB9RvUaxCw
         ROmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b="cRzOmhJ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi19-20020a05620a319300b00767ee543571si2318427qkb.403.2023.09.15.04.56.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Sep 2023 04:56:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b="cRzOmhJ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qh7QZ-0002Vk-1h; Fri, 15 Sep 2023 07:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1qh7QT-0002TK-QH; Fri, 15 Sep 2023 07:55:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1qh7QR-0005fr-Hd; Fri, 15 Sep 2023 07:55:57 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38FAvsWW001435; Fri, 15 Sep 2023 11:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=PrkOgQCZH2Q4EgYsCq7gML0NEEoriMloQQM/qQbzSdg=;
 b=cRzOmhJ/sqxSS3XXXyzHxYaqWdD2GkSe8vJR+uYaBGS4dbv0JGlIBU7LTnA4UunrgoWh
 +b0fduou+QzyFa/3YrgTafqxh0uGhMoNd7JvizIdogl1AuB+EhHUue15mJKOkDM8r6R8
 eZMMAJlz3Hz6ImddI1p/Phjfk6NystU1lTfqDRQXL6Vbg14/tZGlPS1ZbiH65z6m0rg3
 r3l9+WmNPohjvuGVDTdzQJrBrBWQr54iBW4QyxZAdrrsiNAFMnSFFR7Jl+ff/Cm3Ei/D
 Ed4X0p4GqlbFKpgNKvjyGv5X4QORwrsGf2YhvZI/R5rChzNdns+ArskY0eUl3+t8E6Gn YA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4dvqs75r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 11:55:49 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38FBtnmB010673
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 11:55:49 GMT
Received: from qc-i7.qualcomm.com (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 15 Sep
 2023 04:55:47 -0700
From: Leif Lindholm <quic_llindhol@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>, Peter
 Maydell <peter.maydell@linaro.org>, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: [PATCH v1 2/3] include/hw/arm: move BSA definitions to bsa.h
Date: Fri, 15 Sep 2023 12:55:34 +0100
Message-ID: <20230915115535.129834-3-quic_llindhol@quicinc.com>
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
X-Proofpoint-GUID: ZmAS8SnhLkLpTtfUGGK-tNH-c77YO11a
X-Proofpoint-ORIG-GUID: ZmAS8SnhLkLpTtfUGGK-tNH-c77YO11a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_08,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=387 phishscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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
X-TUID: fxi0uQa4xlhj

virt.h defines a number of IRQs that are ultimately described by Arm's
Base System Architecture specification. Move these to a dedicated header
so that they can be reused by other platforms that do the same.
Include that header from virt.h to minimise churn.

Signed-off-by: Leif Lindholm <quic_llindhol@quicinc.com>
---
 include/hw/arm/bsa.h  | 35 +++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h | 12 +-----------
 2 files changed, 36 insertions(+), 11 deletions(-)
 create mode 100644 include/hw/arm/bsa.h

diff --git a/include/hw/arm/bsa.h b/include/hw/arm/bsa.h
new file mode 100644
index 0000000000..b7db1cacf1
--- /dev/null
+++ b/include/hw/arm/bsa.h
@@ -0,0 +1,35 @@
+/*
+ * Common definitions for Arm Base System Architecture (BSA) platforms.
+ *
+ * Copyright (c) 2015 Linaro Limited
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#ifndef QEMU_ARM_BSA_H
+#define QEMU_ARM_BSA_H
+
+#define ARCH_GIC_MAINT_IRQ  25
+
+#define ARCH_TIMER_VIRT_IRQ   27
+#define ARCH_TIMER_S_EL1_IRQ  29
+#define ARCH_TIMER_NS_EL1_IRQ 30
+#define ARCH_TIMER_NS_EL2_IRQ 26
+
+#define VIRTUAL_PMU_IRQ 23
+
+#define PPI(irq) ((irq) - 16)
+
+#endif /* QEMU_ARM_BSA_H */
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 8ba4e5b836..f69239850e 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -34,6 +34,7 @@
 #include "qemu/notify.h"
 #include "hw/boards.h"
 #include "hw/arm/boot.h"
+#include "hw/arm/bsa.h"
 #include "hw/block/flash.h"
 #include "sysemu/kvm.h"
 #include "hw/intc/arm_gicv3_common.h"
@@ -43,17 +44,6 @@
 #define NUM_VIRTIO_TRANSPORTS 32
 #define NUM_SMMU_IRQS          4
 
-#define ARCH_GIC_MAINT_IRQ  25
-
-#define ARCH_TIMER_VIRT_IRQ   27
-#define ARCH_TIMER_S_EL1_IRQ  29
-#define ARCH_TIMER_NS_EL1_IRQ 30
-#define ARCH_TIMER_NS_EL2_IRQ 26
-
-#define VIRTUAL_PMU_IRQ 23
-
-#define PPI(irq) ((irq) - 16)
-
 /* See Linux kernel arch/arm64/include/asm/pvclock-abi.h */
 #define PVTIME_SIZE_PER_CPU 64
 
-- 
2.30.2

