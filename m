Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp505016ejb;
        Sat, 21 Oct 2023 14:18:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkSTqhTyUFRSxEeJqHsADt419YJJeogjjL2R3kDBWvvKBAxYE8wohQT2lzKwrW5yfXe7EZ
X-Received: by 2002:a05:622a:1904:b0:41c:d6a5:28e0 with SMTP id w4-20020a05622a190400b0041cd6a528e0mr6192707qtc.33.1697923123078;
        Sat, 21 Oct 2023 14:18:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697923123; cv=none;
        d=google.com; s=arc-20160816;
        b=hAVSb0BQNr3OKJi2raRjPVzrHMvzcaadILsGvHIOxst7ur/fQf2xGBYciI2o6qQBlG
         YYEo0wWxgVVmbLSZewPuduuwFNLPGSG6kk8kR8mTx1PId2jQG/RRVE8HgPDrPJBQW5am
         GUnvNvgoReUOyURsRCt7kkLxI69sM8v1yfWjeQUnQg+NKV2mLZE5XOOdAKJOszmW2rq0
         ZlqkrjS+rj03UttBnnshBSWpEJo/ScW8usGSC6KelVXMtRi8IcI+nADhnQ0CKlDtDMTD
         0OT/Cr2JDSiMgtI89LM6DJiA1tXSRyDzIQ43XqKTHDsgm3FKqe8aB8s5PKTxppCGWhUe
         ID6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gNLdjTTKj8rtHMa58Q4M8IorjyH/Go4ovNAXYjrzFqA=;
        fh=oCcW8YgO0uPSEPLT85zmruvbAEZ25ywTEvlgBH92cAY=;
        b=fE2MI4wBGXc0apgLDje0y1oAav5iKu4H44Kv3lgJIYMuFz7gxuenyJCNeYVbFXKloN
         jHCqnTAN0xYmUL/BoeTNjMWKZTm+qw5mhVZptMBkzsXAivj1rBqNRNe8m7u64/ZdaZKP
         /s/361KLMvAOqAEhiYmssr0IqBRGJuCYvokscTy/kL+Ak0yaWT+zcvLISU+igZrMVofr
         yufJERXGT5B5yUgaVE7z6GAam7jb9lrZNjpPscegVVtcHzgUfq5nPJNtBRocQQNfVrjO
         koRoTEFdTbukIN+5UHhDDxtTjKLawl34yud8tsEuwG4Ch3AEfyQmOv0u9DiLoBGD7Qbf
         tbAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="gYt/aq6j";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3-20020ac85803000000b00419842fb21csi3210460qtg.488.2023.10.21.14.18.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Oct 2023 14:18:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="gYt/aq6j";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quJML-00049I-SB; Sat, 21 Oct 2023 17:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1quJMJ-000487-Kr; Sat, 21 Oct 2023 17:18:11 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1quJMH-0005Wr-MC; Sat, 21 Oct 2023 17:18:11 -0400
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39LL9wGc011392; Sat, 21 Oct 2023 21:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gNLdjTTKj8rtHMa58Q4M8IorjyH/Go4ovNAXYjrzFqA=;
 b=gYt/aq6jCshrn85vIb3ECctBFW6bbJ6KJ5UwuFAtD9UkCBXXAcNRTAxO5G8qNedILEMp
 +IsK/8Wz5FraqHeQhvtuhY1euwXRT5A10PFn6NgdvaasSKyP/OzCrtt2YmD6QuvBcvC8
 emqMrnLlNAbN0cf3QaQCQMsMp5Pw6gP1P5PutAEHw7Y46J2livtlyMEClkh/hLEKv3BU
 vA3WzOqQsjfBtydWvklGvugnMCp2sM4cE47eyeB61OD+OwFC6VT76Lm3mL6GRneKbfxf
 HUEXeHMZg09CPGmQqc2bn14Z17Xkb94DsPmLHx4LjWZGCnx6xYPooYCXtcrqKvAZvxFk +A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tvpag0636-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Oct 2023 21:17:25 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39LLHPUh028741;
 Sat, 21 Oct 2023 21:17:25 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tvpag062x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Oct 2023 21:17:25 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39LKMT5A019458; Sat, 21 Oct 2023 21:17:24 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tuc45dcet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Oct 2023 21:17:24 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39LLHNg927001378
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 21 Oct 2023 21:17:23 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6636358065;
 Sat, 21 Oct 2023 21:17:23 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B7FF58067;
 Sat, 21 Oct 2023 21:17:23 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Sat, 21 Oct 2023 21:17:22 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v6 01/10] hw/fsi: Introduce IBM's Local bus
Date: Sat, 21 Oct 2023 16:17:10 -0500
Message-Id: <20231021211720.3571082-2-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231021211720.3571082-1-ninad@linux.ibm.com>
References: <20231021211720.3571082-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JGRHo7PQ_896B7AMZzaIJmaug8UJmdIy
X-Proofpoint-GUID: LnkW9fnshUav3kJWUEsQvRr_QeiJvSlV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-21_13,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310210195
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: mhe7jbEAxaWy

This is a part of patchset where IBM's Flexible Service Interface is
introduced.

The LBUS is modelled to maintain the qdev bus hierarchy and to take
advantage of the object model to automatically generate the CFAM
configuration block. The configuration block presents engines in the
order they are attached to the CFAM's LBUS. Engine implementations
should subclass the LBusDevice and set the 'config' member of
LBusDeviceClass to match the engine's type.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
v2:
- Incorporated Joel's review comments.
v5:
- Incorporated review comments by Cedric.
v6:
- Incorporated review comments by Cedric & Daniel.
---
 include/hw/fsi/lbus.h | 43 ++++++++++++++++++++++++
 hw/fsi/lbus.c         | 76 +++++++++++++++++++++++++++++++++++++++++++
 hw/Kconfig            |  1 +
 hw/fsi/Kconfig        |  2 ++
 hw/fsi/meson.build    |  1 +
 hw/meson.build        |  1 +
 6 files changed, 124 insertions(+)
 create mode 100644 include/hw/fsi/lbus.h
 create mode 100644 hw/fsi/lbus.c
 create mode 100644 hw/fsi/Kconfig
 create mode 100644 hw/fsi/meson.build

diff --git a/include/hw/fsi/lbus.h b/include/hw/fsi/lbus.h
new file mode 100644
index 0000000000..4fa696bbdb
--- /dev/null
+++ b/include/hw/fsi/lbus.h
@@ -0,0 +1,43 @@
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
+#define FSI_LBUSDEV_IOMEM_SIZE    0x400
+
+typedef struct FSILBusDevice {
+    DeviceState parent;
+
+    MemoryRegion iomem;
+    uint32_t address;
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
+DeviceState *lbus_create_device(FSILBus *bus, const char *type, uint32_t addr);
+int lbus_add_device(FSILBus *bus, FSILBusDevice *dev);
+#endif /* FSI_LBUS_H */
diff --git a/hw/fsi/lbus.c b/hw/fsi/lbus.c
new file mode 100644
index 0000000000..50d926dbe2
--- /dev/null
+++ b/hw/fsi/lbus.c
@@ -0,0 +1,76 @@
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
+                       FSI_LBUS_MEM_REGION_SIZE - FSI_LBUSDEV_IOMEM_SIZE);
+}
+
+static const TypeInfo lbus_info = {
+    .name = TYPE_FSI_LBUS,
+    .parent = TYPE_BUS,
+    .instance_init = lbus_init,
+    .instance_size = sizeof(FSILBus),
+};
+
+static Property lbus_device_props[] = {
+    DEFINE_PROP_UINT32("address", FSILBusDevice, address, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+DeviceState *lbus_create_device(FSILBus *bus, const char *type, uint32_t addr)
+{
+    DeviceState *ds;
+    BusState *state = BUS(bus);
+    FSILBusDevice *dev;
+
+    ds = qdev_new(type);
+    qdev_prop_set_uint8(ds, "address", addr);
+    qdev_realize_and_unref(ds, state, &error_fatal);
+
+    dev = FSI_LBUS_DEVICE(ds);
+    memory_region_add_subregion(&bus->mr, dev->address,
+                                &dev->iomem);
+
+    qdev_set_parent_bus(ds, state, &error_abort);
+
+    return ds;
+}
+
+static void lbus_device_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->bus_type = TYPE_FSI_LBUS;
+    device_class_set_props(dc, lbus_device_props);
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

