Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp338448njg;
        Tue, 25 Feb 2025 08:37:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVmRFYsJ9ddNUWb+rsxQGwDKA5aJOi3Vpb7CtHeRFNRW/iCeRuLGJagt3NMztMoCTSEtzFkFgVT82ppEA==@linaro.org
X-Google-Smtp-Source: AGHT+IF+NUOUP+iU7m0ohoBu0JqH2zEKv2UdBA7Wsf3Gi99Y0vNyDd3yU9J3G6w4i+FfH7RWOBCH
X-Received: by 2002:a05:622a:1a91:b0:472:9ea:887b with SMTP id d75a77b69052e-47377116e3dmr48662641cf.10.1740501432547;
        Tue, 25 Feb 2025 08:37:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740501432; cv=none;
        d=google.com; s=arc-20240605;
        b=AsQiD6IGgqkFZPnlInQ3hZwQAdAgDvEQYLVRtyzpuW/1C8Ar6qUecwJC3ROgz7wymk
         BwRa+W7W0K8E/i+FEW/LKsEys+nxq+Hs4k/c62gQB20YMh+igm2ts4ZDN1BSE9hmoIJa
         1l+E4IIqGyVp4naOB10FTVGkR/2j4n06iu/iUexZfLD6PmncCJRucVbQA9jtFo5URPcD
         mOJdxGk6O55eit9Y/NO0Bm3WQE3dIlCJa3n7jgsjW+p870okMEoTJq4SutPbNrUMRz1T
         vy+MDjYw7SJELnrvKzHlwZmBeESVU0BDQn9oyeYKjHBYKHkQW0bnFR6Vm/XV6iipPmci
         SDfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dihYdzQJoxG55KPRUrzoXBvN3cz1o1fWZpT8/A+vLW4=;
        fh=mrCErM5HzBZPMbWrfhKaLB6Op7DKxeI6me6fB6ug8DQ=;
        b=DxwEmFa+Dff1k9JJPjFHJVpNOMzs4VAlMRlJLKXtgqbmB/8oV1OGspJbslw8O25rRV
         2ZATEa7qEDBppOjtBOSJLNp5tZeKqU5h8RcVzxkYrdF/U18+JZ7V8AYdk3Fk9s+FqvFm
         pyCug/9HmRku5oOkRKeJimS+bAaxQsjtTwcVc6XeM+NpyGdbC5VjF51kxDlyvWO7gXxs
         jd3AsLt28arKMp/nucVFT3OIpSQAV3H6wmmg1EBqpqJ3tK3I1COv7XXhwdKcaTOEaoKX
         UDZW6GNm85NUiI8hmcbjbJ7bYo2BzzrTxdXo+I8dgeuSEzgAOLP1nZOXod5oFd3O7okp
         ciLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JExd3+o8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47377e2fb2csi20187341cf.155.2025.02.25.08.37.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 08:37:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JExd3+o8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmxpn-0000yT-CU; Tue, 25 Feb 2025 11:31:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxph-0000s5-Tr
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 11:30:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxpf-0006W1-T5
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 11:30:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740501055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dihYdzQJoxG55KPRUrzoXBvN3cz1o1fWZpT8/A+vLW4=;
 b=JExd3+o8wTYeuEU5ECjg76c2JLGmmyTaSP02JizC1FSmSKq9+xIBpcbVu+tnN+imZ5Pb31
 khCYMOtbMPGt71z0PWqfN4UBDwxOOsdy8Bi94rUX8CI/vQePGIQtItKxY0ztI3prbK6ivg
 EmqyDmGPjWbH2/5ODcHTqMO+t7F1fcc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-bP0CC7vGOhezVQ7wH4RUtQ-1; Tue,
 25 Feb 2025 11:30:51 -0500
X-MC-Unique: bP0CC7vGOhezVQ7wH4RUtQ-1
X-Mimecast-MFC-AGG-ID: bP0CC7vGOhezVQ7wH4RUtQ_1740501049
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E82201809C91; Tue, 25 Feb 2025 16:30:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.219])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5E9A319560AE; Tue, 25 Feb 2025 16:30:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DCA561800637; Tue, 25 Feb 2025 17:30:31 +0100 (CET)
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
Subject: [PATCH v5 06/24] hw/uefi: add var-service-utils.c
Date: Tue, 25 Feb 2025 17:30:10 +0100
Message-ID: <20250225163031.1409078-7-kraxel@redhat.com>
In-Reply-To: <20250225163031.1409078-1-kraxel@redhat.com>
References: <20250225163031.1409078-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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
X-TUID: T9xNT+Bax/Zf

Add utility functions.  Helpers for UEFI (ucs2) string handling.
Helpers for readable trace messages.  Compare UEFI time stamps.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/uefi/var-service-utils.c | 241 ++++++++++++++++++++++++++++++++++++
 1 file changed, 241 insertions(+)
 create mode 100644 hw/uefi/var-service-utils.c

diff --git a/hw/uefi/var-service-utils.c b/hw/uefi/var-service-utils.c
new file mode 100644
index 000000000000..c9ef46570f48
--- /dev/null
+++ b/hw/uefi/var-service-utils.c
@@ -0,0 +1,241 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * uefi vars device - helper functions for ucs2 strings and tracing
+ */
+#include "qemu/osdep.h"
+#include "system/dma.h"
+
+#include "hw/uefi/var-service.h"
+
+#include "trace/trace-hw_uefi.h"
+
+/* ------------------------------------------------------------------ */
+
+/*
+ * string helper functions.
+ *
+ * Most of the time uefi ucs2 strings are NULL-terminated, except
+ * sometimes when they are not (for example in variable policies).
+ */
+
+gboolean uefi_str_is_valid(const uint16_t *str, size_t len,
+                           gboolean must_be_null_terminated)
+{
+    size_t pos = 0;
+
+    for (;;) {
+        if (pos == len) {
+            if (must_be_null_terminated) {
+                return false;
+            } else {
+                return true;
+            }
+        }
+        switch (str[pos]) {
+        case 0:
+            /* end of string */
+            return true;
+        case 0xd800 ... 0xdfff:
+            /* reject surrogates */
+            return false;
+        default:
+            /* char is good, check next */
+            break;
+        }
+        pos++;
+    }
+}
+
+size_t uefi_strlen(const uint16_t *str, size_t len)
+{
+    size_t pos = 0;
+
+    for (;;) {
+        if (pos == len) {
+            return pos;
+        }
+        if (str[pos] == 0) {
+            return pos;
+        }
+        pos++;
+    }
+}
+
+gboolean uefi_str_equal_ex(const uint16_t *a, size_t alen,
+                           const uint16_t *b, size_t blen,
+                           gboolean wildcards_in_a)
+{
+    size_t pos = 0;
+
+    alen = alen / 2;
+    blen = blen / 2;
+    for (;;) {
+        if (pos == alen && pos == blen) {
+            return true;
+        }
+        if (pos == alen && b[pos] == 0) {
+            return true;
+        }
+        if (pos == blen && a[pos] == 0) {
+            return true;
+        }
+        if (pos == alen || pos == blen) {
+            return false;
+        }
+        if (a[pos] == 0 && b[pos] == 0) {
+            return true;
+        }
+
+        if (wildcards_in_a && a[pos] == '#') {
+            if (!isxdigit(b[pos])) {
+                return false;
+            }
+        } else {
+            if (a[pos] != b[pos]) {
+                return false;
+            }
+        }
+        pos++;
+    }
+}
+
+gboolean uefi_str_equal(const uint16_t *a, size_t alen,
+                        const uint16_t *b, size_t blen)
+{
+    return uefi_str_equal_ex(a, alen, b, blen, false);
+}
+
+char *uefi_ucs2_to_ascii(const uint16_t *ucs2, uint64_t ucs2_size)
+{
+    char *str = g_malloc0(ucs2_size / 2 + 1);
+    int i;
+
+    for (i = 0; i * 2 < ucs2_size; i++) {
+        if (ucs2[i] == 0) {
+            break;
+        }
+        if (ucs2[i] < 128) {
+            str[i] = ucs2[i];
+        } else {
+            str[i] = '?';
+        }
+    }
+    str[i] = 0;
+    return str;
+}
+
+/* ------------------------------------------------------------------ */
+/* time helper functions                                              */
+
+int uefi_time_compare(efi_time *a, efi_time *b)
+{
+    if (a->year < b->year) {
+        return -1;
+    }
+    if (a->year > b->year) {
+        return 1;
+    }
+
+    if (a->month < b->month) {
+        return -1;
+    }
+    if (a->month > b->month) {
+        return 1;
+    }
+
+    if (a->day < b->day) {
+        return -1;
+    }
+    if (a->day > b->day) {
+        return 1;
+    }
+
+    if (a->hour < b->hour) {
+        return -1;
+    }
+    if (a->hour > b->hour) {
+        return 1;
+    }
+
+    if (a->minute < b->minute) {
+        return -1;
+    }
+    if (a->minute > b->minute) {
+        return 1;
+    }
+
+    if (a->second < b->second) {
+        return -1;
+    }
+    if (a->second > b->second) {
+        return 1;
+    }
+
+    if (a->nanosecond < b->nanosecond) {
+        return -1;
+    }
+    if (a->nanosecond > b->nanosecond) {
+        return 1;
+    }
+
+    return 0;
+}
+
+/* ------------------------------------------------------------------ */
+/* tracing helper functions                                           */
+
+void uefi_trace_variable(const char *action, QemuUUID guid,
+                         const uint16_t *name, uint64_t name_size)
+{
+    QemuUUID be = qemu_uuid_bswap(guid);
+    char *str_uuid = qemu_uuid_unparse_strdup(&be);
+    char *str_name = uefi_ucs2_to_ascii(name, name_size);
+
+    trace_uefi_variable(action, str_name, name_size, str_uuid);
+
+    g_free(str_name);
+    g_free(str_uuid);
+}
+
+void uefi_trace_status(const char *action, efi_status status)
+{
+    switch (status) {
+    case EFI_SUCCESS:
+        trace_uefi_status(action, "success");
+        break;
+    case EFI_INVALID_PARAMETER:
+        trace_uefi_status(action, "invalid parameter");
+        break;
+    case EFI_UNSUPPORTED:
+        trace_uefi_status(action, "unsupported");
+        break;
+    case EFI_BAD_BUFFER_SIZE:
+        trace_uefi_status(action, "bad buffer size");
+        break;
+    case EFI_BUFFER_TOO_SMALL:
+        trace_uefi_status(action, "buffer too small");
+        break;
+    case EFI_WRITE_PROTECTED:
+        trace_uefi_status(action, "write protected");
+        break;
+    case EFI_OUT_OF_RESOURCES:
+        trace_uefi_status(action, "out of resources");
+        break;
+    case EFI_NOT_FOUND:
+        trace_uefi_status(action, "not found");
+        break;
+    case EFI_ACCESS_DENIED:
+        trace_uefi_status(action, "access denied");
+        break;
+    case EFI_ALREADY_STARTED:
+        trace_uefi_status(action, "already started");
+        break;
+    case EFI_SECURITY_VIOLATION:
+        trace_uefi_status(action, "security violation");
+        break;
+    default:
+        trace_uefi_status(action, "unknown error");
+        break;
+    }
+}
-- 
2.48.1

