Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp4063855ejc;
        Tue, 29 Aug 2023 19:27:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGF6a6EdwuxMlhGIjHsYSBbAKrfFw7S06Ymiwhv8kfS4f5YOGFkQAUk+cR/onYdoSillM7j
X-Received: by 2002:a05:622a:1823:b0:412:1c40:729d with SMTP id t35-20020a05622a182300b004121c40729dmr1018281qtc.39.1693362437482;
        Tue, 29 Aug 2023 19:27:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693362437; cv=none;
        d=google.com; s=arc-20160816;
        b=zqVkardMV+vZ3GlUNlGcZJgLOH8DCqpryh1S1VGn1yrR71y/AenAnHJMYI2z5jUS6g
         wjBhqbryQnEpS6hK8g5OP+E/4Wxb9rZLfKjOYxXCYp/+9jFhnf7KW5NjtwXtqcclOyJq
         qmxCq2GCZ1LhvDGgNuGaa/fJtkJKNpsfmHMEk7zio41MxzX9kAq4XtKlWWNYOaakWk6w
         VS3FwYxJY9Sx/yyW5kQT0+woM1ergaQRcE0KRnwjwR8j27jrLJZxsjzvUrZ6lfNBv0DE
         bKIQPtrPS9/gg3QzV3o9YS2PAQGQtpcO2U+0hVNh0VM9V4Gm1BEprXMuZAV2hV7iOzQC
         UlaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7Gpf+3wqZx8nzNJ7ghjnvFM+NPMARlI5xq84sXTSpgg=;
        fh=/Ww3feT/iFt+UtShtcSrm/ZkK0mSMJwi4QyqgqL+GT0=;
        b=RyC319b3OOrpiHXk60TgxM+hK3eKEfPgfgwq0LZPhc70Y6WqX98dTTXx6h1/2MPJch
         Xm5puLU2GMOnZLx8OJGoIwHjh/91aGU9R5NiVNXQyQeb8RO/7citFVnCt/8VxpZSuw33
         ALnUghdvPlAPCjpk6k9DpAyQimHJvbJ7IOOAnmY8YHCB4yYQ2sGo4WAV/vFMTzh36+gI
         h384iBvFRiWyFWhRK/tX16RjsvQBTTWUaA3fomw/NlVvvMjWVHyf4xpcRG78tdqxBpl8
         pAL39g955m1lpppU4HQPJtYRU0Bl16tVSLqkf6y4rrFcfJACJU+Blf6pg3F/O1NmxPcu
         KHjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=RYI6BlRs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020ac85944000000b00403baeb5dd0si7041845qtz.481.2023.08.29.19.27.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 19:27:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=RYI6BlRs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbAvF-0002do-39; Tue, 29 Aug 2023 22:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qbAvA-0002Xj-Qu; Tue, 29 Aug 2023 22:27:04 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qbAv5-0002Co-6N; Tue, 29 Aug 2023 22:27:03 -0400
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37U29Dhe020814; Wed, 30 Aug 2023 02:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=7Gpf+3wqZx8nzNJ7ghjnvFM+NPMARlI5xq84sXTSpgg=;
 b=RYI6BlRsZkZ9icCkUU6uS5wPxaR3GT1cOlAGmhWV9vbpG2jmKjO6UsxIh3SsdccnRPFb
 lP6cRiEyMPR9BM9FVrRRGkyFPCckvP7FEP7pG5nnKGQCaeej1FWpnsQ2kOEI/4zC8ovx
 IrLOmsCMBeCzkWV/kXrzLSRa8WwswpvsEq68n2EiNvsa2NoPgPV4CDJlLjOBlpglbw7X
 EX/E0NNDKLue7Fsxg6S28Eb2PapAG6PiuGfkrZcze+gQSq+Ot2M+YFGHur/8o1wct0Fd
 ntKYC8R9NFsVwlLLIivXiK9n7v35bacAjjwU8nHYxkXkFoE4UUYRQE95GdgqKqt14aFO Yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ssu57sxhj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 02:26:45 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37U2CuGO000644;
 Wed, 30 Aug 2023 02:26:45 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ssu57sxh9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 02:26:44 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 37U1TLEo014115; Wed, 30 Aug 2023 02:26:44 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sqwxk00cb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 02:26:44 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 37U2QhGr33948054
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Aug 2023 02:26:43 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87FEC58050;
 Wed, 30 Aug 2023 02:26:43 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBDB058056;
 Wed, 30 Aug 2023 02:26:42 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 30 Aug 2023 02:26:42 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org
Subject: [PATCH v3 1/8] hw/fsi: Introduce IBM's Local bus
Date: Tue, 29 Aug 2023 21:26:31 -0500
Message-Id: <20230830022638.4183766-2-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230830022638.4183766-1-ninad@linux.ibm.com>
References: <20230830022638.4183766-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: axKzhnzasZuWvenNy-phLg6IZNZQ7CTF
X-Proofpoint-ORIG-GUID: rY3BLrBRJzd16Ce1jig67Fs2-dIuP2tG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300017
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
X-TUID: k/tiiSC1E3QR

This is a part of patchset where IBM's Flexible Service Interface is
introduced.

The LBUS is modelled to maintain the qdev bus hierarchy and to take
advantage of the object model to automatically generate the CFAM
configuration block. The configuration block presents engines in the
order they are attached to the CFAM's LBUS. Engine implementations
should subclass the LBusDevice and set the 'config' member of
LBusDeviceClass to match the engine's type.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
v2:
- Incorporated Joel's review comments.
---
 hw/Kconfig            |  1 +
 hw/fsi/Kconfig        |  2 +
 hw/fsi/lbus.c         | 94 +++++++++++++++++++++++++++++++++++++++++++
 hw/fsi/meson.build    |  1 +
 hw/meson.build        |  1 +
 include/hw/fsi/lbus.h | 48 ++++++++++++++++++++++
 include/qemu/bitops.h |  6 +++
 7 files changed, 153 insertions(+)
 create mode 100644 hw/fsi/Kconfig
 create mode 100644 hw/fsi/lbus.c
 create mode 100644 hw/fsi/meson.build
 create mode 100644 include/hw/fsi/lbus.h

diff --git a/hw/Kconfig b/hw/Kconfig
index ba62ff6417..2ccb73add5 100644
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
index 0000000000..687449e14e
--- /dev/null
+++ b/hw/fsi/Kconfig
@@ -0,0 +1,2 @@
+config LBUS
+    bool
diff --git a/hw/fsi/lbus.c b/hw/fsi/lbus.c
new file mode 100644
index 0000000000..afb26ef7ea
--- /dev/null
+++ b/hw/fsi/lbus.c
@@ -0,0 +1,94 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2023 IBM Corp.
+ *
+ * IBM Local bus where FSI slaves are connected
+ */
+
+#include "qemu/osdep.h"
+
+#include "qapi/error.h"
+#include "qemu/log.h"
+
+#include "hw/fsi/lbus.h"
+
+#include "hw/qdev-properties.h"
+
+static void lbus_realize(BusState *bus, Error **errp)
+{
+    LBusNode *node;
+    LBus *lbus = LBUS(bus);
+
+    memory_region_init(&lbus->mr, OBJECT(lbus), TYPE_LBUS,
+                       (2 * 1024 * 1024) - 0x400);
+
+    QLIST_FOREACH(node, &lbus->devices, next) {
+        memory_region_add_subregion(&lbus->mr, node->ldev->address,
+                                    &node->ldev->iomem);
+    }
+}
+
+static void lbus_init(Object *o)
+{
+}
+
+static void lbus_class_init(ObjectClass *klass, void *data)
+{
+    BusClass *k = BUS_CLASS(klass);
+    k->realize = lbus_realize;
+}
+
+static const TypeInfo lbus_info = {
+    .name = TYPE_LBUS,
+    .parent = TYPE_BUS,
+    .instance_init = lbus_init,
+    .instance_size = sizeof(LBus),
+    .class_init = lbus_class_init,
+};
+
+static Property lbus_device_props[] = {
+    DEFINE_PROP_UINT32("address", LBusDevice, address, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+DeviceState *lbus_create_device(LBus *bus, const char *type, uint32_t addr)
+{
+    DeviceState *dev;
+    LBusNode *node;
+
+    dev = qdev_new(type);
+    qdev_prop_set_uint8(dev, "address", addr);
+    qdev_realize_and_unref(dev, &bus->bus, &error_fatal);
+
+    /* Move to post_load */
+    node = g_malloc(sizeof(struct LBusNode));
+    node->ldev = LBUS_DEVICE(dev);
+    QLIST_INSERT_HEAD(&bus->devices, node, next);
+
+    return dev;
+}
+
+static void lbus_device_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->bus_type = TYPE_LBUS;
+    device_class_set_props(dc, lbus_device_props);
+}
+
+static const TypeInfo lbus_device_type_info = {
+    .name = TYPE_LBUS_DEVICE,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(LBusDevice),
+    .abstract = true,
+    .class_init = lbus_device_class_init,
+    .class_size = sizeof(LBusDeviceClass),
+};
+
+static void lbus_register_types(void)
+{
+    type_register_static(&lbus_info);
+    type_register_static(&lbus_device_type_info);
+}
+
+type_init(lbus_register_types);
diff --git a/hw/fsi/meson.build b/hw/fsi/meson.build
new file mode 100644
index 0000000000..e1007d5fea
--- /dev/null
+++ b/hw/fsi/meson.build
@@ -0,0 +1 @@
+system_ss.add(when: 'CONFIG_LBUS', if_true: files('lbus.c'))
diff --git a/hw/meson.build b/hw/meson.build
index c7ac7d3d75..6c71ee9cfa 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -43,6 +43,7 @@ subdir('virtio')
 subdir('watchdog')
 subdir('xen')
 subdir('xenpv')
+subdir('fsi')
 
 subdir('alpha')
 subdir('arm')
diff --git a/include/hw/fsi/lbus.h b/include/hw/fsi/lbus.h
new file mode 100644
index 0000000000..fafc065178
--- /dev/null
+++ b/include/hw/fsi/lbus.h
@@ -0,0 +1,48 @@
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
+#define TYPE_LBUS_DEVICE "lbus.device"
+OBJECT_DECLARE_TYPE(LBusDevice, LBusDeviceClass, LBUS_DEVICE)
+
+typedef struct LBusDevice {
+    DeviceState parent;
+
+    MemoryRegion iomem;
+    uint32_t address;
+} LBusDevice;
+
+typedef struct LBusDeviceClass {
+    DeviceClass parent;
+
+    uint32_t config;
+} LBusDeviceClass;
+
+typedef struct LBusNode {
+    LBusDevice *ldev;
+
+    QLIST_ENTRY(LBusNode) next;
+} LBusNode;
+
+#define TYPE_LBUS "lbus"
+OBJECT_DECLARE_SIMPLE_TYPE(LBus, LBUS)
+
+typedef struct LBus {
+    BusState bus;
+
+    MemoryRegion mr;
+
+    QLIST_HEAD(, LBusNode) devices;
+} LBus;
+
+DeviceState *lbus_create_device(LBus *bus, const char *type, uint32_t addr);
+int lbus_add_device(LBus *bus, LBusDevice *dev);
+#endif /* FSI_LBUS_H */
diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index cb3526d1f4..e12496f619 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -618,4 +618,10 @@ static inline uint64_t half_unshuffle64(uint64_t x)
     return x;
 }
 
+/* Bitwise operations at the word level. */
+#define BE_BIT(x)                          BIT(31 - (x))
+#define GENMASK(t, b) \
+    (((1ULL << ((t) + 1)) - 1) & ~((1ULL << (b)) - 1))
+#define BE_GENMASK(t, b)                   GENMASK(BE_BIT(t), BE_BIT(b))
+
 #endif
-- 
2.39.2

