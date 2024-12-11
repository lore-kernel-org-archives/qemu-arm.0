Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4192757njb;
        Wed, 11 Dec 2024 08:36:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUYiOfJEZbFVK1BE5LfxxHViysgoAV4KTdDK2aGEv8xZPo67OwzpvZ35MVRBgW9+BQn80C3cyeUzewMUQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGy4hcBbOquNLpOcR2e9MpUKHCpNgS3uae8yrkqXtPA5nTXSLYvKzJ80ZOO0ipStYvYhVbE
X-Received: by 2002:a05:622a:8e16:b0:467:62aa:c6d2 with SMTP id d75a77b69052e-46796154968mr207801cf.9.1733934980688;
        Wed, 11 Dec 2024 08:36:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733934980; cv=none;
        d=google.com; s=arc-20240605;
        b=H/otudJeqxaOfO4681hSRQRBxndNzQIoHpCphAtstpUYT8OaY4JzPK4vM2RDmtaxqN
         6xm7nW7EcefngLST3HnwT9QI3FKBQXRbyPr8QfhMArQS+mBXDqO4MTejfvpcfQFcbnPt
         0kPthz1Gd4rl8kl8+4qafnEPEbtZknYOEAERHuRp5a4PPjw1IyGXLYMf97oFApjEnXyt
         04QjdElJAyMz5lKdhdryDfZC0yrJPQobL1eTUk0MaSdK5zQI6wkFQw359jIfq4P4baRF
         QxRt5sSMfnH1YOWv3tUBjCjoW3CBSLEx3ISZTU1hPIY9PCuVuXJ+TXhYD8TBCoJ0Elp4
         malw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=h/K3BN4ky8bZxuSQ+h19SsWo+N7hIMh+9BAQx6Ku7aQ=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=kR4qXTJSI1QYe8ykH6HEZg3vI9Llzw1smDQTHsRZL6RGTmazV5pYJ+x8N997zXLB4i
         zxkuJSAOfR91SHszFTfd7qeaW8YT8ix1cT1l9D/Kphh0r+8DOk00KxhOfDbqK+oz0m8V
         XdthbgPII5v4ht6htHI9YfqctRrkZxnUDBftgQU6Fp2pO1geeWcvNwOyxesrcrHhsdpx
         yOhog80FS6JXH/e4v/6BNPXy30GvtJmZW29/MMFS4PNi3UGWLIVbPed6++Ebdh3vvqc7
         2hAlD5C6rNzMY2M9eUpq260GKjPjF2QGNlU7djOvTcwvHAhQr4DfDVVpbpTssvEsaGWl
         npYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W7mmeD+A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4676e2541e5si71656041cf.399.2024.12.11.08.36.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:36:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W7mmeD+A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPgj-0005kU-CV; Wed, 11 Dec 2024 11:35:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdg-00075n-01
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:40 -0500
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdd-0001Up-TI
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:39 -0500
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-467918c360aso5226941cf.0
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934757; x=1734539557; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h/K3BN4ky8bZxuSQ+h19SsWo+N7hIMh+9BAQx6Ku7aQ=;
 b=W7mmeD+AX1lu4/1R0yKS9wNo2DBRkeslk1qXiI8d9Of6CezkVnby0u61apJS8LyjiX
 5mkCM0C5SvzcQMiKPtGRicP/WwsbiTi39ug+d+ul5Nb5loxX/kYBB7zomIV9LSSVdOX4
 4ITYIBrkIs9U1fSh3u2fdLFvkEtFuw7W5QlxCIzW85jT5XcDoxVblmKjh40fyDn3vxIK
 NeL38N1Hwh0w1N3UIE4PIwA5UsrDjgkaFEzADizDf3oFIu9uX270G3UdDY+51Gyoxox3
 QY7pdGWC+JyF41RtxpQSKD6I/h6j1vOrAJU6wzy7tccjQSRnsgwcQRBVIghntC7+fFDw
 h20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934757; x=1734539557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h/K3BN4ky8bZxuSQ+h19SsWo+N7hIMh+9BAQx6Ku7aQ=;
 b=U8oRrBclI4y06z6LcC/xCNzJkTf20FKoWYqY4z+MgssNgw7IK58Q7bE4Xw+6aA7pnh
 hLQOCv5C9Cxxz3CZQ8WKsMDsJ5V9e13W+adn9SKU4tGjI6TfAiW6FNqTgIQkyXIqjMVu
 gkC0Gh4Ah0RDvlu2TCwnF3kNq11tj2k061lQ9uHFREJSlZbjRGKY5UUerTOvYCBLpLNg
 L9GyhYenWBg4sniQDP/sLoZBNdkp67+Oku/7LWmUCQDjq4of2n7U7CRwROM9gl6m0zab
 AIy/lkPSVFcZgXbiBLRSEYK+cpoCFbR0lgBOVfhxeWlwDgMsnlA1dzoXSE+Jm49432C/
 4mFQ==
X-Gm-Message-State: AOJu0YxvBnkNHnkaV1pSYvmUiYW1DNeWDKKdiwxb2Uj/mdwiO7IVNRoN
 rf0VNBShUqWfTQx5vnSbMq6nptQ2xb2RWNgDdtJRdts22MR7aKJo6/04Jbide3A=
X-Gm-Gg: ASbGnctYJq8Z1aE4/PsdmAFdXRLLAEVQSN1+iQpPOR9oI4zXPbWq/yJzHypxt/ZUvTw
 aACgOmilsfBIy3d4VODl9HDFZQKS22ar+fmEzOYDkPfWlXn5wGUbN3Qws4RCb9kFgAKet9PWWpN
 V/RdpKtEZYxin7JSU2Sd+Cx5hZ7gnHHPzz41wQdC2cGfGZ51QFOaI+GOEckhH9ZBt4ceU8/v2ao
 VR/feht4TJNH3CpVP0xiMgqiPZzYSRy/K7OPWDXlcX58Znghos5af80pHVB0Q==
X-Received: by 2002:a05:622a:1194:b0:466:b1a2:c03a with SMTP id
 d75a77b69052e-46795422301mr6952621cf.37.1733934756893; 
 Wed, 11 Dec 2024 08:32:36 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:32:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 39/69] target/arm: Introduce gen_gvec_cnt, gen_gvec_rbit
Date: Wed, 11 Dec 2024 10:30:06 -0600
Message-ID: <20241211163036.2297116-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
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
X-TUID: tUdmqq2kFwj2

Add gvec interfaces for CNT and RBIT operations.
Use ctpop8 for CNT and revbit+bswap for RBIT.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h             |  4 ++--
 target/arm/tcg/translate.h      |  4 ++++
 target/arm/tcg/gengvec.c        | 16 ++++++++++++++++
 target/arm/tcg/neon_helper.c    | 21 ---------------------
 target/arm/tcg/translate-a64.c  | 32 +++++++++-----------------------
 target/arm/tcg/translate-neon.c | 16 ++++++++--------
 target/arm/tcg/vec_helper.c     | 24 ++++++++++++++++++++++++
 7 files changed, 63 insertions(+), 54 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 0a697e752b..167e331a83 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -363,8 +363,8 @@ DEF_HELPER_1(neon_clz_u16, i32, i32)
 DEF_HELPER_1(neon_cls_s8, i32, i32)
 DEF_HELPER_1(neon_cls_s16, i32, i32)
 DEF_HELPER_1(neon_cls_s32, i32, i32)
-DEF_HELPER_1(neon_cnt_u8, i32, i32)
-DEF_HELPER_FLAGS_1(neon_rbit_u8, TCG_CALL_NO_RWG_SE, i32, i32)
+DEF_HELPER_FLAGS_3(gvec_cnt_b, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_rbit_b, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
 DEF_HELPER_3(neon_qdmulh_s16, i32, env, i32, i32)
 DEF_HELPER_3(neon_qrdmulh_s16, i32, env, i32, i32)
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 5c6c24f057..cb8e1b2586 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -582,6 +582,10 @@ void gen_gvec_cls(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                   uint32_t opr_sz, uint32_t max_sz);
 void gen_gvec_clz(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                   uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_cnt(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                  uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_rbit(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                   uint32_t opr_sz, uint32_t max_sz);
 
 /*
  * Forward to the isar_feature_* tests given a DisasContext pointer.
diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index 834b2961c0..85a0b50496 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -2393,3 +2393,19 @@ void gen_gvec_clz(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     assert(vece <= MO_32);
     tcg_gen_gvec_2(rd_ofs, rn_ofs, opr_sz, max_sz, &g[vece]);
 }
+
+void gen_gvec_cnt(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                  uint32_t opr_sz, uint32_t max_sz)
+{
+    assert(vece == MO_8);
+    tcg_gen_gvec_2_ool(rd_ofs, rn_ofs, opr_sz, max_sz, 0,
+                       gen_helper_gvec_cnt_b);
+}
+
+void gen_gvec_rbit(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                  uint32_t opr_sz, uint32_t max_sz)
+{
+    assert(vece == MO_8);
+    tcg_gen_gvec_2_ool(rd_ofs, rn_ofs, opr_sz, max_sz, 0,
+                       gen_helper_gvec_rbit_b);
+}
diff --git a/target/arm/tcg/neon_helper.c b/target/arm/tcg/neon_helper.c
index 93b2076c64..4e501925de 100644
--- a/target/arm/tcg/neon_helper.c
+++ b/target/arm/tcg/neon_helper.c
@@ -525,27 +525,6 @@ uint32_t HELPER(neon_cls_s32)(uint32_t x)
     return count - 1;
 }
 
-/* Bit count.  */
-uint32_t HELPER(neon_cnt_u8)(uint32_t x)
-{
-    x = (x & 0x55555555) + ((x >>  1) & 0x55555555);
-    x = (x & 0x33333333) + ((x >>  2) & 0x33333333);
-    x = (x & 0x0f0f0f0f) + ((x >>  4) & 0x0f0f0f0f);
-    return x;
-}
-
-/* Reverse bits in each 8 bit word */
-uint32_t HELPER(neon_rbit_u8)(uint32_t x)
-{
-    x =  ((x & 0xf0f0f0f0) >> 4)
-       | ((x & 0x0f0f0f0f) << 4);
-    x =  ((x & 0x88888888) >> 3)
-       | ((x & 0x44444444) >> 1)
-       | ((x & 0x22222222) << 1)
-       | ((x & 0x11111111) << 3);
-    return x;
-}
-
 #define NEON_QDMULH16(dest, src1, src2, round) do { \
     uint32_t tmp = (int32_t)(int16_t) src1 * (int16_t) src2; \
     if ((tmp ^ (tmp << 1)) & SIGNBIT) { \
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ecb4578998..3e0c061b3c 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10324,12 +10324,15 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x5:
-        if (u && size == 0) { /* NOT */
+    case 0x5: /* CNT, NOT, RBIT */
+        if (!u) {
+            gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_cnt, 0);
+        } else if (size) {
+            gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_rbit, 0);
+        } else {
             gen_gvec_fn2(s, is_q, rd, rn, tcg_gen_gvec_not, 0);
-            return;
         }
-        break;
+        return;
     case 0x8: /* CMGT, CMGE */
         if (u) {
             gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_cge0, size);
@@ -10374,13 +10377,14 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     } else {
         int pass;
 
+        assert(size == 2);
         for (pass = 0; pass < (is_q ? 4 : 2); pass++) {
             TCGv_i32 tcg_op = tcg_temp_new_i32();
             TCGv_i32 tcg_res = tcg_temp_new_i32();
 
             read_vec_element_i32(s, tcg_op, rn, pass, MO_32);
 
-            if (size == 2) {
+            {
                 /* Special cases for 32 bit elements */
                 switch (opcode) {
                 case 0x2f: /* FABS */
@@ -10434,25 +10438,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
                 case 0x7: /* SQABS, SQNEG */
                     g_assert_not_reached();
                 }
-            } else {
-                /* Use helpers for 8 and 16 bit elements */
-                switch (opcode) {
-                case 0x5: /* CNT, RBIT */
-                    /* For these two insns size is part of the opcode specifier
-                     * (handled earlier); they always operate on byte elements.
-                     */
-                    if (u) {
-                        gen_helper_neon_rbit_u8(tcg_res, tcg_op);
-                    } else {
-                        gen_helper_neon_cnt_u8(tcg_res, tcg_op);
-                    }
-                    break;
-                default:
-                case 0x7: /* SQABS, SQNEG */
-                    g_assert_not_reached();
-                }
             }
-
             write_vec_element_i32(s, tcg_res, rd, pass, MO_32);
         }
     }
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index 1c89a53272..50d0bf7753 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -3131,6 +3131,14 @@ static bool trans_VMVN(DisasContext *s, arg_2misc *a)
     return do_2misc_vec(s, a, tcg_gen_gvec_not);
 }
 
+static bool trans_VCNT(DisasContext *s, arg_2misc *a)
+{
+    if (a->size != 0) {
+        return false;
+    }
+    return do_2misc_vec(s, a, gen_gvec_cnt);
+}
+
 #define WRAP_2M_3_OOL_FN(WRAPNAME, FUNC, DATA)                          \
     static void WRAPNAME(unsigned vece, uint32_t rd_ofs,                \
                          uint32_t rm_ofs, uint32_t oprsz,               \
@@ -3229,14 +3237,6 @@ static bool trans_VREV16(DisasContext *s, arg_2misc *a)
     return do_2misc(s, a, gen_rev16);
 }
 
-static bool trans_VCNT(DisasContext *s, arg_2misc *a)
-{
-    if (a->size != 0) {
-        return false;
-    }
-    return do_2misc(s, a, gen_helper_neon_cnt_u8);
-}
-
 static void gen_VABS_F(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
                        uint32_t oprsz, uint32_t maxsz)
 {
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index e825d501a2..60381258cf 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -3072,3 +3072,27 @@ DO_CLAMP(gvec_uclamp_b, uint8_t)
 DO_CLAMP(gvec_uclamp_h, uint16_t)
 DO_CLAMP(gvec_uclamp_s, uint32_t)
 DO_CLAMP(gvec_uclamp_d, uint64_t)
+
+/* Bit count in each 8-bit word. */
+void HELPER(gvec_cnt_b)(void *vd, void *vn, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint8_t *d = vd, *n = vn;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = ctpop8(n[i]);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+/* Reverse bits in each 8 bit word */
+void HELPER(gvec_rbit_b)(void *vd, void *vn, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint64_t *d = vd, *n = vn;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        d[i] = revbit64(bswap64(n[i]));
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
-- 
2.43.0

