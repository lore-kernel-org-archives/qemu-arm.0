Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2839951ejc;
        Wed, 15 Nov 2023 07:14:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVO7bVzH3YYDNARCwQ2dDKU95NxIuDDsQO1f8ObIAuEYY9NiHDb/fgBshhhRdDXxpfnquo
X-Received: by 2002:a05:620a:2993:b0:774:2bdc:ab4 with SMTP id r19-20020a05620a299300b007742bdc0ab4mr6514899qkp.62.1700061265440;
        Wed, 15 Nov 2023 07:14:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700061265; cv=none;
        d=google.com; s=arc-20160816;
        b=jl2UfGwT0XJTPYuJWsd9CKnK7++0BmX1CjVFmlAO/SJsM7yVgaZW7G314lcSt7Er3+
         Kj8kcNwhvWbalzueO0tLZIj8tEl+zDhRc8+XOVbrfdHXpaeckL6CVN6Xt6A5Bn5mkIDF
         GFByJ2CWh2LucmFmUU9OXunCk0vQieGWpF102UWw/TzLERuvzqffELM/l92eqM7qhMOj
         DTUCTwb7o2Gf+tUrXkY+p7GtnbG/XjV11iKEFrPg2IK8SP+qZ+h1PuIb1QgmmKWS/2xT
         R+eOlpGzfjCbDBP5ClWCENqI/2Kzif6OqwLGMTxHA/uDhH6rtk7lPidbpu9SKl4KcuPS
         NgMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uvT8gCXN28mceIO8UoTKC3bCpQMbHAti1cIxN96isxA=;
        fh=aH4SF+xuSHrUGtnSFxtFTCUyBE4iqqHq5kYhw/wkcgk=;
        b=eYErK18Mw6j3va1uMlOO81EfXNRCzPwtvmDvNCryFs6vwjOjloYKPLucoltEMpRJp7
         +rjUY06a21+2xhWmCk7PfifyQgS4upXFjX2DcA+x5mQFsg7gP8HcsYN3R42lTtrM7ldY
         llsVwpSE6/lgyHu4EiHUCHjZVo+pALZdpySWDlqxpWl8G88lts0i+X02yf/zXK8I5bNl
         MAVmp8AsA6JDW1bbTkgxx37ZhqLMm43vSKplAY4E+HWc6s581blBaML/MnFAHN4f6Lw7
         nC8+4DQ5wo4gI4pZxJjsgOanzxYs+wBlOYo9CaCF3jBC5sF6obEa/DJ7Pl9VPk0NTI2H
         dTRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R0aX2364;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17-20020a05620a415100b007770bfc2da9si9277787qko.83.2023.11.15.07.14.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 07:14:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R0aX2364;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3HaB-00042z-Hx; Wed, 15 Nov 2023 10:13:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r3HZl-0003uj-HU
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 10:13:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r3HZf-0003Gy-Ia
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 10:13:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700061176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uvT8gCXN28mceIO8UoTKC3bCpQMbHAti1cIxN96isxA=;
 b=R0aX2364CgQeP+PWNa1UrP8hEDoTermJUvjlb+tiRES92n5CDB5ADNqvJGKhqUcBi8fiNX
 yC6rwbZhJE4jwfq5UANOPlqIURm4Rv4egDq4uSfwwGtnMeE97kOrLG+hGFry3E1NmcWEO2
 pYtUPqZxeYmMAdunNdGUPdyRTdr614w=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-288-PFDZdSYcNGKSC5V20Gu_bA-1; Wed,
 15 Nov 2023 10:12:53 -0500
X-MC-Unique: PFDZdSYcNGKSC5V20Gu_bA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 756722825E94;
 Wed, 15 Nov 2023 15:12:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3655E5028;
 Wed, 15 Nov 2023 15:12:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 376A7180AC18; Wed, 15 Nov 2023 16:12:43 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?L=C3=A1szl=C3=B3=20=C3=89rsek?= <lersek@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 graf@amazon.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 13/16] hw/uefi: add uefi-vars-sysbus device
Date: Wed, 15 Nov 2023 16:12:35 +0100
Message-ID: <20231115151242.184645-14-kraxel@redhat.com>
In-Reply-To: <20231115151242.184645-1-kraxel@redhat.com>
References: <20231115151242.184645-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: MLe5doHRSVIk

This adds sysbus bindings for the variable service.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/uefi/var-service-sysbus.c | 87 ++++++++++++++++++++++++++++++++++++
 hw/uefi/meson.build          |  3 +-
 2 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 hw/uefi/var-service-sysbus.c

diff --git a/hw/uefi/var-service-sysbus.c b/hw/uefi/var-service-sysbus.c
new file mode 100644
index 000000000000..2b393fc768a9
--- /dev/null
+++ b/hw/uefi/var-service-sysbus.c
@@ -0,0 +1,87 @@
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
+#define TYPE_UEFI_VARS_SYSBUS "uefi-vars-sysbus"
+OBJECT_DECLARE_SIMPLE_TYPE(uefi_vars_sysbus_state, UEFI_VARS_SYSBUS)
+
+struct uefi_vars_sysbus_state {
+    SysBusDevice parent_obj;
+    struct uefi_vars_state state;
+};
+
+static const VMStateDescription vmstate_uefi_vars_sysbus = {
+    .name = "uefi-vars-sysbus",
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT(state, uefi_vars_sysbus_state, 0,
+                       vmstate_uefi_vars, uefi_vars_state),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property uefi_vars_sysbus_properties[] = {
+    DEFINE_PROP_SIZE("size", uefi_vars_sysbus_state, state.max_storage,
+                     256 * 1024),
+    DEFINE_PROP_STRING("jsonfile", uefi_vars_sysbus_state, state.jsonfile),
+    DEFINE_PROP_END_OF_LIST(),
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
+    dc->reset = uefi_vars_sysbus_reset;
+    dc->vmsd = &vmstate_uefi_vars_sysbus;
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
index b620297320d0..dc363d67cccc 100644
--- a/hw/uefi/meson.build
+++ b/hw/uefi/meson.build
@@ -5,7 +5,8 @@ uefi_vars_ss.add(when: 'CONFIG_UEFI_VARS',
                                 'var-service-vars.c',
                                 'var-service-auth.c',
                                 'var-service-guid.c',
-                                'var-service-policy.c'))
+                                'var-service-policy.c',
+                                'var-service-sysbus.c'))
 
 modules += { 'hw-uefi' : {
     'vars'     : uefi_vars_ss,
-- 
2.41.0

