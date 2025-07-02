Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3791106dye;
        Wed, 2 Jul 2025 05:59:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1TcbjCB7m6X5SPdLoTpudPuTkEehHnsu3x1ANyDZ/PLCnvh+BuNuoz2S5CZgcnRLlEYbIDN8kSqk7nw==@linaro.org
X-Google-Smtp-Source: AGHT+IHofoOo1Ns19zYxnsgvXn14saiHkYymITaphyFRKX9wMMdmrmBDb/tHB6MqiAd4D4oa24xH
X-Received: by 2002:a05:622a:30d:b0:4a3:530b:2880 with SMTP id d75a77b69052e-4a97695a2c8mr43774121cf.14.1751461176367;
        Wed, 02 Jul 2025 05:59:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751461176; cv=none;
        d=google.com; s=arc-20240605;
        b=YWXebEW9o1JtqdvsMmms/hsrP/35Y+qej5n/YBFym8AXIOcWdcxSjtXc+knKPlyCKI
         C5nMOLQ1IuIjP/9cKHhEgvGa2k1pLPmZ27JDt1QhGXd4d7ee++c/k1TIfN7mSZuuhFcD
         Rh/iKN8GnV0vUhCFoDHbL0Kzt3JfXkUUSph46SnyQ/A8NrhAO/TnpZysZTBJvUZTFfRJ
         Ke7MKfilkwbYeM60zoTp3ykCJapgqqBcq1dbAP+C2bwl8h75cwXL2+rKlnldRe2bc5K8
         j/lxTIC4lJYBqwAbjGDWi4vFq/derBm85KLeAGhuaT9w+23QawmrryEfE74nNpRca0GA
         ZiNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5dEgFe/aMCLBRuy/ILH5OuLrM9Ftc/PXr/fYOnWwFMI=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=g56iHhmpvM6XDzAL8G15wqD5aa1Ddg2zPK2AREaWYgdRxR5/AGg8dl5aAc5kx09NTl
         63/gokL0OTSa3RPnRIQ0xgxdEvH1bsBxhrMmzEF+Ld6Yvum1W2XOAPE9AZg/+nJywFO9
         QBFhfo5mRaNv8owdz4PXGaopSB7vAbVaDxW/dwvYh9Obz2cXPsF8kf7KaK9BGGCjNzCb
         V87KviS+Z/duCdsrfgdH1wwqy4XLm30m9Q49Kpcc6R/OuUPJF/EEkU63c0ceaqq4adf2
         QNceTpKONmgdNBxuVaBWmH0U99SmYSRFytvMypAv5vodUAlLV6VYGH6mLnnjSRPhG9aX
         tIPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="RC0q/FXj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d44324bd9csi1255276385a.338.2025.07.02.05.59.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:59:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="RC0q/FXj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwnS-0000Zq-07; Wed, 02 Jul 2025 08:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjP-0004Jt-Su
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:36 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjF-00025t-1U
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:31 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-2efc0ed41efso2059804fac.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459898; x=1752064698; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5dEgFe/aMCLBRuy/ILH5OuLrM9Ftc/PXr/fYOnWwFMI=;
 b=RC0q/FXjmmFlV5HYOXFqhb48rcYIGtkwDUGo0SNLxttDjq7wyF5QQNNoeU4jg5FXjj
 7oy/CmiLQEtEaXhXxckwSO+urZuzNrNVtTFAXzWADoObk9c/uV+7QBgHKdOAe6M0Gy6S
 fW6Z9Q7TJBB+PQOj1ona37vvULhxO5W5YMdBrKiRspX+5uX7hS6m3+Wo9FJkKRg9PiIQ
 VqtIQzJDcXSdBHHXUpMijIGKkrLrSdLi3aILiwETJglw6BdtsVbRCDLhk1GiEuvc9eB4
 9GEkvro92PIDAwvkb2ql3Y7aJuHIMuckBTRuSA7IhQgIjqN5QG0yK/mUX6p/1svMhabc
 9pMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459898; x=1752064698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5dEgFe/aMCLBRuy/ILH5OuLrM9Ftc/PXr/fYOnWwFMI=;
 b=Om2/x11YZU6K4MDWm/Mqx3vpD5pHZNuUp7NTTk51eW/I8gUgjjqGsbittcdldhRBk8
 bA+LMN9vJroVFJDtIslOqOEo0pTdYiV5H4rwpNXMbhqMYiD1mwzkib4KjrdhEHnIUFbG
 6J3gqNXwf1uiRN1VoPHWwPuzeBxXkmlBRX5XGfIeR7i6R1HbhKJ23vy1gyqVMYlyNdw6
 TeQgdTAECP1TkRLvVWrK0C+eKRtm0Ll1fHXHNAj2uSMsq6iBcRLg9/9475CpXk/1f3tL
 gvTmyLUZ1HGlKptLcZokprkzFw+YjYLVYMj0DVyw/lzN8XbO2LC1vUJtyj3B8iojGIWc
 Uw8g==
X-Gm-Message-State: AOJu0Yzs1m0hKSaZhAPfXzw8XToOnUWj3GnBpfGFFLIjjZSh+pqksEZd
 Jf3KQ26qgcAE8m4lv9yGef/b78Tpvpv9n5eIsR3JtwhtQUn81zJW27BwGuj+abVcRGM=
X-Gm-Gg: ASbGncuh4qgqNOjF9EQeODqX8gNbuRf7m+gBXZFw8qeyvkJ+vZYfTdTDhhDBgRYrFHa
 APNKVNnJNnt9jgTkQ7jK9lLpRuTZdb2etK72tfMg9ohKcZTBChARMfrpoXC2s1TGFGV8H9Za+V/
 lEKHkmviV906NbuxWpx6VCKrSfGrzmszktqblgWOctQ7WDNnCrT+BHXTR8tGQwi6M9+cg1cUb83
 7S+U5DRq5zbMozkLlxVsrXwyLH2qlxXmHNMDdark3rlqfqsbIByvn0DIq+LhQrqiJGyfvKvAxE6
 H3+jfnkx+6HUi8f+Lwatyj6vwmtwaojBf+es1ZWyzRr3UFHqhaX3JtrdHXiVuCqO7l97x43J/0b
 386XX
X-Received: by 2002:a05:6870:92c8:b0:2d5:ba2d:80da with SMTP id
 586e51a60fabf-2f5abe40dbfmr1873778fac.36.1751459898243; 
 Wed, 02 Jul 2025 05:38:18 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd4ea5d9fsm3843451fac.10.2025.07.02.05.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:38:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 52/97] target/arm: Implement SME2 ZIP, UZP (four registers)
Date: Wed,  2 Jul 2025 06:33:25 -0600
Message-ID: <20250702123410.761208-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
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
X-TUID: XALCUdYPdg2J

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
index a7d282695d..83646a3665 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1805,3 +1805,71 @@ void HELPER(sme2_ucvtf)(void *vd, void *vs, float_status *fpst, uint32_t desc)
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

