Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp584798njc;
        Mon, 24 Jun 2024 22:09:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTQ9AmCBBtbmKUKxGB7GVcgE7iIqPw2NHKIhBIcchI6VGpK3V+qzGWktNTqjt05sStkUQU+TFGFfDYaq53Eu3eqg1X0Wmi
X-Google-Smtp-Source: AGHT+IEWfg/hKHFvkx+85Lrw2TIInxwE0L6ZV31L9hHo6rwum6lwT4uzBUN16N2pvlkG8AKTQVhq
X-Received: by 2002:a05:620a:3188:b0:799:7587:d1be with SMTP id af79cd13be357-79be47a5308mr834042785a.54.1719292141639;
        Mon, 24 Jun 2024 22:09:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719292141; cv=none;
        d=google.com; s=arc-20160816;
        b=c+iAkldY1qLX2/7OpzXtQLPqbTN8xKv/FHBcybdiIYbDAAKiEn2qAgWF1lRO9vZmGg
         goqzDkIZ3ebbC9xVgL8HleMqKZKRmbxjO8rZvENmkculA1cChxuMfmb8TstmdOCDHFkm
         vy+26yHMz2RE03o4NvzOlG8SbWIVh82j4Aj0pCsMNu6pFNt6NZeWwfhFuxa0tZbnzQPe
         IpMv3vpZzcRpbYf6khyaBhp3KRCs8u3bfH0QC0i1cF22CT2fK8SdcBwckl5CCjsep3Au
         dAwTLJCVB5ZkbyHiA1QNb4/WT14TtOQYNNW3WhXjXg92R2Dv5lN3ynMG41xDMDAsZ85o
         lSig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eCY0RuPqHu5iM13PrDmlYJVrVT2SB405qXFZ6R1XSxw=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=cFPJUTveqn0uf2WwxVSjA5Udrw+XvIovAIPg1sDRvmqadxFoZHt/MhI/R2DhjICGzf
         W+2kJD25tcGHo0RiacygBKkua7VOUxzF7FnrcLJ10DH7fqZzo0dIRMyfBTvOKAK72zGI
         PomhxUBHmxruWMAWj02q9tZ+FZJXdW/ErBVR8GGiXuf2bLc9bnKjXi+YNaNINcYZjk9m
         sH4aGFTEwGuCJyLYNWLM4NY4zeKXNByIWfsS438J5uaN4oBHw0586Xd8/obNROPJKEwW
         G2wj9R0KnIbrNd6VawiJ9T8yVt6Vc4rpz36GIWUrVkeJquoDVYAzR8tPj3cqG9nsBRGh
         CQvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OGw7Sqyq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bd39a1afbsi901346585a.764.2024.06.24.22.09.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 22:09:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OGw7Sqyq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sLyPs-00019B-QN; Tue, 25 Jun 2024 01:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sLyPq-00016s-Ub
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 01:08:26 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sLyPo-0001Y1-0P
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 01:08:26 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1f44b45d6abso39664525ad.0
 for <qemu-arm@nongnu.org>; Mon, 24 Jun 2024 22:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719292101; x=1719896901; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eCY0RuPqHu5iM13PrDmlYJVrVT2SB405qXFZ6R1XSxw=;
 b=OGw7SqyqP58h/6yQ1GL/wnUuKwe42/j/s+AdWGXVsc9kSbgD71TC3JneDog+Z4dJtT
 L9CoutR+KYeyPFzetyBdoYFIbI9yWt9zjiNKEV55xwu3mbD3guuIcTOSZusCCfw5YedA
 ImofbPoePNTUqNNFx+7smvLONAx9v6iqXAPOFSjlrNcsts7iDwcziLCQG9XGbUI7pEje
 4LRlTSVDPl9NJ3AR1lDLf9eX9epAmC5H/BfpATDCkeyhBPZp1T+y8rCyk6tN7twE+CjH
 AISjsJwRAw7UL1SApgJ1M6SDW9LwkuZlxYQ+lQJbqjMpx+ftfDmpw86AgTOHGNfe5HAC
 QkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719292101; x=1719896901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eCY0RuPqHu5iM13PrDmlYJVrVT2SB405qXFZ6R1XSxw=;
 b=VCRjEUxhwFx6PiGKRuhPx0kmPtYdFLxzNuWPKncFXkfREl/ePho6cCLntkYLPLplY7
 uVfdTwO8GmULBR4QIFzsYhiD+Lu50FRjmiSwbfUygzeb4sTN368f5wU4lOyJc3Fmd0KI
 53zL6dC65ALqUwCbyZiS7QkCMX0rk94LhlHqZhrHJHv1AwAU3DK1UB/Ah9Vl8RiXPdi4
 DKmlUFLGdXOB2cQ9l102Jd0y8+38DdKBoOQd9OQAY2Z+Fd5eMqjtDaSVjEQEXQlvXGL7
 RiYwWTBxMaYk9TONbjcuumDGhsSH01IMsGzD1MVJoIgYaNbMejFCWOY5FwFfSAzLypNi
 Z32Q==
X-Gm-Message-State: AOJu0YyEFmRMYKFXIejRhcrelTUbx0BBLRreiAFr1yjreG5wPbjK/9QH
 D1puvN19pu2KhD293NH3v2s/uVBE6i5zdzNn757c5jRPm2HfaKOhAUqqhkkN8s4O32qmpCUFsEP
 Y
X-Received: by 2002:a17:902:d50b:b0:1f8:67e4:3979 with SMTP id
 d9443c01a7336-1fa1d6533bcmr90624085ad.47.1719292101326; 
 Mon, 24 Jun 2024 22:08:21 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9ebbc72e9sm70843865ad.296.2024.06.24.22.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 22:08:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/13] target/arm: Convert BFMMLA, SMMLA, UMMLA,
 USMMLA to decodetree
Date: Mon, 24 Jun 2024 22:08:06 -0700
Message-Id: <20240625050810.1475643-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625050810.1475643-1-richard.henderson@linaro.org>
References: <20240625050810.1475643-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
X-TUID: 3RmVGf7PG+Wb

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  4 ++++
 target/arm/tcg/translate-a64.c | 36 ++++++++--------------------------
 2 files changed, 12 insertions(+), 28 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 15344a73de..b2c7e36969 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -952,6 +952,10 @@ UDOT_v          0.10 1110 100 ..... 10010 1 ..... ..... @qrrr_s
 USDOT_v         0.00 1110 100 ..... 10011 1 ..... ..... @qrrr_s
 BFDOT_v         0.10 1110 010 ..... 11111 1 ..... ..... @qrrr_s
 BFMLAL_v        0.10 1110 110 ..... 11111 1 ..... ..... @qrrr_h
+BFMMLA          0110 1110 010 ..... 11101 1 ..... ..... @rrr_q1e0
+SMMLA           0100 1110 100 ..... 10100 1 ..... ..... @rrr_q1e0
+UMMLA           0110 1110 100 ..... 10100 1 ..... ..... @rrr_q1e0
+USMMLA          0100 1110 100 ..... 10101 1 ..... ..... @rrr_q1e0
 
 ### Advanced SIMD scalar x indexed element
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 95be862dde..2697c4b305 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5605,6 +5605,10 @@ TRANS_FEAT(SDOT_v, aa64_dp, do_dot_vector, a, gen_helper_gvec_sdot_b)
 TRANS_FEAT(UDOT_v, aa64_dp, do_dot_vector, a, gen_helper_gvec_udot_b)
 TRANS_FEAT(USDOT_v, aa64_i8mm, do_dot_vector, a, gen_helper_gvec_usdot_b)
 TRANS_FEAT(BFDOT_v, aa64_bf16, do_dot_vector, a, gen_helper_gvec_bfdot)
+TRANS_FEAT(BFMMLA, aa64_bf16, do_dot_vector, a, gen_helper_gvec_bfmmla)
+TRANS_FEAT(SMMLA, aa64_i8mm, do_dot_vector, a, gen_helper_gvec_smmla_b)
+TRANS_FEAT(UMMLA, aa64_i8mm, do_dot_vector, a, gen_helper_gvec_ummla_b)
+TRANS_FEAT(USMMLA, aa64_i8mm, do_dot_vector, a, gen_helper_gvec_usmmla_b)
 
 static bool trans_BFMLAL_v(DisasContext *s, arg_qrrr_e *a)
 {
@@ -10949,15 +10953,6 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
     int rot;
 
     switch (u * 16 + opcode) {
-    case 0x04: /* SMMLA */
-    case 0x14: /* UMMLA */
-    case 0x05: /* USMMLA */
-        if (!is_q || size != MO_32) {
-            unallocated_encoding(s);
-            return;
-        }
-        feature = dc_isar_feature(aa64_i8mm, s);
-        break;
     case 0x18: /* FCMLA, #0 */
     case 0x19: /* FCMLA, #90 */
     case 0x1a: /* FCMLA, #180 */
@@ -10972,19 +10967,16 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         feature = dc_isar_feature(aa64_fcma, s);
         break;
-    case 0x1d: /* BFMMLA */
-        if (size != MO_16 || !is_q) {
-            unallocated_encoding(s);
-            return;
-        }
-        feature = dc_isar_feature(aa64_bf16, s);
-        break;
     default:
     case 0x02: /* SDOT (vector) */
     case 0x03: /* USDOT */
+    case 0x04: /* SMMLA */
+    case 0x05: /* USMMLA */
     case 0x10: /* SQRDMLAH (vector) */
     case 0x11: /* SQRDMLSH (vector) */
     case 0x12: /* UDOT (vector) */
+    case 0x14: /* UMMLA */
+    case 0x1d: /* BFMMLA */
     case 0x1f: /* BFDOT / BFMLAL */
         unallocated_encoding(s);
         return;
@@ -10998,15 +10990,6 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x04: /* SMMLA, UMMLA */
-        gen_gvec_op4_ool(s, 1, rd, rn, rm, rd, 0,
-                         u ? gen_helper_gvec_ummla_b
-                         : gen_helper_gvec_smmla_b);
-        return;
-    case 0x05: /* USMMLA */
-        gen_gvec_op4_ool(s, 1, rd, rn, rm, rd, 0, gen_helper_gvec_usmmla_b);
-        return;
-
     case 0x8: /* FCMLA, #0 */
     case 0x9: /* FCMLA, #90 */
     case 0xa: /* FCMLA, #180 */
@@ -11051,9 +11034,6 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         return;
 
-    case 0xd: /* BFMMLA */
-        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0, gen_helper_gvec_bfmmla);
-        return;
     default:
         g_assert_not_reached();
     }
-- 
2.34.1

