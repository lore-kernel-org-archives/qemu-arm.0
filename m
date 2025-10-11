Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42736CCD183
	for <qemu-arm@archiver.kernel.org>; Sat, 11 Oct 2025 08:17:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7UmK-00018Q-Uy; Sat, 11 Oct 2025 04:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daan.j.demeyer@gmail.com>)
 id 1v7Um6-0000xx-Op
 for qemu-arm@nongnu.org; Sat, 11 Oct 2025 04:16:22 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daan.j.demeyer@gmail.com>)
 id 1v7Uly-000748-AK
 for qemu-arm@nongnu.org; Sat, 11 Oct 2025 04:16:22 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46e3cdc1a6aso20520795e9.1
 for <qemu-arm@nongnu.org>; Sat, 11 Oct 2025 01:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760170570; x=1760775370; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JEUGtlbTEDbu3NHjc292VovKsiI3/ov/Nge0SM2dTw8=;
 b=EMBOLux0eVulDUO1wDpaDwrflkAFZW1UXkrY67Wwq3ED91RsaMOluGuffO6oFd63g+
 peafTVyui/rz6x+KPK5twGh5+PNLSsn/fQOs8F/PRTDn/7iPsKEJ6f3dt4O6Yv9McOHu
 wTpwMpWTacyUCAyxQo4UnBXc9KukMIQLYmpbQUTB9VuzTsuHe/pVL4JzhaxFMoXxYFIC
 ETnpTkDYDc12z07ovQeKS/amHka/wZRPQN7vAtJ5k2ZI2Ggh7hryQDhJbbcfbWPASqT8
 2OzrTy8nKVRUgnyY3r4ul7sVYdTlgA2cdYhhLu6pqUu+d5oXIqVkfQ7ZtvE1pGjuP1qU
 d2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760170570; x=1760775370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JEUGtlbTEDbu3NHjc292VovKsiI3/ov/Nge0SM2dTw8=;
 b=nlWx0cXpeyEtuAGMi0+5sjFW7lZ8ETAkBH2YJLNIX/WazS0JDiYfmUaaREomPVYULC
 yk4EDtDwykZNtXqbU6hVgErddOH4NZmTSwBp5aATl7h35qci/8xSSeg89TmfW9mBlYZL
 il0pGJVK/3D5a/n4r7sf5AZvt5Euet8gFCJllKye3bJUzpiwwrSBLy6k1NMeXVQ7OIjK
 GMyEa7+6QTApNxxX6D2N4FLYAZfGCE6nPVzB7+8zARVpI56DptPfySHqPW2bdw+JHqhY
 k24ldR3hJjl/opvVBfoCh0ZcLQOE0Sf/arjJwqoy2FX5om7SUvMIXVHeYrI7tuvOMNNG
 iC0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvwAU4RD8EXRTKgLsP+ZeFd6CmwRHPi8YcjgUn57kbaJ5mlW1xMYNNMMIVf7juriswApTu/xsyCA==@nongnu.org
X-Gm-Message-State: AOJu0Yyzcq+v7/ZZxLDYQTryUnF/M02WTyQQBy1sJR0iS1/z1eEUJMXg
 CpmdMJZ0LhFy4oe3CHr30hxe/e1jbg2MR1TaHWZxSOHcy9ppDQ125dXDrl+zcfLQ
X-Gm-Gg: ASbGnctAkGtiiiJF6Z5KdMFTX8uJOIyV3ymzAIRk89Mkw2Qd9y/PtOL9zg/M2q+Lq8V
 onorsxvaLq8VbV8gFnUg9oxjKeQ5J9fNMkOZnUMyoa0FQ3Bh+FhtKH52r5IEkc6A1cZ1OiNxdWB
 sU2hAa15oH9LucqC5NW5pkcoeA5SXAjnm/9hYZlfMpNvrtqIQ0SI5CT+AzP59ZiP3UQrfEsp7WI
 Ft/wcVHYZeK1GHPWYW3lZbIDVu9nEOX9mjdM+RQ77yJh/PavubsYEEDlWTKnnOoRmYoRqXfXGMX
 7Y2HTFH/QAAvo2buPZqoEUYJE8JsuXsaODIaXSn0flTWQ9Ay8GvHDqV/Oit7QN0RhSWOPqvOZDK
 sPpcRJJ/etmX+ogx9qihXE+vFGB7ZWY8sZ0DlGLRJxPIva1EVIeG/RGBEDxKybaLMvcXbURq2oF
 1jaZRod4TELnWtACiUlVJHAXxl11QFDzc=
X-Google-Smtp-Source: AGHT+IGhAf+vb4DFaeZpot7i/HXRvoYGxB6e/skrls5ht5OY8ER2yzoxEVgAuQiQFWp3b19+zV6bLQ==
X-Received: by 2002:a05:600c:458b:b0:45d:5c71:769d with SMTP id
 5b1f17b1804b1-46fa9e9a2e5mr111812545e9.8.1760170570093; 
 Sat, 11 Oct 2025 01:16:10 -0700 (PDT)
Received: from daandemeyer-fedora-PC1EV17T (d54C349CA.access.telenet.be.
 [84.195.73.202]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe69sm8045969f8f.32.2025.10.11.01.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 01:16:09 -0700 (PDT)
From: Daan De Meyer <daan.j.demeyer@gmail.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Daan De Meyer <daan.j.demeyer@gmail.com>
Subject: [PATCH v3 3/3] Add support for zboot images compressed with zstd
Date: Sat, 11 Oct 2025 10:15:53 +0200
Message-ID: <20251011081553.4065883-4-daan.j.demeyer@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251011081553.4065883-1-daan.j.demeyer@gmail.com>
References: <20251011081553.4065883-1-daan.j.demeyer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=daan.j.demeyer@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Daan De Meyer <daan.j.demeyer@gmail.com>
---
 hw/core/loader.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index a511888aa3..c1611cc960 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -67,6 +67,11 @@
 
 #include <zlib.h>
 
+#ifdef CONFIG_ZSTD
+#include <zstd.h>
+#include <zstd_errors.h>
+#endif
+
 static int roms_loaded;
 
 /* return the size or -1 if error */
@@ -882,14 +887,6 @@ ssize_t unpack_efi_zboot_image(uint8_t **buffer, ssize_t *size)
         return 0;
     }
 
-    if (strcmp(header->compression_type, "gzip") != 0) {
-        fprintf(stderr,
-                "unable to handle EFI zboot image with \"%.*s\" compression\n",
-                (int)sizeof(header->compression_type) - 1,
-                header->compression_type);
-        return -1;
-    }
-
     ploff = ldl_le_p(&header->payload_offset);
     plsize = ldl_le_p(&header->payload_size);
 
@@ -899,7 +896,22 @@ ssize_t unpack_efi_zboot_image(uint8_t **buffer, ssize_t *size)
     }
 
     data = g_malloc(LOAD_IMAGE_MAX_DECOMPRESSED_BYTES);
-    bytes = gunzip(data, LOAD_IMAGE_MAX_DECOMPRESSED_BYTES, *buffer + ploff, plsize);
+
+    if (strcmp(header->compression_type, "gzip") == 0) {
+        bytes = gunzip(data, LOAD_IMAGE_MAX_DECOMPRESSED_BYTES, *buffer + ploff, plsize);
+#ifdef CONFIG_ZSTD
+    } else if (strcmp(header->compression_type, "zstd") == 0) {
+        size_t ret = ZSTD_decompress(data, LOAD_IMAGE_MAX_DECOMPRESSED_BYTES, *buffer + ploff, plsize);
+        bytes = ZSTD_isError(ret) ? -1 : (ssize_t) ret;
+#endif
+    } else {
+        fprintf(stderr,
+                "unable to handle EFI zboot image with \"%.*s\" compression\n",
+                (int)sizeof(header->compression_type) - 1,
+                header->compression_type);
+        return -1;
+    }
+
     if (bytes < 0) {
         fprintf(stderr, "failed to decompress EFI zboot image\n");
         return -1;
-- 
2.51.0


