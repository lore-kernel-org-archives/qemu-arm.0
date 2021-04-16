Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp726659lfr;
        Fri, 16 Apr 2021 14:04:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUVa8eLHqOYcKoIU5tkUBBTp3Of5xHYCBmbmb6hZww5zHF/a3kEAP9AO4DSFZySVrE0iqV
X-Received: by 2002:a9d:4812:: with SMTP id c18mr1031890otf.343.1618607063071;
        Fri, 16 Apr 2021 14:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618607063; cv=none;
        d=google.com; s=arc-20160816;
        b=qSx/9ruN168kEuaGvMbfVTvx8R5rwzINhGH+wus8wUg80JfYuHp2W2HXIZebzgLoJu
         bEMLZbLVhs3JMuBnfJpNqLrihpzZxls54tI5mDEUEaWURhNT1CZS/0S9rjNLOS018FiN
         XGzaZl2cEDUesYgd8yf3FZZ2EIuPevhg/SGLv1SOGe0q4tkJNjp9NmZbj0WHyxF3JR1y
         mj8pXsGHnumi6QuhbiBq2Y83q1ipxlqc89pvIy0OXgYZAzsoQvWiZs1sabI5uaq+Y+mG
         V3SbiXRFdycZ59wl+FOlmOk+DS0uf4bXCWXd74EGKOUtUafHmALZQx6H5j+x5sdSjul3
         nG6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FXd4wOc5+bYMVSLk2jKG60M24P25fU16HFUkpUXY4d4=;
        b=G/8b4rzSBGnW1kf3303NG+Rb5ybAc0KSTDdz7rqgnHjZmmAmzHsEPWj5KPD3OtXD+g
         xm2KWBNR20/7n2cQiS0zI3+E6PBYpF2UtQ82SxGZLlOSu8NqVXNqoLNHM4nYB0uniX29
         i/3MIWVUZYcTMQwI6CsekxA37JiufaSH/fpFTQiNJmt4RehLjJwlHVIXo/PRp+IlPn98
         jiY9mCjlwZcyHLs1hOkayVMk4B0d6tNY4azg8tMsJaUg0+yzCvZqiNZQv+73WkWEPd91
         4DGdkDQKQbxHt3L09J1csaqoho69qv/3IgMDflZPTHjwsBaDdnddllggov65h/Jf8Cct
         ZkMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wqHcwLOb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m131si6113739oib.128.2021.04.16.14.04.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:04:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wqHcwLOb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXVdW-0005LQ-2p
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVc3-0003vK-8B
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:02:51 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:38881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVc0-0000zp-J1
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:02:50 -0400
Received: by mail-pl1-x62f.google.com with SMTP id o16so1026477plg.5
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FXd4wOc5+bYMVSLk2jKG60M24P25fU16HFUkpUXY4d4=;
 b=wqHcwLObTYqc+hsjlSTgEixMBoi38HkymluxDacv7vUW4U9LQfvwNEhe1zbYvpJlbg
 aUuau2hu/KkF85cfG7uZuBPxPLLrcR1Kq4D2CbO3aGNScQnZSQh+P27PTKXMX4HKyrgW
 0m0Xhyluzmbsb9FCRHas/UYcdayO7ZnBnuRd/au1Ac3U5sEywZAjm0Jg5U2Y5WZ5qtuP
 iuaSKgKvPeiqrQMjbp3pKVVD4nifnempjvyMQJqqMInyIRVbzTVhLTlga3At2hlJmhpz
 ZGxWH6ZJNLM93577IozetAWXqArj5CRrhN0cMmsWZeRIcW5lBUzMap5ilH7neWK13xdh
 78HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FXd4wOc5+bYMVSLk2jKG60M24P25fU16HFUkpUXY4d4=;
 b=Szpvsby4wMXAgth4Bbnj4XyiYliVyITThV6HqkxRHQk5R3PZNDfs/gG2jUGF7TnUP8
 8cTXGuLYi/9eP9lZaPzvx16iQrBk7l+DkRLHW8Q+o8fE9uioTDWUvvzoRR//Z3EAMPxm
 YTncx/4egAyAMwsYldHiJYXuNO4bKOF2+zVo3w2fsT1Ebu3vZ3z01e+yTsmlkmh1e77F
 jCBhxer3jrHanYrSxDgzClpzjhRsaQz7SsS/Px0Rz2ruhX98UAFbZGY2B+RrJKWjzvre
 PICAfGhgG5gOO39cxpBCRCFixhxHFzp8kKKMcRkjdO4X4AcZzjCDSSoUXrivUc4aQ5ho
 8O7w==
X-Gm-Message-State: AOAM5306sPGfYMcD5iKTMJ34SmlbTNIZgMAt7UPcbGBTQKcxpxvSdvKk
 PMkaJ/CZIX2jPHKiqPv8E/9AyQ==
X-Received: by 2002:a17:90a:420d:: with SMTP id
 o13mr11780832pjg.61.1618606967311; 
 Fri, 16 Apr 2021 14:02:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:02:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/81] target/arm: Implement SVE2 integer unary operations
 (predicated)
Date: Fri, 16 Apr 2021 14:01:23 -0700
Message-Id: <20210416210240.1591291-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: pJ98v96F5CUy

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix sqabs, sqneg (laurent desnogues)
---
 target/arm/helper-sve.h    | 13 +++++++++++
 target/arm/sve.decode      |  7 ++++++
 target/arm/sve_helper.c    | 29 +++++++++++++++++++----
 target/arm/translate-sve.c | 47 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 92 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index b2a274b40b..9992e93e2b 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -502,6 +502,19 @@ DEF_HELPER_FLAGS_4(sve_rbit_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_sqabs_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqabs_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqabs_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqabs_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqneg_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqneg_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqneg_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqneg_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_urecpe_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_ursqrte_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_splice, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(sve_cmpeq_ppzz_b, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 0524c01fcf..5ba542969b 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1105,3 +1105,10 @@ PMUL_zzz        00000100 00 1 ..... 0110 01 ..... .....  @rd_rn_rm_e0
 
 SADALP_zpzz     01000100 .. 000 100 101 ... ..... .....  @rdm_pg_rn
 UADALP_zpzz     01000100 .. 000 101 101 ... ..... .....  @rdm_pg_rn
+
+### SVE2 integer unary operations (predicated)
+
+URECPE          01000100 .. 000 000 101 ... ..... .....  @rd_pg_rn
+URSQRTE         01000100 .. 000 001 101 ... ..... .....  @rd_pg_rn
+SQABS           01000100 .. 001 000 101 ... ..... .....  @rd_pg_rn
+SQNEG           01000100 .. 001 001 101 ... ..... .....  @rd_pg_rn
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 42fe315485..bbab84e81d 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -535,8 +535,8 @@ static inline uint64_t do_sadalp_d(uint64_t n, uint64_t m)
     return m + n1 + n2;
 }
 
-DO_ZPZZ(sve2_sadalp_zpzz_h, int16_t, H1_2, do_sadalp_h)
-DO_ZPZZ(sve2_sadalp_zpzz_s, int32_t, H1_4, do_sadalp_s)
+DO_ZPZZ(sve2_sadalp_zpzz_h, uint16_t, H1_2, do_sadalp_h)
+DO_ZPZZ(sve2_sadalp_zpzz_s, uint32_t, H1_4, do_sadalp_s)
 DO_ZPZZ_D(sve2_sadalp_zpzz_d, uint64_t, do_sadalp_d)
 
 static inline uint16_t do_uadalp_h(uint16_t n, uint16_t m)
@@ -557,8 +557,8 @@ static inline uint64_t do_uadalp_d(uint64_t n, uint64_t m)
     return m + n1 + n2;
 }
 
-DO_ZPZZ(sve2_uadalp_zpzz_h, int16_t, H1_2, do_uadalp_h)
-DO_ZPZZ(sve2_uadalp_zpzz_s, int32_t, H1_4, do_uadalp_s)
+DO_ZPZZ(sve2_uadalp_zpzz_h, uint16_t, H1_2, do_uadalp_h)
+DO_ZPZZ(sve2_uadalp_zpzz_s, uint32_t, H1_4, do_uadalp_s)
 DO_ZPZZ_D(sve2_uadalp_zpzz_d, uint64_t, do_uadalp_d)
 
 #undef DO_ZPZZ
@@ -728,6 +728,27 @@ DO_ZPZ(sve_rbit_h, uint16_t, H1_2, revbit16)
 DO_ZPZ(sve_rbit_s, uint32_t, H1_4, revbit32)
 DO_ZPZ_D(sve_rbit_d, uint64_t, revbit64)
 
+#define DO_SQABS(X) \
+    ({ __typeof(X) x_ = (X), min_ = 1ull << (sizeof(X) * 8 - 1); \
+       x_ >= 0 ? x_ : x_ == min_ ? -min_ - 1 : -x_; })
+
+DO_ZPZ(sve2_sqabs_b, int8_t, H1, DO_SQABS)
+DO_ZPZ(sve2_sqabs_h, int16_t, H1_2, DO_SQABS)
+DO_ZPZ(sve2_sqabs_s, int32_t, H1_4, DO_SQABS)
+DO_ZPZ_D(sve2_sqabs_d, int64_t, DO_SQABS)
+
+#define DO_SQNEG(X) \
+    ({ __typeof(X) x_ = (X), min_ = 1ull << (sizeof(X) * 8 - 1); \
+       x_ == min_ ? -min_ - 1 : -x_; })
+
+DO_ZPZ(sve2_sqneg_b, uint8_t, H1, DO_SQNEG)
+DO_ZPZ(sve2_sqneg_h, uint16_t, H1_2, DO_SQNEG)
+DO_ZPZ(sve2_sqneg_s, uint32_t, H1_4, DO_SQNEG)
+DO_ZPZ_D(sve2_sqneg_d, uint64_t, DO_SQNEG)
+
+DO_ZPZ(sve2_urecpe_s, uint32_t, H1_4, helper_recpe_u32)
+DO_ZPZ(sve2_ursqrte_s, uint32_t, H1_4, helper_rsqrte_u32)
+
 /* Three-operand expander, unpredicated, in which the third operand is "wide".
  */
 #define DO_ZZW(NAME, TYPE, TYPEW, H, OP)                       \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 208d9ea7e0..c30b3c476e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5884,3 +5884,50 @@ static bool trans_UADALP_zpzz(DisasContext *s, arg_rprr_esz *a)
     }
     return do_sve2_zpzz_ool(s, a, fns[a->esz - 1]);
 }
+
+/*
+ * SVE2 integer unary operations (predicated)
+ */
+
+static bool do_sve2_zpz_ool(DisasContext *s, arg_rpr_esz *a,
+                            gen_helper_gvec_3 *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ool(s, a, fn);
+}
+
+static bool trans_URECPE(DisasContext *s, arg_rpr_esz *a)
+{
+    if (a->esz != 2) {
+        return false;
+    }
+    return do_sve2_zpz_ool(s, a, gen_helper_sve2_urecpe_s);
+}
+
+static bool trans_URSQRTE(DisasContext *s, arg_rpr_esz *a)
+{
+    if (a->esz != 2) {
+        return false;
+    }
+    return do_sve2_zpz_ool(s, a, gen_helper_sve2_ursqrte_s);
+}
+
+static bool trans_SQABS(DisasContext *s, arg_rpr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqabs_b, gen_helper_sve2_sqabs_h,
+        gen_helper_sve2_sqabs_s, gen_helper_sve2_sqabs_d,
+    };
+    return do_sve2_zpz_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_SQNEG(DisasContext *s, arg_rpr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqneg_b, gen_helper_sve2_sqneg_h,
+        gen_helper_sve2_sqneg_s, gen_helper_sve2_sqneg_d,
+    };
+    return do_sve2_zpz_ool(s, a, fns[a->esz]);
+}
-- 
2.25.1

