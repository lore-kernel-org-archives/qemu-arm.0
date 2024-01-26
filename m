Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp794028ejc;
        Fri, 26 Jan 2024 02:52:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpAMsGq2Qf5L0WR95Az1b/1Vzrozt6cDH1gLkXs2r7/J5BVGKBM9nIzcK6MVOw44Lr5H/A
X-Received: by 2002:ac8:5956:0:b0:42a:8092:1066 with SMTP id 22-20020ac85956000000b0042a80921066mr468733qtz.69.1706266326352;
        Fri, 26 Jan 2024 02:52:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706266326; cv=none;
        d=google.com; s=arc-20160816;
        b=fF7ackjXMaiEdlrX54EKiXpQrL4p8lJyT7giwyFvCdqz/0KZcSukcrF8rhCPksBVsq
         eYghMxayqY39zK37SJNp4nBqu9qTq43LiiQx0roQjsvXb8w1OdodY87W4d3b5d0o11ws
         vusITsR4IylLGygBb6b6UGXlLIt6S8EaEfVtxnL2MxrGhs4XnzfuMGEcmp3VqPFK/u/l
         veoyDUBmT1MFjIwlFrfhrghADBF1MEYU2suJXE99CKCEvYyr2F81X0ceSUqeDIeRfTR0
         cChWLGPkQKMTbrhhBmrifOzRl7YOU8ReloOM4XaeSb/FWVlCRinB/WTxVmIymTilSCSz
         5lcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0JwBXRP+dmQAIp7ovlklWx6WQG3YepTAIg7f1zwsccg=;
        fh=oCcW8YgO0uPSEPLT85zmruvbAEZ25ywTEvlgBH92cAY=;
        b=Azy7rTJdzn+u3plRVhcd/ArvGFbukKStgW7u5jtyIjf0F4yQw2q1CVdgpW58JSHQ1K
         VwMCLzdt2zy9bruI+gkbggFzrox6jpm77IkF4X1Tfhs4CpkNmWq6We0gcjEWMqnkQNnN
         zS6p+w4RCMorGUxRouQJb6UwNxf3CN3EhtgQU2gyS3iIv07pjr1GLvjqNjfqlm2q1rA3
         nLGEmx5wip9iLg+cDhUsVr431phhMh92/aPAlq/qG5CXwOCrSm4sc5sK+mfIWXofqiaq
         2Y9J4hY22XpQ9aBKxn/kpgOnEsMNypql7JaAR+1FRh/yutvtdpAxQPf62r7HYOGRSO+7
         cX+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=JJLzIS6q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v16-20020ac85790000000b00429feb457edsi931488qta.773.2024.01.26.02.52.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 02:52:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=JJLzIS6q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTJnY-0004ms-5M; Fri, 26 Jan 2024 05:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTJn4-0004a0-Je; Fri, 26 Jan 2024 05:50:31 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTJn0-00069m-SQ; Fri, 26 Jan 2024 05:50:30 -0500
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 40QAjoeb006799; Fri, 26 Jan 2024 10:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=0JwBXRP+dmQAIp7ovlklWx6WQG3YepTAIg7f1zwsccg=;
 b=JJLzIS6qEjg3Hp6OEOuc7JSpAFWEZKR5ft1blx5k34RfZFLNQqdARtaiy9aZWdemYc9Q
 i+gG8/QZ5i+mVWoja1glk3JfCDkhU47sqxV6X1EU4ah9KsXiVTvDb79DK63TmV54TT5r
 NdbdvgrPdOnsE2hvLp/qh87JDJ9hhC1DKjhL9ujAM7eOEymF1yNYSN/Z1dT0CgWDqYGd
 Y2Vr+OBv+xq1GyDx7UNYY6jgEaO9nnFBJvCb2CFjYLXvGRKkaicDbEIPHCiMdCXgjYQT
 RcxKyxf2vgWoJKtMqDK52fwJxkMOn1kLpbQjPriOAFPHe26fYMjm2WTpFrXBBlXTmnl1 hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vv89svhbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 10:50:03 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40QAP7vE004674;
 Fri, 26 Jan 2024 10:50:02 GMT
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vv89svhbg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 10:50:02 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 40Q8HMlu010855; Fri, 26 Jan 2024 10:50:01 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vrrw0ab73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 10:50:01 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 40QAo0AS29688226
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jan 2024 10:50:01 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B81655805D;
 Fri, 26 Jan 2024 10:50:00 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6C0058043;
 Fri, 26 Jan 2024 10:49:59 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jan 2024 10:49:59 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v12 01/11] hw/fsi: Introduce IBM's Local bus
Date: Fri, 26 Jan 2024 04:49:46 -0600
Message-Id: <20240126104956.74126-2-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126104956.74126-1-ninad@linux.ibm.com>
References: <20240126104956.74126-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LUWNDi7Xxay6-wp4sRiBwY2XdLxJcfLZ
X-Proofpoint-ORIG-GUID: hI0R9XmL_7_QsqjeFWE0eTUbImxY3Q5U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 bulkscore=0 mlxlogscore=935 priorityscore=1501 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401260078
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: S7qV+5tZxt0L

This is a part of patchset where IBM's Flexible Service Interface is
introduced.

The LBUS is modelled to maintain mapped memory for the devices. The
memory is mapped after CFAM config, peek table and FSI slave registers.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
[ clg: - removed lbus_add_device() bc unused
       - removed lbus_create_device() bc used only once
       - removed "address" property
       - updated meson.build to build fsi dir
       - included an empty hw/fsi/trace-events ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
v9:
  - Changed LBUS memory region to 1MB.
v11:
  - Split lbus and scratchpad into separate patches.
  - Added fsi_ prefix for all functions in lbus.
  - Removed FSI_LBUS* typedefs.
  - Replaced for loop with memset.
---
 meson.build           |  1 +
 hw/fsi/trace.h        |  1 +
 include/hw/fsi/lbus.h | 32 ++++++++++++++++++++++++++++++++
 hw/fsi/lbus.c         | 43 +++++++++++++++++++++++++++++++++++++++++++
 hw/Kconfig            |  1 +
 hw/fsi/Kconfig        |  2 ++
 hw/fsi/meson.build    |  1 +
 hw/fsi/trace-events   |  0
 hw/meson.build        |  1 +
 9 files changed, 82 insertions(+)
 create mode 100644 hw/fsi/trace.h
 create mode 100644 include/hw/fsi/lbus.h
 create mode 100644 hw/fsi/lbus.c
 create mode 100644 hw/fsi/Kconfig
 create mode 100644 hw/fsi/meson.build
 create mode 100644 hw/fsi/trace-events

diff --git a/meson.build b/meson.build
index d0329966f1..7d926c6e82 100644
--- a/meson.build
+++ b/meson.build
@@ -3290,6 +3290,7 @@ if have_system
     'hw/char',
     'hw/display',
     'hw/dma',
+    'hw/fsi',
     'hw/hyperv',
     'hw/i2c',
     'hw/i386',
diff --git a/hw/fsi/trace.h b/hw/fsi/trace.h
new file mode 100644
index 0000000000..ee67c7fb04
--- /dev/null
+++ b/hw/fsi/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_fsi.h"
diff --git a/include/hw/fsi/lbus.h b/include/hw/fsi/lbus.h
new file mode 100644
index 0000000000..e8a22e22a8
--- /dev/null
+++ b/include/hw/fsi/lbus.h
@@ -0,0 +1,32 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2024 IBM Corp.
+ *
+ * IBM Local bus and connected device structures.
+ */
+#ifndef FSI_LBUS_H
+#define FSI_LBUS_H
+
+#include "hw/qdev-core.h"
+#include "qemu/units.h"
+#include "exec/memory.h"
+
+#define TYPE_FSI_LBUS_DEVICE "fsi.lbus.device"
+OBJECT_DECLARE_SIMPLE_TYPE(FSILBusDevice, FSI_LBUS_DEVICE)
+
+typedef struct FSILBusDevice {
+    DeviceState parent;
+
+    MemoryRegion iomem;
+} FSILBusDevice;
+
+#define TYPE_FSI_LBUS "fsi.lbus"
+OBJECT_DECLARE_SIMPLE_TYPE(FSILBus, FSI_LBUS)
+
+typedef struct FSILBus {
+    BusState bus;
+
+    MemoryRegion mr;
+} FSILBus;
+
+#endif /* FSI_LBUS_H */
diff --git a/hw/fsi/lbus.c b/hw/fsi/lbus.c
new file mode 100644
index 0000000000..44d2319087
--- /dev/null
+++ b/hw/fsi/lbus.c
@@ -0,0 +1,43 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2024 IBM Corp.
+ *
+ * IBM Local bus where FSI slaves are connected
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/fsi/lbus.h"
+
+#include "hw/qdev-properties.h"
+
+#include "trace.h"
+
+static void fsi_lbus_init(Object *o)
+{
+    FSILBus *lbus = FSI_LBUS(o);
+
+    memory_region_init(&lbus->mr, OBJECT(lbus), TYPE_FSI_LBUS, 1 * MiB);
+}
+
+static const TypeInfo fsi_lbus_info = {
+    .name = TYPE_FSI_LBUS,
+    .parent = TYPE_BUS,
+    .instance_init = fsi_lbus_init,
+    .instance_size = sizeof(FSILBus),
+};
+
+static const TypeInfo fsi_lbus_device_type_info = {
+    .name = TYPE_FSI_LBUS_DEVICE,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(FSILBusDevice),
+    .abstract = true,
+};
+
+static void fsi_lbus_register_types(void)
+{
+    type_register_static(&fsi_lbus_info);
+    type_register_static(&fsi_lbus_device_type_info);
+}
+
+type_init(fsi_lbus_register_types);
diff --git a/hw/Kconfig b/hw/Kconfig
index 9ca7b38c31..2c00936c28 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -9,6 +9,7 @@ source core/Kconfig
 source cxl/Kconfig
 source display/Kconfig
 source dma/Kconfig
+source fsi/Kconfig
 source gpio/Kconfig
 source hyperv/Kconfig
 source i2c/Kconfig
diff --git a/hw/fsi/Kconfig b/hw/fsi/Kconfig
new file mode 100644
index 0000000000..9c34a418d7
--- /dev/null
+++ b/hw/fsi/Kconfig
@@ -0,0 +1,2 @@
+config FSI
+    bool
diff --git a/hw/fsi/meson.build b/hw/fsi/meson.build
new file mode 100644
index 0000000000..93ba19dd04
--- /dev/null
+++ b/hw/fsi/meson.build
@@ -0,0 +1 @@
+system_ss.add(when: 'CONFIG_FSI', if_true: files('lbus.c'))
diff --git a/hw/fsi/trace-events b/hw/fsi/trace-events
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/hw/meson.build b/hw/meson.build
index f01fac4617..463d702683 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -44,6 +44,7 @@ subdir('virtio')
 subdir('watchdog')
 subdir('xen')
 subdir('xenpv')
+subdir('fsi')
 
 subdir('alpha')
 subdir('arm')
-- 
2.39.2

