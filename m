Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1238412ejc;
        Fri, 3 Mar 2023 08:01:24 -0800 (PST)
X-Google-Smtp-Source: AK7set9MFXRE1TGVdALhX5RNSax11RFyup8e2UBeRrTSHh6JQwWyNWwxpkpNl6YgIsHbZQtFaFcX
X-Received: by 2002:a05:6870:fb8c:b0:176:5e07:bf69 with SMTP id kv12-20020a056870fb8c00b001765e07bf69mr1325474oab.28.1677859283721;
        Fri, 03 Mar 2023 08:01:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677859283; cv=none;
        d=google.com; s=arc-20160816;
        b=elwxzP8WAvccBrpG+S/VwZonD3iI0u5l69eCe21ZeyH7muP92r6L0fziQc2kfl24x0
         7tbY378IuIUrRhvk8PjVZEEt+8YBvswnb07mi553EW0phwAc2Gfh27OY5JPPltCkVLMJ
         2yJ6z/kOWSCaF/FQkx4bJVh2uXMLwEnkU6k5EWnoAh/PYxTBCN+1iZUvzs0Xi7ezrwy4
         KwHint2YkKZzNwCRhGcrKnGO59uBQ5bR426Bj7c2FmgXD6mOcQHsb5OiC+RHHNmSDDOx
         Z4204++XQoEgeTnbwoIuJpsTD4M+Qw8j4a7itTHNnGcuIN8jM18g6aW9P+EMvPI97EaL
         apjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=LdW2IdwgvyHvAz/fbwwiAIaF5RZ1Pp7tBC6M/7NGKuo=;
        b=tnx4KLu+QQdkGVW1lJpiyX60OlNOtSNQw/dYfG7dK22F+SkJBov5B5SuuiG+bWQxbs
         knv3hfpSeJbqtr2TQsmKGGiO/sGMmIj5dRfYRalQUKE/eIiM/bLXwjaKzEzHP9C1vVxo
         tk8rQZHIjB+3ZQdngX696U69c2KSzHRLFsuDv206wo1biNIzyRdIT9OI3IofCv2/pYVd
         vRm8+8TBEdbw/pu9lzY/db0A8VTjMimk58bOpoL8dQ6ixA33FsgmrQfv7fOtVUD8ZzxX
         xeF4eBgdKYPVjbjZjXUa3+ZDUfCy/UA7ov/4dwT7k8xgOb6Twe4o6fyC2JxIa2GhpWoL
         Xlow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=too+9Rky;
       spf=pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [2604:1380:4641:c500::1])
        by mx.google.com with ESMTPS id u3-20020a05687004c300b00176360d4418si2422336oam.220.2023.03.03.08.01.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Mar 2023 08:01:23 -0800 (PST)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) client-ip=2604:1380:4641:c500::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=too+9Rky;
       spf=pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3123E6179C;
	Fri,  3 Mar 2023 16:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F36C433EF;
	Fri,  3 Mar 2023 16:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677859282;
	bh=Jo18lT4Vc+bvhQqTzELPwXUSyivGvFb4rMW+V3IRwT4=;
	h=From:To:Cc:Subject:Date:From;
	b=too+9RkyfkB1R7sWTVSDc9J7Fk53zU1RHiubt/9105L5rnneECjzh7zoChiTZNsjL
	 PgLjqhN8zki8jGZak51DTn0EW/lh4fnOAWXF2Snk/D64wjItMGOHrcuEHvynzLWD3T
	 LBtoKLXPZhO2WLqN1Rs3TDnEG01LP1eRe2qdXaEyoe49TzcNbQSZOvC5x9O+Jjzp9X
	 rgjqM2ZEUfV1egmwjykmeVsbVxq10P1AQbD9XPCF2CH0DOVUNRI2ceU4ijD5mY5tGV
	 daJivShs6BO6F/vI1Bn2BpFPkvCF9G/4yk1sdNL+/sxCOveP04kiGwutvlr5uOKADz
	 CPaqVVP+EeUYg==
From: Ard Biesheuvel <ardb@kernel.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2] hw: arm: Support direct boot for Linux/arm64 EFI zboot images
Date: Fri,  3 Mar 2023 17:01:09 +0100
Message-Id: <20230303160109.3626966-1-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7347; i=ardb@kernel.org; h=from:subject; bh=Jo18lT4Vc+bvhQqTzELPwXUSyivGvFb4rMW+V3IRwT4=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIYVJcpeTxr+Tyk9NCm/7n+XMCzkr7nVtoVrFyUnX5zG3q sx/793fUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbSnMDwv068b31NNF/sdJ3V na5TdWd2TjnZcrf+1e2ML1n3zvfn5DAyfGp+f5NdsIPbZe/DfdWX1K/Efo/evShj1aMKtaR193s 1eAE=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: eUCtzuFa+F/C

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
v2:
- only attempt EFI zboot unpacking of raw images
- check MS-DOS magic as well
- document the origin of the zboot header definition
- use strmcp() for comparing NUL terminated header field against "gzip"
- limit %s consumption of the compression type field in case it is not
  NUL terminated
- add doc-comment description of unpack_efi_zboot_image()
- use special accessors for fields that may appear misaligned in memory
- avoid // commenting style
- sanity check payload offset and size fields before use

 hw/arm/boot.c       |  6 ++
 hw/core/loader.c    | 90 ++++++++++++++++++++
 include/hw/loader.h | 18 ++++
 3 files changed, 114 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 1e021c4a340c7c61..50e5141116b9137d 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -926,6 +926,12 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
             return -1;
         }
         size = len;
+
+        /* Unpack the image if it is a EFI zboot image */
+        if (unpack_efi_zboot_image(&buffer, &size) < 0) {
+            g_free(buffer);
+            return -1;
+        }
     }
 
     /* check the arm64 magic header value -- very old kernels may not have it */
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 173f8f67f6e3e79c..7a5e6bcc070b7bf8 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -857,6 +857,96 @@ ssize_t load_image_gzipped(const char *filename, hwaddr addr, uint64_t max_sz)
     return bytes;
 }
 
+/* The PE/COFF MS-DOS stub magic number */
+#define EFI_PE_MSDOS_MAGIC        "MZ"
+
+/*
+ * The Linux header magic number for a EFI PE/COFF
+ * image targetting an unspecified architecture.
+ */
+#define EFI_PE_LINUX_MAGIC        "\xcd\x23\x82\x81"
+
+/*
+ * Bootable Linux kernel images may be packaged as EFI zboot images, which are
+ * self-decompressing executables when loaded via EFI. The compressed payload
+ * can also be extracted from the image and decompressed by a non-EFI loader.
+ *
+ * The de facto specification for this format is at the following URL:
+ *
+ * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/firmware/efi/libstub/zboot-header.S
+ *
+ * This definition is based on Linux upstream commit 29636a5ce87beba.
+ */
+struct linux_efi_zboot_header {
+    uint8_t     msdos_magic[2];         /* PE/COFF 'MZ' magic number */
+    uint8_t     reserved0[2];
+    uint8_t     zimg[4];                /* "zimg" for Linux EFI zboot images */
+    uint32_t    payload_offset;         /* LE offset to the compressed payload */
+    uint32_t    payload_size;           /* LE size of the compressed payload */
+    uint8_t     reserved1[8];
+    char        compression_type[32];   /* Compression type, NUL terminated */
+    uint8_t     linux_magic[4];         /* Linux header magic */
+    uint32_t    pe_header_offset;       /* LE offset to the PE header */
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
+ssize_t unpack_efi_zboot_image(uint8_t **buffer, int *size)
+{
+    const struct linux_efi_zboot_header *header;
+    uint8_t *data = NULL;
+    int ploff, plsize;
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
+    if (memcmp(&header->msdos_magic, EFI_PE_MSDOS_MAGIC, 2) != 0 ||
+        memcmp(&header->zimg, "zimg", 4) != 0 ||
+        memcmp(&header->linux_magic, EFI_PE_LINUX_MAGIC, 4) != 0) {
+        return 0;
+    }
+
+    if (strcmp(header->compression_type, "gzip") != 0) {
+        fprintf(stderr, "unable to handle EFI zboot image with \"%.*s\" compression\n",
+                (int)sizeof(header->compression_type) - 1,
+                header->compression_type);
+        return -1;
+    }
+
+    ploff = ldl_le_p(&header->payload_offset);
+    plsize = ldl_le_p(&header->payload_size);
+
+    if (ploff < 0 || plsize < 0 || ploff + plsize > *size) {
+        fprintf(stderr, "unable to handle corrupt EFI zboot image\n");
+        return -1;
+    }
+
+    data = g_malloc(LOAD_IMAGE_MAX_GUNZIP_BYTES);
+    bytes = gunzip(data, LOAD_IMAGE_MAX_GUNZIP_BYTES, *buffer + ploff, plsize);
+    if (bytes < 0) {
+        fprintf(stderr, "failed to decompress EFI zboot image\n");
+        g_free(data);
+        return -1;
+    }
+
+    g_free(*buffer);
+    *buffer = g_realloc(data, bytes);
+    *size = bytes;
+    return bytes;
+}
+
 /*
  * Functions for reboot-persistent memory regions.
  *  - used for vga bios and option roms.
diff --git a/include/hw/loader.h b/include/hw/loader.h
index 1384796a4b3182a5..86e59dc8977b1ba2 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -86,6 +86,24 @@ ssize_t load_image_gzipped_buffer(const char *filename, uint64_t max_sz,
                                   uint8_t **buffer);
 ssize_t load_image_gzipped(const char *filename, hwaddr addr, uint64_t max_sz);
 
+/** unpack_efi_zboot_image:
+ * @buffer: pointer to a variable holding the address of a buffer containing the
+ *          image
+ * @size: pointer to a variable holding the size of the buffer
+ *
+ * Check whether the buffer contains a EFI zboot image, and if it does, extract
+ * the compressed payload and decompress it into a new buffer. If successful,
+ * the old buffer is freed, and the *buffer and size variables pointed to by the
+ * function arguments are updated to refer to the newly populated buffer.
+ *
+ * Returns 0 if the image could not be identified as a EFI zboot image.
+ * Returns -1 if the buffer contents were identified as a EFI zboot image, but
+ * unpacking failed for any reason.
+ * Returns the size of the decompressed payload if decompression was performed
+ * successfully.
+ */
+ssize_t unpack_efi_zboot_image(uint8_t **buffer, int *size);
+
 #define ELF_LOAD_FAILED       -1
 #define ELF_LOAD_NOT_ELF      -2
 #define ELF_LOAD_WRONG_ARCH   -3
-- 
2.39.2
