Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp258834ejb;
        Thu, 1 Feb 2024 06:14:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsOFdbFUKia3SSldKQCV7yalSeKLUOSAFG3GIOjXzAiHdyBpMH1PNkssZwCb8d9MAVsOl9
X-Received: by 2002:a05:6808:496:b0:3be:1525:507c with SMTP id z22-20020a056808049600b003be1525507cmr4653575oid.15.1706796866590;
        Thu, 01 Feb 2024 06:14:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706796866; cv=none;
        d=google.com; s=arc-20160816;
        b=PTjz1IUpGUU3T0RFZCdcSLxyPxSB6BIKa0IUTkWs+XE9h8lfS8vB3vBLKf8l3fgrNc
         iCE/1sbiVy1ISyWnvsSU38TsGZ4uBqOH6GE4Rx4BU0sBwmVRpuC/g7lfZIbUoqWoGJ3u
         +Ua7UHarEaclwPc7lpWMmSGhDE0JRlU2tLdr76jtk1acSW0CW+TXf4+7MGgXp02d5XQI
         G8ieyWOCkG+ry6gX7vz068bDv5Lz3TjS8vrpxdYvrCV1w8B2AVsjgn55dmjqjQnZi/l+
         7G/xHWhDQvi9qqnCcllnyfA2Z8DmuMjBDruJtLOVsfB6DTw8kz1nZoR4CN0sE6caqFd+
         hWQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=1qirqgR8vRSH/mQWpCDROvin4avN7ZlrIR8YxZV5Kqs=;
        fh=y3T8kJlgDOORyAOmLONl/neNRv+ddN4euGnlzhJfcjU=;
        b=ALcMOtusR4slprKVy3lIBhUjs5Prjdb/mHVH3A8/Ood1PTkGyPM3M5GBMtY/5Vhg5R
         Ho5pTGoeF9LWuu3BpQfcnB6xSD+Kvh9v4PkCnR9MNqO3I8r56za/hhfHWwQ7to7QjiVo
         Hm2xFwySdhtvBWxPrpD6n/FHZpwOIskJZlxbw/FJKwwMwwhLwB3WCcPZ+ByhKF+ZSCz7
         KzCzIxdYXPgFqERidQBX6cgdXFEE3fnbA+OwWwDDnb0UYE311GfKeobLlD7aUSHVwTw/
         X8+CMtN3dkJ/vT7A9VAvcVWsb9pyTm6OAvuHWfdM+uEtU2bRjldu2kTUxGIcBJ9crRsX
         UTqw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
X-Forwarded-Encrypted: i=0; AJvYcCUi6jmQccl/Jx1uObia8LoXGv5R4IyFv8iBOy1gs28fBGDOPdsgE7XDTnyf46uSCSZOnIvjBI6tHVB7uyvOfkAf8HjqlHAS
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11-20020ac858cb000000b0042bef9224b5si2336818qta.272.2024.02.01.06.14.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 06:14:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVXpF-0001Nw-MD; Thu, 01 Feb 2024 09:13:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Qo6T=JK=kaod.org=clg@ozlabs.org>)
 id 1rVXol-0000yh-0Y; Thu, 01 Feb 2024 09:13:28 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Qo6T=JK=kaod.org=clg@ozlabs.org>)
 id 1rVXof-0007mj-Jo; Thu, 01 Feb 2024 09:13:24 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TQgqN4G8Lz4wcV;
 Fri,  2 Feb 2024 01:13:20 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TQgqL5RSZz4wcM;
 Fri,  2 Feb 2024 01:13:18 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 08/17] hw/fsi: Introduce IBM's scratchpad device
Date: Thu,  1 Feb 2024 15:12:44 +0100
Message-ID: <20240201141253.806055-9-clg@kaod.org>
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
X-TUID: /cvOGcsuFfzN

From: Ninad Palsule <ninad@linux.ibm.com>

This is a part of patchset where IBM's Flexible Service Interface is
introduced.

The scratchpad provides a set of non-functional registers. The firmware
is free to use them, hardware does not support any special management
support. The scratchpad registers can be read or written from LBUS
slave. The scratch pad is managed under FSI CFAM state.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
[ clg: - moved object FSIScratchPad under FSICFAMState
       - moved FSIScratchPad code under cfam.c ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/fsi/lbus.h | 11 ++++++
 hw/fsi/lbus.c         | 78 +++++++++++++++++++++++++++++++++++++++++--
 hw/fsi/trace-events   |  2 ++
 3 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/include/hw/fsi/lbus.h b/include/hw/fsi/lbus.h
index e8a22e22a8fa..558268c013f5 100644
--- a/include/hw/fsi/lbus.h
+++ b/include/hw/fsi/lbus.h
@@ -29,4 +29,15 @@ typedef struct FSILBus {
     MemoryRegion mr;
 } FSILBus;
 
+#define TYPE_FSI_SCRATCHPAD "fsi.scratchpad"
+#define SCRATCHPAD(obj) OBJECT_CHECK(FSIScratchPad, (obj), TYPE_FSI_SCRATCHPAD)
+
+#define FSI_SCRATCHPAD_NR_REGS 4
+
+typedef struct FSIScratchPad {
+        FSILBusDevice parent;
+
+        uint32_t regs[FSI_SCRATCHPAD_NR_REGS];
+} FSIScratchPad;
+
 #endif /* FSI_LBUS_H */
diff --git a/hw/fsi/lbus.c b/hw/fsi/lbus.c
index 44d2319087a8..20495f42fd99 100644
--- a/hw/fsi/lbus.c
+++ b/hw/fsi/lbus.c
@@ -8,11 +8,12 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/fsi/lbus.h"
-
 #include "hw/qdev-properties.h"
-
+#include "qemu/log.h"
 #include "trace.h"
 
+#define TO_REG(offset) ((offset) >> 2)
+
 static void fsi_lbus_init(Object *o)
 {
     FSILBus *lbus = FSI_LBUS(o);
@@ -34,10 +35,83 @@ static const TypeInfo fsi_lbus_device_type_info = {
     .abstract = true,
 };
 
+static uint64_t fsi_scratchpad_read(void *opaque, hwaddr addr, unsigned size)
+{
+    FSIScratchPad *s = SCRATCHPAD(opaque);
+    int reg = TO_REG(addr);
+
+    trace_fsi_scratchpad_read(addr, size);
+
+    if (reg >= FSI_SCRATCHPAD_NR_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, addr);
+        return 0;
+    }
+
+    return s->regs[reg];
+}
+
+static void fsi_scratchpad_write(void *opaque, hwaddr addr, uint64_t data,
+                                 unsigned size)
+{
+    FSIScratchPad *s = SCRATCHPAD(opaque);
+
+    trace_fsi_scratchpad_write(addr, size, data);
+    int reg = TO_REG(addr);
+
+    if (reg >= FSI_SCRATCHPAD_NR_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, addr);
+        return;
+    }
+
+    s->regs[reg] = data;
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
+    memset(s->regs, 0, sizeof(s->regs));
+}
+
+static void fsi_scratchpad_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->bus_type = TYPE_FSI_LBUS;
+    dc->realize = fsi_scratchpad_realize;
+    dc->reset = fsi_scratchpad_reset;
+}
+
+static const TypeInfo fsi_scratchpad_info = {
+    .name = TYPE_FSI_SCRATCHPAD,
+    .parent = TYPE_FSI_LBUS_DEVICE,
+    .instance_size = sizeof(FSIScratchPad),
+    .class_init = fsi_scratchpad_class_init,
+};
+
 static void fsi_lbus_register_types(void)
 {
     type_register_static(&fsi_lbus_info);
     type_register_static(&fsi_lbus_device_type_info);
+    type_register_static(&fsi_scratchpad_info);
 }
 
 type_init(fsi_lbus_register_types);
diff --git a/hw/fsi/trace-events b/hw/fsi/trace-events
index e69de29bb2d1..c5753e27910a 100644
--- a/hw/fsi/trace-events
+++ b/hw/fsi/trace-events
@@ -0,0 +1,2 @@
+fsi_scratchpad_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size=%d"
+fsi_scratchpad_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64
-- 
2.43.0

