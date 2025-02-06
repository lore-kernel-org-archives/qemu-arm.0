Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1778795njb;
        Thu, 6 Feb 2025 12:00:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXTPhsSjTplwnouy7WAb49+lIB6w8secjQp3zw28BY6KmJJZBXImmcY3RgZCj9lnl1h2l9GDgaFMYnV4A==@linaro.org
X-Google-Smtp-Source: AGHT+IFTSX1iWfknfkzBzTNdvvgzkcIoNuuyEHkriSlBqqpl4Th0hCDyllGtdwPudJlZklU1VQLx
X-Received: by 2002:a05:6102:3046:b0:4b6:44ff:414e with SMTP id ada2fe7eead31-4ba85f0daddmr414589137.17.1738872053893;
        Thu, 06 Feb 2025 12:00:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738872053; cv=none;
        d=google.com; s=arc-20240605;
        b=TsYfmmJ6DB7al4bD0GRbLZGqV4BfbyeDh7ylWZl3zCr0NMFBddgvhZDQmG2V6aMr50
         p83iU0wWqbmEJXyBD5Wb8hor/qrBrEXMapd8V5l+AaSIxEGEj2xXcMtbtApwSUyZD9BX
         oUJPjho9wdeNYlvYrgiQH/yrPeTFcgonYY8UuOKV3XChMUdv54qPAwE2ZOskSp00IA7p
         y0t8ccfu3LS3QiGmXD5693eKuH/vHSvb+BHnU+NcDF8IdaIBefDJJTPuSQ2RJnKXJbSW
         4zyzdcinT3mQsiNop320/+9PcUhttvsTDn8cl8DKPqSMawSol4LSiypgHGMJzcIOThPJ
         8BGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6yQG/JZUJN3De10B8fCU7OOg4fPLVxH4C3YmmWb37OE=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=HGNIERMM4NbgYMwlH3FqVbpbKQoLAehpUutbkguVTdpUetW0S4hS8OtqQF046iuMSo
         YEJpvcNQFpZebIGO/5wNu9lDFTAjfVKy+RO/YKci0nm8TrMnzcqfJBkc9k8BAq87gpTQ
         jtSU8Io8tnbWnbNDvab1otZerwmGh//si2GGGJW/vJPuzmd5dz1xIgyzNjPUqtiAXw5F
         GrY/hF8ZJWhNNtydF2Pr8NS0prEEfF2E23XmWi6tMiQcxVW4QQBbLdEiT5vkhsuiw5gY
         uqhA0poFQAAbsZ2S594aW28M+caXXFcV1XzHn8C7HpCYhwZxHKUbn1Zb816w3/l6oNMW
         pZpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sblUhMtY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-866f97bf91csi340276241.114.2025.02.06.12.00.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 12:00:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sblUhMtY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg80s-0008EC-6a; Thu, 06 Feb 2025 14:58:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80H-0007Ff-Lc
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:39 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80F-0000YP-PA
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:37 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2f9c69aefdbso2646068a91.2
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 11:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738871854; x=1739476654; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6yQG/JZUJN3De10B8fCU7OOg4fPLVxH4C3YmmWb37OE=;
 b=sblUhMtYqNrXo+qr+6uxk0I9QlXp/t6dOpJI5b6tmOO7PzRjmIL9nlEdUJoSLORc9z
 Ff0ZwwP/ATr1HRQCCc7XJ1hbUhuqkaGVwY6R4uHEuo9yz98AboRqxDwlf1g/KWY+8O3v
 SsemM3dQNGqE/CI3sn8p+wm08NVfQxbl9PQIai+y2Reew/nDv4UUNSz2HsrHW1b6IVjY
 3wOhsQSdt07Ri5skSEDFJdt2UaTuC4cNCvZZDDVFuUoNpjuvwLznLSDBtvILgMPwJRKR
 O5v335eim7OzIvE0nUBxaxo5um6PicXHHHEvKpHvsVsFj0Z/qBH/E23Z3FKHwf4Eqmsc
 /DVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738871854; x=1739476654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6yQG/JZUJN3De10B8fCU7OOg4fPLVxH4C3YmmWb37OE=;
 b=TsCsHyqPMvtv1ISOKdFtM+OYeND2t81pJlcksQqZsepV8ne/obuAMWtQq3iFq1FD/f
 MOskQxTbJFhpHXjucXyQ3pYdhN+q6mDMOlB9WGgTlikPln75pn5R5vgXAja03pa5pJg+
 MXk0V7e93iBsgKrBLSf9NSrXARKjWWkn/lXKaQSx6uQEtqFikwF7yQ9nlBpYZ1vnpTqw
 GtvY7ifO2ZL24/ZKNTsFKFRg8BYeI2VipsVZdPTvLyEqGWumR9HZikS1yvPlNALfArYZ
 oXh0sreExxxmIut4dJfA200qHAlCAo7J6xv9byxJLgwBpgaShZaHyPbXGCdRVfIH64Vj
 6ftA==
X-Gm-Message-State: AOJu0Yz4Xz0smx5poxYEOgz9sI4TXSpUyJeBxMUnR5rYLS5X6NtzyWdT
 oMJROkSPgKhKAXM8TgmP8SknQbWtARebltWFfQdAjtIiu5h/F5+eoLclsA9RWXy4f0xqssvoFus
 G
X-Gm-Gg: ASbGncvCdRZHN/Lwp+Tqsvr+mGCaCO5Ou0mLtK1pOCF02BGWqOT+Dirp/OraD7XxB4f
 ztGOnHUSkmNh9VvwE5BMhF/BhjtkTGPornPxvPTyFdkGBS0gyX+rYClaHk6RPNnqQlS+Wihrwq6
 AkICYW+GSHTmQQynxQBPWrw2OXZgBgoGRYsI3h1ESQKa4g/fRvxDr4uj6n4MCZdSDJfg4Qs5VPp
 pchBakgi9hF09SeCaaR1Tb/KnvXZd7i7Yhr6Lh/NsMK2GbtYnySn/X8esGcPPBnH+Q39tVbBtau
 nBC74REJxM22cnxWthqLsQGYjXfzgf92NW5SNzSD1LFX1a0=
X-Received: by 2002:a05:6a00:3016:b0:725:e499:5b86 with SMTP id
 d2e1a72fcca58-7305d546034mr1030433b3a.20.1738871853734; 
 Thu, 06 Feb 2025 11:57:33 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048c16370sm1666993b3a.152.2025.02.06.11.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:57:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 23/61] target/arm: Implement SME2 BMOPA
Date: Thu,  6 Feb 2025 11:56:37 -0800
Message-ID: <20250206195715.2150758-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: gwVL+fdB8to1

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    |  3 +++
 target/arm/tcg/sme_helper.c    | 34 ++++++++++++++++++++++++----------
 target/arm/tcg/translate-sme.c |  2 ++
 target/arm/tcg/sme.decode      |  2 ++
 4 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index 8246ce774c..17d1a7c102 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -153,3 +153,6 @@ DEF_HELPER_FLAGS_6(sme_sumopa_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sme_usmopa_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sme2_bmopa_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index ee81bece12..6d8e2cedc9 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1267,17 +1267,31 @@ DEF_IMOP_64(umopa_d, uint16_t, uint16_t)
 DEF_IMOP_64(sumopa_d, int16_t, uint16_t)
 DEF_IMOP_64(usmopa_d, uint16_t, int16_t)
 
-#define DEF_IMOPH(NAME, S) \
-    void HELPER(sme_##NAME##_##S)(void *vza, void *vzn, void *vzm,          \
+#define DEF_IMOPH(P, NAME, S) \
+    void HELPER(P##_##NAME##_##S)(void *vza, void *vzn, void *vzm,          \
                                   void *vpn, void *vpm, uint32_t desc)      \
     { do_imopa_##S(vza, vzn, vzm, vpn, vpm, desc, NAME##_##S); }
 
-DEF_IMOPH(smopa, s)
-DEF_IMOPH(umopa, s)
-DEF_IMOPH(sumopa, s)
-DEF_IMOPH(usmopa, s)
+DEF_IMOPH(sme, smopa, s)
+DEF_IMOPH(sme, umopa, s)
+DEF_IMOPH(sme, sumopa, s)
+DEF_IMOPH(sme, usmopa, s)
 
-DEF_IMOPH(smopa, d)
-DEF_IMOPH(umopa, d)
-DEF_IMOPH(sumopa, d)
-DEF_IMOPH(usmopa, d)
+DEF_IMOPH(sme, smopa, d)
+DEF_IMOPH(sme, umopa, d)
+DEF_IMOPH(sme, sumopa, d)
+DEF_IMOPH(sme, usmopa, d)
+
+static uint32_t bmopa_s(uint32_t n, uint32_t m, uint32_t a, uint8_t p, bool neg)
+{
+    uint32_t sum = ctpop32(~(n ^ m));
+    if (neg) {
+        sum = -sum;
+    }
+    if (!(p & 1)) {
+        sum = 0;
+    }
+    return a + sum;
+}
+
+DEF_IMOPH(sme2, bmopa, s)
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 8a901f158c..25139cb7aa 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -507,3 +507,5 @@ TRANS_FEAT(SMOPA_d, aa64_sme_i16i64, do_outprod, a, MO_64, gen_helper_sme_smopa_
 TRANS_FEAT(UMOPA_d, aa64_sme_i16i64, do_outprod, a, MO_64, gen_helper_sme_umopa_d)
 TRANS_FEAT(SUMOPA_d, aa64_sme_i16i64, do_outprod, a, MO_64, gen_helper_sme_sumopa_d)
 TRANS_FEAT(USMOPA_d, aa64_sme_i16i64, do_outprod, a, MO_64, gen_helper_sme_usmopa_d)
+
+TRANS_FEAT(BMOPA, aa64_sme2, do_outprod, a, MO_32, gen_helper_sme2_bmopa_s)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 37bd0c6198..de8d04cb87 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -165,3 +165,5 @@ SMOPA_d         1010000 0 11 0 ..... ... ... ..... . 0 ...      @op_64
 SUMOPA_d        1010000 0 11 1 ..... ... ... ..... . 0 ...      @op_64
 USMOPA_d        1010000 1 11 0 ..... ... ... ..... . 0 ...      @op_64
 UMOPA_d         1010000 1 11 1 ..... ... ... ..... . 0 ...      @op_64
+
+BMOPA           1000000 0 10 0 ..... ... ... ..... . 10 ..      @op_32
-- 
2.43.0

