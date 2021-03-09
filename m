Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2956061lfg;
        Tue, 9 Mar 2021 08:22:16 -0800 (PST)
X-Received: by 2002:a9d:4b8d:: with SMTP id k13mr23838252otf.354.1615306935913;
        Tue, 09 Mar 2021 08:22:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306935; cv=none;
        d=google.com; s=arc-20160816;
        b=ZjEwasIj9eQr+ZOtN/r6sErIiFS07UkvhemBtkCM2sUm/tLFSkZuntAXjCu15CZshx
         1S5Iw9gz0XBWhT9P0gjCOFM3LFyTMfpYYserikEJrcj4yjyWbOtXJL7OBSqbx5CNz+4e
         I+OzzSpvajgmOoSO8y0RfAwKTWrkYT4VbOZG7kdMREHS67XOS6iwNzVJAD/lwEg0msMO
         SfMxW6X7kOH5vGOeqCPA9vHaWf2i2YT1JUEtHmxGORXoOSWHG9sIwGIIJRQ1UHxibs+2
         M9DdweorvUU8ZYWaP6tv4podee83klpzFJhPStWkMiDZYwR+2j54TE2iw8lwamNrN5gq
         FcWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=es5j0v4Vs43+K3nW8rNBcTSafAsKaEV9dJ00NX0aUAc=;
        b=rxr0fKhoNZHkN3fRlfyzYy3kJykjOMf+PSTNntfDtkrDVU/u/H6z7FhOUGAgdE2+0M
         IFTCyz2ld7exhAgqA5VhmnO9ROxSBn46tjOTEZ/fDjTFPELeiN18fTdsLPUVuVDciTyJ
         ghE+UKvbn/ZX4XvIw9Z60VIRhgFC/nMGeh9zKPnxoBFy5szNjGOvGGB0U/F6OwIo/E4S
         Wqwh1c4CX+1TOkhv22imh3fa+NWagVIVLqSXrXm+Y88DGt2ddSUtrQ/IAlFu/tU370Ah
         QrdPxo+Ef7idZta4bssrZ8uSNliQCsnY0XstlKCqH/N9iCO0iaqJftoYDd1vdMmYaQ1p
         Zh/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TgiY6IBZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u11sor4130534oiu.82.2021.03.09.08.22.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:15 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TgiY6IBZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=es5j0v4Vs43+K3nW8rNBcTSafAsKaEV9dJ00NX0aUAc=;
        b=TgiY6IBZXp4XronzTC4hXDfPcS00gDmsdiJUIlwxce9HfCxQgqJzaOvBXS/6K6mDhl
         /jjgDRt6LOCd7PkRtCBUrzohD2KBQN8SNpkgoWs0HJOuKsrVEb7zw2bt559HLs2/GmXl
         j/iad949Q0qKWPO78K7OnqoHa4IivHYtqy42kfLZaZOZNU/qQ+nDISfL3Kebq8SLhwtk
         ju3v//xru2ny9f0CavzPtLmeVHg8mQePQJA0nG94D1gLS+6dTkvv2e1Xi9mnx82QpLkO
         BcbeNCBMHGwKp/S0MTcr6C71cxlm905JeoGqNA5NeTtwvIUWJPD8m0mzAJAgcXiJbGn8
         KNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=es5j0v4Vs43+K3nW8rNBcTSafAsKaEV9dJ00NX0aUAc=;
        b=k2QDS9ewsASryhQkDYANoXNVLciZpz0pViqevPeO5xEBNe6jYVbwLOHoyiUwvGEBGv
         6FEX65JWpcequ8aCsbpDwyQIyUwa9GT6C1LQKNqSD+9D0meOg/3ua/9eIo0s0YP1Ae+q
         hAPA6YQPM53zQfr0dI+Vhlfs5y8nWyouYBGVGezxhDVzUNGo4vk6kxlL96zyQwrNpbVq
         BkUL2iVYZvbcEn2mGMczeqZzWb+fO4E59trSnprUE2w1/NWA90I+ENWQq9d/lksspQu3
         TqQ5LONMbge4GKTfk6ERjM7o75zvGnZ5Iuzt8wRDbc3Srt4hRjcu6SHxQt4yJr+0z+Yo
         nwkw==
X-Gm-Message-State: AOAM530Q8sme7ZKc8Kug2V68j8PYnq1lGTNmhZBWu/BtUSYX8IBtFCPq
	9lUleaCVuUj2doQTifeWRXNxlxmb
X-Google-Smtp-Source: ABdhPJxrKm9ij0JoXfcy/m1W4/vlZRvD9AtD5k2o1fRVt9gk25YB/efpY+kdCgoFekWge0Vl2jLe6g==
X-Received: by 2002:aca:bc89:: with SMTP id m131mr3354028oif.62.1615306935506;
        Tue, 09 Mar 2021 08:22:15 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 54/78] target/arm: Implement SVE2 saturating multiply-add high (indexed)
Date: Tue,  9 Mar 2021 08:20:17 -0800
Message-Id: <20210309162041.23124-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: IhnGMONGeLLd

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 14 +++++++++++++
 target/arm/sve.decode      |  8 ++++++++
 target/arm/sve_helper.c    | 40 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c |  8 ++++++++
 4 files changed, 70 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 7e99dcd119..fe67574741 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2665,3 +2665,17 @@ DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_zzzz_d, TCG_CALL_NO_RWG,
 
 DEF_HELPER_FLAGS_6(fmmla_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(fmmla_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqrdmlah_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlah_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlah_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 8d761edb74..786f6837c5 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -793,6 +793,14 @@ MLS_zzxz_h      01000100 .. 1 ..... 000011 ..... .....          @rrxr_h
 MLS_zzxz_s      01000100 .. 1 ..... 000011 ..... .....          @rrxr_s
 MLS_zzxz_d      01000100 .. 1 ..... 000011 ..... .....          @rrxr_d
 
+# SVE2 saturating multiply-add high (indexed)
+SQRDMLAH_zzxz_h 01000100 .. 1 ..... 000100 ..... .....          @rrxr_h
+SQRDMLAH_zzxz_s 01000100 .. 1 ..... 000100 ..... .....          @rrxr_s
+SQRDMLAH_zzxz_d 01000100 .. 1 ..... 000100 ..... .....          @rrxr_d
+SQRDMLSH_zzxz_h 01000100 .. 1 ..... 000101 ..... .....          @rrxr_h
+SQRDMLSH_zzxz_s 01000100 .. 1 ..... 000101 ..... .....          @rrxr_s
+SQRDMLSH_zzxz_d 01000100 .. 1 ..... 000101 ..... .....          @rrxr_d
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 .. 1 ..... 111110 ..... .....          @rrx_h
 MUL_zzx_s       01000100 .. 1 ..... 111110 ..... .....          @rrx_s
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index fcfb7d1f41..b4726bb6c5 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1487,9 +1487,49 @@ DO_CMLA(sve2_sqrdcmlah_zzzz_h, int16_t, H2, DO_SQRDMLAH_H)
 DO_CMLA(sve2_sqrdcmlah_zzzz_s, int32_t, H4, DO_SQRDMLAH_S)
 DO_CMLA(sve2_sqrdcmlah_zzzz_d, int64_t,   , DO_SQRDMLAH_D)
 
+#undef DO_SQRDMLAH_B
+#undef DO_SQRDMLAH_H
+#undef DO_SQRDMLAH_S
+#undef DO_SQRDMLAH_D
 #undef do_cmla
 #undef DO_CMLA
 
+#define DO_ZZXZ(NAME, TYPE, H, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc) \
+{                                                                       \
+    intptr_t oprsz = simd_oprsz(desc), segment = 16 / sizeof(TYPE);     \
+    intptr_t i, j, idx = simd_data(desc);                               \
+    TYPE *d = vd, *a = va, *n = vn, *m = (TYPE *)vm + H(idx);           \
+    for (i = 0; i < oprsz / sizeof(TYPE); i += segment) {               \
+        TYPE mm = m[i];                                                 \
+        for (j = 0; j < segment; j++) {                                 \
+            d[i + j] = OP(n[i + j], mm, a[i + j]);                      \
+        }                                                               \
+    }                                                                   \
+}
+
+#define DO_SQRDMLAH_H(N, M, A) \
+    ({ uint32_t discard; do_sqrdmlah_h(N, M, A, false, true, &discard); })
+#define DO_SQRDMLAH_S(N, M, A) \
+    ({ uint32_t discard; do_sqrdmlah_s(N, M, A, false, true, &discard); })
+#define DO_SQRDMLAH_D(N, M, A) do_sqrdmlah_d(N, M, A, false, true)
+
+DO_ZZXZ(sve2_sqrdmlah_idx_h, int16_t, H2, DO_SQRDMLAH_H)
+DO_ZZXZ(sve2_sqrdmlah_idx_s, int32_t, H4, DO_SQRDMLAH_S)
+DO_ZZXZ(sve2_sqrdmlah_idx_d, int64_t,   , DO_SQRDMLAH_D)
+
+#define DO_SQRDMLSH_H(N, M, A) \
+    ({ uint32_t discard; do_sqrdmlah_h(N, M, A, true, true, &discard); })
+#define DO_SQRDMLSH_S(N, M, A) \
+    ({ uint32_t discard; do_sqrdmlah_s(N, M, A, true, true, &discard); })
+#define DO_SQRDMLSH_D(N, M, A) do_sqrdmlah_d(N, M, A, true, true)
+
+DO_ZZXZ(sve2_sqrdmlsh_idx_h, int16_t, H2, DO_SQRDMLSH_H)
+DO_ZZXZ(sve2_sqrdmlsh_idx_s, int32_t, H4, DO_SQRDMLSH_S)
+DO_ZZXZ(sve2_sqrdmlsh_idx_d, int64_t,   , DO_SQRDMLSH_D)
+
+#undef DO_ZZXZ
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index bee3e5a235..8e3c6df7a2 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3887,6 +3887,14 @@ DO_SVE2_RRXR(trans_MLS_zzxz_h, gen_helper_gvec_mls_idx_h)
 DO_SVE2_RRXR(trans_MLS_zzxz_s, gen_helper_gvec_mls_idx_s)
 DO_SVE2_RRXR(trans_MLS_zzxz_d, gen_helper_gvec_mls_idx_d)
 
+DO_SVE2_RRXR(trans_SQRDMLAH_zzxz_h, gen_helper_sve2_sqrdmlah_idx_h)
+DO_SVE2_RRXR(trans_SQRDMLAH_zzxz_s, gen_helper_sve2_sqrdmlah_idx_s)
+DO_SVE2_RRXR(trans_SQRDMLAH_zzxz_d, gen_helper_sve2_sqrdmlah_idx_d)
+
+DO_SVE2_RRXR(trans_SQRDMLSH_zzxz_h, gen_helper_sve2_sqrdmlsh_idx_h)
+DO_SVE2_RRXR(trans_SQRDMLSH_zzxz_s, gen_helper_sve2_sqrdmlsh_idx_s)
+DO_SVE2_RRXR(trans_SQRDMLSH_zzxz_d, gen_helper_sve2_sqrdmlsh_idx_d)
+
 #undef DO_SVE2_RRXR
 
 /*
-- 
2.25.1
