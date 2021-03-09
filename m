Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2954972lfg;
        Tue, 9 Mar 2021 08:20:58 -0800 (PST)
X-Received: by 2002:a05:6830:1e14:: with SMTP id s20mr20007214otr.199.1615306858236;
        Tue, 09 Mar 2021 08:20:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306858; cv=none;
        d=google.com; s=arc-20160816;
        b=F8T+583SxoL77GK53q3LKD/daGr+V4WaIes9Dce/dcBwL0XjUfBSjvcme1kpEyz20W
         I4CwWI/9XXxcWAx2sS8m9xkyik89CN8YATcL5IQEMTNmotN9TAQL51wd43LvgBBmFlrW
         4WAocxvM05+VDolGC3zL1wny8/xaA5N12XFltUKE/ucYXpwCdw0o7V9c3Q4hvIBFyXyf
         ggPFtxdtDd67KcnWMYO3sYaTtDo2uYThpQUD1Iokj7OXqmDksR/7CRqa4fGJhh0iO3uf
         eNJv0rUz/RkToFDd/vKQQcHot/OLEGXBy8FDVUWdTHiP8ViiulCNYC7ghnLoGMc6230e
         uUIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/w1/PeuZSTxpxUDHY11OvShK/rLcq0Hrz8JHi0g1Cbs=;
        b=nLsYdeZX6M13g9/px5aiMe/SWpodN4BQLk4ZApImh7ag3kqAqrOW6aTLcM16FYKt+R
         fF0HFP49wAMdWRt+9o4YwxyLTOQ6wuY0WEC3CHqUkmPC2AwNKFSDNTSEtY3TzaY5v/K4
         P/ZhbYtxJQoR37KIoM85D4fTWsppIGBC9ORhJt3idP/vvFEWiVWWaGriPEuAjuu6HRn5
         d5GjzBo/enlpMwRYUvnq2fS2RxRKqbNdh1agTolTfqWb+s8/8Q6FUKsiW21acjLHK8bW
         C+Fm4HEvSL+3KhBxiPTDh3tX7O8ceLyte89ydKgWtWjAp8s1zl4DhUbwyLt0E3Q4PN7X
         5PIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m4j39iVo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c64sor1910946oib.158.2021.03.09.08.20.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:20:58 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m4j39iVo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/w1/PeuZSTxpxUDHY11OvShK/rLcq0Hrz8JHi0g1Cbs=;
        b=m4j39iVowofGQn4C6GTtRO3E174pNhL4/3av0Ogvp29dTweGdQ2k/7KFd044+bFKal
         /SUda8AhNT3cFVqmsdXi/6E6d/4kH4CZvLuvto/N4ZFiLi7tDcpp8BXRKk5YHbEA6Xw0
         7viJFsNwuQFmWboFm2y4ijiTsi5EadvWs7yjjLRQkSXOQnJDDdWDl7kPeBF/eiPUD+mX
         9gQ5a5YGn6EbrNP/wxZjNRnXIbwQ+kMPoYKoN2vhOht7zWLhmsOEJkwsaLFcYbxlztHb
         D+Lv5Uy6sSFeXWb9sXimCuLxldx5dyZ7vQeHyoabC4JC6En1R45FSsVV86/7BCL+1ZzU
         LPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/w1/PeuZSTxpxUDHY11OvShK/rLcq0Hrz8JHi0g1Cbs=;
        b=mJLdE35+U5Z4TEf7eg0yjI7rRlB9om+s55X2CVi4vD4iX6vq6v6atupadCCXHp0XF+
         Ky8HoYD1L/60i+1Hv0qESh5NMFceyFwhtoJQ2yM/WH+mQqSV4Tm4YdAuU8krPz3QF4Vy
         jRjKocw5zFqbDi70D2VctR4ExwIlCYZS3vPlJVdZxIhK0zlsm/8eoNxDVr+lm8qN/7UF
         +a+ZwdTPaVvTu/XJi3fM+hRiFlJXslIeUVshv2lwLJR3wBoWN3AKx2/+p559I1970Hgo
         UkXzE3iFW51z1XeJ3VKRlNeGm53OxOz04K5Hon1wG6LX3RhwyMMoiuXOdTG0oi4eDhju
         uH7w==
X-Gm-Message-State: AOAM532Kmf+aIKll3Np8WjlCrWgLF5ca2ZLFK4VhgaTlpf5IkdJqZsjb
	dXdgd/3yfXEX6q+JSqijieSYnMde
X-Google-Smtp-Source: ABdhPJyhXP7pZa8CJKWL/PgkLs/QnP54QA0AukrhDBWchffdoh9ccuWc2pn3QAVIEkj9E+DP2WJfQw==
X-Received: by 2002:aca:b108:: with SMTP id a8mr3496355oif.49.1615306857898;
        Tue, 09 Mar 2021 08:20:57 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:20:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 13/78] target/arm: Implement SVE2 integer multiply long
Date: Tue,  9 Mar 2021 08:19:36 -0800
Message-Id: <20210309162041.23124-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: UXVLjS82aYG4

Exclude PMULL from this category for the moment.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 15 +++++++++++++++
 target/arm/sve.decode      |  9 +++++++++
 target/arm/sve_helper.c    | 31 +++++++++++++++++++++++++++++++
 target/arm/translate-sve.c |  9 +++++++++
 4 files changed, 64 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 3286a9c205..ad8121eec6 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2347,4 +2347,19 @@ DEF_HELPER_FLAGS_6(sve_stdd_le_zd_mte, TCG_CALL_NO_WG,
 DEF_HELPER_FLAGS_6(sve_stdd_be_zd_mte, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
 
+DEF_HELPER_FLAGS_4(sve2_sqdmull_zzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmull_zzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmull_zzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_smull_zzz_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_smull_zzz_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_smull_zzz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_umull_zzz_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_umull_zzz_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_umull_zzz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve2_pmull_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index f6f21426ef..d9a72b7661 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1196,3 +1196,12 @@ SSUBWB          01000101 .. 0 ..... 010 100 ..... .....  @rd_rn_rm
 SSUBWT          01000101 .. 0 ..... 010 101 ..... .....  @rd_rn_rm
 USUBWB          01000101 .. 0 ..... 010 110 ..... .....  @rd_rn_rm
 USUBWT          01000101 .. 0 ..... 010 111 ..... .....  @rd_rn_rm
+
+## SVE2 integer multiply long
+
+SQDMULLB_zzz    01000101 .. 0 ..... 011 000 ..... .....  @rd_rn_rm
+SQDMULLT_zzz    01000101 .. 0 ..... 011 001 ..... .....  @rd_rn_rm
+SMULLB_zzz      01000101 .. 0 ..... 011 100 ..... .....  @rd_rn_rm
+SMULLT_zzz      01000101 .. 0 ..... 011 101 ..... .....  @rd_rn_rm
+UMULLB_zzz      01000101 .. 0 ..... 011 110 ..... .....  @rd_rn_rm
+UMULLT_zzz      01000101 .. 0 ..... 011 111 ..... .....  @rd_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 5b7b8d27b8..7877a5bdf5 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1154,6 +1154,37 @@ DO_ZZZ_TB(sve2_uabdl_h, uint16_t, uint8_t, H1_2, H1, DO_ABD)
 DO_ZZZ_TB(sve2_uabdl_s, uint32_t, uint16_t, H1_4, H1_2, DO_ABD)
 DO_ZZZ_TB(sve2_uabdl_d, uint64_t, uint32_t,     , H1_4, DO_ABD)
 
+DO_ZZZ_TB(sve2_smull_zzz_h, int16_t, int8_t, H1_2, H1, DO_MUL)
+DO_ZZZ_TB(sve2_smull_zzz_s, int32_t, int16_t, H1_4, H1_2, DO_MUL)
+DO_ZZZ_TB(sve2_smull_zzz_d, int64_t, int32_t,     , H1_4, DO_MUL)
+
+DO_ZZZ_TB(sve2_umull_zzz_h, uint16_t, uint8_t, H1_2, H1, DO_MUL)
+DO_ZZZ_TB(sve2_umull_zzz_s, uint32_t, uint16_t, H1_4, H1_2, DO_MUL)
+DO_ZZZ_TB(sve2_umull_zzz_d, uint64_t, uint32_t,     , H1_4, DO_MUL)
+
+/* Note that the multiply cannot overflow, but the doubling can. */
+static inline int16_t do_sqdmull_h(int16_t n, int16_t m)
+{
+    int16_t val = n * m;
+    return DO_SQADD_H(val, val);
+}
+
+static inline int32_t do_sqdmull_s(int32_t n, int32_t m)
+{
+    int32_t val = n * m;
+    return DO_SQADD_S(val, val);
+}
+
+static inline int64_t do_sqdmull_d(int64_t n, int64_t m)
+{
+    int64_t val = n * m;
+    return do_sqadd_d(val, val);
+}
+
+DO_ZZZ_TB(sve2_sqdmull_zzz_h, int16_t, int8_t, H1_2, H1, do_sqdmull_h)
+DO_ZZZ_TB(sve2_sqdmull_zzz_s, int32_t, int16_t, H1_4, H1_2, do_sqdmull_s)
+DO_ZZZ_TB(sve2_sqdmull_zzz_d, int64_t, int32_t,     , H1_4, do_sqdmull_d)
+
 #undef DO_ZZZ_TB
 
 #define DO_ZZZ_WTB(NAME, TYPEW, TYPEN, HW, HN, OP) \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e88787318c..8da87a6ce0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6022,6 +6022,15 @@ DO_SVE2_ZZZ_TB(SADDLBT, saddl, false, true)
 DO_SVE2_ZZZ_TB(SSUBLBT, ssubl, false, true)
 DO_SVE2_ZZZ_TB(SSUBLTB, ssubl, true, false)
 
+DO_SVE2_ZZZ_TB(SQDMULLB_zzz, sqdmull_zzz, false, false)
+DO_SVE2_ZZZ_TB(SQDMULLT_zzz, sqdmull_zzz, true, true)
+
+DO_SVE2_ZZZ_TB(SMULLB_zzz, smull_zzz, false, false)
+DO_SVE2_ZZZ_TB(SMULLT_zzz, smull_zzz, true, true)
+
+DO_SVE2_ZZZ_TB(UMULLB_zzz, umull_zzz, false, false)
+DO_SVE2_ZZZ_TB(UMULLT_zzz, umull_zzz, true, true)
+
 #define DO_SVE2_ZZZ_WTB(NAME, name, SEL2) \
 static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)       \
 {                                                               \
-- 
2.25.1
