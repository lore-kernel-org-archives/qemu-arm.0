Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2370874njk;
        Mon, 27 Jan 2025 03:38:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWHbt9/j+2T/fzvAErNWId51Oe8Ct5D90i/iY+ylslAzoR1MNj3DhNqliJjCx2NgpdrOt3AM+sRNkC9kQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEQTfUsYAFcbxm9mbekxZ7j+uP622p4Lus17CK695TCMJSewhcrStrTkILovhnB70qrZFqu
X-Received: by 2002:a05:6214:1c08:b0:6d8:8256:41d7 with SMTP id 6a1803df08f44-6e1b220cb00mr578530416d6.33.1737977938874;
        Mon, 27 Jan 2025 03:38:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737977938; cv=none;
        d=google.com; s=arc-20240605;
        b=WySTbwJSUdLffQl6Yx7Mn0tnwkoDdmergarVtsnm44rtw/fIgC0u6CmRxVqpX5kdXu
         2gOxhAJ9+8KkAhX1ZVNNNhN87QdWRVNNnPPoruO4G2/qpNDnG/BhXaXyeH30m6t3YYw3
         0eTvj2LU1K3rQ2iUeQLdSUOtUPJJPDXh+75+mutnmEJWsNVuy2f3/8GgH00JMQy9a/T8
         YEoJ0YjlLrYPXqkxYNEfMYuavwJtMep27SpxPXHeh2rBuoNNpkWbI/9qFU5ErDIoAwDI
         Vw60AFUfvWEFPvjyKHp3u496ajCCR5BCKVfig1OlLHic4tL/duez7By84MMtC8cGUo2P
         GwtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=duOqb1GCMJx47PEXJD6iEC2jwq3vPcsjz9INrZ4jd4c=;
        fh=10ks9c9mlgoOkEUImVGe9rUtwIiPDsuSF96IHPTTGoA=;
        b=ToyyNn61BG+vxpp3ponyg0sBin+JeXCESMFItPuxtjWxM9s4RsrmY9s0L2iJwWGEwy
         wedi7EdAH7YYu24YvCYjXmQyBhAnuyApuUYObW8BtglXxbL1cyta2+6m08CLhRX9dWZI
         f8WSaATtNphbBn4ORROXWNMfSYbW9WZc/2WZKI87SRn4UZQyqcyFrs+Y2Tymo/qYWFvJ
         cTSDW1StSyEbln7CU+NBZzuGrUtXJV4KBik71hgB49jnqZ3BT30VO5J2fzGx7j2qY6+a
         rFlxp5h9YHLiF1CieV9xvrlTcsK1PNS96bsFjqc3Gors7JoEYCsGSSJwNJ+SzVCg9qSJ
         hVIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a1Gvi2c8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e205df70casi99947326d6.257.2025.01.27.03.38.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 03:38:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a1Gvi2c8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcNS9-00060W-3J; Mon, 27 Jan 2025 06:38:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNS5-0005zY-R7
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 06:38:49 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNS2-0005Dr-QF
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 06:38:49 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-385e06af753so2299555f8f.2
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 03:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737977925; x=1738582725; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=duOqb1GCMJx47PEXJD6iEC2jwq3vPcsjz9INrZ4jd4c=;
 b=a1Gvi2c8CdABavKz3SYRmeVC1qz4mcgQyD7/kxnuGXAZS2raUuqMMsCZDNhlG8whOa
 FNZPG5sw2UwFRofV5CTiIN/jKGFiY0EyIPDI8EcOvzgCnynKqcrxWtCVhu7g9r/8b+Qs
 260qRmKM5KFOvxv+3q6pdZxT17Pym2Yk9F0mdzmebRQIQUIA5ZDYfb/Zje32tBSGo7Jk
 1h5G0x/Gv61tyS2cBPMrwDcN0R5eGWJJ8Zp0NP2Z1HjhX4mXBPnTerJoK5fLNN481Drn
 UaAu4QULdr0vMCmLhfmO6QuhLPfXSoaPgG/MasC4aavHu43u41D69IfthxDNujWNwE05
 1O0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737977925; x=1738582725;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=duOqb1GCMJx47PEXJD6iEC2jwq3vPcsjz9INrZ4jd4c=;
 b=vo1Dg3TGAnYQmnSKFz0o4JKm1ydmlg8tXirnDm8euatPVrp+TiX0Ycgq3znZ7buq+G
 sAG5tL24P5sKe05FSGLP02p4kLMBEqHGiVbDe36+uT5BLOfFhs6Ttyokfc12iYHaPY+f
 FNwN4ijR+er/oNGP9WfMqex2JFOwsWFDAJ9UosJ3XrRoSzWdqKqi8DimjCaMGKfx/rHc
 w7efM1JEy84VB+Vfua17iMB4tugVKQlnfbk68tApgtxS3Gdl455jABPJs2TRPESR9uxU
 65xfdCCjN9WLJNQsyImRNFu94JifWalajwGYi9akVOAuEAfegv4Yyv60DQbtWSojG4xR
 qOeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDhpCr5Nd2VnlUD6fzU8lIFMR+cBGXrCZ6lfX7qgeOuXOqiwz4cPfzF1jP/uR2RpHTnUKtKg4NTw==@nongnu.org
X-Gm-Message-State: AOJu0Yy573A80CNK2yoSddBjaYimbWE3lEDLCzH2oxx+dqr/li2Pa9S6
 yIji0hzw+AUBAUBFQ7rHambdEh+fA+G29b53H/0hTkB/6rOwFQzV+FbwkTx4Hl9V2NA5Y3x1D42
 zgbg=
X-Gm-Gg: ASbGnctgRYKzfilzLh6TuidGcGScIBERenJyd6jk84t3vtngDlPJibGA4F8YnB3YkDW
 o3XHB04fGkffJNetC7k7gLV/YJnUD412RT+M5xdATonnbLTugvy8842J7G49qRWFo5pcwz9jL+2
 6CoY6QyrB7g09ZVgxtFZVSZJqHhEKQ5L+7BOeCJiMUfUJpEDf+jl1ThkcSlhwAhSX6Yug/+MmfN
 cfE5m0h+FRYr868ZK5LPs5sBdccteJxLCVXMRGpTyHQBFsL/Yj8ESr7BMB8DgkTq/HyLhO5+U+C
 ruox+MJfjZQD3FaxBA7FqW+2BGHMtgZFb9oRT+onseZA4mVQSbb5jHnWafF/dT3y1g==
X-Received: by 2002:adf:eb10:0:b0:385:fc00:f5d4 with SMTP id
 ffacd0b85a97d-38bf566ce7dmr28102438f8f.29.1737977925293; 
 Mon, 27 Jan 2025 03:38:45 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c3994sm10608811f8f.81.2025.01.27.03.38.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Jan 2025 03:38:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/6] hw/loader: Pass ELFDATA endian order argument to
 load_elf_ram_sym()
Date: Mon, 27 Jan 2025 12:38:22 +0100
Message-ID: <20250127113824.50177-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250127113824.50177-1-philmd@linaro.org>
References: <20250127113824.50177-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: fUjEaKtpMwHq

Rather than passing a boolean 'is_big_endian' argument,
directly pass the ELFDATA, which can be unspecified using
the ELFDATANONE value.

Update the call sites:
  0 -> ELFDATA2LSB

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/loader.h |  4 ++--
 hw/core/loader.c    | 23 ++++++++++-------------
 hw/riscv/boot.c     |  3 ++-
 3 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index 9bb34e6f062..8202c376043 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -120,7 +120,7 @@ const char *load_elf_strerror(ssize_t error);
  * @lowaddr: Populated with lowest loaded address. Ignored if NULL.
  * @highaddr: Populated with highest loaded address. Ignored if NULL.
  * @pflags: Populated with ELF processor-specific flags. Ignore if NULL.
- * @bigendian: Expected ELF endianness. 0 for LE otherwise BE
+ * @elf_data_order: Expected ELF endianness (ELFDATA2LSB or ELFDATA2MSB).
  * @elf_machine: Expected ELF machine type
  * @clear_lsb: Set to mask off LSB of addresses (Some architectures use
  *             this for non-address data)
@@ -151,7 +151,7 @@ ssize_t load_elf_ram_sym(const char *filename,
                          uint64_t (*translate_fn)(void *, uint64_t),
                          void *translate_opaque, uint64_t *pentry,
                          uint64_t *lowaddr, uint64_t *highaddr,
-                         uint32_t *pflags, int big_endian, int elf_machine,
+                         uint32_t *pflags, int elf_data_order, int elf_machine,
                          int clear_lsb, int data_swab,
                          AddressSpace *as, bool load_rom, symbol_fn_t sym_cb);
 
diff --git a/hw/core/loader.c b/hw/core/loader.c
index fc2e8f91267..0cd34425e9c 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -428,7 +428,8 @@ ssize_t load_elf_as(const char *filename,
 {
     return load_elf_ram_sym(filename, elf_note_fn,
                             translate_fn, translate_opaque,
-                            pentry, lowaddr, highaddr, pflags, big_endian,
+                            pentry, lowaddr, highaddr, pflags,
+                            big_endian ? ELFDATA2MSB : ELFDATA2LSB,
                             elf_machine, clear_lsb, data_swab, as,
                             true, NULL);
 }
@@ -439,11 +440,11 @@ ssize_t load_elf_ram_sym(const char *filename,
                          uint64_t (*translate_fn)(void *, uint64_t),
                          void *translate_opaque, uint64_t *pentry,
                          uint64_t *lowaddr, uint64_t *highaddr,
-                         uint32_t *pflags, int big_endian, int elf_machine,
+                         uint32_t *pflags, int elf_data_order, int elf_machine,
                          int clear_lsb, int data_swab,
                          AddressSpace *as, bool load_rom, symbol_fn_t sym_cb)
 {
-    int fd, host_data_order, target_data_order, must_swab;
+    int fd, host_data_order, must_swab;
     ssize_t ret = ELF_LOAD_FAILED;
     uint8_t e_ident[EI_NIDENT];
 
@@ -461,22 +462,18 @@ ssize_t load_elf_ram_sym(const char *filename,
         ret = ELF_LOAD_NOT_ELF;
         goto fail;
     }
+
+    if (elf_data_order != ELFDATANONE && elf_data_order != e_ident[EI_DATA]) {
+        ret = ELF_LOAD_WRONG_ENDIAN;
+        goto fail;
+    }
+
 #if HOST_BIG_ENDIAN
     host_data_order = ELFDATA2MSB;
 #else
     host_data_order = ELFDATA2LSB;
 #endif
     must_swab = host_data_order != e_ident[EI_DATA];
-    if (big_endian) {
-        target_data_order = ELFDATA2MSB;
-    } else {
-        target_data_order = ELFDATA2LSB;
-    }
-
-    if (target_data_order != e_ident[EI_DATA]) {
-        ret = ELF_LOAD_WRONG_ENDIAN;
-        goto fail;
-    }
 
     lseek(fd, 0, SEEK_SET);
     if (e_ident[EI_CLASS] == ELFCLASS64) {
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 90e75c69a04..c309441b7d8 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -246,7 +246,8 @@ void riscv_load_kernel(MachineState *machine,
      */
     kernel_size = load_elf_ram_sym(kernel_filename, NULL, NULL, NULL, NULL,
                                    &info->image_low_addr, &info->image_high_addr,
-                                   NULL, 0, EM_RISCV, 1, 0, NULL, true, sym_cb);
+                                   NULL, ELFDATA2LSB, EM_RISCV,
+                                   1, 0, NULL, true, sym_cb);
     if (kernel_size > 0) {
         info->kernel_size = kernel_size;
         goto out;
-- 
2.47.1

