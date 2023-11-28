Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp2273098ejt;
        Tue, 28 Nov 2023 16:00:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4vbyuodXwlfSywVJNZOVMqBYqUkI7D/M8Ff5IPu44bUIrIduyQj/dywPncNnRLYTRo89f
X-Received: by 2002:a05:6102:aca:b0:464:3685:2046 with SMTP id m10-20020a0561020aca00b0046436852046mr3727216vsh.8.1701216030951;
        Tue, 28 Nov 2023 16:00:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701216030; cv=none;
        d=google.com; s=arc-20160816;
        b=BNhzV//UxxPY3yIjAFveFs24YagezuewYxqtRBe5QQQws91eSCDscJU1l0jzFDQR17
         rdIn79m1UCUtv+SsBCyYn1TBLZXj9+kjx8b9PzRizi+PPyG7vUpQVyA8PZLMv3MuWfCH
         JwtmFvZ/Q5PMDJJspSxQfqLkOineYriH4sdw88N52iZV0YVGVVjIiMii6/LSUiK4dy25
         gOxWffmJ1yMWH4ugvvKkHOoxDSG6VzQGk8XpwufBQ6XiMJZ9PcrNPbzvDJWM2i5WIELO
         P+1TtVrMJZDi0Zqi5NgPv8pgl4/GteJEmd1vIGglakC749Sy6YJvXDyr2KupazRXt3z0
         vYgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/i9tJ02VHo84TiSEhuSwa17cmhLSbaOyz8zqww46fUE=;
        fh=oCcW8YgO0uPSEPLT85zmruvbAEZ25ywTEvlgBH92cAY=;
        b=CSkOr0SaugArtLZhp39EE4bdhEEhsNWyRNg4ME3FFRnBhL9Sv9Jz9TBK8rSlvo8SE4
         7F3lNmDLmYa44gs5QOh8Sks5s2YJuzVW0EyfU7IvBw5xPAR2yoUubud2BdSXfUfl7MIM
         LmT6n67YjzxEIm9AeGI8DSU98tZM2Imm79zws/lVQmoOE0tWSx/7HqPxr4MLBZfbVEnV
         aNWNRkfGWYgOyq8hVw7KithBexWQt2G4JPvu0PKMlsF8dZ7s/a9DocMSmhVYHaVgPui5
         3iLpVa/TCEW7v5am9erhTCDiuCyXlFbEJKXT2B5jdZGURENelWGXB8kX5WHQ0G4htK6B
         KJKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=i1By7GsW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8-20020a05620a268800b00770f3ba37b7si12749712qkp.30.2023.11.28.16.00.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Nov 2023 16:00:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=i1By7GsW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r87zz-0006Fu-QY; Tue, 28 Nov 2023 19:00:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1r87zs-00064Y-Ht; Tue, 28 Nov 2023 19:00:09 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1r87zo-0000GF-5p; Tue, 28 Nov 2023 19:00:08 -0500
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ASNbC4F019897; Tue, 28 Nov 2023 23:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=/i9tJ02VHo84TiSEhuSwa17cmhLSbaOyz8zqww46fUE=;
 b=i1By7GsWxoJ3gGeTRiV721LgeTHM7LqoYgdw7U4VzIp1cuTEaG5PoYhAtblorERjuZmO
 qC9SldqMUn0ysjKUTHHJPqaEzrQiqMMrpIr+EidxUfsnTsViA4F058olvuali4cDS9rc
 Dj/LP5lpuDSnM/KHGaJczELU2AUmQHv56i4WIRpnP66lN1ZXwnAMB7T7aH9JBjxYK1Kt
 EZkcduAE5JZjpWbMsUrBcOIPn1tzHUrzYgxsSQvMC/kT1OaAUkgskXMHI9Zoaz5nS1T7
 kum+lGcKvY5bGHIVwVYCN6bU6xHyEJoA4gx2A88+50bAxgvnqgIvwPFNE1k8S9fSWUhN 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3unt1pgcfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Nov 2023 23:59:44 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3ASNxi8p010756;
 Tue, 28 Nov 2023 23:59:44 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3unt1pgc9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Nov 2023 23:59:44 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ASN06N5018258; Tue, 28 Nov 2023 23:57:04 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ukwy1u65v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Nov 2023 23:57:04 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3ASNv3BR3277462
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Nov 2023 23:57:04 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CC0A58059;
 Tue, 28 Nov 2023 23:57:03 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B7FE58055;
 Tue, 28 Nov 2023 23:57:03 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 28 Nov 2023 23:57:03 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v8 01/10] hw/fsi: Introduce IBM's Local bus
Date: Tue, 28 Nov 2023 17:56:51 -0600
Message-Id: <20231128235700.599584-2-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231128235700.599584-1-ninad@linux.ibm.com>
References: <20231128235700.599584-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gyzHq09xGP5dnIFoP-S0JRxeRCWYm3im
X-Proofpoint-GUID: 6YPuAbDsBg4c58a-MNNuhCGt_yS71Il6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_25,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxlogscore=883 bulkscore=0 mlxscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280188
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ninad@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
X-TUID: CPcwsJfSH+Wb

This is a part of patchset where IBM's Flexible Service Interface is
introduced.

The LBUS is modelled to maintain mapped memory for the devices. The
memory is mapped after CFAM config, peek table and FSI slave registers.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
[ clg: - removed lbus_add_device() bc unused
       - removed lbus_create_device() bc used only once
       - removed "address" property
       - updated meson.build to build fsi dir
       - included an empty hw/fsi/trace-events ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 meson.build           |  1 +
 hw/fsi/trace.h        |  1 +
 include/hw/fsi/lbus.h | 40 +++++++++++++++++++++++++++++++++
 hw/fsi/lbus.c         | 51 +++++++++++++++++++++++++++++++++++++++++++
 hw/Kconfig            |  1 +
 hw/fsi/Kconfig        |  2 ++
 hw/fsi/meson.build    |  1 +
 hw/fsi/trace-events   |  1 +
 hw/meson.build        |  1 +
 9 files changed, 99 insertions(+)
 create mode 100644 hw/fsi/trace.h
 create mode 100644 include/hw/fsi/lbus.h
 create mode 100644 hw/fsi/lbus.c
 create mode 100644 hw/fsi/Kconfig
 create mode 100644 hw/fsi/meson.build
 create mode 100644 hw/fsi/trace-events

diff --git a/meson.build b/meson.build
index ec01f8b138..b6556efd51 100644
--- a/meson.build
+++ b/meson.build
@@ -3298,6 +3298,7 @@ if have_system
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
index 0000000000..a58e33d061
--- /dev/null
+++ b/include/hw/fsi/lbus.h
@@ -0,0 +1,40 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2023 IBM Corp.
+ *
+ * IBM Local bus and connected device structures.
+ */
+#ifndef FSI_LBUS_H
+#define FSI_LBUS_H
+
+#include "exec/memory.h"
+#include "hw/qdev-core.h"
+
+#define TYPE_FSI_LBUS_DEVICE "fsi.lbus.device"
+OBJECT_DECLARE_TYPE(FSILBusDevice, FSILBusDeviceClass, FSI_LBUS_DEVICE)
+
+#define FSI_LBUS_MEM_REGION_SIZE  (2 * 1024 * 1024)
+#define FSI_LBUSDEV_IOMEM_START   0xc00 /* 3K used by CFAM config etc */
+
+typedef struct FSILBusDevice {
+    DeviceState parent;
+
+    MemoryRegion iomem;
+} FSILBusDevice;
+
+typedef struct FSILBusDeviceClass {
+    DeviceClass parent;
+
+    uint32_t config;
+} FSILBusDeviceClass;
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
index 0000000000..84c46a00d7
--- /dev/null
+++ b/hw/fsi/lbus.c
@@ -0,0 +1,51 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2023 IBM Corp.
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
+static void lbus_init(Object *o)
+{
+    FSILBus *lbus = FSI_LBUS(o);
+
+    memory_region_init(&lbus->mr, OBJECT(lbus), TYPE_FSI_LBUS,
+                       FSI_LBUS_MEM_REGION_SIZE - FSI_LBUSDEV_IOMEM_START);
+}
+
+static const TypeInfo lbus_info = {
+    .name = TYPE_FSI_LBUS,
+    .parent = TYPE_BUS,
+    .instance_init = lbus_init,
+    .instance_size = sizeof(FSILBus),
+};
+
+static void lbus_device_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->bus_type = TYPE_FSI_LBUS;
+}
+
+static const TypeInfo lbus_device_type_info = {
+    .name = TYPE_FSI_LBUS_DEVICE,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(FSILBusDevice),
+    .abstract = true,
+    .class_init = lbus_device_class_init,
+    .class_size = sizeof(FSILBusDeviceClass),
+};
+
+static void lbus_register_types(void)
+{
+    type_register_static(&lbus_info);
+    type_register_static(&lbus_device_type_info);
+}
+
+type_init(lbus_register_types);
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
index 0000000000..e650c660f0
--- /dev/null
+++ b/hw/fsi/Kconfig
@@ -0,0 +1,2 @@
+config FSI_LBUS
+    bool
diff --git a/hw/fsi/meson.build b/hw/fsi/meson.build
new file mode 100644
index 0000000000..4074d3a7d2
--- /dev/null
+++ b/hw/fsi/meson.build
@@ -0,0 +1 @@
+system_ss.add(when: 'CONFIG_FSI_LBUS', if_true: files('lbus.c'))
diff --git a/hw/fsi/trace-events b/hw/fsi/trace-events
new file mode 100644
index 0000000000..8b13789179
--- /dev/null
+++ b/hw/fsi/trace-events
@@ -0,0 +1 @@
+
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

