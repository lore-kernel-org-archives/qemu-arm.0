Received: by 2002:a17:906:c785:b0:9bd:85f7:2662 with SMTP id cw5csp510029ejb;
        Thu, 26 Oct 2023 09:49:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyb5LItZIOSVj0pK0sZk1GakTdlgZckFGdRBm7gP7Y1TnEHPSfRd8exUx+x2oVa2/Ex926
X-Received: by 2002:a81:54d5:0:b0:59f:4bc3:3e9 with SMTP id i204-20020a8154d5000000b0059f4bc303e9mr18641117ywb.46.1698338968075;
        Thu, 26 Oct 2023 09:49:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698338968; cv=none;
        d=google.com; s=arc-20160816;
        b=ONNPK059ZtrTJ+kkwPW5MZQGltkIgIF5yanadBpKpBGDdUv2ApioP9dTSbE8WwVUhE
         vVe925kCNJ64PkibTTbAeMtXHDMNZNr6c4WncmOWBdlTa65sgmnug3b70BLB4Tov0a2O
         SSsUSVWBH3MTf3aJp46ANvULltvwSRbcBtg1POhduaQxWyPEfPd3mCvtwdO/H9f+r5YG
         8slXnTfuuxWgc+GBJu+SRjZz3vd0XCYfCXwXi69uuxTUFXvQRbjN8RQRXFvanN7O1mLC
         DjlT4iQIneVIT3Nv5ikCbflFEt9byrb1oNRqfK1slCydw7Y0f+n+so4OExEMjE/CPHp/
         URtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7D1kmHpuDRH+jgshcylT18J5F4MxxfP9NPQHZBr2+h0=;
        fh=oCcW8YgO0uPSEPLT85zmruvbAEZ25ywTEvlgBH92cAY=;
        b=sXFs6dvJYpSnj7+vczc8/OGb+YfmGBdGUXIzQTyWBe55EbKy6dOeHNmMR0xVt1oOMI
         CqslShZCMRqh8/luJg+IWot/AhstXKYQptQ1QYxe7Azm/BJBcDGX+fGt+cXMuXnmeo5C
         zLJ8HAJ+AwnmY2Qi1cJXS5ukr8wBAfo06XdhWwNt66EOFUza3WL0U0irQIfBugttLdby
         FjH9eh5/CjURh53cbY9jq98wS+baIlLBfOeAYBFWSNYT51jLfSo43k6Do9ZReFFZ08on
         9t/M7q5csL0EtYOQEV7eoXbI2aGwSlMdNXsGKuliIBm917IFnxdYVC5gTNndIXbIhbCV
         aMOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=gWdjGbbB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g188-20020a0dc4c5000000b00577608f6164si14153508ywd.516.2023.10.26.09.49.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Oct 2023 09:49:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=gWdjGbbB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qw3Xk-0001pD-FI; Thu, 26 Oct 2023 12:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qw3Wj-0000pw-OG; Thu, 26 Oct 2023 12:48:09 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qw3Wf-0007p7-9G; Thu, 26 Oct 2023 12:48:08 -0400
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39QGfPt9029229; Thu, 26 Oct 2023 16:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7D1kmHpuDRH+jgshcylT18J5F4MxxfP9NPQHZBr2+h0=;
 b=gWdjGbbBuICYFbJGhnTiu2U816ynT35qIEWfywaAbaM8DLUvdKzPAFRWaP5h9+o7M2+w
 XgjIDrT+jot/zGPn2gR3HPYJeae1XrGGER9mV6qL47Yg2GnUwxJ8CAl4TqxmZeHvwXB6
 HPvn02WnmkCRahRuh9jshzjQgjsFJOqNhlg2F2bqJZyHc+ro7nMsx+g0EX0GuBVtjTPr
 WOqP+hMf0a71XtbqhjeMzQ66SHaUqdhWvSZfiFCK8U/XUVWaFj1Sm6wGLxX8mE7LsroB
 cYCU9tNBlB4PoeWEec/BUUMCTgSj1LfuFrEILFLGSGuDNQeppunODGFYM7iF1I8yLot4 XA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tyuun07e0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Oct 2023 16:47:48 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39QGh7eB002211;
 Thu, 26 Oct 2023 16:47:48 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tyuun07dk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Oct 2023 16:47:47 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39QFEOeN024365; Thu, 26 Oct 2023 16:47:47 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tvu6kf3q4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Oct 2023 16:47:47 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39QGlkRq34275804
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Oct 2023 16:47:46 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F09D5805D;
 Thu, 26 Oct 2023 16:47:46 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A6FD58043;
 Thu, 26 Oct 2023 16:47:45 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 26 Oct 2023 16:47:45 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v7 02/10] hw/fsi: Introduce IBM's scratchpad
Date: Thu, 26 Oct 2023 11:47:33 -0500
Message-Id: <20231026164741.1184058-3-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231026164741.1184058-1-ninad@linux.ibm.com>
References: <20231026164741.1184058-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J9CTFFJBgxbu3ojTAEf7Kzp6zhh3P87F
X-Proofpoint-ORIG-GUID: kAuV8QXMzq3e2pAfeCPrYbn2F79Oa4hL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-26_14,2023-10-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=945 clxscore=1015
 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 phishscore=0
 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310260145
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
X-TUID: fk/fUgQHYiUm

This is a part of patchset where scratchpad is introduced.

The scratchpad provides a set of non-functional registers. The firmware
is free to use them, hardware does not support any special management
support. The scratchpad registers can be read or written from LBUS
slave.

In this model, The LBUS device is parent for the scratchpad.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
v2:
- Incorporated Joel's review comments.
v5:
- Incorporated review comments by Cedric.
v6:
- Incorporated review comments by Daniel.
v7:
- Incorporated review comments by Philippe.
- Cleaned up unused bits.
---
 meson.build                        |  1 +
 hw/fsi/trace.h                     |  1 +
 include/hw/fsi/engine-scratchpad.h | 27 +++++++++
 include/hw/fsi/fsi.h               | 16 +++++
 hw/fsi/engine-scratchpad.c         | 93 ++++++++++++++++++++++++++++++
 hw/fsi/Kconfig                     |  4 ++
 hw/fsi/meson.build                 |  1 +
 hw/fsi/trace-events                |  2 +
 8 files changed, 145 insertions(+)
 create mode 100644 hw/fsi/trace.h
 create mode 100644 include/hw/fsi/engine-scratchpad.h
 create mode 100644 include/hw/fsi/fsi.h
 create mode 100644 hw/fsi/engine-scratchpad.c
 create mode 100644 hw/fsi/trace-events

diff --git a/meson.build b/meson.build
index dcef8b1e79..793c7c1f20 100644
--- a/meson.build
+++ b/meson.build
@@ -3257,6 +3257,7 @@ if have_system
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
diff --git a/include/hw/fsi/engine-scratchpad.h b/include/hw/fsi/engine-scratchpad.h
new file mode 100644
index 0000000000..4ffa871965
--- /dev/null
+++ b/include/hw/fsi/engine-scratchpad.h
@@ -0,0 +1,27 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2023 IBM Corp.
+ *
+ * IBM scratchpad engne
+ */
+#ifndef FSI_ENGINE_SCRATCHPAD_H
+#define FSI_ENGINE_SCRATCHPAD_H
+
+#include "hw/fsi/lbus.h"
+#include "hw/fsi/fsi.h"
+
+#define ENGINE_CONFIG_NEXT            BE_BIT(0)
+#define ENGINE_CONFIG_TYPE_PEEK       (0x02 << 4)
+#define ENGINE_CONFIG_TYPE_FSI        (0x03 << 4)
+#define ENGINE_CONFIG_TYPE_SCRATCHPAD (0x06 << 4)
+
+#define TYPE_FSI_SCRATCHPAD "fsi.scratchpad"
+#define SCRATCHPAD(obj) OBJECT_CHECK(FSIScratchPad, (obj), TYPE_FSI_SCRATCHPAD)
+
+typedef struct FSIScratchPad {
+        FSILBusDevice parent;
+
+        uint32_t reg;
+} FSIScratchPad;
+
+#endif /* FSI_ENGINE_SCRATCHPAD_H */
diff --git a/include/hw/fsi/fsi.h b/include/hw/fsi/fsi.h
new file mode 100644
index 0000000000..b08b97f62b
--- /dev/null
+++ b/include/hw/fsi/fsi.h
@@ -0,0 +1,16 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2023 IBM Corp.
+ *
+ * IBM Flexible Service Interface
+ */
+#ifndef FSI_FSI_H
+#define FSI_FSI_H
+
+#include "qemu/bitops.h"
+
+/* Bitwise operations at the word level. */
+#define BE_BIT(x)           BIT(31 - (x))
+#define BE_GENMASK(hb, lb)  MAKE_64BIT_MASK((lb), ((hb) - (lb) + 1))
+
+#endif
diff --git a/hw/fsi/engine-scratchpad.c b/hw/fsi/engine-scratchpad.c
new file mode 100644
index 0000000000..a8887cd613
--- /dev/null
+++ b/hw/fsi/engine-scratchpad.c
@@ -0,0 +1,93 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2023 IBM Corp.
+ *
+ * IBM scratchpad engine
+ */
+
+#include "qemu/osdep.h"
+
+#include "qapi/error.h"
+#include "qemu/log.h"
+#include "trace.h"
+
+#include "hw/fsi/engine-scratchpad.h"
+
+static uint64_t fsi_scratchpad_read(void *opaque, hwaddr addr, unsigned size)
+{
+    FSIScratchPad *s = SCRATCHPAD(opaque);
+
+    trace_fsi_scratchpad_read(addr, size);
+
+    if (addr) {
+        return 0;
+    }
+
+    return s->reg;
+}
+
+static void fsi_scratchpad_write(void *opaque, hwaddr addr, uint64_t data,
+                                 unsigned size)
+{
+    FSIScratchPad *s = SCRATCHPAD(opaque);
+
+    trace_fsi_scratchpad_write(addr, size, data);
+
+    if (addr) {
+        return;
+    }
+
+    s->reg = data;
+}
+
+static const struct MemoryRegionOps scratchpad_ops = {
+    .read = fsi_scratchpad_read,
+    .write = fsi_scratchpad_write,
+    .endianness = DEVICE_BIG_ENDIAN,
+};
+
+static void fsi_scratchpad_realize(DeviceState *dev, Error **errp)
+{
+    FSILBusDevice *ldev = FSI_LBUS_DEVICE(dev);
+
+    memory_region_init_io(&ldev->iomem, OBJECT(ldev), &scratchpad_ops,
+                          ldev, TYPE_FSI_SCRATCHPAD, 0x400);
+}
+
+static void fsi_scratchpad_reset(DeviceState *dev)
+{
+    FSIScratchPad *s = SCRATCHPAD(dev);
+
+    s->reg = 0;
+}
+
+static void fsi_scratchpad_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    FSILBusDeviceClass *ldc = FSI_LBUS_DEVICE_CLASS(klass);
+
+    dc->realize = fsi_scratchpad_realize;
+    dc->reset = fsi_scratchpad_reset;
+
+    ldc->config =
+          ENGINE_CONFIG_NEXT            | /* valid */
+          0x00010000                    | /* slots */
+          0x00001000                    | /* version */
+          ENGINE_CONFIG_TYPE_SCRATCHPAD | /* type */
+          0x00000007;                     /* crc */
+}
+
+static const TypeInfo fsi_scratchpad_info = {
+    .name = TYPE_FSI_SCRATCHPAD,
+    .parent = TYPE_FSI_LBUS_DEVICE,
+    .instance_size = sizeof(FSIScratchPad),
+    .class_init = fsi_scratchpad_class_init,
+    .class_size = sizeof(FSILBusDeviceClass),
+};
+
+static void fsi_scratchpad_register_types(void)
+{
+    type_register_static(&fsi_scratchpad_info);
+}
+
+type_init(fsi_scratchpad_register_types);
diff --git a/hw/fsi/Kconfig b/hw/fsi/Kconfig
index e650c660f0..f7c7fd1b28 100644
--- a/hw/fsi/Kconfig
+++ b/hw/fsi/Kconfig
@@ -1,2 +1,6 @@
+config FSI_SCRATCHPAD
+    bool
+    select FSI_LBUS
+
 config FSI_LBUS
     bool
diff --git a/hw/fsi/meson.build b/hw/fsi/meson.build
index 4074d3a7d2..d45a98c223 100644
--- a/hw/fsi/meson.build
+++ b/hw/fsi/meson.build
@@ -1 +1,2 @@
 system_ss.add(when: 'CONFIG_FSI_LBUS', if_true: files('lbus.c'))
+system_ss.add(when: 'CONFIG_FSI_SCRATCHPAD', if_true: files('engine-scratchpad.c'))
diff --git a/hw/fsi/trace-events b/hw/fsi/trace-events
new file mode 100644
index 0000000000..c5753e2791
--- /dev/null
+++ b/hw/fsi/trace-events
@@ -0,0 +1,2 @@
+fsi_scratchpad_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size=%d"
+fsi_scratchpad_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64
-- 
2.39.2

