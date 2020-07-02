Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1836068lfm;
        Thu, 2 Jul 2020 13:49:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuuTN0gQzq4valE5qqQKtvlJb1tENn+wZugHix0kOSE49GEI8p4ghWtvmiPpmGZuFrftrm
X-Received: by 2002:a25:d7d1:: with SMTP id o200mr53393087ybg.194.1593722974992;
        Thu, 02 Jul 2020 13:49:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593722974; cv=none;
        d=google.com; s=arc-20160816;
        b=rbiKav1DdokWGujxPnxPjHa/hnYfy/zBVaL56AjVCBcpC7T633V6U+ifqy5/gVj02v
         QMNpiEqm4DAPnJIQijH0TWP+57n1PnFpar+vniw/LEkUokvYbFEcS3H+Va3czq7TjTXq
         55R2J1lBTgF+fsqpk8LsJ9xsbd7uMnYVJdTC1obZzUlNc1VQnSJy2TxItFalcftvzMOv
         VfnLHQIhFZj5KWTeWlHfqe7zY+evJMd7NYaQkvg7LCQPkeh+hDfohrkvS3iG5KD2H4OX
         z9xOYUfSsTUTMR3SsEow4kGkGW5NFigMeLOlnmZ7qsZ+XtnCIa/GOB8MmQo7dUO23Fdj
         Lm6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=iZ8q6BNQD71G/ReGAtp/ZouIvCh6XyxiS1/Hett2Vw4=;
        b=fFD5pBG6Z8cOCv8yTe8AaxDYX/sNAMMJdJJU/js1hTYHV4QzOc/RYpUCF6D/c8NpKM
         J30ySLpLgsaA7j2rhg9GJqVq2Jtx/cv9Mu5Ny4GZuCCTecnRKPl7eX8LEbROcVkyte48
         ZJlZrT7wHBXkPM24ARIh8WyFSlWpRjJaNuwzFqDTUuPNypIcUck/MyNYe2a8dG8ddD+8
         W5VES8VLR8h4a0mMIQYxcL9BNxpAG9Kkc4rk/yh8QQPVoJJed1o8jbuVDlRN5p5CDlH6
         X/O1cCqS0FVTTy/JHOb80wdQFbcxq+KTl6U3YxR2WEFv1kmZKhSuss0fnbdb7uOn6YXB
         BNOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dBC1cvxu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2si10283767ybj.207.2020.07.02.13.49.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 13:49:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dBC1cvxu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jr69G-0004Hj-B3
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 16:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr694-0004EK-BC
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 16:49:22 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:21858
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr690-0003XA-B6
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 16:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593722957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=iZ8q6BNQD71G/ReGAtp/ZouIvCh6XyxiS1/Hett2Vw4=;
 b=dBC1cvxucaRCOutwDPUTpQSysJt58hYiPPjk+zVNV/sOqvEv3iZxeidqMxyihnooZ3+YAC
 HTui2NS5khdlSzSJLm+lAWyq5XHfnx5WiU9E1UeE4JXN4vFOrBATH2hb/yGgwMajjqMo+0
 ExSahQnL4Osvn1G90nZF4yvhq7DkMq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-t2U6IrGlPBGVrhw3hxrHkg-1; Thu, 02 Jul 2020 16:49:14 -0400
X-MC-Unique: t2U6IrGlPBGVrhw3hxrHkg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAE2080183C;
 Thu,  2 Jul 2020 20:49:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BB685C1C5;
 Thu,  2 Jul 2020 20:49:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E7BEA31E62; Thu,  2 Jul 2020 22:48:59 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/21] acpi: ged: add control regs
Date: Thu,  2 Jul 2020 22:48:42 +0200
Message-Id: <20200702204859.9876-5-kraxel@redhat.com>
In-Reply-To: <20200702204859.9876-1-kraxel@redhat.com>
References: <20200702204859.9876-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:18:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MLiqVnKoaAT5

Add control regs (sleep, reset) for hw-reduced acpi.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/acpi/generic_event_device.h |  7 ++++
 hw/acpi/generic_event_device.c         | 44 ++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index 90a9180db572..474c92198080 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -72,6 +72,12 @@
 #define ACPI_GED_EVT_SEL_OFFSET    0x0
 #define ACPI_GED_EVT_SEL_LEN       0x4
 
+#define ACPI_GED_REG_SLEEP_CTL     0x00
+#define ACPI_GED_REG_SLEEP_STS     0x01
+#define ACPI_GED_REG_RESET         0x02
+#define   ACPI_GED_RESET_VALUE     0x42
+#define ACPI_GED_REG_COUNT         0x03
+
 #define GED_DEVICE      "GED"
 #define AML_GED_EVT_REG "EREG"
 #define AML_GED_EVT_SEL "ESEL"
@@ -87,6 +93,7 @@
 
 typedef struct GEDState {
     MemoryRegion evt;
+    MemoryRegion regs;
     uint32_t     sel;
 } GEDState;
 
diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index b8abdefa1c77..491df80a5cc7 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -20,6 +20,7 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qemu/error-report.h"
+#include "sysemu/runstate.h"
 
 static const uint32_t ged_supported_events[] = {
     ACPI_GED_MEM_HOTPLUG_EVT,
@@ -176,6 +177,45 @@ static const MemoryRegionOps ged_evt_ops = {
     },
 };
 
+static uint64_t ged_regs_read(void *opaque, hwaddr addr, unsigned size)
+{
+    return 0;
+}
+
+static void ged_regs_write(void *opaque, hwaddr addr, uint64_t data,
+                           unsigned int size)
+{
+    bool slp_en;
+    int slp_typ;
+
+    switch (addr) {
+    case ACPI_GED_REG_SLEEP_CTL:
+        slp_typ = (data >> 2) & 0x07;
+        slp_en  = (data >> 5) & 0x01;
+        if (slp_en && slp_typ == 5) {
+            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+        }
+        return;
+    case ACPI_GED_REG_SLEEP_STS:
+        return;
+    case ACPI_GED_REG_RESET:
+        if (data == ACPI_GED_RESET_VALUE) {
+            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+        }
+        return;
+    }
+}
+
+static const MemoryRegionOps ged_regs_ops = {
+    .read = ged_regs_read,
+    .write = ged_regs_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 1,
+    },
+};
+
 static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
                                     DeviceState *dev, Error **errp)
 {
@@ -332,6 +372,10 @@ static void acpi_ged_initfn(Object *obj)
      sysbus_init_mmio(sbd, &s->container_memhp);
      acpi_memory_hotplug_init(&s->container_memhp, OBJECT(dev),
                               &s->memhp_state, 0);
+
+    memory_region_init_io(&ged_st->regs, obj, &ged_regs_ops, ged_st,
+                          TYPE_ACPI_GED "-regs", ACPI_GED_REG_COUNT);
+    sysbus_init_mmio(sbd, &ged_st->regs);
 }
 
 static void acpi_ged_class_init(ObjectClass *class, void *data)
-- 
2.18.4

