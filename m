Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp335957njg;
        Tue, 25 Feb 2025 08:33:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXvhOl7LJxaebp1QSvq9vTSpk+XvWTI7cf1MML5+LFm109zWMlkoic1T7tuf6OE7rRqO+uXGFmv+dFdng==@linaro.org
X-Google-Smtp-Source: AGHT+IFYQpIKZqCEWtRb178QHOr4YG+SFXai5JvzKvcCcondsoDd0pOjK+5rvx+IFV1TK+6FQa9Y
X-Received: by 2002:ad4:5dea:0:b0:6e4:4393:de7 with SMTP id 6a1803df08f44-6e87ab066e8mr51211196d6.2.1740501186255;
        Tue, 25 Feb 2025 08:33:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740501186; cv=none;
        d=google.com; s=arc-20240605;
        b=SaNNFj0k6NetBCuixcAjCeiVd08m/IRSTw8uSwuRUgVZ5hXbXOFpxg43leZdoptObx
         QKuDIyb0ZI+e1Fl7uJQKe7aVzMfd0rdoH0D//rh6sxZBIBi0vle4VzuTCMhkyONEBlog
         MEKXMXQqcgIaB/FXU9pwlaeCATFI8+srh0yOwmC33ud7KRdAjZEGiW0pIQFd6XbWF2Nf
         imFPCV+k03gUw4DmeGhNNfq/WhjRv9eRANDGTWSPWr0N3kR+6K/nOlR4jdEPd/HSVmkW
         I/pqakq0H5itg0LjfLyq4XrOmxZ8COi9pTo4SwCpun3lnv+rwGowz2C3VaapTTm4ITNE
         n0Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YXNuajfZD2sOZfyoIVGSQeK/kNn6uyu2HvSacJoCJkI=;
        fh=mrCErM5HzBZPMbWrfhKaLB6Op7DKxeI6me6fB6ug8DQ=;
        b=eibr7YILO8OTL41sHQTTWICNmbBNq6PCoW6gDe0loP6IjiE/e9MEYTEyPKGoLEuiEN
         ASCllzoxP4pb2GQRQJpG1kcsVQ3K+Z5OwExQcgIzJnFhQPVRoJNWoOul77pj7wh0Nx5W
         tx/ZdRizVJlDnC0/OTfjv9pyhmPW0DejC9sBM2qjx9k3CPMaIz6q30uODml/Jh0dlTfX
         d+v/+w6v4TDFb1P4Z9ktMz6L/ARHK8EGk7PKd+TnKVVI5rxuuK59NBMX1obD0ahz6lL9
         TY9pXpLCsd7sIA6nC6knEugxihZuCE7cGoXa9pL+AYlytJLRl2F4usk1MnWEoTg4uKFL
         oy8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="MV4/cbj3";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e87b0e50dcsi20175286d6.331.2025.02.25.08.33.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 08:33:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="MV4/cbj3";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tmxqB-0001DW-AG; Tue, 25 Feb 2025 11:31:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxpp-000102-Fc
 for qemu-devel@nongnu.org; Tue, 25 Feb 2025 11:31:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxpn-0006Y8-F6
 for qemu-devel@nongnu.org; Tue, 25 Feb 2025 11:31:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740501062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YXNuajfZD2sOZfyoIVGSQeK/kNn6uyu2HvSacJoCJkI=;
 b=MV4/cbj3G3qtk0B+5bSaKONgTbpjDoHHAgdSaiH5i5RD9KGscMgRV2B5tvb7cWJVa9++Cf
 1G592lmA2Nfro+UxPSkMpMoyq9viXkxbCEyQtqOZLWFiNJzyqbTNnpWXdsqyMo41ZVIa4z
 IVsniPtn19SPyrOGICqGSmNCGGL4pzI=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-655-_okEJGAWNtqnSzUoO3IoRQ-1; Tue,
 25 Feb 2025 11:30:58 -0500
X-MC-Unique: _okEJGAWNtqnSzUoO3IoRQ-1
X-Mimecast-MFC-AGG-ID: _okEJGAWNtqnSzUoO3IoRQ_1740501056
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A539D18EB2CF; Tue, 25 Feb 2025 16:30:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.219])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 516161800949; Tue, 25 Feb 2025 16:30:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4F33E1800785; Tue, 25 Feb 2025 17:30:32 +0100 (CET)
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
Subject: [PATCH v5 12/24] hw/uefi: add var-service-pkcs7-stub.c
Date: Tue, 25 Feb 2025 17:30:16 +0100
Message-ID: <20250225163031.1409078-13-kraxel@redhat.com>
In-Reply-To: <20250225163031.1409078-1-kraxel@redhat.com>
References: <20250225163031.1409078-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: Nj4d6UOk1NC8

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

