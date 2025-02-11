Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp191674njb;
        Tue, 11 Feb 2025 01:24:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU96t8+0bD1V0jUvsMfk7ziN9+rnI4cXv6viHRuiZMtDEItKXmufgAL6U6mMAKUGDOX1Gcbqo/ecmbTsQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGgtlV2x2cXKzluHqhc2/iZmPlfQ0uT2UzaGOkruo258W17ljDB9Aan8mnvtARtauAfMBmV
X-Received: by 2002:a05:622a:124a:b0:471:9dd6:b51a with SMTP id d75a77b69052e-471a13c6410mr42404981cf.21.1739265878551;
        Tue, 11 Feb 2025 01:24:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739265878; cv=none;
        d=google.com; s=arc-20240605;
        b=hXdEVZSjz5yI7djTXwTbnN6il8alDlbK8PztoIlSLcSOpubLgXzsBW9QSSdN4Q+6gZ
         saHiExnh04/Em59sfAnFyDM/d9JUjlKc+8XTLi8C32qUzmRJ3JuRjGoQ/BLS0kI0Ldj6
         zlJtK4qgygq8PPdA5tvnwXp/PUYFqccbycJky0zAbnYZb8xt2BSlwiGP737gJT3RHIBK
         52FiYSb2F0l4G5XtUOaHvFW1dkfue+VWDLO10MsmzzmRXc3/UB35iZGhdxvCFNAxqQbZ
         BMX4n4cNnwEn3tZlakJjooVBPDDfDA1ECv54ph5CgwT5Ti4nE3w4L6nxIrr930Jh0Pvg
         GUjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fzoSZ7P230cNolUyWlYH+DuKgwD9D+nEBNHpVd5SQuY=;
        fh=e1SboN20/jHvoiD1YSHiGEBjk/mnJDcFYjKWtsBcI2Q=;
        b=ErDi6FW5Wg/PoOYNjpg6/d7aL1T9ob0yeh/eT24pNy0BY3yaMRJwX8hske107SQ+LZ
         6Id0mfcPFdS9D1z4XIgmC8qSWYduFfcowUBw+UlUp05h+ou67Vz/fEFjDj7YV2wdzOUW
         HmpsUTLDGi/Aq9MLBZ8LXG1THO1e0s6nXfMdWp1f+MeQ2HilsioJzlR1ddPuVQ817+j1
         zYdPoIkpQjt6V2605NGKgrByqZ6YbJKPu52z53ZrsgnDYYDLbcjtiWW9T/zkBolUeCjQ
         T8VDek90ZQmhgFWRkWL4zbpCUMOjziF9FUFTm/Hw+Rq9HIfOX1djfuPIgmRxmUIdqtO0
         j8KA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WnLkHub3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471821960afsi58855161cf.428.2025.02.11.01.24.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2025 01:24:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WnLkHub3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thmV3-0002rR-Jg; Tue, 11 Feb 2025 04:24:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1thmUx-0002a6-QJ
 for qemu-arm@nongnu.org; Tue, 11 Feb 2025 04:24:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1thmUv-000364-5b
 for qemu-arm@nongnu.org; Tue, 11 Feb 2025 04:24:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739265843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fzoSZ7P230cNolUyWlYH+DuKgwD9D+nEBNHpVd5SQuY=;
 b=WnLkHub3dpbT9jxwCEkLKkC8vnu/M7ZzWg5GpUQNusLBno3KUADyX6TR+goSRMPsqBjpBN
 OB0XBI4SVEqnCoZ5BJuolpe9qN6kcXm38cLGz968QXyJM6mDn+t/inU05W4T9CYsPc7Ws3
 F/qsrBFmarsRogi6sFEpGJ96Vv5Ub0M=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-350-16pEWMTVOWeygcaTtuFLSQ-1; Tue,
 11 Feb 2025 04:24:01 -0500
X-MC-Unique: 16pEWMTVOWeygcaTtuFLSQ-1
X-Mimecast-MFC-AGG-ID: 16pEWMTVOWeygcaTtuFLSQ
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6CB8B1800268; Tue, 11 Feb 2025 09:24:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.57])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CFC051800358; Tue, 11 Feb 2025 09:23:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E0A7F1800622; Tue, 11 Feb 2025 10:23:25 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, graf@amazon.com,
 Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v3 20/23] hw/uefi: add uefi-vars-isa device
Date: Tue, 11 Feb 2025 10:23:18 +0100
Message-ID: <20250211092324.965440-21-kraxel@redhat.com>
In-Reply-To: <20250211092324.965440-1-kraxel@redhat.com>
References: <20250211092324.965440-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.388,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: VZav6Y4IMsXw

This adds isa bindings for the variable service.

Usage: qemu-system-x86_64 -device uefi-vars-isa,jsonfile=/path/to/uefivars.json

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/uefi/var-service-isa.c | 90 +++++++++++++++++++++++++++++++++++++++
 hw/uefi/Kconfig           |  6 +++
 hw/uefi/meson.build       |  5 +++
 3 files changed, 101 insertions(+)
 create mode 100644 hw/uefi/var-service-isa.c

diff --git a/hw/uefi/var-service-isa.c b/hw/uefi/var-service-isa.c
new file mode 100644
index 000000000000..8247b9ae054a
--- /dev/null
+++ b/hw/uefi/var-service-isa.c
@@ -0,0 +1,90 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * uefi vars device - ISA variant for x64.
+ */
+#include "qemu/osdep.h"
+#include "migration/vmstate.h"
+
+#include "hw/isa/isa.h"
+#include "hw/qdev-properties.h"
+
+#include "hw/uefi/var-service.h"
+#include "hw/uefi/var-service-api.h"
+
+OBJECT_DECLARE_SIMPLE_TYPE(uefi_vars_isa_state, UEFI_VARS_ISA)
+
+struct uefi_vars_isa_state {
+    ISADevice parent_obj;
+    struct uefi_vars_state state;
+};
+
+static const VMStateDescription vmstate_uefi_vars_isa = {
+    .name = TYPE_UEFI_VARS_ISA,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT(state, uefi_vars_isa_state, 0,
+                       vmstate_uefi_vars, uefi_vars_state),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static const Property uefi_vars_isa_properties[] = {
+    DEFINE_PROP_SIZE("size", uefi_vars_isa_state, state.max_storage,
+                     256 * 1024),
+    DEFINE_PROP_STRING("jsonfile", uefi_vars_isa_state, state.jsonfile),
+    DEFINE_PROP_BOOL("force-secure-boot", uefi_vars_isa_state,
+                     state.force_secure_boot, false),
+    DEFINE_PROP_BOOL("disable-custom-mode", uefi_vars_isa_state,
+                     state.disable_custom_mode, false),
+};
+
+static void uefi_vars_isa_init(Object *obj)
+{
+    uefi_vars_isa_state *uv = UEFI_VARS_ISA(obj);
+
+    uefi_vars_init(obj, &uv->state);
+}
+
+static void uefi_vars_isa_reset(DeviceState *dev)
+{
+    uefi_vars_isa_state *uv = UEFI_VARS_ISA(dev);
+
+    uefi_vars_hard_reset(&uv->state);
+}
+
+static void uefi_vars_isa_realize(DeviceState *dev, Error **errp)
+{
+    uefi_vars_isa_state *uv = UEFI_VARS_ISA(dev);
+    ISADevice *isa = ISA_DEVICE(dev);
+
+    isa_register_ioport(isa, &uv->state.mr, UEFI_VARS_IO_BASE);
+    uefi_vars_realize(&uv->state, errp);
+}
+
+static void uefi_vars_isa_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = uefi_vars_isa_realize;
+    dc->vmsd = &vmstate_uefi_vars_isa;
+    device_class_set_legacy_reset(dc, uefi_vars_isa_reset);
+    device_class_set_props(dc, uefi_vars_isa_properties);
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+}
+
+static const TypeInfo uefi_vars_isa_info = {
+    .name          = TYPE_UEFI_VARS_ISA,
+    .parent        = TYPE_ISA_DEVICE,
+    .instance_size = sizeof(uefi_vars_isa_state),
+    .instance_init = uefi_vars_isa_init,
+    .class_init    = uefi_vars_isa_class_init,
+};
+module_obj(TYPE_UEFI_VARS_ISA);
+module_dep("hw-uefi-vars");
+
+static void uefi_vars_isa_register_types(void)
+{
+    type_register_static(&uefi_vars_isa_info);
+}
+
+type_init(uefi_vars_isa_register_types)
diff --git a/hw/uefi/Kconfig b/hw/uefi/Kconfig
index ca6c2bc46a96..feb9f6de5e30 100644
--- a/hw/uefi/Kconfig
+++ b/hw/uefi/Kconfig
@@ -1,3 +1,9 @@
 config UEFI_VARS
 	bool
         default y if X86_64 || AARCH64
+
+config UEFI_VARS_ISA
+	bool
+        default y
+        depends on UEFI_VARS
+        depends on ISA_BUS
diff --git a/hw/uefi/meson.build b/hw/uefi/meson.build
index cf2d26e9bf9a..0f191c436bcf 100644
--- a/hw/uefi/meson.build
+++ b/hw/uefi/meson.build
@@ -14,6 +14,11 @@ if (config_all_devices.has_key('CONFIG_UEFI_VARS'))
   uefi_vars_ss.add(files('var-service-siglist.c'))
 endif
 
+uefi_vars_isa_ss = ss.source_set()
+uefi_vars_isa_ss.add(when: 'CONFIG_UEFI_VARS_ISA',
+                     if_true: files('var-service-isa.c'))
+
 modules += { 'hw-uefi' : {
     'vars'     : uefi_vars_ss,
+    'vars-isa' : uefi_vars_isa_ss,
 }}
-- 
2.48.1

