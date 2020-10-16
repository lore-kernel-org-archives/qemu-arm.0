Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1781078lfa;
        Fri, 16 Oct 2020 11:42:25 -0700 (PDT)
X-Received: by 2002:aa7:9af1:0:b029:152:6101:ad12 with SMTP id y17-20020aa79af10000b02901526101ad12mr4841375pfp.40.1602873745530;
        Fri, 16 Oct 2020 11:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602873745; cv=none;
        d=google.com; s=arc-20160816;
        b=RvS7jj5ZZzHgAlyl7ymF8xclaHteGDBZT1cT472dlKQfvdfdBxsI2otvE8OXbnUb0z
         wEsxuqnQTKSY5d7n4ndB9FkmC2Qha2BxXYQ8ucVoaGL/GeTsC8EIOupa+hM4NEIFQSC5
         q9t1YODU743DpBnkObst5D2Kh9wDgPxQ+caZMKBmR9jailVX2X24Ngxe3cfTTYXvBV09
         SvVIzh5jANX1ngYjwTT0Tc08tsbxF1DxV0LdP9o/oDl2H4b5YJPFlUyHHdRGCbHoGd9H
         iyhnt85lBiMfyzMNBerZs2GsW1cbVY0uOcy1pbTGZP6KdI1I0fsaE7GJnMVWUk1S2qAs
         /wBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=uXEiXCwmZ4IatXzjo8oCm1sQVSclKFFXnkVflorhWjg=;
        b=CX4Ln4R4LepeTmZkgP9QDpQpGpCk/pMtLtrs3WpaNNck/Sx5RhgUmIJ4cFxbpBkhuD
         SjEmVY3eQbGjcU2NHOPxvKYazlCEQF0ymc/ccqZBaxU4AjOWKAiabFooof/vEAEhQb2N
         +/Wb865catsGzVMB1DFIUqzb2URGaD+z7KhX4zFYWmUkx8MxHg9IDWGXARegq1IiFGLl
         jb9SnbCiM4Pyjse621ADqnLzIrtKi8rAV5NFKOJsJeBjpQ81F4XlQGXGVC+Rh9UibtvI
         heQGY5seMsHrC/sVgqWtmdsrTWwRryKOmdM95skOUP2XW17KSG5jf2ufAblqkNMFxgSg
         ke9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bPf5xCPq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p9sor1852276pjb.18.2020.10.16.11.42.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Oct 2020 11:42:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bPf5xCPq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uXEiXCwmZ4IatXzjo8oCm1sQVSclKFFXnkVflorhWjg=;
        b=bPf5xCPqRF90jEQztTuX2AbkOBuzKtPES2JmlFdPHK44OOsRCmiRI/yaDfopNwCyYN
         vwh6U7s7U18qjhN0ZAydje+hrZm7+0VCBNfbx86jd66rFEVffKVvAE8aF7qcnJdfp1uq
         ZvYa2Z1QJ4IkYPUQiBAXrm+aUCBsMc8V8UfDFRXX8DdS87aXoKdCxN5nz5jmwZmQJnKu
         BYOIGlaZY28R6W1csRrZAkJy/VvD5FdH3nqxzsbH5vPQFtiOvsJFTW+7hBCh9ZcYDOTU
         JodcCvX/FceVbFJDoDC5bFpNZB6LHNVwdl50nsTkV6XD9EcUGSLdsxlI3c4CzbI0Fbpz
         CJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uXEiXCwmZ4IatXzjo8oCm1sQVSclKFFXnkVflorhWjg=;
        b=s93iewW522bq+Y768gp1XafPzABE8hX4CvVgjSBF2H3VnbNxiKwWte6XikSdZb3mnM
         SQkrw8ldQdCStkBDyWxeJfK1mMIH+XP212OADOt7xTwRH7MQfyWB7OHGSxKvU/gwD5lS
         WSU2w2rgTXPtSW9pEvcxE0mRcToXPGG+xUlFZ/3n3sUad85xL+dcFj0BJQ9EObSfc6b6
         +5rsUwgfnI90aAXaur2jFKJu/ybFvPCvC9HUcVgPQKTi0+lEAW5vEUhLB6Ifj8WWnpQa
         PXZgnNS7hbtUC22s1Ko9uRzfo9u8Q61DCTTzIESwh0lGiUAGydrOlt5uRkAKU41Erw/j
         UYMA==
X-Gm-Message-State: AOAM533G9UU79NVcM8lettr2NIE7aDMOO/gCgqunZyaTrtj239prml25
	QOMg0Anu1Kjgv9R7HQXsSoaiepcI
X-Google-Smtp-Source: ABdhPJy9H5Dn8ChfSNqWtEuMUF/ixcqNo6yrM+L+78ts70mCtIyLSts9/sjGAZJ6uK8Ga3omDkXlqg==
X-Received: by 2002:a17:90a:7486:: with SMTP id p6mr5477844pjk.162.1602873745012;
        Fri, 16 Oct 2020 11:42:25 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.141.89])
        by smtp.gmail.com with ESMTPSA id c15sm3426011pgg.77.2020.10.16.11.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:42:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v11 10/12] linux-user/elfload: Parse NT_GNU_PROPERTY_TYPE_0 notes
Date: Fri, 16 Oct 2020 11:42:05 -0700
Message-Id: <20201016184207.786698-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016184207.786698-1-richard.henderson@linaro.org>
References: <20201016184207.786698-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: r52WxTxEEiii

This is generic support, with the code disabled for all targets.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v9: Only map the startup executable with BTI; anything else must be
    handled by the interpreter.
v10: Split out preparatory patches (pmm).
v11: Mirror(-ish) the kernel's code structure (pmm).
---
 linux-user/qemu.h    |   4 ++
 linux-user/elfload.c | 157 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 161 insertions(+)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 941ca99722..534753ca12 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -61,6 +61,10 @@ struct image_info {
         abi_ulong       interpreter_loadmap_addr;
         abi_ulong       interpreter_pt_dynamic_addr;
         struct image_info *other_info;
+
+        /* For target-specific processing of NT_GNU_PROPERTY_TYPE_0. */
+        uint32_t        note_flags;
+
 #ifdef TARGET_MIPS
         int             fp_abi;
         int             interp_fp_abi;
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 04c04bc260..428dcaa152 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1522,6 +1522,15 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs,
 
 #include "elf.h"
 
+static bool arch_parse_elf_property(uint32_t pr_type, uint32_t pr_datasz,
+                                    const uint32_t *data,
+                                    struct image_info *info,
+                                    Error **errp)
+{
+    g_assert_not_reached();
+}
+#define ARCH_USE_GNU_PROPERTY 0
+
 struct exec
 {
     unsigned int a_info;   /* Use macros N_MAGIC, etc for access */
@@ -2373,6 +2382,150 @@ void probe_guest_base(const char *image_name, abi_ulong guest_loaddr,
                   "@ 0x%" PRIx64 "\n", (uint64_t)guest_base);
 }
 
+enum {
+    /* The string "GNU\0" as a magic number. */
+    GNU0_MAGIC = const_le32('G' | 'N' << 8 | 'U' << 16),
+    NOTE_DATA_SZ = 1 * KiB,
+    NOTE_NAME_SZ = 4,
+    ELF_GNU_PROPERTY_ALIGN = ELF_CLASS == ELFCLASS32 ? 4 : 8,
+};
+
+/*
+ * Process a single gnu_property entry.
+ * Return false for error.
+ */
+static bool parse_elf_property(const uint32_t *data, int *off, int datasz,
+                               struct image_info *info, bool have_prev_type,
+                               uint32_t *prev_type, Error **errp)
+{
+    uint32_t pr_type, pr_datasz, step;
+
+    if (*off > datasz || !QEMU_IS_ALIGNED(*off, ELF_GNU_PROPERTY_ALIGN)) {
+        goto error_data;
+    }
+    datasz -= *off;
+    data += *off / sizeof(uint32_t);
+
+    if (datasz < 2 * sizeof(uint32_t)) {
+        goto error_data;
+    }
+    pr_type = data[0];
+    pr_datasz = data[1];
+    data += 2;
+    datasz -= 2 * sizeof(uint32_t);
+    step = ROUND_UP(pr_datasz, ELF_GNU_PROPERTY_ALIGN);
+    if (step > datasz) {
+        goto error_data;
+    }
+
+    /* Properties are supposed to be unique and sorted on pr_type. */
+    if (have_prev_type && pr_type <= *prev_type) {
+        if (pr_type == *prev_type) {
+            error_setg(errp, "Duplicate property in PT_GNU_PROPERTY");
+        } else {
+            error_setg(errp, "Unsorted property in PT_GNU_PROPERTY");
+        }
+        return false;
+    }
+    *prev_type = pr_type;
+
+    if (!arch_parse_elf_property(pr_type, pr_datasz, data, info, errp)) {
+        return false;
+    }
+
+    *off += 2 * sizeof(uint32_t) + step;
+    return true;
+
+ error_data:
+    error_setg(errp, "Ill-formed property in PT_GNU_PROPERTY");
+    return false;
+}
+
+/* Process NT_GNU_PROPERTY_TYPE_0. */
+static bool parse_elf_properties(int image_fd,
+                                 struct image_info *info,
+                                 const struct elf_phdr *phdr,
+                                 char bprm_buf[BPRM_BUF_SIZE],
+                                 Error **errp)
+{
+    union {
+        struct elf_note nhdr;
+        uint32_t data[NOTE_DATA_SZ / sizeof(uint32_t)];
+    } note;
+
+    int n, off, datasz;
+    bool have_prev_type;
+    uint32_t prev_type;
+
+    /* Unless the arch requires properties, ignore them. */
+    if (!ARCH_USE_GNU_PROPERTY) {
+        return true;
+    }
+
+    /* If the properties are crazy large, that's too bad. */
+    n = phdr->p_filesz;
+    if (n > sizeof(note)) {
+        error_setg(errp, "PT_GNU_PROPERTY too large");
+        return false;
+    }
+    if (n < sizeof(note.nhdr)) {
+        error_setg(errp, "PT_GNU_PROPERTY too small");
+        return false;
+    }
+
+    if (phdr->p_offset + n <= BPRM_BUF_SIZE) {
+        memcpy(&note, bprm_buf + phdr->p_offset, n);
+    } else {
+        ssize_t len = pread(image_fd, &note, n, phdr->p_offset);
+        if (len != n) {
+            error_setg_errno(errp, errno, "Error reading file header");
+            return false;
+        }
+    }
+
+    /*
+     * The contents of a valid PT_GNU_PROPERTY is a sequence
+     * of uint32_t -- swap them all now.
+     */
+#ifdef BSWAP_NEEDED
+    for (int i = 0; i < n / 4; i++) {
+        bswap32s(note.data + i);
+    }
+#endif
+
+    /*
+     * Note that nhdr is 3 words, and that the "name" described by namesz
+     * immediately follows nhdr and is thus at the 4th word.  Further, all
+     * of the inputs to the kernel's round_up are multiples of 4.
+     */
+    if (note.nhdr.n_type != NT_GNU_PROPERTY_TYPE_0 ||
+        note.nhdr.n_namesz != NOTE_NAME_SZ ||
+        note.data[3] != GNU0_MAGIC) {
+        error_setg(errp, "Invalid note in PT_GNU_PROPERTY");
+        return false;
+    }
+    off = sizeof(note.nhdr) + NOTE_NAME_SZ;
+
+    datasz = note.nhdr.n_descsz + off;
+    if (datasz > n) {
+        error_setg(errp, "Invalid note size in PT_GNU_PROPERTY");
+        return false;
+    }
+
+    have_prev_type = false;
+    prev_type = 0;
+    while (1) {
+        if (off == datasz) {
+            return true;  /* end, exit ok */
+        }
+        if (!parse_elf_property(note.data, &off, datasz, info,
+                                have_prev_type, &prev_type, errp)) {
+            return false;
+        }
+        have_prev_type = true;
+    }
+}
+
 /* Load an ELF image into the address space.
 
    IMAGE_NAME is the filename of the image, to use in error messages.
@@ -2467,6 +2620,10 @@ static void load_elf_image(const char *image_name, int image_fd,
                 goto exit_errmsg;
             }
             *pinterp_name = g_steal_pointer(&interp_name);
+        } else if (eppnt->p_type == PT_GNU_PROPERTY) {
+            if (!parse_elf_properties(image_fd, info, eppnt, bprm_buf, &err)) {
+                goto exit_errmsg;
+            }
         }
     }
 
-- 
2.25.1
