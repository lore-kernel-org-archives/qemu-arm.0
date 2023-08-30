Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp4063927ejc;
        Tue, 29 Aug 2023 19:27:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmY7s2wqxV3zoy/XXjew+p+Yesv2CSBhXaf0Ah/M9GYUPlRqTQdOg/BrzsluMZUSmTIory
X-Received: by 2002:a05:622a:1445:b0:401:e2b1:d28d with SMTP id v5-20020a05622a144500b00401e2b1d28dmr948035qtx.20.1693362446295;
        Tue, 29 Aug 2023 19:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693362446; cv=none;
        d=google.com; s=arc-20160816;
        b=q7iN+vhS7Sd8LuN1gEKSj/vhSp0CMBJ973S6uAe3ceUa0J2epAGzfQNSqHs1EU+8Vb
         Q/B168yuoxNJWofahdzbbpA1ZlvMHuLtPqRLRUm4vkcedvCPvtUIy9qm5gmLirjWRuj7
         MKo0HOuiT5PcnpONTtfj59sAXUNe5AV3PwmSMzMqFo3mEd5vvUhwS9pUVYj3Osyz1W8P
         ycPopskKGvRFb76+dd5TbrU/FW7cah+N4C3J1BorYJ+cJlDv2CrrWJgFKjXYz2opMkML
         AGFI06L8AeJXM3FnGmZnxFbct3BLPC1gx/4mNd4lv4cNMiDHVXDf22VGFU6+k+UfQfgD
         c82A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UxNaDgMrqTxRDdabXe2ADM5wu1MC/WhedZWCORt64dM=;
        fh=/Ww3feT/iFt+UtShtcSrm/ZkK0mSMJwi4QyqgqL+GT0=;
        b=QDd7q4JYJvWsRP1O1ApxiS133dYxisNBTW3W0mCU97ayuHoJ09MBmj6ZBBmxNS9CGD
         ydFDvlatEyUkbOvAAojXgYM2nYUNxe8W4v5K9EWmCyPJF3UBOzrulUSuabz3yRv5j8QH
         Fmo+FJJhpk6e+VSWKo4vehfdO6I966iJQQpbTpad64jfQoHw+7yDyMcL8nZK1LTlzptM
         S4q4Y3xJ6u0EVjzZjhX5jni+3HqZJAov+ouRwMlCHmoeuDmSA2fDw+CRgU5SXaT46xqo
         PPexuVdt58ONvteFtRE2QZUSBl1Ch4C1yPdl8svnwEuWXhXAv1SdKpmRCMosotJY9xDS
         d6eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="QXKRWLk/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020ac85904000000b004120eeb0619si6662487qty.337.2023.08.29.19.27.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 19:27:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="QXKRWLk/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbAvO-0002tT-TY; Tue, 29 Aug 2023 22:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qbAvH-0002gM-Uk; Tue, 29 Aug 2023 22:27:12 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qbAvD-0002GT-CR; Tue, 29 Aug 2023 22:27:10 -0400
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37U2C4n5003379; Wed, 30 Aug 2023 02:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=UxNaDgMrqTxRDdabXe2ADM5wu1MC/WhedZWCORt64dM=;
 b=QXKRWLk/AyC/all4LKkgFfr2OjBQ24fsxmF9e5A4ot19DGg4AgcePreghtaquYVjNA+M
 zqWIGuDJbCRexT9g9MFPphNBMBAWcXgh4TyJTxfAWYDTOjMiIIkeHqnvVZGOq32J/Zp4
 2gBD5DijFO0JFMh4iJfJ28HaITVCfMxCwV1DE9qYER5pKI+RIKyb91xtWeHQ3v9LOsqa
 csDIV2MeM9Dd6s8pkUbqLw0Zt0jbiXGy0qDZ4apevTMofqckRgPKZicKQz+tYCmOG9L4
 q8PYfSFuePcbpKuPrrfsyCW4UCrOI8z6Dsd4dkn0hbtJUDGHL2o1zQIjwtz9oqr/g+QD 3w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ssvs8891t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 02:26:47 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37U2CESP003487;
 Wed, 30 Aug 2023 02:26:46 GMT
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ssvs8891a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 02:26:46 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 37U2NwPs020543; Wed, 30 Aug 2023 02:26:44 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sqv3ygm75-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 02:26:44 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 37U2Qiob66716100
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Aug 2023 02:26:44 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B8EB5805E;
 Wed, 30 Aug 2023 02:26:44 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F35B58056;
 Wed, 30 Aug 2023 02:26:43 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 30 Aug 2023 02:26:43 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org
Subject: [PATCH v3 2/8] hw/fsi: Introduce IBM's scratchpad
Date: Tue, 29 Aug 2023 21:26:32 -0500
Message-Id: <20230830022638.4183766-3-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230830022638.4183766-1-ninad@linux.ibm.com>
References: <20230830022638.4183766-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vyGJvOl8UxIx3of_SKL0qFWU2hgt8iqE
X-Proofpoint-GUID: bCSlmpV1aO3n4jhH-tQxpNZy377r9djv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=703 bulkscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300017
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ninad@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
X-TUID: YYKk0QniJx6L

This is a part of patchset where IBM's Flexible Service Interface is
introduced.

The LBUS device is embeded inside the scratchpad. The scratchpad
provides a non-functional registers. There is a 1-1 relation between
scratchpad and LBUS devices. Each LBUS device has 1K memory mapped in
the LBUS.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
v2:
- Incorporated Joel's review comments.
---
 hw/fsi/Kconfig                     |   4 ++
 hw/fsi/engine-scratchpad.c         | 100 +++++++++++++++++++++++++++++
 hw/fsi/meson.build                 |   1 +
 include/hw/fsi/engine-scratchpad.h |  33 ++++++++++
 4 files changed, 138 insertions(+)
 create mode 100644 hw/fsi/engine-scratchpad.c
 create mode 100644 include/hw/fsi/engine-scratchpad.h

diff --git a/hw/fsi/Kconfig b/hw/fsi/Kconfig
index 687449e14e..2a9c49f2c9 100644
--- a/hw/fsi/Kconfig
+++ b/hw/fsi/Kconfig
@@ -1,2 +1,6 @@
+config SCRATCHPAD
+    bool
+    select LBUS
+
 config LBUS
     bool
diff --git a/hw/fsi/engine-scratchpad.c b/hw/fsi/engine-scratchpad.c
new file mode 100644
index 0000000000..15a8f8cc66
--- /dev/null
+++ b/hw/fsi/engine-scratchpad.c
@@ -0,0 +1,100 @@
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
+
+#include "hw/fsi/engine-scratchpad.h"
+
+static uint64_t scratchpad_read(void *opaque, hwaddr addr, unsigned size)
+{
+    ScratchPad *s = SCRATCHPAD(opaque);
+
+    qemu_log_mask(LOG_UNIMP, "%s: read @0x%" HWADDR_PRIx " size=%d\n",
+                  __func__, addr, size);
+
+    if (addr) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out of bounds read: 0x%"HWADDR_PRIx" for %u\n",
+                      __func__, addr, size);
+        return 0;
+    }
+
+    return s->reg;
+}
+
+static void scratchpad_write(void *opaque, hwaddr addr, uint64_t data,
+                                 unsigned size)
+{
+    ScratchPad *s = SCRATCHPAD(opaque);
+
+    qemu_log_mask(LOG_UNIMP, "%s: write @0x%" HWADDR_PRIx " size=%d "
+                  "value=%"PRIx64"\n", __func__, addr, size, data);
+
+    if (addr) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out of bounds write: 0x%"HWADDR_PRIx" for %u\n",
+                      __func__, addr, size);
+        return;
+    }
+
+    s->reg = data;
+}
+
+static const struct MemoryRegionOps scratchpad_ops = {
+    .read = scratchpad_read,
+    .write = scratchpad_write,
+    .endianness = DEVICE_BIG_ENDIAN,
+};
+
+static void scratchpad_realize(DeviceState *dev, Error **errp)
+{
+    LBusDevice *ldev = LBUS_DEVICE(dev);
+
+    memory_region_init_io(&ldev->iomem, OBJECT(ldev), &scratchpad_ops,
+                          ldev, TYPE_SCRATCHPAD, 0x400);
+}
+
+static void scratchpad_reset(DeviceState *dev)
+{
+    ScratchPad *s = SCRATCHPAD(dev);
+
+    s->reg = 0;
+}
+
+static void scratchpad_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    LBusDeviceClass *ldc = LBUS_DEVICE_CLASS(klass);
+
+    dc->realize = scratchpad_realize;
+    dc->reset = scratchpad_reset;
+
+    ldc->config =
+          ENGINE_CONFIG_NEXT            /* valid */
+        | 0x00010000                    /* slots */
+        | 0x00001000                    /* version */
+        | ENGINE_CONFIG_TYPE_SCRATCHPAD /* type */
+        | 0x00000007;                   /* crc */
+}
+
+static const TypeInfo scratchpad_info = {
+    .name = TYPE_SCRATCHPAD,
+    .parent = TYPE_LBUS_DEVICE,
+    .instance_size = sizeof(ScratchPad),
+    .class_init = scratchpad_class_init,
+    .class_size = sizeof(LBusDeviceClass),
+};
+
+static void scratchpad_register_types(void)
+{
+    type_register_static(&scratchpad_info);
+}
+
+type_init(scratchpad_register_types);
diff --git a/hw/fsi/meson.build b/hw/fsi/meson.build
index e1007d5fea..f90e09ddab 100644
--- a/hw/fsi/meson.build
+++ b/hw/fsi/meson.build
@@ -1 +1,2 @@
 system_ss.add(when: 'CONFIG_LBUS', if_true: files('lbus.c'))
+system_ss.add(when: 'CONFIG_SCRATCHPAD', if_true: files('engine-scratchpad.c'))
diff --git a/include/hw/fsi/engine-scratchpad.h b/include/hw/fsi/engine-scratchpad.h
new file mode 100644
index 0000000000..63bf89ac5a
--- /dev/null
+++ b/include/hw/fsi/engine-scratchpad.h
@@ -0,0 +1,33 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2023 IBM Corp.
+ *
+ * IBM scratchpad engne
+ */
+#ifndef FSI_ENGINE_SCRATCHPAD_H
+#define FSI_ENGINE_SCRATCHPAD_H
+
+#include "qemu/bitops.h"
+
+#include "hw/fsi/lbus.h"
+
+#define ENGINE_CONFIG_NEXT              BE_BIT(0)
+#define ENGINE_CONFIG_VPD               BE_BIT(1)
+#define ENGINE_CONFIG_SLOTS             BE_GENMASK(8, 15)
+#define ENGINE_CONFIG_VERSION           BE_GENMASK(16, 19)
+#define ENGINE_CONFIG_TYPE              BE_GENMASK(20, 27)
+#define   ENGINE_CONFIG_TYPE_PEEK       (0x02 << 4)
+#define   ENGINE_CONFIG_TYPE_FSI        (0x03 << 4)
+#define   ENGINE_CONFIG_TYPE_SCRATCHPAD (0x06 << 4)
+#define ENGINE_CONFIG_CRC              BE_GENMASK(28, 31)
+
+#define TYPE_SCRATCHPAD "scratchpad"
+#define SCRATCHPAD(obj) OBJECT_CHECK(ScratchPad, (obj), TYPE_SCRATCHPAD)
+
+typedef struct ScratchPad {
+        LBusDevice parent;
+
+        uint32_t reg;
+} ScratchPad;
+
+#endif /* FSI_ENGINE_SCRATCHPAD_H */
-- 
2.39.2

