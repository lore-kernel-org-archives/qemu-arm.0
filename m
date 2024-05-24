Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1994297ejb;
        Fri, 24 May 2024 16:27:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZPuvjqZJ0qXZjLAx3jmZc80q9LIoqj/KSrvTqurMaT1xTtzgZbudO8iF41UNK6gCmtu9R45i76h0MYcNQNy+G8UtcNxHP
X-Google-Smtp-Source: AGHT+IHRUrkHJEWMoejES0r87yLmd8PC3pMqtMEmpz75yfEZjdUcDNqkDpra8oXsCiXRl0ClzDXz
X-Received: by 2002:a05:620a:2a10:b0:793:fdb:c9c with SMTP id af79cd13be357-794ab0d76e6mr473173785a.40.1716593226840;
        Fri, 24 May 2024 16:27:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593226; cv=none;
        d=google.com; s=arc-20160816;
        b=Uw35P/O/qe05d5RCQVFU1YbhT51tPCRjVDOZwhI1knc2t1/dkFieTao9WHXrIZ7UC/
         iJI6PRU6sFNCpS1F2qsoBS/i03m5OzahkKcQVT///aKZLvQJsDfgQie2S/Qp5sX8WXSg
         0E/fa672UGRVTrYoGFbZnXXb2kpvmzq8lQ4Xw+Lw6J1NPLEPaHex1WhbpyHhhNQLvHnd
         FCtrL72j1A/GnenW65T0OjmjZ2pttMO97mbOdbAIXZJfYX/S2VoDW1EK7NUuDwH0jCAH
         dkSH/Qjd2QYJc8jIs7GkFwqUWkcY3vMWMKzVTzJwSeWoNxJAHLLsoDk9bqk1cv/1y5Fd
         lhjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NvOdWZ+hqbNSpKMnrqkieEhwTauPHntKblfxGeb+PLo=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=TorxDvJcGAsr7VtkbRMa5/5UJ1/+UZgcgfSgsF1ysKqMrgTnqrJSoOeMaGQbU6lker
         F3iufdlgUW3BwrghSrYKkTwWLUEqNjkfMfUX5nrOF5jDDImPU1BWLvkqqurOrKVNia+2
         qcZGDCTjtBlll+cg09mOIrk2FD3EPKp/1KAuJYqGr1QY0lQt7jVbhISuchbUhtv2j0a7
         LMuYAjV4YJwW35/ucLWKuEdpak5Kwd1LSx4VmKPTLVYveBdAJGd3PphvcP6gDMFsCMV4
         Bmox5LATbCKNvyj+pOCZQXm0mTSY3IXKyZjsuFmwIXN5Zs3AbFc+snWDngRZX9+7eENS
         a9DA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JHgzSqii;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abcab9d1si298524685a.53.2024.05.24.16.27.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:27:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JHgzSqii;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAeIb-0001SA-Q7; Fri, 24 May 2024 19:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeHt-0007OU-Rc
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:28 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeHf-0006sQ-A1
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:23 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6f8e819cf60so1303496b3a.0
 for <qemu-arm@nongnu.org>; Fri, 24 May 2024 16:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716593106; x=1717197906; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NvOdWZ+hqbNSpKMnrqkieEhwTauPHntKblfxGeb+PLo=;
 b=JHgzSqiiWNx0X53Ezj20P55980e0w+mml0CgOPlw3SNedTZ+ATDUXUvAsZxsL/mX7O
 2VL0LnQC3oiPl2kDLF1loPSvDb1gimxjXhzUChti7ipGSJOwcNi2IuOrBELCfUuKt0YB
 q5eiUC70Wo42Ns3Lf//0kIfEj2ykv9wrJyRLXjwSQSSshQT7xw5uSap2bSf6qOvFobrl
 RseRDDzGnd9z0eLwimUEOeKKCkZ5IoZj5/CFMM64Pp/Vfx/2T+Iar59RzAFVeo4DRK/h
 4524vK8kKZ2vM4Xb23wZEcJNcx2ESjvIJuOHtQ/77NtyEWMWEZk/I1UqKfMYY28E8JCu
 jomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716593106; x=1717197906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NvOdWZ+hqbNSpKMnrqkieEhwTauPHntKblfxGeb+PLo=;
 b=TAHQ+D75Tk13v1MfcUhWigRvNebj5WM0j0bC4hcCFPI0Xza4uhOb1MoaAJKaRCMhlu
 GZGS7mMXEBwi23tbQoRsjkA8Po1TEtg1AK2ZeOma35vmVWt11bwpwO9igQIeqkiX0f9o
 MKk22uF2O7wkJN0HSLO+Knjx5bv3JEVic9+jmqm29eMT/ADYPQ/3cdf4abD6igOapiBZ
 ye5Xu9C/uCsiIWvKFq/1sKbwTybxX4JulpFA6LuExUb3ybhki7QcgRYiMOzs3GyzLJon
 wCg/cjHaQvLpqvqwZckiXhTvdEhrg3G8imJ1g29ymTYzkoGV5ICgSPJcHox8J+cCcEvo
 pWoA==
X-Gm-Message-State: AOJu0YyKO2zom6vZFb+Ue+jhOCdJi3u2T3D9h9uWXMqUT1jdvGm5/+4j
 eqlH/oDj9WdxXFmT70nvl2wyMOP8XJxQvAWR3DCXgzS6HueNBzv3/7ZFe3Jbmqzn7ldTRZTqcN9
 d
X-Received: by 2002:a05:6a20:9146:b0:1ad:6c36:ee82 with SMTP id
 adf61e73a8af0-1b212cbcf34mr5737568637.13.1716593106444; 
 Fri, 24 May 2024 16:25:06 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbf2cfd1sm1591695b3a.3.2024.05.24.16.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:25:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 49/67] target/arm: Convert SQRSHL, UQRSHL to decodetree
Date: Fri, 24 May 2024 16:21:03 -0700
Message-Id: <20240524232121.284515-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
X-TUID: eDKmWq6HfVPT

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  4 +++
 target/arm/tcg/translate-a64.c | 48 ++++++++++++++++------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 85caf37948..96ce35ad40 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -762,6 +762,8 @@ SRSHL_s         0101 1110 111 ..... 01010 1 ..... ..... @rrr_d
 URSHL_s         0111 1110 111 ..... 01010 1 ..... ..... @rrr_d
 SQSHL_s         0101 1110 ..1 ..... 01001 1 ..... ..... @rrr_e
 UQSHL_s         0111 1110 ..1 ..... 01001 1 ..... ..... @rrr_e
+SQRSHL_s        0101 1110 ..1 ..... 01011 1 ..... ..... @rrr_e
+UQRSHL_s        0111 1110 ..1 ..... 01011 1 ..... ..... @rrr_e
 
 ### Advanced SIMD scalar pairwise
 
@@ -890,6 +892,8 @@ SRSHL_v         0.00 1110 ..1 ..... 01010 1 ..... ..... @qrrr_e
 URSHL_v         0.10 1110 ..1 ..... 01010 1 ..... ..... @qrrr_e
 SQSHL_v         0.00 1110 ..1 ..... 01001 1 ..... ..... @qrrr_e
 UQSHL_v         0.10 1110 ..1 ..... 01001 1 ..... ..... @qrrr_e
+SQRSHL_v        0.00 1110 ..1 ..... 01011 1 ..... ..... @qrrr_e
+UQRSHL_v        0.10 1110 ..1 ..... 01011 1 ..... ..... @qrrr_e
 
 ### Advanced SIMD scalar x indexed element
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index b0004e2c6f..b76682cabf 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5162,6 +5162,22 @@ static const ENVScalar2 f_scalar_uqshl = {
 };
 TRANS(UQSHL_s, do_env_scalar2, a, &f_scalar_uqshl)
 
+static const ENVScalar2 f_scalar_sqrshl = {
+    { gen_helper_neon_qrshl_s8,
+      gen_helper_neon_qrshl_s16,
+      gen_helper_neon_qrshl_s32 },
+    gen_helper_neon_qrshl_s64,
+};
+TRANS(SQRSHL_s, do_env_scalar2, a, &f_scalar_sqrshl)
+
+static const ENVScalar2 f_scalar_uqrshl = {
+    { gen_helper_neon_qrshl_u8,
+      gen_helper_neon_qrshl_u16,
+      gen_helper_neon_qrshl_u32 },
+    gen_helper_neon_qrshl_u64,
+};
+TRANS(UQRSHL_s, do_env_scalar2, a, &f_scalar_uqrshl)
+
 static bool do_fp3_vector(DisasContext *s, arg_qrrr_e *a,
                           gen_helper_gvec_3_ptr * const fns[3])
 {
@@ -5413,6 +5429,8 @@ TRANS(SRSHL_v, do_gvec_fn3, a, gen_gvec_srshl)
 TRANS(URSHL_v, do_gvec_fn3, a, gen_gvec_urshl)
 TRANS(SQSHL_v, do_gvec_fn3, a, gen_neon_sqshl)
 TRANS(UQSHL_v, do_gvec_fn3, a, gen_neon_uqshl)
+TRANS(SQRSHL_v, do_gvec_fn3, a, gen_neon_sqrshl)
+TRANS(UQRSHL_v, do_gvec_fn3, a, gen_neon_uqrshl)
 
 
 /*
@@ -9426,13 +9444,6 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
         }
         gen_cmtst_i64(tcg_rd, tcg_rn, tcg_rm);
         break;
-    case 0xb: /* SQRSHL, UQRSHL */
-        if (u) {
-            gen_helper_neon_qrshl_u64(tcg_rd, tcg_env, tcg_rn, tcg_rm);
-        } else {
-            gen_helper_neon_qrshl_s64(tcg_rd, tcg_env, tcg_rn, tcg_rm);
-        }
-        break;
     case 0x10: /* ADD, SUB */
         if (u) {
             tcg_gen_sub_i64(tcg_rd, tcg_rn, tcg_rm);
@@ -9446,6 +9457,7 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
     case 0x8: /* SSHL, USHL */
     case 0x9: /* SQSHL, UQSHL */
     case 0xa: /* SRSHL, URSHL */
+    case 0xb: /* SQRSHL, UQRSHL */
         g_assert_not_reached();
     }
 }
@@ -9467,8 +9479,6 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
     TCGv_i64 tcg_rd;
 
     switch (opcode) {
-    case 0xb: /* SQRSHL, UQRSHL */
-        break;
     case 0x6: /* CMGT, CMHI */
     case 0x7: /* CMGE, CMHS */
     case 0x11: /* CMTST, CMEQ */
@@ -9490,6 +9500,7 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
     case 0x8: /* SSHL, USHL */
     case 0x9: /* SQSHL, UQSHL */
     case 0xa: /* SRSHL, URSHL */
+    case 0xb: /* SQRSHL, UQRSHL */
         unallocated_encoding(s);
         return;
     }
@@ -9516,16 +9527,6 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
         void (*genfn)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64, MemOp) = NULL;
 
         switch (opcode) {
-        case 0xb: /* SQRSHL, UQRSHL */
-        {
-            static NeonGenTwoOpEnvFn * const fns[3][2] = {
-                { gen_helper_neon_qrshl_s8, gen_helper_neon_qrshl_u8 },
-                { gen_helper_neon_qrshl_s16, gen_helper_neon_qrshl_u16 },
-                { gen_helper_neon_qrshl_s32, gen_helper_neon_qrshl_u32 },
-            };
-            genenvfn = fns[size][u];
-            break;
-        }
         case 0x16: /* SQDMULH, SQRDMULH */
         {
             static NeonGenTwoOpEnvFn * const fns[2][2] = {
@@ -9540,6 +9541,7 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
         case 0x1: /* SQADD, UQADD */
         case 0x5: /* SQSUB, UQSUB */
         case 0x9: /* SQSHL, UQSHL */
+        case 0xb: /* SQRSHL, UQRSHL */
             g_assert_not_reached();
         }
 
@@ -10965,13 +10967,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x0b: /* SQRSHL, UQRSHL */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_neon_uqrshl, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_neon_sqrshl, size);
-        }
-        return;
     case 0x0c: /* SMAX, UMAX */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umax, size);
@@ -11055,6 +11050,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     case 0x08: /* SSHL, USHL */
     case 0x09: /* SQSHL, UQSHL */
     case 0x0a: /* SRSHL, URSHL */
+    case 0x0b: /* SQRSHL, UQRSHL */
         g_assert_not_reached();
     }
 
-- 
2.34.1

