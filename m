Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp97616njm;
        Tue, 4 Mar 2025 04:51:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVafcKC0y4cofv3qoVCcNfslK/S40RkEVusDOY8xfiZ1PIMJW+9fILy8QYFcAE7cGzu1/9H3MQr6K6WQA==@linaro.org
X-Google-Smtp-Source: AGHT+IEQovR6QIckJj9GXcjK+RSI8YjUel0eoKYxLTOggKJ1C3g874AvOCuXkh+pbpHt8gbUEeog
X-Received: by 2002:ad4:5ba3:0:b0:6e8:98c0:e546 with SMTP id 6a1803df08f44-6e8a0d86339mr226963816d6.29.1741092677124;
        Tue, 04 Mar 2025 04:51:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741092677; cv=none;
        d=google.com; s=arc-20240605;
        b=Ruk18MdGHqpjqovBT/+xgghfnlk2oHHr+hFpJehXgunCcZYQHxxKIT/og3GdQdV6zg
         DhO2IlY1LR0X+PqVL0ZXkZd+tBiEyDn13zGWIoM2sW8Jyq8YkArklc16VcnY4E+8rAhd
         v2jzw78jDivcVXFoKjwZWbfOSWB3pZPYL3Yv67AuJ5eqxMfGagauEOGXA26u5xlmoXEr
         Z+394eEUeI5GFoSKzqQzZJ8rJx9Yucb+VsywxHHhnLqRLaAwVaPBm/IFa6dy+tGcqrID
         b2ybUNJkYvIXNfnoAOhQXLnYbKq3pAY6LABWmQKfaEtP8H4hSL03K9xZLdiOl9OKVpN0
         f/NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ydBGlShTDPJYMLjz/X2qz59THSz0YWcjw1GnDWb2eHo=;
        fh=AUxCU78jacJE1vSghMJJha3+F2+VikVKZl38eSKs5/I=;
        b=FdRcGm73yc72BXoMNf9NggtmYElo6a9uxI5RiPHCXFpMCoTJfcrc7XiQMrfywifG0j
         leTjIYu37f+OU9/gDLdBK5eTSDhgbv5NNP5OvcFK3H2HKyOMKluFYfhWyxzkzkHzceyj
         nusQDSWJcPoXN/K6IP/GJa3laLW4KV2O7kPjaagV/rDBrK08ZUsFiZWdtWRN6mO1OQpJ
         c5FDl1yjLTsLUnHfYtlBmL+cUrHYJXwLbs8sXrZItl28xCjeUiQXv/FckPq0Ij5WLuxt
         wVcZp6wIfXXaXro81ZA2W7sh02/avaT0YiLxEf9frTeWJRFqt6EOABcb9vLtdKVrsfev
         m36g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=My8rdX+W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8976d09e0si105213426d6.336.2025.03.04.04.51.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Mar 2025 04:51:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=My8rdX+W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tpRhh-0004sz-TS; Tue, 04 Mar 2025 07:48:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tpRhZ-0004n3-Om
 for qemu-devel@nongnu.org; Tue, 04 Mar 2025 07:48:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tpRhX-0006m5-9D
 for qemu-devel@nongnu.org; Tue, 04 Mar 2025 07:48:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741092526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydBGlShTDPJYMLjz/X2qz59THSz0YWcjw1GnDWb2eHo=;
 b=My8rdX+WOBqDTRwsoHQ/E8e9VzWRA1JJhSDOMtELJIcTYpkhAYimDHdZPYiWOUZAcLA1Hr
 j8CQEhOw2CsAg+N/PTeipmfqjWvVenGwRt+47eCPjrjTqdQO1Jckvbd9oBUlVybQCM9fDW
 we+AL+r7+1KqBJ3A8CXPoa0WB8xAfvk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-160-X5H4n883PPWqhEaGN0bJIA-1; Tue,
 04 Mar 2025 07:48:43 -0500
X-MC-Unique: X5H4n883PPWqhEaGN0bJIA-1
X-Mimecast-MFC-AGG-ID: X5H4n883PPWqhEaGN0bJIA_1741092522
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 12DB31801A1F; Tue,  4 Mar 2025 12:48:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.122])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A13831800361; Tue,  4 Mar 2025 12:48:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0DC8118003B9; Tue, 04 Mar 2025 13:48:16 +0100 (CET)
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
Subject: [PULL 13/24] hw/uefi: add var-service-siglist.c
Date: Tue,  4 Mar 2025 13:48:01 +0100
Message-ID: <20250304124815.591749-14-kraxel@redhat.com>
In-Reply-To: <20250304124815.591749-1-kraxel@redhat.com>
References: <20250304124815.591749-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-TUID: pZ2SSfFanFk7

Functions to serialize and de-serialize EFI signature databases.  This
is needed to merge signature databases (happens in practice when
appending dbx updates) and also to extract the certificates for
pkcs7 signature verification.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20250225163031.1409078-14-kraxel@redhat.com>
---
 hw/uefi/var-service-siglist.c | 212 ++++++++++++++++++++++++++++++++++
 1 file changed, 212 insertions(+)
 create mode 100644 hw/uefi/var-service-siglist.c

diff --git a/hw/uefi/var-service-siglist.c b/hw/uefi/var-service-siglist.c
new file mode 100644
index 000000000000..8948f1b78471
--- /dev/null
+++ b/hw/uefi/var-service-siglist.c
@@ -0,0 +1,212 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * uefi vars device - parse and generate efi signature databases
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "system/dma.h"
+
+#include "hw/uefi/var-service.h"
+
+/*
+ * Add x509 certificate to list (with duplicate check).
+ */
+static void uefi_vars_siglist_add_x509(uefi_vars_siglist *siglist,
+                                       QemuUUID *owner,
+                                       void *data, uint64_t size)
+{
+    uefi_vars_cert *c;
+
+    QTAILQ_FOREACH(c, &siglist->x509, next) {
+        if (c->size != size) {
+            continue;
+        }
+        if (memcmp(c->data, data, size) != 0) {
+            continue;
+        }
+        return;
+    }
+
+    c = g_malloc(sizeof(*c) + size);
+    c->owner = *owner;
+    c->size = size;
+    memcpy(c->data, data, size);
+    QTAILQ_INSERT_TAIL(&siglist->x509, c, next);
+}
+
+/*
+ * Add sha256 hash to list (with duplicate check).
+ */
+static void uefi_vars_siglist_add_sha256(uefi_vars_siglist *siglist,
+                                         QemuUUID *owner,
+                                         void *data)
+{
+    uefi_vars_hash *h;
+
+    QTAILQ_FOREACH(h, &siglist->sha256, next) {
+        if (memcmp(h->data, data, 32) != 0) {
+            continue;
+        }
+        return;
+    }
+
+    h = g_malloc(sizeof(*h) + 32);
+    h->owner = *owner;
+    memcpy(h->data, data, 32);
+    QTAILQ_INSERT_TAIL(&siglist->sha256, h, next);
+}
+
+void uefi_vars_siglist_init(uefi_vars_siglist *siglist)
+{
+    memset(siglist, 0, sizeof(*siglist));
+    QTAILQ_INIT(&siglist->x509);
+    QTAILQ_INIT(&siglist->sha256);
+}
+
+void uefi_vars_siglist_free(uefi_vars_siglist *siglist)
+{
+    uefi_vars_cert *c, *cs;
+    uefi_vars_hash *h, *hs;
+
+    QTAILQ_FOREACH_SAFE(c, &siglist->x509, next, cs) {
+        QTAILQ_REMOVE(&siglist->x509, c, next);
+        g_free(c);
+    }
+    QTAILQ_FOREACH_SAFE(h, &siglist->sha256, next, hs) {
+        QTAILQ_REMOVE(&siglist->sha256, h, next);
+        g_free(h);
+    }
+}
+
+/*
+ * Parse UEFI signature list.
+ */
+void uefi_vars_siglist_parse(uefi_vars_siglist *siglist,
+                             void *data, uint64_t size)
+{
+    efi_siglist *efilist;
+    uint64_t start;
+
+    while (size) {
+        if (size < sizeof(*efilist)) {
+            break;
+        }
+        efilist = data;
+        if (size < efilist->siglist_size) {
+            break;
+        }
+
+        if (uadd64_overflow(sizeof(*efilist), efilist->header_size, &start)) {
+            break;
+        }
+        if (efilist->sig_size <= sizeof(QemuUUID)) {
+            break;
+        }
+
+        if (qemu_uuid_is_equal(&efilist->guid_type, &EfiCertX509Guid)) {
+            if (start + efilist->sig_size != efilist->siglist_size) {
+                break;
+            }
+            uefi_vars_siglist_add_x509(siglist,
+                                       (QemuUUID *)(data + start),
+                                       data + start + sizeof(QemuUUID),
+                                       efilist->sig_size - sizeof(QemuUUID));
+
+        } else if (qemu_uuid_is_equal(&efilist->guid_type, &EfiCertSha256Guid)) {
+            if (efilist->sig_size != sizeof(QemuUUID) + 32) {
+                break;
+            }
+            if (start + efilist->sig_size > efilist->siglist_size) {
+                break;
+            }
+            while (start <= efilist->siglist_size - efilist->sig_size) {
+                uefi_vars_siglist_add_sha256(siglist,
+                                             (QemuUUID *)(data + start),
+                                             data + start + sizeof(QemuUUID));
+                start += efilist->sig_size;
+            }
+
+        } else {
+            QemuUUID be = qemu_uuid_bswap(efilist->guid_type);
+            char *str_uuid = qemu_uuid_unparse_strdup(&be);
+            warn_report("%s: unknown type (%s)", __func__, str_uuid);
+            g_free(str_uuid);
+        }
+
+        data += efilist->siglist_size;
+        size -= efilist->siglist_size;
+    }
+}
+
+uint64_t uefi_vars_siglist_blob_size(uefi_vars_siglist *siglist)
+{
+    uefi_vars_cert *c;
+    uefi_vars_hash *h;
+    uint64_t size = 0;
+
+    QTAILQ_FOREACH(c, &siglist->x509, next) {
+        size += sizeof(efi_siglist) + sizeof(QemuUUID) + c->size;
+    }
+
+    if (!QTAILQ_EMPTY(&siglist->sha256)) {
+        size += sizeof(efi_siglist);
+        QTAILQ_FOREACH(h, &siglist->sha256, next) {
+            size += sizeof(QemuUUID) + 32;
+        }
+    }
+
+    return size;
+}
+
+/*
+ * Generate UEFI signature list.
+ */
+void uefi_vars_siglist_blob_generate(uefi_vars_siglist *siglist,
+                                     void *data, uint64_t size)
+{
+    uefi_vars_cert *c;
+    uefi_vars_hash *h;
+    efi_siglist *efilist;
+    uint64_t pos = 0, start;
+    uint32_t i;
+
+    QTAILQ_FOREACH(c, &siglist->x509, next) {
+        efilist = data + pos;
+        efilist->guid_type = EfiCertX509Guid;
+        efilist->sig_size = sizeof(QemuUUID) + c->size;
+        efilist->header_size = 0;
+
+        start = pos + sizeof(efi_siglist);
+        memcpy(data + start,
+               &c->owner, sizeof(QemuUUID));
+        memcpy(data + start + sizeof(QemuUUID),
+               c->data, c->size);
+
+        efilist->siglist_size = sizeof(efi_siglist) + efilist->sig_size;
+        pos += efilist->siglist_size;
+    }
+
+    if (!QTAILQ_EMPTY(&siglist->sha256)) {
+        efilist = data + pos;
+        efilist->guid_type = EfiCertSha256Guid;
+        efilist->sig_size = sizeof(QemuUUID) + 32;
+        efilist->header_size = 0;
+
+        i = 0;
+        start = pos + sizeof(efi_siglist);
+        QTAILQ_FOREACH(h, &siglist->sha256, next) {
+            memcpy(data + start + efilist->sig_size * i,
+                   &h->owner, sizeof(QemuUUID));
+            memcpy(data + start + efilist->sig_size * i + sizeof(QemuUUID),
+                   h->data, 32);
+            i++;
+        }
+
+        efilist->siglist_size = sizeof(efi_siglist) + efilist->sig_size * i;
+        pos += efilist->siglist_size;
+    }
+
+    assert(pos == size);
+}
-- 
2.48.1

