Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03847CCD184
	for <qemu-arm@archiver.kernel.org>; Sat, 11 Oct 2025 08:15:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7UkD-000707-UD; Sat, 11 Oct 2025 04:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daan.j.demeyer@gmail.com>)
 id 1v7UkD-0006zl-3f
 for qemu-arm@nongnu.org; Sat, 11 Oct 2025 04:14:25 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daan.j.demeyer@gmail.com>)
 id 1v7Ujt-0005Yy-N9
 for qemu-arm@nongnu.org; Sat, 11 Oct 2025 04:14:23 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3ece1102998so1569663f8f.2
 for <qemu-arm@nongnu.org>; Sat, 11 Oct 2025 01:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760170444; x=1760775244; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FFsKuj1XUvsrqJs2Cnv0dajt9b4A9uv5ht2bzW4gw+k=;
 b=NqONjMwLW8O/8PcGME1My1/jmaA4yGClA4VODcI/nGQQjSix7GrK5Lag3hekjarH4W
 HrWku4PyF+u3iiw9XY2NtT89K/DNfV2RDQYVmsEU8Lk1RNABuKrrlMbt7640aXgzzfLn
 PF5wC98PdbUsGpj06wskSngSQK+IHmZIgLe79iAde3K4zllX5vrzLrRhQUu0thuAwre9
 5oJmAxYvKrtA90+u4k2n50LCEB+r6SSTD58oJE2sD9mOZxVg0e5Dd7hxW66Ezq/7LVOS
 gMJlYZmZDsgzzJud+hee0A6Jv/StSkBzccxkriw02xOmRuvrxCVLeNRqCVukkkK/Fke/
 3TBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760170444; x=1760775244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FFsKuj1XUvsrqJs2Cnv0dajt9b4A9uv5ht2bzW4gw+k=;
 b=laMXR44pMIfPMdCmRJlSnzlQ55qg4B6LzLxTeedr0C4tQKnN1BxKhD3R1uVoxWKXiY
 UWnTdAn3IHh835uNCbsz0csVhornyw1rEyWF2OYeKjK/z8l9I92kEG+CXlCHu2/ptsZ4
 HsUNMJFdL3OAxLKsiPudEvQeSxqiN8jLcxHA9Uu4yBz2b4mWhnKK97DvqncVIz91fERo
 DIdkiifH7PNXA5VEa+hDldfecs5eYneF2blBnJ9GXzjMsVWAONM6+i5P3hZp3qoCCoSN
 9hWGeM/Bs1QY93Pc0rAVCYyqlwPoA9nt19+bD7VNF0RFVajQs6g4e/ct3YP9AMi2bsPL
 iGPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWu5UcA15Ql7J6FBqn2EJy0eXP70XSmbMucJKOE+wviTcNGKA0mzoIiSYw174wH8tU4/gt5NdFzrg==@nongnu.org
X-Gm-Message-State: AOJu0YxIOOb3olQDI/9b761UAyPd9bxjULZ/WJ2xLZx3Pax7OTAUV2dv
 O3Pa/s+kWJ0I59bHcFlG+ZxSivaHUR5yaqmPqJvdN6yVTJ28vkNtT2Re
X-Gm-Gg: ASbGncubZqhM7aaIZTv10Lh8yw4VI8R939HhSygKKFwDHeXgD4zX7VChb5HuDugSYCn
 E4IeemuIwnukPNEzerOL6tpuePnOyVLNt9V7VpX3CaFh6puWtqF3KFk0CRogbphsC2IwY1o98qG
 oyYo0704vbSmkT2hCrgCsTOjkUctkV5mJ3IIO8rwYfadeuk/fKd02jx1akXzkZhTmfznq0ywNii
 5jzz18sQZu4mOiI13r87z+VKOIFRmjfGDer/fcfIqpR7HB8xz0bcWHaUcuQZ7IrFkghxaSe52LN
 3fGGheKB1YGDOHUWTNnxGjq5c7170+puoEDGm013+yeoUyKd217HibozaBh2lbx1fAjtAfiM8m5
 2X9HyXLzj81I/pPl3E8a1qYA8mcCNDLI0Fw7HmCNdTTRxth898Rye1dI7gxi0Ie9mKOfPwo4/V2
 S8lsdfXWhLs5izPcqHcAUoqe0KSDQOWT0=
X-Google-Smtp-Source: AGHT+IF+VBVwOfYxasPjB8YLl/5i7d58KDNK4a2qlwF3R/QWfohNXnSnnwe5+CoyrbDiGg3pkob/zw==
X-Received: by 2002:a5d:64e7:0:b0:3ee:b126:6bd with SMTP id
 ffacd0b85a97d-4266e8db354mr9013033f8f.50.1760170443405; 
 Sat, 11 Oct 2025 01:14:03 -0700 (PDT)
Received: from daandemeyer-fedora-PC1EV17T (d54C349CA.access.telenet.be.
 [84.195.73.202]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-46fb497aec2sm83873195e9.1.2025.10.11.01.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 01:14:03 -0700 (PDT)
From: Daan De Meyer <daan.j.demeyer@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Daan De Meyer <daan.j.demeyer@gmail.com>
Subject: [PATCH v2 3/3] Add support for zboot images compressed with zstd
Date: Sat, 11 Oct 2025 10:13:47 +0200
Message-ID: <20251011081347.4063198-4-daan.j.demeyer@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251011081347.4063198-1-daan.j.demeyer@gmail.com>
References: <20251011081347.4063198-1-daan.j.demeyer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=daan.j.demeyer@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
index e8be700afb..9eca41a66e 100644
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
         g_free(data);
-- 
2.51.0


