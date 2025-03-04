Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp96589njm;
        Tue, 4 Mar 2025 04:49:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVoNNYa8WnaScLgYOcQifmu3chlsTzovNHbqd7hSeARp+5Sv815Px1k/pqkLudatEGjx4vcWZEwDvQMPw==@linaro.org
X-Google-Smtp-Source: AGHT+IGrHH2FhD/qDHuQo4MFkb1sZqEKF0NYZu4TaecHgPP3lT9prNyP8PtKD56zg5K69z9s9gqY
X-Received: by 2002:a05:620a:3916:b0:7c0:abe0:ce4b with SMTP id af79cd13be357-7c39c4a2a9amr2343662485a.12.1741092558764;
        Tue, 04 Mar 2025 04:49:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741092558; cv=none;
        d=google.com; s=arc-20240605;
        b=QbljxScz2SsS0ySalCRzGziPj22pYlZrdMV7btKTaV3RiPHBeV0Q5HpkWwtIk8SkFB
         prYTcLTsoaOP6n8scfY9s3Uq0aI8BbgnXKaTHGNGvzYixIVvNOFBDOojcRXAUZPA8jmV
         QPdB350+D6LUnJ1LlxiUMlfVe0FyJTT0Q55K71mHvMBccVbjs77CJXTjfXO4KE7EYZEy
         ttcz/Gfr1zhW1+8d1YBB1Y091mlNiRx+ApGKlKrzc2GCK8ufNB7lj+a6IELocmSVxN8t
         HUFjo85AgmUwQ5NmdSMm+pglooRrVQ8YlbK3fEYCFU0wycvdelxT2Q7KVHlAyY6GrnUk
         T9pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=j86CDYwtI9X55e5axt64TTQ0qTTEZPdFKpQF5ux0Uso=;
        fh=AUxCU78jacJE1vSghMJJha3+F2+VikVKZl38eSKs5/I=;
        b=jSkYaLd/asL3fd7fXsu3j+dVnKGqw7neJ1j4BeIkoRijYg0Mi/nYBsVrP9LgFR6aFR
         HSYd81ZzYuaRc1pigwvhzUYZxKMf7qm8RkNvOXT1UR46YwihPIugIbeE2LLYANkMjNz2
         kkmGuAFb04tLeZp8F3V+q8MvL2Rss//A0ZZ410SWR4yeG6EXqlNNTpgbNUTQBp9XpsVO
         Gdq3/lSm5S/aulKZzqUi3wljdLY77XZHny2I6x+Vi+Z1jG0kL8cb0vCEOPgRkn5DuPYA
         bbEKaN09rFbyce6vc1ajRuLsgPLNiJJfZm0IoAv7chuXXCAKA7e0APQst7uHAkvbFIvx
         9aAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U08AzIC6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3c880f002si229112585a.209.2025.03.04.04.49.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Mar 2025 04:49:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U08AzIC6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpRhc-0004oH-Ow; Tue, 04 Mar 2025 07:48:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tpRhQ-0004gk-Cp
 for qemu-arm@nongnu.org; Tue, 04 Mar 2025 07:48:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tpRhO-0006ja-0Q
 for qemu-arm@nongnu.org; Tue, 04 Mar 2025 07:48:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741092517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j86CDYwtI9X55e5axt64TTQ0qTTEZPdFKpQF5ux0Uso=;
 b=U08AzIC6AlvmGjEDB8XQTYNwkWrgqgjHzTY5xT4vkdept0ZlZwmbVdW9mzqpefsBoM1ldx
 m7TjowOMLsnCNlCWQ2fU+bY9iTBHooWNezkFPepu/lIV00CU1qEMBGjhjf4/k3yjxVIuxB
 MfxCl2LMjYkd3mgCqTU3B+IqNkadvGo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-0sxTaEkJNuyxZ1UhbpOcIQ-1; Tue,
 04 Mar 2025 07:48:27 -0500
X-MC-Unique: 0sxTaEkJNuyxZ1UhbpOcIQ-1
X-Mimecast-MFC-AGG-ID: 0sxTaEkJNuyxZ1UhbpOcIQ_1741092506
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 401D91944F05; Tue,  4 Mar 2025 12:48:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.122])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2949F19560AB; Tue,  4 Mar 2025 12:48:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6B556180039B; Tue, 04 Mar 2025 13:48:15 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 04/24] hw/uefi: add include/hw/uefi/var-service.h
Date: Tue,  4 Mar 2025 13:47:52 +0100
Message-ID: <20250304124815.591749-5-kraxel@redhat.com>
In-Reply-To: <20250304124815.591749-1-kraxel@redhat.com>
References: <20250304124815.591749-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: sO0mgw4JBso0

Add state structs and function declarations for the uefi-vars device.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20250225163031.1409078-5-kraxel@redhat.com>
---
 include/hw/uefi/var-service.h | 191 ++++++++++++++++++++++++++++++++++
 1 file changed, 191 insertions(+)
 create mode 100644 include/hw/uefi/var-service.h

diff --git a/include/hw/uefi/var-service.h b/include/hw/uefi/var-service.h
new file mode 100644
index 000000000000..f7ceac4ce243
--- /dev/null
+++ b/include/hw/uefi/var-service.h
@@ -0,0 +1,191 @@
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
+typedef struct uefi_vars_cert uefi_vars_cert;
+typedef struct uefi_vars_hash uefi_vars_hash;
+typedef struct uefi_vars_siglist uefi_vars_siglist;
+
+struct uefi_variable {
+    QemuUUID                          guid;
+    uint16_t                          *name;
+    uint32_t                          name_size;
+    uint32_t                          attributes;
+    void                              *data;
+    uint32_t                          data_size;
+    efi_time                          time;
+    void                              *digest;
+    uint32_t                          digest_size;
+    QTAILQ_ENTRY(uefi_variable)       next;
+};
+
+struct uefi_var_policy {
+    variable_policy_entry             *entry;
+    uint32_t                          entry_size;
+    uint16_t                          *name;
+    uint32_t                          name_size;
+
+    /* number of hashmarks (wildcard character) in name */
+    uint32_t                          hashmarks;
+
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
+    /* pio transfer buffer */
+    uint32_t                          pio_xfer_offset;
+    uint8_t                           *pio_xfer_buffer;
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
+    /* config options */
+    char                              *jsonfile;
+    int                               jsonfd;
+    bool                              force_secure_boot;
+    bool                              disable_custom_mode;
+    bool                              use_pio;
+};
+
+struct uefi_vars_cert {
+    QTAILQ_ENTRY(uefi_vars_cert)  next;
+    QemuUUID                      owner;
+    uint64_t                      size;
+    uint8_t                       data[];
+};
+
+struct uefi_vars_hash {
+    QTAILQ_ENTRY(uefi_vars_hash)  next;
+    QemuUUID                      owner;
+    uint8_t                       data[];
+};
+
+struct uefi_vars_siglist {
+    QTAILQ_HEAD(, uefi_vars_cert)  x509;
+    QTAILQ_HEAD(, uefi_vars_hash)  sha256;
+};
+
+/* vars-service-guid.c */
+extern const QemuUUID EfiGlobalVariable;
+extern const QemuUUID EfiImageSecurityDatabase;
+extern const QemuUUID EfiCustomModeEnable;
+extern const QemuUUID EfiSecureBootEnableDisable;
+
+extern const QemuUUID EfiCertSha256Guid;
+extern const QemuUUID EfiCertSha384Guid;
+extern const QemuUUID EfiCertSha512Guid;
+extern const QemuUUID EfiCertRsa2048Guid;
+extern const QemuUUID EfiCertX509Guid;
+extern const QemuUUID EfiCertTypePkcs7Guid;
+
+extern const QemuUUID EfiSmmVariableProtocolGuid;
+extern const QemuUUID VarCheckPolicyLibMmiHandlerGuid;
+
+extern const QemuUUID EfiEndOfDxeEventGroupGuid;
+extern const QemuUUID EfiEventReadyToBootGuid;
+extern const QemuUUID EfiEventExitBootServicesGuid;
+
+/* vars-service-utils.c */
+gboolean uefi_str_is_valid(const uint16_t *str, size_t len,
+                           gboolean must_be_null_terminated);
+size_t uefi_strlen(const uint16_t *str, size_t len);
+gboolean uefi_str_equal_ex(const uint16_t *a, size_t alen,
+                           const uint16_t *b, size_t blen,
+                           gboolean wildcards_in_a);
+gboolean uefi_str_equal(const uint16_t *a, size_t alen,
+                        const uint16_t *b, size_t blen);
+char *uefi_ucs2_to_ascii(const uint16_t *ucs2, uint64_t ucs2_size);
+int uefi_time_compare(efi_time *a, efi_time *b);
+void uefi_trace_variable(const char *action, QemuUUID guid,
+                         const uint16_t *name, uint64_t name_size);
+void uefi_trace_status(const char *action, efi_status status);
+
+/* vars-service-core.c */
+extern const VMStateDescription vmstate_uefi_vars;
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
+bool uefi_vars_is_sb_pk(uefi_variable *var);
+bool uefi_vars_is_sb_any(uefi_variable *var);
+efi_status uefi_vars_check_auth_2(uefi_vars_state *uv, uefi_variable *var,
+                                  mm_variable_access *va, void *data);
+efi_status uefi_vars_check_secure_boot(uefi_vars_state *uv, uefi_variable *var);
+void uefi_vars_auth_init(uefi_vars_state *uv);
+
+/* vars-service-pkcs7.c */
+efi_status uefi_vars_check_pkcs7_2(uefi_variable *siglist,
+                                   void **digest, uint32_t *digest_size,
+                                   mm_variable_access *va, void *data);
+
+/* vars-service-siglist.c */
+void uefi_vars_siglist_init(uefi_vars_siglist *siglist);
+void uefi_vars_siglist_free(uefi_vars_siglist *siglist);
+void uefi_vars_siglist_parse(uefi_vars_siglist *siglist,
+                             void *data, uint64_t size);
+uint64_t uefi_vars_siglist_blob_size(uefi_vars_siglist *siglist);
+void uefi_vars_siglist_blob_generate(uefi_vars_siglist *siglist,
+                                     void *data, uint64_t size);
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
2.48.1

