Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp413628ejc;
        Wed, 10 Apr 2024 09:07:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWdsiTDtvEwSVlYtdxSDOMM7PMmJ3lA5qcVSAVuo0WC3aiSYeK0mzG0x+24vmgWkvt8JC/f0hopMW4YGxX2Igg5c/s9yFmZ
X-Google-Smtp-Source: AGHT+IGu/0B2kvMIGZ/InmnJCUGXvGuDYBeP8hx1qiyitR+eNpNGmBoyUo2J3sDWUPbslrrOmpUX
X-Received: by 2002:ac8:5992:0:b0:436:5274:6336 with SMTP id e18-20020ac85992000000b0043652746336mr327091qte.51.1712765252891;
        Wed, 10 Apr 2024 09:07:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712765252; cv=none;
        d=google.com; s=arc-20160816;
        b=YuNvPcG4H9dRNoyXfJdDhxSZUYmGqa7AnRlN9p2Yvpxs0gZ0TS2WF3dJ0Moz06ENvB
         rY8oUCrA/diUASii28bkcPekNAwnTa4BTUbdZbSeMFtoyw5c/K+GXXu/O6xA3AqvqpiI
         Y4EfAnshFMCRs4cMnbvR8wbu/F5rBMajwkPoh+oMfaazQNq4cCzGgZyLysgzOpUiE18u
         Eh6uOkiX2zA2FBtZVWkTU99QXN+KFNVtSjs1wkVBpj7UWkrDdAC3pfEaKY+0/4amy+/h
         YJ2IspzNWzwJGd55VsTVj/FNv6gWlAgq5TdqOoeyyjHLjXbuhM8LU2+kbf598qqbU9Aj
         uaLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=i9EgoEyF4/rVzoPOi90aJqArCNPBQ3SZoaAZfVVHCyA=;
        fh=UWYPSc6lFEtDGAdsfbGXa/TndNnIg9LYTXf2fXfDKtQ=;
        b=xSwfCHcPdVIq7gAEV1HRb6PH727zylfr4qwlLDqW+BDhpjtL+NvcOgEi1lIRoWhb/b
         ceqGGgzSY8kKBA30bQ3LFq9dX1F6AbsKd92hn4JEuhSMCsbD7MoDC5vrUEWqqGLthgDa
         LKD7dYOn3bONtDov+iSuq+yGneqIA2OtKnFOvbIU4bN1o25Uzs5FYkGpYje3CxEoRsei
         v7D4FKicL1F3LhK+3IlndqkD60+caCOS8Uy1A2n7a6Ytvk/emEpKJjfDafErmYj0JP+L
         Xx3Go6ZhSQzKFaZzhL8KML4PWfmEYQ8dVTdOZC/mvjMGjavHHDEyP1Rrk9V/9hWHED1K
         gagg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BNVBWKmF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13-20020ac8598d000000b00434996df207si7604640qte.402.2024.04.10.09.07.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Apr 2024 09:07:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BNVBWKmF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ruaTN-0000Lb-C9; Wed, 10 Apr 2024 12:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruaTG-0000FJ-4v
 for qemu-devel@nongnu.org; Wed, 10 Apr 2024 12:06:46 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruaTD-0002eq-5T
 for qemu-devel@nongnu.org; Wed, 10 Apr 2024 12:06:45 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so13412797a12.1
 for <qemu-devel@nongnu.org>; Wed, 10 Apr 2024 09:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712765201; x=1713370001; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i9EgoEyF4/rVzoPOi90aJqArCNPBQ3SZoaAZfVVHCyA=;
 b=BNVBWKmF+EWgVlLwrYi4ykCSD+oikrFFP0SqNWF8D3f3s2pl7fT6+j627BR9sSLIPa
 rl8CpDaSaevTtJbJMB3nKVzQVpqoCGKDvMkTJVX9xH8570x2o0++ilejyN4Nj6uqtBKL
 xjaQNC6bqAglReleDRwbC7iuPcEa9NLtLyw7QQ9H0YDtiU2IKABaIXbJo72QJinE3vRr
 ZGbMM6CXY7fY4ZtaqKlIqLTbuntH/weBMOkkMeFtXVYGLdTzKnkn7Xcj1ktZBeP2bnDz
 5Z/qO7ysuMmG7di6Zz4/BoYSUmwyPdTHre/VhkwvBGiTW4y68+C5J/um+ZtIs14IxYL0
 oqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712765201; x=1713370001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i9EgoEyF4/rVzoPOi90aJqArCNPBQ3SZoaAZfVVHCyA=;
 b=ayn8A/NLOSRWjvsw5vXv78Ycv2z942yDpfnCcl/r7mc13L0Q9I+DwKOdg1n4iBkHuV
 yp6p4NnR3MRHbotgzGxR28cJeQQ/OWaubtTu7eTBT3o8fWq7HwZ3gnYYQEVBp9jhZ+HZ
 Y2+LhEn170GTKTfGsKSMxEHFt1wBEBY8saWwBtYHaxRRCu+pUqC57oROueXvo1eVVwyH
 QGKbZ0yP4o2lcIOnDFN4IQerGKCGtzgjaB2zlp87zS/WsF646+vdWnSKIdcp67qoLlEY
 vxwZJjCDRoHpc+v2dSIzZ3GDR+5Td2/9vQjYMXFe6lArxhgB2JJXPsyUNwvOR7uYakPc
 vwGg==
X-Gm-Message-State: AOJu0Yxuozxf7EthuH55cu2giKIkEaTOhjA6yZNgDXSNw5sJpLDBjWD4
 7Fs3xpbCiUEbkD3GScMwAux9lHWyauQxlXhSY8MOLhqZmMX5zVcas/tSFoD8ERCMGFWhfBEna2g
 v
X-Received: by 2002:a17:907:9302:b0:a52:9e:45c3 with SMTP id
 bu2-20020a170907930200b00a52009e45c3mr52304ejc.35.1712765201134; 
 Wed, 10 Apr 2024 09:06:41 -0700 (PDT)
Received: from m1x-phil.lan (arl95-h02-176-184-34-173.dsl.sta.abo.bbox.fr.
 [176.184.34.173]) by smtp.gmail.com with ESMTPSA id
 gt17-20020a1709072d9100b00a51b3d4bb39sm6059337ejc.59.2024.04.10.09.06.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 10 Apr 2024 09:06:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 04/12] hw/mips/malta: Replace sprintf() by
 g_string_append_printf()
Date: Wed, 10 Apr 2024 18:06:05 +0200
Message-ID: <20240410160614.90627-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240410160614.90627-1-philmd@linaro.org>
References: <20240410160614.90627-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IuW27HoD0hRR

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience.

Extract common code to get_rng_seed_hex(), replacing the
sprintf() calls by GString API ones in order to avoid:

  [120/169] Compiling C object libcommon.fa.p/system_qtest.c.o
  hw/mips/malta.c:860:9: warning: 'sprintf' is deprecated:
          sprintf(rng_seed_hex + i * 2, "%02x", rng_seed[i]);
          ^
    This function is provided for compatibility reasons only.
    Due to security concerns inherent in the design of sprintf(3),
    it is highly recommended that you use snprintf(3) instead.
    [-Wdeprecated-declarations]
  hw/mips/malta.c:951:9: warning: 'sprintf' is deprecated:
          sprintf(rng_seed_hex + i * 2, "%02x", rng_seed[i]);
          ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/malta.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index af74008c82..095abbf0ec 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -850,15 +850,24 @@ static void G_GNUC_PRINTF(3, 4) prom_set(uint32_t *prom_buf, int index,
     va_end(ap);
 }
 
-static void reinitialize_rng_seed(void *opaque)
+static char *get_rng_seed_hex(void)
 {
-    char *rng_seed_hex = opaque;
+    g_autoptr(GString) gs = g_string_new("");
     uint8_t rng_seed[32];
 
     qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
     for (size_t i = 0; i < sizeof(rng_seed); ++i) {
-        sprintf(rng_seed_hex + i * 2, "%02x", rng_seed[i]);
+        g_string_append_printf(gs, "%02x", rng_seed[i]);
     }
+
+    return g_strdup(gs->str);
+}
+
+static void reinitialize_rng_seed(void *opaque)
+{
+    g_autofree char *rng_seed_hex = get_rng_seed_hex();
+
+    strcpy(opaque, rng_seed_hex);
 }
 
 /* Kernel */
@@ -870,8 +879,7 @@ static uint64_t load_kernel(void)
     uint32_t *prom_buf;
     long prom_size;
     int prom_index = 0;
-    uint8_t rng_seed[32];
-    char rng_seed_hex[sizeof(rng_seed) * 2 + 1];
+    g_autofree char *rng_seed_hex = get_rng_seed_hex();
     size_t rng_seed_prom_offset;
 
     kernel_size = load_elf(loaderparams.kernel_filename, NULL,
@@ -946,10 +954,6 @@ static uint64_t load_kernel(void)
     prom_set(prom_buf, prom_index++, "modetty0");
     prom_set(prom_buf, prom_index++, "38400n8r");
 
-    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
-    for (size_t i = 0; i < sizeof(rng_seed); ++i) {
-        sprintf(rng_seed_hex + i * 2, "%02x", rng_seed[i]);
-    }
     prom_set(prom_buf, prom_index++, "rngseed");
     rng_seed_prom_offset = prom_index * ENVP_ENTRY_SIZE +
                            sizeof(uint32_t) * ENVP_NB_ENTRIES;
-- 
2.41.0

