Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1270703ejc;
        Sun, 5 May 2024 18:08:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUxU+08GhiQAbRjp1A2lu/RF14PSfXY02xW0Jur16Axt5ptAkpNYQIv5htAReekxysA8DuuRzGvyQtBUBMbkvLn8goh2g7p
X-Google-Smtp-Source: AGHT+IGLbJkGnNMZ6mbwcy7gNJwtJZltDNNJ0TJQLYne4PgiXmfxzRyYWxCSnVox0gK+6u+830Qh
X-Received: by 2002:a05:622a:5785:b0:43a:3fce:32c2 with SMTP id eh5-20020a05622a578500b0043a3fce32c2mr18766093qtb.3.1714957690433;
        Sun, 05 May 2024 18:08:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714957690; cv=none;
        d=google.com; s=arc-20160816;
        b=ytZsoKp4++oOCytieBlqy3Tsawds8uCUdhD7b2RfM7/w0nfkaREz1Jq74FZ8pJ4GbP
         8ZKXADYp3LY8d3uceupS6eM4KYc7HsgYMT2XFvSU8AJXpTyUfKwUhup04pUPSBV6a+nl
         g6tj3feKbVK/DVNalXWhFhULc9BNCirJ5Frxxm4p6BuMv56eXqrvP2Ec6tUngk7Zaryp
         NjPBowRmH1e5eqysXkJYHcVreTLtnWcXOPlS8+7WH5Dq7jyITzid9N8YICK7AjNlDzUl
         60p+lIsQa4qI7jEucy2RMlaUV9UXorUtWkUpt3U737+uKlbr+Cz/KtrcKUUt/MXSGw/W
         IKXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ib49lPJSEb+zuHbe2B1IUsoLKxHnzCcQYs1eRSQPuB8=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=1IgIE7ShyAmR6ZIQTjXJdlIKhmCLs0dHx3DEaZTMVLrO/CGjMnbts/pQ1L1YtF1+3t
         GVnaiGYOx5KjaUxB/NstSQn2T9CZkmcMpEDug3nMQJyQswG2Q7wQmze1GcPdxMaY83TL
         IkhsVf+GoY0aDW+j0spWuoUfDYovPPitEyuib1TZsMsVUvpc82HsVFkz3sAxVJ6Eln9v
         TmnWcR9HIGr9kn6OBOjVc3S+wL5hZaJjDmMYRiEVZotc/Yx2rE1FtSSgZaOLT0lL1Ju9
         Kxaq2QtImv7DV4Ua9tBQZKjGGJvzPCxX/cIzmwOl2cVg0X/u9flx2RKFRH5inEGuURXk
         +iaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LhZUkpC3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2-20020ac85a82000000b0043b0757e44asi8351715qtc.271.2024.05.05.18.08.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:08:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LhZUkpC3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3mnL-0000iS-UH; Sun, 05 May 2024 21:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mme-0007ty-VR
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:04:49 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mmH-0002V7-RY
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:04:47 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2b3c1ea9a68so828873a91.1
 for <qemu-arm@nongnu.org>; Sun, 05 May 2024 18:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957464; x=1715562264; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ib49lPJSEb+zuHbe2B1IUsoLKxHnzCcQYs1eRSQPuB8=;
 b=LhZUkpC3mtvX30kVefAHrbW0dI2Wi4AHZleANWMNd3WGTrt4jBygaN5m28s2muC6H3
 majT4YsIeQqdNORvY3AZDmQSfXIXzpBMOBGY3BfAZgWbg8ijIJW1LTkzNQBJC6Di+jys
 6EzvJF8Tdidh1a67Ra60j/7nPoPj26TxNs7/ZH+9vA0+PFP02h/hCytvaMNloqgXaDFS
 lUKSOVTxW7vA7smw4vqKdZzI8F47b1PWPBPcbQeOeFYrWJnZafMswVTWu8x0Gwx4kczZ
 eou50D+VwYHsdKa6bAnrzZ0O/rFseA1ZEsBPZ5UduBGBaU3y3B6mkd79kx6mcM3Oxyu1
 kNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957464; x=1715562264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ib49lPJSEb+zuHbe2B1IUsoLKxHnzCcQYs1eRSQPuB8=;
 b=A6+k/KG1Y241W3qHuVIqwT7G0thuGsuxcwW5qbCPcEmqHe/jF6EAVDLc4O/bDyLaHY
 pBqnDvHHOpuhUavrGHjlD9XxDYFpaDz10ZsTPzDIAW29+eQiUA+3vOfI9Tq1hHhIj0PX
 DXRyjZURvD2e7v8WvP3XsBuazeM/qcGB+NP08HtyDVeHQbUm4pslPYqERi9bL8fQfWJH
 CxU3BSA1LQdfs6u2CKR+n/MduakKLtEvS1oDxjHtTNrAPwV+o35xPuvyTDlIrrJp70AP
 769r+yVItwuk1JpD+wLASn/1+NBcaRSCG5BHVi5PpByOTgSzDJ1XX8LvZK6F1dpnn5TR
 wdpA==
X-Gm-Message-State: AOJu0YxS2iUTtShyf5WCBUd/ujgy+WwExK9Lwk98eOzRes2v94GyyM9o
 XPraWaceq9xfrthj8LiNZzGSjUWDDsHI45l7y/3WbRCcJShYj8JKHjOD2RV5Yq4=
X-Received: by 2002:a17:90a:880b:b0:2b1:be71:15d0 with SMTP id
 s11-20020a17090a880b00b002b1be7115d0mr16279576pjn.22.1714957463977; 
 Sun, 05 May 2024 18:04:23 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 pv7-20020a17090b3c8700b002a5f44353d2sm8958232pjb.7.2024.05.05.18.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:04:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 22/57] target/arm: Convert FMAXP, FMINP, FMAXNMP,
 FMINNMP to decodetree
Date: Sun,  5 May 2024 18:03:28 -0700
Message-Id: <20240506010403.6204-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506010403.6204-1-richard.henderson@linaro.org>
References: <20240506010403.6204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Y8F4ulz4e4G6

These are the last instructions within disas_simd_three_reg_same_fp16,
so remove it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h            |  16 ++
 target/arm/tcg/a64.decode      |  24 +++
 target/arm/tcg/translate-a64.c | 296 ++++++---------------------------
 target/arm/tcg/vec_helper.c    |  16 ++
 4 files changed, 107 insertions(+), 245 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 8441b49d1f..3268477329 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1052,6 +1052,22 @@ DEF_HELPER_FLAGS_5(gvec_faddp_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_faddp_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_faddp_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_fmaxp_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fmaxp_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fmaxp_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(gvec_fminp_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fminp_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fminp_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(gvec_fmaxnump_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fmaxnump_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fmaxnump_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(gvec_fminnump_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fminnump_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_fminnump_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "tcg/helper-a64.h"
 #include "tcg/helper-sve.h"
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 9d28cb5894..e6bd84c433 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -746,6 +746,18 @@ FRSQRTS_s       0101 1110 1.1 ..... 11111 1 ..... ..... @rrr_sd
 FADDP_s         0101 1110 0011 0000 1101 10 ..... ..... @rr_h
 FADDP_s         0111 1110 0.11 0000 1101 10 ..... ..... @rr_sd
 
+FMAXP_s         0101 1110 0011 0000 1111 10 ..... ..... @rr_h
+FMAXP_s         0111 1110 0.11 0000 1111 10 ..... ..... @rr_sd
+
+FMINP_s         0101 1110 1011 0000 1111 10 ..... ..... @rr_h
+FMINP_s         0111 1110 1.11 0000 1111 10 ..... ..... @rr_sd
+
+FMAXNMP_s       0101 1110 0011 0000 1100 10 ..... ..... @rr_h
+FMAXNMP_s       0111 1110 0.11 0000 1100 10 ..... ..... @rr_sd
+
+FMINNMP_s       0101 1110 1011 0000 1100 10 ..... ..... @rr_h
+FMINNMP_s       0111 1110 1.11 0000 1100 10 ..... ..... @rr_sd
+
 ### Advanced SIMD three same
 
 FADD_v          0.00 1110 010 ..... 00010 1 ..... ..... @qrrr_h
@@ -808,6 +820,18 @@ FRSQRTS_v       0.00 1110 1.1 ..... 11111 1 ..... ..... @qrrr_sd
 FADDP_v         0.10 1110 010 ..... 00010 1 ..... ..... @qrrr_h
 FADDP_v         0.10 1110 0.1 ..... 11010 1 ..... ..... @qrrr_sd
 
+FMAXP_v         0.10 1110 010 ..... 00110 1 ..... ..... @qrrr_h
+FMAXP_v         0.10 1110 0.1 ..... 11110 1 ..... ..... @qrrr_sd
+
+FMINP_v         0.10 1110 110 ..... 00110 1 ..... ..... @qrrr_h
+FMINP_v         0.10 1110 1.1 ..... 11110 1 ..... ..... @qrrr_sd
+
+FMAXNMP_v       0.10 1110 010 ..... 00000 1 ..... ..... @qrrr_h
+FMAXNMP_v       0.10 1110 0.1 ..... 11000 1 ..... ..... @qrrr_sd
+
+FMINNMP_v       0.10 1110 110 ..... 00000 1 ..... ..... @qrrr_h
+FMINNMP_v       0.10 1110 1.1 ..... 11000 1 ..... ..... @qrrr_sd
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index f5ee6145b1..e7d562627d 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5218,6 +5218,34 @@ static gen_helper_gvec_3_ptr * const f_vector_faddp[3] = {
 };
 TRANS(FADDP_v, do_fp3_vector, a, f_vector_faddp)
 
+static gen_helper_gvec_3_ptr * const f_vector_fmaxp[3] = {
+    gen_helper_gvec_fmaxp_h,
+    gen_helper_gvec_fmaxp_s,
+    gen_helper_gvec_fmaxp_d,
+};
+TRANS(FMAXP_v, do_fp3_vector, a, f_vector_fmaxp)
+
+static gen_helper_gvec_3_ptr * const f_vector_fminp[3] = {
+    gen_helper_gvec_fminp_h,
+    gen_helper_gvec_fminp_s,
+    gen_helper_gvec_fminp_d,
+};
+TRANS(FMINP_v, do_fp3_vector, a, f_vector_fminp)
+
+static gen_helper_gvec_3_ptr * const f_vector_fmaxnmp[3] = {
+    gen_helper_gvec_fmaxnump_h,
+    gen_helper_gvec_fmaxnump_s,
+    gen_helper_gvec_fmaxnump_d,
+};
+TRANS(FMAXNMP_v, do_fp3_vector, a, f_vector_fmaxnmp)
+
+static gen_helper_gvec_3_ptr * const f_vector_fminnmp[3] = {
+    gen_helper_gvec_fminnump_h,
+    gen_helper_gvec_fminnump_s,
+    gen_helper_gvec_fminnump_d,
+};
+TRANS(FMINNMP_v, do_fp3_vector, a, f_vector_fminnmp)
+
 /*
  * Advanced SIMD scalar/vector x indexed element
  */
@@ -5453,6 +5481,10 @@ static bool do_fp3_scalar_pair(DisasContext *s, arg_rr_e *a, const FPScalar *f)
 }
 
 TRANS(FADDP_s, do_fp3_scalar_pair, a, &f_scalar_fadd)
+TRANS(FMAXP_s, do_fp3_scalar_pair, a, &f_scalar_fmax)
+TRANS(FMINP_s, do_fp3_scalar_pair, a, &f_scalar_fmin)
+TRANS(FMAXNMP_s, do_fp3_scalar_pair, a, &f_scalar_fmaxnm)
+TRANS(FMINNMP_s, do_fp3_scalar_pair, a, &f_scalar_fminnm)
 
 /* Shift a TCGv src by TCGv shift_amount, put result in dst.
  * Note that it is the caller's responsibility to ensure that the
@@ -8390,7 +8422,6 @@ static void disas_simd_scalar_pairwise(DisasContext *s, uint32_t insn)
     int opcode = extract32(insn, 12, 5);
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
-    TCGv_ptr fpst;
 
     /* For some ops (the FP ones), size[1] is part of the encoding.
      * For ADDP strictly it is not but size[1] is always 1 for valid
@@ -8407,33 +8438,13 @@ static void disas_simd_scalar_pairwise(DisasContext *s, uint32_t insn)
         if (!fp_access_check(s)) {
             return;
         }
-
-        fpst = NULL;
         break;
+    default:
     case 0xc: /* FMAXNMP */
+    case 0xd: /* FADDP */
     case 0xf: /* FMAXP */
     case 0x2c: /* FMINNMP */
     case 0x2f: /* FMINP */
-        /* FP op, size[0] is 32 or 64 bit*/
-        if (!u) {
-            if (!dc_isar_feature(aa64_fp16, s)) {
-                unallocated_encoding(s);
-                return;
-            } else {
-                size = MO_16;
-            }
-        } else {
-            size = extract32(size, 0, 1) ? MO_64 : MO_32;
-        }
-
-        if (!fp_access_check(s)) {
-            return;
-        }
-
-        fpst = fpstatus_ptr(size == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-        break;
-    default:
-    case 0xd: /* FADDP */
         unallocated_encoding(s);
         return;
     }
@@ -8450,71 +8461,18 @@ static void disas_simd_scalar_pairwise(DisasContext *s, uint32_t insn)
         case 0x3b: /* ADDP */
             tcg_gen_add_i64(tcg_res, tcg_op1, tcg_op2);
             break;
-        case 0xc: /* FMAXNMP */
-            gen_helper_vfp_maxnumd(tcg_res, tcg_op1, tcg_op2, fpst);
-            break;
-        case 0xf: /* FMAXP */
-            gen_helper_vfp_maxd(tcg_res, tcg_op1, tcg_op2, fpst);
-            break;
-        case 0x2c: /* FMINNMP */
-            gen_helper_vfp_minnumd(tcg_res, tcg_op1, tcg_op2, fpst);
-            break;
-        case 0x2f: /* FMINP */
-            gen_helper_vfp_mind(tcg_res, tcg_op1, tcg_op2, fpst);
-            break;
         default:
+        case 0xc: /* FMAXNMP */
         case 0xd: /* FADDP */
+        case 0xf: /* FMAXP */
+        case 0x2c: /* FMINNMP */
+        case 0x2f: /* FMINP */
             g_assert_not_reached();
         }
 
         write_fp_dreg(s, rd, tcg_res);
     } else {
-        TCGv_i32 tcg_op1 = tcg_temp_new_i32();
-        TCGv_i32 tcg_op2 = tcg_temp_new_i32();
-        TCGv_i32 tcg_res = tcg_temp_new_i32();
-
-        read_vec_element_i32(s, tcg_op1, rn, 0, size);
-        read_vec_element_i32(s, tcg_op2, rn, 1, size);
-
-        if (size == MO_16) {
-            switch (opcode) {
-            case 0xc: /* FMAXNMP */
-                gen_helper_advsimd_maxnumh(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
-            case 0xf: /* FMAXP */
-                gen_helper_advsimd_maxh(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
-            case 0x2c: /* FMINNMP */
-                gen_helper_advsimd_minnumh(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
-            case 0x2f: /* FMINP */
-                gen_helper_advsimd_minh(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
-            default:
-            case 0xd: /* FADDP */
-                g_assert_not_reached();
-            }
-        } else {
-            switch (opcode) {
-            case 0xc: /* FMAXNMP */
-                gen_helper_vfp_maxnums(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
-            case 0xf: /* FMAXP */
-                gen_helper_vfp_maxs(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
-            case 0x2c: /* FMINNMP */
-                gen_helper_vfp_minnums(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
-            case 0x2f: /* FMINP */
-                gen_helper_vfp_mins(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
-            default:
-            case 0xd: /* FADDP */
-                g_assert_not_reached();
-            }
-        }
-
-        write_fp_sreg(s, rd, tcg_res);
+        g_assert_not_reached();
     }
 }
 
@@ -10991,16 +10949,8 @@ static void disas_simd_3same_logic(DisasContext *s, uint32_t insn)
 static void handle_simd_3same_pair(DisasContext *s, int is_q, int u, int opcode,
                                    int size, int rn, int rm, int rd)
 {
-    TCGv_ptr fpst;
     int pass;
 
-    /* Floating point operations need fpst */
-    if (opcode >= 0x58) {
-        fpst = fpstatus_ptr(FPST_FPCR);
-    } else {
-        fpst = NULL;
-    }
-
     if (!fp_access_check(s)) {
         return;
     }
@@ -11024,20 +10974,12 @@ static void handle_simd_3same_pair(DisasContext *s, int is_q, int u, int opcode,
             case 0x17: /* ADDP */
                 tcg_gen_add_i64(tcg_res[pass], tcg_op1, tcg_op2);
                 break;
-            case 0x58: /* FMAXNMP */
-                gen_helper_vfp_maxnumd(tcg_res[pass], tcg_op1, tcg_op2, fpst);
-                break;
-            case 0x5e: /* FMAXP */
-                gen_helper_vfp_maxd(tcg_res[pass], tcg_op1, tcg_op2, fpst);
-                break;
-            case 0x78: /* FMINNMP */
-                gen_helper_vfp_minnumd(tcg_res[pass], tcg_op1, tcg_op2, fpst);
-                break;
-            case 0x7e: /* FMINP */
-                gen_helper_vfp_mind(tcg_res[pass], tcg_op1, tcg_op2, fpst);
-                break;
             default:
+            case 0x58: /* FMAXNMP */
             case 0x5a: /* FADDP */
+            case 0x5e: /* FMAXP */
+            case 0x78: /* FMINNMP */
+            case 0x7e: /* FMINP */
                 g_assert_not_reached();
             }
         }
@@ -11091,21 +11033,12 @@ static void handle_simd_3same_pair(DisasContext *s, int is_q, int u, int opcode,
                 genfn = fns[size][u];
                 break;
             }
-            /* The FP operations are all on single floats (32 bit) */
-            case 0x58: /* FMAXNMP */
-                gen_helper_vfp_maxnums(tcg_res[pass], tcg_op1, tcg_op2, fpst);
-                break;
-            case 0x5e: /* FMAXP */
-                gen_helper_vfp_maxs(tcg_res[pass], tcg_op1, tcg_op2, fpst);
-                break;
-            case 0x78: /* FMINNMP */
-                gen_helper_vfp_minnums(tcg_res[pass], tcg_op1, tcg_op2, fpst);
-                break;
-            case 0x7e: /* FMINP */
-                gen_helper_vfp_mins(tcg_res[pass], tcg_op1, tcg_op2, fpst);
-                break;
             default:
+            case 0x58: /* FMAXNMP */
             case 0x5a: /* FADDP */
+            case 0x5e: /* FMAXP */
+            case 0x78: /* FMINNMP */
+            case 0x7e: /* FMINP */
                 g_assert_not_reached();
             }
 
@@ -11144,18 +11077,6 @@ static void disas_simd_3same_float(DisasContext *s, uint32_t insn)
     }
 
     switch (fpopcode) {
-    case 0x58: /* FMAXNMP */
-    case 0x5e: /* FMAXP */
-    case 0x78: /* FMINNMP */
-    case 0x7e: /* FMINP */
-        if (size && !is_q) {
-            unallocated_encoding(s);
-            return;
-        }
-        handle_simd_3same_pair(s, is_q, 0, fpopcode, size ? MO_64 : MO_32,
-                               rn, rm, rd);
-        return;
-
     case 0x1d: /* FMLAL  */
     case 0x3d: /* FMLSL  */
     case 0x59: /* FMLAL2 */
@@ -11189,14 +11110,18 @@ static void disas_simd_3same_float(DisasContext *s, uint32_t insn)
     case 0x3a: /* FSUB */
     case 0x3e: /* FMIN */
     case 0x3f: /* FRSQRTS */
+    case 0x58: /* FMAXNMP */
     case 0x5a: /* FADDP */
     case 0x5b: /* FMUL */
     case 0x5c: /* FCMGE */
     case 0x5d: /* FACGE */
+    case 0x5e: /* FMAXP */
     case 0x5f: /* FDIV */
+    case 0x78: /* FMINNMP */
     case 0x7a: /* FABD */
     case 0x7d: /* FACGT */
     case 0x7c: /* FCMGT */
+    case 0x7e: /* FMINP */
         unallocated_encoding(s);
         return;
     }
@@ -11505,124 +11430,6 @@ static void disas_simd_three_reg_same(DisasContext *s, uint32_t insn)
     }
 }
 
-/*
- * Advanced SIMD three same (ARMv8.2 FP16 variants)
- *
- *  31  30  29  28       24 23  22 21 20  16 15 14 13    11 10  9    5 4    0
- * +---+---+---+-----------+---------+------+-----+--------+---+------+------+
- * | 0 | Q | U | 0 1 1 1 0 | a | 1 0 |  Rm  | 0 0 | opcode | 1 |  Rn  |  Rd  |
- * +---+---+---+-----------+---------+------+-----+--------+---+------+------+
- *
- * This includes FMULX, FCMEQ (register), FRECPS, FRSQRTS, FCMGE
- * (register), FACGE, FABD, FCMGT (register) and FACGT.
- *
- */
-static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
-{
-    int opcode = extract32(insn, 11, 3);
-    int u = extract32(insn, 29, 1);
-    int a = extract32(insn, 23, 1);
-    int is_q = extract32(insn, 30, 1);
-    int rm = extract32(insn, 16, 5);
-    int rn = extract32(insn, 5, 5);
-    int rd = extract32(insn, 0, 5);
-    /*
-     * For these floating point ops, the U, a and opcode bits
-     * together indicate the operation.
-     */
-    int fpopcode = opcode | (a << 3) | (u << 4);
-    bool pairwise;
-    TCGv_ptr fpst;
-    int pass;
-
-    switch (fpopcode) {
-    case 0x10: /* FMAXNMP */
-    case 0x16: /* FMAXP */
-    case 0x18: /* FMINNMP */
-    case 0x1e: /* FMINP */
-        pairwise = true;
-        break;
-    default:
-    case 0x0: /* FMAXNM */
-    case 0x1: /* FMLA */
-    case 0x2: /* FADD */
-    case 0x3: /* FMULX */
-    case 0x4: /* FCMEQ */
-    case 0x6: /* FMAX */
-    case 0x7: /* FRECPS */
-    case 0x8: /* FMINNM */
-    case 0x9: /* FMLS */
-    case 0xa: /* FSUB */
-    case 0xe: /* FMIN */
-    case 0xf: /* FRSQRTS */
-    case 0x12: /* FADDP */
-    case 0x13: /* FMUL */
-    case 0x14: /* FCMGE */
-    case 0x15: /* FACGE */
-    case 0x17: /* FDIV */
-    case 0x1a: /* FABD */
-    case 0x1c: /* FCMGT */
-    case 0x1d: /* FACGT */
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (!dc_isar_feature(aa64_fp16, s)) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    fpst = fpstatus_ptr(FPST_FPCR_F16);
-
-    if (pairwise) {
-        int maxpass = is_q ? 8 : 4;
-        TCGv_i32 tcg_op1 = tcg_temp_new_i32();
-        TCGv_i32 tcg_op2 = tcg_temp_new_i32();
-        TCGv_i32 tcg_res[8];
-
-        for (pass = 0; pass < maxpass; pass++) {
-            int passreg = pass < (maxpass / 2) ? rn : rm;
-            int passelt = (pass << 1) & (maxpass - 1);
-
-            read_vec_element_i32(s, tcg_op1, passreg, passelt, MO_16);
-            read_vec_element_i32(s, tcg_op2, passreg, passelt + 1, MO_16);
-            tcg_res[pass] = tcg_temp_new_i32();
-
-            switch (fpopcode) {
-            case 0x10: /* FMAXNMP */
-                gen_helper_advsimd_maxnumh(tcg_res[pass], tcg_op1, tcg_op2,
-                                           fpst);
-                break;
-            case 0x16: /* FMAXP */
-                gen_helper_advsimd_maxh(tcg_res[pass], tcg_op1, tcg_op2, fpst);
-                break;
-            case 0x18: /* FMINNMP */
-                gen_helper_advsimd_minnumh(tcg_res[pass], tcg_op1, tcg_op2,
-                                           fpst);
-                break;
-            case 0x1e: /* FMINP */
-                gen_helper_advsimd_minh(tcg_res[pass], tcg_op1, tcg_op2, fpst);
-                break;
-            default:
-            case 0x12: /* FADDP */
-                g_assert_not_reached();
-            }
-        }
-
-        for (pass = 0; pass < maxpass; pass++) {
-            write_vec_element_i32(s, tcg_res[pass], rd, pass, MO_16);
-        }
-    } else {
-        g_assert_not_reached();
-    }
-
-    clear_vec_high(s, is_q, rd);
-}
-
 /* AdvSIMD three same extra
  *  31   30  29 28       24 23  22  21 20  16  15 14    11  10 9  5 4  0
  * +---+---+---+-----------+------+---+------+---+--------+---+----+----+
@@ -13385,7 +13192,6 @@ static const AArch64DecodeTable data_proc_simd[] = {
     { 0x5e300800, 0xdf3e0c00, disas_simd_scalar_pairwise },
     { 0x5f000000, 0xdf000400, disas_simd_indexed }, /* scalar indexed */
     { 0x5f000400, 0xdf800400, disas_simd_scalar_shift_imm },
-    { 0x0e400400, 0x9f60c400, disas_simd_three_reg_same_fp16 },
     { 0x0e780800, 0x8f7e0c00, disas_simd_two_reg_misc_fp16 },
     { 0x00000000, 0x00000000, NULL }
 };
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 28989c7d7a..79e1fdcaa9 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -2260,6 +2260,22 @@ DO_3OP_PAIR(gvec_faddp_h, float16_add, float16, H2)
 DO_3OP_PAIR(gvec_faddp_s, float32_add, float32, H4)
 DO_3OP_PAIR(gvec_faddp_d, float64_add, float64, )
 
+DO_3OP_PAIR(gvec_fmaxp_h, float16_max, float16, H2)
+DO_3OP_PAIR(gvec_fmaxp_s, float32_max, float32, H4)
+DO_3OP_PAIR(gvec_fmaxp_d, float64_max, float64, )
+
+DO_3OP_PAIR(gvec_fminp_h, float16_min, float16, H2)
+DO_3OP_PAIR(gvec_fminp_s, float32_min, float32, H4)
+DO_3OP_PAIR(gvec_fminp_d, float64_min, float64, )
+
+DO_3OP_PAIR(gvec_fmaxnump_h, float16_maxnum, float16, H2)
+DO_3OP_PAIR(gvec_fmaxnump_s, float32_maxnum, float32, H4)
+DO_3OP_PAIR(gvec_fmaxnump_d, float64_maxnum, float64, )
+
+DO_3OP_PAIR(gvec_fminnump_h, float16_minnum, float16, H2)
+DO_3OP_PAIR(gvec_fminnump_s, float32_minnum, float32, H4)
+DO_3OP_PAIR(gvec_fminnump_d, float64_minnum, float64, )
+
 #define DO_VCVT_FIXED(NAME, FUNC, TYPE)                                 \
     void HELPER(NAME)(void *vd, void *vn, void *stat, uint32_t desc)    \
     {                                                                   \
-- 
2.34.1

