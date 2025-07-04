Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1266466dyc;
        Fri, 4 Jul 2025 07:50:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWxvnQA0dAcE/YzyPOCZlpsV7HStK9OlFZ3sGz/d5tubnkeDYM2rPV+uVwMGtywX7PCvYQm+pdIy8guqw==@linaro.org
X-Google-Smtp-Source: AGHT+IEpcfoSb5Qlp0ZjHk/kFoLtfj0duIYBUAauQuBH5m6cJ3fDYn0I0mLbNu52zUNOl848dMFd
X-Received: by 2002:ac8:59c4:0:b0:4a3:530b:2880 with SMTP id d75a77b69052e-4a996444543mr49893231cf.14.1751640646050;
        Fri, 04 Jul 2025 07:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640646; cv=none;
        d=google.com; s=arc-20240605;
        b=PTC2raMff2+r/Q+5MGYHR8gob4mSUUsxrTmoYpQHwzawi3zomiJ5km5R16fS8ITJV2
         UUZqNFgOCAYRr0j4JeSwfdcm7McIWKZc1vYiFXLQCb84RiGEmwATaE0EAFIhGGvZtPwx
         j2F6S7Z3brbGfDIxu9fQeNhoJwLN4Wq2Uwml0A+ccnMNGHpDvjEMy7dGSTGjaYVzJxDT
         rv3NlvpAL9ko1293Tj56TRvmt8xo/k2QOTL8+XaZYIBspKycGG+N5oxcQ3+0CKgqtW/0
         eMsn18D5DNOw3dlFcdIlYzNvYWlesN0bFbIL+4Vsn9NeTkxmlvjfNQGU7mQQf9lrBIz6
         Bvdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=N7XOMMIFTSKQBGT6FbweY3+4jI14Ld7/hjKCxCVbLuQ=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=KFGsQKUdOabzQRwLvv0cAe4KV8yeg525cQNzwnsnPYeXZSNpPa9ktk2j1EluUx089k
         FvjistEHXTrNRhXC2lNG7OkN4guDszxnmmkJsPI+COb9C6niGf6sTJp7icZp6Rk0XEaT
         6R3kZja4lAsq4WKzNErda+2LDsS4vu4FcqJZQTNgbsCvptEiMp9/WrB6Filt7JCmgcqM
         bv+tAx/j+mOgOGt5wjAI8TJ0N9sbJhPQZmC6wzn0VqEVcnqzxrx/hAsmQBNk+EhCyC6M
         vX9wXXYpvIleS/fG0nQJvkjUtAj1BT826ZCk89PVXwD3tvpyz511qecs7/DeaTlZrfjf
         l5qA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ep53hufM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a994b0f454si22567021cf.548.2025.07.04.07.50.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:50:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ep53hufM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhR3-0005MV-If; Fri, 04 Jul 2025 10:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhM1-0004Og-Gi
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:32 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLu-000829-Cb
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:28 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-735b9d558f9so293467a34.2
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639121; x=1752243921; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N7XOMMIFTSKQBGT6FbweY3+4jI14Ld7/hjKCxCVbLuQ=;
 b=ep53hufMun/kH/IlXixNfsSUTfp2vRoPdAntH9L5T+lSfGIUv1SXfPzW+6hJM3USyB
 ySzsVPnGXDPdfBnXEgz752JJEU+/tvFiK54m62a6XsL3/4boeL698OlIfwgRDWjMJYzz
 6YBqpJ3zSiFNxrCLmRbrT7bnuSwS6WG6lIkCFBOcc0nmj7MnXSBmkio5bJbFDpFvsKqM
 w7wEtdyfapBy1xaqLsAcM6XQ32xpnbikgTNo2S28iamSQ+bwhkRmLSDpKeDA7A7fWWK0
 kKKxTXOWNnRfiuGHfI0AXBNpbdZHa+dvo0LDYJjAMIS8SFlucpkqpvREOrsWXd/I3qJw
 kWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639121; x=1752243921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N7XOMMIFTSKQBGT6FbweY3+4jI14Ld7/hjKCxCVbLuQ=;
 b=uMGMZ/lQ44mmofsNEpaLDlX+B9egB6D+FsL7oBqTVfFnALRwg0w53BAdnmbgtudI1Y
 aOI0g35DHs3+d7VCzD7MWyoCii9QRAflvDVTEacnGYBUwcttN/1Tnrx/pmgIt3U9562O
 SpIFGO0zAa+4gKj74fO2wSfsl4lBFDK7CniVY/pzXVfBErxYf0Kk7osHqPSh6Nvej2o6
 jAlEr51uMmHaCzgCocE3QMTOR81u3lQndYmoUi7j5uowYmsaZFFL/u/9iQ9aGkyTBXSK
 s39tsLrfOR/KoLGTvNAX+mBQD6whcJVUpckyPHrLYLRJvY4AuWj9VqBk19CTW0JlrZxf
 TMfA==
X-Gm-Message-State: AOJu0Yynd7NHRxaoqtbaHhmQ7MSfMxDM0QVCD1hjhso3BJ4JXaHbjMpH
 lOIVBPiq1KPWTU8qAG0Pk21aHh7mNgh9PEe2CjwLPyRKED5GUZpDkxjhA7FbhJqJ4p4=
X-Gm-Gg: ASbGncvgEyz4uYu06/df3abX1m5f7rQRbdh0DW2FWUnONzvywSxJOC5vmIZp6uGQPSS
 qbQ4Mc7XN4isqcIS3RV6qWmZLjPxeKUOJlCxt6GDe0DI1q9nqzIZ1eV3Qet1BQ2I9csLl56kUIF
 JIdJfPWAOGFwbdmHcIWfRf8OQK0EVLBcEgTXHKlMyuk3yT+E9QyPDtIstFcq1cDoQ58aCAJ8Hvj
 UjrYqo3qWRB6Z63uAgb6k5++0dtnfEeC4UCxC8qdvNxN9ieu0CCViP9AxDdK7Af+OHTBtZg750f
 YBgYNttLdvkFVd6Rz6mSFa/CXjmdmM0k/ieKLw8rR5A7989JgQO2Qi+oiSt9vY5eGzPYrap+Ffr
 boI59ECJoPsOWI6x6vY7nTF0N2zey/cpDfigKXJvE2QYeXx4oIISOm1py8Lo=
X-Received: by 2002:a05:6830:4889:b0:73a:96e5:19cd with SMTP id
 46e09a7af769-73ca48d5d17mr1677357a34.10.1751639120683; 
 Fri, 04 Jul 2025 07:25:20 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 062/108] target/arm: Implement SME2 ZIP,
 UZP (four registers)
Date: Fri,  4 Jul 2025 08:20:25 -0600
Message-ID: <20250704142112.1018902-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
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
X-TUID: d0Ey4/7X7NSC

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    | 12 ++++++
 target/arm/tcg/sme_helper.c    | 68 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c | 39 +++++++++++++++++++
 target/arm/tcg/sme.decode      | 11 ++++++
 4 files changed, 130 insertions(+)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index 893b23aa3b..7e21f1095a 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -254,3 +254,15 @@ DEF_HELPER_FLAGS_3(sme2_uunpk2_sd, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
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
index ee4596e066..4a05fff5fe 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1812,3 +1812,71 @@ void HELPER(sme2_ucvtf)(void *vd, void *vs, float_status *fpst, uint32_t desc)
         d[i] = uint32_to_float32(s[i], fpst);
     }
 }
+
+#define ZIP4(NAME, TYPE, H)                                     \
+void HELPER(NAME)(void *vd, void *vs, uint32_t desc)            \
+{                                                               \
+    ARMVectorReg scratch[4];                                    \
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
+    ARMVectorReg scratch[4];                                    \
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
index b45e68750d..de9545ee6d 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1435,3 +1435,42 @@ TRANS_FEAT(UUNPK_2sd, aa64_sme2, do_zz, a, 0, gen_helper_sme2_uunpk2_sd)
 TRANS_FEAT(UUNPK_4bh, aa64_sme2, do_zz, a, 0, gen_helper_sme2_uunpk4_bh)
 TRANS_FEAT(UUNPK_4hs, aa64_sme2, do_zz, a, 0, gen_helper_sme2_uunpk4_hs)
 TRANS_FEAT(UUNPK_4sd, aa64_sme2, do_zz, a, 0, gen_helper_sme2_uunpk4_sd)
+
+static bool do_zipuzp_4(DisasContext *s, arg_zz_e *a,
+                        gen_helper_gvec_2 * const fn[5])
+{
+    int bytes_per_op = 4 << a->esz;
+
+    /* Both MO_64 and MO_128 can fail the size test. */
+    if (s->max_svl < bytes_per_op) {
+        unallocated_encoding(s);
+    } else if (sme_sm_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        if (svl < bytes_per_op) {
+            unallocated_encoding(s);
+        } else {
+            tcg_gen_gvec_2_ool(vec_full_reg_offset(s, a->zd),
+                               vec_full_reg_offset(s, a->zn),
+                               svl, svl, 0, fn[a->esz]);
+        }
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
index 38c210cd4f..81783b4705 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -723,6 +723,7 @@ SUB_aaz_d       11000001 111 000010 .. 111 ...00 11 ...     @az_4x4_o3
 
 ### SME2 Multi-vector SVE Constructive Unary
 
+&zz_e           zd zn esz
 &zz_n           zd zn n
 @zz_1x2         ........ ... ..... ...... ..... zd:5        \
                 &zz_n n=1 zn=%zn_ax2
@@ -800,3 +801,13 @@ SUNPK_4sd       11000001 111 10101 111000 ....0 ...00       @zz_4x2_n1
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

