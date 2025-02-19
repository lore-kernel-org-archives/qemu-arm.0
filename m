Received: by 2002:a05:7022:983:b0:97:989a:5032 with SMTP id bt3csp1282078dlb;
        Tue, 18 Feb 2025 23:16:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX2m4wTUpvBZ29Y+I9gcKU13JGQO2WIZvfgRwnh9taaVv0BrQgfYgGFUAWtXNoLXSLJpC90JLcfJ3dZgQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGP5mujNRAsAUz1+i3pPTyCrhMjZnbTA8qrDmSsz7wBZrEKkz8XnrOQyqFCiujv0xRvZBrd
X-Received: by 2002:a05:6214:d4e:b0:6e6:60f6:56ce with SMTP id 6a1803df08f44-6e69755ce34mr36663176d6.30.1739949368862;
        Tue, 18 Feb 2025 23:16:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739949368; cv=none;
        d=google.com; s=arc-20240605;
        b=IWCEkra60etnwW2JHnjV3aEQlgYNZ+buX345Le778M3FHcggxHsjnS+XaXk1KnG+lp
         nrpao7GSJwG1HzRGBm22pP60dJHUyymYpK6y3aVqXzosybOy368GZM6+WYXvTVF7i5Gh
         iP4hwHceoi7pDqYBbsBmnDY3/jYoBMAFPQW9LUwvC5uaNA9S7W5adGj7Nim97vZ+GvO6
         4ihFiOIBy13aMFgk1JPGLuket/3y8u8CAitIApnNKHI87DO/KEWRngMSYLqOEc6gd7Ef
         rxVk0Sb6bg99YPPNCe62VyWJXYpkxIrJzR500wezxHxElIxxZY6tS3/Q5WbanCVUQsRS
         Tdyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2C3MQfxsHzqoz1N1jySQWU4IrjHYH3kDMVlfJAq6FNU=;
        fh=KhXLSX8c6wVmhLa/nUuNp/bImSZbg0QIIf+cCdMOZ3k=;
        b=EPSzYcrE7g0Zp0007kqIsJwWJ13HEM5/8+ckavd60kKHr3Aln5jxiJe4GMNvN/qSi5
         WsWMcEwUpbxOa7D9wl7UVaoeMIEIV7eIeI4PUr3v3snrfBJQtgdYYNyikj/ux3JuT2Wo
         7TxfgZ7qvi58L2/Um47nFqhL1SZ+Kde9Oa6oDYQtsU+64IS3ecBm45DaWMPRWspmkEa7
         ymVGGA/MQ4h/z39S0njx1MPaj+NHn5a/7glR1CDJvDk50ll2AicLmG7TzRzCsuwOGIDO
         BmaBpvtbvVJINeEphUke2lKDQuuGmFmzrOngep3VLL6W8yrD5bq8vdjM0KLVYUCOMyo1
         Z4tg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c98BdIA1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9c0fd3si125334496d6.363.2025.02.18.23.16.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2025 23:16:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c98BdIA1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tkeJE-0002wh-2q; Wed, 19 Feb 2025 02:15:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tkeIH-0002C7-Nd
 for qemu-devel@nongnu.org; Wed, 19 Feb 2025 02:14:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tkeIF-0004yz-Ct
 for qemu-devel@nongnu.org; Wed, 19 Feb 2025 02:14:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739949289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2C3MQfxsHzqoz1N1jySQWU4IrjHYH3kDMVlfJAq6FNU=;
 b=c98BdIA1ST+64MvdvDwZIggHMnqP8VRQCMsT7uUEiDkw2OSv2kPgdP72ywKL66dysUwdRw
 aNzygNCWToNCpez+txv48mE8+w/+j6ox764DO0b6kLJmnJvPMOutMVC2NGhB/aj6u0dahe
 NyniIw2iaLPz/D9haVRK9Lz4jbbm0y8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-398-znn-YfodP_mgVDDFFqX5wg-1; Wed,
 19 Feb 2025 02:14:47 -0500
X-MC-Unique: znn-YfodP_mgVDDFFqX5wg-1
X-Mimecast-MFC-AGG-ID: znn-YfodP_mgVDDFFqX5wg_1739949286
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2FBD11979057; Wed, 19 Feb 2025 07:14:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.78])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7FF841956094; Wed, 19 Feb 2025 07:14:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3021D1801A8E; Wed, 19 Feb 2025 08:14:32 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Ard Biesheuvel <ardb@kernel.org>,
 Michael Roth <michael.roth@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 graf@amazon.com, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v4 04/24] hw/uefi: add include/hw/uefi/var-service.h
Date: Wed, 19 Feb 2025 08:14:06 +0100
Message-ID: <20250219071431.50626-5-kraxel@redhat.com>
In-Reply-To: <20250219071431.50626-1-kraxel@redhat.com>
References: <20250219071431.50626-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.423,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 9b0ztJKR9kXO

Add state structs and function declarations for the uefi-vars device.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
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

