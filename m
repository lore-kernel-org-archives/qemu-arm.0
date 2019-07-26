Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207893wrv;
        Fri, 26 Jul 2019 10:51:52 -0700 (PDT)
X-Received: by 2002:aa7:86c6:: with SMTP id h6mr23883603pfo.51.1564163512131;
        Fri, 26 Jul 2019 10:51:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163512; cv=none;
        d=google.com; s=arc-20160816;
        b=zHfQ14QEJS0UrgqkzJdgsrdTJphw8VyUd1N2V5ZWF7S2iYW+xQQq17oxdP/diMXXsw
         Mr0ypcL2rE2mAoqZer2yiKTSeqZT7juwPjdlHk+X0W4wUACWhbOjTTr/VauK7N/w09ID
         mLKSO6/9Av9mEmPZAoTn9VjdhT3RTIFCApxl/YMH0ArOYkrjZ6LzH4YWv2suJZ1xCzg4
         dvh8sxpZde0UyxAPd4W9Ye8zL9ejtfAj6DknuCbfZajVQcf4cRdZKcGcondjB0q5HTHI
         K3406WMK3rdGqhggZq8AONiSopG51yl/jv3e7BTmm3JNcL9IgcHXrHPHjY2ffq4DhO04
         p7Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=GfZoaF1PKj02fL5gI7kwlJOVMtCnQ9O6XVR81E0meI8=;
        b=NpFY8P5UMqbFg/hO0ZE9lkNmhPw4cjiXBaXioGXSyPr88d/oloD0IjqI6d1cPrM7Gx
         1OD3H1SgbAnxYXhrBIz663R9PQf+PwYtAVUXXGOJqraXbRu9Ob7Rb5SkB3zNkDSUL/8f
         4Jc82G7U5tsR3pmSE1kMTyqPZZgWl3zuAvrwgSUQjPx/aEW2CXUP/fCpmxK2jrLwkjeK
         P2Nr2tqtQbY/7WnwlM+n6g7NQu0MaRToI0LphrCNgtMstT228JHRMUL8s2Ic+ErS4dRW
         tpGxIv+e+Hjxg0x/Airwsh5B33Yhp7o4kcAWpb3Cx0paSUkhgz3qOK0LHJzdbn76ZHFs
         gWnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kcq8eWPV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b67sor34709357pfg.36.2019.07.26.10.51.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kcq8eWPV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GfZoaF1PKj02fL5gI7kwlJOVMtCnQ9O6XVR81E0meI8=;
        b=kcq8eWPVuVdKWR6yW1d/KHcSAnOLyfw8o2AyH2g3hGs0sb1lxn1A0JA91+kpnwI0CS
         qppjr3UV2eo+kWSsTPm3Igg9+XENJRT6omZwXtoPzln8YbZFwhvmXqShJtOs+gWUxCbI
         HJL5Qwclub7i4zjhVYFcV/RnUvyw7xJ7RNyViifawnoL+u/kaoFsODr9lQYgnxIZr9Ee
         yGVhmt9i+LHlYGxDHjym7zm4dxuy5Fbnac9Pgng2GmSzyrkwS3bmj3hDq13G9v6VJfFp
         K49ZJeCEvLowoCCkYWtjZwPgnRGejqDJGD6/7r4MYQgJ/f9VNIQrxVniWbS1iD2tJ7qK
         MLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GfZoaF1PKj02fL5gI7kwlJOVMtCnQ9O6XVR81E0meI8=;
        b=YyTDZazMDCmKBM2QNxQbMuFqkklg+0iM3K3lXmuQRiZvPe3sdM3z0VtKJT7POWQ5Ic
         0q8VctkWpq02tmpXuobcqmV4Cxm5e0XXRPHPoPQ3PGM6LIDRzUVvnu3qvKoC+hKA0lB9
         wEU/IVjSz4f76kWFKyUD/ArIdwkjAL1oM/JfcQ6jkS3QRkrr4SXLpCv3vTZ0Ih0MDNGE
         bRwJgF9iPUIg2XDuv7ktVEN8f7xhgRX1irhOoYvzu3J2OfxK5NglqRiGUuHosNzoAgrN
         Fmyaz94qjRIOfwA7KPKyr6SAtqxJaeTeidXcReikMyzWTk5Kg5bUJsV57N3/zLpms5Mz
         VFjg==
X-Gm-Message-State: APjAAAUtucNsBcN0U0zWNhzcp1zK5DZu5Hu8e4rgYAbRUPNW21ClOIzz
	tNIs1ZzlJw39R6tsS9/VYo3cak2R
X-Google-Smtp-Source: APXvYqzVE8B2mzx60xssgjTgsd+M67p9tl80pak7Zh1+teSK+EutOz2+fAnoMN9JoFaJa/Bey3kDvw==
X-Received: by 2002:aa7:8218:: with SMTP id k24mr22628587pfi.221.1564163511718;
        Fri, 26 Jul 2019 10:51:51 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 65/67] target/arm: Clean up disas_thumb_insn
Date: Fri, 26 Jul 2019 10:50:30 -0700
Message-Id: <20190726175032.6769-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: s2oUwytIGGoW

Now that everything is converted, remove the rest of
the legacy decode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 27 ++-------------------------
 1 file changed, 2 insertions(+), 25 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index a8db6e9280..c2b8b86fd2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10677,32 +10677,9 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
-    if (disas_t16(s, insn)) {
-        return;
+    if (!disas_t16(s, insn)) {
+        gen_illegal_op(s);
     }
-    /* fall back to legacy decoder */
-
-    switch (insn >> 12) {
-    case 0: case 1: /* add/sub (3reg, 2reg imm), shift imm; in decodetree */
-    case 2: case 3: /* add, sub, cmp, mov (reg, imm), in decodetree */
-    case 4: /* ldr lit, data proc (2reg), data proc ext, bx; in decodetree */
-    case 5: /* load/store register offset, in decodetree */
-    case 6: /* load/store word immediate offset, in decodetree */
-    case 7: /* load/store byte immediate offset, in decodetree */
-    case 8: /* load/store halfword immediate offset, in decodetree */
-    case 9: /* load/store from stack, in decodetree */
-    case 10: /* add PC/SP (immediate), in decodetree */
-    case 11: /* misc, in decodetree */
-    case 12: /* load/store multiple, in decodetree */
-    case 13: /* conditional branch or swi, in decodetree */
-    case 14:
-    case 15:
-        /* branches, in decodetree */
-        goto illegal_op;
-    }
-    return;
-illegal_op:
-    gen_illegal_op(s);
 }
 
 static bool insn_crosses_page(CPUARMState *env, DisasContext *s)
-- 
2.17.1
