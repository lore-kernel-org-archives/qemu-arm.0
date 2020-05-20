Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp578159lfb;
        Wed, 20 May 2020 06:26:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQRmfz0a8Bax5MDeytUKcsvmFJHJ8m5jcQbJ1lLeh5+92Ow+Amo0lM/8aYV9pJPeqcOY5Q
X-Received: by 2002:aed:2626:: with SMTP id z35mr5400760qtc.55.1589981180526;
        Wed, 20 May 2020 06:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589981180; cv=none;
        d=google.com; s=arc-20160816;
        b=I5b0elGxhm6FvLORgd5ch7gq7WLYenG0zoznbOGx6Q1SV2hCZ2YjJ+O9+Tufuh/Ckq
         d90M9mBRVNDWrlvyzGDK85RAFPHPFV+f5cdgvXMtssFE7dEbXixnAE/ArcKt1dX3WoKH
         SMhIbL7YBtb/L6GA1gQ9Nmc83viqQly2oGFooza0LdDDkVSXx7R84//tMe5ZfCLGzdao
         wr6EyHriKZSedfzfdeM8DZx7YgjAi/I9bNfJ82oanJl/11I05YEptWaANtBRMy+E+k+z
         aYpByguW+wFCX1Z+IrePul6KVYoxZtWbvYIQe0b23tYHSiXrvJE2nE9cTPpDnBPq8lSh
         z/xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=yL+6hHgQ5mwgkDZlEEeB9fTkTZmIC02loIxG6Wm0FRc=;
        b=0eDzOlEctpN2F6ZdenKYMzLJ1/tMtcSsJQY2eTZfEEf2OB3xglP21/GD3ZcOrKD0+6
         30vUHIHPI452xvgc59p3U6uBmGL1rU5on5zLg2xRl8BC8FhMgj7vby7TNNzNre16yppR
         2A+TfYHCqGrpb6jgiWdTJKnsR0opTtLtNho1XcxOIvsaenr8d0BcvWfz4aNu+ubOLeUg
         XUBf4O3nbtUZNEeS01mTDHKLuyin3BC/j/w2DtF+N9wpYykRkVH38x8vuvqikY5eWx2w
         5f+W5VkU643jfIbkHfFzI7ZiqBDOzqlDy/qaXVOJ33OmYgMPyTyUYz5//CqLZ6bavFZh
         x9nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HT0WOBc9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n18si1577960qvi.67.2020.05.20.06.26.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 May 2020 06:26:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HT0WOBc9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbOjj-0006Q3-TN
	for alex.bennee@linaro.org; Wed, 20 May 2020 09:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOeL-0002QF-5q
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:20:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55696
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOeF-0000Ko-9A
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:20:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589980838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=yL+6hHgQ5mwgkDZlEEeB9fTkTZmIC02loIxG6Wm0FRc=;
 b=HT0WOBc9qBgZKok1GJp8OVNwCVWDnyBU490xm84EFJhOJfm29uFWDe88dMRs9iGAMpJxpC
 u1zPw/N8fTeKDRWEnIQQCCEKaymBAvN4wbgnpkYnEE8TV5zJ2q7GdR9Id9kioVmO7hMvKa
 NH2Woa9Q0jCSdls5KsScZQCqkvSM78A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-sJeM_RbmM_W2-MXB1-1Nlw-1; Wed, 20 May 2020 09:20:36 -0400
X-MC-Unique: sJeM_RbmM_W2-MXB1-1Nlw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20D5C8015D1;
 Wed, 20 May 2020 13:20:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E20B960BEC;
 Wed, 20 May 2020 13:20:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 11F6F9D5A; Wed, 20 May 2020 15:20:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/22] acpi: ged: add x86 device variant.
Date: Wed, 20 May 2020 15:19:52 +0200
Message-Id: <20200520132003.9492-12-kraxel@redhat.com>
In-Reply-To: <20200520132003.9492-1-kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 22:48:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 71e59MpUvxJ/

Set AcpiDeviceIfClass->madt_cpu,
otherwise identical to TYPE_ACPI_GED.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/acpi/generic_event_device.h |  4 +++
 hw/i386/generic_event_device_x86.c     | 36 ++++++++++++++++++++++++++
 hw/i386/Makefile.objs                  |  1 +
 3 files changed, 41 insertions(+)
 create mode 100644 hw/i386/generic_event_device_x86.c

diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index 474c92198080..9687cb524258 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -69,6 +69,10 @@
 #define ACPI_GED(obj) \
     OBJECT_CHECK(AcpiGedState, (obj), TYPE_ACPI_GED)
 
+#define TYPE_ACPI_GED_X86 "acpi-ged-x86"
+#define ACPI_GED_X86(obj) \
+    OBJECT_CHECK(AcpiGedX86State, (obj), TYPE_ACPI_GED_X86)
+
 #define ACPI_GED_EVT_SEL_OFFSET    0x0
 #define ACPI_GED_EVT_SEL_LEN       0x4
 
diff --git a/hw/i386/generic_event_device_x86.c b/hw/i386/generic_event_device_x86.c
new file mode 100644
index 000000000000..e26fb02a2ef6
--- /dev/null
+++ b/hw/i386/generic_event_device_x86.c
@@ -0,0 +1,36 @@
+/*
+ * x86 variant of the generic event device for hw reduced acpi
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/acpi/generic_event_device.h"
+#include "hw/i386/pc.h"
+
+static void acpi_ged_x86_class_init(ObjectClass *class, void *data)
+{
+    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_CLASS(class);
+
+    adevc->madt_cpu = pc_madt_cpu_entry;
+}
+
+static const TypeInfo acpi_ged_x86_info = {
+    .name          = TYPE_ACPI_GED_X86,
+    .parent        = TYPE_ACPI_GED,
+    .class_init    = acpi_ged_x86_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_HOTPLUG_HANDLER },
+        { TYPE_ACPI_DEVICE_IF },
+        { }
+    }
+};
+
+static void acpi_ged_x86_register_types(void)
+{
+    type_register_static(&acpi_ged_x86_info);
+}
+
+type_init(acpi_ged_x86_register_types)
diff --git a/hw/i386/Makefile.objs b/hw/i386/Makefile.objs
index 6abc74551a72..622739305882 100644
--- a/hw/i386/Makefile.objs
+++ b/hw/i386/Makefile.objs
@@ -17,4 +17,5 @@ obj-$(CONFIG_PC) += port92.o
 
 obj-y += kvmvapic.o
 obj-$(CONFIG_ACPI) += acpi-common.o
+obj-$(CONFIG_ACPI_HW_REDUCED) += generic_event_device_x86.o
 obj-$(CONFIG_PC) += acpi-build.o
-- 
2.18.4

