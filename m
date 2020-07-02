Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1837932lfm;
        Thu, 2 Jul 2020 13:52:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFmK3R7mc5Y1Bl4xm14zROkKFFPVN1cSUNcxOEGrcSiatk14uD5iJEmmH4fTk+SLcnwbjU
X-Received: by 2002:a25:d297:: with SMTP id j145mr55493409ybg.18.1593723150228;
        Thu, 02 Jul 2020 13:52:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593723150; cv=none;
        d=google.com; s=arc-20160816;
        b=OUVG/lG2cw2rLovRmmsVx9evS7M9mtHjdVSzTBtxFFBTYagLyUi8PsqTMHT+gkdaUo
         HAGHXCCxuAa8rPVok7lpSDWh4M14PJOUu7aCfTAeyRvLGxa3DxRPgVXZbOaicWovl3/D
         Ppq183RxjvGNuTEX0m3LMXHxYrnA+T99mQEAaY1j2zd6xorLR/HGAbeY2CwgIw7sYntj
         JiqUjMWqTculZ8IgU7/gLivplGYjS3jFDSv4GuQL2GQQ8r0MEEAV81/ZwxcJKZulS91m
         fgzMFE0cHwYcUtKQbSFskiqTzRkXUGz81P4iuVk8YNELe3Suuv49PfBbqWzpE+tdACDM
         AKMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=RnKM/3mzkkjb0niX455YpPSaGv2VkFAEYBel4eIfWmU=;
        b=KeyXLHIXktb0Cx/jFAwaxwQXnhpthD5Y16lCOSLpEhNbElC3flF7DklxFgKTTv9LjY
         +B8VI87vQ+/ux4E+3+uATB7dwaIet9XRBXpP6gmXP8OEx1y7Iqk9kVhXstVch2al3bqg
         AVX+LlY8BznI6Gta+o7AyWf+QEOoD64id4FjiphUIviTfvs8kyi18cEW0IWoor1wGBW0
         U5upS4HeCDvxJVhIW8sbo0UiftzrComFLyyoZym3yCnhgn5AnFJE+tFkwyAe7mLhVJ6O
         YtNpuwHFK/yPUQ321sP1aLbM/Z3gAnMQGq8KQPWmBY0PJT5CcP7vmyZwVrrWE2hF6NH5
         zNCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GXb7tn9p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j74si9362762ybj.390.2020.07.02.13.52.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 13:52:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GXb7tn9p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jr6C5-0001Kv-FL
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 16:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr698-0004Np-EX
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 16:49:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35859
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr692-0003Xe-Sq
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 16:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593722960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=RnKM/3mzkkjb0niX455YpPSaGv2VkFAEYBel4eIfWmU=;
 b=GXb7tn9pz4xW4JJm4FChOZ09ajiGuri1V7HlUnKaX44hGTQDVOt0xByY8c9mQxw4I5yrn6
 7L3QGwhvzzNyKz9M6yXEF9c86+Ty9z477n3aBQcqng4eXSWROtz3fLvDsC/L/q5fD/AYnY
 4ZmlLaY62NRivaFMlL3oNdOP45/FfN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-ZR_tE0g2NEi8VlCCz94RYQ-1; Thu, 02 Jul 2020 16:49:16 -0400
X-MC-Unique: ZR_tE0g2NEi8VlCCz94RYQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E2F01932488;
 Thu,  2 Jul 2020 20:49:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CCAD2B4BC;
 Thu,  2 Jul 2020 20:49:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 32A2831EBE; Thu,  2 Jul 2020 22:49:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/21] microvm/acpi: add acpi_dsdt_add_virtio() for x86
Date: Thu,  2 Jul 2020 22:48:47 +0200
Message-Id: <20200702204859.9876-10-kraxel@redhat.com>
In-Reply-To: <20200702204859.9876-1-kraxel@redhat.com>
References: <20200702204859.9876-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:00:43
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
X-TUID: UqdnEVVRG9bd

Makes x86 linux kernel find virtio-mmio devices automatically.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-microvm.c | 52 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 7cd830e628af..20f297517457 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -21,6 +21,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include "qapi/error.h"
 
 #include "exec/memory.h"
@@ -32,10 +33,60 @@
 #include "hw/boards.h"
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/microvm.h"
+#include "hw/virtio/virtio-mmio.h"
 
 #include "acpi-common.h"
 #include "acpi-microvm.h"
 
+static void acpi_dsdt_add_virtio(Aml *scope,
+                                 MicrovmMachineState *mms)
+{
+    gchar *separator;
+    long int index;
+    BusState *bus;
+    BusChild *kid;
+
+    bus = sysbus_get_default();
+    QTAILQ_FOREACH(kid, &bus->children, sibling) {
+        DeviceState *dev = kid->child;
+        Object *obj = object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MMIO);
+
+        if (obj) {
+            VirtIOMMIOProxy *mmio = VIRTIO_MMIO(obj);
+            VirtioBusState *mmio_virtio_bus = &mmio->bus;
+            BusState *mmio_bus = &mmio_virtio_bus->parent_obj;
+
+            if (QTAILQ_EMPTY(&mmio_bus->children)) {
+                continue;
+            }
+            separator = g_strrstr(mmio_bus->name, ".");
+            if (!separator) {
+                continue;
+            }
+            if (qemu_strtol(separator + 1, NULL, 10, &index) != 0) {
+                continue;
+            }
+
+            uint32_t irq = mms->virtio_irq_base + index;
+            hwaddr base = VIRTIO_MMIO_BASE + index * 512;
+            hwaddr size = 512;
+
+            Aml *dev = aml_device("VR%02u", (unsigned)index);
+            aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0005")));
+            aml_append(dev, aml_name_decl("_UID", aml_int(index)));
+            aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
+
+            Aml *crs = aml_resource_template();
+            aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE));
+            aml_append(crs,
+                       aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
+                                     AML_EXCLUSIVE, &irq, 1));
+            aml_append(dev, aml_name_decl("_CRS", crs));
+            aml_append(scope, dev);
+        }
+    }
+}
+
 static void
 build_dsdt_microvm(GArray *table_data, BIOSLinker *linker,
                    MicrovmMachineState *mms)
@@ -60,6 +111,7 @@ build_dsdt_microvm(GArray *table_data, BIOSLinker *linker,
     build_ged_aml(sb_scope, GED_DEVICE, HOTPLUG_HANDLER(mms->acpi_dev),
                   GED_MMIO_IRQ, AML_SYSTEM_MEMORY, GED_MMIO_BASE);
     acpi_dsdt_add_power_button(sb_scope);
+    acpi_dsdt_add_virtio(sb_scope, mms);
     aml_append(dsdt, sb_scope);
 
     scope = aml_scope("\\");
-- 
2.18.4

