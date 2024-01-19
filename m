Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp881988ejg;
        Fri, 19 Jan 2024 03:44:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH458PvbgWFPSuq1AO23vYGIM54OV5PD6BMxtwtUN+kM5mMP1Le9GeXtYAxXVn6hSiGNRcg
X-Received: by 2002:a81:8494:0:b0:5ec:2eb3:e80b with SMTP id u142-20020a818494000000b005ec2eb3e80bmr2267213ywf.63.1705664659584;
        Fri, 19 Jan 2024 03:44:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664659; cv=none;
        d=google.com; s=arc-20160816;
        b=o+YLOP58lTnMFZtRvz05pZBbzsf6i5mQ3Dk8ig5VZa6LxV3A80q+lfpJeB9evNEpOh
         kBc46iVoLMgBNx30fpWxe2lE59ahEvOnYZoiMdnslnRynSefTCSv9Tp8T0U4j/SaEZL+
         ZvoaPcfmCVwEk0c/oeuEVfsRxJrlQoPcB1z0ThRyXUZsNqnOa9nsVoOQdjlRwy5nXkjJ
         EF5BAxJqi/9tmlpPTPX1Gpo5iUIwyFp+RDy9is3rhEqtCRsBGxAR/3lw/3kfjzHRNYMs
         bGLyyojst9j9urejzaqYImUKcHxEZb2FOika1XJjmqcMaqFCGOPd5lM/3j1NkQkjVcH3
         ZkbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gdcgrGS7kL0CXr2CCXnG/ae/hIrP2R+qiFCnst8/G2g=;
        fh=hDgfUwIL/v7weRBofvSJVD9yTBvj7VhdNF+FEnj9zak=;
        b=1KJSIHDy74n2Rn1ze26T7BDNRCIEpLEKjISvVOezD/kibB9rPCo2KlO8bpXcYDy9Gc
         bV6hIDtk8uoC6lmWCjj2OGEKWwIKGNqpkK0cI4ArOSm/KmGuhnc/NCtf/W8O3mUi5IPp
         q0EcWAG8umKFg8mcI+/SxqCPhldA1TJUkvXD/8iIFjIE/GkNceaD9t4QoYdFnKyA7bp7
         X11NQdWywsNRyuBcLLY8p6NciVw6GY/zzEGBrBWC0DO447KoueTu1BPnG7ze1Z9S2hgI
         5bmwrVWTF/VXA4Lms5W1cdzZCQLnakFS4pk5/j2d/KvPHAE7sdTUUq8CD4dn6nt5KwUG
         R0xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lv0xOUsR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6-20020a05620a164600b0078338f4f586si15557258qko.197.2024.01.19.03.44.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:44:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lv0xOUsR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQnBu-0007Y2-Pc; Fri, 19 Jan 2024 06:37:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBt-0007TC-Kk
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:37:41 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBq-00038A-Jb
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:37:41 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40e86a9fbd9so6788825e9.1
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 03:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664257; x=1706269057; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gdcgrGS7kL0CXr2CCXnG/ae/hIrP2R+qiFCnst8/G2g=;
 b=Lv0xOUsR8jSnPsTMMFjE5j1Jtl60ljrC2zftr1b+GX1sTsjNi+mxM4ajbRvvdTq6en
 YknxEbKnB7kD6Hghij0oPqZvSHxsvpg3+fcGdLcdSNc5acb9Fd5HQpCaQbj1igcxBllu
 YEhf3YD28a11MFlDvMNjIn7zianxhp9HxBt4B1AOuCXmdPGfZST9TYIITI7PNnsIT5Qw
 ROzv02W7BljapvtbShWakoG9yACgDU5WghtaM6QcBzC/DfWZvL3upM0q/wUKzkE8dIQt
 m0FmpFld07A1UXaPAkjHzXfBNVBCrcKNTKv2Eaw7OqbesxOxIWu8fgJl2UXQZt/PWLD9
 GAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664257; x=1706269057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gdcgrGS7kL0CXr2CCXnG/ae/hIrP2R+qiFCnst8/G2g=;
 b=J/PntnCdOmAGU6oJYq/lVyuCNqHVBZ07gei2ldHgMYqmY5VBpISajdCHX26SzaFqZI
 fFxIBaxJDXCuhwATgxLG9VWSg4xo6NfsEyPPvuN/5EkIDaqyCzpUylWXe5L51JxPcL3G
 XQWnkEdJVMDrfXGQTZwO+rJwIO/oy34ISpdjyoFT5PrfgRMlQ8gFL+M7+1A/qDYiKOJt
 g8HkRCjpqS1JvaRqcE4qxgrhAM29FjEVvTz705xju/bRdvFkH5nC9ua2Zmjgfu/Z0Uf5
 RFEHKP6XzN8FWt/FBHczBGKYE42jr+Ejkq4DK4ZoZTBq3e2Yd0Xa1gr+QtZzCuSds4FI
 upgw==
X-Gm-Message-State: AOJu0YxhLX112G0wBZlbxU9xI/aJbZmAaiF0GE3wXoCL5q0yo3IWznbP
 vWCVOBnC0O+J9c0p40ZW5LE1YXh4gWDz5nXKiEk2JuvzzTQ+0yn/IQdLaZEpIbI=
X-Received: by 2002:a05:600c:4656:b0:40e:87fe:79d8 with SMTP id
 n22-20020a05600c465600b0040e87fe79d8mr1523223wmo.59.1705664257252; 
 Fri, 19 Jan 2024 03:37:37 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 i6-20020adffc06000000b003375009accesm6301614wrr.50.2024.01.19.03.37.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:37:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Bin Meng <bmeng@tinylab.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 33/36] hw/elf_ops: Ignore loadable segments with zero size
Date: Fri, 19 Jan 2024 12:35:02 +0100
Message-ID: <20240119113507.31951-34-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: fDLYnBwTmIMP

From: Bin Meng <bmeng@tinylab.org>

Some ELF files really do have segments of zero size, e.g.:

Program Headers:
  Type           Offset             VirtAddr           PhysAddr
                 FileSiz            MemSiz              Flags  Align
  RISCV_ATTRIBUT 0x00000000000025b8 0x0000000000000000 0x0000000000000000
                 0x000000000000003e 0x0000000000000000  R      0x1
  LOAD           0x0000000000001000 0x0000000080200000 0x0000000080200000
                 0x00000000000001d1 0x00000000000001d1  R E    0x1000
  LOAD           0x00000000000011d1 0x00000000802001d1 0x00000000802001d1
                 0x0000000000000e37 0x0000000000000e37  RW     0x1000
  LOAD           0x0000000000000120 0x0000000000000000 0x0000000000000000
                 0x0000000000000000 0x0000000000000000         0x1000

The current logic does not check for this condition, resulting in
the incorrect assignment of 'lowaddr' as zero.

There is already a piece of codes inside the segment traversal loop
that checks for zero-sized loadable segments for not creating empty
ROM blobs. Let's move this check to the beginning of the loop to
cover both scenarios.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20240116155049.390301-1-bmeng@tinylab.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/elf_ops.h | 71 +++++++++++++++++++++++---------------------
 1 file changed, 37 insertions(+), 34 deletions(-)

diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index 9c35d1b9da..3e966ddd5a 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -427,6 +427,16 @@ static ssize_t glue(load_elf, SZ)(const char *name, int fd,
             file_size = ph->p_filesz; /* Size of the allocated data */
             data_offset = ph->p_offset; /* Offset where the data is located */
 
+            /*
+             * Some ELF files really do have segments of zero size;
+             * just ignore them rather than trying to set the wrong addr,
+             * or create empty ROM blobs, because the zero-length blob can
+             * falsely trigger the overlapping-ROM-blobs check.
+             */
+            if (mem_size == 0) {
+                continue;
+            }
+
             if (file_size > 0) {
                 if (g_mapped_file_get_length(mapped_file) <
                     file_size + data_offset) {
@@ -530,45 +540,38 @@ static ssize_t glue(load_elf, SZ)(const char *name, int fd,
                 *pentry = ehdr.e_entry - ph->p_vaddr + ph->p_paddr;
             }
 
-            /* Some ELF files really do have segments of zero size;
-             * just ignore them rather than trying to create empty
-             * ROM blobs, because the zero-length blob can falsely
-             * trigger the overlapping-ROM-blobs check.
-             */
-            if (mem_size != 0) {
-                if (load_rom) {
-                    g_autofree char *label =
-                        g_strdup_printf("%s ELF program header segment %d",
-                                        name, i);
+            if (load_rom) {
+                g_autofree char *label =
+                    g_strdup_printf("%s ELF program header segment %d",
+                                    name, i);
 
-                    /*
-                     * rom_add_elf_program() takes its own reference to
-                     * 'mapped_file'.
-                     */
-                    rom_add_elf_program(label, mapped_file, data, file_size,
-                                        mem_size, addr, as);
-                } else {
-                    MemTxResult res;
+                /*
+                 * rom_add_elf_program() takes its own reference to
+                 * 'mapped_file'.
+                 */
+                rom_add_elf_program(label, mapped_file, data, file_size,
+                                    mem_size, addr, as);
+            } else {
+                MemTxResult res;
 
-                    res = address_space_write(as ? as : &address_space_memory,
-                                              addr, MEMTXATTRS_UNSPECIFIED,
-                                              data, file_size);
+                res = address_space_write(as ? as : &address_space_memory,
+                                          addr, MEMTXATTRS_UNSPECIFIED,
+                                          data, file_size);
+                if (res != MEMTX_OK) {
+                    goto fail;
+                }
+                /*
+                 * We need to zero'ify the space that is not copied
+                 * from file
+                 */
+                if (file_size < mem_size) {
+                    res = address_space_set(as ? as : &address_space_memory,
+                                            addr + file_size, 0,
+                                            mem_size - file_size,
+                                            MEMTXATTRS_UNSPECIFIED);
                     if (res != MEMTX_OK) {
                         goto fail;
                     }
-                    /*
-                     * We need to zero'ify the space that is not copied
-                     * from file
-                     */
-                    if (file_size < mem_size) {
-                        res = address_space_set(as ? as : &address_space_memory,
-                                                addr + file_size, 0,
-                                                mem_size - file_size,
-                                                MEMTXATTRS_UNSPECIFIED);
-                        if (res != MEMTX_OK) {
-                            goto fail;
-                        }
-                    }
                 }
             }
 
-- 
2.41.0

