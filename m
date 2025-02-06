Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1782906njb;
        Thu, 6 Feb 2025 12:06:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW9N4mtxMkkyvXsJ1W1vO2GueHmsKFSsrPSEaWY/OVQ5HpLd0O5gdv0fEbTJWe9T+FVbOlmj0b2x1ayHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHgsRQamFhF/zHhaqPsuav0Z3P3QMzlrmS1Rf5MQ1UI3/QJpLF5ZNr6QAqtv8c+WNIHCUQ5
X-Received: by 2002:a05:6122:1d46:b0:518:8ac7:396b with SMTP id 71dfb90a1353d-51f2e1f7393mr699933e0c.8.1738872372358;
        Thu, 06 Feb 2025 12:06:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738872372; cv=none;
        d=google.com; s=arc-20240605;
        b=Sg4m6dKBSC1LRmiwf9JEPJnIw4h1iSk0XvJGFuar+JC3CtIp9x2kGCgwJXGVPla6uZ
         dn1G7HGtBh5KIdGmMBCas+Qg8op0WFm7QgBb8x8jXRrtMWBra93MBAe3lGrcU6VkDKIw
         Lr3YnrZppYQw97Ufv+TvPJI3gcVglMoj0k3QsbvRcJCKX18/yzP/uOP5GYqNt+IgdtL0
         cAe84CNoPu2WPriomTN27fK1Nb//Fdat29r7ftZXAKnqvA//WgarRsMMEBSqlx84HYcu
         zRHvKHesMzX9SS6EGm64vgaeeMmUh7Rqym7dURV4q+dKTB4dnpzmSMtIm0ulfrRWU6pm
         AAvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MaksLSdAaHMlk77gki45TIO97VoN/QpB+Uz4+FZCJdA=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=MpyidUy6v2fVUP+u3+U83A3OvOSiANJvftPOsptFrjX3UFh5SFTM0tbl2eeeDrXvth
         Au/a5sZUankTx+6u2KmhHsyK2iOSgEpytW6/m5rtS8FwdgTYT+SZC1LFgbwgkBEYxbZa
         /8x0YTKYx49Lr4D32enCNf0qyQzvZZzXT4KVUdDbwfAEgym04yITphM+Fys27nMewUV6
         Pe4ZOGXGDyw4U0ceKOPDGnmujnnZUyPz+kJxhJmacI86QIgxlJrnAaUj9CcgHjgGuDW3
         oROD0trgwXflQUaycveFf5MoM7lE3j3/wfE3lSK5QN57m60uLkUHMn6yW/g17LXw2Es+
         fDLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dUuddTWB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51f22930126si387165e0c.149.2025.02.06.12.06.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 12:06:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dUuddTWB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg88F-0004vw-J6; Thu, 06 Feb 2025 15:05:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg83s-00082f-MS
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 15:01:21 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg83j-0001AL-Go
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 15:01:19 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2f9bac7699aso1918480a91.1
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 12:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738872058; x=1739476858; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MaksLSdAaHMlk77gki45TIO97VoN/QpB+Uz4+FZCJdA=;
 b=dUuddTWBUFjg0vh+uPikXkWtrB4VdPdyRPEWGjcCVrDi9E9pPb9Qn63xUGj2cmzv4W
 LIJd5fyB4yZkyHUUWJ4Sm5Y5K8uKV7u1wDCUSzKqv4TEYPKyLBxTq8xyXFEmZn9DBjGG
 B6WKazexhtEbil2EL15hI5kFlKvY1UP83PVET3C++aOuwfawp90rYmVPZDB0zY+pk0ML
 5gKO+FXF+6BWFtoFwSHAFPDr4/F9YuNVOC/OCVj3UNAcCe37oifXGBV27HI4YWHHr9fw
 ms2DArGoLgNVd9bq9JvKnTxLK24AEgMaaXT1jrhevweUwVSKNihnvrwb7jQwY95glG3G
 2rGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738872058; x=1739476858;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MaksLSdAaHMlk77gki45TIO97VoN/QpB+Uz4+FZCJdA=;
 b=ACO+iguQfbX69+G/yAIQvqs04xsPKwrqd+zOM+cQoFZyGy8Pa+duv9BKioTiTow8oJ
 jG1lZUXG9mNcmCHrSmGLjgMxi11NYiA+hoDLvQf0jZqz1cmZwWRzBSoggaMs5+BkHW3p
 m35rFxVpoQdavrEt/oy07PIwzO6IGdZTHUs7ejQUJrcwRoqxsgBiH2qLkOCWXCHw3D+2
 U3tBUB7lEAnX/79X4yS8mbUs/C8ac9qrti+pZNdrrvMVbjZLKoTAQzaWwRrug7LKhuMT
 KbZFomH/YcYhMM8MUHyy8X6w+F9pfNWFbWjnHo+BJb+ZQJ5tEexEZe4MqV0U3Wj0zwK3
 Poeg==
X-Gm-Message-State: AOJu0YyfS8w23YSTpBvjCPbE+8c2K3sdyEi+wCBWYo9V2yLq0y/L7fe3
 +vnUh31ddBzIieGAt+oxIcUaK04Vtb2o03aLGsVlELc+HDpqWXhTpvF+UgcrtTvuiQAce7U/eek
 y
X-Gm-Gg: ASbGncsfMabylX8ZvNfl2GBN2TeRGAYD2HO1r42Hg3WAAgs4NGO/Eywo1czuocMdn4f
 UQxX7TVHg16JFzksjWQxwwCS3eqswouaBb/5IgbEFG3qYGgA5k/j40AIhWDfsQttB0i+phAerhN
 ynIDhSMH453QuHH13nxLb4TxuAtR/ygnIplxl8vYM+YV3N73SKyQ7Uyiq4dwgkFaWSzhGDHfT5L
 yDZrKgHbytFUGJRq5HjcN1nqrKOkIgwQF4Wjm2dLLnzao7WbBFZPI9/anhmWy1s3OkmcbgJosSN
 aiaSBNeV7QY4VWLKSwEAxg9+t3CwyGqyGc47wFj66Ig8OJ0=
X-Received: by 2002:a17:90b:184d:b0:2ee:9d65:65a7 with SMTP id
 98e67ed59e1d1-2fa2450d0abmr490558a91.29.1738872057721; 
 Thu, 06 Feb 2025 12:00:57 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fa09b3ee24sm1808857a91.36.2025.02.06.12.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 12:00:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 55/61] target/arm: Implement SME2 ZIP, UZP (four registers)
Date: Thu,  6 Feb 2025 11:57:09 -0800
Message-ID: <20250206195715.2150758-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: yJqLDc7NPDMI

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    | 12 ++++++
 target/arm/tcg/sme_helper.c    | 68 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c | 35 +++++++++++++++++
 target/arm/tcg/sme.decode      | 11 ++++++
 4 files changed, 126 insertions(+)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index 3d3eb393b3..1438a2a5b8 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -251,3 +251,15 @@ DEF_HELPER_FLAGS_3(sme2_uunpk2_sd, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sme2_uunpk4_bh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sme2_uunpk4_hs, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sme2_uunpk4_sd, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sme2_zip4_b, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_zip4_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_zip4_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_zip4_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_zip4_q, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sme2_uzp4_b, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_uzp4_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_uzp4_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_uzp4_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_uzp4_q, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index cf4f09dbc4..de0fec272d 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1729,3 +1729,71 @@ void HELPER(sme2_fcvtl)(void *vd, void *vs, float_status *fpst, uint32_t desc)
         d1[H4(i)] = v1;
     }
 }
+
+#define ZIP4(NAME, TYPE, H)                                     \
+void HELPER(NAME)(void *vd, void *vs, uint32_t desc)            \
+{                                                               \
+    ARMVectorReg scratch[4] __attribute__((uninitialized));     \
+    size_t oprsz = simd_oprsz(desc);                            \
+    size_t quads = oprsz / (sizeof(TYPE) * 4);                  \
+    TYPE *s0, *s1, *s2, *s3;                                    \
+    if (vs == vd) {                                             \
+        vs = memcpy(scratch, vs, sizeof(scratch));              \
+    }                                                           \
+    s0 = vs;                                                    \
+    s1 = vs + sizeof(ARMVectorReg);                             \
+    s2 = vs + 2 * sizeof(ARMVectorReg);                         \
+    s3 = vs + 3 * sizeof(ARMVectorReg);                         \
+    for (size_t r = 0; r < 4; ++r) {                            \
+        TYPE *d = vd + r * sizeof(ARMVectorReg);                \
+        size_t base = r * quads;                                \
+        for (size_t q = 0; q < quads; ++q) {                    \
+            d[H(4 * q + 0)] = s0[base + H(q)];                  \
+            d[H(4 * q + 1)] = s1[base + H(q)];                  \
+            d[H(4 * q + 2)] = s2[base + H(q)];                  \
+            d[H(4 * q + 3)] = s3[base + H(q)];                  \
+        }                                                       \
+    }                                                           \
+}
+
+ZIP4(sme2_zip4_b, uint8_t, H1)
+ZIP4(sme2_zip4_h, uint16_t, H2)
+ZIP4(sme2_zip4_s, uint32_t, H4)
+ZIP4(sme2_zip4_d, uint64_t, )
+ZIP4(sme2_zip4_q, Int128, )
+
+#undef ZIP4
+
+#define UZP4(NAME, TYPE, H)                                     \
+void HELPER(NAME)(void *vd, void *vs, uint32_t desc)            \
+{                                                               \
+    ARMVectorReg scratch[4] __attribute__((uninitialized));     \
+    size_t oprsz = simd_oprsz(desc);                            \
+    size_t quads = oprsz / (sizeof(TYPE) * 4);                  \
+    TYPE *d0, *d1, *d2, *d3;                                    \
+    if (vs == vd) {                                             \
+        vs = memcpy(scratch, vs, sizeof(scratch));              \
+    }                                                           \
+    d0 = vd;                                                    \
+    d1 = vd + sizeof(ARMVectorReg);                             \
+    d2 = vd + 2 * sizeof(ARMVectorReg);                         \
+    d3 = vd + 3 * sizeof(ARMVectorReg);                         \
+    for (size_t r = 0; r < 4; ++r) {                            \
+        TYPE *s = vs + r * sizeof(ARMVectorReg);                \
+        size_t base = r * quads;                                \
+        for (size_t q = 0; q < quads; ++q) {                    \
+            d0[base + H(q)] = s[H(4 * q + 0)];                  \
+            d1[base + H(q)] = s[H(4 * q + 1)];                  \
+            d2[base + H(q)] = s[H(4 * q + 2)];                  \
+            d3[base + H(q)] = s[H(4 * q + 3)];                  \
+        }                                                       \
+    }                                                           \
+}
+
+UZP4(sme2_uzp4_b, uint8_t, H1)
+UZP4(sme2_uzp4_h, uint16_t, H2)
+UZP4(sme2_uzp4_s, uint32_t, H4)
+UZP4(sme2_uzp4_d, uint64_t, )
+UZP4(sme2_uzp4_q, Int128, )
+
+#undef UZP4
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 9d7a10aa6b..01542e5330 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1363,3 +1363,38 @@ TRANS_FEAT(UUNPK_2sd, aa64_sme2, do_zz, a, 0, gen_helper_sme2_uunpk2_sd)
 TRANS_FEAT(UUNPK_4bh, aa64_sme2, do_zz, a, 0, gen_helper_sme2_uunpk4_bh)
 TRANS_FEAT(UUNPK_4hs, aa64_sme2, do_zz, a, 0, gen_helper_sme2_uunpk4_hs)
 TRANS_FEAT(UUNPK_4sd, aa64_sme2, do_zz, a, 0, gen_helper_sme2_uunpk4_sd)
+
+static bool do_zipuzp_4(DisasContext *s, arg_zz_e *a,
+                        gen_helper_gvec_2 * const fn[5])
+{
+    int svl = streaming_vec_reg_size(s);
+
+    /* Both MO_64 and MO_128 can fail the size test. */
+    if (svl < (4 << a->esz)) {
+        return false;
+    }
+    if (sme_sm_enabled_check(s)) {
+        tcg_gen_gvec_2_ool(vec_full_reg_offset(s, a->zd),
+                           vec_full_reg_offset(s, a->zn),
+                           svl, svl, 0, fn[a->esz]);
+    }
+    return true;
+}
+
+static gen_helper_gvec_2 * const zip4_fns[] = {
+    gen_helper_sme2_zip4_b,
+    gen_helper_sme2_zip4_h,
+    gen_helper_sme2_zip4_s,
+    gen_helper_sme2_zip4_d,
+    gen_helper_sme2_zip4_q,
+};
+TRANS_FEAT(ZIP_4, aa64_sme2, do_zipuzp_4, a, zip4_fns)
+
+static gen_helper_gvec_2 * const uzp4_fns[] = {
+    gen_helper_sme2_uzp4_b,
+    gen_helper_sme2_uzp4_h,
+    gen_helper_sme2_uzp4_s,
+    gen_helper_sme2_uzp4_d,
+    gen_helper_sme2_uzp4_q,
+};
+TRANS_FEAT(UZP_4, aa64_sme2, do_zipuzp_4, a, uzp4_fns)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 1da64c5258..a43edb625c 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -722,6 +722,7 @@ FMLS_nx_d       11000001 1101 .... 1 .. 00. ...00 10 ...    @azx_4x1_i1_o3
 
 ### SME2 Multi-vector SVE Constructive Unary
 
+&zz_e           zd zn esz
 &zz_n           zd zn n
 @zz_1x2         ........ ... ..... ...... ..... zd:5        \
                 &zz_n n=1 zn=%zn_ax2
@@ -799,3 +800,13 @@ SUNPK_4sd       11000001 111 10101 111000 ....0 ...00       @zz_4x2_n1
 UUNPK_4bh       11000001 011 10101 111000 ....0 ...01       @zz_4x2_n1
 UUNPK_4hs       11000001 101 10101 111000 ....0 ...01       @zz_4x2_n1
 UUNPK_4sd       11000001 111 10101 111000 ....0 ...01       @zz_4x2_n1
+
+ZIP_4           11000001 esz:2 1 10110 111000 ...00 ... 00   \
+                &zz_e zd=%zd_ax4 zn=%zn_ax4
+ZIP_4           11000001 001     10111 111000 ...00 ... 00   \
+                &zz_e esz=4 zd=%zd_ax4 zn=%zn_ax4
+
+UZP_4           11000001 esz:2 1 10110 111000 ...00 ... 10   \
+                &zz_e zd=%zd_ax4 zn=%zn_ax4
+UZP_4           11000001 001     10111 111000 ...00 ... 10   \
+                &zz_e esz=4 zd=%zd_ax4 zn=%zn_ax4
-- 
2.43.0

