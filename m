Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1267539lfm;
        Wed, 17 Jun 2020 21:40:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxAv2YVjHASHWyWGEy8s9QhBv836HwWjToJz6s4WDsm3tpGOw72qCIxWyXOOT5jpgYv4rj
X-Received: by 2002:a25:7313:: with SMTP id o19mr3465966ybc.458.1592455258952;
        Wed, 17 Jun 2020 21:40:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592455258; cv=none;
        d=google.com; s=arc-20160816;
        b=BEFm87q+utkCPqPa5UbKk0oWHEUfqXl6v89lrOQOBQN52lRYlsl6zEm3i5DzGD6cGz
         nZIC1JdR4qI0Rq8WeGl4TuI9hsxv1j1O2sufWc0btk9jK2arD6YJFbT2ihhrmviHbwsZ
         GxB0MZtuUHMCX6A86fwRnBkmNDVumZcFo/qcV1L/1UOVOlJqp3UK+F+/K5HsIcpIgPjm
         YcJFylKf/pibGx3b/KLxnGBV1kmtOMXz0wW3bmQuzl9BhYzE6QAKFA4K90zizjIoAw3x
         Wh6UA+y/zKf05lglqcqlh+kvajdCSzAmAdN57asLW+JgS1bpY+x1yzQgRQwOw6Xl4rnp
         gkag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wUFQUDKhxur5vl70N1hNn8LMABDJdR0uRxSl1YMclno=;
        b=m+TEJwsS87jMyCC0PrLKCWOB0JSliqpFeiBzP7KjC8VSdgCUdordW+5MzSGMLToqmI
         Ko+shimLvl9IMtrl+kj+2ZYsNPsqsZm1JTH2CBQIU5JrQ5nNHF/LV3y64oLS3f9K58ju
         CEfFtfTjklhhPanoYBGVf9/ya9LqeJf/sHGaOsAl6pTcsYYXpgRyIUyg87d/cU20RVwl
         DD81euQ4+m31uHP9/G1q+Z3lYdxwrJgVv6HVXfrqw8omH+8B9kfEyVQu1ydJuyMk87ZR
         iHO7e2lyy17fpskpWEpqaWUwfawuwTPQRnJfXmsVHjhJ6iE9xxQjeHi57vRLy6MBcSLS
         Zsmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MmpQMkTK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l2si2326310ybt.63.2020.06.17.21.40.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:40:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MmpQMkTK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmME-0004S1-9h
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmAi-00064R-Ic
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:29:04 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:33138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmAe-0002oc-1a
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:29:04 -0400
Received: by mail-pf1-x444.google.com with SMTP id b201so2212818pfb.0
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wUFQUDKhxur5vl70N1hNn8LMABDJdR0uRxSl1YMclno=;
 b=MmpQMkTKjr6riv/9XBTFVURtqSRXAX+zJPsvDM8hHaZl+l4PS47XQ3KlSlrq3/EUU5
 Z69+3u6xwU2tArGukTMxTlq/2ls92ZbWOX6CdpBzORMJNERfAWXvQaU/ZCdeGssCuT72
 erWQdNf12ZO33A+lHjQfdlEq6sjsV9nRpBAqDOtXyFIgRudDEwkMvwWg72DBA+Budvd+
 iqMas54aJflvhwE4qZnGdiZcLC97YS2CMOI3HlzdGPLcCAaRVYGhIdJnoas9aWzSNCvM
 3c721bz46k88ZaBOQX+Y/9x+G6QXIezciu1z9zPiDSBH8ZxblasSIDR5iqjwddiFLdyA
 Q0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wUFQUDKhxur5vl70N1hNn8LMABDJdR0uRxSl1YMclno=;
 b=tytMN2GmID+cl4yQ2yIobk3G2Rt1enpNyMiKT6zx6wYNcho9krFDU5bSan8hJ7MpAe
 NF9ZLL+enA0apzGK7JY64fIJqEfWQMGJjecnounRus/VfIMcZjvbTAyQAcfFTsIFTO+H
 rfUtRoSHr4vuDC7qRBEgjqIr3pYqBx09exG6UA0Pi6e5UYiKtVD93gYPhs/sLras7l4H
 LDMTAPp/RRPNjr/yaKbWvhXMN8QXQgN0kmh7CU1CHWQo2XQBSW0xbVENAi64PP/XlctJ
 9whv7+Hvgeg0jTpfN7n2RhOD05PiDVXrZRczUPS9cMTsxTrFYJDHaehZFZxPEOexvFpV
 ItCg==
X-Gm-Message-State: AOAM533iFaXRNaqUGs0jcjRRBI051Zk8OTY1+eo2+x0SQn+X8CimicPb
 Ts76n3Zdr6J/3D9iFO2gfusm2Q==
X-Received: by 2002:aa7:96b0:: with SMTP id g16mr1991361pfk.126.1592454538440; 
 Wed, 17 Jun 2020 21:28:58 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id mu17sm972324pjb.53.2020.06.17.21.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:28:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 030/100] target/arm: Implement SVE2 bitwise shift left long
Date: Wed, 17 Jun 2020 21:25:34 -0700
Message-Id: <20200618042644.1685561-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H3gx2WrHxtZw

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |   8 ++
 target/arm/sve.decode      |   8 ++
 target/arm/sve_helper.c    |  26 ++++++
 target/arm/translate-sve.c | 159 +++++++++++++++++++++++++++++++++++++
 4 files changed, 201 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index e7b539df21..7cd75150e0 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1876,3 +1876,11 @@ DEF_HELPER_FLAGS_4(sve2_umull_zzz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(sve2_pmull_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_pmull_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sshll_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sshll_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sshll_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_ushll_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_ushll_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_ushll_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 417b11fdd5..851b336c7b 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1207,3 +1207,11 @@ SMULLB_zzz      01000101 .. 0 ..... 011 100 ..... .....  @rd_rn_rm
 SMULLT_zzz      01000101 .. 0 ..... 011 101 ..... .....  @rd_rn_rm
 UMULLB_zzz      01000101 .. 0 ..... 011 110 ..... .....  @rd_rn_rm
 UMULLT_zzz      01000101 .. 0 ..... 011 111 ..... .....  @rd_rn_rm
+
+## SVE2 bitwise shift left long
+
+# Note bit23 == 0 is handled by esz > 0 in do_sve2_shll_tb.
+SSHLLB          01000101 .. 0 ..... 1010 00 ..... .....  @rd_rn_tszimm_shl
+SSHLLT          01000101 .. 0 ..... 1010 01 ..... .....  @rd_rn_tszimm_shl
+USHLLB          01000101 .. 0 ..... 1010 10 ..... .....  @rd_rn_tszimm_shl
+USHLLT          01000101 .. 0 ..... 1010 11 ..... .....  @rd_rn_tszimm_shl
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index cb2c425104..670fd4ed15 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -625,6 +625,8 @@ DO_ZPZZ(sve2_sqrshl_zpzz_h, int16_t, H1_2, do_sqrshl_h)
 DO_ZPZZ(sve2_sqrshl_zpzz_s, int32_t, H1_4, do_sqrshl_s)
 DO_ZPZZ_D(sve2_sqrshl_zpzz_d, int64_t, do_sqrshl_d)
 
+#undef do_sqrshl_d
+
 #define do_uqrshl_b(n, m) \
    ({ uint32_t discard; do_uqrshl_bhs(n, (int8_t)m, 8, true, &discard); })
 #define do_uqrshl_h(n, m) \
@@ -639,6 +641,8 @@ DO_ZPZZ(sve2_uqrshl_zpzz_h, uint16_t, H1_2, do_uqrshl_h)
 DO_ZPZZ(sve2_uqrshl_zpzz_s, uint32_t, H1_4, do_uqrshl_s)
 DO_ZPZZ_D(sve2_uqrshl_zpzz_d, uint64_t, do_uqrshl_d)
 
+#undef do_uqrshl_d
+
 #define DO_HADD_BHS(n, m)  (((int64_t)n + m) >> 1)
 #define DO_HADD_D(n, m)    ((n >> 1) + (m >> 1) + (n & m & 1))
 
@@ -1217,6 +1221,28 @@ DO_ZZZ_WTB(sve2_usubw_d, uint64_t, uint32_t,     , H1_4, DO_SUB)
 
 #undef DO_ZZZ_WTB
 
+#define DO_ZZI_SHLL(NAME, TYPEW, TYPEN, HW, HN) \
+void HELPER(NAME)(void *vd, void *vn, uint32_t desc)           \
+{                                                              \
+    intptr_t i, opr_sz = simd_oprsz(desc);                     \
+    intptr_t sel = (simd_data(desc) & 1) * sizeof(TYPEN);      \
+    int shift = simd_data(desc) >> 1;                          \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {              \
+        TYPEW nn = *(TYPEN *)(vn + HN(i + sel));               \
+        *(TYPEW *)(vd + HW(i)) = nn << shift;                  \
+    }                                                          \
+}
+
+DO_ZZI_SHLL(sve2_sshll_h, int16_t, int8_t, H1_2, H1)
+DO_ZZI_SHLL(sve2_sshll_s, int32_t, int16_t, H1_4, H1_2)
+DO_ZZI_SHLL(sve2_sshll_d, int64_t, int32_t,     , H1_4)
+
+DO_ZZI_SHLL(sve2_ushll_h, uint16_t, uint8_t, H1_2, H1)
+DO_ZZI_SHLL(sve2_ushll_s, uint32_t, uint16_t, H1_4, H1_2)
+DO_ZZI_SHLL(sve2_ushll_d, uint64_t, uint32_t,     , H1_4)
+
+#undef DO_ZZI_SHLL
+
 /* Two-operand reduction expander, controlled by a predicate.
  * The difference between TYPERED and TYPERET has to do with
  * sign-extension.  E.g. for SMAX, TYPERED must be signed,
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index db2081130d..ef212b01f1 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5637,3 +5637,162 @@ DO_SVE2_ZZZ_WTB(UADDWB, uaddw, false)
 DO_SVE2_ZZZ_WTB(UADDWT, uaddw, true)
 DO_SVE2_ZZZ_WTB(USUBWB, usubw, false)
 DO_SVE2_ZZZ_WTB(USUBWT, usubw, true)
+
+static void gen_sshll_vec(unsigned vece, TCGv_vec d, TCGv_vec n, int64_t imm)
+{
+    int top = imm & 1;
+    int shl = imm >> 1;
+    int halfbits = 4 << vece;
+
+    if (top) {
+        if (shl == halfbits) {
+            TCGv_vec t = tcg_temp_new_vec_matching(d);
+            tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(halfbits, halfbits));
+            tcg_gen_and_vec(vece, d, n, t);
+            tcg_temp_free_vec(t);
+        } else {
+            tcg_gen_sari_vec(vece, d, n, halfbits);
+            tcg_gen_shli_vec(vece, d, d, shl);
+        }
+    } else {
+        tcg_gen_shli_vec(vece, d, n, halfbits);
+        tcg_gen_sari_vec(vece, d, d, halfbits - shl);
+    }
+}
+
+static void gen_ushll_i64(unsigned vece, TCGv_i64 d, TCGv_i64 n, int imm)
+{
+    int halfbits = 4 << vece;
+    int top = imm & 1;
+    int shl = (imm >> 1);
+    int shift;
+    uint64_t mask;
+
+    mask = MAKE_64BIT_MASK(0, halfbits);
+    mask <<= shl;
+    mask = dup_const(vece, mask);
+
+    shift = shl - top * halfbits;
+    if (shift < 0) {
+        tcg_gen_shri_i64(d, n, -shift);
+    } else {
+        tcg_gen_shri_i64(d, n, shift);
+    }
+    tcg_gen_andi_i64(d, d, mask);
+}
+
+static void gen_ushll16_i64(TCGv_i64 d, TCGv_i64 n, int64_t imm)
+{
+    gen_ushll_i64(MO_16, d, n, imm);
+}
+
+static void gen_ushll32_i64(TCGv_i64 d, TCGv_i64 n, int64_t imm)
+{
+    gen_ushll_i64(MO_32, d, n, imm);
+}
+
+static void gen_ushll64_i64(TCGv_i64 d, TCGv_i64 n, int64_t imm)
+{
+    gen_ushll_i64(MO_64, d, n, imm);
+}
+
+static void gen_ushll_vec(unsigned vece, TCGv_vec d, TCGv_vec n, int64_t imm)
+{
+    int halfbits = 4 << vece;
+    int top = imm & 1;
+    int shl = imm >> 1;
+
+    if (top) {
+        if (shl == halfbits) {
+            TCGv_vec t = tcg_temp_new_vec_matching(d);
+            tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(halfbits, halfbits));
+            tcg_gen_and_vec(vece, d, n, t);
+            tcg_temp_free_vec(t);
+        } else {
+            tcg_gen_shri_vec(vece, d, n, halfbits);
+            tcg_gen_shli_vec(vece, d, d, shl);
+        }
+    } else {
+        if (shl == 0) {
+            TCGv_vec t = tcg_temp_new_vec_matching(d);
+            tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
+            tcg_gen_and_vec(vece, d, n, t);
+            tcg_temp_free_vec(t);
+        } else {
+            tcg_gen_shli_vec(vece, d, n, halfbits);
+            tcg_gen_shri_vec(vece, d, d, halfbits - shl);
+        }
+    }
+}
+
+static bool do_sve2_shll_tb(DisasContext *s, arg_rri_esz *a,
+                            bool sel, bool uns)
+{
+    static const TCGOpcode sshll_list[] = { 
+        INDEX_op_shli_vec, INDEX_op_sari_vec, 0
+    };
+    static const TCGOpcode ushll_list[] = { 
+        INDEX_op_shli_vec, INDEX_op_shri_vec, 0
+    };
+    static const GVecGen2i ops[2][3] = {
+        { { .fniv = gen_sshll_vec, 
+            .opt_opc = sshll_list,
+            .fno = gen_helper_sve2_sshll_h,
+            .vece = MO_16 },
+          { .fniv = gen_sshll_vec, 
+            .opt_opc = sshll_list,
+            .fno = gen_helper_sve2_sshll_s,
+            .vece = MO_32 },
+          { .fniv = gen_sshll_vec, 
+            .opt_opc = sshll_list,
+            .fno = gen_helper_sve2_sshll_d,
+            .vece = MO_64 } },
+        { { .fni8 = gen_ushll16_i64,
+            .fniv = gen_ushll_vec,
+            .opt_opc = ushll_list,
+            .fno = gen_helper_sve2_ushll_h,
+            .vece = MO_16 },
+          { .fni8 = gen_ushll32_i64,
+            .fniv = gen_ushll_vec,
+            .opt_opc = ushll_list,
+            .fno = gen_helper_sve2_ushll_s,
+            .vece = MO_32 },
+          { .fni8 = gen_ushll64_i64,
+            .fniv = gen_ushll_vec,
+            .opt_opc = ushll_list,
+            .fno = gen_helper_sve2_ushll_d,
+            .vece = MO_64 } },
+    };
+
+    if (a->esz < 0 || a->esz > 2 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_2i(vec_full_reg_offset(s, a->rd),
+                        vec_full_reg_offset(s, a->rn),
+                        vsz, vsz, (a->imm << 1) | sel,
+                        &ops[uns][a->esz]);
+    }
+    return true;
+}
+
+static bool trans_SSHLLB(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_shll_tb(s, a, false, false);
+}
+
+static bool trans_SSHLLT(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_shll_tb(s, a, true, false);
+}
+
+static bool trans_USHLLB(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_shll_tb(s, a, false, true);
+}
+
+static bool trans_USHLLT(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_shll_tb(s, a, true, true);
+}
-- 
2.25.1

