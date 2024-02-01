Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp259285ejb;
        Thu, 1 Feb 2024 06:15:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEI3pInmTr+9VSJNnAyS1JEA/j6U8yf9InWMmYTUP+A3UM5ee/ZMypjnVQwQ91mmAHgsuQ+
X-Received: by 2002:a05:620a:3db:b0:785:45c7:db3a with SMTP id r27-20020a05620a03db00b0078545c7db3amr1882546qkm.20.1706796903826;
        Thu, 01 Feb 2024 06:15:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706796903; cv=none;
        d=google.com; s=arc-20160816;
        b=HjfwCO0Q2hmlh9uPRm+QEMePnhx54w4M9UR52eSeKA/Ubl81kj9a9K+LGykvFR6cZZ
         MbuQWqmMXkhc8xMYReucf9mMEPrTHbfuK4yiywVXfeTCZWgDmJBL+kOL4x7DP5lxF/Hr
         XYjZjbymIzOGDB9tEA5oVqkyBnRHUBRtXJY6a21h25c4ogmXqbuci/BBM77klR9IgGIJ
         OrrBN1B5H9tKUxhksYpYah2FCUTBB1lSmX8GIhTJ5J37Vs3Y+EjRFoYLjLBrtjJMX19x
         4E6Ugwf9P13Y/A1jvtdd/mAjVNTuQwsZalvUQQ23Mp2CcepbbmTZvi0MDOFSwcWoaSKo
         Gewg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=LeCZUHmoqj9/Jlh1VJtw3BU2+1fwFAtndcDww9NhSWk=;
        fh=atAdeoXMxge0ezQVCIbxi2Z7I2UKkbs6QHVxR53l/j4=;
        b=phPvM65zY1o0fYi0a+CzxqAa9PGxC9fUZpXM3D/tWSe5kuvdvpeiATBj7QY1mttnju
         R7IDUwbyLTNNhjHmu0a6N2q7ZKcv/soFWwXgxqM9xSzvnY6wRwo8B20JAQoUgY/+e04a
         ht4Y0IJntQ0mUW/ghw/C6+LAiqRAIZ5nCgbgPFSneI8B3KjXqPVjLvPT4ZqUC0lmEc2p
         8VHmKis+SJQ+kUtp9PoiLR2/sV2sml455VZD9yTn4P1BMzitNhCExdKiCiIQ3839Y9n0
         /eMSzznjiB+TY4s6LnC1oWSw5YTL+AY7AZYoHBTwv9aMPckEiei69CDAQOjMUOJ5hr6T
         Jzfw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
X-Forwarded-Encrypted: i=0; AJvYcCWtdPGnRvAEyXzWySpjBy86T4VbDqHeaDJeRzcx/OfAg56D68KeknWXROWD6JhUevivcFgRvC0YoIKXfwjSGakJL9tZyP5A
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dt41-20020a05620a47a900b00783dae58180si13633885qkb.188.2024.02.01.06.15.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 06:15:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rVXpF-0001OJ-UJ; Thu, 01 Feb 2024 09:13:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Qo6T=JK=kaod.org=clg@ozlabs.org>)
 id 1rVXp5-00014Y-83; Thu, 01 Feb 2024 09:13:47 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Qo6T=JK=kaod.org=clg@ozlabs.org>)
 id 1rVXon-0007oW-VF; Thu, 01 Feb 2024 09:13:34 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TQgqT1Hp0z4wck;
 Fri,  2 Feb 2024 01:13:25 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TQgqR2pVtz4wcM;
 Fri,  2 Feb 2024 01:13:23 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 10/17] hw/fsi: Introduce IBM's fsi-slave model
Date: Thu,  1 Feb 2024 15:12:46 +0100
Message-ID: <20240201141253.806055-11-clg@kaod.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201141253.806055-1-clg@kaod.org>
References: <20240201141253.806055-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=Qo6T=JK=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: bk+/JwSuURg2

From: Ninad Palsule <ninad@linux.ibm.com>

This is a part of patchset where IBM's Flexible Service Interface is
introduced.

The FSI slave: The slave is the terminal point of the FSI bus for
FSI symbols addressed to it. Slaves can be cascaded off of one
another. The slave's configuration registers appear in address space
of the CFAM to which it is attached.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/fsi/fsi.h | 18 ++++++++++
 hw/fsi/fsi.c         | 84 ++++++++++++++++++++++++++++++++++++++++++--
 hw/fsi/trace-events  |  2 ++
 3 files changed, 102 insertions(+), 2 deletions(-)

diff --git a/include/hw/fsi/fsi.h b/include/hw/fsi/fsi.h
index 50e8f5c888f1..e00f6ef078c8 100644
--- a/include/hw/fsi/fsi.h
+++ b/include/hw/fsi/fsi.h
@@ -7,7 +7,13 @@
 #ifndef FSI_FSI_H
 #define FSI_FSI_H
 
+#include "exec/memory.h"
 #include "hw/qdev-core.h"
+#include "hw/fsi/lbus.h"
+#include "qemu/bitops.h"
+
+/* Bitwise operations at the word level. */
+#define BE_GENMASK(hb, lb)  MAKE_64BIT_MASK((lb), ((hb) - (lb) + 1))
 
 #define TYPE_FSI_BUS "fsi.bus"
 OBJECT_DECLARE_SIMPLE_TYPE(FSIBus, FSI_BUS)
@@ -16,4 +22,16 @@ typedef struct FSIBus {
     BusState bus;
 } FSIBus;
 
+#define TYPE_FSI_SLAVE "fsi.slave"
+OBJECT_DECLARE_SIMPLE_TYPE(FSISlaveState, FSI_SLAVE)
+
+#define FSI_SLAVE_CONTROL_NR_REGS ((0x40 >> 2) + 1)
+
+typedef struct FSISlaveState {
+    DeviceState parent;
+
+    MemoryRegion iomem;
+    uint32_t regs[FSI_SLAVE_CONTROL_NR_REGS];
+} FSISlaveState;
+
 #endif /* FSI_FSI_H */
diff --git a/hw/fsi/fsi.c b/hw/fsi/fsi.c
index 60cb03f7a24e..9a5f4e616f16 100644
--- a/hw/fsi/fsi.c
+++ b/hw/fsi/fsi.c
@@ -5,18 +5,98 @@
  * IBM Flexible Service Interface
  */
 #include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/log.h"
+#include "trace.h"
 
 #include "hw/fsi/fsi.h"
 
+#define TO_REG(x)                               ((x) >> 2)
+
 static const TypeInfo fsi_bus_info = {
     .name = TYPE_FSI_BUS,
     .parent = TYPE_BUS,
     .instance_size = sizeof(FSIBus),
 };
 
-static void fsi_bus_register_types(void)
+static uint64_t fsi_slave_read(void *opaque, hwaddr addr, unsigned size)
+{
+    FSISlaveState *s = FSI_SLAVE(opaque);
+    int reg = TO_REG(addr);
+
+    trace_fsi_slave_read(addr, size);
+
+    if (reg >= FSI_SLAVE_CONTROL_NR_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out of bounds read: 0x%"HWADDR_PRIx" for %u\n",
+                      __func__, addr, size);
+        return 0;
+    }
+
+    return s->regs[reg];
+}
+
+static void fsi_slave_write(void *opaque, hwaddr addr, uint64_t data,
+                                 unsigned size)
+{
+    FSISlaveState *s = FSI_SLAVE(opaque);
+    int reg = TO_REG(addr);
+
+    trace_fsi_slave_write(addr, size, data);
+
+    if (reg >= FSI_SLAVE_CONTROL_NR_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out of bounds write: 0x%"HWADDR_PRIx" for %u\n",
+                      __func__, addr, size);
+        return;
+    }
+
+    s->regs[reg] = data;
+}
+
+static const struct MemoryRegionOps fsi_slave_ops = {
+    .read = fsi_slave_read,
+    .write = fsi_slave_write,
+    .endianness = DEVICE_BIG_ENDIAN,
+};
+
+static void fsi_slave_reset(DeviceState *dev)
+{
+    FSISlaveState *s = FSI_SLAVE(dev);
+
+    /* Initialize registers */
+    memset(s->regs, 0, sizeof(s->regs));
+}
+
+static void fsi_slave_init(Object *o)
+{
+    FSISlaveState *s = FSI_SLAVE(o);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &fsi_slave_ops,
+                          s, TYPE_FSI_SLAVE, 0x400);
+}
+
+static void fsi_slave_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->bus_type = TYPE_FSI_BUS;
+    dc->desc = "FSI Slave";
+    dc->reset = fsi_slave_reset;
+}
+
+static const TypeInfo fsi_slave_info = {
+    .name = TYPE_FSI_SLAVE,
+    .parent = TYPE_DEVICE,
+    .instance_init = fsi_slave_init,
+    .instance_size = sizeof(FSISlaveState),
+    .class_init = fsi_slave_class_init,
+};
+
+static void fsi_register_types(void)
 {
     type_register_static(&fsi_bus_info);
+    type_register_static(&fsi_slave_info);
 }
 
-type_init(fsi_bus_register_types);
+type_init(fsi_register_types);
diff --git a/hw/fsi/trace-events b/hw/fsi/trace-events
index c5753e27910a..8f29adb7df92 100644
--- a/hw/fsi/trace-events
+++ b/hw/fsi/trace-events
@@ -1,2 +1,4 @@
 fsi_scratchpad_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size=%d"
 fsi_scratchpad_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64
+fsi_slave_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size=%d"
+fsi_slave_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64
-- 
2.43.0

