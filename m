Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1995171ejb;
        Fri, 24 May 2024 16:30:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWt3QQbESjpF7wnXPZviyhRF81zbcuBzxmNi5RhkG5Pb6vz2OjvPuYIwc8hjpo2v+ct/lwM3h9Egi1t2vRYSnrE1T5XiKH2
X-Google-Smtp-Source: AGHT+IHizIFSnIEk7xeCNRD+GCcumeOKu7Sb+EER3wn4nP9uZ5ouLMaHRSL0Dz5+FkCsF60CK+Jl
X-Received: by 2002:a25:dfcb:0:b0:de5:5510:1d4a with SMTP id 3f1490d57ef6-df7721a7207mr3686299276.34.1716593399690;
        Fri, 24 May 2024 16:29:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593399; cv=none;
        d=google.com; s=arc-20160816;
        b=NYZAoAEc/QuP94ll3+obHdeZUYqqC/79qsg+F5n9jr46GOLuhRJ50ZvSL4ECT0qABw
         HHq+x7iB7Y87GmiTXqv4gzXM2xsZEhr2fgUBUEfbEjLdY0mIeTRdQcl12rEPOtc3OD5r
         aC/jQ0t21v1lgRB1LWCwv9EGusEOot7/xtz+BdN4HRVD+Rm/NunBZ/L4CK5bmcE1GFFu
         xxMLV9L+jg1Mt1hzsImTmC8zwEyzCh+q1L6rXoFz2nJRWfgHbxPQLUdg6TwexE4Bpa2B
         OqQOBgYlHhaa0jPisrx8yA/r/NV0mJmGxK89PU14x6iArSIAFaKTvuvB0n1QtejCQRxr
         tEgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2++z+BnsdD5ea3L5ZWynOcCaqUXBNf2jM4oVZP41cHM=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=DvlCzeT2QMe8JqMVgMN5hWdqN14UObNkmRgeJEIk/fdQYYfkXwJbNChe01+3RiSbid
         92o728AIxHrEResfLhyW/QqPyHulSJEh3Jn1ib82MU/Znf0PnWP0S4rSGRogdW5kJqmg
         JJu1RMTDNIvXAs007oIa9yNd9+feNonFv1SNL7A76ZSUahoDBetH54k/BpFV5m6TxBqZ
         aheO+6nlfujDpGfQ+oG6ydaKGtpH5nAM4DdBdbQsFE5bmI143Ohb3mnmQBuv8pMy12Er
         G5fAmYGQJypv/wZKkbt22e+4X6e3XgNtAAiKzJWDOsCAK9qKuoHjskS/dVEH5neuPkDb
         tdhA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I6Vf2+Nr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abd3d494si295918185a.527.2024.05.24.16.29.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:29:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I6Vf2+Nr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAeI4-0007s2-3f; Fri, 24 May 2024 19:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeHt-0007OV-RM
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:28 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeHY-0006lS-Lp
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:19 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6f8ec7e054bso1395280b3a.3
 for <qemu-arm@nongnu.org>; Fri, 24 May 2024 16:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716593103; x=1717197903; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2++z+BnsdD5ea3L5ZWynOcCaqUXBNf2jM4oVZP41cHM=;
 b=I6Vf2+Nr+8k9E7DCDZjB6vniEtkw6hH0i8Uf96MCPSdkYiWgpkJsBI8VMaCddI6rGZ
 E+CO+KncLTl0t1EvnZJx+fgApkDxP0lADsJbMa/WGWjHDne54NlQ5p5T96aS9jkzfdsw
 k7ctx9ty1pobxd3DFB+GhCHG+hhlC1NYjbKRuP2LbhD97JVQ9o0u6qr5a2UCdN5Jj84F
 GJ9nob4EfMalUXGL5edKBuLlMFOCjp8GiG9nuBPKlF21C6kMTV3SCBdD6YC02bzLRvbI
 ZubV/H4avzGAb02UjevkfsDuuhIwhKP0YgjiWeQL81NqNq1jwjiIy1v1axLYj3zdTNQs
 O+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716593103; x=1717197903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2++z+BnsdD5ea3L5ZWynOcCaqUXBNf2jM4oVZP41cHM=;
 b=s4tejkzTKgsWXBFgOSFRPvvGMQ86APse3Hn+j9oFu+uCs/jqmX979Im3TApi13cCzg
 2WaV5rkPILbbQg9j5jb48JlZBn4ijMqSE9rcTBeyiCK35fzvpwbdmqSZHTgkZfB4+wG3
 5+Qw0WE29pkZoEBo9TpA4mbLUT3N3qTxYbHjsruJg+8XSLdBDQi/bAPdYvV4iaN45o2s
 743RI5r7QsoJS048NnUrOZ9UsUUk7UU2wxQu3ehVCeLujXPKABj0BAGd4t0l2/5gBDN3
 1mOfdw74BnkUPY61BbXoyZ0jUMODCzJ90vBBLGY9mG/lH0nOy/X5GtKr2Gl9B8AQwPmD
 /qnA==
X-Gm-Message-State: AOJu0YxIZdP2gZEM0Zcp9JQvCxSs+U3rUI3ZiOp0IhXEGk39xjZ+Qili
 Bw7UdvM6tvpqHuadhpD25T8ZEM0mrVUpnOKVOCtluUon2BKVRc67ZUzhSzB9OWbJYcLUH/tUaLv
 N
X-Received: by 2002:a05:6a20:9188:b0:1af:b1c0:c9eb with SMTP id
 adf61e73a8af0-1b212e02f4bmr5064211637.45.1716593103153; 
 Fri, 24 May 2024 16:25:03 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbf2cfd1sm1591695b3a.3.2024.05.24.16.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:25:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 45/67] target/arm: Convert SRSHL, URSHL to decodetree
Date: Fri, 24 May 2024 16:20:59 -0700
Message-Id: <20240524232121.284515-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: NZjR0PCqj+8L

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  4 ++++
 target/arm/tcg/translate-a64.c | 22 +++++++---------------
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index ea897d6732..9e02776036 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -758,6 +758,8 @@ USQADD_s        0111 1110 ..1 00000 00111 0 ..... ..... @r2r_e
 
 SSHL_s          0101 1110 111 ..... 01000 1 ..... ..... @rrr_d
 USHL_s          0111 1110 111 ..... 01000 1 ..... ..... @rrr_d
+SRSHL_s         0101 1110 111 ..... 01010 1 ..... ..... @rrr_d
+URSHL_s         0111 1110 111 ..... 01010 1 ..... ..... @rrr_d
 
 ### Advanced SIMD scalar pairwise
 
@@ -882,6 +884,8 @@ USQADD_v        0.10 1110 ..1 00000 00111 0 ..... ..... @qr2r_e
 
 SSHL_v          0.00 1110 ..1 ..... 01000 1 ..... ..... @qrrr_e
 USHL_v          0.10 1110 ..1 ..... 01000 1 ..... ..... @qrrr_e
+SRSHL_v         0.00 1110 ..1 ..... 01010 1 ..... ..... @qrrr_e
+URSHL_v         0.10 1110 ..1 ..... 01010 1 ..... ..... @qrrr_e
 
 ### Advanced SIMD scalar x indexed element
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 2dffda36a8..24f2025997 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5116,6 +5116,8 @@ static bool do_int3_scalar_d(DisasContext *s, arg_rrr_e *a,
 
 TRANS(SSHL_s, do_int3_scalar_d, a, gen_sshl_i64)
 TRANS(USHL_s, do_int3_scalar_d, a, gen_ushl_i64)
+TRANS(SRSHL_s, do_int3_scalar_d, a, gen_helper_neon_rshl_s64)
+TRANS(URSHL_s, do_int3_scalar_d, a, gen_helper_neon_rshl_u64)
 
 static bool do_fp3_vector(DisasContext *s, arg_qrrr_e *a,
                           gen_helper_gvec_3_ptr * const fns[3])
@@ -5364,6 +5366,8 @@ TRANS(USQADD_v, do_gvec_fn3, a, gen_gvec_usqadd_qc)
 
 TRANS(SSHL_v, do_gvec_fn3, a, gen_gvec_sshl)
 TRANS(USHL_v, do_gvec_fn3, a, gen_gvec_ushl)
+TRANS(SRSHL_v, do_gvec_fn3, a, gen_gvec_srshl)
+TRANS(URSHL_v, do_gvec_fn3, a, gen_gvec_urshl)
 
 
 /*
@@ -9384,13 +9388,6 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
             gen_helper_neon_qshl_s64(tcg_rd, tcg_env, tcg_rn, tcg_rm);
         }
         break;
-    case 0xa: /* SRSHL, URSHL */
-        if (u) {
-            gen_helper_neon_rshl_u64(tcg_rd, tcg_rn, tcg_rm);
-        } else {
-            gen_helper_neon_rshl_s64(tcg_rd, tcg_rn, tcg_rm);
-        }
-        break;
     case 0xb: /* SQRSHL, UQRSHL */
         if (u) {
             gen_helper_neon_qrshl_u64(tcg_rd, tcg_env, tcg_rn, tcg_rm);
@@ -9409,6 +9406,7 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
     case 0x1: /* SQADD / UQADD */
     case 0x5: /* SQSUB / UQSUB */
     case 0x8: /* SSHL, USHL */
+    case 0xa: /* SRSHL, URSHL */
         g_assert_not_reached();
     }
 }
@@ -9433,7 +9431,6 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
     case 0x9: /* SQSHL, UQSHL */
     case 0xb: /* SQRSHL, UQRSHL */
         break;
-    case 0xa: /* SRSHL, URSHL */
     case 0x6: /* CMGT, CMHI */
     case 0x7: /* CMGE, CMHS */
     case 0x11: /* CMTST, CMEQ */
@@ -9453,6 +9450,7 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
     case 0x1: /* SQADD, UQADD */
     case 0x5: /* SQSUB, UQSUB */
     case 0x8: /* SSHL, USHL */
+    case 0xa: /* SRSHL, URSHL */
         unallocated_encoding(s);
         return;
     }
@@ -10937,13 +10935,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x0a: /* SRSHL, URSHL */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_urshl, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_srshl, size);
-        }
-        return;
     case 0x0c: /* SMAX, UMAX */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umax, size);
@@ -11025,6 +11016,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     case 0x01: /* SQADD, UQADD */
     case 0x05: /* SQSUB, UQSUB */
     case 0x08: /* SSHL, USHL */
+    case 0x0a: /* SRSHL, URSHL */
         g_assert_not_reached();
     }
 
-- 
2.34.1

