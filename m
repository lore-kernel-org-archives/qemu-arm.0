Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955013lfg;
        Tue, 9 Mar 2021 08:21:01 -0800 (PST)
X-Received: by 2002:aca:b108:: with SMTP id a8mr3425949oif.1.1615306861416;
        Tue, 09 Mar 2021 08:21:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306861; cv=none;
        d=google.com; s=arc-20160816;
        b=zUgaw81FbdXnb2ZqjHPGPoXwbDOajnUrKi+OrUndhLi6MCX4Tdy+COXBwbief8wZr5
         gLR+8o99tU9rwUo6YrwV+IO7Y0ZfSM6sDqFtbz13bTmjK5ewhCuZOi0ht6aRIaEk10aE
         JgWp0WdtjKD2vBo4on3PWTLAUXyMrVJzRU0wTEQSsyg/22zbspQIdxPEx6H5z2fIUHZC
         /6bsLI8ruOUjiLiXyeW40e4A5jg0xKTFDaFd3aOu6mx9dADybQ0wfJb9eNCU6/5yrxYU
         Fr6wqvYx44zutQMtcGpsWKgsS3NGbbWZKFXQ22xiKRvbsZDLKlv0K9OfHh0t1L/BKgtC
         NiWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1ZQl5tAHE23Q9wb6v8En0geqPTjfeiUtEihoaGG8gow=;
        b=gsvQTn1Np2nqfRn1o0ozmvYUbgM7g1prgs2GSgXMhkIyveJPsHnff9hgp14v+GcW0Z
         1M45AzxghFX6YMtiRSzTlmGSEXyguOQiu4YLxCtBFZUupumHpoiELTGlZ5YgOdrRsPd9
         E1HKLP11nqJJZM126nmgKnXUkHaPR0+FLw0gV5JPuh4Jk465rqafVXRMriFcYVOhf3By
         2wL/OC2bY9sMle/hFqqxjqEM2byHN+f3cPUTfdh6OnhlnmHUZIw3QPAZ+iTZ9CSnNPrl
         Q9Rw+07j7xEsOB92ufGnlG0k4jbto8pbomW6d6WmIcXXcfwkGYg3kYQ15hes9/HEa4Dl
         hE9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IkrZQtGS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e5sor1675969oii.125.2021.03.09.08.21.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:21:01 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IkrZQtGS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1ZQl5tAHE23Q9wb6v8En0geqPTjfeiUtEihoaGG8gow=;
        b=IkrZQtGSZl0n9+EqICXW9HCsxrQ7gUaoQVgPHWvhphUYvWbXf6vyA+z3v1m+TnmfJT
         06+v1Aphui73fWutYl4yrRyddhs+06mtKYtU62ZAcCaqL1+29lGmgub+Mux6f3PKEEGQ
         Enb0cmOmO6Fuc54YFdKiS8597c/yI/50fSpPt7ocqz/epOPnT5WM7S0uMHM9nIQEqnMd
         xxHg389+aO9MV3Gt74BIfZBIHHU8VbMStz8HgY8gwSObubkSdVmRcPEonmskYlMl5HED
         NuHJ4dGFhBGcs+Qq5mKJj1PartIR2/I1KJLCvQsj3AGiGBy1JgJrA+pS3r5cPuaw9pia
         oiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1ZQl5tAHE23Q9wb6v8En0geqPTjfeiUtEihoaGG8gow=;
        b=WAm849F6l1zceyEvD8Di9BpE8xrSAIXSeoXVyO9F9GmJHsGJ6uWeaYHME8lun+bc4K
         v1n1S27NJH+CWuZJsoNf8HVq4q4sfKzDBFjBF2AOpoI7vTI0/HNOJiP4SATpRHz7ShH3
         atTfoq+d98Xsqx/mvXP33HskZr0xsUXf5z66nBA00R32kbEwczQTy5x0Xqk/shVuVE2E
         FT2YrylSQ3BoVkRFwdsRI2s2pbP5OEliYL/JHbbXdJq6O8eFOlvgzXv9rDoDgNt3RL43
         A5XJ9ja/SKZGQTg5RsyCq4RqC6otgMpkl0zAGl8gHsiTBZcf7ri2Lqje1UdHDbEJwH0p
         GFwQ==
X-Gm-Message-State: AOAM533ITnddvZe9pGuZjtOEVb9lzrO9zc0ce8DFoNgjRFI8A7fuDPIa
	1oc/G/pFELM2gnmUQbxPvhK1sefIQc7IJKqLoa0=
X-Google-Smtp-Source: ABdhPJxInkcsJoEJW47MgLp7qpY/Q4S/r3d9qRLnG2ct1Ofcj54fJbZWdD/jWI07vE7wJrlYqAvSjw==
X-Received: by 2002:a54:488b:: with SMTP id r11mr3635864oic.166.1615306861043;
        Tue, 09 Mar 2021 08:21:01 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:21:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 16/78] target/arm: Implement SVE2 bitwise exclusive-or interleaved
Date: Tue,  9 Mar 2021 08:19:39 -0800
Message-Id: <20210309162041.23124-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: FmTtltKi4b/C

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      |  5 +++++
 target/arm/sve_helper.c    | 20 ++++++++++++++++++++
 target/arm/translate-sve.c | 19 +++++++++++++++++++
 4 files changed, 49 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 740939e7a8..f65818da05 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2372,3 +2372,8 @@ DEF_HELPER_FLAGS_3(sve2_sshll_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_ushll_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_ushll_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_ushll_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_eoril_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_eoril_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_eoril_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_eoril_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a3191eba7b..0922a44829 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1215,3 +1215,8 @@ SSHLLB          01000101 .. 0 ..... 1010 00 ..... .....  @rd_rn_tszimm_shl
 SSHLLT          01000101 .. 0 ..... 1010 01 ..... .....  @rd_rn_tszimm_shl
 USHLLB          01000101 .. 0 ..... 1010 10 ..... .....  @rd_rn_tszimm_shl
 USHLLT          01000101 .. 0 ..... 1010 11 ..... .....  @rd_rn_tszimm_shl
+
+## SVE2 bitwise exclusive-or interleaved
+
+EORBT           01000101 .. 0 ..... 10010 0 ..... .....  @rd_rn_rm
+EORTB           01000101 .. 0 ..... 10010 1 ..... .....  @rd_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 3e80b612ea..9f5d143348 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1221,6 +1221,26 @@ DO_ZZZ_WTB(sve2_usubw_d, uint64_t, uint32_t,     , H1_4, DO_SUB)
 
 #undef DO_ZZZ_WTB
 
+#define DO_ZZZ_NTB(NAME, TYPE, H, OP)                                   \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)          \
+{                                                                       \
+    intptr_t i, opr_sz = simd_oprsz(desc);                              \
+    intptr_t sel1 = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPE); \
+    intptr_t sel2 = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(TYPE); \
+    for (i = 0; i < opr_sz; i += 2 * sizeof(TYPE)) {                    \
+        TYPE nn = *(TYPE *)(vn + H(i + sel1));                          \
+        TYPE mm = *(TYPE *)(vm + H(i + sel2));                          \
+        *(TYPE *)(vd + H(i + sel1)) = OP(nn, mm);                       \
+    }                                                                   \
+}
+
+DO_ZZZ_NTB(sve2_eoril_b, uint8_t, H1, DO_EOR)
+DO_ZZZ_NTB(sve2_eoril_h, uint16_t, H1_2, DO_EOR)
+DO_ZZZ_NTB(sve2_eoril_s, uint32_t, H1_4, DO_EOR)
+DO_ZZZ_NTB(sve2_eoril_d, uint64_t,     , DO_EOR)
+
+#undef DO_ZZZ_NTB
+
 #define DO_ZZI_SHLL(NAME, TYPEW, TYPEN, HW, HN) \
 void HELPER(NAME)(void *vd, void *vn, uint32_t desc)           \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0f8686d47e..ea03bf6609 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6031,6 +6031,25 @@ DO_SVE2_ZZZ_TB(SMULLT_zzz, smull_zzz, true, true)
 DO_SVE2_ZZZ_TB(UMULLB_zzz, umull_zzz, false, false)
 DO_SVE2_ZZZ_TB(UMULLT_zzz, umull_zzz, true, true)
 
+static bool do_eor_tb(DisasContext *s, arg_rrr_esz *a, bool sel1)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_eoril_b, gen_helper_sve2_eoril_h,
+        gen_helper_sve2_eoril_s, gen_helper_sve2_eoril_d,
+    };
+    return do_sve2_zzw_ool(s, a, fns[a->esz], (!sel1 << 1) | sel1);
+}
+
+static bool trans_EORBT(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_eor_tb(s, a, false);
+}
+
+static bool trans_EORTB(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_eor_tb(s, a, true);
+}
+
 static bool do_trans_pmull(DisasContext *s, arg_rrr_esz *a, bool sel)
 {
     static gen_helper_gvec_3 * const fns[4] = {
-- 
2.25.1
