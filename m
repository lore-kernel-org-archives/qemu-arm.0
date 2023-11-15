Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2840233ejc;
        Wed, 15 Nov 2023 07:14:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcpYbZzGVEzj+nB30TJm1Bpb8xQ5lY+UdJoADJVSF3CKUUnXiGMrmQl/WlXHPThyHFnTbx
X-Received: by 2002:a67:e0de:0:b0:45d:9223:9532 with SMTP id m30-20020a67e0de000000b0045d92239532mr12820619vsl.19.1700061290011;
        Wed, 15 Nov 2023 07:14:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700061289; cv=none;
        d=google.com; s=arc-20160816;
        b=t1LAWH4iE/Z2K2+aKq5sUTOw9H6+34WXs0NwcHu8AG+bDeqyLlNa8xx3D8BoKXwps2
         SJCLl72etjCUelUp6uvI1vCYB3EabFTb8bzJwiwv2yd7N3CmnhwGZUXmeEfl3gp/KFlr
         hlQBQ5SjlhGjlwmpxbi4M++0771wTKKbzMQX5GTn/6U993swxzMPZnvtLEb0uuIynpC8
         Z5bxVFybScXdMXvFYpU3jaOnJZlcwxyKq9dAhAlU4BRWubbmX2uGxCN/i/8jz4K4ejcF
         Vn6LIi43xBth70Ozb/ubE6/X8i6Ztbvj9uLM1GTbsF4iBw5AGQlvV0uh7o4V+hT0gdDE
         Eafg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8wxD6xwlgDw/b8MAYsb4Jigr8XKoEqfPiwUw9SddQFI=;
        fh=aH4SF+xuSHrUGtnSFxtFTCUyBE4iqqHq5kYhw/wkcgk=;
        b=ypReAU/aWOH3uyh8HSC6Tqu2xb4vBftbbMYHilQWVQHY7hIjoLX9kV1o0YO1VYiEqI
         lPAV5ajPZc9fO3Id7Jv9YfP8011AAjmxUfjH18e0wHZcfzj0C/Yq7RgKHT6H8lCFDv18
         roibaLosy5FkSCsx+1BIqwX5NmfZPbNcXyDKoV+ryeud9zPDWA6aBdY+Frsp5FBEiSJk
         Lphpmi1YpCvq1S4Jq8dYNDrLfoZVamovpttS3CPXKO5iRYlK1nNC4+XT/opmkgxFuHQE
         I+bWllQ4SfqbYQtmJkliHyLqdLaWXkqkaXvNHHWb+EB8UdaCrNXH83mWyp4DdHnB2y91
         hsPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B6bgAKor;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16-20020a67c210000000b0045f6a28c1c7si1485716vsj.759.2023.11.15.07.14.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 07:14:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B6bgAKor;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r3HaA-00041T-Um; Wed, 15 Nov 2023 10:13:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r3HZi-0003uQ-IG
 for qemu-devel@nongnu.org; Wed, 15 Nov 2023 10:13:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r3HZe-0003FX-I8
 for qemu-devel@nongnu.org; Wed, 15 Nov 2023 10:13:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700061170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8wxD6xwlgDw/b8MAYsb4Jigr8XKoEqfPiwUw9SddQFI=;
 b=B6bgAKorg+L4yY+CnyyCwCPAcr0RLTCS5VMqMB1Q2s2o0V5KDVxuPMqBEFdBMu4VCjwrB6
 CwxOe+1WU3xr1U8V5edsqtczWZ9H+LbAtBu87gm4E2I6SMfpkfmeYmM1PcmXbKAvesKXC2
 TNtQdlrUQfxc+SH6XSdomoW+XeMbX2Y=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-596-QCcyqFDgPuy2qdZsyVSg0Q-1; Wed,
 15 Nov 2023 10:12:49 -0500
X-MC-Unique: QCcyqFDgPuy2qdZsyVSg0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C516D3810D25;
 Wed, 15 Nov 2023 15:12:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 642D15028;
 Wed, 15 Nov 2023 15:12:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C4F95180AC11; Wed, 15 Nov 2023 16:12:42 +0100 (CET)
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
Subject: [PATCH 07/16] hw/uefi: add var-service-auth.c
Date: Wed, 15 Nov 2023 16:12:29 +0100
Message-ID: <20231115151242.184645-8-kraxel@redhat.com>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: d+kRRzfKqvaO

This implements authenticated variable handling (AuthVariableLib in edk2).

For now this implements the bare minimum to make secure boot work,
by initializing the 'SecureBoot' variable.

Support for authenticated variable updates is not implemented yet, for
now they are read-only so the guest can neither provision secure boot
keys nor update the 'dbx' database.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/uefi/var-service-auth.c | 91 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 hw/uefi/var-service-auth.c

diff --git a/hw/uefi/var-service-auth.c b/hw/uefi/var-service-auth.c
new file mode 100644
index 000000000000..e7cff65275c2
--- /dev/null
+++ b/hw/uefi/var-service-auth.c
@@ -0,0 +1,91 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * uefi vars device - AuthVariableLib
+ */
+
+#include "qemu/osdep.h"
+#include "sysemu/dma.h"
+
+#include "hw/uefi/var-service.h"
+
+static const uint16_t name_pk[]  = { 'P', 'K',
+                                     0 };
+static const uint16_t name_setup_mode[]  = { 'S', 'e', 't', 'u', 'p',
+                                             'M', 'o', 'd', 'e',
+                                             0 };
+static const uint16_t name_sb[]  = { 'S', 'e', 'c', 'u', 'r', 'e',
+                                     'B', 'o', 'o', 't',
+                                     0 };
+static const uint16_t name_sb_enable[]  = { 'S', 'e', 'c', 'u', 'r', 'e',
+                                            'B', 'o', 'o', 't',
+                                            'E', 'n', 'a', 'b', 'l', 'e',
+                                            0 };
+static const uint16_t name_custom_mode[]  = { 'C', 'u', 's', 't', 'o', 'm',
+                                              'M', 'o', 'd', 'e',
+                                              0 };
+
+/* AuthVariableLibInitialize */
+void uefi_vars_auth_init(uefi_vars_state *uv)
+{
+    uefi_variable *pk_var, *sbe_var;;
+    uint8_t platform_mode, sb, sbe, custom_mode;
+
+    /* SetupMode */
+    pk_var = uefi_vars_find_variable(uv, EfiGlobalVariable,
+                                     name_pk, sizeof(name_pk));
+    if (!pk_var) {
+        platform_mode = SETUP_MODE;
+    } else {
+        platform_mode = USER_MODE;
+    }
+    uefi_vars_set_variable(uv, EfiGlobalVariable,
+                           name_setup_mode, sizeof(name_setup_mode),
+                           EFI_VARIABLE_BOOTSERVICE_ACCESS |
+                           EFI_VARIABLE_RUNTIME_ACCESS,
+                           &platform_mode, sizeof(platform_mode));
+
+    /* TODO: SignatureSupport */
+
+    /* SecureBootEnable */
+    sbe = SECURE_BOOT_DISABLE;
+    sbe_var = uefi_vars_find_variable(uv, EfiSecureBootEnableDisable,
+                                      name_sb_enable, sizeof(name_sb_enable));
+    if (sbe_var) {
+        if (platform_mode == USER_MODE) {
+            sbe = ((uint8_t*)sbe_var->data)[0];
+        }
+    } else if (platform_mode == USER_MODE) {
+        sbe = SECURE_BOOT_ENABLE;
+        uefi_vars_set_variable(uv, EfiSecureBootEnableDisable,
+                               name_sb_enable, sizeof(name_sb_enable),
+                               EFI_VARIABLE_NON_VOLATILE |
+                               EFI_VARIABLE_BOOTSERVICE_ACCESS,
+                               &sbe, sizeof(sbe));
+    }
+
+    /* SecureBoot */
+    if ((sbe == SECURE_BOOT_ENABLE) && (platform_mode == USER_MODE)) {
+        sb = SECURE_BOOT_MODE_ENABLE;
+    } else {
+        sb = SECURE_BOOT_MODE_DISABLE;
+    }
+    uefi_vars_set_variable(uv, EfiGlobalVariable,
+                           name_sb, sizeof(name_sb),
+                           EFI_VARIABLE_BOOTSERVICE_ACCESS |
+                           EFI_VARIABLE_RUNTIME_ACCESS,
+                           &sb, sizeof(sb));
+
+    /* CustomMode */
+    custom_mode = STANDARD_SECURE_BOOT_MODE;
+    uefi_vars_set_variable(uv, EfiCustomModeEnable,
+                           name_custom_mode, sizeof(name_custom_mode),
+                           EFI_VARIABLE_NON_VOLATILE |
+                           EFI_VARIABLE_BOOTSERVICE_ACCESS,
+                           &custom_mode, sizeof(custom_mode));
+
+    /* TODO: certdb */
+    /* TODO: certdbv */
+    /* TODO: VendorKeysNv */
+    /* TODO: VendorKeys */
+}
-- 
2.41.0

