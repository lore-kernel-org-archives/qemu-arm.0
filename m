Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2889067lft;
        Mon, 27 Jun 2022 21:36:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uZ63bkhrqgouVAE2tpFMxmTDF2V4TXNTQVAD/EEjKPZqLMln9nj98XeeYRFovdKdKCiWDn
X-Received: by 2002:a05:6214:d83:b0:470:4f0a:fabb with SMTP id e3-20020a0562140d8300b004704f0afabbmr2231796qve.66.1656390973845;
        Mon, 27 Jun 2022 21:36:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656390973; cv=none;
        d=google.com; s=arc-20160816;
        b=HPZCMP6S8j0hcyXb+DCmWOdIMuA9TdSBsYeroLQXChX8SZ0EExyL04i6xPtxDkzP3i
         A01vC601mIAo8y8ujmf9T5Kz1PxBY2bDnGxeCfdFdK080ab2cJa3zc+6g+C0Uj7FHqa3
         Jc42Hdw19JBGmIdxm4dgTkO/47B8EHqfvVfk3MW+blxfL8/pceZjK4f0j8L9iIGaWWib
         IjTWAITLe085IjXsDK0pS05UbvApXdPJvQBaRqBqKccMA+N2aAu4h772QHSZdTSeALIB
         aZDDVLU3Zic9vZnc/DP6iEyUyYK/MCJldXPQL0a8wKQfV4IdeOAft09WngWhM4xUh4ga
         qhwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TAvqWTorLRtZ2RYJUMwjEw2a2lKrYwmfuEb0hOk02IA=;
        b=HEsU4XNvKjJGP5S+6B3ovkZTg/Jbl/29rFJhOyQ1KzLSoT751uUJPEVnxWZ8IP6Xaj
         FzJNqN5tCuJ9Kg+Rn+iUs7WxaHV3wW2S+ybrHcvB1ZTlY45CdvsBM2dIbHyOGW/HlwLG
         gIiIdZVGcWNM/m9tqoP4PNxTOznmo/iIpnBw1qZpelQe8JjARqhANNhpH7k5kSrQfSov
         cpdo/v/ng0vDzGcqVa5k8PLpWZ1jjyN9yQA8jmMEADeaUnarALGNujRWcA1RGBDJykvw
         bpWaXLcUfu4lnCSsyWfaIbmhQd7A22Kh2FH1yUaHJx3G+HO7zMOcvpT/uI/bv4x5FZ4J
         yGQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fVjlFnBt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jl5-20020ad45e85000000b004443f78cab5si6803341qvb.262.2022.06.27.21.36.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:36:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fVjlFnBt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o62xR-0005pw-6d
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62k1-00028V-OJ
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:22 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jy-0003lQ-Jv
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:21 -0400
Received: by mail-pl1-x635.google.com with SMTP id l6so9955415plg.11
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 21:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TAvqWTorLRtZ2RYJUMwjEw2a2lKrYwmfuEb0hOk02IA=;
 b=fVjlFnBtoLlZyD4xH2beo4sb1IxWHE0Cjhcne3VLZymh5WhnAQsQ91GYZDOwAt8izf
 XN3Bhm7hCrrsGCFNf61ZpE6+RsYzOJq72+RQjZ/QgiS3KLGLV6gqfmrPfgz3N3/g9+YR
 ZtBYJCy/utEhjhRd7GUpRfH+ZXquHM3N+2oUF3OsIp0ey9XlsXaT7YZblsYTCFR6Aq7f
 /R64UENh+K8MjxTHm4V1bXxk7BlmufdtPP4mXNun8ZeYILtZSwiz5NJ1l/NpzP5r9fBD
 Q+Wq+2LHUSHsM6XSHh1g2s5MeBTZL6EAKvq+z9giJGpJbN1uEy6+lcrTXfrKrn9SIY4H
 Vmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TAvqWTorLRtZ2RYJUMwjEw2a2lKrYwmfuEb0hOk02IA=;
 b=u/1FPpkaZ1fKuKUvjAGOEFuiQWB00SzpfqNveT3fwww4nSu1rfykYyS2Oilq8nQw20
 CV1AxZoB0aAvunYEOws+kUjagXa5cwkTPvsa/L9sVhYMFJyhgV+PKo81EGnBc0t6e4h3
 P4ukU6nCcXFYNy9/Qho9bPS9j8SabJZ9/P3oCVrgmjA28yxVX/A3BWT5qNrSQlfWwM8O
 f+l26FOkSly3ylVhXgxmMu32BPDBzqANqS4TbHTsbAjRlebcuoIRiZdhAREsP8PJcodx
 P+pBdgYJk345h8cJ890oJeiP2TfV6nFtY/+qMlFpJMtthxwaICyoik5Gkuiev8NOxYf3
 b6mg==
X-Gm-Message-State: AJIora9FslNc+3h81KpppyRxaaO+jdvW3DmLg6zEgnAHtF9CzzNl8cCo
 hKDhlJ+1aF6ajUVo482jQb9rv44VWdk9aA==
X-Received: by 2002:a17:902:d504:b0:16a:4846:3f46 with SMTP id
 b4-20020a170902d50400b0016a48463f46mr1619343plg.159.1656390136925; 
 Mon, 27 Jun 2022 21:22:16 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 23/45] target/arm: Implement SME ADDHA, ADDVA
Date: Tue, 28 Jun 2022 09:50:55 +0530
Message-Id: <20220628042117.368549-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kwxbcqAYEvSh

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Drop restrict.
---
 target/arm/helper-sme.h    |  5 +++
 target/arm/sme.decode      | 11 +++++
 target/arm/sme_helper.c    | 90 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c | 31 +++++++++++++
 4 files changed, 137 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 95f6e88bdd..753e9e624c 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -115,3 +115,8 @@ DEF_HELPER_FLAGS_5(sme_st1q_be_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i
 DEF_HELPER_FLAGS_5(sme_st1q_le_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
 DEF_HELPER_FLAGS_5(sme_st1q_be_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
 DEF_HELPER_FLAGS_5(sme_st1q_le_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_5(sme_addha_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sme_addva_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sme_addha_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sme_addva_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index f1ebd857a5..8cb6c4053c 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -53,3 +53,14 @@ LDST1           1110000 111     st:1 rm:5 v:1 .. pg:3 rn:5 0 za_imm:4  \
 
 LDR             1110000 100 0 000000 .. 000 ..... 0 ....        @ldstr
 STR             1110000 100 1 000000 .. 000 ..... 0 ....        @ldstr
+
+### SME Add Vector to Array
+
+&adda           zad zn pm pn
+@adda_32        ........ .. ..... . pm:3 pn:3 zn:5 ... zad:2    &adda
+@adda_64        ........ .. ..... . pm:3 pn:3 zn:5 ..  zad:3    &adda
+
+ADDHA_s         11000000 10 01000 0 ... ... ..... 000 ..        @adda_32
+ADDVA_s         11000000 10 01000 1 ... ... ..... 000 ..        @adda_32
+ADDHA_d         11000000 11 01000 0 ... ... ..... 00 ...        @adda_64
+ADDVA_d         11000000 11 01000 1 ... ... ..... 00 ...        @adda_64
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index 4ff4e22c2c..61fe9e9dc8 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -808,3 +808,93 @@ DO_ST(q, _be, MO_128)
 DO_ST(q, _le, MO_128)
 
 #undef DO_ST
+
+void HELPER(sme_addha_s)(void *vzda, void *vzn, void *vpn,
+                         void *vpm, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_oprsz(desc) / 4;
+    uint64_t *pn = vpn, *pm = vpm;
+    uint32_t *zda = vzda, *zn = vzn;
+
+    for (row = 0; row < oprsz; ) {
+        uint64_t pa = pn[row >> 4];
+        do {
+            if (pa & 1) {
+                for (col = 0; col < oprsz; ) {
+                    uint64_t pb = pm[col >> 4];
+                    do {
+                        if (pb & 1) {
+                            zda[row * sizeof(ARMVectorReg) + col] += zn[col];
+                        }
+                        pb >>= 4;
+                    } while (++col & 15);
+                }
+            }
+            pa >>= 4;
+        } while (++row & 15);
+    }
+}
+
+void HELPER(sme_addha_d)(void *vzda, void *vzn, void *vpn,
+                         void *vpm, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_oprsz(desc) / 8;
+    uint8_t *pn = vpn, *pm = vpm;
+    uint64_t *zda = vzda, *zn = vzn;
+
+    for (row = 0; row < oprsz; ++row) {
+        if (pn[H1(row)] & 1) {
+            for (col = 0; col < oprsz; ++col) {
+                if (pm[H1(col)] & 1) {
+                    zda[row * sizeof(ARMVectorReg) + col] += zn[col];
+                }
+            }
+        }
+    }
+}
+
+void HELPER(sme_addva_s)(void *vzda, void *vzn, void *vpn,
+                         void *vpm, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_oprsz(desc) / 4;
+    uint64_t *pn = vpn, *pm = vpm;
+    uint32_t *zda = vzda, *zn = vzn;
+
+    for (row = 0; row < oprsz; ) {
+        uint64_t pa = pn[row >> 4];
+        do {
+            if (pa & 1) {
+                uint32_t zn_row = zn[row];
+                for (col = 0; col < oprsz; ) {
+                    uint64_t pb = pm[col >> 4];
+                    do {
+                        if (pb & 1) {
+                            zda[row * sizeof(ARMVectorReg) + col] += zn_row;
+                        }
+                        pb >>= 4;
+                    } while (++col & 15);
+                }
+            }
+            pa >>= 4;
+        } while (++row & 15);
+    }
+}
+
+void HELPER(sme_addva_d)(void *vzda, void *vzn, void *vpn,
+                         void *vpm, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_oprsz(desc) / 8;
+    uint8_t *pn = vpn, *pm = vpm;
+    uint64_t *zda = vzda, *zn = vzn;
+
+    for (row = 0; row < oprsz; ++row) {
+        if (pn[H1(row)] & 1) {
+            uint64_t zn_row = zn[row];
+            for (col = 0; col < oprsz; ++col) {
+                if (pm[H1(col)] & 1) {
+                    zda[row * sizeof(ARMVectorReg) + col] += zn_row;
+                }
+            }
+        }
+    }
+}
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 87bbf9ab7f..12995d6a46 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -270,3 +270,34 @@ static bool do_ldst_r(DisasContext *s, arg_ldstr *a, GenLdStR *fn)
 
 TRANS_FEAT(LDR, aa64_sme, do_ldst_r, a, gen_sve_ldr)
 TRANS_FEAT(STR, aa64_sme, do_ldst_r, a, gen_sve_str)
+
+static bool do_adda(DisasContext *s, arg_adda *a, MemOp esz,
+                    gen_helper_gvec_4 *fn)
+{
+    int svl = streaming_vec_reg_size(s);
+    uint32_t desc = simd_desc(svl, svl, 0);
+    TCGv_ptr za, zn, pn, pm;
+
+    if (!sme_smza_enabled_check(s)) {
+        return true;
+    }
+
+    /* Sum XZR+zad to find ZAd. */
+    za = get_tile_rowcol(s, esz, 31, a->zad, false);
+    zn = vec_full_reg_ptr(s, a->zn);
+    pn = pred_full_reg_ptr(s, a->pn);
+    pm = pred_full_reg_ptr(s, a->pm);
+
+    fn(za, zn, pn, pm, tcg_constant_i32(desc));
+
+    tcg_temp_free_ptr(za);
+    tcg_temp_free_ptr(zn);
+    tcg_temp_free_ptr(pn);
+    tcg_temp_free_ptr(pm);
+    return true;
+}
+
+TRANS_FEAT(ADDHA_s, aa64_sme, do_adda, a, MO_32, gen_helper_sme_addha_s)
+TRANS_FEAT(ADDVA_s, aa64_sme, do_adda, a, MO_32, gen_helper_sme_addva_s)
+TRANS_FEAT(ADDHA_d, aa64_sme_i16i64, do_adda, a, MO_64, gen_helper_sme_addha_d)
+TRANS_FEAT(ADDVA_d, aa64_sme_i16i64, do_adda, a, MO_64, gen_helper_sme_addva_d)
-- 
2.34.1

