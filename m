Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1271289ejc;
        Sun, 5 May 2024 18:09:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU5KK2dsi/L+/WQQ8UhqswGhoMMYPr0NDMB+rqxq3IP587OtYQPJ2DI3fgNdhrsSNP/D1MsDUsyCejLvN25Wk8bYPlVvTvB
X-Google-Smtp-Source: AGHT+IE/0+XiuplHyGaMjf9Y6X1/Hu7Zeemf0HAFf+u7oIBR2D3fVG0lahzyq3QkzpdMrhauywyg
X-Received: by 2002:a05:620a:b1a:b0:792:951d:c688 with SMTP id t26-20020a05620a0b1a00b00792951dc688mr2833876qkg.24.1714957789246;
        Sun, 05 May 2024 18:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714957789; cv=none;
        d=google.com; s=arc-20160816;
        b=LgsMnhBOJEFAmPDFUO9oZqkcL0aw783tKNZJmVSE6GFChzZ4y+YI4FaA8gY3n0HwiW
         D42DD1xwwy9VNa6vAbQypjQ9mF+JNe+3LNWFIZpMESdqC0VN/hRMRMtMd1mSG9t8eNnv
         3K6OGm5r7EugDl8ZkadAo9pyPiWcqGVaFQNmEF/YlzH9f2a0zinCJTcvHjcNVVr2tfAT
         FTwyvPmth8Am1lOJSIODvy7FIOX0+Vl4CFHcgLlKmyJIm8MSeOyr2x1FNjwPiWHNjyfn
         pU01AWBcQiFPhdqIwWdlL7RqYifFkAH3DFoGW+TLScEb76BFEMx76mvWD8HJE1x55+6y
         hi5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=W6klc6IkoJ7yIvXMWyMfy0cu8G2GrfjYUKzGDkQ2bDI=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=FwhKqu9OnhFDc2VkTiohOwcJqq2YExd4LsP+FxYU21Uq8pJMNwpyL+xsCr+9fOQZHz
         PoTexEoQ5IpP8vv1sqS5FBclaP75XSm/+1Q13YbjR2+bKG4Y9X0Mon7HKzMxc/hGOPyt
         s6zZ6pZvak9GdQyJ3/zqbmQi8HtsvU+/3NjIiDKU4ICVzgF0SyrKuy2QbpKhJ9POGv7U
         iReelSpL6useTN6DKbG8fn9TfsttDv/YHAYiWYG5oCJ0d8DX8C1xFOfN0+kXTgtmd5gf
         JPxTQ7O64FrnqFzmqgSjFohz5DhG/aAQZdC13LYR5uUexEycprEOBzOLINBxrBS8akeT
         n2gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xs+qI6c5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id xz18-20020a05620a5e1200b00792908d87bcsi3262112qkn.284.2024.05.05.18.09.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:09:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xs+qI6c5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3mqT-0002Zb-4c; Sun, 05 May 2024 21:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mps-0008BQ-LU
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:08:12 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mpY-0003Mv-VF
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:07:57 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6f065bc237aso124330a34.0
 for <qemu-arm@nongnu.org>; Sun, 05 May 2024 18:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957666; x=1715562466; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W6klc6IkoJ7yIvXMWyMfy0cu8G2GrfjYUKzGDkQ2bDI=;
 b=Xs+qI6c5JfNSmxnzw4VGTdawuVoV8VwYf7leHwHlm/Ptu9IBMBYpYQyLWTxmuIJqVN
 RUuNTwnJnG41iDAB+OEOTwfMwmL9o5L7g0fpfGve4Cbl2or536wLW/44wCYKU+ssv1a1
 JJJgnKk4zXiGdfWnAM4u/agJ1daVckZdI6FfTujbeyMV82BVt4l2tOW9OUM7Vvt/JGq5
 4uEI6m/BPw4wvMcbCpyHD4P6kzBu37X6Jia+XnlOJBYUZkOdlD3uEFQEoL3iLF3E9CNx
 6E8srleJT5PH1uN62ikZyYe6MExcNjAS+FoSc+/A6yuxO+QXhNWArlhzP+Y4rEa1hj7y
 ZzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957666; x=1715562466;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W6klc6IkoJ7yIvXMWyMfy0cu8G2GrfjYUKzGDkQ2bDI=;
 b=Npgfx0qD78HOI6rc+xbxUMtvA6PPW8rgcXRKTNZo1iQi16OIG2YyrjqBgDi4bDRWBw
 /llkCzTbhiophjSuBj4lsLIuAAo/Bk/CQqkChTrzXGQ1i7jQ3opy3/r7I8Sk1WfCHG4F
 otwQrP8NKetT5vzlTnQOiRN4fA1weW3t3dUQ/SBXkK6jDZsx2/Aj40QV0+CHy1KYiTQe
 RHb2WQwzkqQ/0XPopCvY04XRNRtdHzMdKFu4IAQ22bO91ZPwAvwlh+hf0+WotJbpGJwI
 XJumL7xPiG1g14cxlY5BS22xOZAcFtyHtQ54X24mHk1/RnXCdkyszLfW7H3o5EUQUZbw
 oWXQ==
X-Gm-Message-State: AOJu0YzzaI5WiVv6oUfWGxlI/KnZCNwXeJVyZ6zluwYpezkfAeo9sHK4
 kYUbwvEutvP5HcbcPoq/FxBJg5ueURup2IZLl1oxi5pF1//rSWaLBbaVouqqfqulO9RXSDkFFh+
 B
X-Received: by 2002:a05:6870:818f:b0:23b:e418:d967 with SMTP id
 k15-20020a056870818f00b0023be418d967mr10928296oae.12.1714957666383; 
 Sun, 05 May 2024 18:07:46 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 kp4-20020a056a00464400b006e580678dfbsm6577287pfb.193.2024.05.05.18.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:07:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 49/57] target/arm: Convert SHSUB, UHSUB to decodetree
Date: Sun,  5 May 2024 18:03:55 -0700
Message-Id: <20240506010403.6204-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506010403.6204-1-richard.henderson@linaro.org>
References: <20240506010403.6204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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
X-TUID: LTdbTiJ7mU6W

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  2 ++
 target/arm/tcg/translate-a64.c | 11 +++--------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 0881f00ecf..80c4c650c9 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -914,6 +914,8 @@ CMTST_v         0.00 1110 ..1 ..... 10001 1 ..... ..... @qrrr_e
 CMEQ_v          0.10 1110 ..1 ..... 10001 1 ..... ..... @qrrr_e
 SHADD_v         0.00 1110 ..1 ..... 00000 1 ..... ..... @qrrr_e
 UHADD_v         0.10 1110 ..1 ..... 00000 1 ..... ..... @qrrr_e
+SHSUB_v         0.00 1110 ..1 ..... 00100 1 ..... ..... @qrrr_e
+UHSUB_v         0.10 1110 ..1 ..... 00100 1 ..... ..... @qrrr_e
 
 ### Advanced SIMD scalar x indexed element
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 0e28a5abbd..83e2c363e7 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5457,6 +5457,8 @@ TRANS(ADD_v, do_gvec_fn3, a, tcg_gen_gvec_add)
 TRANS(SUB_v, do_gvec_fn3, a, tcg_gen_gvec_sub)
 TRANS(SHADD_v, do_gvec_fn3_no64, a, gen_gvec_shadd)
 TRANS(UHADD_v, do_gvec_fn3_no64, a, gen_gvec_uhadd)
+TRANS(SHSUB_v, do_gvec_fn3_no64, a, gen_gvec_shsub)
+TRANS(UHSUB_v, do_gvec_fn3_no64, a, gen_gvec_uhsub)
 
 static bool do_cmop_v(DisasContext *s, arg_qrrr_e *a, TCGCond cond)
 {
@@ -10917,7 +10919,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
         }
         /* fall through */
     case 0x2: /* SRHADD, URHADD */
-    case 0x4: /* SHSUB, UHSUB */
     case 0xc: /* SMAX, UMAX */
     case 0xd: /* SMIN, UMIN */
     case 0xe: /* SABD, UABD */
@@ -10943,6 +10944,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
 
     case 0x0: /* SHADD, UHADD */
     case 0x01: /* SQADD, UQADD */
+    case 0x04: /* SHSUB, UHSUB */
     case 0x05: /* SQSUB, UQSUB */
     case 0x06: /* CMGT, CMHI */
     case 0x07: /* CMGE, CMHS */
@@ -10961,13 +10963,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x04: /* SHSUB, UHSUB */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_uhsub, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_shsub, size);
-        }
-        return;
     case 0x0c: /* SMAX, UMAX */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umax, size);
-- 
2.34.1

