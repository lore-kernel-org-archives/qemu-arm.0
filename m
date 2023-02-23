Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp597433ejc;
        Thu, 23 Feb 2023 02:53:25 -0800 (PST)
X-Google-Smtp-Source: AK7set+wPyPG3dDnSsTZPXrojj+kq+WfnqyChTUgGTQbQWXvyCMDQGSZNspT0CYE5sgB6gDRgsfl
X-Received: by 2002:a05:6830:630a:b0:693:d7bf:dbe8 with SMTP id cg10-20020a056830630a00b00693d7bfdbe8mr21710otb.10.1677149605220;
        Thu, 23 Feb 2023 02:53:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677149605; cv=none;
        d=google.com; s=arc-20160816;
        b=tdO8nppWn9WwfjqSkr+yg1MT4zQVz0ixJuq2o1MNrLkdiL07a+VTrXCtMJrAnzub3F
         W7mK3ETmDIDbcOjs9aB2w5qW+9lCn2//pyvCCyGQj2q47xAdwoMaPqPzb573wTVqEV2w
         kuwt09K5anq0VYG4PBlCmR/kv6R92BwoA1gBJMmjiqVOD8JUVqagrFTym2vE4lONuTqK
         u/7tf+LmXpjKXzi05B56gpTE65c/j2SUMzhEeX0F4c3+Rj6RmFzfKy6Mv8bgyZZRUTbO
         S4xdkQte2Itz4LWs3ZFQskNQ+661Eju/lHSPiiNHJqQTh1MVV/QnW+pQZmvTUhJuYf6S
         oVaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=mu6hUZu3u7BeAHUhXWrNFc9rMrnVG1fD1oPbldB9OFs=;
        b=m/6YtKo7CrS518uZH8+GcNc8ac8eQ5b5HwODU4CAi3WA9KVihicmnKQnshow3s1XC7
         K+wQc7MbuWIUjqIV0n2dK87PHDHzvwilG2EmGzkLnhFAJd4TWg3H6ibOXjfdG0DEYirW
         DT6Q6Vw2XV0ITmQMj3fqAfpBqInFA1dIiOvqfrB4nk4yKlS62cTmi0gNWzHfDcYcyVU+
         Mlru4KWD64uQaR477VJG7kob+oFh6bpQ1GKxpmnaG+3m0T6B/NQNBcOkQceqVz8jPiX4
         u1Fk28Z1oVfbBi8+ECGWfU+X+acvC8P/8QjBf54lKDJvdRhD3e6UALw6VYmZZS7AtgJE
         /qLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=M+zMr+3r;
       spf=pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [2604:1380:4641:c500::1])
        by mx.google.com with ESMTPS id do22-20020a0568300e1600b0066c72f09b5bsi3681071otb.71.2023.02.23.02.53.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Feb 2023 02:53:25 -0800 (PST)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) client-ip=2604:1380:4641:c500::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=M+zMr+3r;
       spf=pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E7B7F616BD;
	Thu, 23 Feb 2023 10:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D7BC433D2;
	Thu, 23 Feb 2023 10:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677149604;
	bh=4ElqaZOtVO/Q4aOwdIjJ/5dEgXMMGUtQbm9GfpQMHYk=;
	h=From:To:Cc:Subject:Date:From;
	b=M+zMr+3r6Z8IDZr9mrkyxyKk4I05FAbL/sOD1lnwoU+fLWNAby9Pwc7Yt0UftgSen
	 RR6SM4jpHScpalPN6qOtZltPRZS2V6LFXWMYcCAgV2nyXQ1UaWr3AktnsNhXojtuUl
	 NEu948OQWa/scIUlwZNVKBlkFTv3Rufclwgf2GBAhu/yoUHkEHz1SOuHGGw7YXfvDA
	 tGwaDjWJCd7LFZxYA8yaAKY97gJK/symBCQ5X8yg4wQ2YdOq25Cc1feDtIOI5wjusH
	 lQhirjTXIy+Yw8bRqABOvtIl6PRP4qvDi+Xiagfw7+gFaa0DeW+ivgGUiqiikltV9m
	 uJFVv1JfD8Q+Q==
From: Ard Biesheuvel <ardb@kernel.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH] hw: arm: Support direct boot for Linux/arm64 EFI zboot images
Date: Thu, 23 Feb 2023 11:53:08 +0100
Message-Id: <20230223105308.559632-1-ardb@kernel.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RgunO2R9vvVH

Fedora 39 will ship its arm64 kernels in the new generic EFI zboot
format, using gzip compression for the payload.

For doing EFI boot in QEMU, this is completely transparent, as the
firmware or bootloader will take care of this. However, for direct
kernel boot without firmware, we will lose the ability to boot such
distro kernels unless we deal with the new format directly.

EFI zboot images contain metadata in the header regarding the placement
of the compressed payload inside the image, and the type of compression
used. This means we can wire up the existing gzip support without too
much hassle, by parsing the header and grabbing the payload from inside
the loaded zboot image.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 hw/arm/boot.c       |  4 ++
 hw/core/loader.c    | 64 ++++++++++++++++++++
 include/hw/loader.h |  2 +
 3 files changed, 70 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 3d7d11f782feb5da..dc10a0788227443e 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -924,6 +924,10 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
         size = len;
     }
 
+    if (unpack_efi_zboot_image(&buffer, &size)) {
+        return -1;
+    }
+
     /* check the arm64 magic header value -- very old kernels may not have it */
     if (size > ARM64_MAGIC_OFFSET + 4 &&
         memcmp(buffer + ARM64_MAGIC_OFFSET, "ARM\x64", 4) == 0) {
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 173f8f67f6e3e79c..7e7f49261a309012 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -857,6 +857,70 @@ ssize_t load_image_gzipped(const char *filename, hwaddr addr, uint64_t max_sz)
     return bytes;
 }
 
+// The Linux header magic number for a EFI PE/COFF
+// image targetting an unspecified architecture.
+#define LINUX_EFI_PE_MAGIC        "\xcd\x23\x82\x81"
+
+struct linux_efi_zboot_header {
+    uint8_t     msdos_magic[4];         // PE/COFF 'MZ' magic number
+    uint8_t     zimg[4];                // "zimg" for Linux EFI zboot images
+    uint32_t    payload_offset;         // LE offset to the compressed payload
+    uint32_t    payload_size;           // LE size of the compressed payload
+    uint8_t     reserved[8];
+    char        compression_type[32];   // Compression type, e.g., "gzip"
+    uint8_t     linux_magic[4];         // Linux header magic
+    uint32_t    pe_header_offset;       // LE offset to the PE header
+};
+
+/*
+ * Check whether *buffer points to a Linux EFI zboot image in memory.
+ *
+ * If it does, attempt to decompress it to a new buffer, and free the old one.
+ * If any of this fails, return an error to the caller.
+ *
+ * If the image is not a Linux EFI zboot image, do nothing and return success.
+ */
+int unpack_efi_zboot_image(uint8_t **buffer, int *size)
+{
+    const struct linux_efi_zboot_header *header;
+    uint8_t *data = NULL;
+    ssize_t bytes;
+
+    /* ignore if this is too small to be a EFI zboot image */
+    if (*size < sizeof(*header)) {
+        return 0;
+    }
+
+    header = (struct linux_efi_zboot_header *)*buffer;
+
+    /* ignore if this is not a Linux EFI zboot image */
+    if (memcmp(&header->zimg, "zimg", 4) != 0 ||
+        memcmp(&header->linux_magic, LINUX_EFI_PE_MAGIC, 4) != 0) {
+        return 0;
+    }
+
+    if (strncmp(header->compression_type, "gzip", 4) != 0) {
+        fprintf(stderr, "unable to handle EFI zboot image with \"%s\" compression\n",
+                header->compression_type);
+        return -1;
+    }
+
+    data = g_malloc(LOAD_IMAGE_MAX_GUNZIP_BYTES);
+    bytes = gunzip(data, LOAD_IMAGE_MAX_GUNZIP_BYTES,
+                   *buffer + le32_to_cpu(header->payload_offset),
+                   le32_to_cpu(header->payload_size));
+    if (bytes < 0) {
+        fprintf(stderr, "failed to decompress EFI zboot image\n");
+        g_free(data);
+        return -1;
+    }
+
+    g_free(*buffer);
+    *buffer = g_realloc(data, bytes);
+    *size = bytes;
+    return 0;
+}
+
 /*
  * Functions for reboot-persistent memory regions.
  *  - used for vga bios and option roms.
diff --git a/include/hw/loader.h b/include/hw/loader.h
index 70248e0da77908c1..d1092c8bfbd903c7 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -86,6 +86,8 @@ ssize_t load_image_gzipped_buffer(const char *filename, uint64_t max_sz,
                                   uint8_t **buffer);
 ssize_t load_image_gzipped(const char *filename, hwaddr addr, uint64_t max_sz);
 
+int unpack_efi_zboot_image(uint8_t **buffer, int *size);
+
 #define ELF_LOAD_FAILED       -1
 #define ELF_LOAD_NOT_ELF      -2
 #define ELF_LOAD_WRONG_ARCH   -3
-- 
2.39.1
