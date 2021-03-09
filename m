Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955331lfg;
        Tue, 9 Mar 2021 08:21:22 -0800 (PST)
X-Received: by 2002:aca:a9c7:: with SMTP id s190mr3507461oie.19.1615306882361;
        Tue, 09 Mar 2021 08:21:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306882; cv=none;
        d=google.com; s=arc-20160816;
        b=Nmp9DAzJMa65pBftLT7sV6dyqcIU5vSUQC6WtyvI/jn3jjtPyTcixssJtMEzmtlC+K
         hgY1OU2RvuBspvhaKQg0E6qV/XOIyDDOd/xmLupC9B/arTR4SQNUOx3EyJMYsMn0ANv7
         T2EY9q+0pQ3T9PVEl2L3Rte+dwRLfJSKRn70rULh4FNherVyIKkO7OpRmeIHKPHeIkP2
         tIWyNUd9Mx5pyFe3kge8XFBa7CjIX3029/dt9G0+XkGGWZJLeyqTHh/5BJ2YF8cr2HHK
         8FjkqcLQoua0kuhZjomyaHPebowZJSrn4X5RIQYyjztkBan83tCX4DOOP9xqRRZd982k
         Q6yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=J/syEFKHrWPbx1KGImwloEHiyCqnRrD0lkTeI6w8l6k=;
        b=BwsISG2NvJNqfax2Hce/stblkuetkuZvl2uHLSCSxOUqm2rjswQ0ELGuV4qsgQvQxY
         MNPpvaw8dhBY5mT98Ew+mULCIWnqdJj3qKvw5weP37/+hTnRdaxS1d/Jy+GZAbTJIYa7
         Rg7KSkq+02R25OwLFC/8yjdG8VwegpcFbA/YwC2Bcwx70r6EEytGQoK4V4lIYSPbSDNl
         KY8KUoxo6lXgXJUv0sjr8srbPlF6YnvBe5StmtWHhKh/CQf8kdjaCAWWAvusAXjOSdiu
         YfiTnrrYVBgOqNELsmcsXrlkEAi0mFrMa/CpzeRvrJaoqvt4Nf8ptvw6c0csPT0PaCAu
         sD+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OxBzAATv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t15sor3336009otl.18.2021.03.09.08.21.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:21:22 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OxBzAATv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J/syEFKHrWPbx1KGImwloEHiyCqnRrD0lkTeI6w8l6k=;
        b=OxBzAATvDSzvsxUcA6SAlvFmP0uYHrNkz5RIpFgjRlyaVm+FPPHap/ffj6CMWn4e7y
         ZGN5v15cxS4u+dfMMHDiZYEWwlOqlsfLgVwH9wDW/tw3sB3m39Zl7dJzsrCcs/0d1gQ+
         b+plBkbxjYbLkrSnMAzWXqYlH0iylQx5uL97H1zuRJ7SlfuqLf2T2EkMC4iDc+kFqAoz
         5408Rza6N1lKCkHpZYTM+w49GiDE6ZHgQj3STY3ynLD2YZhVPxMs0qCupvlWTeZJrH/l
         RAQwNw4aY88qQ5cOnZxxaFyx76S8yG7v2UyiBnFr6oWJkNei2mbXRhExLNMeWIEt6F4f
         PCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J/syEFKHrWPbx1KGImwloEHiyCqnRrD0lkTeI6w8l6k=;
        b=D4BcmRZWkHKjn5ap70uuWWZDSoodpg5zuUiJ9ykkqx2Gvv24D9uW9RzkMngi6NdTSn
         dzv2u24aJC8Q7Kog2Z2iMR8q3eZfPMWFT/3xmyi8BbFHgN5MlmB8WWLS9WWOmGYPGCPX
         Ws3zqXCoTU/jFH/mmGl3+GNz5JRa/tytfwpJ3Bf8As/7INVWcdlTspTWy482jawc2YeF
         Yq/7NX1TpF+iTjvBWKC3mmoQG2Mlznvg6CwS9bW0T0k3Z/n8CJA6qKnn5JR28S2LKxe/
         6e2ZPPo4UGjkv/5TTAu3AMSnC4luAkhO5oW7bLv89OcR0pmEIWp+AZTOslzEwiAg4Eue
         kMaw==
X-Gm-Message-State: AOAM531zHTxknFZ9MWA6Ng9xIr/qSYKs2ujetxBcF59x78wqqwftpMC3
	u9mySADsC7sDBAJo3TW3BvaIzhFO
X-Google-Smtp-Source: ABdhPJzEdP6ySlGgEX1mwlq2x7N/nKnDPJ325VudRk9WB5F+pTfASeCzsdzna3MOd+j2PYAApBUALA==
X-Received: by 2002:a9d:2e4:: with SMTP id 91mr24998809otl.60.1615306881986;
        Tue, 09 Mar 2021 08:21:21 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:21:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 34/78] target/arm: Implement SVE2 saturating multiply-add long
Date: Tue,  9 Mar 2021 08:19:57 -0800
Message-Id: <20210309162041.23124-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: DTxEIqWS0CCa

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 14 ++++++++++
 target/arm/sve.decode      | 14 ++++++++++
 target/arm/sve_helper.c    | 30 +++++++++++++++++++++
 target/arm/translate-sve.c | 54 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 112 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 11dc6870de..d8f390617c 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2559,3 +2559,17 @@ DEF_HELPER_FLAGS_5(sve2_bcax, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_bsl1n, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_bsl2n, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_nbsl, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqdmlal_zzzw_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlal_zzzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlal_zzzw_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqdmlsl_zzzw_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlsl_zzzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlsl_zzzw_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 47fca5e12d..52f615b39e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1332,3 +1332,17 @@ FMAXNMP         01100100 .. 010 10 0 100 ... ..... ..... @rdn_pg_rm
 FMINNMP         01100100 .. 010 10 1 100 ... ..... ..... @rdn_pg_rm
 FMAXP           01100100 .. 010 11 0 100 ... ..... ..... @rdn_pg_rm
 FMINP           01100100 .. 010 11 1 100 ... ..... ..... @rdn_pg_rm
+
+#### SVE Integer Multiply-Add (unpredicated)
+
+## SVE2 saturating multiply-add long
+
+SQDMLALB_zzzw   01000100 .. 0 ..... 0110 00 ..... .....  @rda_rn_rm
+SQDMLALT_zzzw   01000100 .. 0 ..... 0110 01 ..... .....  @rda_rn_rm
+SQDMLSLB_zzzw   01000100 .. 0 ..... 0110 10 ..... .....  @rda_rn_rm
+SQDMLSLT_zzzw   01000100 .. 0 ..... 0110 11 ..... .....  @rda_rn_rm
+
+## SVE2 saturating multiply-add interleaved long
+
+SQDMLALBT       01000100 .. 0 ..... 00001 0 ..... .....  @rda_rn_rm
+SQDMLSLBT       01000100 .. 0 ..... 00001 1 ..... .....  @rda_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 7a2af036c1..bd7332be43 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1400,6 +1400,36 @@ void HELPER(sve2_adcl_d)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
     }
 }
 
+#define DO_SQDMLAL(NAME, TYPEW, TYPEN, HW, HN, DMUL_OP, SUM_OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc) \
+{                                                                       \
+    intptr_t i, opr_sz = simd_oprsz(desc);                              \
+    int sel1 = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPEN);     \
+    int sel2 = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(TYPEN); \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {                       \
+        TYPEW nn = *(TYPEN *)(vn + HN(i + sel1));                       \
+        TYPEW mm = *(TYPEN *)(vm + HN(i + sel2));                       \
+        TYPEW aa = *(TYPEW *)(va + HW(i));                              \
+        *(TYPEW *)(vd + HW(i)) = SUM_OP(aa, DMUL_OP(nn, mm));           \
+    }                                                                   \
+}
+
+DO_SQDMLAL(sve2_sqdmlal_zzzw_h, int16_t, int8_t, H1_2, H1,
+           do_sqdmull_h, DO_SQADD_H)
+DO_SQDMLAL(sve2_sqdmlal_zzzw_s, int32_t, int16_t, H1_4, H1_2,
+           do_sqdmull_s, DO_SQADD_S)
+DO_SQDMLAL(sve2_sqdmlal_zzzw_d, int64_t, int32_t,     , H1_4,
+           do_sqdmull_d, do_sqadd_d)
+
+DO_SQDMLAL(sve2_sqdmlsl_zzzw_h, int16_t, int8_t, H1_2, H1,
+           do_sqdmull_h, DO_SQSUB_H)
+DO_SQDMLAL(sve2_sqdmlsl_zzzw_s, int32_t, int16_t, H1_4, H1_2,
+           do_sqdmull_s, DO_SQSUB_S)
+DO_SQDMLAL(sve2_sqdmlsl_zzzw_d, int64_t, int32_t,     , H1_4,
+           do_sqdmull_d, do_sqsub_d)
+
+#undef DO_SQDMLAL
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c339702cd3..15cbca0674 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7509,3 +7509,57 @@ DO_SVE2_ZPZZ_FP(FMAXNMP, fmaxnmp)
 DO_SVE2_ZPZZ_FP(FMINNMP, fminnmp)
 DO_SVE2_ZPZZ_FP(FMAXP, fmaxp)
 DO_SVE2_ZPZZ_FP(FMINP, fminp)
+
+/*
+ * SVE Integer Multiply-Add (unpredicated)
+ */
+
+static bool do_sqdmlal_zzzw(DisasContext *s, arg_rrrr_esz *a,
+                            bool sel1, bool sel2)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        NULL,                           gen_helper_sve2_sqdmlal_zzzw_h,
+        gen_helper_sve2_sqdmlal_zzzw_s, gen_helper_sve2_sqdmlal_zzzw_d,
+    };
+    return do_sve2_zzzz_ool(s, a, fns[a->esz], (sel2 << 1) | sel1);
+}
+
+static bool do_sqdmlsl_zzzw(DisasContext *s, arg_rrrr_esz *a,
+                            bool sel1, bool sel2)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        NULL,                           gen_helper_sve2_sqdmlsl_zzzw_h,
+        gen_helper_sve2_sqdmlsl_zzzw_s, gen_helper_sve2_sqdmlsl_zzzw_d,
+    };
+    return do_sve2_zzzz_ool(s, a, fns[a->esz], (sel2 << 1) | sel1);
+}
+
+static bool trans_SQDMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlal_zzzw(s, a, false, false);
+}
+
+static bool trans_SQDMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlal_zzzw(s, a, true, true);
+}
+
+static bool trans_SQDMLALBT(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlal_zzzw(s, a, false, true);
+}
+
+static bool trans_SQDMLSLB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlsl_zzzw(s, a, false, false);
+}
+
+static bool trans_SQDMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlsl_zzzw(s, a, true, true);
+}
+
+static bool trans_SQDMLSLBT(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlsl_zzzw(s, a, false, true);
+}
-- 
2.25.1
