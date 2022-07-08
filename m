Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp335784lft;
        Fri, 8 Jul 2022 08:24:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s+Q7X+R2bDtpGmPJ8rhyp4G0v82PFlJDbaDVsVjk/O+ikhs5Gjr1JZa0zMwpQGz2Nr49YN
X-Received: by 2002:a05:622a:38f:b0:305:1ea5:4a7 with SMTP id j15-20020a05622a038f00b003051ea504a7mr3435254qtx.291.1657293895739;
        Fri, 08 Jul 2022 08:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657293895; cv=none;
        d=google.com; s=arc-20160816;
        b=TtxmPdVaj24Xgh83FmT/sGY3sdsmkx7sriFtG/F9XNIfs7zgYbp+T654YEE7DsP/bf
         Gp/uJSrF23O5gOjIW9MU40hfT65HC72+QQn8oin65iBUHUuA7RoOfL5FDrArKhCD7KW+
         uW4SznoyJ2Ob/fDo6MzhCfaUN6jTBxSiJpWvi0A3qH3mV1FTVepAqg0KHGnp6GREnvMT
         WXLRtzUUB9jZhb0VjEDT9OQNKaKw4YBi7h9XCbLKykmI5M5ccjZb7gOYalThUaAxH5nn
         yuHxsArAtV7jEs6R/c2I4el1urk1nYqIR1ccbq1lj/0Th4MIU4Y08Alc1TGvp0BUXQN7
         2iog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1nuOMyOTVmZTm/vLrdu3i09qThjbDYLsicba1sLQlZY=;
        b=PXThHN5IWzBrUDiWjUNI/NIOs2OHAziTVjzhs5lqQUyrefWKXNkSKasbr7JxBCUx3d
         4ZPi+lJsGxPvEg7tYVssrX9d2fQAV600HQ/KMWhBcSS0AIiSTPyDM4vkh3xLIqjgFXnJ
         d6MnRNZ5puEMO5LzU2L28C5lowdHY6xaPHoyoOXAlMRToLDZUe8W2SytOxWm1nrCwMoS
         UNpu+MEtyE97WXs6fwpY3rXA9a7KrB65MtQYEXOo9O9H5qFmW9ah8DHB0ADB23ag6jTD
         yPc8KlZG1fQIORc8aCCme41L3VPXs6TGd8G+eoZR2UZ1BanB1DRsT4DPvMx+GSa6zE+s
         rIkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DdERSY0v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020a05621420c300b004705f62eaa1si11727483qve.452.2022.07.08.08.24.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:24:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DdERSY0v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9pqh-0003b8-5V
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pj2-0003ZP-Sr
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:17:02 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:36447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pj0-0002NH-K3
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:17:00 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso2221776pjc.1
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1nuOMyOTVmZTm/vLrdu3i09qThjbDYLsicba1sLQlZY=;
 b=DdERSY0vftKcVgPGjo0AXBTsCHdsz+ybd0agPcOBZt/oAwunKuxlKhjq7sO4vsCfJz
 jyeR9V1qfR32fgRJ438zWLRPVN7icka1LqrEKQ1dBuGlQOk0fhrOxhN6CKpH1CAuIfUT
 8RTAqlzaZQu/wtJ6QWqUtAeAjUHZ4DluOWaB3LywpIWyHbgfsttFKo17VnE/XH04fdEv
 zgGgM5IjPV9kTjIg4kdY1LAJWnm0isSXYxCwtiiqGkys56GH29uuMPrHjiAeBFwSj+uy
 oUu6aq56qljFKzae7E6Ld4SiG1isvhGK1sf1oi2U4LcguX/MFeArA3yUKNQtHjtfsDtc
 NQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1nuOMyOTVmZTm/vLrdu3i09qThjbDYLsicba1sLQlZY=;
 b=nSf0OF4JzABINHdsS+SQudgHG9BjGuyIi6NCG1imjlZzJ4AYI9on/56EkSJtEKKe4q
 1KVn3XG46TiZhKQxviXEVbhNbmwK5UuXDHC6IbWEonLBTkMbynb2Zm762d7p7oxsScow
 pN6UB1Fn0yIzqalrDc/dwFgPclfaKuXl5Ei/Tz8ygvo242lkVzxIsLIiLTd21/nkHIfv
 hLcpnPWcibIes6tzLVfcRRXgthp933VzlTbJSXw/mW5fttj/XOWUnT/4wD9CGqnyCjvE
 //F3pEJmqUhgmeuGXDQNxawnVqDCFoDzeydYAH1Ue1YNcPcOxcJHkttFeDUKJi5fOttt
 ByPg==
X-Gm-Message-State: AJIora9mkYSRMLyMpwDZKPo2ljwENcyYXCV3y6dacphN3mUkRZCAe2eB
 +L7EvF7WujkLI3mhTTDzqUnzsyVj5E5zeUm5
X-Received: by 2002:a17:90b:2384:b0:1ef:8506:374e with SMTP id
 mr4-20020a17090b238400b001ef8506374emr346386pjb.99.1657293417343; 
 Fri, 08 Jul 2022 08:16:57 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 23/45] target/arm: Implement SME ADDHA, ADDVA
Date: Fri,  8 Jul 2022 20:45:18 +0530
Message-Id: <20220708151540.18136-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-TUID: hQrGSa5r+SGF

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
index 10fd1ed910..f1e924db74 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -828,3 +828,93 @@ DO_ST(q, _be, MO_128)
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
+                            zda[tile_vslice_index(row) + H4(col)] += zn[H4(col)];
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
+                    zda[tile_vslice_index(row) + col] += zn[col];
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
+                uint32_t zn_row = zn[H4(row)];
+                for (col = 0; col < oprsz; ) {
+                    uint64_t pb = pm[col >> 4];
+                    do {
+                        if (pb & 1) {
+                            zda[tile_vslice_index(row) + H4(col)] += zn_row;
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
+                    zda[tile_vslice_index(row) + col] += zn_row;
+                }
+            }
+        }
+    }
+}
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 35c2644812..d3b9cdd5c4 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -267,3 +267,34 @@ static bool do_ldst_r(DisasContext *s, arg_ldstr *a, GenLdStR *fn)
 
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

