Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5214962lfh;
        Thu, 2 Jun 2022 15:29:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlglJbmDPj7JJQzFWdRstNp+KejrfK+Vx7ZKBMU+yPX2SFCIY6RCiq97Zibhulo/NfxKSN
X-Received: by 2002:a37:38a:0:b0:6a6:3992:3615 with SMTP id 132-20020a37038a000000b006a639923615mr4599658qkd.618.1654208946694;
        Thu, 02 Jun 2022 15:29:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654208946; cv=none;
        d=google.com; s=arc-20160816;
        b=RkokzZH2MNGVQAz813QZ35nXd6+387N8NyUGKW8AToXT6/Rr3f9zCND81SNa8WMQzv
         J1mDUyYgNMgJUJ2XqdHIvm3Bb+Tub9LgGvlLzLaUmVrDAJUQyzNnuEz4VbXAbclkpLod
         kFudSRc4o0DU8ykeg3gtNYXqwVndZY0719R8iCaavDoKNc9IlLX7LDlrF7ICSqbJtQaG
         miD6+HjmvRI8oyzKUTKCC6onbn1uRHXkA88GJdlMsxsqrPSkYugkGso00EPw/MZuzqqr
         CYfmoq/e1mZjF/w101SfqanWiOX1IoAYJ36vDQc7V7i5UN3ambTVHiNBx3EpoX7RulQc
         L8jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sgRdSe37RQpWV2b3fES1plqznaLnrgUpAgZ7R8ertBU=;
        b=eUi/XjTdb1DppX66UGrTwgET/w/rnaeD68YmCfp+Ef9lgr2imTAL8RLnNZQurHq1t8
         XsMs02BudYYprNByYep8KY6Cnh68aWqE0OkBDFQtT6b+KHeLo5Mr9wpoDPf3zikjsOEa
         kQO1uPqeprRxmvzO2WwEf8Q/ymsp+BPsK9ou+ZWKRrw8XofPdW4P3FSD9rmn21meAq2K
         7iNbnpBhBN2QTUsmCR+61muhw/t8ZHd04+q/2ec+Kf89Sm3NqmGIvtk0PWsrbxQkLj2i
         XTd+kjbR10XcGhvQlyFwS/izZh49d1bmcjvrMWfCsjCiQrWYl9ASJvKYO3aaaJpg954R
         y6Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LwgAeufX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5-20020a05621421a500b00461d21a9e4esi2215740qvc.311.2022.06.02.15.29.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:29:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LwgAeufX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwtJS-0004ai-5j
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskE-0001aX-OE
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:42 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:35568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskB-0000tj-Ae
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:42 -0400
Received: by mail-pf1-x42c.google.com with SMTP id u2so5812801pfc.2
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sgRdSe37RQpWV2b3fES1plqznaLnrgUpAgZ7R8ertBU=;
 b=LwgAeufXBNNtdQ6RiRkVhqEH5JpYxrCI9OpUrnwKAqGsdoAHVfjuGFD1Tz2g5v0Efq
 vhQtqQk6xDh/4R2LbYQh0oK7WDRVnM/PXzFH64LRujKHd684f7EY8PXj6L1MYU/knz89
 rs00VL/M3cshj9TEPYpySm+2wu1YknyayDS4KT6yeR6Wzv35cNxYvb+lPz9iIOTZgzWn
 cINopf6FEk8hrqml0TKjAEMModc4xmkC5rOfAm2Mnxf6NQhZKkniDlQS0NmZwdSTGXe6
 KxYxy9U9wJyexlfTMNIlWfl9CgQ9NVCw4M7XcSshf5JaSnTQlgagZrKOo8njwueEmEJu
 hRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sgRdSe37RQpWV2b3fES1plqznaLnrgUpAgZ7R8ertBU=;
 b=XyJr/+iGamnAvkYLVv0Berle7CpvNrbpzFRBqr8pqRCH86To5+2+yOucB/ZDx/9OV1
 9QtmvAolWC06FTRh0Z59HzNWiCUSR1JOdEZ2/Tt4RZHCk2/5mZut5gw1PIH3yBivxmMv
 qtSgpwouvrnIMNA2lbSdD7AehgvYWGboA8sGc3GkKAckqPZ5f0/tzmbN4mq4WfrkWJM3
 Y8Rq4hqcR8JTyECnq90AWKkIP2ipztdUEFGOFk5pQK3fM0Es8jdWseXbiJKyYmD/t5wU
 sMQTgLbNd8gZ4EblapsDamrJ015pEKH6HUGqXpiVlhTum2we0tcoRukZnh/qMlynZlsF
 RYiQ==
X-Gm-Message-State: AOAM531NB6m0QNWzswZvwhAuSidWJTkqdhbDLiKkDgXyfnvUbkxgN5u4
 dDrcebGzrbTWLVemlQ+TCXw4Mg==
X-Received: by 2002:a63:2b02:0:b0:3fa:fdcf:9c5b with SMTP id
 r2-20020a632b02000000b003fafdcf9c5bmr5908198pgr.448.1654206757903; 
 Thu, 02 Jun 2022 14:52:37 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 49/71] target/arm: Implement SME ADDHA, ADDVA
Date: Thu,  2 Jun 2022 14:48:31 -0700
Message-Id: <20220602214853.496211-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
X-TUID: rORlE5UyYxDo

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sme.h    |  5 +++
 target/arm/sme.decode      | 11 +++++
 target/arm/sme_helper.c    | 90 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c | 30 +++++++++++++
 4 files changed, 136 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 5cca01f372..6f0fce7e2c 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -114,3 +114,8 @@ DEF_HELPER_FLAGS_5(sme_st1q_be_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i
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
index b32c8435cb..b2b6380901 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -806,3 +806,93 @@ DO_ST(q, _be, MO_128)
 DO_ST(q, _le, MO_128)
 
 #undef DO_ST
+
+void HELPER(sme_addha_s)(void *vzda, void *vzn, void *vpn,
+                         void *vpm, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_oprsz(desc) / 4;
+    uint64_t *pn = vpn, *pm = vpm;
+    uint32_t * restrict zda = vzda, * restrict zn = vzn;
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
+    uint64_t * restrict zda = vzda, * restrict zn = vzn;
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
+    uint32_t * restrict zda = vzda, * restrict zn = vzn;
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
+    uint64_t * restrict zda = vzda, * restrict zn = vzn;
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
index c3e544d69c..e9676b2415 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -243,3 +243,33 @@ static bool do_ldst_r(DisasContext *s, arg_ldstr *a, GenLdStR *fn)
 
 TRANS_FEAT(LDR, aa64_sme, do_ldst_r, a, gen_sve_ldr)
 TRANS_FEAT(STR, aa64_sme, do_ldst_r, a, gen_sve_str)
+
+static bool do_adda(DisasContext *s, arg_adda *a, MemOp esz,
+                    gen_helper_gvec_4 *fn)
+{
+    uint32_t desc = simd_desc(s->svl, s->svl, 0);
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

