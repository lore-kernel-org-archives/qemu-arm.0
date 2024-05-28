Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp190034ejk;
        Tue, 28 May 2024 13:33:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUy24Tyobmtl0YhUK3Igb/I1faPT1K3CmTY+M2JVsbeVMM4QFnJfXgjRExPjVzaNtztCUIHOldnL0ThOBlYE+L0SNvclIbb
X-Google-Smtp-Source: AGHT+IEAeYQHCx7YfW/W8JGY9pdraOB9qzzoiNNtW329QkU9X6JNUDwQNyv67FlWRe7HcyII+Fz4
X-Received: by 2002:a05:620a:2455:b0:792:8e98:d03f with SMTP id af79cd13be357-794ab11f6d9mr1674203585a.52.1716928411450;
        Tue, 28 May 2024 13:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716928411; cv=none;
        d=google.com; s=arc-20160816;
        b=tav5RPLc52uhHOG7tIDsjjZUVeTy7XJLXys4+Y1LiY1lS/C8lhKchsxVK2vFxw5lfo
         4Y8UnhNd6la9WMGBDJONYEbNpT1zC8+ofkjbmaqsgKC9RmmUcYIqJoDEUeFrs7R9EHDw
         OkvcCn3k1OPARNLCkqc2uBPcmysdDzr1i+sURrMB7AGmQWjHfwtaaQw6XPp1wlDGB9ES
         OJguf/wG+LhuDcYNnxWKg+hN+WjBP9NTMU/njwp9o8lgHVwY2NZ4OK50x+xLxRB/+Hrg
         jhNptm80O/qBB5m+XNDJ0kZ8oJiEzqtYEMPqHUdF5Iah/OMyFk9CQH3Oy3hIe1ZIN5cy
         WElg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=v3u0NIcjJaCXt8eImr5sw/MAeHwzG218Whsvo5wTKgM=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=hdtpxqHuU+yuU7AJ3hMIJk4jdKi7bNIMqlt/KpM+MaJXSCdwHD2mFVa2blkOubMm7H
         eRkI0FARJjUPvmGyJiJi5QN5FUIiRCBRl2MVIIokIwqcNJlP/iFWxM8w5pEl5+ruiLG7
         bA/0vXG0OYI4RagCKYE0Z6Vi0sqfW8hKkGdCGXWmDwS4r8FZGN02ix6hFaliXrdKNJUv
         aMxtM4G8A60cone5PmR2W6w1ru1aozxhep6XRrym1lgWfwS/V08T1M19EHoksg0oTZ99
         JwZycImnnpOXleUyFuQ+A5PVefdXgJ3cKpCe/q9/j5UY3X1ShKptQxZuW6MaPDQ5Wn39
         kL+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SM9pUZJC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abcc74aesi1089776385a.180.2024.05.28.13.33.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 13:33:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SM9pUZJC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sC3Te-00033x-6T; Tue, 28 May 2024 16:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC3TP-0002pp-6D
 for qemu-devel@nongnu.org; Tue, 28 May 2024 16:31:08 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC3TC-0003aS-7N
 for qemu-devel@nongnu.org; Tue, 28 May 2024 16:31:05 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6f8edddf756so1059393b3a.3
 for <qemu-devel@nongnu.org>; Tue, 28 May 2024 13:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716928253; x=1717533053; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v3u0NIcjJaCXt8eImr5sw/MAeHwzG218Whsvo5wTKgM=;
 b=SM9pUZJCqyzflL9cjjkq5N6nz+yuCGSUcvcjKUi9vqqP3flN3b+c6h4hV15beEypxl
 r0w2I3e0SWDPSmcQrtKfYSi0iebGwSPxd2DuV7kZXVUA+2v8wAFd3bxllwGkXHIF/cdU
 ZB+Kc/IpYP4q0BSrMlA/6vSGjvSZhPXClX9UwlbwpzQvpXFVTKDSKlou4j3lR/LA3Mtz
 ROrix4pOiRRJcxUgwl9IN/IqcFeyylWOQl1E84qgLy2iwhDG5ovK2v8mGyMgTWdsE1Jj
 I3EmokvyxO4LZQ2wS+fx+uRwSm+J6p/JhK8nEoInGnay3eWBca1HFIPIkhfd+EKz5Dxf
 afpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716928253; x=1717533053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v3u0NIcjJaCXt8eImr5sw/MAeHwzG218Whsvo5wTKgM=;
 b=N1mogXdURcpZkwlCeBEuN6oF0LQcHmOk0tZOoePUjeW0EOmyoVxXapqLinor1aSouU
 SkM6BjbzMGVIbB2pMSqYHBKcub/6oX5GHb4lRxYC0UTzXb3Gzr9yYtwx2Hxtld3ZhAoc
 8Cc0S1qoqs9E5wBljtwFeoFXLisJef93eW47TP0tAhL0eoROjAxkR/z6Qxmp4Ruj4HBr
 XkqarWVcgzbax8BN8eq/KhSlmO/DdV3EIRxEw8mhbzzB83I6/tgxXpHDGHevdf6SdPl0
 sc5JrKiJvIZq7ZkUV3X4hMpOKDeC3ovTXOmgB5yLRAch+pPtj9AuadOFwLwC1gP041CW
 MoWA==
X-Gm-Message-State: AOJu0YyJQaiPUVqTO5f/xlq+lelhUXixGU3/Xl7l1JgXVFTELMqm5FaP
 +YYXZYXx1zOuNMprj1Fn+JaTYHbU+hsKDxLojS9n6PIZ41WRKIUdebVX36sZzXI3aOOb59kXljK
 C
X-Received: by 2002:a05:6a00:f90:b0:6ea:b818:f499 with SMTP id
 d2e1a72fcca58-6f8f34bcc6bmr18657596b3a.19.1716928252934; 
 Tue, 28 May 2024 13:30:52 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbd3dbe9sm7042036b3a.10.2024.05.28.13.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 13:30:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 08/33] target/arm: Convert SUQADD, USQADD to decodetree
Date: Tue, 28 May 2024 13:30:19 -0700
Message-Id: <20240528203044.612851-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240528203044.612851-1-richard.henderson@linaro.org>
References: <20240528203044.612851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: TEg8DZxRqDik

These are faux 2-operand instructions, reading from rd.
Sort them next to the other three-operand same insns for clarity.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  8 +++++
 target/arm/tcg/translate-a64.c | 64 ++++------------------------------
 2 files changed, 14 insertions(+), 58 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 19010af03b..7c350ba833 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -45,6 +45,7 @@
 @rrr_sd         ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=%esz_sd
 @rrr_hsd        ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=%esz_hsd
 @rrr_e          ........ esz:2 . rm:5 ...... rn:5 rd:5  &rrr_e
+@r2r_e          ........ esz:2 . ..... ...... rm:5 rd:5 &rrr_e rn=%rd
 
 @rrx_h          ........ .. .. rm:4 .... . . rn:5 rd:5  &rrx_e esz=1 idx=%hlm
 @rrx_s          ........ .. . rm:5  .... . . rn:5 rd:5  &rrx_e esz=2 idx=%hl
@@ -60,6 +61,7 @@
 @qrrr_h         . q:1 ...... ... rm:5 ...... rn:5 rd:5  &qrrr_e esz=1
 @qrrr_sd        . q:1 ...... ... rm:5 ...... rn:5 rd:5  &qrrr_e esz=%esz_sd
 @qrrr_e         . q:1 ...... esz:2 . rm:5 ...... rn:5 rd:5  &qrrr_e
+@qr2r_e         . q:1 ...... esz:2 . ..... ...... rm:5 rd:5 &qrrr_e rn=%rd
 
 @qrrx_h         . q:1 .. .... .. .. rm:4 .... . . rn:5 rd:5 \
                 &qrrx_e esz=1 idx=%hlm
@@ -750,6 +752,9 @@ UQADD_s         0111 1110 ..1 ..... 00001 1 ..... ..... @rrr_e
 SQSUB_s         0101 1110 ..1 ..... 00101 1 ..... ..... @rrr_e
 UQSUB_s         0111 1110 ..1 ..... 00101 1 ..... ..... @rrr_e
 
+SUQADD_s        0101 1110 ..1 00000 00111 0 ..... ..... @r2r_e
+USQADD_s        0111 1110 ..1 00000 00111 0 ..... ..... @r2r_e
+
 ### Advanced SIMD scalar pairwise
 
 FADDP_s         0101 1110 0011 0000 1101 10 ..... ..... @rr_h
@@ -868,6 +873,9 @@ UQADD_v         0.10 1110 ..1 ..... 00001 1 ..... ..... @qrrr_e
 SQSUB_v         0.00 1110 ..1 ..... 00101 1 ..... ..... @qrrr_e
 UQSUB_v         0.10 1110 ..1 ..... 00101 1 ..... ..... @qrrr_e
 
+SUQADD_v        0.00 1110 ..1 00000 00111 0 ..... ..... @qr2r_e
+USQADD_v        0.10 1110 ..1 00000 00111 0 ..... ..... @qr2r_e
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 3956c41543..c0637bda0f 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5096,6 +5096,8 @@ TRANS(SQADD_s, do_satacc_s, a, MO_SIGN, MO_SIGN, gen_sqadd_bhs, gen_sqadd_d)
 TRANS(SQSUB_s, do_satacc_s, a, MO_SIGN, MO_SIGN, gen_sqsub_bhs, gen_sqsub_d)
 TRANS(UQADD_s, do_satacc_s, a, 0, 0, gen_uqadd_bhs, gen_uqadd_d)
 TRANS(UQSUB_s, do_satacc_s, a, 0, 0, gen_uqsub_bhs, gen_uqsub_d)
+TRANS(SUQADD_s, do_satacc_s, a, MO_SIGN, 0, gen_suqadd_bhs, gen_suqadd_d)
+TRANS(USQADD_s, do_satacc_s, a, 0, MO_SIGN, gen_usqadd_bhs, gen_usqadd_d)
 
 static bool do_fp3_vector(DisasContext *s, arg_qrrr_e *a,
                           gen_helper_gvec_3_ptr * const fns[3])
@@ -5339,6 +5341,8 @@ TRANS(SQADD_v, do_gvec_fn3, a, gen_gvec_sqadd_qc)
 TRANS(UQADD_v, do_gvec_fn3, a, gen_gvec_uqadd_qc)
 TRANS(SQSUB_v, do_gvec_fn3, a, gen_gvec_sqsub_qc)
 TRANS(UQSUB_v, do_gvec_fn3, a, gen_gvec_uqsub_qc)
+TRANS(SUQADD_v, do_gvec_fn3, a, gen_gvec_suqadd_qc)
+TRANS(USQADD_v, do_gvec_fn3, a, gen_gvec_usqadd_qc)
 
 /*
  * Advanced SIMD scalar/vector x indexed element
@@ -10009,48 +10013,6 @@ static void handle_2misc_narrow(DisasContext *s, bool scalar,
     clear_vec_high(s, is_q, rd);
 }
 
-/* Remaining saturating accumulating ops */
-static void handle_2misc_satacc(DisasContext *s, bool is_scalar, bool is_u,
-                                bool is_q, unsigned size, int rn, int rd)
-{
-    TCGv_i64 res, qc, a, b;
-
-    if (!is_scalar) {
-        gen_gvec_fn3(s, is_q, rd, rd, rn,
-                     is_u ? gen_gvec_usqadd_qc : gen_gvec_suqadd_qc, size);
-        return;
-    }
-
-    res = tcg_temp_new_i64();
-    qc = tcg_temp_new_i64();
-    a = tcg_temp_new_i64();
-    b = tcg_temp_new_i64();
-
-    /* Read and extend scalar inputs to 64-bits. */
-    read_vec_element(s, a, rd, 0, size | (is_u ? 0 : MO_SIGN));
-    read_vec_element(s, b, rn, 0, size | (is_u ? MO_SIGN : 0));
-    tcg_gen_ld_i64(qc, tcg_env, offsetof(CPUARMState, vfp.qc));
-
-    if (size == MO_64) {
-        if (is_u) {
-            gen_usqadd_d(res, qc, a, b);
-        } else {
-            gen_suqadd_d(res, qc, a, b);
-        }
-    } else {
-        if (is_u) {
-            gen_usqadd_bhs(res, qc, a, b, size);
-        } else {
-            gen_suqadd_bhs(res, qc, a, b, size);
-            /* Truncate signed 64-bit result for writeback. */
-            tcg_gen_ext_i64(res, res, size);
-        }
-    }
-
-    write_fp_dreg(s, rd, res);
-    tcg_gen_st_i64(qc, tcg_env, offsetof(CPUARMState, vfp.qc));
-}
-
 /* AdvSIMD scalar two reg misc
  *  31 30  29 28       24 23  22 21       17 16    12 11 10 9    5 4    0
  * +-----+---+-----------+------+-----------+--------+-----+------+------+
@@ -10070,12 +10032,6 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     TCGv_ptr tcg_fpstatus;
 
     switch (opcode) {
-    case 0x3: /* USQADD / SUQADD*/
-        if (!fp_access_check(s)) {
-            return;
-        }
-        handle_2misc_satacc(s, true, u, false, size, rn, rd);
-        return;
     case 0x7: /* SQABS / SQNEG */
         break;
     case 0xa: /* CMLT */
@@ -10175,6 +10131,7 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
         }
         break;
     default:
+    case 0x3: /* USQADD / SUQADD */
         unallocated_encoding(s);
         return;
     }
@@ -11662,16 +11619,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
             return;
         }
         break;
-    case 0x3: /* SUQADD, USQADD */
-        if (size == 3 && !is_q) {
-            unallocated_encoding(s);
-            return;
-        }
-        if (!fp_access_check(s)) {
-            return;
-        }
-        handle_2misc_satacc(s, false, u, is_q, size, rn, rd);
-        return;
     case 0x7: /* SQABS, SQNEG */
         if (size == 3 && !is_q) {
             unallocated_encoding(s);
@@ -11846,6 +11793,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         break;
     }
     default:
+    case 0x3: /* SUQADD, USQADD */
         unallocated_encoding(s);
         return;
     }
-- 
2.34.1

