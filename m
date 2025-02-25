Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp335883njg;
        Tue, 25 Feb 2025 08:33:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX0rOWHVfTbrwFxLuB8ghy4+KnvSM5gx+FP1m7O0sNXLjNXIqB0CLJSEG2GUSecz4HRlJtV9+BdvsNZEg==@linaro.org
X-Google-Smtp-Source: AGHT+IHcNy3oxzGiD9hbc8ZaTMi7A7zErk/3+Lss+nq+ZRM7zeq2Y0CrebpMPNlcf/sJdT7I0jsd
X-Received: by 2002:ad4:5bae:0:b0:6d8:8a60:ef2c with SMTP id 6a1803df08f44-6e6ae7cae9fmr245197956d6.2.1740501180197;
        Tue, 25 Feb 2025 08:33:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740501180; cv=none;
        d=google.com; s=arc-20240605;
        b=VuPI0lSQtJcJKqS73j4yzKxOgL0oM1JZ8qnNudzKLEC/9elxpsf2/jlQhEP4Ciluv2
         RV9mG5uTBMtAr5LuuBhHmICJksNFZm0swEW6X8PPJU2nHV/xKf9Fwcgom9nV+FcaZfY4
         iF8qT0cC2XqJLLHA3whxJn9RKwLu+V8AIeOJAQFl2TLxlhS7ssGQgiCG5dyI3ZAFHxZD
         zHO5ENO/K182EhzrDYpv6LyKR2mUPMWQgVcttzXgcfDoeP6fyJ4Mu6/N1xfYogFPgDaJ
         F9Xc//csSbKtRq/hBY7GsN54KUUtYbEk7RMEogpIQNq30fjjHm0orGIhPXZTZ1iG2qP3
         OWiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wOer/6VbqiVqzLTMzfoKp9zAj6wgPpc1uo9nDs4+w9o=;
        fh=K2spx49ASQNOg4/kEE8tarQJWGbPnz5TAINAnLmZY1s=;
        b=VZueg9QUl/5BlUG/iIxeedRAPL3d6iT8UWPlPinfmFLkz/gcDZWtWCyXUXOP0CkjkL
         SBm30G6MIyH/1dOnQiLSTm6dwgmJdfI7tykfaa7mjP/EbfFMvieK+MaYtHiChQe9CmtL
         AyXbWvkhkiRZ+8JHjJMAcQQHm/r33GTeCDp0luR97FFiAVki0GKG6RogHhH1FMUQBKVw
         zn4R2lWLoxxdqQKWzVs41y2ERizdT9FbYylW2fc34wfRN7q33hzBh4jIUgKIfZZOFKNA
         ST2QuEbFbtAeyiHjPcnLk+mwYjcoaGOBguge4Lt0LFaiKz9NEmAwouY5IuoTE2/JnAQB
         TRhA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WhjogMG8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e87b046938si20738946d6.157.2025.02.25.08.33.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 08:33:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WhjogMG8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmxpp-0000zT-56; Tue, 25 Feb 2025 11:31:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxpe-0000pj-Jz
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 11:30:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxpX-0006UN-Sr
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 11:30:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740501044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wOer/6VbqiVqzLTMzfoKp9zAj6wgPpc1uo9nDs4+w9o=;
 b=WhjogMG8/3uQebTOeF49msUHCuYUeh/h6eKbsAFMelLjqBXN6bqV8FTqlkWGF6IxhyPywT
 mkfztAMQIj01bsz5y3Q/yu1hOMTs7Oy8cNxl1U+uwSKJNfAARb32+3hzMih9mzFxeU4UQh
 h1S9OAbdYf/MtygmPkCl1G2exoMFgIw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-613-mRL4Q1noOtyjNQZCGfU1Xw-1; Tue,
 25 Feb 2025 11:30:41 -0500
X-MC-Unique: mRL4Q1noOtyjNQZCGfU1Xw-1
X-Mimecast-MFC-AGG-ID: mRL4Q1noOtyjNQZCGfU1Xw_1740501039
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 80EBA1800570; Tue, 25 Feb 2025 16:30:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.219])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8AB6919560A3; Tue, 25 Feb 2025 16:30:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9BFF91800384; Tue, 25 Feb 2025 17:30:31 +0100 (CET)
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
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Subject: [PATCH v5 02/24] hw/uefi: add include/hw/uefi/var-service-api.h
Date: Tue, 25 Feb 2025 17:30:06 +0100
Message-ID: <20250225163031.1409078-3-kraxel@redhat.com>
In-Reply-To: <20250225163031.1409078-1-kraxel@redhat.com>
References: <20250225163031.1409078-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: e6JQ4B7m2kMl

This file defines the register interface of the uefi-vars device.
It's only a handful of registers: magic value, command and status
registers, location and size of the communication buffer.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
---
 include/hw/uefi/var-service-api.h | 48 +++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 include/hw/uefi/var-service-api.h

diff --git a/include/hw/uefi/var-service-api.h b/include/hw/uefi/var-service-api.h
new file mode 100644
index 000000000000..0d71638f3efe
--- /dev/null
+++ b/include/hw/uefi/var-service-api.h
@@ -0,0 +1,48 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * uefi-vars device - API of the virtual device for guest/host communication.
+ */
+#ifndef QEMU_UEFI_VAR_SERVICE_API_H
+#define QEMU_UEFI_VAR_SERVICE_API_H
+
+/* qom: device names */
+#define TYPE_UEFI_VARS_X64       "uefi-vars-x64"
+#define TYPE_UEFI_VARS_SYSBUS    "uefi-vars-sysbus"
+
+/* sysbus: fdt node path */
+#define UEFI_VARS_FDT_NODE       "qemu-uefi-vars"
+#define UEFI_VARS_FDT_COMPAT     "qemu,uefi-vars"
+
+/* registers */
+#define UEFI_VARS_REG_MAGIC                  0x00  /* 16 bit */
+#define UEFI_VARS_REG_CMD_STS                0x02  /* 16 bit */
+#define UEFI_VARS_REG_BUFFER_SIZE            0x04  /* 32 bit */
+#define UEFI_VARS_REG_DMA_BUFFER_ADDR_LO     0x08  /* 32 bit */
+#define UEFI_VARS_REG_DMA_BUFFER_ADDR_HI     0x0c  /* 32 bit */
+#define UEFI_VARS_REG_PIO_BUFFER_TRANSFER    0x10  /* 8-64 bit */
+#define UEFI_VARS_REG_PIO_BUFFER_CRC32C      0x18  /* 32 bit (read-only) */
+#define UEFI_VARS_REG_FLAGS                  0x1c  /* 32 bit */
+#define UEFI_VARS_REGS_SIZE                  0x20
+
+/* flags register */
+#define UEFI_VARS_FLAG_USE_PIO           (1 << 0)
+
+/* magic value */
+#define UEFI_VARS_MAGIC_VALUE               0xef1
+
+/* command values */
+#define UEFI_VARS_CMD_RESET                  0x01
+#define UEFI_VARS_CMD_DMA_MM                 0x02
+#define UEFI_VARS_CMD_PIO_MM                 0x03
+#define UEFI_VARS_CMD_PIO_ZERO_OFFSET        0x04
+
+/* status values */
+#define UEFI_VARS_STS_SUCCESS                0x00
+#define UEFI_VARS_STS_BUSY                   0x01
+#define UEFI_VARS_STS_ERR_UNKNOWN            0x10
+#define UEFI_VARS_STS_ERR_NOT_SUPPORTED      0x11
+#define UEFI_VARS_STS_ERR_BAD_BUFFER_SIZE    0x12
+
+
+#endif /* QEMU_UEFI_VAR_SERVICE_API_H */
-- 
2.48.1

