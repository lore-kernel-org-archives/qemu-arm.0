Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp104562ejb;
        Thu, 8 Jun 2023 19:29:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4oQyu+bcz1XRV7l1k2e8kySVosc+qQtfz2oGq97QGq9s+i7ZmTd8Y110j+JrcHCEWuHKF3
X-Received: by 2002:ad4:5aee:0:b0:5f0:23be:a302 with SMTP id c14-20020ad45aee000000b005f023bea302mr398992qvh.9.1686277740225;
        Thu, 08 Jun 2023 19:29:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686277740; cv=none;
        d=google.com; s=arc-20160816;
        b=JrZZ7QlgFXDFMiR83cPEIwrtEFoqp291RfA7Be/rE/XWqOPS3MRbQZwj2c+YySClkW
         sIlsQQhpA6E1Jl8A3KNlUVNLeXpGKlHRzvtJjBD+sfxaOw1D+LYTY62HJ04YU8FAnflz
         +CN/ajAnNSNHtmzY4XZmi7mb0RZeDLZ+4AxvIXOVP0Es411J5JaydPRyCnKE6n+TiA76
         GHdU4COse8X5fFJO5tV7RAlZuaonShGEhtc/mk9M333XUZowY6YE8QVbntTm/aGekN40
         z4Xdiuy0VivK6Jdlkijc3VkIC3xqdVshy3XN6elh435cO9l4vdgw2Zalrriq1rnpNY09
         1Azg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=M7z3XVBK0XuXSTZ82FoV8jlvhCwFhDqWNnV/JcekGnU=;
        b=IE7kivX2pqKzWPs7+Sq0qS4Kg9az5ghia6nxPwIm8NGaqPpnYvGnyanQzuO4WjGsoh
         3/oFxX2V6T9VcYg2XaAAPFKh0Az/LwgWoYnHznc/T2ndxM0IgmUXM1pM4QUAf1k2MdlI
         2TOGb/UMbpSeIQ5R4t0OHhUMSLfQDGrIzkJjoWHsYwLSzbiC6N+u0yqbCo6JuTjwsYFf
         AzLES4LkprOOHrxZ0vrDx3CY3zAGau2WeOB3X/gcRZlUesrZJKbFJ4vWY/TTpKVKoktH
         0d4enB3a+trAlQVJY0Io8m8W3NEE5iOBEYEpy+oZPEblBgHHDPKmFF18h/A02EpfsSZc
         s8jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pg9oC4ej;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gh7-20020a05621429c700b00620eefa49ffsi1613867qvb.259.2023.06.08.19.29.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 19:29:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pg9oC4ej;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q7RpG-00067j-GM; Thu, 08 Jun 2023 22:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RoX-0003KO-SL
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 22:25:21 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rni-0005lv-Ry
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 22:25:20 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6b162127472so265419a34.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jun 2023 19:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277470; x=1688869470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M7z3XVBK0XuXSTZ82FoV8jlvhCwFhDqWNnV/JcekGnU=;
 b=pg9oC4ejbcrUyF5e4ng7CKkqEJ6M6M+hgDi0GZqBy8nB7qhwykPY0Hihw4KPNEq2iN
 NEe/kgwzK8WGnw3NkuxaDu+npkwsI0Wi0HRHE6rwv7nsjcs8qzBucbqOXDDizltotvRm
 YO9S7R+B3dtHqmH+vWqYoRChWrjJmPwqrBh4aKwQfRztlvmz4KMFmHwFzhf4iVkj76Uo
 96kt6ChZqMRIWt0xmQ7ub4rkZxIlUPxIq2Yh+UEqQ6HmlDwUBROnD2jMVDjWHiVUA4oj
 Gf66R8zgyiFN1QLQ2GFBU8lK/JV71/gLa7kXLxSH6Ex4mgQMhW4MJ4Ojru6kiL7PbMWn
 nZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277470; x=1688869470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M7z3XVBK0XuXSTZ82FoV8jlvhCwFhDqWNnV/JcekGnU=;
 b=HHT5LeTX71PhKAfJFbu1OE5kXIM7VcDYR/WIL8OZDm37EdluzN1igeHW7O4GES8Uls
 +/IGxaPcpFHFX0abFZNExwudjEh90kQIaU2Bj9GSm6HajEHQL8uX874zf+3UYkLZwUQ8
 K835N4p6luVxsoKE/EBDV6jZPqWlQJgBptYSsSmRESOw2k7G4ebCxNFjignAmmiN04rp
 fXP2yyjN6rONVAERf3EhVgrcTCKxRlihksa4ty224FYgrNaEeqx9Ism7Y8ZvlaGyIh2N
 vsehjBuhLNE6Bchlar1Wuqk9DofYamzI3P5MlS+NZfYaUXVIPR0PRkFyJKbhwahI4btu
 fJcw==
X-Gm-Message-State: AC+VfDzHWz5TsI2LqaPRMDaYZC0gozxCrDhRQc8/mVpTcVAlEiMqXoGa
 pfzBsh5FTHoh95ZpqJJdzlQPqK/c0+0IKvCC/5U=
X-Received: by 2002:a9d:6299:0:b0:6b2:b82c:1418 with SMTP id
 x25-20020a9d6299000000b006b2b82c1418mr184550otk.9.1686277469820; 
 Thu, 08 Jun 2023 19:24:29 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 29/38] target/riscv: Use aesdec_ISB_ISR_IMC_AK
Date: Thu,  8 Jun 2023 19:23:52 -0700
Message-Id: <20230609022401.684157-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: zUGCoRWFGC6B

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

