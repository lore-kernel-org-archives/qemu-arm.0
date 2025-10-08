Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB76CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 19:48:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6a8h-0003nk-AH; Wed, 08 Oct 2025 15:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daan.j.demeyer@gmail.com>)
 id 1v6ZfW-0005IJ-R3
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 15:17:46 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daan.j.demeyer@gmail.com>)
 id 1v6ZfP-0001Ao-1f
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 15:17:46 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46e34052bb7so2325525e9.2
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 12:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759951053; x=1760555853; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wjbuii0e1CL3zO3/XrtXR2PE1uALl+U9fRi/tNA5Kig=;
 b=JvHlRD9AvuppI7+Hp9kb0t3UowIuvJH7dC49UPTGqgylB5fNLRF9xMhPBBlaV8YZd0
 nlLAwb4z02jI8rXGNKmbmPqgsrPZOl/EiqF0ZtbUh2ToZr1c3mbOB2LEQE/Od8MiPzLo
 jsJB08PxcUV9wDZIqKXlXdslt2meSarvPBlYyF7p4lmOC9V/hAewCmmC4+ARf2qlapJz
 yIAaxI7K4ZwwLeBxCJG1by38M8PdKtpuFaprmyAPInhXRDmo3fgJM51Vm1AdiRI9hoVp
 0rRlrqVx35yAOToFUlbshlP/c+GaOe1VwYEIkHvagh+EVXwa1HKoqDIFPn94ya7LHC9P
 VQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759951053; x=1760555853;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wjbuii0e1CL3zO3/XrtXR2PE1uALl+U9fRi/tNA5Kig=;
 b=O3tFMbizX4pVqmB8W6dW0fpqP3TZCYerSPG4NPHa60lpj0/5dvR4M8OhP6D7meajOU
 ifLYEwi9PGPyZnZpjmdriTBvzCDwkKutOUWUXf/vVnrknefGi3uG2rhY/B5j928giVsM
 3i35yRlqlBuIQtiyKsE93FmgG9F1QdLXGL/eWGPZviOJUx5/INBQkMkEoshEe3iigRzn
 0II4we1OgWaMCJmANlAOnDfP7ljeDa1Pdj0k7QyneNEfmgrJeNUoL54fQoiji+oPbuyz
 hOWyTQmbpAhEkEmWureMaetSSaR9BfUPdwVOikFynbM8zYDfKJk5yMahBaCkkfeMI2Ld
 eIBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF1LM2IqufLVOq6/f62iicT/CRnIi0qYcxTTIsn4Rqr3fQhtlyVSmnraObr4xZPdnTt2THQTn3ZQ==@nongnu.org
X-Gm-Message-State: AOJu0YxRxcHyKXyi+ajoy29PwvsJAIxRCcm7WNvvWy3jz2/yP3ATCa/W
 3HN/IGIGXN5e2A1Kel25BcvRQgjRC4bVDqG8Y2TW5Z60Ysr/1sYk44tZ
X-Gm-Gg: ASbGncu5lv/BpCBgSt2+81to3+w3TMhOBiy5cv8osAJaynqPUQigHsfpDfrzhTP1hyF
 Wlp9q4GHsyw2GS+gb9TOKYWpohfi+T1THX2vr1J4bKozXF5sOALBDnK2T0W2+px1syZTwHE9EkK
 JKcKCuawIo4ve6+Po8P2cMmkJ+EwOv2ZY6M8DAvm0iSHG963h4LZCHyGLvdIU3l5+3cUIEml0g4
 BySGs83MfBuk7sKm4oHI99MR2UTLeVAdRxBwWD2lAyIABzNnfaikZjEAniYLuqBbbKDnmQSDbxH
 KfbHUMqTV7L4CGO46eq9afq9OpebksNNV0GEuVMR6QDIwUVW5abrmXNm6wGIT3prwwpMvBa4Q1L
 0ODDKGkvsxMVxKPSRz1k/rwVH4MK28TKSqvu7zONLVWObsjWklxCM+tFlyOlDDIKLfdQWLjSIfF
 5p2xlFL9iG/ULSk3RrW/tw0ITBPQ==
X-Google-Smtp-Source: AGHT+IESin8/p/qvBW28KCeDiA+O51TKVfgSVOQH2/8Ue4qJ1uiXfgoVK3AE/lxeLP12EnY+ziCdBg==
X-Received: by 2002:a05:600c:8b22:b0:46e:4882:94c7 with SMTP id
 5b1f17b1804b1-46fa9b02c6amr31894405e9.28.1759951052693; 
 Wed, 08 Oct 2025 12:17:32 -0700 (PDT)
Received: from daandemeyer-fedora-PC1EV17T (d54C349CA.access.telenet.be.
 [84.195.73.202]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-42585989607sm8415997f8f.53.2025.10.08.12.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 12:17:32 -0700 (PDT)
From: Daan De Meyer <daan.j.demeyer@gmail.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Daan De Meyer <daan.j.demeyer@gmail.com>
Subject: [PATCH] Add support for zboot images compressed with zstd
Date: Wed,  8 Oct 2025 21:17:16 +0200
Message-ID: <20251008191716.3005164-1-daan.j.demeyer@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=daan.j.demeyer@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 08 Oct 2025 15:47:53 -0400
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
 hw/arm/boot.c       |  2 +-
 hw/core/loader.c    | 36 ++++++++++++++++++++++++------------
 hw/nvram/fw_cfg.c   |  2 +-
 include/hw/loader.h |  2 +-
 4 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index e77d8679d8..c0dec0343a 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -826,7 +826,7 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
     ssize_t size;
 
     /* On aarch64, it's the bootloader's job to uncompress the kernel. */
-    size = load_image_gzipped_buffer(filename, LOAD_IMAGE_MAX_GUNZIP_BYTES,
+    size = load_image_gzipped_buffer(filename, LOAD_IMAGE_MAX_DECOMPRESSED_BYTES,
                                      &buffer);
 
     if (size < 0) {
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 477661a025..a2647b0c9a 100644
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
@@ -796,8 +801,8 @@ ssize_t load_image_gzipped_buffer(const char *filename, uint64_t max_sz,
         goto out;
     }
 
-    if (max_sz > LOAD_IMAGE_MAX_GUNZIP_BYTES) {
-        max_sz = LOAD_IMAGE_MAX_GUNZIP_BYTES;
+    if (max_sz > LOAD_IMAGE_MAX_DECOMPRESSED_BYTES) {
+        max_sz = LOAD_IMAGE_MAX_DECOMPRESSED_BYTES;
     }
 
     data = g_malloc(max_sz);
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
 
@@ -898,8 +895,23 @@ ssize_t unpack_efi_zboot_image(uint8_t **buffer, ssize_t *size)
         return -1;
     }
 
-    data = g_malloc(LOAD_IMAGE_MAX_GUNZIP_BYTES);
-    bytes = gunzip(data, LOAD_IMAGE_MAX_GUNZIP_BYTES, *buffer + ploff, plsize);
+    data = g_malloc(LOAD_IMAGE_MAX_DECOMPRESSED_BYTES);
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
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index aa24050493..af3b112524 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -1115,7 +1115,7 @@ void load_image_to_fw_cfg(FWCfgState *fw_cfg, uint16_t size_key,
 
     if (try_decompress) {
         size = load_image_gzipped_buffer(image_name,
-                                         LOAD_IMAGE_MAX_GUNZIP_BYTES, &data);
+                                         LOAD_IMAGE_MAX_DECOMPRESSED_BYTES, &data);
     }
 
     if (size == (size_t)-1) {
diff --git a/include/hw/loader.h b/include/hw/loader.h
index c96b5e141c..24b91ba02b 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -80,7 +80,7 @@ ssize_t load_image_mr(const char *filename, MemoryRegion *mr);
  * load_image_gzipped_buffer() will read. It prevents
  * g_malloc() in those functions from allocating a huge amount of memory.
  */
-#define LOAD_IMAGE_MAX_GUNZIP_BYTES (256 << 20)
+#define LOAD_IMAGE_MAX_DECOMPRESSED_BYTES (256 << 20)
 
 ssize_t load_image_gzipped_buffer(const char *filename, uint64_t max_sz,
                                   uint8_t **buffer);
-- 
2.51.0


