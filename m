Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1257134dyc;
        Fri, 4 Jul 2025 07:34:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhHYqJBdWw+9hX0A6K1T9IMntE/9UzOeeu387eVoAeCoJWgea7oWSvotQrQwqbjuFLdmVHCEqOXFlEXg==@linaro.org
X-Google-Smtp-Source: AGHT+IFR/vj/H7bkVqxWkEcSO425f3gRWKEs4JsdEoO0ez3XFKWJGscTpse2/MvoyXpFxne9mcql
X-Received: by 2002:a05:6102:3f45:b0:4e2:a235:24d1 with SMTP id ada2fe7eead31-4f2ee04d158mr2279258137.4.1751639653031;
        Fri, 04 Jul 2025 07:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639653; cv=none;
        d=google.com; s=arc-20240605;
        b=cDIP4HwOPs8HbS5qRKl94yFJCsj0N7c9ZmrGCvA/LWeEXKZUnz+BM2WSEx/puUG/69
         OP95DmRjqjCr1NAIxZPNCmuhh+ghfypDB3OQyRLmgBF1OYII9bsKstgHbZNXJZlEBSPu
         6mypUzukWstca8A91bDnGQVqOlM+9G7FNJYTxJNdHYMpKMr7TT+cBlzn5GK5ASjLczk5
         v+gDnYGfOd0Wa1OKTJfICa5Kkc4YPJSbrsvx57GRsWRTfDisgFFZTIKWVX5lZtxBle6r
         nsepawOkMBexDtigKmUwqdkp+q9tGjAKw5/gDy5lt4jjl4OfGXXE3zPtWZap2pebhXy4
         KGcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=k1G33WVqioRsrQWCp2/+ORoUwGCcrV2VANzEPAOaFnQ=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=GR23Mhxyl1+cCrA3ygyf1QYJl6v2+PE0D10+4D0Q3wXuYhAygAUuVSwj2SGmTiwMfH
         cgO0QlMK+iJLHiTO+EOcA/Know7tMH1Wy/dQgRmcHGrdBCCGBpCRjL6TXKRg2w22RTqF
         AsPsCmfJtf2tnkGy0OJZi0Ep1DJVDZ9mYIfyl7drKQ6rhnQhYJSbxyWdFWqq3SgAA5Xq
         6ao5HtfcRbTOUkKQdpXuqOaexGMgkQMf2r5Pqm4viPfC+UYys2kBMA+AYTf2qQc4I6C+
         wSf97cleeFBhEH5QOiGad/+kgx/Yu2aVxNzQnGh7xKFzpXn1YGY6qPhheQwOKGe3fpUc
         Tyyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=orn8rg40;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4f2ea738042si835932137.455.2025.07.04.07.34.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:34:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=orn8rg40;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhOd-0001rT-QX; Fri, 04 Jul 2025 10:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhM0-0004KZ-Am
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:32 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLr-00080Z-SJ
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:27 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-6138aedd718so618869eaf.0
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639118; x=1752243918; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k1G33WVqioRsrQWCp2/+ORoUwGCcrV2VANzEPAOaFnQ=;
 b=orn8rg40PojtyDSbHduKZlcZF4z2nidZ/n2h0N7wGnohpqcm11uURc3m290RQG9aMQ
 Z07k4LFND3wkXbPRfJQjH/lYPk/rGn3dgtmnBV8Izbzn0Tef6MnZoCzvLoFlJHHoyxZU
 /gzc8wsnpR6/FLybtWV20q1UuL/L/F1MDEz/uuW1OG/uCQW3qJmBHiLdBPiMFLI6Ii1X
 HHC95gA7nw1aik2v2GAv1v3jarpquM6hTgXiK7s/s2jl+QtmJJE+ydTtxanb1H4J3lzO
 i2kzuCkDORklsUtY8es0LCTkdya5g1nbR1gms+ZBMz+g8Tfw/yIAX7nBTyltBGaF/xsK
 /uPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639118; x=1752243918;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k1G33WVqioRsrQWCp2/+ORoUwGCcrV2VANzEPAOaFnQ=;
 b=BZcLy0rK5RiPOnEHtbB4VTK9n4HWEfqXsiYzuJSwct6oqNRrK3j7deCp+63OmE3tyM
 8y8HpIQQW6TF0ErWv3iHdPQmaRuOaU+mLbhuS9BoDXQMhsCr0CKuqgh5ZzNpVO8IzN7d
 gxiqBEGWzkifgSESDMIxZ7nDEht01UwodKvCHM/RvZOtT3Xzk0+vVj4Fx48jf1r6+wn8
 m0N8AHBb4xqzfiS3E151rfSspUCJ1XDYDaL8vrX8uQQvVceEQM8wVat0Xszwkp9xv/aw
 7Zb5IILQhx5MiCm5Ou6aMd8DiEy/sWiULyt/OuYQl1+Af2LonKY8uRj7NuB9WivjGzi/
 m/ZA==
X-Gm-Message-State: AOJu0YzrGJPRzmfsGb/svgjBb4Kgi4P0aMJXv+OyajRAjNi7S6mtFXLS
 4C/uigeJ/EDN1AclOWF+uJo1coX4sEm58VuC4m8CXQ0flVLNtLsIrrsCBQ1x6c8kp8QwXDSDfgl
 ckAnaWdw=
X-Gm-Gg: ASbGncsp+OhWgCCB6b81c/lc2ewdmTlynB/+puvZAqW+tZNceDgKA0hZ6S9FzBWw02R
 CLxdKu+V0Jwh8iuGqbiqUG3atarqRi+dVyla1B3ZTDMbzcvvpgTLF3nhKVt8G/+eJlTeILIXMbz
 Lky/OUYbchBnXkcRd4eA2Q9NPdAqG9vnw79oIGdVuCZAlaa46DvyWOLloNlCUvxijTXRYHalunF
 o3xY5L6g+tz91GJFxPDXFYQ93VPhevbxHl0aGjX31u4Amsb4HV/3vuw3QvdJZK4UO8nU0HHGU6Q
 A58QAV2Q4vXkbE3nVF2LS13HpR4iQMzebV/av0wH4jKihjXT+NHKr7eaWgNuov1eb23AFA1YOWS
 EOta74LVkgDkfIprOpGs6907OhO+gCiJ6AFgc4KLokMpnhTfH
X-Received: by 2002:a05:6820:310b:b0:611:adce:2cb4 with SMTP id
 006d021491bc7-6138fa1f981mr2087521eaf.3.1751639117891; 
 Fri, 04 Jul 2025 07:25:17 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 059/108] target/arm: Implement SME2 SQCVT, UQCVT, SQCVTU
Date: Fri,  4 Jul 2025 08:20:22 -0600
Message-ID: <20250704142112.1018902-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc35.google.com
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
X-TUID: M007fEnqLSZw

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    |  20 ++++++
 target/arm/tcg/sme_helper.c    | 116 +++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c |  35 ++++++++++
 target/arm/tcg/sme.decode      |  22 +++++++
 4 files changed, 193 insertions(+)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index 6314ad7e01..792b993695 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -221,3 +221,23 @@ DEF_HELPER_FLAGS_4(sme2_fcvt_w, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_4(sme2_fcvtl, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_4(sme2_scvtf, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_4(sme2_ucvtf, TCG_CALL_NO_RWG, void, ptr, ptr, fpst, i32)
+
+DEF_HELPER_FLAGS_3(sme2_sqcvt_sb, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_uqcvt_sb, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sqcvtu_sb, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sqcvt_sh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_uqcvt_sh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sqcvtu_sh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sqcvt_dh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_uqcvt_dh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sqcvtu_dh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sme2_sqcvtn_sb, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_uqcvtn_sb, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sqcvtun_sb, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sqcvtn_sh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_uqcvtn_sh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sqcvtun_sh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sqcvtn_dh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_uqcvtn_dh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sme2_sqcvtun_dh, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index d3841400ee..094a1e57f3 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1568,6 +1568,64 @@ void HELPER(sme2_fcvt_n)(void *vd, void *vs, float_status *fpst, uint32_t desc)
     }
 }
 
+#define SQCVT2(NAME, TW, TN, HW, HN, SAT)                       \
+void HELPER(NAME)(void *vd, void *vs, uint32_t desc)            \
+{                                                               \
+    ARMVectorReg scratch;                                       \
+    size_t oprsz = simd_oprsz(desc), n = oprsz / sizeof(TW);    \
+    TW *s0 = vs, *s1 = vs + sizeof(ARMVectorReg);               \
+    TN *d = vd;                                                 \
+    if (vectors_overlap(vd, 1, vs, 2)) {                        \
+        d = (TN *)&scratch;                                     \
+    }                                                           \
+    for (size_t i = 0; i < n; ++i) {                            \
+        d[HN(i)] = SAT(s0[HW(i)]);                              \
+        d[HN(i + n)] = SAT(s1[HW(i)]);                          \
+    }                                                           \
+    if (d != vd) {                                              \
+        memcpy(vd, d, oprsz);                                   \
+    }                                                           \
+}
+
+SQCVT2(sme2_sqcvt_sh, int32_t, int16_t, H4, H2, do_ssat_h)
+SQCVT2(sme2_uqcvt_sh, uint32_t, uint16_t, H4, H2, do_usat_h)
+SQCVT2(sme2_sqcvtu_sh, int32_t, uint16_t, H4, H2, do_usat_h)
+
+#undef SQCVT2
+
+#define SQCVT4(NAME, TW, TN, HW, HN, SAT)                       \
+void HELPER(NAME)(void *vd, void *vs, uint32_t desc)            \
+{                                                               \
+    ARMVectorReg scratch;                                       \
+    size_t oprsz = simd_oprsz(desc), n = oprsz / sizeof(TW);    \
+    TW *s0 = vs, *s1 = vs + sizeof(ARMVectorReg);               \
+    TW *s2 = vs + 2 * sizeof(ARMVectorReg);                     \
+    TW *s3 = vs + 3 * sizeof(ARMVectorReg);                     \
+    TN *d = vd;                                                 \
+    if (vectors_overlap(vd, 1, vs, 4)) {                        \
+        d = (TN *)&scratch;                                     \
+    }                                                           \
+    for (size_t i = 0; i < n; ++i) {                            \
+        d[HN(i)] = SAT(s0[HW(i)]);                              \
+        d[HN(i + n)] = SAT(s1[HW(i)]);                          \
+        d[HN(i + 2 * n)] = SAT(s2[HW(i)]);                      \
+        d[HN(i + 3 * n)] = SAT(s3[HW(i)]);                      \
+    }                                                           \
+    if (d != vd) {                                              \
+        memcpy(vd, d, oprsz);                                   \
+    }                                                           \
+}
+
+SQCVT4(sme2_sqcvt_sb, int32_t, int8_t, H4, H2, do_ssat_b)
+SQCVT4(sme2_uqcvt_sb, uint32_t, uint8_t, H4, H2, do_usat_b)
+SQCVT4(sme2_sqcvtu_sb, int32_t, uint8_t, H4, H2, do_usat_b)
+
+SQCVT4(sme2_sqcvt_dh, int64_t, int16_t, H8, H2, do_ssat_h)
+SQCVT4(sme2_uqcvt_dh, uint64_t, uint16_t, H8, H2, do_usat_h)
+SQCVT4(sme2_sqcvtu_dh, int64_t, uint16_t, H8, H2, do_usat_h)
+
+#undef SQCVT4
+
 /* Convert and interleave */
 void HELPER(sme2_bfcvtn)(void *vd, void *vs, float_status *fpst, uint32_t desc)
 {
@@ -1599,6 +1657,64 @@ void HELPER(sme2_fcvtn)(void *vd, void *vs, float_status *fpst, uint32_t desc)
     }
 }
 
+#define SQCVTN2(NAME, TW, TN, HW, HN, SAT)                      \
+void HELPER(NAME)(void *vd, void *vs, uint32_t desc)            \
+{                                                               \
+    ARMVectorReg scratch;                                       \
+    size_t oprsz = simd_oprsz(desc), n = oprsz / sizeof(TW);    \
+    TW *s0 = vs, *s1 = vs + sizeof(ARMVectorReg);               \
+    TN *d = vd;                                                 \
+    if (vectors_overlap(vd, 1, vs, 2)) {                        \
+        d = (TN *)&scratch;                                     \
+    }                                                           \
+    for (size_t i = 0; i < n; ++i) {                            \
+        d[HN(2 * i + 0)] = SAT(s0[HW(i)]);                      \
+        d[HN(2 * i + 1)] = SAT(s1[HW(i)]);                      \
+    }                                                           \
+    if (d != vd) {                                              \
+        memcpy(vd, d, oprsz);                                   \
+    }                                                           \
+}
+
+SQCVTN2(sme2_sqcvtn_sh, int32_t, int16_t, H4, H2, do_ssat_h)
+SQCVTN2(sme2_uqcvtn_sh, uint32_t, uint16_t, H4, H2, do_usat_h)
+SQCVTN2(sme2_sqcvtun_sh, int32_t, uint16_t, H4, H2, do_usat_h)
+
+#undef SQCVTN2
+
+#define SQCVTN4(NAME, TW, TN, HW, HN, SAT)                      \
+void HELPER(NAME)(void *vd, void *vs, uint32_t desc)            \
+{                                                               \
+    ARMVectorReg scratch;                                       \
+    size_t oprsz = simd_oprsz(desc), n = oprsz / sizeof(TW);    \
+    TW *s0 = vs, *s1 = vs + sizeof(ARMVectorReg);               \
+    TW *s2 = vs + 2 * sizeof(ARMVectorReg);                     \
+    TW *s3 = vs + 3 * sizeof(ARMVectorReg);                     \
+    TN *d = vd;                                                 \
+    if (vectors_overlap(vd, 1, vs, 4)) {                        \
+        d = (TN *)&scratch;                                     \
+    }                                                           \
+    for (size_t i = 0; i < n; ++i) {                            \
+        d[HN(4 * i + 0)] = SAT(s0[HW(i)]);                      \
+        d[HN(4 * i + 1)] = SAT(s1[HW(i)]);                      \
+        d[HN(4 * i + 2)] = SAT(s2[HW(i)]);                      \
+        d[HN(4 * i + 3)] = SAT(s3[HW(i)]);                      \
+    }                                                           \
+    if (d != vd) {                                              \
+        memcpy(vd, d, oprsz);                                   \
+    }                                                           \
+}
+
+SQCVTN4(sme2_sqcvtn_sb, int32_t, int8_t, H4, H1, do_ssat_b)
+SQCVTN4(sme2_uqcvtn_sb, uint32_t, uint8_t, H4, H1, do_usat_b)
+SQCVTN4(sme2_sqcvtun_sb, int32_t, uint8_t, H4, H1, do_usat_b)
+
+SQCVTN4(sme2_sqcvtn_dh, int64_t, int16_t, H8, H2, do_ssat_h)
+SQCVTN4(sme2_uqcvtn_dh, uint64_t, uint16_t, H8, H2, do_usat_h)
+SQCVTN4(sme2_sqcvtun_dh, int64_t, uint16_t, H8, H2, do_usat_h)
+
+#undef SQCVTN4
+
 /* Expand and convert */
 void HELPER(sme2_fcvt_w)(void *vd, void *vs, float_status *fpst, uint32_t desc)
 {
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 4fbc61ae27..dd1a6668fb 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1384,3 +1384,38 @@ TRANS_FEAT(FRINTM, aa64_sme2, do_zz_fpst, a, float_round_down,
            FPST_A64, gen_helper_gvec_vrint_rm_s)
 TRANS_FEAT(FRINTA, aa64_sme2, do_zz_fpst, a, float_round_ties_away,
            FPST_A64, gen_helper_gvec_vrint_rm_s)
+
+static bool do_zz(DisasContext *s, arg_zz_n *a, int data,
+                  gen_helper_gvec_2 *fn)
+{
+    if (sme_sm_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+
+        for (int i = 0, n = a->n; i < n; ++i) {
+            tcg_gen_gvec_2_ool(vec_full_reg_offset(s, a->zd + i),
+                               vec_full_reg_offset(s, a->zn + i),
+                               svl, svl, data, fn);
+        }
+    }
+    return true;
+}
+
+TRANS_FEAT(SQCVT_sh, aa64_sme2, do_zz, a, 0, gen_helper_sme2_sqcvt_sh)
+TRANS_FEAT(UQCVT_sh, aa64_sme2, do_zz, a, 0, gen_helper_sme2_uqcvt_sh)
+TRANS_FEAT(SQCVTU_sh, aa64_sme2, do_zz, a, 0, gen_helper_sme2_sqcvtu_sh)
+
+TRANS_FEAT(SQCVT_sb, aa64_sme2, do_zz, a, 0, gen_helper_sme2_sqcvt_sb)
+TRANS_FEAT(UQCVT_sb, aa64_sme2, do_zz, a, 0, gen_helper_sme2_uqcvt_sb)
+TRANS_FEAT(SQCVTU_sb, aa64_sme2, do_zz, a, 0, gen_helper_sme2_sqcvtu_sb)
+
+TRANS_FEAT(SQCVT_dh, aa64_sme2, do_zz, a, 0, gen_helper_sme2_sqcvt_dh)
+TRANS_FEAT(UQCVT_dh, aa64_sme2, do_zz, a, 0, gen_helper_sme2_uqcvt_dh)
+TRANS_FEAT(SQCVTU_dh, aa64_sme2, do_zz, a, 0, gen_helper_sme2_sqcvtu_dh)
+
+TRANS_FEAT(SQCVTN_sb, aa64_sme2, do_zz, a, 0, gen_helper_sme2_sqcvtn_sb)
+TRANS_FEAT(UQCVTN_sb, aa64_sme2, do_zz, a, 0, gen_helper_sme2_uqcvtn_sb)
+TRANS_FEAT(SQCVTUN_sb, aa64_sme2, do_zz, a, 0, gen_helper_sme2_sqcvtun_sb)
+
+TRANS_FEAT(SQCVTN_dh, aa64_sme2, do_zz, a, 0, gen_helper_sme2_sqcvtn_dh)
+TRANS_FEAT(UQCVTN_dh, aa64_sme2, do_zz, a, 0, gen_helper_sme2_uqcvtn_dh)
+TRANS_FEAT(SQCVTUN_dh, aa64_sme2, do_zz, a, 0, gen_helper_sme2_sqcvtun_dh)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 9cc25622d4..e005f6e6ed 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -726,6 +726,8 @@ SUB_aaz_d       11000001 111 000010 .. 111 ...00 11 ...     @az_4x4_o3
 &zz_n           zd zn n
 @zz_1x2         ........ ... ..... ...... ..... zd:5        \
                 &zz_n n=1 zn=%zn_ax2
+@zz_1x4         ........ ... ..... ...... ..... zd:5        \
+                &zz_n n=1 zn=%zn_ax4
 @zz_2x1         ........ ... ..... ...... zn:5  .....       \
                 &zz_n n=1 zd=%zd_ax2
 @zz_2x2         ........ ... ..... ...... .... . .....      \
@@ -760,3 +762,23 @@ FRINTM          11000001 101 01010 111000 ....0 ....0       @zz_2x2
 FRINTM          11000001 101 11010 111000 ...00 ...00       @zz_4x4
 FRINTA          11000001 101 01100 111000 ....0 ....0       @zz_2x2
 FRINTA          11000001 101 11100 111000 ...00 ...00       @zz_4x4
+
+SQCVT_sh        11000001 001 00011 111000 ....0 .....       @zz_1x2
+UQCVT_sh        11000001 001 00011 111000 ....1 .....       @zz_1x2
+SQCVTU_sh       11000001 011 00011 111000 ....0 .....       @zz_1x2
+
+SQCVT_sb        11000001 001 10011 111000 ...00 .....       @zz_1x4
+UQCVT_sb        11000001 001 10011 111000 ...01 .....       @zz_1x4
+SQCVTU_sb       11000001 011 10011 111000 ...00 .....       @zz_1x4
+
+SQCVT_dh        11000001 101 10011 111000 ...00 .....       @zz_1x4
+UQCVT_dh        11000001 101 10011 111000 ...01 .....       @zz_1x4
+SQCVTU_dh       11000001 111 10011 111000 ...00 .....       @zz_1x4
+
+SQCVTN_sb       11000001 001 10011 111000 ...10 .....       @zz_1x4
+UQCVTN_sb       11000001 001 10011 111000 ...11 .....       @zz_1x4
+SQCVTUN_sb      11000001 011 10011 111000 ...10 .....       @zz_1x4
+
+SQCVTN_dh       11000001 101 10011 111000 ...10 .....       @zz_1x4
+UQCVTN_dh       11000001 101 10011 111000 ...11 .....       @zz_1x4
+SQCVTUN_dh      11000001 111 10011 111000 ...10 .....       @zz_1x4
-- 
2.43.0

