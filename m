Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp750619njc;
        Tue, 25 Jun 2024 11:44:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV1VPfcNof8FYHbsbsCJPLFvuBZhvSjbetTxGD9gHo8++0SNMYqULc6L33SGiVWracSJdTQpCWfO+2WBDh5gloyywVS5g7j
X-Google-Smtp-Source: AGHT+IGqwLz7JwCbmLhPydEFg58goLE1Joi10cgDpCT6OB3fqCg+Cx+Lh0CIOjs/kcB8A4NH25WU
X-Received: by 2002:a05:6214:4209:b0:6b2:ccb5:8b7b with SMTP id 6a1803df08f44-6b563808bacmr62169426d6.31.1719341056159;
        Tue, 25 Jun 2024 11:44:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719341056; cv=none;
        d=google.com; s=arc-20160816;
        b=OlfMQp592WCAgKw8EjHJgVs1weZ+VE+OSqHuThwvashtECyvQ81RSq5WbKi3RKU6l4
         TS+7wE1FxBmU9yDAcPtivpmxKUmmyOG9/U0WHtzOdiGCsNCHQwTJAltwpp59fzeqDkjX
         ScA45TJreV68QDXuY2vyVTzFQDF64RxLPPmqVPA12BKLCP8T3Pr337+82vhpaFvR2Ygc
         QeCfusca+lnPX8WL4egJDU99Gp4y7L1kZdcP8r8ZvgDgESCt+ctB7q1Uhd0OrSgoPLVJ
         6Y8m35Qu2vD3WM+X9FH/DMYRxFMYV95LoQYOv9s8QWe6fwtToZwAnBMPOSmcadUz0snU
         7zCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8IpGOhTtGrG6tQBTmNEOspGt85++snfZsV2Uj44z4n0=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=GXl0KLdvk3lkUhlKwNhDtHiItNflhXQTV2yzuQU57V0gG3ye7uD+i98fUzw9thpEY+
         OG84/gaQE7PZH4Q6FMFr6SDLOybWOI8tvcgmyuT2uJXEYOSeN7LJ7yXpTp7dszMkRc4x
         PtOQxtLd0cR9QID8LdBV995w/9HyVG8l6yDv6mGV5+q83qg2yPWxlXQU9YvSF37Ifnf2
         NUMESjmRG9GohV5SD3WEdmmv3IGqPl7JS4wUSPvF7TNJJ3VIwTWLxpiWzvPT6/X77bEW
         /pEYuY8zjwsa2dQ6P/kAP9+W4Ibp2GA+TqctFXG2nr2ScNfKWMUCQqzISZEUASCP6RqL
         fOig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K+AVRIoN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51edbbb39si115454366d6.285.2024.06.25.11.44.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 11:44:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K+AVRIoN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMB6S-0001Tf-CW; Tue, 25 Jun 2024 14:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMB3Y-0000qi-24
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 14:38:20 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMB2n-00066v-SI
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 14:38:06 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1f9bf484d9fso36561025ad.1
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 11:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719340546; x=1719945346; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8IpGOhTtGrG6tQBTmNEOspGt85++snfZsV2Uj44z4n0=;
 b=K+AVRIoNyjA+CPwmqT+pYYBEXmpOJ4hZHVSZ8cyGbVp1K+2lecg8w125ddC26l3Oax
 EQaGJZjU04CHuL4iMzHRWf9Dpr28Vf7iAtxB6t/erKE2xOku4vngW8qiTfoAXXw23+eR
 1m/D5wbcZsl5b0pqzNi1QLXM94PNqRA2TPzAFvZgSxBi95xBJJv5Vg6y3cZ5Ii64qDd+
 xThEhHcNuCam9aALogQULIBBM/IOWprHNPkkkTrs6KrJKuZP/JyjNc7Bm5W3LH1ai0z9
 uSySDJO/8WGpd0ADgSOgNF+EmIzOc2ec8NvIepveJa9IZYh8urDnavc3w/HUBNzZc/xe
 2+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719340546; x=1719945346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8IpGOhTtGrG6tQBTmNEOspGt85++snfZsV2Uj44z4n0=;
 b=SU8WOhmKW6BoD6XGNtRPDOfKkTqd92TTENayBmlebHKtvpeB7JYvxM5Lei7s46dVKg
 VPd6QkL2FDON6vzZGoDj3WEZ/e4RD33dnntQhGRmtUpDF6V3q6VDAnr0/jAywBDXAqRC
 VfpXctBNRzjrA/HLpSwZg3fW8Sk+AR99Tz3aQ87jSmWKlogrnXQvrNzXcrj6cJXanmIv
 HpNGdce3cXSsjpt5ZOWtaWVcpUAujWtW7pA7CcSArnXNOi63X1307KF/N2peqkDD7eWa
 qtJlW17a+SnxyA/CiTVautJcJ/qPtsALA5++gkBOe1gyhx/le/QvDvyTrni3XvwFnghM
 oyeg==
X-Gm-Message-State: AOJu0YyRNbSaiocIELBXIzryBB34KG/UbnlBooFGkzLcnLxVN0WUfkgP
 Y7f8kRoWQdEKUlXepXILouqEf/I4TAB6+Q1OYdfBQbV1/S/6/MPj9DmWByScyl8=
X-Received: by 2002:a17:902:f548:b0:1f9:d577:f532 with SMTP id
 d9443c01a7336-1fa0fb4980bmr131469875ad.28.1719340546064; 
 Tue, 25 Jun 2024 11:35:46 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3c6027sm84693235ad.133.2024.06.25.11.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 11:35:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 09/13] target/arm: Convert BFMMLA, SMMLA, UMMLA,
 USMMLA to decodetree
Date: Tue, 25 Jun 2024 11:35:32 -0700
Message-Id: <20240625183536.1672454-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625183536.1672454-1-richard.henderson@linaro.org>
References: <20240625183536.1672454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
X-TUID: Bpy8Ci6oVqtx

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

