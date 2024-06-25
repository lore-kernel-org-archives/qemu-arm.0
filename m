Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp750777njc;
        Tue, 25 Jun 2024 11:45:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUHLpT1Q+pbq7bmw2rQrvPSlgV7J+8dITnMjHRPa8T2k03nx+dlUVd2TNJK8eA3TZHZ7v24UV6zKzrjlHaBk8T2gntNbTuP
X-Google-Smtp-Source: AGHT+IFekWhvq9AoyRmOhorX45yOO8brX2Ovx9Msos5s/JcQKxy0OASHeIW4GGPnZFwx/o+kttqb
X-Received: by 2002:a05:620a:2992:b0:795:be0f:8fb1 with SMTP id af79cd13be357-79be70456c4mr992368385a.66.1719341107207;
        Tue, 25 Jun 2024 11:45:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719341107; cv=none;
        d=google.com; s=arc-20160816;
        b=inwJHaeFu6jpWB5ZZ0/gLLd9oG3fo6QVfnbl8VLiRvu5Ef8EC5r3hoy7Pkmzh1QJVs
         bhvcSEsGvBt6QX3wx8CzZZAe0hV1WA3i5RQF6DODXCEkLs+Vsq4slNfGaOs+WaY5G2Cn
         7I+vvCU8jeX+t0PmcYKkYphYgJJgVw5UXTVwizXND8c80IH1B4RqfY/JYO77pfZ+jX2g
         3B6BRdOZJaVJT7Vzhbi4E1JJAI0CV5VvmeKV6pgZiRRMnNPrK+wNCd/LK41QuUX9ljH4
         PEYaqQZSqfp/FR0QmTa2OvoTHOM71iYO+bdfNcLuRvMY+d9uHbGDrCVc0VjXiSCCvJgR
         E/KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CMjhGlcExekQf+5VSLIRvctS+6B2uJGjUo3v3Mg5lsk=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=nstUu8x/uB5uvOsMopRjlyoWBZ1+HRI3wBv/968mBhIeNK1q3gHG7UUgm9dHxVmmxC
         Znu4/z9YQaATtQ1DqOYiv7rBqAalom8Z/wgdwpEFffysh0WEiP4gfwuaX+nzKxRh4crQ
         ja04PZG9bVrVq7Isws+0tgVmdCicJUdxdjcTv+6dcqPMtVdUPNvwGIv6rTpj3is6PmSG
         Z4zCttG7+COEvAVSo/JZS3NA7sEdnlvZK+xg42GeYJWLm9wy7X3dpdvnuSynyEMiePc4
         FT6EVxahavX5axGCAJdYAFLz7zg/T5oaKUXm35DSivIgylNMDx6uvLYnPVSvy3hPmZ0m
         FMMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GUXsQM7F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79c11e556c5si26020085a.89.2024.06.25.11.45.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 11:45:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GUXsQM7F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMB81-0001q9-M7; Tue, 25 Jun 2024 14:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMB3U-0000pQ-Hf
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 14:38:22 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMB2M-00067E-2K
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 14:38:00 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1f9b52ef481so47605165ad.1
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 11:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719340548; x=1719945348; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CMjhGlcExekQf+5VSLIRvctS+6B2uJGjUo3v3Mg5lsk=;
 b=GUXsQM7FLi/PlPAXhJQFk8KdDhGH5DcW365kWB1GJ72Qnk8zMvwj0jLuQZiu+4k80x
 ZrrcfLKwE9nsanpmi/bmOblUKrcWXiYRlSNXPl3BuOjcwaQ6Npaa5xHp9G6alfUsMY6N
 Ouk5Lc36PfXMdKoG3KW9mWYOP2KlZlUKJl93v6P40D5X4t4fdTaCfBPxBkuRhZ1NnkJe
 oQ9ClsAS/SejZBas0KIWZrI0FGl6RNJIoNeU8rscHybA1UdYgvAuWiQc1Wni88efKle0
 mg075ECAhqi38Dd6CuaqH5GgWgBZaRgkhhReHsK+60Iku3rtFM8IaM9iFWMtdpIi/BE+
 aFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719340548; x=1719945348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CMjhGlcExekQf+5VSLIRvctS+6B2uJGjUo3v3Mg5lsk=;
 b=Pd6xF+67tYc+fWr44m6aHl4sr3GvixJpLTXjGtV8DO59CfAZYTkzVyTM5zsUZMGP68
 4sWsVvklrSq+3jSdDsT8LdEUrfUwWugnXG3O8MZp0JsREr5LAi3vcD5qRyacR5diW0HO
 DqWbo9+xC3Rl1lKFW0XCOkIaTszoajiqG0QCZxjX8p5jQDXjTrO54DomebjVEAXfG2z0
 WvEljo+6MDrPXXMSRgzbn7fwqlZXyLbQ8QYm7Ec7JV5QR1bAjun80P71GeqblsoXJa8z
 BDoZ6g4MBfJB+GOIiMBk/83xmm3rv9g0JMYsMp1prz7s2qBXXB6NXgnZyMqzaxm6Mlzy
 rrjw==
X-Gm-Message-State: AOJu0Yy6YdWdF50NFzWbhw4pBFsQ1WLAFqVsTx0iRJv8kIJ4TDYjHjfA
 rX5gRP2Mehgz7KmtRME0bknxNDbQ+2fED0ekQRmyxScxwMLOWFt0NftXqs5+ILc72EybKmjBLhJ
 j
X-Received: by 2002:a17:902:e846:b0:1f6:87c:6f with SMTP id
 d9443c01a7336-1fa23f36020mr81750205ad.62.1719340548123; 
 Tue, 25 Jun 2024 11:35:48 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3c6027sm84693235ad.133.2024.06.25.11.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 11:35:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 11/13] target/arm: Convert FCADD to decodetree
Date: Tue, 25 Jun 2024 11:35:34 -0700
Message-Id: <20240625183536.1672454-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625183536.1672454-1-richard.henderson@linaro.org>
References: <20240625183536.1672454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, T_SPF_HELO_TEMPERROR=0.01,
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
X-TUID: KZKi1ZM5bZUL

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  3 +++
 target/arm/tcg/translate-a64.c | 33 ++++++++++-----------------------
 2 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index b2c7e36969..f330919851 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -957,6 +957,9 @@ SMMLA           0100 1110 100 ..... 10100 1 ..... ..... @rrr_q1e0
 UMMLA           0110 1110 100 ..... 10100 1 ..... ..... @rrr_q1e0
 USMMLA          0100 1110 100 ..... 10101 1 ..... ..... @rrr_q1e0
 
+FCADD_90        0.10 1110 ..0 ..... 11100 1 ..... ..... @qrrr_e
+FCADD_270       0.10 1110 ..0 ..... 11110 1 ..... ..... @qrrr_e
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 57cdde008e..a1b338263f 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5623,6 +5623,14 @@ static bool trans_BFMLAL_v(DisasContext *s, arg_qrrr_e *a)
     return true;
 }
 
+static gen_helper_gvec_3_ptr * const f_vector_fcadd[3] = {
+    gen_helper_gvec_fcaddh,
+    gen_helper_gvec_fcadds,
+    gen_helper_gvec_fcaddd,
+};
+TRANS_FEAT(FCADD_90, aa64_fcma, do_fp3_vector, a, 0, f_vector_fcadd)
+TRANS_FEAT(FCADD_270, aa64_fcma, do_fp3_vector, a, 1, f_vector_fcadd)
+
 /*
  * Advanced SIMD scalar/vector x indexed element
  */
@@ -10957,8 +10965,6 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
     case 0x19: /* FCMLA, #90 */
     case 0x1a: /* FCMLA, #180 */
     case 0x1b: /* FCMLA, #270 */
-    case 0x1c: /* FCADD, #90 */
-    case 0x1e: /* FCADD, #270 */
         if (size == 0
             || (size == 1 && !dc_isar_feature(aa64_fp16, s))
             || (size == 3 && !is_q)) {
@@ -10976,7 +10982,9 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
     case 0x11: /* SQRDMLSH (vector) */
     case 0x12: /* UDOT (vector) */
     case 0x14: /* UMMLA */
+    case 0x1c: /* FCADD, #90 */
     case 0x1d: /* BFMMLA */
+    case 0x1e: /* FCADD, #270 */
     case 0x1f: /* BFDOT / BFMLAL */
         unallocated_encoding(s);
         return;
@@ -11013,27 +11021,6 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         return;
 
-    case 0xc: /* FCADD, #90 */
-    case 0xe: /* FCADD, #270 */
-        rot = extract32(opcode, 1, 1);
-        switch (size) {
-        case 1:
-            gen_gvec_op3_fpst(s, is_q, rd, rn, rm, size == 1, rot,
-                              gen_helper_gvec_fcaddh);
-            break;
-        case 2:
-            gen_gvec_op3_fpst(s, is_q, rd, rn, rm, size == 1, rot,
-                              gen_helper_gvec_fcadds);
-            break;
-        case 3:
-            gen_gvec_op3_fpst(s, is_q, rd, rn, rm, size == 1, rot,
-                              gen_helper_gvec_fcaddd);
-            break;
-        default:
-            g_assert_not_reached();
-        }
-        return;
-
     default:
         g_assert_not_reached();
     }
-- 
2.34.1

