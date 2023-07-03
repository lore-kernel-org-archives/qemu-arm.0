Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2172939ejy;
        Mon, 3 Jul 2023 03:11:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHiIxdYCzBTqKFmQmj67K+LQ5C/yWqgstenXyTSmKkCeQ3mlEH9xdm9Aal0JAvQaXqcXnQo
X-Received: by 2002:a05:620a:4041:b0:767:64cc:21c1 with SMTP id i1-20020a05620a404100b0076764cc21c1mr4913846qko.16.1688379064334;
        Mon, 03 Jul 2023 03:11:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688379064; cv=none;
        d=google.com; s=arc-20160816;
        b=tWiubnjzjbXi3CZhmKKyRUS3CqWh47Hlct0cRx4xRCujyK7wn5IxrCUuhNP+zHrS+h
         eLtKe9oftT3Y9k7Fv11fjpwUJTbk4703TYyEDNiRK8vSV9VVN41p4rD0sUHIRoV7r81u
         qQsY0K6WVVX18SpZ1tKnsxcJlmfWvqKjju6Ye5uRGSjIk6Zz0SVmgQj3tcM1tsWQab3W
         jA1yC211sg1OE63msevB892qL4YMelh0BCjWgOFnz7UXWq3TGn80X47hESBHXDWcnTZu
         UUxYHmF50VC1uOdsFV4ecUU9fO/KMHp4jOH7ZCwP17/demS7VzKlneT83REJR2j1qHnG
         5YMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=M7z3XVBK0XuXSTZ82FoV8jlvhCwFhDqWNnV/JcekGnU=;
        fh=DiqGMcF5+wJ0/Fe6a4a0YfMDHaiC5n3qovds/BNTPmI=;
        b=XvCfSojGcxmLeisWK5+f68uD0YxHffaK2EWd8mdkJvhXXlRnzJNrcHEEKVaGHb41rw
         jrQthl/JKRg9eGh8Qp5pAiuun8vSuAeZK04NR1sMy5OJ2aae0i8JBMm0U/+0/j4l0qYV
         cvU4C/9knrhVUDwpQ3ASRtYuCzPANhBuXfBTsmiEVmRbizs0Y4iXcdpil0WCI6N58Cz+
         Qq92jc2rjaYVucpFjsiTTe878xGLT+147tcnSfdf/7RD76v3Eh27D/crF12mzKdY4Iwu
         YKfhZVOcD2HzSyzJI3aidn6cBuAd3oUmV4YpUsE3+XOMGtFpQijLWmRHStCuf/hswdOY
         3ycg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l0Qy+jWm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pi48-20020a05620a37b000b007673ff60d93si5401112qkn.256.2023.07.03.03.11.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jul 2023 03:11:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l0Qy+jWm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGGSW-0004G5-UV; Mon, 03 Jul 2023 06:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRi-0003Aa-RV
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:06:14 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRS-0005zW-0K
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:06:14 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3142a9ff6d8so2413195f8f.3
 for <qemu-arm@nongnu.org>; Mon, 03 Jul 2023 03:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378756; x=1690970756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M7z3XVBK0XuXSTZ82FoV8jlvhCwFhDqWNnV/JcekGnU=;
 b=l0Qy+jWm45AnLdewkPB0cFKRIdircgIUmUBoJQpaiJ5xwLCGdGKgevHToJMojzXEZg
 ShOPjO8ZN1bzCD4TCCG+1NWwVFFHq9gjXXXZxIIuEhSMs/smZXQ2S0OyeR+nMJ8qkGI6
 ETzM6mvAKkrWt5oUJ8W/RKo/AGsEb6fl8ugnAFDeF1KE/uPKBr/elGz6GDoXPBw38Ukd
 LW3PzzrNmUNp+XtT4rXqoaq6vvjx6V00Wp2+rsyyZP1ad8yESsgotvtfgYPigpACaeiO
 SguWVSXpkFMOllusg6lItR6bjgGhqdJmfEChZ/XZ3VCUpNlp0AGyXQGROCf8bq0s4tp1
 olFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378756; x=1690970756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M7z3XVBK0XuXSTZ82FoV8jlvhCwFhDqWNnV/JcekGnU=;
 b=ah7kXaJbmuuW1tpgNMH8bgPb/PEj4UGatPEtnsogwZZSYLAj5uCb7ssntCDP0BxNj5
 uQ34PgliURvAo4v8NdLHsrUYgSwXFPuIiYdAdvU+u2ChsheWCeM8GM7VL/dubz3cDLr2
 V5Xqz/FC/fFv7HYAkcabE3orbtrIFLz5UzoFow9NhnDs9OlT/5AsiepG9+FuFX/pZRZD
 aOR8FhuevTHYxOFLFnb7JK5jJI8xrbyyfeS1WQcebLLGv+ZfDw7S2NkX708UKzGk9fN6
 M/aDvN0XYFHWOrDiWDtsoYF/x6u6mUF/ej6j93A2TNWWb6qt4OUim0WGXa3k/g5cgm9V
 WQwg==
X-Gm-Message-State: ABy/qLZgRcYxvsuvboEC4QZSxyzVzuFHRpvTJmL9J113GgdYBKPOGEa3
 7Gvaw5+iVmzvFudYO5kJgisXoQ==
X-Received: by 2002:a5d:68c2:0:b0:314:336e:d4d8 with SMTP id
 p2-20020a5d68c2000000b00314336ed4d8mr3408480wrw.8.1688378756583; 
 Mon, 03 Jul 2023 03:05:56 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
Subject: [PATCH v4 33/37] target/riscv: Use aesdec_ISB_ISR_IMC_AK
Date: Mon,  3 Jul 2023 12:05:16 +0200
Message-Id: <20230703100520.68224-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: G2TAa4P+afVD

This implements the AES64DSM instruction.  This was the last use
of aes64_operation and its support macros, so remove them all.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/crypto_helper.c | 101 ++++-------------------------------
 1 file changed, 10 insertions(+), 91 deletions(-)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index c036fe8632..99d85a6188 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -104,98 +104,8 @@ target_ulong HELPER(aes32dsi)(target_ulong rs1, target_ulong rs2,
     return aes32_operation(shamt, rs1, rs2, false, false);
 }
 
-#define BY(X, I) ((X >> (8 * I)) & 0xFF)
-
-#define AES_SHIFROWS_LO(RS1, RS2) ( \
-    (((RS1 >> 24) & 0xFF) << 56) | (((RS2 >> 48) & 0xFF) << 48) | \
-    (((RS2 >> 8) & 0xFF) << 40) | (((RS1 >> 32) & 0xFF) << 32) | \
-    (((RS2 >> 56) & 0xFF) << 24) | (((RS2 >> 16) & 0xFF) << 16) | \
-    (((RS1 >> 40) & 0xFF) << 8) | (((RS1 >> 0) & 0xFF) << 0))
-
-#define AES_INVSHIFROWS_LO(RS1, RS2) ( \
-    (((RS2 >> 24) & 0xFF) << 56) | (((RS2 >> 48) & 0xFF) << 48) | \
-    (((RS1 >> 8) & 0xFF) << 40) | (((RS1 >> 32) & 0xFF) << 32) | \
-    (((RS1 >> 56) & 0xFF) << 24) | (((RS2 >> 16) & 0xFF) << 16) | \
-    (((RS2 >> 40) & 0xFF) << 8) | (((RS1 >> 0) & 0xFF) << 0))
-
-#define AES_MIXBYTE(COL, B0, B1, B2, B3) ( \
-    BY(COL, B3) ^ BY(COL, B2) ^ AES_GFMUL(BY(COL, B1), 3) ^ \
-    AES_GFMUL(BY(COL, B0), 2))
-
-#define AES_MIXCOLUMN(COL) ( \
-    AES_MIXBYTE(COL, 3, 0, 1, 2) << 24 | \
-    AES_MIXBYTE(COL, 2, 3, 0, 1) << 16 | \
-    AES_MIXBYTE(COL, 1, 2, 3, 0) << 8 | AES_MIXBYTE(COL, 0, 1, 2, 3) << 0)
-
-#define AES_INVMIXBYTE(COL, B0, B1, B2, B3) ( \
-    AES_GFMUL(BY(COL, B3), 0x9) ^ AES_GFMUL(BY(COL, B2), 0xd) ^ \
-    AES_GFMUL(BY(COL, B1), 0xb) ^ AES_GFMUL(BY(COL, B0), 0xe))
-
-#define AES_INVMIXCOLUMN(COL) ( \
-    AES_INVMIXBYTE(COL, 3, 0, 1, 2) << 24 | \
-    AES_INVMIXBYTE(COL, 2, 3, 0, 1) << 16 | \
-    AES_INVMIXBYTE(COL, 1, 2, 3, 0) << 8 | \
-    AES_INVMIXBYTE(COL, 0, 1, 2, 3) << 0)
-
 static const AESState aes_zero = { };
 
-static inline target_ulong aes64_operation(target_ulong rs1, target_ulong rs2,
-                                           bool enc, bool mix)
-{
-    uint64_t RS1 = rs1;
-    uint64_t RS2 = rs2;
-    uint64_t result;
-    uint64_t temp;
-    uint32_t col_0;
-    uint32_t col_1;
-
-    if (enc) {
-        temp = AES_SHIFROWS_LO(RS1, RS2);
-        temp = (((uint64_t)AES_sbox[(temp >> 0) & 0xFF] << 0) |
-                ((uint64_t)AES_sbox[(temp >> 8) & 0xFF] << 8) |
-                ((uint64_t)AES_sbox[(temp >> 16) & 0xFF] << 16) |
-                ((uint64_t)AES_sbox[(temp >> 24) & 0xFF] << 24) |
-                ((uint64_t)AES_sbox[(temp >> 32) & 0xFF] << 32) |
-                ((uint64_t)AES_sbox[(temp >> 40) & 0xFF] << 40) |
-                ((uint64_t)AES_sbox[(temp >> 48) & 0xFF] << 48) |
-                ((uint64_t)AES_sbox[(temp >> 56) & 0xFF] << 56));
-        if (mix) {
-            col_0 = temp & 0xFFFFFFFF;
-            col_1 = temp >> 32;
-
-            col_0 = AES_MIXCOLUMN(col_0);
-            col_1 = AES_MIXCOLUMN(col_1);
-
-            result = ((uint64_t)col_1 << 32) | col_0;
-        } else {
-            result = temp;
-        }
-    } else {
-        temp = AES_INVSHIFROWS_LO(RS1, RS2);
-        temp = (((uint64_t)AES_isbox[(temp >> 0) & 0xFF] << 0) |
-                ((uint64_t)AES_isbox[(temp >> 8) & 0xFF] << 8) |
-                ((uint64_t)AES_isbox[(temp >> 16) & 0xFF] << 16) |
-                ((uint64_t)AES_isbox[(temp >> 24) & 0xFF] << 24) |
-                ((uint64_t)AES_isbox[(temp >> 32) & 0xFF] << 32) |
-                ((uint64_t)AES_isbox[(temp >> 40) & 0xFF] << 40) |
-                ((uint64_t)AES_isbox[(temp >> 48) & 0xFF] << 48) |
-                ((uint64_t)AES_isbox[(temp >> 56) & 0xFF] << 56));
-        if (mix) {
-            col_0 = temp & 0xFFFFFFFF;
-            col_1 = temp >> 32;
-
-            col_0 = AES_INVMIXCOLUMN(col_0);
-            col_1 = AES_INVMIXCOLUMN(col_1);
-
-            result = ((uint64_t)col_1 << 32) | col_0;
-        } else {
-            result = temp;
-        }
-    }
-
-    return result;
-}
-
 target_ulong HELPER(aes64esm)(target_ulong rs1, target_ulong rs2)
 {
     AESState t;
@@ -228,7 +138,16 @@ target_ulong HELPER(aes64ds)(target_ulong rs1, target_ulong rs2)
 
 target_ulong HELPER(aes64dsm)(target_ulong rs1, target_ulong rs2)
 {
-    return aes64_operation(rs1, rs2, false, true);
+    AESState t, z = { };
+
+    /*
+     * This instruction does not include a round key,
+     * so supply a zero to our primitive.
+     */
+    t.d[HOST_BIG_ENDIAN] = rs1;
+    t.d[!HOST_BIG_ENDIAN] = rs2;
+    aesdec_ISB_ISR_IMC_AK(&t, &t, &z, false);
+    return t.d[HOST_BIG_ENDIAN];
 }
 
 target_ulong HELPER(aes64ks2)(target_ulong rs1, target_ulong rs2)
-- 
2.34.1

