Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp191840njb;
        Tue, 11 Feb 2025 01:25:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUjyLMxaNdlGTYBgdOQd7FLSN+EGxCzHmMJtu4x0f9wbu/4gXaK+Gz1NCtwn8UICcwAphMOwsWgGLDA2w==@linaro.org
X-Google-Smtp-Source: AGHT+IEg4z+dvmO/Xyw2epUn9Fv5EZphe4ubixMpo2Kp+vICrA+3DZm3iNTMArj8vASJ+Sjwfrzw
X-Received: by 2002:ad4:5d4e:0:b0:6d8:7ed4:336a with SMTP id 6a1803df08f44-6e46788825fmr47125076d6.31.1739265905862;
        Tue, 11 Feb 2025 01:25:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739265905; cv=none;
        d=google.com; s=arc-20240605;
        b=Kt6S4bHUZOy+P7DEb/exn53XBa5Ui7hV4Gl0HvarYyoLXUU7yzxtXHAK7QZpezpEP8
         L0FZa9sXscp0McVitJOSS6bIzeAlCS5CFFa8WYInEA9LN4FC62Ww+vlNwXN5A4NQb94A
         qSyHoOzbMdH1NsoLFolzLRXSslv/gPFPjHLePBEqZui4LZMGBmOOdgGOuo5CZN6PsxyE
         w1siLrdfJ7l8oog57GjRVjeu1bxsJaTRg3xUK1rl+xrEWffIumhUvAKJ5vjRs/dXygex
         lMsd+FafcGs0sE0jFQA7yEKzqWl1k9eZUnTCFqkXxQVSdpfZhQkuIfhaAedjkzJ0v5gQ
         cKcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YXNuajfZD2sOZfyoIVGSQeK/kNn6uyu2HvSacJoCJkI=;
        fh=e1SboN20/jHvoiD1YSHiGEBjk/mnJDcFYjKWtsBcI2Q=;
        b=SxD+3FJLyDsP17vloKu/Zb+z9TvlO1/T2V1IeEZcvxuDpbadqtoVp00+PATwU7EVCr
         MwyLma4b2Cmn1JkjcMg4Y7XD2+Z1MLBCAnWzyGLo+p9NGmUFq45paNYk66NDGRiL6DxD
         2liWXM3C8O1qPMgHrYKhjWFn9LpcseXbn8z8zSRvy8ZZIMvLI7NziuOV0nbO+hCfVuJ4
         MeCo7pG1DbPYtVJMwyOw6wzYxjJp/CjprJqtZhXfLpRRqm2eXW9kM1wwYYsf63PRMxkV
         B2/bR3MMlGMb3JTySZ1/4ymHAyY7QYVJ14LPzON1Pp29dcr8rGI7b8ULapS3V0N9CAM3
         UDAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gdn4xyIH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e45e493437si41849796d6.394.2025.02.11.01.25.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2025 01:25:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gdn4xyIH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1thmV4-0002pa-Da; Tue, 11 Feb 2025 04:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1thmUr-0002Ij-Mp
 for qemu-devel@nongnu.org; Tue, 11 Feb 2025 04:24:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1thmUj-00032D-P6
 for qemu-devel@nongnu.org; Tue, 11 Feb 2025 04:24:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739265833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YXNuajfZD2sOZfyoIVGSQeK/kNn6uyu2HvSacJoCJkI=;
 b=gdn4xyIHl1sp2ru3sz/TNpZZHzT64aVDFHhjf5hCp03XuFKoqlWmxoMd7O4sA9gk5pvXNR
 HKPyEdXV4d45y5+0mSmxuPpsOxAFQCzyI/q/2Y/d+lcjdtzY7IvHVFEsqvshOqVP4lSivM
 C4ug71JZcflXHjWghUD1rzeWU24Wx5A=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-280-wLiZdyKMMrmzzkaKFG3bMg-1; Tue,
 11 Feb 2025 04:23:48 -0500
X-MC-Unique: wLiZdyKMMrmzzkaKFG3bMg-1
X-Mimecast-MFC-AGG-ID: wLiZdyKMMrmzzkaKFG3bMg
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8F7621800873; Tue, 11 Feb 2025 09:23:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.57])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 479151956048; Tue, 11 Feb 2025 09:23:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 39ABF1800607; Tue, 11 Feb 2025 10:23:25 +0100 (CET)
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
Subject: [PATCH v3 11/23] hw/uefi: add var-service-pkcs7-stub.c
Date: Tue, 11 Feb 2025 10:23:09 +0100
Message-ID: <20250211092324.965440-12-kraxel@redhat.com>
In-Reply-To: <20250211092324.965440-1-kraxel@redhat.com>
References: <20250211092324.965440-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.388,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: CmqeAY7ILNPN

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
2.48.1

