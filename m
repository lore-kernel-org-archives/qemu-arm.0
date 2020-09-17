Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp602348lfq;
        Thu, 17 Sep 2020 06:54:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0sH0YFSB/dkKlck4qvCIgGi/vJDB+LziORTDfCsgxylGhA4fEuGbhwF2v56t/DT7OBpS9
X-Received: by 2002:a5b:ace:: with SMTP id a14mr14516177ybr.441.1600350852441;
        Thu, 17 Sep 2020 06:54:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600350852; cv=none;
        d=google.com; s=arc-20160816;
        b=aUqCJL6JgP2mPqIKaijlwZLpBX8EBbvr/4/Sv4kORR8XQHg3GXe2zRoWb20Lzcz5bu
         sxxN3sbabVf/SwZVh62xG7Whd2JAik0dQNb+WS/JHFyrnuLzYN5cCRQV9y1clpb7PemL
         DAv/dLjvEDmwGJyB75B14w0LlC8QuggqmCgcJ6JZvOB2V+ugdglXvm2O4pS3UoONRGb6
         GKescgKtlSgIm0Hxw1AxdlDpEiwUQYcBOmfLmQmmQ1Qk4tHHSi5sygvZtDWz2ue1hgYG
         3HJNVPh48AbDq+f/wbM0VgZ/74grpXbNFRO5wD8LBBtXlAAIvIRNInpDVCHbMpGkVQX9
         ga4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ChUqQNnAXkzHIQx9TB59mjS7APRGCrp3vPf9nY/htpQ=;
        b=X6mI8YHKkFrt2EPcuc7rwvBcMASIC8IT8OMcK2rvc3wF7BIUDJpObwiXzxQ8JMqw1j
         PanqW1IIflQI78MUZaXDhVB5T5V0v4jnDvnfy8Q4gA9QQ4y3LhcCvcs9k1BKxOrDcAjt
         Mw9q8QEH+FQiiLFhW7cFLlrpgvo5MSiT8MzD/HKKj6s+gCgF4wVjPZXyNEnKYNIHZE5J
         reaN+uc5vHSNGEqTCvjVpTt/mFU49i6SgS+YjSlV7DTx6a5W9Ao0jPoULklcwL97ijjK
         oXuMc99DdNAsQ9px1LKoKL+4xJmtqmbmGBepEDEEQAjUUR+NWm45s5cJj1vgPppl8x68
         /4Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OMhOhh9Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q81si6682745ybg.245.2020.09.17.06.54.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 06:54:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OMhOhh9Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIuMV-0008L5-My
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 09:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kIuM2-0008Fy-Sz
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 09:53:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60988
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kIuLz-00082M-GH
 for qemu-arm@nongnu.org; Thu, 17 Sep 2020 09:53:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600350817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ChUqQNnAXkzHIQx9TB59mjS7APRGCrp3vPf9nY/htpQ=;
 b=OMhOhh9YPu6+BDdzy3TCPEBcxlsSmf+1vZzcBqNdJptMwT/odfS94jPxSiGegQ5yVZgHIF
 LwKOAAHnEeoJt+myFteEGqs5cVSX7lM+Dn797NhJtohtWLfyoEkPa1pZ5Jy0XoZ2pxGbL/
 4HHb0n1EsvNyqgdz0v0q9MpDooMO0AM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-f7NAHvD-OS-D0mVTn9xnag-1; Thu, 17 Sep 2020 09:53:35 -0400
X-MC-Unique: f7NAHvD-OS-D0mVTn9xnag-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63A22107465C;
 Thu, 17 Sep 2020 13:53:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E266367CF0;
 Thu, 17 Sep 2020 13:53:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B69899A8F; Thu, 17 Sep 2020 15:53:23 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/21] acpi: ged: add control regs
Date: Thu, 17 Sep 2020 15:53:06 +0200
Message-Id: <20200917135323.18022-5-kraxel@redhat.com>
In-Reply-To: <20200917135323.18022-1-kraxel@redhat.com>
References: <20200917135323.18022-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 09:24:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: wjxDR4Atrwv4

Add control regs (sleep, reset) for hw-reduced acpi.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-id: 20200915120909.20838-5-kraxel@redhat.com
---
 include/hw/acpi/generic_event_device.h | 12 +++++++
 hw/acpi/generic_event_device.c         | 44 ++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index 1be05a3c0f8c..38aec526f944 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -74,6 +74,17 @@ DECLARE_INSTANCE_CHECKER(AcpiGedState, ACPI_GED,
 #define ACPI_GED_EVT_SEL_OFFSET    0x0
 #define ACPI_GED_EVT_SEL_LEN       0x4
 
+#define ACPI_GED_REG_SLEEP_CTL     0x00
+#define ACPI_GED_REG_SLEEP_STS     0x01
+#define ACPI_GED_REG_RESET         0x02
+#define ACPI_GED_REG_COUNT         0x03
+
+/* ACPI_GED_REG_RESET value for reset*/
+#define ACPI_GED_RESET_VALUE       0x42
+
+/* ACPI_GED_REG_SLEEP_CTL.SLP_TYP value for S5 (aka poweroff) */
+#define ACPI_GED_SLP_TYP_S5        0x05
+
 #define GED_DEVICE      "GED"
 #define AML_GED_EVT_REG "EREG"
 #define AML_GED_EVT_SEL "ESEL"
@@ -89,6 +100,7 @@ DECLARE_INSTANCE_CHECKER(AcpiGedState, ACPI_GED,
 
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
2.27.0

