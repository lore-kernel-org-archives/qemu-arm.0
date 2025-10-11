Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93D9CCD183
	for <qemu-arm@archiver.kernel.org>; Sat, 11 Oct 2025 08:16:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7Um5-0000wm-6E; Sat, 11 Oct 2025 04:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daan.j.demeyer@gmail.com>)
 id 1v7Um1-0000jx-UY
 for qemu-arm@nongnu.org; Sat, 11 Oct 2025 04:16:18 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daan.j.demeyer@gmail.com>)
 id 1v7Ulv-00073w-NA
 for qemu-arm@nongnu.org; Sat, 11 Oct 2025 04:16:17 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3ecdf2b1751so1860187f8f.0
 for <qemu-arm@nongnu.org>; Sat, 11 Oct 2025 01:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760170568; x=1760775368; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fV7UHztEaQ52d1YYUmIY50MBEuXXcFsbhfQR43l1bTY=;
 b=gELl514YyGJImWeYO2LE2aG9O/20bYLQiyUE9T+tKHDyhlWJyeILP1S+meJTum+NrB
 nNwZedSgix8kQ3BDEZomrajbMvnLSahzUvh1FSqRc3qCqU3M7UEbqkeTorlFDp04rvak
 qfuIm1jplo0Ai1G83msVSmw316yR4l52ad4zIhpZZ6C/gbMJMeoc8Pgo+o88rSPZMjhk
 h1NgVCt3P/aEaQlCQu4gOiq1YhV7XDmsOeIKfVpG875pNJkojoCHI+0az48eCuD5XrhL
 Na+Nn1VXCdp0HFcnZCPBhd50t98OT5OJIv3zMHcswpWX8cxpnLtWJd1uxpfM6JqkHpT9
 QeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760170568; x=1760775368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fV7UHztEaQ52d1YYUmIY50MBEuXXcFsbhfQR43l1bTY=;
 b=CqrZsyiTW+8U3iw1S3bt5PBpS36bU5U3wm9cSCVqS5teMel8U9zenGJlkPywi14XJ1
 VbnCYzKxZ1jBLCZkSjdd79pG+BDNkidslarXEDKuAr04wHniiW/RwAtTZcN9xmn/H5CZ
 y70dre8IVt6/3Ggc0Tf3w/Lzm/+R4vkU2RefkPTBgRS/hcltC2Z0LSwWsqkz56QzoAWR
 sCXtAt7dwTf9lbjxJtNtR8hkBU4fZ4EvLyTF2oys6C/1EGgtmpUrR44zDBXjop1RDANc
 wqJBtdCnBqqsPMF3++D87kFzuvBXXBh+bH7EAyt2qiZ4qtVG5przXU6ZDspNy+Csvt02
 Dziw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYQPyAQX8xBSkvnXhgn7tfrfwFeGGw0WCPgG448P3cVAOo06UyUoO8e5asdIiIZ3+dO/GZPm34wQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw1NWDUZvARuJKUeByHx2a898sG9DLrrSWHiAlW0As52iy57JyY
 jBFgTy4hJPZDPgoowpdAKdbMNjZrynETu6LDlOzHViZOXDqJMuOQ39t9
X-Gm-Gg: ASbGncsvlXPcjqLBGb2RftKvr+42f81fOq9NJ3qByOBT8ldO80wl4HEWnW5E4fWZUiw
 slKW3hcFD+vPbBdiDfU7yF1KyPqOtOetbKeoPim2JhdsNXJcaMxMRGbbb5Xyv6TtDBriR2A+kaE
 JsZDmU9P0L+BPUUxwvNsQuy8z83cbk9O8HsHKWdZeVmR3deSZ87kjF0DCE8Cud0WVohHRPNLWy3
 bXyAS07iTsYAZ5bH85rceHn5pwna3exSA3ApakPRXPAAiY7L2KJZmVjKuXf1qXIQaSZ+nGkRfTa
 PWXoSwhT9i0vR32Cq+EKFfUgPBiP6GlMtKrUGZdZRWr+a7/kYCBZ6W+Hz1zfKaf90qnDRJAB5Xy
 W35o6gOICPCHJCmpul+DgIAXwnu/JxE/WStX/2Mfa58m6In9ubrRqgY6MH84Wim9IgGLxVYQLoP
 82hzkoEjpdkC8puRjfBaub
X-Google-Smtp-Source: AGHT+IFfPDCGIphgQQHt7KvrBKUsa8M/6KEmFk1IUQDmhopIRjWGk/bv3Erauh+DwYc3gvhfiOlgjQ==
X-Received: by 2002:a05:6000:26c2:b0:3ce:bf23:3c32 with SMTP id
 ffacd0b85a97d-4266e7beb06mr9399672f8f.22.1760170568272; 
 Sat, 11 Oct 2025 01:16:08 -0700 (PDT)
Received: from daandemeyer-fedora-PC1EV17T (d54C349CA.access.telenet.be.
 [84.195.73.202]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe69sm8045969f8f.32.2025.10.11.01.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 01:16:07 -0700 (PDT)
From: Daan De Meyer <daan.j.demeyer@gmail.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Daan De Meyer <daan.j.demeyer@gmail.com>
Subject: [PATCH v3 1/3] Rename LOAD_IMAGE_MAX_GUNZIP_BYTES to
 LOAD_IMAGE_MAX_DECOMPRESSED_BYTES
Date: Sat, 11 Oct 2025 10:15:51 +0200
Message-ID: <20251011081553.4065883-2-daan.j.demeyer@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251011081553.4065883-1-daan.j.demeyer@gmail.com>
References: <20251011081553.4065883-1-daan.j.demeyer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=daan.j.demeyer@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Preparation for adding support for zstd compressed efi zboot kernel
images.

Signed-off-by: Daan De Meyer <daan.j.demeyer@gmail.com>
---
 hw/arm/boot.c       | 2 +-
 hw/core/loader.c    | 8 ++++----
 hw/nvram/fw_cfg.c   | 2 +-
 include/hw/loader.h | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

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
index 477661a025..42edcf2d98 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -796,8 +796,8 @@ ssize_t load_image_gzipped_buffer(const char *filename, uint64_t max_sz,
         goto out;
     }
 
-    if (max_sz > LOAD_IMAGE_MAX_GUNZIP_BYTES) {
-        max_sz = LOAD_IMAGE_MAX_GUNZIP_BYTES;
+    if (max_sz > LOAD_IMAGE_MAX_DECOMPRESSED_BYTES) {
+        max_sz = LOAD_IMAGE_MAX_DECOMPRESSED_BYTES;
     }
 
     data = g_malloc(max_sz);
@@ -898,8 +898,8 @@ ssize_t unpack_efi_zboot_image(uint8_t **buffer, ssize_t *size)
         return -1;
     }
 
-    data = g_malloc(LOAD_IMAGE_MAX_GUNZIP_BYTES);
-    bytes = gunzip(data, LOAD_IMAGE_MAX_GUNZIP_BYTES, *buffer + ploff, plsize);
+    data = g_malloc(LOAD_IMAGE_MAX_DECOMPRESSED_BYTES);
+    bytes = gunzip(data, LOAD_IMAGE_MAX_DECOMPRESSED_BYTES, *buffer + ploff, plsize);
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


