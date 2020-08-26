Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp644646lfc;
        Wed, 26 Aug 2020 03:58:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0mBpF3OG7r44F8ykgR321aOXMy23BWkrdPdVP5aKSDABHLNnEzxYmG4HJq4sfJJj1A/PR
X-Received: by 2002:a25:5384:: with SMTP id h126mr21739259ybb.445.1598439524157;
        Wed, 26 Aug 2020 03:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598439524; cv=none;
        d=google.com; s=arc-20160816;
        b=n1RDMWLeHzD6di0Ax6/+/OdoG+XnpZ12Cy5S101doxF4MDA+3ScXZLBd2ZUpq+GhE2
         eroz+Fc0/A/vxBhyif9SHunCMJnJQJTHLgFJrPeeByWY4pRjJh4f2YjELhIaY4W8JCPb
         imfb8teT72MkP/KKIS49Ba2ojnM2tfRczEfUrrofZtV8rnWVAuBW5QoaQZLvzkowU1ZU
         /TtaG9oNSaE2zdqmzpF6d7/Sbx+Dilq8bCCsHoC0kqZsmUtE5pyHUkhpe4+OhyEzVw9g
         +t1BdiOeCkByvTRtVSKNuRZcRGwmxP1FPBPBt2NfznJokTpY9vjgT+tzhCOebOApTJXz
         xZKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=q4xqrjBt9+K0AYOcFO9PWCCV/shKCcI1emzHoZPL8Jc=;
        b=tbl/2auoUcyRh2E4rwI2wBS240/P1pR61njNuyPXi5BuOJwONsoR2Mm57XC3QZoIxs
         Fk8YsV1Ngg8TSplVl2kK/B3TevgTxEI+leZ1CAHp7GBAngM+ziUB2EhO8aaERkr80sGF
         Phxafh05gX3691t0an7Q3bNrWgohTb2kMh7k+RtZkC8mQ3x0/TobLVWjVSVKCH/N3VsT
         ZrJLVPwZt1Cr88iO4BWzxHwDLYFS+JTzkwEAvqYK2iDG6XGEVZzwkr4lhKeY8U8gGJGW
         NVlsGcRCG9QXcyoi+uJ9jq4BFf0qBWEt8Rskcy3iqowi3IU7I19KoTiJ9DtUefUPIPQb
         NFuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hf02Nbbv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1si1854495ybo.80.2020.08.26.03.58.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 03:58:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hf02Nbbv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAt8d-0000C3-GC
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 06:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kAt3X-0006Me-ER
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 06:53:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kAt3O-0001Z2-8H
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 06:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598439197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q4xqrjBt9+K0AYOcFO9PWCCV/shKCcI1emzHoZPL8Jc=;
 b=hf02NbbvdgMsvD2EaDekotpdPFe/l1HJQZq8TVXEBjy3gEMETPRShQsBDUGw2Qkpj5Y+5e
 yu9/jOOr2hKKVoGp+wBkpNd/0usYx1ZNdXEAHFAij7w/HOaQRsxqx8PZL/u/alGg5Rd5L2
 dlP6uAFtQAgLGNeDaZUChXg3l6Ej3Ko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-ua8EHp59N3yQDupojUcfxg-1; Wed, 26 Aug 2020 06:53:15 -0400
X-MC-Unique: ua8EHp59N3yQDupojUcfxg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33428807337;
 Wed, 26 Aug 2020 10:53:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A54965C1A3;
 Wed, 26 Aug 2020 10:53:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 81DFB204AD; Wed, 26 Aug 2020 12:52:54 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 09/20] microvm/acpi: add acpi_dsdt_add_virtio() for x86
Date: Wed, 26 Aug 2020 12:52:43 +0200
Message-Id: <20200826105254.28496-10-kraxel@redhat.com>
In-Reply-To: <20200826105254.28496-1-kraxel@redhat.com>
References: <20200826105254.28496-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 06:53:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lwJ1+RfYRGq9

Makes x86 linux kernel find virtio-mmio devices automatically.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-microvm.c | 52 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 06ef33949f5f..b9ce3768b263 100644
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
 
     /* ACPI 5.0: Table 7-209 System State Package */
-- 
2.27.0

