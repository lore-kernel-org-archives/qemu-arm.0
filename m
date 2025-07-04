Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1255039dyc;
        Fri, 4 Jul 2025 07:31:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZyEeOWPDg4R+s447OrsZU0TJabtI0O4+xlBmQ7gTF8Ksni63W4VsU82G3g+yNh02+frF0cQDmLbWe9g==@linaro.org
X-Google-Smtp-Source: AGHT+IHdUa6ysj6nZ6jEWhNlWRdsVH8e3erP8DyT5imV4VRS1II9BfaGhljKWSN1bovkj5K9H38n
X-Received: by 2002:a05:6122:4685:b0:531:2906:7525 with SMTP id 71dfb90a1353d-5347bfcf4afmr1982753e0c.6.1751639469729;
        Fri, 04 Jul 2025 07:31:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639469; cv=none;
        d=google.com; s=arc-20240605;
        b=LvPprsIxuuhUWmDRoiIVn8aR/EkWS+5C++UHsHcF7yn0mpG42I6K7VvgXt7hhFMMhK
         WbArpi8ECQSTMxYmI5iECo9pO0GjMLZs7gSiOzr8tBfgQlYMu0B/QTon4JDoNEsxmVS1
         G7RxjL0ff746SIJovuPuTmFRRc1aun3xsX7X/XfofmET6bec8fqfwe8mWyBuX26DZs0P
         17WPkVUzge/k4DkAf65g8wUNpywE0l8wsHDRSucvjMJpnaiDnTcemF2k31BhGV8H/9Fy
         RlYK1+/RuLqWkBRDLEf+ReKpnQgM4Ykvp7Zlg3nFuVLbrEK5TyPR6nk9Cr3GOLWs9S6y
         e87Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6RTJlXSkm58QyVl/No40Lx2q3ZM+zE/NwDCsvlQQw4g=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=A4jiGJwzo1VaU4WV9YepYBp4198wYuBN+YSoJ6W+ArmowkFUrKaCWlWhH4gm46FNdm
         1VcJlm0yzeB4bDUHjm/dCbprCiDIs7WboKzF5WmgRj0Of284Pa1GKuHds1H9nmOujJGc
         i1nqLFA5EesmFIri7KQ3APjHRpxdAmgxsf52x4dwAu9iX/Ju4iV8pAXgBrpom0CfTkvN
         X4WCV/DiNDOC9Y9rCgyu4M3T3003GXWF8EtOuy7sYGfuQy2mmWBcuQEdvZyA8KpmLkY4
         uVPHcsn5ypetyo/FNd0m9hnY9J5UNqwuu4zV25cg5sSIMnDumyQNK62Bmura2UFZqMrq
         f2AA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t3T7Bq0S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5347914d354si668061e0c.244.2025.07.04.07.31.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:31:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t3T7Bq0S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhR5-0005dY-Sz; Fri, 04 Jul 2025 10:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhM2-0004SD-VW
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:33 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLv-00084B-VV
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:30 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-610d86b3da9so260844eaf.0
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639123; x=1752243923; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6RTJlXSkm58QyVl/No40Lx2q3ZM+zE/NwDCsvlQQw4g=;
 b=t3T7Bq0SutGCCqGEQM2+uab0+P0MGwN3QFofpI5vD+z1PUYvHBshC2csi8l8YFxaDZ
 7I4Co55Kf/1dcGVzKy/bjX+wfEoyvLozz6X8xcal2S+vLHNMWw2pyiq/YZWZXmuRaovQ
 ZqQ1Db57MHsGWbmEoitUPmaBTIhvJDxHLfYcgX7FOxaQcEfNK7tqyvUCaBiSNEMGicaJ
 Dy4CG3U6YcjjaRLy7wSVIrWalkkzZfbvCixKqaCn3PAuQDVoI4555lrdntLy+9rKb9tm
 ACnHcFlOi/H8Uca5QJyJv1rV1BMTt0us2O0w+3H0NRvafL781FDRcVPvLH2kqryXLK+W
 kWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639123; x=1752243923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6RTJlXSkm58QyVl/No40Lx2q3ZM+zE/NwDCsvlQQw4g=;
 b=Smk1ZOmgF6pVUAEsI8wziIOwYOZk7e0f3jgesAQ5i1kY29QXBGH0hCl+W2l2l6eWJn
 QtevOUtmlgKZF5i/6XfMSrDcw3ZPk21MZsE3vC8lxA/c701r4RTXQeUx8ANQhTaBideZ
 sZdCtTeFRgm8sBVmUSGAPj8/w+Gn8l57OF+7IrnWHvIXWyfLIJQ8l2ZUa28YNbO7IFRu
 gqkKIC7WldnNy19rawNHPEw3+jTCMW0vRn/WEemKipqzERSZ6Gol8O/ffvCSnNVT1qDl
 uLGzscK8MdEJIIBjuXqaLLjf+8yiR7WRZt5k+mNyFn53ys6jL4Un0h+3gvlGj7q9EISG
 J70w==
X-Gm-Message-State: AOJu0YzRwOYbGwI6L3SVjxw3S9KF/vSf0twQI+bhmjczjU4e5oP1n5q+
 cx5Z0SCn+FYS7Oc/4i+Qp4RdKq8qONNgLmEMRF10vbFYc3cC1lJWG6pCeQCvwPp5WxA=
X-Gm-Gg: ASbGncsbhIwAiZcNlW0ZRF5x51EcdOlhIIHVS8FU20XwRgU3Mvop9UJ5MI5e45SLA8c
 SZsYFRM+YMKva60Lf9BLEPvPBzlwXCuBNLH/SAM9gBP1sEeaICpa5UD5BeeJwfHzLbA7OuHNA3X
 7owVT4KXzHnyiRyEKjH+qmHpya8ERu6yHmcXACbicipf+4xPjJijnwK+fV49N1rCnpwss1zcPwx
 91xt+pvkzwIqWJvh0uoxPP4rqPt8P6WuRx+0gXHjNSZM/iCzyB/ZpAkRnRdTTHuUYY8/sPqC8nU
 nM+4uGe6CHRxZIYuvRR0mAwiDlOg62j+u0oj+EoU3XwkrNu78xqMIRO3+SihtTxuzoN1opQC24R
 gXCLokVQaCDISNxgNiTHwgqzTIx1OIwZlQHtMv0yobcGVoV30
X-Received: by 2002:a05:6820:1796:b0:611:ae2b:4d33 with SMTP id
 006d021491bc7-613900ecb32mr1924112eaf.6.1751639122700; 
 Fri, 04 Jul 2025 07:25:22 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 064/108] target/arm: Implement SME2 SQRSHR, UQRSHR, SQRSHRN
Date: Fri,  4 Jul 2025 08:20:27 -0600
Message-ID: <20250704142112.1018902-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2c.google.com
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
X-TUID: FS5nl9QsK+N1

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    |  20 ++++++
 target/arm/tcg/sme_helper.c    | 120 +++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c |  33 +++++++++
 target/arm/tcg/sme.decode      |  37 ++++++++++
 4 files changed, 210 insertions(+)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index 7e21f1095a..97428bcd6b 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -266,3 +266,23 @@ DEF_HELPER_FLAGS_3(sme2_uzp4_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sme2_uzp4_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sme2_uzp4_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sme2_uzp4_q, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sme2_sqrshr_sh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_uqrshr_sh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sqrshru_sh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sqrshr_sb, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_uqrshr_sb, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sqrshru_sb, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sqrshr_dh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_uqrshr_dh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sqrshru_dh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sme2_sqrshrn_sh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_uqrshrn_sh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sqrshrun_sh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sqrshrn_sb, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_uqrshrn_sb, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sqrshrun_sb, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sqrshrn_dh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_uqrshrn_dh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sqrshrun_dh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 4a05fff5fe..2e95fe38cd 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1626,6 +1626,66 @@ SQCVT4(sme2_sqcvtu_dh, int64_t, uint16_t, H8, H2, do_usat_h)
 
 #undef SQCVT4
 
+#define SQRSHR2(NAME, TW, TN, HW, HN, RSHR, SAT)                \
+void HELPER(NAME)(void *vd, void *vs, uint32_t desc)            \
+{                                                               \
+    ARMVectorReg scratch;                                       \
+    size_t oprsz = simd_oprsz(desc), n = oprsz / sizeof(TW);    \
+    int shift = simd_data(desc);                                \
+    TW *s0 = vs, *s1 = vs + sizeof(ARMVectorReg);               \
+    TN *d = vd;                                                 \
+    if (vectors_overlap(vd, 1, vs, 2)) {                        \
+        d = (TN *)&scratch;                                     \
+    }                                                           \
+    for (size_t i = 0; i < n; ++i) {                            \
+        d[HN(i)] = SAT(RSHR(s0[HW(i)], shift));                 \
+        d[HN(i + n)] = SAT(RSHR(s1[HW(i)], shift));             \
+    }                                                           \
+    if (d != vd) {                                              \
+        memcpy(vd, d, oprsz);                                   \
+    }                                                           \
+}
+
+SQRSHR2(sme2_sqrshr_sh, int32_t, int16_t, H4, H2, do_srshr, do_ssat_h)
+SQRSHR2(sme2_uqrshr_sh, uint32_t, uint16_t, H4, H2, do_urshr, do_usat_h)
+SQRSHR2(sme2_sqrshru_sh, int32_t, uint16_t, H4, H2, do_srshr, do_usat_h)
+
+#undef SQRSHR2
+
+#define SQRSHR4(NAME, TW, TN, HW, HN, RSHR, SAT)                \
+void HELPER(NAME)(void *vd, void *vs, uint32_t desc)            \
+{                                                               \
+    ARMVectorReg scratch;                                       \
+    size_t oprsz = simd_oprsz(desc), n = oprsz / sizeof(TW);    \
+    int shift = simd_data(desc);                                \
+    TW *s0 = vs, *s1 = vs + sizeof(ARMVectorReg);               \
+    TW *s2 = vs + 2 * sizeof(ARMVectorReg);                     \
+    TW *s3 = vs + 3 * sizeof(ARMVectorReg);                     \
+    TN *d = vd;                                                 \
+    if (vectors_overlap(vd, 1, vs, 4)) {                        \
+        d = (TN *)&scratch;                                     \
+    }                                                           \
+    for (size_t i = 0; i < n; ++i) {                            \
+        d[HN(i)] = SAT(RSHR(s0[HW(i)], shift));                 \
+        d[HN(i + n)] = SAT(RSHR(s1[HW(i)], shift));             \
+        d[HN(i + 2 * n)] = SAT(RSHR(s2[HW(i)], shift));         \
+        d[HN(i + 3 * n)] = SAT(RSHR(s3[HW(i)], shift));         \
+    }                                                           \
+    if (d != vd) {                                              \
+        memcpy(vd, d, oprsz);                                   \
+    }                                                           \
+}
+
+SQRSHR4(sme2_sqrshr_sb, int32_t, int8_t, H4, H2, do_srshr, do_ssat_b)
+SQRSHR4(sme2_uqrshr_sb, uint32_t, uint8_t, H4, H2, do_urshr, do_usat_b)
+SQRSHR4(sme2_sqrshru_sb, int32_t, uint8_t, H4, H2, do_srshr, do_usat_b)
+
+SQRSHR4(sme2_sqrshr_dh, int64_t, int16_t, H8, H2, do_srshr, do_ssat_h)
+SQRSHR4(sme2_uqrshr_dh, uint64_t, uint16_t, H8, H2, do_urshr, do_usat_h)
+SQRSHR4(sme2_sqrshru_dh, int64_t, uint16_t, H8, H2, do_srshr, do_usat_h)
+
+#undef SQRSHR4
+
 /* Convert and interleave */
 void HELPER(sme2_bfcvtn)(void *vd, void *vs, float_status *fpst, uint32_t desc)
 {
@@ -1715,6 +1775,66 @@ SQCVTN4(sme2_sqcvtun_dh, int64_t, uint16_t, H8, H2, do_usat_h)
 
 #undef SQCVTN4
 
+#define SQRSHRN2(NAME, TW, TN, HW, HN, RSHR, SAT)               \
+void HELPER(NAME)(void *vd, void *vs, uint32_t desc)            \
+{                                                               \
+    ARMVectorReg scratch;                                       \
+    size_t oprsz = simd_oprsz(desc), n = oprsz / sizeof(TW);    \
+    int shift = simd_data(desc);                                \
+    TW *s0 = vs, *s1 = vs + sizeof(ARMVectorReg);               \
+    TN *d = vd;                                                 \
+    if (vectors_overlap(vd, 1, vs, 2)) {                        \
+        d = (TN *)&scratch;                                     \
+    }                                                           \
+    for (size_t i = 0; i < n; ++i) {                            \
+        d[HN(2 * i + 0)] = SAT(RSHR(s0[HW(i)], shift));         \
+        d[HN(2 * i + 1)] = SAT(RSHR(s1[HW(i)], shift));         \
+    }                                                           \
+    if (d != vd) {                                              \
+        memcpy(vd, d, oprsz);                                   \
+    }                                                           \
+}
+
+SQRSHRN2(sme2_sqrshrn_sh, int32_t, int16_t, H4, H2, do_srshr, do_ssat_h)
+SQRSHRN2(sme2_uqrshrn_sh, uint32_t, uint16_t, H4, H2, do_urshr, do_usat_h)
+SQRSHRN2(sme2_sqrshrun_sh, int32_t, uint16_t, H4, H2, do_srshr, do_usat_h)
+
+#undef SQRSHRN2
+
+#define SQRSHRN4(NAME, TW, TN, HW, HN, RSHR, SAT)               \
+void HELPER(NAME)(void *vd, void *vs, uint32_t desc)            \
+{                                                               \
+    ARMVectorReg scratch;                                       \
+    size_t oprsz = simd_oprsz(desc), n = oprsz / sizeof(TW);    \
+    int shift = simd_data(desc);                                \
+    TW *s0 = vs, *s1 = vs + sizeof(ARMVectorReg);               \
+    TW *s2 = vs + 2 * sizeof(ARMVectorReg);                     \
+    TW *s3 = vs + 3 * sizeof(ARMVectorReg);                     \
+    TN *d = vd;                                                 \
+    if (vectors_overlap(vd, 1, vs, 4)) {                        \
+        d = (TN *)&scratch;                                     \
+    }                                                           \
+    for (size_t i = 0; i < n; ++i) {                            \
+        d[HN(4 * i + 0)] = SAT(RSHR(s0[HW(i)], shift));         \
+        d[HN(4 * i + 1)] = SAT(RSHR(s1[HW(i)], shift));         \
+        d[HN(4 * i + 2)] = SAT(RSHR(s2[HW(i)], shift));         \
+        d[HN(4 * i + 3)] = SAT(RSHR(s3[HW(i)], shift));         \
+    }                                                           \
+    if (d != vd) {                                              \
+        memcpy(vd, d, oprsz);                                   \
+    }                                                           \
+}
+
+SQRSHRN4(sme2_sqrshrn_sb, int32_t, int8_t, H4, H1, do_srshr, do_ssat_b)
+SQRSHRN4(sme2_uqrshrn_sb, uint32_t, uint8_t, H4, H1, do_urshr, do_usat_b)
+SQRSHRN4(sme2_sqrshrun_sb, int32_t, uint8_t, H4, H1, do_srshr, do_usat_b)
+
+SQRSHRN4(sme2_sqrshrn_dh, int64_t, int16_t, H8, H2, do_srshr, do_ssat_h)
+SQRSHRN4(sme2_uqrshrn_dh, uint64_t, uint16_t, H8, H2, do_urshr, do_usat_h)
+SQRSHRN4(sme2_sqrshrun_dh, int64_t, uint16_t, H8, H2, do_srshr, do_usat_h)
+
+#undef SQRSHRN4
+
 /* Expand and convert */
 void HELPER(sme2_fcvt_w)(void *vd, void *vs, float_status *fpst, uint32_t desc)
 {
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index de9545ee6d..d413efd20e 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1474,3 +1474,36 @@ static gen_helper_gvec_2 * const uzp4_fns[] = {
     gen_helper_sme2_uzp4_q,
 };
 TRANS_FEAT(UZP_4, aa64_sme2, do_zipuzp_4, a, uzp4_fns)
+
+static bool do_zz_rshr(DisasContext *s, arg_rshr *a, gen_helper_gvec_2 *fn)
+{
+    if (sve_access_check(s)) {
+        int vl = vec_full_reg_size(s);
+        tcg_gen_gvec_2_ool(vec_full_reg_offset(s, a->zd),
+                           vec_full_reg_offset(s, a->zn),
+                           vl, vl, a->shift, fn);
+    }
+    return true;
+}
+
+TRANS_FEAT(SQRSHR_sh, aa64_sme2, do_zz_rshr, a, gen_helper_sme2_sqrshr_sh)
+TRANS_FEAT(UQRSHR_sh, aa64_sme2, do_zz_rshr, a, gen_helper_sme2_uqrshr_sh)
+TRANS_FEAT(SQRSHRU_sh, aa64_sme2, do_zz_rshr, a, gen_helper_sme2_sqrshru_sh)
+
+TRANS_FEAT(SQRSHR_sb, aa64_sme2, do_zz_rshr, a, gen_helper_sme2_sqrshr_sb)
+TRANS_FEAT(SQRSHR_dh, aa64_sme2, do_zz_rshr, a, gen_helper_sme2_sqrshr_dh)
+TRANS_FEAT(UQRSHR_sb, aa64_sme2, do_zz_rshr, a, gen_helper_sme2_uqrshr_sb)
+TRANS_FEAT(UQRSHR_dh, aa64_sme2, do_zz_rshr, a, gen_helper_sme2_uqrshr_dh)
+TRANS_FEAT(SQRSHRU_sb, aa64_sme2, do_zz_rshr, a, gen_helper_sme2_sqrshru_sb)
+TRANS_FEAT(SQRSHRU_dh, aa64_sme2, do_zz_rshr, a, gen_helper_sme2_sqrshru_dh)
+
+TRANS_FEAT(SQRSHRN_sh, aa64_sme2_or_sve2p1, do_zz_rshr, a, gen_helper_sme2_sqrshrn_sh)
+TRANS_FEAT(UQRSHRN_sh, aa64_sme2_or_sve2p1, do_zz_rshr, a, gen_helper_sme2_uqrshrn_sh)
+TRANS_FEAT(SQRSHRUN_sh, aa64_sme2_or_sve2p1, do_zz_rshr, a, gen_helper_sme2_sqrshrun_sh)
+
+TRANS_FEAT(SQRSHRN_sb, aa64_sme2, do_zz_rshr, a, gen_helper_sme2_sqrshrn_sb)
+TRANS_FEAT(SQRSHRN_dh, aa64_sme2, do_zz_rshr, a, gen_helper_sme2_sqrshrn_dh)
+TRANS_FEAT(UQRSHRN_sb, aa64_sme2, do_zz_rshr, a, gen_helper_sme2_uqrshrn_sb)
+TRANS_FEAT(UQRSHRN_dh, aa64_sme2, do_zz_rshr, a, gen_helper_sme2_uqrshrn_dh)
+TRANS_FEAT(SQRSHRUN_sb, aa64_sme2, do_zz_rshr, a, gen_helper_sme2_sqrshrun_sb)
+TRANS_FEAT(SQRSHRUN_dh, aa64_sme2, do_zz_rshr, a, gen_helper_sme2_sqrshrun_dh)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 81783b4705..05d513efba 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -811,3 +811,40 @@ UZP_4           11000001 esz:2 1 10110 111000 ...00 ... 10   \
                 &zz_e zd=%zd_ax4 zn=%zn_ax4
 UZP_4           11000001 001     10111 111000 ...00 ... 10   \
                 &zz_e esz=4 zd=%zd_ax4 zn=%zn_ax4
+
+### SME2 Multi-vector SVE Constructive Binary
+
+&rshr           zd zn shift
+
+%rshr_sh_shift  16:4 !function=rsub_16
+%rshr_sb_shift  16:5 !function=rsub_32
+%rshr_dh_shift  22:1 16:5 !function=rsub_64
+
+@rshr_sh        ........ .... .... ...... ..... zd:5        \
+                &rshr zn=%zn_ax2 shift=%rshr_sh_shift
+@rshr_sb        ........ ... ..... ...... ..... zd:5        \
+                &rshr zn=%zn_ax4 shift=%rshr_sb_shift
+@rshr_dh        ........ ... ..... ...... ..... zd:5        \
+                &rshr zn=%zn_ax4 shift=%rshr_dh_shift
+
+SQRSHR_sh       11000001 1110 .... 110101 ....0 .....       @rshr_sh
+UQRSHR_sh       11000001 1110 .... 110101 ....1 .....       @rshr_sh
+SQRSHRU_sh      11000001 1111 .... 110101 ....0 .....       @rshr_sh
+
+SQRSHR_sb       11000001 011 ..... 110110 ...00 .....       @rshr_sb
+SQRSHR_dh       11000001 1.1 ..... 110110 ...00 .....       @rshr_dh
+UQRSHR_sb       11000001 011 ..... 110110 ...01 .....       @rshr_sb
+UQRSHR_dh       11000001 1.1 ..... 110110 ...01 .....       @rshr_dh
+SQRSHRU_sb      11000001 011 ..... 110110 ...10 .....       @rshr_sb
+SQRSHRU_dh      11000001 1.1 ..... 110110 ...10 .....       @rshr_dh
+
+SQRSHRN_sh      01000101 1011 .... 001010 ....0 .....       @rshr_sh
+UQRSHRN_sh      01000101 1011 .... 001110 ....0 .....       @rshr_sh
+SQRSHRUN_sh     01000101 1011 .... 000010 ....0 .....       @rshr_sh
+
+SQRSHRN_sb      11000001 011 ..... 110111 ...00 .....       @rshr_sb
+SQRSHRN_dh      11000001 1.1 ..... 110111 ...00 .....       @rshr_dh
+UQRSHRN_sb      11000001 011 ..... 110111 ...01 .....       @rshr_sb
+UQRSHRN_dh      11000001 1.1 ..... 110111 ...01 .....       @rshr_dh
+SQRSHRUN_sb     11000001 011 ..... 110111 ...10 .....       @rshr_sb
+SQRSHRUN_dh     11000001 1.1 ..... 110111 ...10 .....       @rshr_dh
-- 
2.43.0

