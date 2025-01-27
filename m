Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2371815njk;
        Mon, 27 Jan 2025 03:41:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXvd2b8srrQq3r4Z8gXXy6wAxmDktl8z37f1yV2Il7mEr5O3ybQ7aKtuzPUSJH2aP4flHrBIue27YyfQQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGOhRb9jNIn1g/VFhEZwDpnuU3fQ2A5XFZBC12SlEJfkhG2/D4mar5Ydfs26NgIApO2rlJ0
X-Received: by 2002:a05:620a:1a07:b0:7b6:d97a:2608 with SMTP id af79cd13be357-7be6321c005mr6110551585a.17.1737978061146;
        Mon, 27 Jan 2025 03:41:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737978061; cv=none;
        d=google.com; s=arc-20240605;
        b=HludWwohc07IXOQwMvQVT9L1RDm3ci+lOvRkftxnNKjhR8H4KMARBnDqiOuL0GAt+y
         PG55mXjTHg1NZKC1AZvC0l92GacqUPcPK6EW7s+jBGZQcXZkSP0tVqmQtI/O72JIQNtL
         iHryvdECG7L5Q5vSvudLWljafacY3+hzD7Sjgp73mCj/CS7B+rA+oqd6ePAfyyBctird
         clJMZvTa95H2/25ZnWd8dFDI4mCNnQKQ5gvOrYD9zNrFOaaeSRcZ/cXMZs28NwFFUPtf
         91YNc1Ssou4bgfGOHSRxAcqIsteL++lC5Bh1bxveM9D+9amotvTTWy3TwV7NxCn1tK02
         ZKZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uL+nnGyGOIubwvzcr2z3yGpj5dC7Jx5PGuyfw3ZHtPA=;
        fh=kLOcy2OuanfZ0YqF95IR5wcs5QN+611jZBPN+h9qAAw=;
        b=Y6+yeBqUloKfo3hgd4O+PZ9/MG4YvQ6Y7zdFMZTglqvOQ2yXM3N98xNMCP04dUAJKc
         I0xBDXj0gsnaLPgHOEeWmCzAbEWe1lKrqkt/8WY6fsuDafIj5EyEETU+39hr/Xjd4syy
         HV2VFzwt1qB4jKE5OycXDQcUKLBhna4LE4vSSNCCsJka8oUYKwEncfrHliey13dzlNfw
         dWYkZxJqCEh33FZIg+1Rmfs0O7qJdDMe5zOdOIQGNSkt5ENR+oGKlNqBDN3YmNEEKX0A
         vMh9Dpf54jPJ2Y/bFMafmpbm7rFtGXv5k55+YC9N/m/+5XCHITLoWar/8n9zDlNAxeQe
         jl1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D3Z+TtUV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9aef0508si925897385a.455.2025.01.27.03.41.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 03:41:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D3Z+TtUV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcNSi-0006ET-Hb; Mon, 27 Jan 2025 06:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNSA-00060w-0x
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 06:38:56 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNS8-0005Ek-4Y
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 06:38:53 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so44609045e9.1
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 03:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737977930; x=1738582730; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uL+nnGyGOIubwvzcr2z3yGpj5dC7Jx5PGuyfw3ZHtPA=;
 b=D3Z+TtUVISWfDr/LyuST1J79GYOdUROHyd9KE8M0eqFW3OEcgtWyKAz/viwNSTMIml
 KPJtkar1Vow2Tvx839KRdCB63YhHRDric6PlU6elaRC9/T/QRVDT4dx5U7SE+G0+uMio
 /m/RdQ82SA96z9wHq6XWEiOjV8cr3bzBc40W47YuPJdy/fNEycgs3bCBM1uMODilkJ2R
 Q2zlEyNLVWZ8WvQ4yHUJoXO/uUXHzsHC8w+kQQ8B63b3745FaXb2LD7Y3SQxS61YkTp7
 MytlsrG/5VfBFH7C2EMVxPzcdPFzq2/natLEHWIYg1nAnWakqqoo7C6D+5TDQA9sogCf
 sF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737977930; x=1738582730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uL+nnGyGOIubwvzcr2z3yGpj5dC7Jx5PGuyfw3ZHtPA=;
 b=ltv77Cj++5vxh6nn9Kcg4GD4ULJlG+2vvk5806bm/8Uq1ru+7lZJ71ZYTf5Ld/Dj11
 k28KQTDPkfj2+hVeWprw4cooTCDN5IwsHroJ4uunEYsBzNY0a3pSsR4ILcXNXzMxlYpL
 J0TBfLT1iZN6Moq/INz200Z2EIY0cC3Jtg1Z+JY5hj6A52Qfis82s156fg4TQWnwpkck
 cxbYX7hjMjs6T1Wt1CcrNhV13yz3vAguN0yXu96vMwr/B0bS13BbJ5RL99bh4Y3ZVkHU
 JtWQbHAkEuWeT1TYuNYTp9/ZwCakFwMcdvCPiUZmhIEa6nR2lyZdinMs7XbjHc+oyWgu
 oh5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQnkD9iH8/ypOtA3UmULYmvTy8biU7Hs/0e5AP+NslF+s1uF/yyLZky1bZsxyYAhsQZxLTxX7hbw==@nongnu.org
X-Gm-Message-State: AOJu0Yyu1RcbmAJSrv0To2WUIqxOkdh8NECG2jO4AjL5NiMLHsSASBQT
 PvDyF1mzMLXYG2zyp+i+2oLm+zowjDjJ0POtR0S6y4PEybv1ces+4MOjNT5BYSE=
X-Gm-Gg: ASbGncvaDa0sSmh4LI3xGUhUrs6GQL7XgdfcGhXgrbFLGdXT79tKDUmhXUkUCeli3ke
 2nYM80uyus8NURsbs9xtoSg7VJDAvOXkrF/PHOy2EDkXtQNBKPDI6HmtdkAEZNYeab6PZph1EoS
 6ILSRNy9uBYQxjtVapGYOfSh05OGKLsAIEZhvnL3IIhePmsh02JAbt4TCNo/gey9vxrjjENxrEl
 6ybhhu67PRTANHeL/XhbRCIUQVmKxjjf1e8A4oc0g6qqVtalpNayCWJPWRjokVkLoao0DZJVK+W
 uM1QiYDDkAkiCHSb54vO4jBfZ7dUMkPaTc5m/Nzhwk4vDVmMSYohQOk=
X-Received: by 2002:a05:600c:35c3:b0:438:a290:3ce0 with SMTP id
 5b1f17b1804b1-438a2903f47mr322246355e9.8.1737977930619; 
 Mon, 27 Jan 2025 03:38:50 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd54c0d1sm130524395e9.26.2025.01.27.03.38.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Jan 2025 03:38:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/6] hw/loader: Pass ELFDATA endian order argument to
 load_elf_as()
Date: Mon, 27 Jan 2025 12:38:23 +0100
Message-ID: <20250127113824.50177-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250127113824.50177-1-philmd@linaro.org>
References: <20250127113824.50177-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: VA+cgGM/F5ks

Rather than passing a boolean 'is_big_endian' argument,
directly pass the ELFDATA, which can be unspecified using
the ELFDATANONE value.

Update the call sites:
  0 -> ELFDATA2LSB
  1 -> ELFDATA2MSB

Note, this allow removing the target_words_bigendian() call
in the GENERIC_LOADER device, where we pass ELFDATANONE.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/loader.h      |  2 +-
 hw/core/loader.c         |  8 ++++----
 hw/arm/armv7m.c          |  2 +-
 hw/arm/boot.c            | 16 ++++++++--------
 hw/avr/boot.c            |  2 +-
 hw/core/generic-loader.c |  6 +-----
 6 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index 8202c376043..84737c05b8d 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -162,7 +162,7 @@ ssize_t load_elf_as(const char *filename,
                     uint64_t (*elf_note_fn)(void *, void *, bool),
                     uint64_t (*translate_fn)(void *, uint64_t),
                     void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
-                    uint64_t *highaddr, uint32_t *pflags, int big_endian,
+                    uint64_t *highaddr, uint32_t *pflags, int elf_data_order,
                     int elf_machine, int clear_lsb, int data_swab,
                     AddressSpace *as);
 
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 0cd34425e9c..84c7f7987ec 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -413,7 +413,8 @@ ssize_t load_elf(const char *filename,
                  int elf_machine, int clear_lsb, int data_swab)
 {
     return load_elf_as(filename, elf_note_fn, translate_fn, translate_opaque,
-                       pentry, lowaddr, highaddr, pflags, big_endian,
+                       pentry, lowaddr, highaddr, pflags,
+                       big_endian ? ELFDATA2MSB : ELFDATA2LSB,
                        elf_machine, clear_lsb, data_swab, NULL);
 }
 
@@ -422,14 +423,13 @@ ssize_t load_elf_as(const char *filename,
                     uint64_t (*elf_note_fn)(void *, void *, bool),
                     uint64_t (*translate_fn)(void *, uint64_t),
                     void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
-                    uint64_t *highaddr, uint32_t *pflags, int big_endian,
+                    uint64_t *highaddr, uint32_t *pflags, int elf_data_order,
                     int elf_machine, int clear_lsb, int data_swab,
                     AddressSpace *as)
 {
     return load_elf_ram_sym(filename, elf_note_fn,
                             translate_fn, translate_opaque,
-                            pentry, lowaddr, highaddr, pflags,
-                            big_endian ? ELFDATA2MSB : ELFDATA2LSB,
+                            pentry, lowaddr, highaddr, pflags, elf_data_order,
                             elf_machine, clear_lsb, data_swab, as,
                             true, NULL);
 }
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index a67a890a33e..98a69846119 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -608,7 +608,7 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename,
     if (kernel_filename) {
         image_size = load_elf_as(kernel_filename, NULL, NULL, NULL,
                                  &entry, NULL, NULL,
-                                 NULL, 0, EM_ARM, 1, 0, as);
+                                 NULL, ELFDATA2LSB, EM_ARM, 1, 0, as);
         if (image_size < 0) {
             image_size = load_image_targphys_as(kernel_filename, mem_base,
                                                 mem_size, as);
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b44bea8a821..cbc24356fc1 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -798,7 +798,7 @@ static ssize_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
         Elf64_Ehdr h64;
     } elf_header;
     int data_swab = 0;
-    bool big_endian;
+    int elf_data_order;
     ssize_t ret;
     Error *err = NULL;
 
@@ -814,12 +814,12 @@ static ssize_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
     }
 
     if (elf_is64) {
-        big_endian = elf_header.h64.e_ident[EI_DATA] == ELFDATA2MSB;
-        info->endianness = big_endian ? ARM_ENDIANNESS_BE8
-                                      : ARM_ENDIANNESS_LE;
+        elf_data_order = elf_header.h64.e_ident[EI_DATA];
+        info->endianness = elf_data_order == ELFDATA2MSB ? ARM_ENDIANNESS_BE8
+                                                         : ARM_ENDIANNESS_LE;
     } else {
-        big_endian = elf_header.h32.e_ident[EI_DATA] == ELFDATA2MSB;
-        if (big_endian) {
+        elf_data_order = elf_header.h32.e_ident[EI_DATA];
+        if (elf_data_order == ELFDATA2MSB) {
             if (bswap32(elf_header.h32.e_flags) & EF_ARM_BE8) {
                 info->endianness = ARM_ENDIANNESS_BE8;
             } else {
@@ -839,8 +839,8 @@ static ssize_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
     }
 
     ret = load_elf_as(info->kernel_filename, NULL, NULL, NULL,
-                      pentry, lowaddr, highaddr, NULL, big_endian, elf_machine,
-                      1, data_swab, as);
+                      pentry, lowaddr, highaddr, NULL, elf_data_order,
+                      elf_machine, 1, data_swab, as);
     if (ret <= 0) {
         /* The header loaded but the image didn't */
         error_report("Couldn't load elf '%s': %s",
diff --git a/hw/avr/boot.c b/hw/avr/boot.c
index 6a91dcd12d0..e5a29c7218e 100644
--- a/hw/avr/boot.c
+++ b/hw/avr/boot.c
@@ -73,7 +73,7 @@ bool avr_load_firmware(AVRCPU *cpu, MachineState *ms,
 
     bytes_loaded = load_elf_as(filename, NULL, NULL, NULL,
                                &entry, NULL, NULL,
-                               &e_flags, 0, EM_AVR, 0, 0, NULL);
+                               &e_flags, ELFDATA2LSB, EM_AVR, 0, 0, NULL);
     if (bytes_loaded >= 0) {
         /* If ELF file is provided, determine CPU type reading ELF e_flags. */
         const char *elf_cpu = avr_elf_e_flags_to_cpu_type(e_flags);
diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index 0ddb3a359a2..5fdbc3f3be2 100644
--- a/hw/core/generic-loader.c
+++ b/hw/core/generic-loader.c
@@ -31,7 +31,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "exec/tswap.h"
 #include "system/dma.h"
 #include "system/reset.h"
 #include "hw/boards.h"
@@ -63,7 +62,6 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
 {
     GenericLoaderState *s = GENERIC_LOADER(dev);
     hwaddr entry;
-    int big_endian;
     ssize_t size = 0;
 
     s->set_pc = false;
@@ -131,14 +129,12 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
         s->cpu = first_cpu;
     }
 
-    big_endian = target_words_bigendian();
-
     if (s->file) {
         AddressSpace *as = s->cpu ? s->cpu->as :  NULL;
 
         if (!s->force_raw) {
             size = load_elf_as(s->file, NULL, NULL, NULL, &entry, NULL, NULL,
-                               NULL, big_endian, 0, 0, 0, as);
+                               NULL, ELFDATANONE, 0, 0, 0, as);
 
             if (size < 0) {
                 size = load_uimage_as(s->file, &entry, NULL, NULL, NULL, NULL,
-- 
2.47.1

