Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3707786qtb;
        Wed, 2 Jul 2025 05:41:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2GB4QOzjhLvZcL1xwZPvB32bslbO+Ua7+/GqPSn8IowKlSs3WsiQnsCz6KAqJuIlpaE4roT1OR49FMg==@linaro.org
X-Google-Smtp-Source: AGHT+IHkxS5Eby6JAJzCyLo2xldQYe47hS2u+eblPKl8euUUi3WY6iJeC6LdJWHwUgR47gdlVwI4
X-Received: by 2002:a05:6214:1d23:b0:702:afa1:b2d2 with SMTP id 6a1803df08f44-702b1a5347fmr40189696d6.4.1751460065290;
        Wed, 02 Jul 2025 05:41:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751460065; cv=none;
        d=google.com; s=arc-20240605;
        b=kpuS0YX3Ou0Wqh3gH1cWUPLKq4I7Nb/FumrDm0LRhrdOyUlEO2CfvmAil43cCx2Fup
         Lu9eAqSOdoy40Kp2y0fz+vqxws5KtG1fsg1MUFEhCnnY3eXbuezOQYjx8KxaL8ZRFR7F
         iluLwWfDIgC+hQzedxBQd6rVJCe4NsPBFELfp/39PcgmlVu0ZaKS/RIp4vOyyCND3d89
         AKqKdapKejTq3RuGxc9YZCnx1s/TQsAs5K07BiWMdz0/kf3gVnKD59pltnjerm0zuJ4D
         7a+2lHJR2vSICoXIM43tJwN7sK1GjVvNAqk/0hzUf2ZyiwzmJDbLtBioMTAGAOsSj1f1
         R5SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NgZFObJDubZE1j7sV9iROMi6HrLs2MxVlYNMSaM5isU=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=RbbOsgw4tbfqoXVsGLkL6MjYoY+YseSsQrDfmjA1iGTZ1PtkPDBTpeidxGsm2+zbpC
         CFqmRsvP+tvPMiJ2dvUgIQEHtULt/gfkFEpBugvrWjJ20yDg8Yqdt/PyVC/vBx0H7QXW
         N6TEi1Dd4VschbLvoo3tv+rLheiKq0vbI76UGPYBoFyUwUowlRoEyDl8aTCzF1DBoL1W
         xQWcSveTnVYON8Dq2QBBLapKtlTt2acu+/K73pMqv5DL0CulhcuoYnc+AgTed0sfLDeY
         OKuTfsiBS7r7Et4VBP/4wbskvMvyposupoQdIb5tG9UIZ/ulXjY3eazXpGE3QLjypp+E
         pO5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SMqQYvif;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77355a86si150490106d6.211.2025.07.02.05.41.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:41:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SMqQYvif;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwhd-0001yV-Ll; Wed, 02 Jul 2025 08:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwgF-0008DS-Kg
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:16 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwg0-00018H-M3
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:15 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-2f3dab2a2a9so916821fac.2
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459696; x=1752064496; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NgZFObJDubZE1j7sV9iROMi6HrLs2MxVlYNMSaM5isU=;
 b=SMqQYvifRn2xKuI4xjQBiUuRZuAH59bn8ivikt6+yLdUYf12OEoTGrz9Tjs6mSWLS2
 4AxcDuC3vhb5cjOv9bnzyzucdRhUwggcFHdkJAOgdTXE0y4tXHP00nhU4jHbytOfTFb/
 jVurcQnHuMMFY/tbJnHbnHS9uafE3uYBGWDN0QNFKP3U8buew6H0C8JB9CmJxoH8/yOB
 J5nTnnNYviJ/mPGmFP9u+yWt+5AB4cW50ntIYAtSn1w2Pqr0khNfFLaGMLbnvPLwsiEK
 bnSEL0if0hmH7a+YYc0chnZJJVdgflRW5xJ2hRyLGbeYqKEM4ZJxahJhzrc4z3Z5zEFP
 tLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459696; x=1752064496;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NgZFObJDubZE1j7sV9iROMi6HrLs2MxVlYNMSaM5isU=;
 b=ZKdqffd1dks4+mjMcqmNQSin3HWZM97+Dv3KDevcbwiDD1SwoxWeIWI74IxNR0MdL5
 C2cpQsDT21q6Z+0noPxAcieEY3dZESYVpyZl1aIK67LH4mq3G5yDcwE3mz0Iq+LuhExj
 DPVBBvC5Av8maAL9dH2bUVQKCoqLbQbvFPeDSUwQW2RMhUe5R9tsTCLFAa3FDWkH+8jR
 veOfEZ/wkTTNRVZRc4heDUVBjKZ3EBVQqdGVD8Ye/b1LjTcxb/XixSzGbUMM3THYZ+A1
 nnZqQCp1DUMtU9EYqg0h6LD9c0Frdt8Dszev56U7KEg2G7jX4xBsJkSD5sPPl5X6/f60
 RrAg==
X-Gm-Message-State: AOJu0YyVoXhcdWXL9/oEszSD2Ys+RY2Fgly22ycEYuP92nJDeAQoXxgn
 jJrwzQiimqWb6sgTKagef3C7O2zBG+AtMXka1vHit4wPwL7EGWbxWA/qmRaTE2X79LlhXXOvsW+
 lSa+dp4I=
X-Gm-Gg: ASbGncsjcruCdKeXpwA0cwO2sjJ00CqACKXa/iXdeBjYF5M+qzndKfhsWYIhpNo/eO/
 vEPKWhpAeXNtXFVqIxbL5daAXr8pV30o0OwLVcTCAWvZrcLy4nYWBgYwawc35eViNRMqviXdArW
 /qevv3VdZjJT79IuKamiVLZtJh/dEkL2rf5d9m/rybI+CAtcdefC71rfuhEVw2kf+fM836b9NYS
 xJoGks8Yu3qM7SpYC2n3qTPD2F5mZWY2HriglbjujzsNN2kUFl+7qfmBf9VgT6fUDKJTtxr+Hye
 Idpj+ZqgZxxLLj6wVyfTrS28gbe/pAUldYOfRSc/Elag49T5h4uVqkq4gefPTQW0uARDyw==
X-Received: by 2002:a05:6871:650e:b0:2ef:eddd:690d with SMTP id
 586e51a60fabf-2f5a8ab9053mr1750299fac.24.1751459696011; 
 Wed, 02 Jul 2025 05:34:56 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1b2fsm3864281fac.32.2025.07.02.05.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:34:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 35/97] target/arm: Implement SME2 SVDOT, UVDOT, SUVDOT,
 USVDOT
Date: Wed,  2 Jul 2025 06:33:08 -0600
Message-ID: <20250702123410.761208-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x30.google.com
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
X-TUID: 4QtSny2QvA/T

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    | 11 +++++++++
 target/arm/tcg/sme_helper.c    | 42 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c | 23 +++++++++++++++++++
 target/arm/tcg/sme.decode      | 11 +++++++++
 4 files changed, 87 insertions(+)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index 8f5a1b3c90..464877516b 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -180,3 +180,14 @@ DEF_HELPER_FLAGS_6(sme2_fdot_idx_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_6(sme2_fvdot_idx_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_4(sme2_svdot_idx_4b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme2_uvdot_idx_4b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme2_suvdot_idx_4b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme2_usvdot_idx_4b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sme2_svdot_idx_4h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme2_uvdot_idx_4h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sme2_svdot_idx_2h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme2_uvdot_idx_2h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 8b45865461..f5242d99be 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1416,3 +1416,45 @@ DEF_IMOP_16x2_32(umopa2_s, uint16_t, uint16_t)
 
 DEF_IMOPH(sme2, smopa2, s)
 DEF_IMOPH(sme2, umopa2, s)
+
+#define DO_VDOT_IDX(NAME, TYPED, TYPEN, TYPEM, HD, HN) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)            \
+{                                                                         \
+    intptr_t svl = simd_oprsz(desc);                                      \
+    intptr_t elements = svl / sizeof(TYPED);                              \
+    intptr_t eltperseg = 16 / sizeof(TYPED);                              \
+    intptr_t nreg = sizeof(TYPED) / sizeof(TYPEN);                        \
+    intptr_t vstride = (svl / nreg) * sizeof(ARMVectorReg);               \
+    intptr_t zstride = sizeof(ARMVectorReg) / sizeof(TYPEN);              \
+    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT, 2);                   \
+    TYPEN *n = vn;                                                        \
+    TYPEM *m = vm;                                                        \
+    for (intptr_t r = 0; r < nreg; r++) {                                 \
+        TYPED *d = vd + r * vstride;                                      \
+        for (intptr_t seg = 0; seg < elements; seg += eltperseg) {        \
+            intptr_t s = seg + idx;                                       \
+            for (intptr_t e = seg; e < seg + eltperseg; e++) {            \
+                TYPED sum = d[HD(e)];                                     \
+                for (intptr_t i = 0; i < nreg; i++) {                     \
+                    TYPED nn = n[i * zstride + HN(nreg * e + r)];         \
+                    TYPED mm = m[HN(nreg * s + i)];                       \
+                    sum += nn * mm;                                       \
+                }                                                         \
+                d[HD(e)] = sum;                                           \
+            }                                                             \
+        }                                                                 \
+    }                                                                     \
+}
+
+DO_VDOT_IDX(sme2_svdot_idx_4b, int32_t, int8_t, int8_t, H4, H1)
+DO_VDOT_IDX(sme2_uvdot_idx_4b, uint32_t, uint8_t, uint8_t, H4, H1)
+DO_VDOT_IDX(sme2_suvdot_idx_4b, int32_t, int8_t, uint8_t, H4, H1)
+DO_VDOT_IDX(sme2_usvdot_idx_4b, int32_t, uint8_t, int8_t, H4, H1)
+
+DO_VDOT_IDX(sme2_svdot_idx_4h, int64_t, int16_t, int16_t, H8, H2)
+DO_VDOT_IDX(sme2_uvdot_idx_4h, uint64_t, uint16_t, uint16_t, H8, H2)
+
+DO_VDOT_IDX(sme2_svdot_idx_2h, int32_t, int16_t, int16_t, H4, H2)
+DO_VDOT_IDX(sme2_uvdot_idx_2h, uint32_t, uint16_t, uint16_t, H4, H2)
+
+#undef DO_VDOT_IDX
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 341f4495e9..b88f439ef9 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1047,3 +1047,26 @@ TRANS_FEAT(SDOT_nx_4b, aa64_sme2, do_dot_nx, a, gen_helper_gvec_sdot_idx_4b)
 TRANS_FEAT(UDOT_nx_4b, aa64_sme2, do_dot_nx, a, gen_helper_gvec_udot_idx_4b)
 TRANS_FEAT(SDOT_nx_4h, aa64_sme2_i16i64, do_dot_nx, a, gen_helper_gvec_sdot_idx_4h)
 TRANS_FEAT(UDOT_nx_4h, aa64_sme2_i16i64, do_dot_nx, a, gen_helper_gvec_udot_idx_4h)
+
+static bool do_vdot_nx(DisasContext *s, arg_azx_n *a, gen_helper_gvec_3 *fn)
+{
+    if (sme_smza_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        fn(get_zarray(s, a->rv, a->off, a->n, 0),
+           vec_full_reg_ptr(s, a->zn),
+           vec_full_reg_ptr(s, a->zm),
+           tcg_constant_i32(simd_desc(svl, svl, a->idx)));
+    }
+    return true;
+}
+
+TRANS_FEAT(SVDOT_nx_2h, aa64_sme2, do_vdot_nx, a, gen_helper_sme2_svdot_idx_2h)
+TRANS_FEAT(SVDOT_nx_4b, aa64_sme2, do_vdot_nx, a, gen_helper_sme2_svdot_idx_4b)
+TRANS_FEAT(SVDOT_nx_4h, aa64_sme2, do_vdot_nx, a, gen_helper_sme2_svdot_idx_4h)
+
+TRANS_FEAT(UVDOT_nx_2h, aa64_sme2, do_vdot_nx, a, gen_helper_sme2_uvdot_idx_2h)
+TRANS_FEAT(UVDOT_nx_4b, aa64_sme2, do_vdot_nx, a, gen_helper_sme2_uvdot_idx_4b)
+TRANS_FEAT(UVDOT_nx_4h, aa64_sme2, do_vdot_nx, a, gen_helper_sme2_uvdot_idx_4h)
+
+TRANS_FEAT(SUVDOT_nx_4b, aa64_sme2, do_vdot_nx, a, gen_helper_sme2_suvdot_idx_4b)
+TRANS_FEAT(USVDOT_nx_4b, aa64_sme2, do_vdot_nx, a, gen_helper_sme2_usvdot_idx_4b)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 338637decd..4146744a46 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -438,3 +438,14 @@ USDOT_nx        11000001 0101 .... 1 .. 1 .. ...01 01 ...   @azx_4x1_i2_o3
 
 SUDOT_nx        11000001 0101 .... 0 .. 1 .. ....1 11 ...   @azx_2x1_i2_o3
 SUDOT_nx        11000001 0101 .... 1 .. 1 .. ...01 11 ...   @azx_4x1_i2_o3
+
+SVDOT_nx_2h     11000001 0101 .... 0 .. 0 .. ....1 00 ...   @azx_2x1_i2_o3
+SVDOT_nx_4b     11000001 0101 .... 1 .. 0 .. ...01 00 ...   @azx_4x1_i2_o3
+SVDOT_nx_4h     11000001 1101 .... 1 .. 01 . ...00 01 ...   @azx_4x1_i1_o3
+
+UVDOT_nx_2h     11000001 0101 .... 0 .. 0 .. ....1 10 ...   @azx_2x1_i2_o3
+UVDOT_nx_4b     11000001 0101 .... 1 .. 0 .. ...01 10 ...   @azx_4x1_i2_o3
+UVDOT_nx_4h     11000001 1101 .... 1 .. 01 . ...00 11 ...   @azx_4x1_i1_o3
+
+SUVDOT_nx_4b    11000001 0101 .... 1 .. 0 .. ...01 11 ...   @azx_4x1_i2_o3
+USVDOT_nx_4b    11000001 0101 .... 1 .. 0 .. ...01 01 ...   @azx_4x1_i2_o3
-- 
2.43.0

