Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1348933ejs;
        Wed, 10 Jan 2024 15:17:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFqtHq+fOovHmn8IVGUbQQfXzgfG5eWf78mqTKSx653ELSZWowk2BLLGrktOF45LCk6o1q
X-Received: by 2002:a05:620a:2e6:b0:783:3a93:be40 with SMTP id a6-20020a05620a02e600b007833a93be40mr431776qko.80.1704928667926;
        Wed, 10 Jan 2024 15:17:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704928667; cv=none;
        d=google.com; s=arc-20160816;
        b=oEhrbXq1DHdnUgYQT3EFwsEgiQWvVUYK6ic6sep4G1VkvrhtA3GvqaGkld4oZpJaen
         sm/J9sHAY574qGUKl2uJn7gNCpo8i91pN5/A0pCGHHVU2pXV8n9MSsCYN5oNfAlVByTM
         kpZ0QoO4MbLed4w1SjozAn00lhAJkzLhhqt7GG29f/FJJf5zeXxOX8q4V5MXxibpKw9o
         aYp60uUK+yvTf0HDg4rE/GHmVDdXsYU/afRZNh0EcntxMu7QhpKvagWYdhSC4d8YBvRF
         OEJsk4BKHHx/ZB4dX1gH3rqYQcTTPOgfIMiC0jOtiVmpBjasvJJH9fYazCJP+3xE/s4R
         iNUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qsfsRsx6c5E8TZMsPywOQDc2/JzP/HrePZmDaK29YXc=;
        fh=oCcW8YgO0uPSEPLT85zmruvbAEZ25ywTEvlgBH92cAY=;
        b=G/Xxxwe+Itxr7SZrSzFyLJ7PLq/ECb2LiCgZJjReG351oLryiHfNiSxbchVQU2rlek
         ccZrnh6AhRhx0RvXVaQBXV1NeVydtjALqBb+lwfhj78COdt8YNDUGOl+Kuk5FJ3NK9Nx
         l5Md3XnsqCHS7oUUla67meCOXU1vp6q6gU6jdysTOytMxcaqGWAPJm92HmRPaVMhvE0q
         toWUfY1eeWbOgswOOSAPQncQwORgdiu/Ve//7ekRo5C343D+09U8N4iJwFtprO2gTOUo
         2mJupHv3qzsC+whOlxQ1GA9TxlK6/8+KElYm8BiZNkRCE7agCb2wuICiT2uouQ6gbKWK
         Ebwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=MvWan5No;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11-20020a05620a28cb00b0078335200e7bsi2562453qkp.559.2024.01.10.15.17.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jan 2024 15:17:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=MvWan5No;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rNhnu-0007JH-Hb; Wed, 10 Jan 2024 18:16:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rNhnr-0007Ib-Jv; Wed, 10 Jan 2024 18:16:07 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rNhnp-0001ff-Ay; Wed, 10 Jan 2024 18:16:07 -0500
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 40AMxsUK008723; Wed, 10 Jan 2024 23:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=qsfsRsx6c5E8TZMsPywOQDc2/JzP/HrePZmDaK29YXc=;
 b=MvWan5NoL6SrAg3gaOP3CLzyfYQjfrefWTIvfTNz/E8Mpg1Ztt8TK0r1zTIH6tVIQ1HB
 eZXCWcD8x7w6kBBdTA1MOBH7rGbCP03aDbA7ZekhXLAmSJH7ZbL1yAjBSj9RLejvhB7M
 ihj8/e0MWEC55CLX3CAzsrADpz5irDdKGm0o1iNk1KJ33RZK7Ufolaw2obhQNxfB0blG
 Uqs3SEHx/2fgsvBuZDLbm7Clh5HpH8kSKhPhnRK6IFIje9UI6CbYI38SdOycl72RZBaJ
 ZVHdm1vw15mAtb+QQ9GiIcBB9gyk7vw0EKuyRx8tJviwMubqzr29fAB7yY1EF/7af3fx VQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vj3txs766-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jan 2024 23:15:42 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40AN13tq013608;
 Wed, 10 Jan 2024 23:15:42 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vj3txs75r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jan 2024 23:15:41 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 40AJeGBv027026; Wed, 10 Jan 2024 23:15:41 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vfkw27nxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jan 2024 23:15:41 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 40ANFeD238994492
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jan 2024 23:15:40 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B78C858065;
 Wed, 10 Jan 2024 23:15:40 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5951958069;
 Wed, 10 Jan 2024 23:15:40 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 10 Jan 2024 23:15:40 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v10 3/9] hw/fsi: Introduce IBM's cfam
Date: Wed, 10 Jan 2024 17:15:31 -0600
Message-Id: <20240110231537.1654478-4-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240110231537.1654478-1-ninad@linux.ibm.com>
References: <20240110231537.1654478-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nI6fU2r0bhTRRoGsR52xN4hEXiJUX8V9
X-Proofpoint-ORIG-GUID: YwVtycCRX7owQRP1tV2JG9VjPB5WwdKM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-10_12,2024-01-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=829 adultscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2401100183
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
X-TUID: 3FXJAXHm5Jr5

This is a part of patchset where IBM's Flexible Service Interface is
introduced.

The Common FRU Access Macro (CFAM), an address space containing
various "engines" that drive accesses on busses internal and external
to the POWER chip. Examples include the SBEFIFO and I2C masters. The
engines hang off of an internal Local Bus (LBUS) which is described
by the CFAM configuration block.

[ clg: - moved object FSIScratchPad under FSICFAMState
       - moved FSIScratchPad code under cfam.c
       - introduced fsi_cfam_instance_init()
       - reworked fsi_cfam_realize() ]

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
v9:
  - Added more registers to scratchpad
  - Removed unnecessary address space
  - Removed unnecessary header file
  - Defined macros for config values.
  - Cleaned up cfam config read.
---
 include/hw/fsi/cfam.h |  34 ++++++++
 hw/fsi/cfam.c         | 182 ++++++++++++++++++++++++++++++++++++++++++
 hw/fsi/meson.build    |   2 +-
 hw/fsi/trace-events   |   5 ++
 4 files changed, 222 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/fsi/cfam.h
 create mode 100644 hw/fsi/cfam.c

diff --git a/include/hw/fsi/cfam.h b/include/hw/fsi/cfam.h
new file mode 100644
index 0000000000..bba5e3323a
--- /dev/null
+++ b/include/hw/fsi/cfam.h
@@ -0,0 +1,34 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2023 IBM Corp.
+ *
+ * IBM Common FRU Access Macro
+ */
+#ifndef FSI_CFAM_H
+#define FSI_CFAM_H
+
+#include "exec/memory.h"
+
+#include "hw/fsi/fsi.h"
+#include "hw/fsi/lbus.h"
+
+#define TYPE_FSI_CFAM "cfam"
+#define FSI_CFAM(obj) OBJECT_CHECK(FSICFAMState, (obj), TYPE_FSI_CFAM)
+
+/* P9-ism */
+#define CFAM_CONFIG_NR_REGS 0x28
+
+typedef struct FSICFAMState {
+    /* < private > */
+    FSISlaveState parent;
+
+    /* CFAM config address space */
+    MemoryRegion config_iomem;
+
+    MemoryRegion mr;
+
+    FSILBus lbus;
+    FSIScratchPad scratchpad;
+} FSICFAMState;
+
+#endif /* FSI_CFAM_H */
diff --git a/hw/fsi/cfam.c b/hw/fsi/cfam.c
new file mode 100644
index 0000000000..d9ed1b532a
--- /dev/null
+++ b/hw/fsi/cfam.c
@@ -0,0 +1,182 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2023 IBM Corp.
+ *
+ * IBM Common FRU Access Macro
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+
+#include "qapi/error.h"
+#include "trace.h"
+
+#include "hw/fsi/cfam.h"
+#include "hw/fsi/fsi.h"
+
+#include "hw/qdev-properties.h"
+
+#define ENGINE_CONFIG_NEXT            BE_BIT(0)
+#define ENGINE_CONFIG_TYPE_PEEK       (0x02 << 4)
+#define ENGINE_CONFIG_TYPE_FSI        (0x03 << 4)
+#define ENGINE_CONFIG_TYPE_SCRATCHPAD (0x06 << 4)
+
+/* Valid, slots, version, type, crc */
+#define CFAM_CONFIG_REG_PEEK               (ENGINE_CONFIG_NEXT       | \
+                                            0x00010000               | \
+                                            0x00001000               | \
+                                            ENGINE_CONFIG_TYPE_PEEK  | \
+                                            0x0000000c)
+
+/* Valid, slots, version, type, crc */
+#define CFAM_CONFIG_REG_FSI_SLAVE          (ENGINE_CONFIG_NEXT       | \
+                                            0x00010000               | \
+                                            0x00005000               | \
+                                            ENGINE_CONFIG_TYPE_FSI   | \
+                                            0x0000000a)
+
+/* Valid, slots, version, type, crc */
+#define CFAM_CONFIG_REG_SCRATCHPAD         (ENGINE_CONFIG_NEXT       | \
+                                            0x00010000               | \
+                                            0x00001000               | \
+                                            ENGINE_CONFIG_TYPE_SCRATCHPAD | \
+                                            0x00000007)
+
+#define TO_REG(x)                          ((x) >> 2)
+
+#define CFAM_CONFIG_CHIP_ID                TO_REG(0x00)
+#define CFAM_CONFIG_PEEK_STATUS            TO_REG(0x04)
+#define CFAM_CONFIG_CHIP_ID_P9             0xc0022d15
+#define CFAM_CONFIG_CHIP_ID_BREAK          0xc0de0000
+
+static uint64_t fsi_cfam_config_read(void *opaque, hwaddr addr, unsigned size)
+{
+    trace_fsi_cfam_config_read(addr, size);
+
+    switch (addr) {
+    case 0x00:
+        return CFAM_CONFIG_CHIP_ID_P9;
+    case 0x04:
+        return CFAM_CONFIG_REG_PEEK;
+    case 0x08:
+        return CFAM_CONFIG_REG_FSI_SLAVE;
+    case 0xc:
+        return CFAM_CONFIG_REG_SCRATCHPAD;
+    default:
+        /*
+         * The config table contains different engines from 0xc onwards.
+         * The scratch pad is already added at address 0xc. We need to add
+         * future engines from address 0x10 onwards. Returning 0 as engine
+         * is not implemented.
+         */
+        return 0;
+    }
+}
+
+static void fsi_cfam_config_write(void *opaque, hwaddr addr, uint64_t data,
+                                  unsigned size)
+{
+    FSICFAMState *cfam = FSI_CFAM(opaque);
+
+    trace_fsi_cfam_config_write(addr, size, data);
+
+    switch (TO_REG(addr)) {
+    case CFAM_CONFIG_CHIP_ID:
+    case CFAM_CONFIG_PEEK_STATUS:
+        if (data == CFAM_CONFIG_CHIP_ID_BREAK) {
+            bus_cold_reset(BUS(&cfam->lbus));
+        }
+        break;
+    default:
+        trace_fsi_cfam_config_write_noaddr(addr, size, data);
+    }
+}
+
+static const struct MemoryRegionOps cfam_config_ops = {
+    .read = fsi_cfam_config_read,
+    .write = fsi_cfam_config_write,
+    .valid.max_access_size = 4,
+    .valid.min_access_size = 4,
+    .impl.max_access_size = 4,
+    .impl.min_access_size = 4,
+    .endianness = DEVICE_BIG_ENDIAN,
+};
+
+static uint64_t fsi_cfam_unimplemented_read(void *opaque, hwaddr addr,
+                                            unsigned size)
+{
+    trace_fsi_cfam_unimplemented_read(addr, size);
+
+    return 0;
+}
+
+static void fsi_cfam_unimplemented_write(void *opaque, hwaddr addr,
+                                         uint64_t data, unsigned size)
+{
+    trace_fsi_cfam_unimplemented_write(addr, size, data);
+}
+
+static const struct MemoryRegionOps fsi_cfam_unimplemented_ops = {
+    .read = fsi_cfam_unimplemented_read,
+    .write = fsi_cfam_unimplemented_write,
+    .endianness = DEVICE_BIG_ENDIAN,
+};
+
+static void fsi_cfam_instance_init(Object *obj)
+{
+    FSICFAMState *s = FSI_CFAM(obj);
+
+    object_initialize_child(obj, "scratchpad", &s->scratchpad,
+                            TYPE_FSI_SCRATCHPAD);
+}
+
+static void fsi_cfam_realize(DeviceState *dev, Error **errp)
+{
+    FSICFAMState *cfam = FSI_CFAM(dev);
+    FSISlaveState *slave = FSI_SLAVE(dev);
+
+    /* Each slave has a 2MiB address space */
+    memory_region_init_io(&cfam->mr, OBJECT(cfam), &fsi_cfam_unimplemented_ops,
+                          cfam, TYPE_FSI_CFAM, 2 * MiB);
+
+    qbus_init(&cfam->lbus, sizeof(cfam->lbus), TYPE_FSI_LBUS, DEVICE(cfam),
+              NULL);
+
+    memory_region_init_io(&cfam->config_iomem, OBJECT(cfam), &cfam_config_ops,
+                          cfam, TYPE_FSI_CFAM ".config", 0x400);
+
+    memory_region_add_subregion(&cfam->mr, 0, &cfam->config_iomem);
+    memory_region_add_subregion(&cfam->mr, 0x800, &slave->iomem);
+    memory_region_add_subregion(&cfam->mr, 0xc00, &cfam->lbus.mr);
+
+    /* Add scratchpad engine */
+    if (!qdev_realize(DEVICE(&cfam->scratchpad), BUS(&cfam->lbus),
+                                errp)) {
+        return;
+    }
+
+    FSILBusDevice *fsi_dev = FSI_LBUS_DEVICE(&cfam->scratchpad);
+    memory_region_add_subregion(&cfam->lbus.mr, 0, &fsi_dev->iomem);
+}
+
+static void fsi_cfam_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->bus_type = TYPE_FSI_BUS;
+    dc->realize = fsi_cfam_realize;
+}
+
+static const TypeInfo fsi_cfam_info = {
+    .name = TYPE_FSI_CFAM,
+    .parent = TYPE_FSI_SLAVE,
+    .instance_init = fsi_cfam_instance_init,
+    .instance_size = sizeof(FSICFAMState),
+    .class_init = fsi_cfam_class_init,
+};
+
+static void fsi_cfam_register_types(void)
+{
+    type_register_static(&fsi_cfam_info);
+}
+
+type_init(fsi_cfam_register_types);
diff --git a/hw/fsi/meson.build b/hw/fsi/meson.build
index 574f5f9289..96403d4efc 100644
--- a/hw/fsi/meson.build
+++ b/hw/fsi/meson.build
@@ -1 +1 @@
-system_ss.add(when: 'CONFIG_FSI', if_true: files('lbus.c','fsi.c'))
+system_ss.add(when: 'CONFIG_FSI', if_true: files('lbus.c','fsi.c','cfam.c'))
diff --git a/hw/fsi/trace-events b/hw/fsi/trace-events
index 8f29adb7df..b542956fb3 100644
--- a/hw/fsi/trace-events
+++ b/hw/fsi/trace-events
@@ -2,3 +2,8 @@ fsi_scratchpad_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size=%d"
 fsi_scratchpad_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64
 fsi_slave_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size=%d"
 fsi_slave_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64
+fsi_cfam_config_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size=%d"
+fsi_cfam_config_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64
+fsi_cfam_unimplemented_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size=%d"
+fsi_cfam_unimplemented_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64
+fsi_cfam_config_write_noaddr(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64
-- 
2.39.2

