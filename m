Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp241647njb;
        Tue, 7 Jan 2025 07:36:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX0z5XAMFvPORCYRG12EycY2L0ACI80KRM3vu9aBlh/Um5wgKwYQ+/SF25bqZDh3JAr/jdL2jQUzLAJFA==@linaro.org
X-Google-Smtp-Source: AGHT+IG2KXB2wD1qMLTUHkbgjZ1maKT2fl7uX0t3PXH9laFi18WX9RYIQZVnQyGLrEBpnzFUP3Ii
X-Received: by 2002:a05:6214:c44:b0:6d8:7a85:59ca with SMTP id 6a1803df08f44-6df8e86b58bmr56119236d6.16.1736264192142;
        Tue, 07 Jan 2025 07:36:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736264192; cv=none;
        d=google.com; s=arc-20240605;
        b=ac4vozzdHDy21UhBokldm5uvuTHmfCMvNSKisULWoI0APH9O6l9bhSFzJbNDuVAF9M
         p87LsERVkQy3s4qqamk4WVqA8TfwLS+KwJL1ehVi6NRljupe2Jnm42AJhjkG3SVCaW/c
         e7rNQlBKfzn4WlN2I9UunUP0qjh78+AMPHfv3O6QwnvOFe8E7MaOgLP1IJOcEEAJ1PM7
         9Rlr5vmt8ZlaABgTC6GEe7eASfddvdGiM8jQv6GqdLACPmnYSDrjIitLSfonX6Gr2u1N
         13qxk9gJ5BwxtrIGu9c3Ap79fdv3/SLPyl4bvFotfx3Y/D8N2zK02wVxe18H6SBrFGqk
         AlDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qMgawXtrIVlaeM7Nd+w2ae5y0ULXzvEM2qhvmTnjdk4=;
        fh=2A4XrmpWSce8Hg7gb/jK7T/bzdECrSdzPXJ+gvyt/8c=;
        b=LDtmIVGOLNjDzMceA7RqT4rwuf1ANRsSKx5DX5zZ6huEODkH5jV1M5LaK6s56KR2Ky
         0B0706h5mgxLijeeJ3anc97abARmGTW78BfHU+y7+5a1J7cRqjyGK7vFOoHDnzyVElO4
         /yieojiKxycZYj8uNlIuBTfCQNTsAJB420DYW3BUF38JRYNarJVOcvsXrviE+gScWMyV
         qs8wNH7PjbP4JXJqdnzytkoT3WkJXKsnn/I/jH8lTPot1+LgaA2CI4h7eWWR5W2FTb8Q
         9i7BoIh/jQIRvwPhRu/4mbNHDwJsz27s7O5ZywvZromfT9siQlksyRQZc5zXIZjW0TVt
         8hTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jTxRSHUg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd1835c217si485921736d6.454.2025.01.07.07.36.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2025 07:36:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jTxRSHUg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tVBb3-0003D7-Gs; Tue, 07 Jan 2025 10:34:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tVBb1-0003C9-ID
 for qemu-devel@nongnu.org; Tue, 07 Jan 2025 10:34:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tVBb0-00056Q-4W
 for qemu-devel@nongnu.org; Tue, 07 Jan 2025 10:34:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736264057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qMgawXtrIVlaeM7Nd+w2ae5y0ULXzvEM2qhvmTnjdk4=;
 b=jTxRSHUgmCmpDz5GVav+SIRkmGOrolqXr6hQi+mmBBIocieWuCMuaNUrA/TFZYOlNlWQRo
 ATWG4v/dKtoSeS1oU0o17bsAGfGWzoGnsGqTxHeuQK8G3W98nrw9pTB69W0Rjempn6sQ9E
 f3TmcYmf9AyNzq3MM2XU97OWYGO1orc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-533-mtrcTVuGOe6ALPwc18U5qw-1; Tue,
 07 Jan 2025 10:34:14 -0500
X-MC-Unique: mtrcTVuGOe6ALPwc18U5qw-1
X-Mimecast-MFC-AGG-ID: mtrcTVuGOe6ALPwc18U5qw
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 339C91955DC3; Tue,  7 Jan 2025 15:34:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.66])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D37F11956088; Tue,  7 Jan 2025 15:34:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2825618003B7; Tue, 07 Jan 2025 16:33:54 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, graf@amazon.com,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 11/21] hw/uefi: add var-service-pkcs7-stub.c
Date: Tue,  7 Jan 2025 16:33:38 +0100
Message-ID: <20250107153353.1144978-12-kraxel@redhat.com>
In-Reply-To: <20250107153353.1144978-1-kraxel@redhat.com>
References: <20250107153353.1144978-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.437,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 6alhCw1MGscZ

pkcs7 stub which is used in case gnutls is not available.

It throws EFI_WRITE_PROTECTED errors unconditionally, so all
authenticated variables are readonly for the guest.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/uefi/var-service-pkcs7-stub.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 hw/uefi/var-service-pkcs7-stub.c

diff --git a/hw/uefi/var-service-pkcs7-stub.c b/hw/uefi/var-service-pkcs7-stub.c
new file mode 100644
index 000000000000..118cba446d4b
--- /dev/null
+++ b/hw/uefi/var-service-pkcs7-stub.c
@@ -0,0 +1,16 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * uefi vars device - pkcs7 stubs
+ */
+#include "qemu/osdep.h"
+#include "system/dma.h"
+
+#include "hw/uefi/var-service.h"
+
+efi_status uefi_vars_check_pkcs7_2(uefi_variable *siglist,
+                                   void **digest, uint32_t *digest_size,
+                                   mm_variable_access *va, void *data)
+{
+    return EFI_WRITE_PROTECTED;
+}
-- 
2.47.1

