Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp341882njg;
        Tue, 25 Feb 2025 08:43:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWFPqLjjZk+atwfOArVZWhRNOsXQAe2tDPl31nO74enQNwS1frdiNBQ2kgv7GLc/wX6WJQalD8MKqW+OQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGF7wh5D351KusqsXg6hQ3G/z/4af+NGud4urB3XYvQoDQ4W7gdC5gZB/eXKOK4wKJiXOoZ
X-Received: by 2002:ac8:574d:0:b0:472:58b:4642 with SMTP id d75a77b69052e-4738137563emr1551291cf.47.1740501784770;
        Tue, 25 Feb 2025 08:43:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740501784; cv=none;
        d=google.com; s=arc-20240605;
        b=JO3/Y+ezwQG7FrjDq3D9GdFoU0BUwq1gmUgkmBvQT7RkeXeaOU/t7ly0MpdLJgIMAe
         zg9fyqcS/FnVc56xX8J8tZQ9/OL6jWQiFJ5oPwnsyEe/lV/ktIDENncNg5c1U6eSfNJm
         FulHE3hyr6WK7iwbr08uK8whGcxy+GE9fM0Qv0EJTy4nvMeG8DzrXTVs8ONzAWwSsa/l
         A14OwG1LVI9zxj1Sqpi1PGKc+AYgRMV6ZAb1Z94KaxIiNKqxYwIneQJrHrtFajNcnWQC
         8W67XMDT8HncC/7X2Czjq4C9i97LyrHqePVM/uMeD1umfyActKf1UpP6yn91O1sshb1N
         BWsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=adl+047RRk0jrk+hhfHEr4enhR8a9AgN6j2aR5xb9fs=;
        fh=mrCErM5HzBZPMbWrfhKaLB6Op7DKxeI6me6fB6ug8DQ=;
        b=JQfd4fWLe3yqVCY9ZFSv5Y8CeX+WVqcF1UD8b0goHCZH8w9hES9Wuj9H2rIARH39Iq
         N893vQuMxI9DFXZa7+Z/+81VGaSiX3V2DhDgD/NF+WuMv/hDqWKjzcm8U/1bXALAGzJ6
         CT+jWw2qiWMMI6VQtfkkc1VVKjBskOI8SvM3dDlmlrDyPg1eSMEg5ETATQdrYUq6SdDO
         2Z+NjLwUvj0J6Fm4Exl64qrDAyEY/MFtUqX8z0WVkQsHNaGT0HhhN9dwywDhCfLNtWeZ
         NwbYME57IvsiRVng6CsyxbwZlKmiMWr0fUiRpTBwpUU1B2apNp4Jui2TWYzUb8rsacoi
         KC7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cAPQ65IJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47377e2f59asi20557551cf.163.2025.02.25.08.43.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 08:43:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cAPQ65IJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmxql-000258-SD; Tue, 25 Feb 2025 11:32:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxq3-000172-Gu
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 11:31:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxpz-0006bS-Dp
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 11:31:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740501074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=adl+047RRk0jrk+hhfHEr4enhR8a9AgN6j2aR5xb9fs=;
 b=cAPQ65IJtC+JGjBV16NaMKDuYIloJ5pLz3QoVtcl1NErRxa5nqcFjy70fwE88kwKgydrvG
 ir4qiU36j5Tlsalbr9puBVXxpdMaJf0+sZsHFA1VNf2TujB0GsGt8Aowmr4nhCvkpp2cWH
 5QBs0SWL4II4GxapIWvshVdmI3cj6wQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-410-rqgmJNaSOIGb9jjDe1Sk4w-1; Tue,
 25 Feb 2025 11:31:07 -0500
X-MC-Unique: rqgmJNaSOIGb9jjDe1Sk4w-1
X-Mimecast-MFC-AGG-ID: rqgmJNaSOIGb9jjDe1Sk4w_1740501066
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 19B891801A16; Tue, 25 Feb 2025 16:31:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.219])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 781CA19560A3; Tue, 25 Feb 2025 16:31:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BE0B31800794; Tue, 25 Feb 2025 17:30:32 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Ard Biesheuvel <ardb@kernel.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, graf@amazon.com,
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v5 18/24] hw/uefi: add uefi-vars-sysbus device
Date: Tue, 25 Feb 2025 17:30:22 +0100
Message-ID: <20250225163031.1409078-19-kraxel@redhat.com>
In-Reply-To: <20250225163031.1409078-1-kraxel@redhat.com>
References: <20250225163031.1409078-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: uUD8jrBaHS3w

This adds sysbus bindings for the variable service.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/uefi/var-service-sysbus.c | 91 ++++++++++++++++++++++++++++++++++++
 hw/uefi/meson.build          |  3 +-
 2 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 hw/uefi/var-service-sysbus.c

diff --git a/hw/uefi/var-service-sysbus.c b/hw/uefi/var-service-sysbus.c
new file mode 100644
index 000000000000..60072c8815cd
--- /dev/null
+++ b/hw/uefi/var-service-sysbus.c
@@ -0,0 +1,91 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * uefi vars device - sysbus variant.
+ */
+#include "qemu/osdep.h"
+#include "migration/vmstate.h"
+
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+
+#include "hw/uefi/var-service.h"
+#include "hw/uefi/var-service-api.h"
+
+OBJECT_DECLARE_SIMPLE_TYPE(uefi_vars_sysbus_state, UEFI_VARS_SYSBUS)
+
+struct uefi_vars_sysbus_state {
+    SysBusDevice parent_obj;
+    struct uefi_vars_state state;
+};
+
+static const VMStateDescription vmstate_uefi_vars_sysbus = {
+    .name = TYPE_UEFI_VARS_SYSBUS,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT(state, uefi_vars_sysbus_state, 0,
+                       vmstate_uefi_vars, uefi_vars_state),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static const Property uefi_vars_sysbus_properties[] = {
+    DEFINE_PROP_SIZE("size", uefi_vars_sysbus_state, state.max_storage,
+                     256 * 1024),
+    DEFINE_PROP_STRING("jsonfile", uefi_vars_sysbus_state, state.jsonfile),
+    DEFINE_PROP_BOOL("force-secure-boot", uefi_vars_sysbus_state,
+                     state.force_secure_boot, false),
+    DEFINE_PROP_BOOL("disable-custom-mode", uefi_vars_sysbus_state,
+                     state.disable_custom_mode, false),
+    DEFINE_PROP_BOOL("use-pio", uefi_vars_sysbus_state,
+                     state.use_pio, false),
+};
+
+static void uefi_vars_sysbus_init(Object *obj)
+{
+    uefi_vars_sysbus_state *uv = UEFI_VARS_SYSBUS(obj);
+
+    uefi_vars_init(obj, &uv->state);
+}
+
+static void uefi_vars_sysbus_reset(DeviceState *dev)
+{
+    uefi_vars_sysbus_state *uv = UEFI_VARS_SYSBUS(dev);
+
+    uefi_vars_hard_reset(&uv->state);
+}
+
+static void uefi_vars_sysbus_realize(DeviceState *dev, Error **errp)
+{
+    uefi_vars_sysbus_state *uv = UEFI_VARS_SYSBUS(dev);
+    SysBusDevice *sysbus = SYS_BUS_DEVICE(dev);
+
+    sysbus_init_mmio(sysbus, &uv->state.mr);
+    uefi_vars_realize(&uv->state, errp);
+}
+
+static void uefi_vars_sysbus_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = uefi_vars_sysbus_realize;
+    dc->vmsd = &vmstate_uefi_vars_sysbus;
+    device_class_set_legacy_reset(dc, uefi_vars_sysbus_reset);
+    device_class_set_props(dc, uefi_vars_sysbus_properties);
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+}
+
+static const TypeInfo uefi_vars_sysbus_info = {
+    .name          = TYPE_UEFI_VARS_SYSBUS,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(uefi_vars_sysbus_state),
+    .instance_init = uefi_vars_sysbus_init,
+    .class_init    = uefi_vars_sysbus_class_init,
+};
+module_obj(TYPE_UEFI_VARS_SYSBUS);
+
+static void uefi_vars_sysbus_register_types(void)
+{
+    type_register_static(&uefi_vars_sysbus_info);
+}
+
+type_init(uefi_vars_sysbus_register_types)
diff --git a/hw/uefi/meson.build b/hw/uefi/meson.build
index e63708aa164f..91eb95f89e6d 100644
--- a/hw/uefi/meson.build
+++ b/hw/uefi/meson.build
@@ -8,7 +8,8 @@ if (config_all_devices.has_key('CONFIG_UEFI_VARS'))
                          'var-service-auth.c',
                          'var-service-guid.c',
                          'var-service-utils.c',
-                         'var-service-policy.c'))
+                         'var-service-policy.c',
+                         'var-service-sysbus.c'))
   uefi_vars_ss.add(when: gnutls,
                    if_true: files('var-service-pkcs7.c'),
                    if_false: files('var-service-pkcs7-stub.c'))
-- 
2.48.1

