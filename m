Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955066lfg;
        Tue, 9 Mar 2021 08:21:04 -0800 (PST)
X-Received: by 2002:aca:4f16:: with SMTP id d22mr3567831oib.86.1615306864856;
        Tue, 09 Mar 2021 08:21:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306864; cv=none;
        d=google.com; s=arc-20160816;
        b=UM12fow+H9D0kpCzi3nJgGuK6kyLtV2mbgJBOBnEt3BtER4Da5mDBsawdjxfwaGDlI
         wje2+OyYEYr1qHVZ6B9/SGMSkoI+r4yfebiZakhWWhJSj2CRwYJSKQTXcGJ1MU9DGj71
         9EqVrC6cayfbS0GAo3P6WdUy22Y8P/amZHhGgX/c96mFKR7ibv9Yi3GtDD0u/IfWbiUC
         YkpYSAOczVOSBTHJ20lA2nwDG2Bx7r5RAJmzAsTbv9T6XSwkvi+H45i6y+cEu330sKyR
         6WxcXCnY4oeDCimlxLx83HQNXT0zPbKZJIGySJqwXZEqChNQ6ZnuqeI4Q6DFjciegrff
         AhYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=s6m7gD9TSwnsmEAd7UsDrChSJzeJfhUW4ksDD+ynVvo=;
        b=RAhfwnTFduoVaXWE53Q9X7uXMG0JX2TOv3TNkwDl308Mq9q12BVh0h2z9PbVK5NICH
         XeTV/91kkBNkbGE+YZaKPLmFwqOHxUxE0SZHLmgi5WhtxRIUne/wXnhcraFiNNbbGDZg
         D7u6tQ9LSMkjsY9CjGwRoa8jovhpDVMuqFuqeDbNDBXIeYtK1SBdmaUzKMX3b6is3Ih/
         Ke9R6Fm5/j4C1kTXyyu1sxGj/PXiR+pqdTbtgiQkC2bq/9f9JoOTuGFJa/4e+9gOjHmg
         CNq8/QZxo3x6RA8RB2Bu3ujpG+VVzZ2aJcNpgbi+wHTrnSykyAbZFKJKwSiVk1hhy9sI
         lnOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VDbkviV7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b11sor151731oic.45.2021.03.09.08.21.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:21:04 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VDbkviV7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s6m7gD9TSwnsmEAd7UsDrChSJzeJfhUW4ksDD+ynVvo=;
        b=VDbkviV7z80Ab7PYlUFre1xirKLNZvbB1E4V44YCRX19nKcDzctngMaQcDMujqbbij
         FQdEZPwz6ltLVwBdTmt17ZvzJOhE/V6WPc1KwSyDSbTpAjKqq76FwPFfZ8IT8IlIugl9
         9wJRJ5a0DnYVM8gnjksN1NswG5lslP0UsxNIOZmwRN4ZNx+bNAPFTAOreKo2V0qjw5kW
         tB2UzCGzYsaT5Euaz2MS8kmHR7DioZGB5nhlJWwSJl7D8viOU4bKxGsfAeI6bzW0DvE5
         LkaxEs8RU1WK4MsJpwp/620YE9117MgXsUWhXh8AVvxJmUneII/qFHB8AabFF4BmIslW
         To3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s6m7gD9TSwnsmEAd7UsDrChSJzeJfhUW4ksDD+ynVvo=;
        b=iXSto8XOnVlteLB4Ktrif3lc0gLbO7Wz/RTcotYTeWSnYk3NbcdrkoJdDTbu5riKkb
         6ukiL1BbiIviQgMo1sUyCj3kE9BV5IPkK9CnRmQEMlaoy++l51dzqgpzbR6u7hO30QsN
         LljAo79ZDD0dhg61XzHFn2NJ6QQRSccvBu9BMlTKjf8Gk5xGrRgXFTyxOy8LvJEg65M8
         Vyg1bPRami37iXNzDnLsnV+eNFAV2diCsCrp0KKE6xnN8lLLna2dirkBrFgXClwV95IM
         C1VuYyIVxnR2LD5Cel/QQpBQGb+DBGuWhnwgWt9rcDe8HWNPySwATWowK5CC78fRoHPa
         OVtg==
X-Gm-Message-State: AOAM533jBXcEUulleFHndELsaQ5b5RTSWjd5Vq7K2mhKLhEIB+nhbMeW
	dUuDcHIr2xZcVMpog7OsLK9wpumG8UpskexWCKg=
X-Google-Smtp-Source: ABdhPJw/f6ONh/qutIX7uFZovrZeQiyWI77Mu8CCrlOYxR2chwhFg/s6rk1w7F4Pom92WB/Zbd805g==
X-Received: by 2002:aca:3509:: with SMTP id c9mr3454792oia.51.1615306864442;
        Tue, 09 Mar 2021 08:21:04 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:21:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 19/78] target/arm: Implement SVE2 integer absolute difference and accumulate long
Date: Tue,  9 Mar 2021 08:19:42 -0800
Message-Id: <20210309162041.23124-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: J6V3YwJEwxr3

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix select offsetting and argument order (laurent desnogues).
---
 target/arm/helper-sve.h    | 14 ++++++++++
 target/arm/sve.decode      | 12 +++++++++
 target/arm/sve_helper.c    | 23 ++++++++++++++++
 target/arm/translate-sve.c | 55 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 104 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index c2155cc544..229fb396b2 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2402,3 +2402,17 @@ DEF_HELPER_FLAGS_4(sve2_sqcadd_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqcadd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqcadd_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqcadd_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sabal_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sabal_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sabal_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uabal_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uabal_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uabal_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 7508b901d0..56b7353bfa 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -70,6 +70,7 @@
 &rpr_s          rd pg rn s
 &rprr_s         rd pg rn rm s
 &rprr_esz       rd pg rn rm esz
+&rrrr_esz       rd ra rn rm esz
 &rprrr_esz      rd pg rn rm ra esz
 &rpri_esz       rd pg rn imm esz
 &ptrue          rd esz pat s
@@ -119,6 +120,10 @@
 @rdn_i8s        ........ esz:2 ...... ... imm:s8 rd:5 \
                 &rri_esz rn=%reg_movprfx
 
+# Four operand, vector element size
+@rda_rn_rm      ........ esz:2 . rm:5 ... ... rn:5 rd:5 \
+                &rrrr_esz ra=%reg_movprfx
+
 # Three operand with "memory" size, aka immediate left shift
 @rd_rn_msz_rm   ........ ... rm:5 .... imm:2 rn:5 rd:5          &rrri
 
@@ -1235,3 +1240,10 @@ CADD_rot90      01000101 .. 00000 0 11011 0 ..... .....  @rdn_rm
 CADD_rot270     01000101 .. 00000 0 11011 1 ..... .....  @rdn_rm
 SQCADD_rot90    01000101 .. 00000 1 11011 0 ..... .....  @rdn_rm
 SQCADD_rot270   01000101 .. 00000 1 11011 1 ..... .....  @rdn_rm
+
+## SVE2 integer absolute difference and accumulate long
+
+SABALB          01000101 .. 0 ..... 1100 00 ..... .....  @rda_rn_rm
+SABALT          01000101 .. 0 ..... 1100 01 ..... .....  @rda_rn_rm
+UABALB          01000101 .. 0 ..... 1100 10 ..... .....  @rda_rn_rm
+UABALT          01000101 .. 0 ..... 1100 11 ..... .....  @rda_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 6d70d10701..dd2c6a7404 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1241,6 +1241,29 @@ DO_ZZZ_NTB(sve2_eoril_d, uint64_t,     , DO_EOR)
 
 #undef DO_ZZZ_NTB
 
+#define DO_ZZZW_ACC(NAME, TYPEW, TYPEN, HW, HN, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc) \
+{                                                               \
+    intptr_t i, opr_sz = simd_oprsz(desc);                      \
+    intptr_t sel1 = simd_data(desc) * sizeof(TYPEN);            \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {               \
+        TYPEW nn = *(TYPEN *)(vn + HN(i + sel1));               \
+        TYPEW mm = *(TYPEN *)(vm + HN(i + sel1));               \
+        TYPEW aa = *(TYPEW *)(va + HW(i));                      \
+        *(TYPEW *)(vd + HW(i)) = OP(nn, mm) + aa;               \
+    }                                                           \
+}
+
+DO_ZZZW_ACC(sve2_sabal_h, int16_t, int8_t, H1_2, H1, DO_ABD)
+DO_ZZZW_ACC(sve2_sabal_s, int32_t, int16_t, H1_4, H1_2, DO_ABD)
+DO_ZZZW_ACC(sve2_sabal_d, int64_t, int32_t,     , H1_4, DO_ABD)
+
+DO_ZZZW_ACC(sve2_uabal_h, uint16_t, uint8_t, H1_2, H1, DO_ABD)
+DO_ZZZW_ACC(sve2_uabal_s, uint32_t, uint16_t, H1_4, H1_2, DO_ABD)
+DO_ZZZW_ACC(sve2_uabal_d, uint64_t, uint32_t,     , H1_4, DO_ABD)
+
+#undef DO_ZZZW_ACC
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e4eca9f16d..c179e1f123 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -163,6 +163,18 @@ static void gen_gvec_ool_zzz(DisasContext *s, gen_helper_gvec_3 *fn,
                        vsz, vsz, data, fn);
 }
 
+/* Invoke an out-of-line helper on 4 Zregs. */
+static void gen_gvec_ool_zzzz(DisasContext *s, gen_helper_gvec_4 *fn,
+                              int rd, int rn, int rm, int ra, int data)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
+                       vec_full_reg_offset(s, rn),
+                       vec_full_reg_offset(s, rm),
+                       vec_full_reg_offset(s, ra),
+                       vsz, vsz, data, fn);
+}
+
 /* Invoke an out-of-line helper on 2 Zregs and a predicate. */
 static void gen_gvec_ool_zzp(DisasContext *s, gen_helper_gvec_3 *fn,
                              int rd, int rn, int pg, int data)
@@ -6317,3 +6329,46 @@ static bool trans_SQCADD_rot270(DisasContext *s, arg_rrr_esz *a)
 {
     return do_cadd(s, a, true, true);
 }
+
+static bool do_sve2_zzzz_ool(DisasContext *s, arg_rrrr_esz *a,
+                             gen_helper_gvec_4 *fn, int data)
+{
+    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, data);
+    }
+    return true;
+}
+
+static bool do_abal(DisasContext *s, arg_rrrr_esz *a, bool uns, bool sel)
+{
+    static gen_helper_gvec_4 * const fns[2][4] = {
+        { NULL,                    gen_helper_sve2_sabal_h,
+          gen_helper_sve2_sabal_s, gen_helper_sve2_sabal_d },
+        { NULL,                    gen_helper_sve2_uabal_h,
+          gen_helper_sve2_uabal_s, gen_helper_sve2_uabal_d },
+    };
+    return do_sve2_zzzz_ool(s, a, fns[uns][a->esz], sel);
+}
+
+static bool trans_SABALB(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_abal(s, a, false, false);
+}
+
+static bool trans_SABALT(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_abal(s, a, false, true);
+}
+
+static bool trans_UABALB(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_abal(s, a, true, false);
+}
+
+static bool trans_UABALT(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_abal(s, a, true, true);
+}
-- 
2.25.1
