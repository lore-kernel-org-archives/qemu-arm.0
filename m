Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp462913ejb;
        Thu, 14 Sep 2023 05:03:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSOgRHKWGMIz9SvdHrUtZapONZyVDXaLrR+ZXfC4+/8IQ33678ZASlcGfm6J9M90MFyMqG
X-Received: by 2002:a67:f60d:0:b0:44e:d6c3:51d6 with SMTP id k13-20020a67f60d000000b0044ed6c351d6mr5336054vso.14.1694693011170;
        Thu, 14 Sep 2023 05:03:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694693011; cv=none;
        d=google.com; s=arc-20160816;
        b=N2EMad6GgOjfyDHlte8B1SbGhQ9R+NhOTZYdTaNniq/on02dEL3+Ig+t6WVdh/UzLD
         kyfknhLoKZqUduFQwlpE4Gbf5/wp6CD5w7ot3Mq4PU5mraaYOt1F3NMLEP28oDydgHfA
         V0Gl/s5TqSaHogNUK1s66p9ZgJPadQsKoUU2H7Y/wzRjAqZLN38gVOw3joUszxjY6y+f
         OrLYaDyvaxqAZunNVqDCJkJVmkPW56B1s0Mzdpn6h7M9c2Lu0Jqlauvoqi9mRFY3zwmS
         yLNBJtF6HCCW2BqmlOcfsSoO3NV/r133zCeGEBWuU/i00R7soOGZrZs6rwwQwSg9w0Qr
         498Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Lqdl6Z1r2s58ylVKuHPXl/YcHu8ZddiHLMl9E7wr8vI=;
        fh=rHVtHBd2xoKpDoS1lLv+PY/AJ/HE7hDWGJSECarQ2p4=;
        b=bJrQimc9yykhBA2Z1bJoSpbNsHX+jobgIKERLvsRGACNRnIZrBxU6gyC6ozCH42VCs
         iZvmkDzwqOJ6g0l26mTcttU2ivLNTeLfJi0Mayp99DEAfBIgsJDhFEUM/W4MEScf5KsY
         4+ZeKY5UootSxJmUm0GmTnn0qORLBYHw4Q6F+mjl1NJY3Ds7ImrWFAoU/gsNrIdd9cKJ
         i6KyB+iofJW9qa2kJJNINvIK29v3Gdkgie5zEGjnI0tWiDiA2gPPM+u/Jwr0Lsx8hbOS
         +Nwuej4ah4y/aVbJBXGgBljT+PG4F/50AI5zRy8pFDe9e61vnhG0bcPOQjC+2qIEWi0n
         QYpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b="jzqy/YPP";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14-20020a67e1ce000000b0044ee0b22f30si68523vsl.37.2023.09.14.05.03.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Sep 2023 05:03:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b="jzqy/YPP";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qgl2y-0008WM-Lt; Thu, 14 Sep 2023 08:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1qgl2s-0008PF-81; Thu, 14 Sep 2023 08:02:06 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_llindhol@quicinc.com>)
 id 1qgl2q-0007OL-95; Thu, 14 Sep 2023 08:02:05 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38EB96Qs018686; Thu, 14 Sep 2023 12:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=Lqdl6Z1r2s58ylVKuHPXl/YcHu8ZddiHLMl9E7wr8vI=;
 b=jzqy/YPPUH7IIc/s2cFvpoSHIUVrXMgVkj0ZQVrJ/hBxkbdsb2t4M9hsV/aOJfPIOHCb
 FlwBURkKDHQNoyiqWfLIadSXRx+VCWdlmvCOfQHu3v1tF1ThBLf1F8RWyY76SlLcK0Cn
 GFrYjeZyksp5C+rh4WLJdGymfzYg2D7Fs8mJk/Pi2H+ubZ64fxS+f/CZBFbQfqFYNHrX
 9H0HdDtskyLY6rsNmaOV9QL/swsfqLZW0bb7USTUdej6Kp3Ca5u/AqTrzrYpSD2Pb/k7
 ozMWYSer3mXpsqoN8ZZ0UMHDMFwdAKliutmqQb184fTyXa7n9V6ZtsPQSJT1Z4w5cgye mA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t411s85gu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Sep 2023 12:02:00 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38EC1edj014126
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Sep 2023 12:01:40 GMT
Received: from qc-i7.qualcomm.com (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 14 Sep
 2023 05:01:39 -0700
From: Leif Lindholm <quic_llindhol@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>, Peter
 Maydell <peter.maydell@linaro.org>, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>
Subject: [RFC PATCH 1/3] include/hw/arm: move BSA definitions to bsa.h
Date: Thu, 14 Sep 2023 13:01:22 +0100
Message-ID: <20230914120124.55410-2-quic_llindhol@quicinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230914120124.55410-1-quic_llindhol@quicinc.com>
References: <20230914120124.55410-1-quic_llindhol@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: HdSWgMbPp3FyKuawXKVXrTCiQXLgvhau
X-Proofpoint-GUID: HdSWgMbPp3FyKuawXKVXrTCiQXLgvhau
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_09,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=352 lowpriorityscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309140103
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_llindhol@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ipiz3D2vB0RT

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
index 0000000000..8277b3a379
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
+#define ARCH_GIC_MAINT_IRQ  9
+
+#define ARCH_TIMER_VIRT_IRQ   11
+#define ARCH_TIMER_S_EL1_IRQ  13
+#define ARCH_TIMER_NS_EL1_IRQ 14
+#define ARCH_TIMER_NS_EL2_IRQ 10
+
+#define VIRTUAL_PMU_IRQ 7
+
+#define PPI(irq) ((irq) + 16)
+
+#endif /* QEMU_ARM_BSA_H */
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index e1ddbea96b..f69239850e 100644
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
 
-#define ARCH_GIC_MAINT_IRQ  9
-
-#define ARCH_TIMER_VIRT_IRQ   11
-#define ARCH_TIMER_S_EL1_IRQ  13
-#define ARCH_TIMER_NS_EL1_IRQ 14
-#define ARCH_TIMER_NS_EL2_IRQ 10
-
-#define VIRTUAL_PMU_IRQ 7
-
-#define PPI(irq) ((irq) + 16)
-
 /* See Linux kernel arch/arm64/include/asm/pvclock-abi.h */
 #define PVTIME_SIZE_PER_CPU 64
 
-- 
2.30.2

