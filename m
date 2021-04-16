Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp739553lfr;
        Fri, 16 Apr 2021 14:26:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMbuUNI6ppq00wYSc+5ZPP7WdaBiR8lwplD1vNciRv/tdtpmQzy6qd1+WYjegABODJo7oi
X-Received: by 2002:a92:ad03:: with SMTP id w3mr8604604ilh.245.1618608395903;
        Fri, 16 Apr 2021 14:26:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618608395; cv=none;
        d=google.com; s=arc-20160816;
        b=ePHjcfKjOhag1Fia+4zzW6Wok2xKPdH/f3CsyL8wd4CyfAxngOPhBDhVh4UBJDnKJh
         GYsRNWepHJ6jBDmZBimGBJ1c7eogPmlQ5L3sJS4Oe3umwEpXNq4fLzmtR+TwXqU0MZS4
         54SNWrWoiaJMb2amY0lSvL4hHi6qEdRJVvb9fY0xbMRUUbnXQ8t+iwHDabWtpUF7mve4
         moKqAAQRTXLYj8yjbw7Uk1JZ4W9uc93yl37o4siNCK05bJpDOJs//+tmzxK6synwo1tp
         nuK/VYK6D9/A8IaUvCP7Pf1JeT/x1J8IYuLupaypa/kUPrvKlb+dFKSnIhqs3O3LZZaU
         SHVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3st5GDCoYANtSqf9tcWs4eqMv4/zg0MwHali4f+3cK4=;
        b=kgdazlaWprNlKJDNDUhqBLWKBrBdWMjMGYLS90+a3OY1DtU7QmeJt2BG7x2tWJj6VW
         YFhadmKiAOc7LBY3L07IUFcvXO1XmnSMGzIMNAmr4NCkxipvsAyH6TYgppph6nRPwHsr
         VBQfhFTWf2I2+9+WKK2oS0Y5HoAClYn+OI3SXhziZomU7v1d9jin6tX6X+S0RyeGW3Fl
         J+eLkM1JNxuSnYD8FH/OdcJVqRMGbZXy1UhGpR4CeSL5ZTVvPjjoZErj+WxX/vU1amko
         i/5vA/SUxFUS1LKQeCs9uyVmfcVXYgV3XS91JQGlYCZAVRPkeYL7NKNZduSOkzpDwnMH
         ILDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V47HKQzs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13si4410170ilg.122.2021.04.16.14.26.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:26:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V47HKQzs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXVz1-0002YD-6r
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcS-0004cY-4u
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:03:16 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcM-0001Fc-DP
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:03:15 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso17060243pji.3
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3st5GDCoYANtSqf9tcWs4eqMv4/zg0MwHali4f+3cK4=;
 b=V47HKQzs8Km0jNhcWVjCf5tTda+VDI8AnJHKSSGm1kbFPHHqjNrlca07opQjLQXrlR
 HDNC66122Hb9e2dJgDbUdtX0aNu4FL3h6ZPOuS7PMztFt2ugP2fjivDc/dpmDEkihJM7
 YGRnYXjSTBceMBHsXWvINRrBlzrFCp2qz/EwPfolUvBkAcP4V1WxrW8JuVYAofdCKdbp
 zWIRSZV11X7ZDN3Ix1BpBebI53h8KH1Ws3Nu0IGxrqzmat9tJP5f5dMxjcyjyaHKg8Qb
 USMvUyTAlngwaylk/OUqPbxi2MbLBRQLJ6vq1Gk0xYOskwyfwWEv7KAXeOu+7Fq9mRPC
 35vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3st5GDCoYANtSqf9tcWs4eqMv4/zg0MwHali4f+3cK4=;
 b=FI00zTv6XCRju4bQmxrVuynOAUew03TLunHj/b76zmazaw1dJlxXrgg7Em276ekVPW
 Nd6aBrgUe/p0vpSQpgykRnN7wVWaSW0wzkPvCoCHtP/RR9XCY6OQGwayDHmp8J/EunXX
 NTWQPsGmtzb2Hsfy3AvLMSLOxlaPGfXBiBcJXJlwXJeWJ0NjPKVsq8R0ufH+6oGXnBZE
 TGtFy2CGq3xIpg7pgLVXV2GSsIYS8K23ZCoIQtFGA/Axwrkvekg3zh892rvGLAJHOyGt
 ETiL11WUPBaNXEg7GfYREr+APOhmEuS70vxJG00OwTyuICjaOWlG0CqoOZeSuf+WHSSW
 TaYA==
X-Gm-Message-State: AOAM531UoPhc9CYduPQoV5/bM4OYw6KJn/SpZSBfBgJY/Bfk5wwsFKy5
 tmJkvWzAJw5cCTDo6UnZUzMWrg==
X-Received: by 2002:a17:90b:344a:: with SMTP id
 lj10mr11989461pjb.101.1618606989083; 
 Fri, 16 Apr 2021 14:03:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 27/81] target/arm: Implement SVE2 SQSHRUN, SQRSHRUN
Date: Fri, 16 Apr 2021 14:01:46 -0700
Message-Id: <20210416210240.1591291-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m/z38fUPtrT4

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 16 +++++++
 target/arm/sve.decode      |  4 ++
 target/arm/sve_helper.c    | 35 ++++++++++++++
 target/arm/translate-sve.c | 98 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 153 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 2b2ebea631..2e80d9d27b 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2460,6 +2460,22 @@ DEF_HELPER_FLAGS_3(sve2_rshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_rshrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_rshrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(sve2_sqshrunb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrunb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrunb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sqshrunt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrunt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrunt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sqrshrunb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrunb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrunb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sqrshrunt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrunt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrunt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 169486ecb2..18faa900ca 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1288,6 +1288,10 @@ SQXTUNT         01000101 .. 1 ..... 010 101 ..... .....  @rd_rn_tszimm_shl
 ## SVE2 bitwise shift right narrow
 
 # Bit 23 == 0 is handled by esz > 0 in the translator.
+SQSHRUNB        01000101 .. 1 ..... 00 0000 ..... .....  @rd_rn_tszimm_shr
+SQSHRUNT        01000101 .. 1 ..... 00 0001 ..... .....  @rd_rn_tszimm_shr
+SQRSHRUNB       01000101 .. 1 ..... 00 0010 ..... .....  @rd_rn_tszimm_shr
+SQRSHRUNT       01000101 .. 1 ..... 00 0011 ..... .....  @rd_rn_tszimm_shr
 SHRNB           01000101 .. 1 ..... 00 0100 ..... .....  @rd_rn_tszimm_shr
 SHRNT           01000101 .. 1 ..... 00 0101 ..... .....  @rd_rn_tszimm_shr
 RSHRNB          01000101 .. 1 ..... 00 0110 ..... .....  @rd_rn_tszimm_shr
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 3f864da3ab..d6b6293ab0 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1874,6 +1874,16 @@ static inline uint64_t do_urshr(uint64_t x, unsigned sh)
     }
 }
 
+static inline int64_t do_srshr(int64_t x, unsigned sh)
+{
+    if (likely(sh < 64)) {
+        return (x >> sh) + ((x >> (sh - 1)) & 1);
+    } else {
+        /* Rounding the sign bit always produces 0. */
+        return 0;
+    }
+}
+
 DO_ZPZI(sve_asr_zpzi_b, int8_t, H1, DO_SHR)
 DO_ZPZI(sve_asr_zpzi_h, int16_t, H1_2, DO_SHR)
 DO_ZPZI(sve_asr_zpzi_s, int32_t, H1_4, DO_SHR)
@@ -1936,6 +1946,31 @@ DO_SHRNT(sve2_rshrnt_h, uint16_t, uint8_t, H1_2, H1, do_urshr)
 DO_SHRNT(sve2_rshrnt_s, uint32_t, uint16_t, H1_4, H1_2, do_urshr)
 DO_SHRNT(sve2_rshrnt_d, uint64_t, uint32_t,     , H1_4, do_urshr)
 
+#define DO_SQSHRUN_H(x, sh) do_sat_bhs((int64_t)(x) >> sh, 0, UINT8_MAX)
+#define DO_SQSHRUN_S(x, sh) do_sat_bhs((int64_t)(x) >> sh, 0, UINT16_MAX)
+#define DO_SQSHRUN_D(x, sh) \
+    do_sat_bhs((int64_t)(x) >> (sh < 64 ? sh : 63), 0, UINT32_MAX)
+
+DO_SHRNB(sve2_sqshrunb_h, int16_t, uint8_t, DO_SQSHRUN_H)
+DO_SHRNB(sve2_sqshrunb_s, int32_t, uint16_t, DO_SQSHRUN_S)
+DO_SHRNB(sve2_sqshrunb_d, int64_t, uint32_t, DO_SQSHRUN_D)
+
+DO_SHRNT(sve2_sqshrunt_h, int16_t, uint8_t, H1_2, H1, DO_SQSHRUN_H)
+DO_SHRNT(sve2_sqshrunt_s, int32_t, uint16_t, H1_4, H1_2, DO_SQSHRUN_S)
+DO_SHRNT(sve2_sqshrunt_d, int64_t, uint32_t,     , H1_4, DO_SQSHRUN_D)
+
+#define DO_SQRSHRUN_H(x, sh) do_sat_bhs(do_srshr(x, sh), 0, UINT8_MAX)
+#define DO_SQRSHRUN_S(x, sh) do_sat_bhs(do_srshr(x, sh), 0, UINT16_MAX)
+#define DO_SQRSHRUN_D(x, sh) do_sat_bhs(do_srshr(x, sh), 0, UINT32_MAX)
+
+DO_SHRNB(sve2_sqrshrunb_h, int16_t, uint8_t, DO_SQRSHRUN_H)
+DO_SHRNB(sve2_sqrshrunb_s, int32_t, uint16_t, DO_SQRSHRUN_S)
+DO_SHRNB(sve2_sqrshrunb_d, int64_t, uint32_t, DO_SQRSHRUN_D)
+
+DO_SHRNT(sve2_sqrshrunt_h, int16_t, uint8_t, H1_2, H1, DO_SQRSHRUN_H)
+DO_SHRNT(sve2_sqrshrunt_s, int32_t, uint16_t, H1_4, H1_2, DO_SQRSHRUN_S)
+DO_SHRNT(sve2_sqrshrunt_d, int64_t, uint32_t,     , H1_4, DO_SQRSHRUN_D)
+
 #undef DO_SHRNB
 #undef DO_SHRNT
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c1a081acaa..5ff6b8ffb6 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6858,6 +6858,104 @@ static bool trans_RSHRNT(DisasContext *s, arg_rri_esz *a)
     return do_sve2_shr_narrow(s, a, ops);
 }
 
+static void gen_sqshrunb_vec(unsigned vece, TCGv_vec d,
+                             TCGv_vec n, int64_t shr)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+
+    tcg_gen_sari_vec(vece, n, n, shr);
+    tcg_gen_dupi_vec(vece, t, 0);
+    tcg_gen_smax_vec(vece, n, n, t);
+    tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
+    tcg_gen_umin_vec(vece, d, n, t);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_SQSHRUNB(DisasContext *s, arg_rri_esz *a)
+{
+    static const TCGOpcode vec_list[] = {
+        INDEX_op_sari_vec, INDEX_op_smax_vec, INDEX_op_umin_vec, 0
+    };
+    static const GVecGen2i ops[3] = {
+        { .fniv = gen_sqshrunb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_sqshrunb_h,
+          .vece = MO_16 },
+        { .fniv = gen_sqshrunb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_sqshrunb_s,
+          .vece = MO_32 },
+        { .fniv = gen_sqshrunb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_sqshrunb_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static void gen_sqshrunt_vec(unsigned vece, TCGv_vec d,
+                             TCGv_vec n, int64_t shr)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+
+    tcg_gen_sari_vec(vece, n, n, shr);
+    tcg_gen_dupi_vec(vece, t, 0);
+    tcg_gen_smax_vec(vece, n, n, t);
+    tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
+    tcg_gen_umin_vec(vece, n, n, t);
+    tcg_gen_shli_vec(vece, n, n, halfbits);
+    tcg_gen_bitsel_vec(vece, d, t, d, n);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_SQSHRUNT(DisasContext *s, arg_rri_esz *a)
+{
+    static const TCGOpcode vec_list[] = {
+        INDEX_op_shli_vec, INDEX_op_sari_vec,
+        INDEX_op_smax_vec, INDEX_op_umin_vec, 0
+    };
+    static const GVecGen2i ops[3] = {
+        { .fniv = gen_sqshrunt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqshrunt_h,
+          .vece = MO_16 },
+        { .fniv = gen_sqshrunt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqshrunt_s,
+          .vece = MO_32 },
+        { .fniv = gen_sqshrunt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqshrunt_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static bool trans_SQRSHRUNB(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2i ops[3] = {
+        { .fno = gen_helper_sve2_sqrshrunb_h },
+        { .fno = gen_helper_sve2_sqrshrunb_s },
+        { .fno = gen_helper_sve2_sqrshrunb_d },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static bool trans_SQRSHRUNT(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2i ops[3] = {
+        { .fno = gen_helper_sve2_sqrshrunt_h },
+        { .fno = gen_helper_sve2_sqrshrunt_s },
+        { .fno = gen_helper_sve2_sqrshrunt_d },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
 static bool do_sve2_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
                             gen_helper_gvec_4_ptr *fn)
 {
-- 
2.25.1

