Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9818CCD183
	for <qemu-arm@archiver.kernel.org>; Sat, 11 Oct 2025 08:15:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7Uk3-0006xd-3R; Sat, 11 Oct 2025 04:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daan.j.demeyer@gmail.com>)
 id 1v7Uk0-0006xP-Uv
 for qemu-arm@nongnu.org; Sat, 11 Oct 2025 04:14:13 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daan.j.demeyer@gmail.com>)
 id 1v7Ujt-0005XL-3P
 for qemu-arm@nongnu.org; Sat, 11 Oct 2025 04:14:12 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3f1aff41e7eso2009178f8f.0
 for <qemu-arm@nongnu.org>; Sat, 11 Oct 2025 01:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760170442; x=1760775242; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fV7UHztEaQ52d1YYUmIY50MBEuXXcFsbhfQR43l1bTY=;
 b=fj/g4fe6+/5G0zhCpArPgy8CbVTB851UF/Rb37sAp7Qd2n5vdLMM0hJr3T27OBBN7W
 diiyCfqyIV6wOLXWdfD/sgZQEMbj6/lX9Xg9jXhaJr2oeAJ1pE0nmwhgUZqdyYNGqU8y
 oMU3vVS82hhODlCw67TxvbNC8HQks3yvtBdKYJwHUbATXlc80Hz+tpHYfpLeScP+Or9J
 hQkw8DDiHYyAUh6LP9McXHM/g6nQA6lYMrCMJvxtpp3yPK1ZCm8UFFBI1PzSMozBAO70
 52dsy1c9WH3RpGbA4m1g70cNkHQ9NYbSf1aAaP0WGc4cj4190yfJfhpwtaphDeNgrRyZ
 22Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760170442; x=1760775242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fV7UHztEaQ52d1YYUmIY50MBEuXXcFsbhfQR43l1bTY=;
 b=U9j4MiKHdLk+pbf70jcOyFOtrFTiHZyy61LReCI/XlQan6vTJf9pd8+r/PhQHAW8B7
 Bhusni/7Sc6KX5XyBIaQsmJ/obf00MTn9cIY/v4S3t0g6F8dz7WuaK/T4oBzy22/URNW
 ZJ48ssG46EFW9lPwouh/TJn1Chck0vNdl2lLwCF1j8nFtH5Vy3C/JikfNXCzeIpsSxC3
 8XDVzaXekFlGUHQdFZqT1o3FWTsOiSbG+IlXI3j4qss5JPFB6Bwk0lEDYeB1IXDnK9jB
 FiYJtTrlbz8DIfoMPrwVxyVNaNJAqcLQ8u1lOP60ztG+/iThujimT33+3/1x/tscrv9O
 viFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUifmCD7h6/pSFNsyN7oH3RSoumgEkep9S1K8z60rtt3jxVnBnLMf8pnaouj4C7YLZ29sVjJm/0uw==@nongnu.org
X-Gm-Message-State: AOJu0Yxc4So77Xm/sHu5SNk1AmMK/Ybq7S5vR3HPhh4MsMn0F8LgHovR
 UB0yt22oppUCSpyvIprgu2MOK49tVcvK+gmZm/lZgAEAj6ijNKIp15tq
X-Gm-Gg: ASbGncviDIIuH7Ky9n7ZQ4+pV0K6xLUGk7IPPdgdI47cpRndDCooVyV4guANwOoqHeU
 cAyd8JLtVesjC2op7s0x6leAgX0PdqUtqayEI2eWJbtQa8hoW0yC2qOh+GDTiqaIGHdyhH/zCp9
 bTJJR5GQwRBPhJHDNKu1IUAj8NToK8AuneokHBSWHgrLja4jIFhSdkED7HKBMISNKymbM/46ReJ
 gFUyQ6PKrvCnmO7Q1m4V+1SvTBFzrl/Y/wHWPFI9HInAUKMpLpAV8Z2G1Qx0bbC4enf26AXa80D
 7gGPklQ4LINhlLSOyQpJXM+Fv8rTrKo2YeBnZZNaNsEUHxbHF1Xw9aktX5k6ofauVTpTzKHpijY
 OmwwZ75FXnD7Ynp+hD0gzX6kh+NIGXiMFdB2N4XQzO+tjT4RBKXm5IdR2fLvwmCSN79ybvdz3ut
 1MD0zpIjokWjgwUJZUu1OWs7o5cu9EfkQ=
X-Google-Smtp-Source: AGHT+IGShSE9JOIBx7sacbaGBOSquSl83nf4uK579a4B/xT1HCjibUxtO432bIq7GFe9y92SrMaJQw==
X-Received: by 2002:a05:6000:4210:b0:3f2:b077:94bc with SMTP id
 ffacd0b85a97d-42666ac4119mr8163648f8f.4.1760170441894; 
 Sat, 11 Oct 2025 01:14:01 -0700 (PDT)
Received: from daandemeyer-fedora-PC1EV17T (d54C349CA.access.telenet.be.
 [84.195.73.202]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-46fb497aec2sm83873195e9.1.2025.10.11.01.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 01:14:00 -0700 (PDT)
From: Daan De Meyer <daan.j.demeyer@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Daan De Meyer <daan.j.demeyer@gmail.com>
Subject: [PATCH v2 1/3] Rename LOAD_IMAGE_MAX_GUNZIP_BYTES to
 LOAD_IMAGE_MAX_DECOMPRESSED_BYTES
Date: Sat, 11 Oct 2025 10:13:45 +0200
Message-ID: <20251011081347.4063198-2-daan.j.demeyer@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251011081347.4063198-1-daan.j.demeyer@gmail.com>
References: <20251011081347.4063198-1-daan.j.demeyer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=daan.j.demeyer@gmail.com; helo=mail-wr1-x431.google.com
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


