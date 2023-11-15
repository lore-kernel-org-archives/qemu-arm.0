Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2841185ejc;
        Wed, 15 Nov 2023 07:16:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEb3YmceOVDEqE3yFq5giSIPRG6EKEdf/+CJlhS5+NzJ5Q8p+N+gUcpVtsX9NqAZokbT6ng
X-Received: by 2002:a9d:6390:0:b0:6b8:82ed:ea2e with SMTP id w16-20020a9d6390000000b006b882edea2emr5886861otk.4.1700061363733;
        Wed, 15 Nov 2023 07:16:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700061363; cv=none;
        d=google.com; s=arc-20160816;
        b=JS8vamgVXbwrTkLUWzekn0Ga6+N2jX5+g2O7ML1trY5T+aTHsDPAlQdw70b1PgkEYJ
         R1EtGYs5DYBHXPVLFDDf463vvNT+ZHIb+XOkLT0K/DSJEAOINr/CYXef08Wfi83J8V27
         hqoDqRLxSokjJaB+29Spgae4xqTh0eHRZyreJXHAJm1VE9Ec9X3d6i8BJl79bqh1Xg61
         lgLoqxdAF7DZYynfJV1hpcaH6/5IikEI5Bn8X3ssCivDMZ3en62GvjSpzObNR4jDQSF4
         iaxVc5oF2c/VMJuGwxGcSrCn4bfhlhwG0N75yc+ZzR/3i5bzW6pq70wReAFh6axqvmjQ
         eaeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ixo3RPtScabaQ65t94xklOJOsajoCXrPZRKo6pZCxJ8=;
        fh=aH4SF+xuSHrUGtnSFxtFTCUyBE4iqqHq5kYhw/wkcgk=;
        b=YpJF0Eg7vqKGMT5UiD7ejaL/GmSZBFbxlwJ2DV3Szjrno9Le1ZkLomLeZ9iMVGPM1X
         xSNh1AKGUvzyYZXkZ0Utj2e2CO1RBFc7qESHEwRM2mqcpiKpWl+fjs6jjY8H6sX3bJd3
         SMTqUnYMbxYE7kUblnBGY6Ubb4poZGWSm/xKAzrKz/eW2S3Ef1XopjfTsfMRhkQnAJP3
         gwMw4+Ch0eVB8XhBB5Fwkg8Mc1zk0UPPu4LCc3bd8LwAxg0vSaMr1WHsdFLYjiOHV/EL
         ZZrDDrtVodkUnAmhURzUe6WTITasjbZEOU8UavzuE2/BrAYS8OZEuYDFeokZTke1pMMD
         Mtpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S6WR4WLs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10-20020a05620a450a00b0076f0cc82e44si9255191qkp.718.2023.11.15.07.16.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 07:16:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S6WR4WLs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3HaL-00049H-Hx; Wed, 15 Nov 2023 10:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r3HZl-0003uf-3k
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 10:13:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r3HZe-0003F8-HU
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 10:13:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700061169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ixo3RPtScabaQ65t94xklOJOsajoCXrPZRKo6pZCxJ8=;
 b=S6WR4WLsWGKXRMAyMKPOx9nm85Y8u/dvbiUg8iQ6VNf4ID1hztW6qpa2c5XXsaBeCl5P/n
 ZPgOm0KhP49ymRlcPf32YYQH8i24HgbufQZzrZxZ4RM5LfXDLqTvu4rZcU5ioHPozgxoMS
 pYG2ASvKfj+/p8j5E0E+oqVs18BLeGc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-XZ3QajBmNKOhymC-m0gvHg-1; Wed, 15 Nov 2023 10:12:46 -0500
X-MC-Unique: XZ3QajBmNKOhymC-m0gvHg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD91285A59D;
 Wed, 15 Nov 2023 15:12:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 411F8C15881;
 Wed, 15 Nov 2023 15:12:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8B4B5180AC09; Wed, 15 Nov 2023 16:12:42 +0100 (CET)
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
Subject: [PATCH 03/16] hw/uefi: add include/hw/uefi/var-service.h
Date: Wed, 15 Nov 2023 16:12:25 +0100
Message-ID: <20231115151242.184645-4-kraxel@redhat.com>
In-Reply-To: <20231115151242.184645-1-kraxel@redhat.com>
References: <20231115151242.184645-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: KlK+Q2k+J8AW

Add state structs and function declarations for the uefi-vars device.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/uefi/var-service.h | 119 ++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 include/hw/uefi/var-service.h

diff --git a/include/hw/uefi/var-service.h b/include/hw/uefi/var-service.h
new file mode 100644
index 000000000000..2b8d3052e59f
--- /dev/null
+++ b/include/hw/uefi/var-service.h
@@ -0,0 +1,119 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * uefi-vars device - state struct and function prototypes
+ */
+#ifndef QEMU_UEFI_VAR_SERVICE_H
+#define QEMU_UEFI_VAR_SERVICE_H
+
+#include "qemu/uuid.h"
+#include "qemu/queue.h"
+
+#include "hw/uefi/var-service-edk2.h"
+
+#define MAX_BUFFER_SIZE (64 * 1024)
+
+typedef struct uefi_variable uefi_variable;
+typedef struct uefi_var_policy uefi_var_policy;
+typedef struct uefi_vars_state uefi_vars_state;
+
+struct uefi_variable {
+    QemuUUID                          guid;
+    uint16_t                          *name;
+    uint32_t                          name_size;
+    uint32_t                          attributes;
+    void                              *data;
+    uint32_t                          data_size;
+    QTAILQ_ENTRY(uefi_variable)       next;
+};
+
+struct uefi_var_policy {
+    variable_policy_entry             *entry;
+    uint32_t                          entry_size;
+    uint16_t                          *name;
+    uint32_t                          name_size;
+    uint32_t                          hashmarks;
+    QTAILQ_ENTRY(uefi_var_policy)     next;
+};
+
+struct uefi_vars_state {
+    MemoryRegion                      mr;
+    uint16_t                          sts;
+    uint32_t                          buf_size;
+    uint32_t                          buf_addr_lo;
+    uint32_t                          buf_addr_hi;
+    uint8_t                           *buffer;
+    QTAILQ_HEAD(, uefi_variable)      variables;
+    QTAILQ_HEAD(, uefi_var_policy)    var_policies;
+
+    /* boot phases */
+    bool                              end_of_dxe;
+    bool                              ready_to_boot;
+    bool                              exit_boot_service;
+    bool                              policy_locked;
+
+    /* storage accounting */
+    uint64_t                          max_storage;
+    uint64_t                          used_storage;
+
+    char                              *jsonfile;
+    int                               jsonfd;
+};
+
+/* vars-service-guid.c */
+extern QemuUUID EfiGlobalVariable;
+extern QemuUUID EfiImageSecurityDatabase;
+extern QemuUUID EfiCustomModeEnable;
+extern QemuUUID EfiSecureBootEnableDisable;
+extern QemuUUID EfiSmmVariableProtocolGuid;
+extern QemuUUID VarCheckPolicyLibMmiHandlerGuid;
+extern QemuUUID EfiEndOfDxeEventGroupGuid;
+extern QemuUUID EfiEventReadyToBootGuid;
+extern QemuUUID EfiEventExitBootServicesGuid;
+
+/* vars-service-core.c */
+extern const VMStateDescription vmstate_uefi_vars;
+size_t uefi_strlen(const uint16_t *str, size_t len);
+gboolean uefi_str_equal(const uint16_t *a, size_t alen,
+                        const uint16_t *b, size_t blen);
+char *uefi_ucs2_to_ascii(const uint16_t *ucs2, uint64_t ucs2_size);
+void uefi_trace_variable(const char *action, QemuUUID guid,
+                         const uint16_t *name, uint64_t name_size);
+void uefi_trace_status(const char *action, efi_status status);
+void uefi_vars_init(Object *obj, uefi_vars_state *uv);
+void uefi_vars_realize(uefi_vars_state *uv, Error **errp);
+void uefi_vars_hard_reset(uefi_vars_state *uv);
+
+/* vars-service-json.c */
+void uefi_vars_json_init(uefi_vars_state *uv, Error **errp);
+void uefi_vars_json_save(uefi_vars_state *uv);
+void uefi_vars_json_load(uefi_vars_state *uv, Error **errp);
+
+/* vars-service-vars.c */
+extern const VMStateDescription vmstate_uefi_variable;
+uefi_variable *uefi_vars_find_variable(uefi_vars_state *uv, QemuUUID guid,
+                                       const uint16_t *name,
+                                       uint64_t name_size);
+void uefi_vars_set_variable(uefi_vars_state *uv, QemuUUID guid,
+                            const uint16_t *name, uint64_t name_size,
+                            uint32_t attributes,
+                            void *data, uint64_t data_size);
+void uefi_vars_clear_volatile(uefi_vars_state *uv);
+void uefi_vars_clear_all(uefi_vars_state *uv);
+void uefi_vars_update_storage(uefi_vars_state *uv);
+uint32_t uefi_vars_mm_vars_proto(uefi_vars_state *uv);
+
+/* vars-service-auth.c */
+void uefi_vars_auth_init(uefi_vars_state *uv);
+
+/* vars-service-policy.c */
+extern const VMStateDescription vmstate_uefi_var_policy;
+efi_status uefi_vars_policy_check(uefi_vars_state *uv,
+                                  uefi_variable *var,
+                                  gboolean is_newvar);
+void uefi_vars_policies_clear(uefi_vars_state *uv);
+uefi_var_policy *uefi_vars_add_policy(uefi_vars_state *uv,
+                                      variable_policy_entry *pe);
+uint32_t uefi_vars_mm_check_policy_proto(uefi_vars_state *uv);
+
+#endif /* QEMU_UEFI_VAR_SERVICE_H */
-- 
2.41.0

