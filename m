Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2371203njk;
        Mon, 27 Jan 2025 03:39:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVA41hzyU/78yYUa7bnVq6//2X6Bc7VDT2xilBjT1K+MertubN/hUiIEKxYnHVfgYzll9bHYWJYfp2R6g==@linaro.org
X-Google-Smtp-Source: AGHT+IElCccmgN7HLWrMfod3mTo1H9lKqSPHPphvTmLy2R5qWXVZIF3uF4e6+g3kp2TylL/YH2X0
X-Received: by 2002:a05:6214:2586:b0:6e1:a5c1:d53c with SMTP id 6a1803df08f44-6e1b21b7bfamr518290656d6.24.1737977982473;
        Mon, 27 Jan 2025 03:39:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737977982; cv=none;
        d=google.com; s=arc-20240605;
        b=VE9e5UokHuCkppF1J6e/y6qaBJDwY1b1jMCpj8z3pAR2CJqD4UTVZNP+6yRh0P86II
         9dlrckmpNCG6ZDF0u1LuY5TMy39EvDZYm0GiM95ExRNssUsYmHl81s6RjGlSCSzNQXf7
         h/grOc41OOwHcjlnfzhg8WcxOqFtgah2ILHhUTvFFs5851PedWI3nKYEbcuNEOSkUA7W
         IrzirAdLMoMahrV3KEzo4rEisPN6OZP/LveqVs/LZ5QlubJy4kaiFgsDcA2qCjY/6XP0
         ECNFnWkVgXjiBCpBVvbkJn/TunDCsO8fSRopcCFp0I3JSIpBd/GkrjWgtEclPNdda2bH
         J8Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7f2QljdpVMPmTAUUD5p1a6uYolSKMxu405BuJzc8Pcs=;
        fh=hMNMPeWZgEWcN/w6PMD3QpMvd59VNVX/6gwKjiqZBxg=;
        b=X7nE0OfQOge9FOZY8HUaRJczp4ydmRAN+0ut9/qGA9h+Iws4beC5+BjJehQBvTRxGq
         dYf/Lefm9GfNvgakqE/7qXVecEnUdNuZrwE/w+MP5QSW/ErNHiw3EwSe/h8Z7U2QB7FG
         dl932HIbVyXt6hNi/kzQl3KRAJJJOjh/O+tirQiLiqCqKLu5XpBrSYkwawIyyXGtQjNX
         if8U/AQVtv2knr+CYxtiVEdMbnTOrryK/oqqOf0CeOlis60+76Am5wYCey3LhRjdW2fd
         Cq1so9gAtOcnbtpspn3KVX6/r3t15OS/LkZxgKItF6hTd6qwfy0ID5PrTFDlSxIaf2Sw
         L0yA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oKJs2Y4B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e205f02198si97122516d6.328.2025.01.27.03.39.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 03:39:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oKJs2Y4B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcNRz-0005ua-2G; Mon, 27 Jan 2025 06:38:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNRx-0005sZ-AS
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 06:38:41 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNRu-0005Bl-3U
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 06:38:40 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-436202dd730so30028205e9.2
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 03:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737977916; x=1738582716; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7f2QljdpVMPmTAUUD5p1a6uYolSKMxu405BuJzc8Pcs=;
 b=oKJs2Y4BRLVBXO7RO9q3kikLt4emzO+aEZbg3kPOrJt4ZzFAOmCfBiq8lnaQH/Sj8l
 GMqbm2uDvra9aYRyzAo+u96orxevYpbvySEI4+4TQCmDBUmyrHWNNT99bN5KUc+5K9L9
 DBf0uodnqfaEKH4u9QaZCCYUHDE8vJC33d44/28ZpcNI04iVDPiVJw9RmLecXSqIlH7W
 Mptx49x9BCZI3Lv7ccF5pO7iKOtz5bWb2O+owSvmbzoU1VygGZ2Qi/vsjD54fmB/l70o
 6WvL/OaPWKXEdtNGr+7AOc+P39XwGoqlT59XPGCjni6cgVuvAZVzGYLEpmi2DXBaGsNe
 sZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737977916; x=1738582716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7f2QljdpVMPmTAUUD5p1a6uYolSKMxu405BuJzc8Pcs=;
 b=Zx1iLU1YtCzsOBaF/aK17xyMyZP64FUrifCRiAXkR4ewDm0jKz7kr3j/743DQSOQY/
 zvStCVj0Q0WIRk4moxIdBqOs1rfOfbUMVtLheKxgsMpe3RksqqZP/VBLMipd69LlXXqR
 ybAocfH5NV32cPec40lTl64/PSPnRBJQQ5qn7KQn1gwBxU1AN3/PQ8OLbbtYrHd31SYR
 JMBLTrLpYz/9zO+SchSPvpj1WoqZM1xNf9VZibSgDVo9HdsYlYz78kZgkTRkkj+LFUi+
 LBQQSVboC1M/2QaQnBRObXowwhB0nLkL4ovjdvrGxujYEFRC4v2SoqubimGKB4QJmGdJ
 jmPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL2A2JxiJ4BHg8iC40cegsM5QSCHL56RE6lCFfdRRkAgE5C2c1knijsTZp65leA8mLJ0Rs+CUh/Q==@nongnu.org
X-Gm-Message-State: AOJu0YzK7Dn8oghGUn+GEAiLsaGvf8LVrRxJzvmo/GZRC7sMQb9VEuUl
 jm1HmC9rvAPgxDatXQNwH9/J8oBBA2fS5KjnJhkR0yTFbD7nw78pIqBCRZ2WPio=
X-Gm-Gg: ASbGnct0u03+ZSz2LKUdtsa67ztYinBm8DnUREzVrAYCHFlSFH/X2FW0Srja8wHli3Y
 OJg6mAglcThqvOU/m8VKAHriJilrzvQ+HTrShpe2JlkMSbmPSVVqOr77maZFpNwVdeqWGd/KFKR
 RhECJcFouqtYmcG0YSNcDOGI/3Ud1inwcji97XAQZjSg/Q7aZjY9P8RUODy2L6p68DXn37O/J7B
 RIAXJyaE61CYmoAbPB2V+Dk75QlTivOzlN43h+He8ZVJDbaBUuX7pM5Kp3SiaL0+R72BDggN1+1
 0Hxpi7A5DZX0eunhPsxPJQLmvjKL/0DaO2+oBNpgIM+WPpHInrFRfQU=
X-Received: by 2002:a05:600c:1f86:b0:436:aaf:7eb9 with SMTP id
 5b1f17b1804b1-43891439d5fmr325139905e9.20.1737977915930; 
 Mon, 27 Jan 2025 03:38:35 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd573245sm129066725e9.33.2025.01.27.03.38.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Jan 2025 03:38:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/6] hw/loader: Remove unused load_elf_ram()
Date: Mon, 27 Jan 2025 12:38:20 +0100
Message-ID: <20250127113824.50177-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250127113824.50177-1-philmd@linaro.org>
References: <20250127113824.50177-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: kP72RtVg0SZZ

Last use of load_elf_ram() was removed in commit 188e255bf8e
("hw/s390x: Remove the possibility to load the s390-netboot.img
binary"), remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/loader.h | 14 +-------------
 hw/core/loader.c    | 16 +---------------
 2 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index 8985046be40..9bb34e6f062 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -155,20 +155,8 @@ ssize_t load_elf_ram_sym(const char *filename,
                          int clear_lsb, int data_swab,
                          AddressSpace *as, bool load_rom, symbol_fn_t sym_cb);
 
-/** load_elf_ram:
- * Same as load_elf_ram_sym(), but doesn't allow the caller to specify a
- * symbol callback function
- */
-ssize_t load_elf_ram(const char *filename,
-                     uint64_t (*elf_note_fn)(void *, void *, bool),
-                     uint64_t (*translate_fn)(void *, uint64_t),
-                     void *translate_opaque, uint64_t *pentry,
-                     uint64_t *lowaddr, uint64_t *highaddr, uint32_t *pflags,
-                     int big_endian, int elf_machine, int clear_lsb,
-                     int data_swab, AddressSpace *as, bool load_rom);
-
 /** load_elf_as:
- * Same as load_elf_ram(), but always loads the elf as ROM
+ * Same as load_elf_ram_sym(), but always loads the elf as ROM
  */
 ssize_t load_elf_as(const char *filename,
                     uint64_t (*elf_note_fn)(void *, void *, bool),
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 4dfdb027eee..ead10fb6cb5 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -425,26 +425,12 @@ ssize_t load_elf_as(const char *filename,
                     uint64_t *highaddr, uint32_t *pflags, int big_endian,
                     int elf_machine, int clear_lsb, int data_swab,
                     AddressSpace *as)
-{
-    return load_elf_ram(filename, elf_note_fn, translate_fn, translate_opaque,
-                        pentry, lowaddr, highaddr, pflags, big_endian,
-                        elf_machine, clear_lsb, data_swab, as, true);
-}
-
-/* return < 0 if error, otherwise the number of bytes loaded in memory */
-ssize_t load_elf_ram(const char *filename,
-                     uint64_t (*elf_note_fn)(void *, void *, bool),
-                     uint64_t (*translate_fn)(void *, uint64_t),
-                     void *translate_opaque, uint64_t *pentry,
-                     uint64_t *lowaddr, uint64_t *highaddr, uint32_t *pflags,
-                     int big_endian, int elf_machine, int clear_lsb,
-                     int data_swab, AddressSpace *as, bool load_rom)
 {
     return load_elf_ram_sym(filename, elf_note_fn,
                             translate_fn, translate_opaque,
                             pentry, lowaddr, highaddr, pflags, big_endian,
                             elf_machine, clear_lsb, data_swab, as,
-                            load_rom, NULL);
+                            true, NULL);
 }
 
 /* return < 0 if error, otherwise the number of bytes loaded in memory */
-- 
2.47.1

