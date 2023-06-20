Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp200811ejt;
        Tue, 20 Jun 2023 04:13:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4HhUZGDz+E8wLPLmxsWdYMg0rL2s4nw+l7QRsoaUvPhAGQB/3gpDmGlTiYCGXjpyvaLG23
X-Received: by 2002:ad4:5ae6:0:b0:5d8:eac2:3b54 with SMTP id c6-20020ad45ae6000000b005d8eac23b54mr22269548qvh.16.1687259619239;
        Tue, 20 Jun 2023 04:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687259619; cv=none;
        d=google.com; s=arc-20160816;
        b=mGtfaETx+CPPJHPP47XGdCnTVlsprX5CdRxpPPsvOg3nPELv2+CoD+a4LbyUbgh/zi
         9jEpnLwt6PYdVMUvuaiWLkPkYqHWDqSHZHDybJe7WvbfcMeO4BCBEGQUgIta0gZyIqMo
         9rC/fFA7+wUV0qvR1Lh40XgZ0PBalVeYNHGHxgJ/mFc+XHxSo4aIEdxqY3DqSnIQjJIn
         EGt+S0h6Ct9FxuNWtmz1hKdgnF5JFcwTxi2AQHqhdKwGCne953M0gSfqBsLREQ3KHzOe
         UYNoug4JzF6n9VeJjNlJHRMceP/BK7jJf8K36DHtuEGH3ZkYS1ftJbTQRnUOXPtfWg+i
         n+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=M7z3XVBK0XuXSTZ82FoV8jlvhCwFhDqWNnV/JcekGnU=;
        b=iDKgRa08883NXxK/nnIqm20WMxRaopYpD3HXjkeEs2VKe/wWY+k/ubuAHwjy34aQcm
         KrzPq9Jt+FSN2tocePazPZqSdqPGjzzPjjV4molmA2Hvc1qQakv8ND7N1CFoL7v3DTQe
         7eq/0Q0+EYhTX3H6TCZweGbp2fQO/qSJouOxk0+gmLI8IVACQqqB9YLyIi5q475jYr8P
         79qMcY+ikMcCGZQoODI/jZnIZ5Zw3EaglJLTAovXmsbrXbTyhfC/bf7xiQ20swuY4cuG
         1BXBkJ1+ggsqf3oNehwbj93EISFvuKn4lhuJY60QYXDrBHAfToF85/cJT/BTk3NukmUg
         TLjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UNvDFUOc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1-20020a056214194100b0062fee835fcdsi742402qvk.138.2023.06.20.04.13.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 04:13:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UNvDFUOc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBZEA-0006l3-1d; Tue, 20 Jun 2023 07:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZE2-0006Zk-DQ
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 07:08:42 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDy-0004UT-UL
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 07:08:42 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9889952ed18so348523266b.3
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 04:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259317; x=1689851317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M7z3XVBK0XuXSTZ82FoV8jlvhCwFhDqWNnV/JcekGnU=;
 b=UNvDFUOcZlKZJCNu9yftaPk4hl/pSvMxYuK8Ew0rbAwGgMztrwd8lq9kM47qR2VX5a
 4olD845dc0K7z9v8oh7FzxeWLVVSit4C2v4fg6vxnHDeeNBS6T3JyL0v9LDaXdxijEJr
 p5XpqlOLAjEhh6XoPENCXGXiO3AFmgBBZWTfQjEOFK7qRDtlF6R5f8hhyYn7lSpf9gmf
 rn2fYUJ3f/dzCExrxF6xkjI/dQMtT2EP9B97gQ47901N1TlPgbeNduC+33mAO4HDg4/6
 pyHcC88rVL8bvKjtQPJetMZZDUQR52OeRtFNIbuUtSUFvK75AW0BZEWnU8E1wnfrtinn
 soWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259317; x=1689851317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M7z3XVBK0XuXSTZ82FoV8jlvhCwFhDqWNnV/JcekGnU=;
 b=S/2ach+sKKvu+bwbtVlcT2BrhEAgN57c0wFpSLSUajKU3fzTV1mg71iM/r+BFrM//t
 RS8QqcWyCDLb19d6vNsLcNrR6iy0Zqxt5EY0K2dPfUXaCPJf9PPDehNsy8Nz4yz314Jc
 4qDwfVgCOv45jidkRoBPnpnsj1O5z28IZNBFGjdHQfVWD/Ii1dnZTvEx0w0XQTe5j+wd
 aRB/cASrxF4PYR1YUBnyxCeGGheOuOe+XNTzin6FcWjdmALr/AIAETQC3pCs3DpURshL
 zO0bU/DUueP6QQXxGK/nd8rFf2wsz7v9ALvwqHT29R/fYDYEKNA0zrrXLbcdlmgUtqmL
 CNEQ==
X-Gm-Message-State: AC+VfDyTkI5WQLOwcSV0H9JytZQj7YnGZnDinmf1Zs4HFmCWtS/5GGsC
 AWRmHmWJPgFjWG+wsAkTn40+Xw==
X-Received: by 2002:a17:906:a402:b0:977:eed1:4510 with SMTP id
 l2-20020a170906a40200b00977eed14510mr9021441ejz.21.1687259317625; 
 Tue, 20 Jun 2023 04:08:37 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 28/37] target/riscv: Use aesdec_ISB_ISR_IMC_AK
Date: Tue, 20 Jun 2023 13:07:49 +0200
Message-Id: <20230620110758.787479-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62c.google.com
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
X-TUID: JnhWGJKvBXvF

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

