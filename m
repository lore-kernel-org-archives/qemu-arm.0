Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C7BCFA466
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Nov 2025 12:39:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vNVpK-00017K-9h; Mon, 24 Nov 2025 07:37:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daan.j.demeyer@gmail.com>)
 id 1vNVnT-0004Zi-2V
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 07:36:00 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daan.j.demeyer@gmail.com>)
 id 1vNVnO-0007Iy-Nn
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 07:35:57 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-42b2a0c18caso2620984f8f.1
 for <qemu-arm@nongnu.org>; Mon, 24 Nov 2025 04:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763987736; x=1764592536; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zo8S7nGNognO0/VxU7MQDCfV+i+r6phHemy20JEw9V4=;
 b=hl0laNLFx+bnZhjQcsAWocNzLN2Gbm7VozcaaQRekqRsoyM3w5qmvzHuKc1tAawWcT
 97TW96Vy+FQyHGUmRe4xJoxLOaGJabgsRmrtXaWSYPt8P2kw8QYHcuVFTQ2JWVe6bxq1
 TGMbArDBGW9ckmBh38F1vOAWEC1DV/zLJlzc+r24pQF8qiWM9TyRf0lB45cv2r2XpKNY
 bQNtaD2iau5TfJRIUcLXHtdEV+oUuhde+ndAY6wQGPnQ3YKTCC4AkIKnucYR5CkTBIec
 RiSD8Wtpq/wOs3RPuf5sXF7oerOGbCGfPpzEdG5jKIUXp7pOg5SEb/1uyWrQ8UTp44Bv
 f4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763987736; x=1764592536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Zo8S7nGNognO0/VxU7MQDCfV+i+r6phHemy20JEw9V4=;
 b=MD9f9KUZpNuJTxnfTYFKuv3FliSm5Fc/sUdwho1yALGQ7o7MOjIfLJfdzdESpxSowq
 LlKGA0vESHjezMeHVzFxdCt2HUFKDN0KDwcQb/SYJT7u3JpuxKbjBiIHbB+3a+ZgAJhy
 lEEnf8qZN9xsnl3Q1j/PYOpAIvoOufoI5HmLeqlssMQypZF9CQoMjjK+Y9/t/RLzY/eg
 So2KZMuGyQ99DKPBOFhL7kg/WV4omdTEkIjXmVNQ5Ts7FTn0CqiyRVH//iKZzM+vMflR
 t+0wi/VcJINBjtWS+8B3301LX1q0kbq8Uy39H4nrj/vZrF/RHUxs1EwckaaCjdB8n9+b
 56nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpex6P792RmxtPVxAPSi6RN1Pb91LyS4qQHqC/Ja3e5dyN2X9wrtleelBL2oAykAWp54nDqkdMxQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyih/GyjIElPtO1lBNBV1dPKI1aHGn2UI9k4NOp8Ner/a13nb7L
 fJJr83YllFV0VxscvibbgsfBMiIbeFRBOBhPheVlAqI6NFLhJJ5eZ8cD
X-Gm-Gg: ASbGnctmGA496GZ7/0LLpqJvaMaZ2xXox7TLcf/Y8ONk5faCsLxuN/qnpHB9UBVW0Wr
 AnHrUVvEtjVytAOYmdc/DM8CFe9za9+2AtLoa/HX6TnK6DTEevtXK9u/4QheDOrJJHd/io1i3zH
 a2fBUJ1ijR+5pt0ie4S0MiAvQBEBSq0ViFq9YtrsMz2oqQoIdgFTJ55Ym+rpl7f/+yg1OiveKtE
 TKXT/5c6T9udkN3nhzfmoG+Oc5Jzi7AV3vhGhef/yrSRm5A323y3RV672jYIk5KvwIHkM3Qk/Y4
 K121pijjYyrZzIKKf0NExEoAm4B5+jD6yBkiHGTOvf4YCQSozAgsXYNrNYNRPT2zQRPz1IGRvVF
 QhABz7qSQ7zvSBeeOOOKH8h/lFVz0RrcSssZuoPTFq7C8KQb+qwLJA28eozXMLcITBrKhKcm4dz
 +YTE9vc1hQdQKXy0q+zcl8xvJnaxiPR7oEDb8Of4QwKUyIaINMhyM3dk7EF6O8Zw9QrA==
X-Google-Smtp-Source: AGHT+IE5mjXUbXSUZPQGflsVQ11nsrXwNUCOuTNCM4sjec3tFflPiDznw+y9XZKWYlcz/CfBnpkH5w==
X-Received: by 2002:a05:6000:1445:b0:42b:5448:7b06 with SMTP id
 ffacd0b85a97d-42cc1cbce56mr11971189f8f.13.1763987735897; 
 Mon, 24 Nov 2025 04:35:35 -0800 (PST)
Received: from daandemeyer-fedora-PC1EV17T (d54C349CA.access.telenet.be.
 [84.195.73.202]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fd8c47sm29398449f8f.38.2025.11.24.04.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 04:35:35 -0800 (PST)
From: Daan De Meyer <daan.j.demeyer@gmail.com>
To: qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <arikalo@gmail.com>, Paul Burton <paulburton@kernel.org>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daan De Meyer <daan.j.demeyer@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v4 1/4] Rename LOAD_IMAGE_MAX_GUNZIP_BYTES to
 LOAD_IMAGE_MAX_DECOMPRESSED_BYTES
Date: Mon, 24 Nov 2025 13:35:18 +0100
Message-ID: <20251124123521.1058183-2-daan.j.demeyer@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251124123521.1058183-1-daan.j.demeyer@gmail.com>
References: <20251124123521.1058183-1-daan.j.demeyer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=daan.j.demeyer@gmail.com; helo=mail-wr1-x435.google.com
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

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Daan De Meyer <daan.j.demeyer@gmail.com>
---
 hw/arm/boot.c       | 4 ++--
 hw/core/loader.c    | 9 +++++----
 hw/nvram/fw_cfg.c   | 2 +-
 include/hw/loader.h | 2 +-
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b91660208f..6cf8a4b7fd 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -823,11 +823,11 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
     hwaddr kernel_load_offset = KERNEL64_LOAD_ADDR;
     uint64_t kernel_size = 0;
     uint8_t *buffer;
+    size_t max_size = LOAD_IMAGE_MAX_DECOMPRESSED_BYTES;
     ssize_t size;
 
     /* On aarch64, it's the bootloader's job to uncompress the kernel. */
-    size = load_image_gzipped_buffer(filename, LOAD_IMAGE_MAX_GUNZIP_BYTES,
-                                     &buffer);
+    size = load_image_gzipped_buffer(filename, max_size, &buffer);
 
     if (size < 0) {
         gsize len;
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 590c5b02aa..f940b6a227 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -814,8 +814,8 @@ ssize_t load_image_gzipped_buffer(const char *filename, uint64_t max_sz,
         goto out;
     }
 
-    if (max_sz > LOAD_IMAGE_MAX_GUNZIP_BYTES) {
-        max_sz = LOAD_IMAGE_MAX_GUNZIP_BYTES;
+    if (max_sz > LOAD_IMAGE_MAX_DECOMPRESSED_BYTES) {
+        max_sz = LOAD_IMAGE_MAX_DECOMPRESSED_BYTES;
     }
 
     data = g_malloc(max_sz);
@@ -885,6 +885,7 @@ ssize_t unpack_efi_zboot_image(uint8_t **buffer, ssize_t *size)
     uint8_t *data = NULL;
     ssize_t ploff, plsize;
     ssize_t bytes;
+    size_t max_bytes = LOAD_IMAGE_MAX_DECOMPRESSED_BYTES;
 
     /* ignore if this is too small to be a EFI zboot image */
     if (*size < sizeof(*header)) {
@@ -916,8 +917,8 @@ ssize_t unpack_efi_zboot_image(uint8_t **buffer, ssize_t *size)
         return -1;
     }
 
-    data = g_malloc(LOAD_IMAGE_MAX_GUNZIP_BYTES);
-    bytes = gunzip(data, LOAD_IMAGE_MAX_GUNZIP_BYTES, *buffer + ploff, plsize);
+    data = g_malloc(max_bytes);
+    bytes = gunzip(data, max_bytes, *buffer + ploff, plsize);
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
index d035e72748..3371de506f 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -82,7 +82,7 @@ ssize_t load_image_mr(const char *filename, MemoryRegion *mr);
  * load_image_gzipped_buffer() will read. It prevents
  * g_malloc() in those functions from allocating a huge amount of memory.
  */
-#define LOAD_IMAGE_MAX_GUNZIP_BYTES (256 << 20)
+#define LOAD_IMAGE_MAX_DECOMPRESSED_BYTES (256 << 20)
 
 ssize_t load_image_gzipped_buffer(const char *filename, uint64_t max_sz,
                                   uint8_t **buffer);
-- 
2.51.1


