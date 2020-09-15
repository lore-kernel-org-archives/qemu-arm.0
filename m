Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3123180lfq;
        Tue, 15 Sep 2020 05:27:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9hi1IgEj343XSLyyNgod+tOpHqRNy1ZTPHF4XA4ID64HJpeArkDtt5l3NZ0kzoAGHRP2v
X-Received: by 2002:a25:8311:: with SMTP id s17mr30216192ybk.100.1600172822307;
        Tue, 15 Sep 2020 05:27:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600172822; cv=none;
        d=google.com; s=arc-20160816;
        b=ib7UGsiu38yd3yr73zvx1uT3+efnTJb7ELdyQhRckHSuzgxmB9LNRYdHfUwWVgayMP
         faIE3D1AkS/0itjIBsc2DmgrZLayVt6RyEtQVCcetIL2wRWWtVfFfDgkVRWWi3fuw9/3
         ygu/Ta0FtE3TWvG9W0nnROL+AhO/XYTMW/FFz17RnSCCV7WQO+UxNj0YHIsbypBXNCbD
         qblcfGODYwgmYmFOvWnE9LwP/s2qzCo3MlAZkKU77gLgO+0K6Csk2H1zlT3HVz8J2fxZ
         s9fdMlDyJfkJIbD0CzchXAD84ZnMxjpxOzQCCrMsiTC2RS/ZOoD76Yuu8o6/gDm1p3+Z
         3V/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=q4xqrjBt9+K0AYOcFO9PWCCV/shKCcI1emzHoZPL8Jc=;
        b=wAicNWDimmvGDeCnFCb9BTFrgRvclpZjXnAZMA1qZvGCqZE8M2FEFw3ypbPuGq/U1B
         /ow+kAwKKCT8bGVCd1YKvqRtPhDvGGnwvuzR4lop4V6TGgUCDdi6uF4LW4a4+q3as8VO
         g2VP1BZa8AcOKSdc+k7W/Fi4ynq5lCQmBitRpkXKxxWwVwkdjaZ/4T3NBOjjqNmRKeGO
         EnmlzkiiSxwhAhJPUcALtOyZLfTsG2SP4JVkaecS9h+DIQAmVU1yinbr9Wh3R9XSM6Lt
         lUS6ThKUvzAn6AZ9i7ndMfpe/4vD4RmpDiUHm6b4OM13d9H2nVdQ6BnGSRDy0AS+e4We
         nfbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AfaWx+pr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7si3515391ybq.252.2020.09.15.05.27.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 05:27:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AfaWx+pr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIA33-0006XZ-Ko
	for alex.bennee@linaro.org; Tue, 15 Sep 2020 08:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9nf-0005Ct-Ne
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 08:11:08 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36362
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kI9na-0007p0-JE
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 08:11:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600171861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q4xqrjBt9+K0AYOcFO9PWCCV/shKCcI1emzHoZPL8Jc=;
 b=AfaWx+prRkTp3bjUy/cf91tnmf7xnBWgptmdk9toHhsJtmLBvra1Qw2a0K2EtPrwUOWuNH
 2LNqCHHX6Hdrbt0Owk2GNrcW6bJti1lCExw8b4KPJdoBL6Ou7F/Ss88n+ErF9ZqvG4dDm/
 gZ+oS5wd2GOTQmI0vpWCav9lCvRXI1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-FO519XIRON223aaivj0XvA-1; Tue, 15 Sep 2020 08:09:24 -0400
X-MC-Unique: FO519XIRON223aaivj0XvA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F37F1009454;
 Tue, 15 Sep 2020 12:09:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E1FB75138;
 Tue, 15 Sep 2020 12:09:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DF93B40839; Tue, 15 Sep 2020 14:09:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 09/21] microvm/acpi: add acpi_dsdt_add_virtio() for x86
Date: Tue, 15 Sep 2020 14:08:57 +0200
Message-Id: <20200915120909.20838-10-kraxel@redhat.com>
In-Reply-To: <20200915120909.20838-1-kraxel@redhat.com>
References: <20200915120909.20838-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 02:11:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
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
X-TUID: vQ1PSX+mqg9d

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

