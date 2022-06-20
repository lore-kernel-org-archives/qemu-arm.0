Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp606369lft;
        Mon, 20 Jun 2022 11:09:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tQ9g2mqrMl8K2i3m5CzLIhFGZuiPIkzoUpzS+UrkUG5tDeTmWn1v822ASCpoENa83z+CPX
X-Received: by 2002:a05:620a:4805:b0:6a7:63f3:5dab with SMTP id eb5-20020a05620a480500b006a763f35dabmr17009060qkb.465.1655748582142;
        Mon, 20 Jun 2022 11:09:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655748582; cv=none;
        d=google.com; s=arc-20160816;
        b=ViJwBA+Ed0ZIVaCt0bMrPHlqv0ElInkXhcm0CGvhMr0MFrROBCRtbsSn/oLRPyJ9Ic
         4uEgYR4O93HhEL4Y4yRa9fZEMmqUMYC5e28j50a/tHtQp3fBcN8ywmUPgzFGjNynhZJd
         88QoIjL4Fi7isFof+bnlXWJSj+J+pCrMjblakrtdgp9l65KN97Rg+/9OK/lqTn0liFHi
         Wq0v02jijY0y0Be6VCgUQoc2+kxX0WltYgqyWLWL3i59YeVB75kYjyoXg2c15UcNUIIo
         tn5/hpw0I5kD725lCB6WspeHlm+4/VhmDJWbWS9P2mqTlqK8JXUAXd1i7jkP2qn+rPZD
         Ehtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=E4K6DCOe/i36LDuzHkwFG31IRZwDb3VpHryjLqKCC5U=;
        b=qbxx/lVPAI/6OnbFuIfcmh6KVaf0I6+Wgvv9u0BGmn8OZwUXCDTUjs+wdW8Vi3yV6f
         Bvowh9QS5n5TUobFf0A5dEghp38ZH/NfV8A39K+4ELNOHoqLQJaT3OSSPX9YJKqyiauu
         qmv+vd71msmucUpSlO/9WFdO5Yv+REaUVFR+YBKKol6ZhA5EPQE7P2u+7hKFUq+lnOV3
         sNnhTpG27n2PnstHQKSD0cA7+MFQsyNjN4uGBFrS14NJDnC74EpObnCnJgOtQfZ/Jp2l
         P+CyBJWx2mzZkNoKZ7T2j1h16/IWflYVqA84xnCGDaQz7anIyvQrz209TQ2APLteqoVm
         M2Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zgp6BLTP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12-20020a05622a198c00b00304f54be3a6si8382105qtc.779.2022.06.20.11.09.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 11:09:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zgp6BLTP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3LqH-0003V6-JO
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 14:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaH-0006Na-Hp
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:53:11 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:42726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaB-0001Ws-5L
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:53:07 -0400
Received: by mail-pf1-x434.google.com with SMTP id d17so1903664pfq.9
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E4K6DCOe/i36LDuzHkwFG31IRZwDb3VpHryjLqKCC5U=;
 b=Zgp6BLTP0NJtrGt4w5PrwcAiNOYUjxhfO3KjKqtISNQ+os/+EWOXeVUwd2c6VsjG2N
 K84N9mzYJbkC8XDtmUgtgPJgT5LVLoTEJ543YM6D/GhsTIPHqXTIhucAhhU0vs7Whxks
 mdgTfkeX460fXkcEUOhc2UM9Q54UpGVE+1FvER14EvLk/VBPmT2k6gSeNUSKu1Um+pe5
 kQ1gygfvGoWuAUMw7/TM1ePFu+DOt8fg8WaFSxBzthkCVyCEB88865DkrZZVNPN0+0Ab
 Hq9nR7SToqmkt1UypsbPNwWS+ty+ix9Zz1LtMynpxPJRzmm9G1/cMdItlCgdAdYIsMRM
 rttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E4K6DCOe/i36LDuzHkwFG31IRZwDb3VpHryjLqKCC5U=;
 b=F7m8CSBGJY3X/MIrrUvNjWSgPbhEYUIpkdkW17KspyeIdbsLk7y+JprnWPMEra8ZoQ
 ZRbcHbADI3vb83Vxuee2mUZcpi3wxKfaODFBR18yjxXfKX9QXBma5vMANSV1SnyNz5l2
 6vv5OKJ0SLQXG9LDjYz8FQFXvVb7xVM2/9IRsWZTzE5Tz4C/k4NNivzZD6r+dJ7GHNJf
 y+KIGDqOeWijYzyLXk0FUiGic7JQ+kzw1ABo6BF6o7Gb0kPS0V8FFm+rh7ogE7KmZn/F
 KyqiSnz78jt4XiQvhFUvN4zZTeAxOka6sHbWh2TPobODzmYq8+8vVgFRLzQWvySKX4v0
 tFAA==
X-Gm-Message-State: AJIora9Cd8uyRPyfGO7Ly7o1mz2bNUqFA8tIp0oVyTZRDsb7ncT3pZR0
 GsTT9g/u59Vbai58D7/IHaueYA==
X-Received: by 2002:a62:e919:0:b0:51e:7b6e:5a3b with SMTP id
 j25-20020a62e919000000b0051e7b6e5a3bmr26159669pfh.78.1655747581735; 
 Mon, 20 Jun 2022 10:53:01 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:53:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 29/51] target/arm: Implement SME ADDHA, ADDVA
Date: Mon, 20 Jun 2022 10:52:13 -0700
Message-Id: <20220620175235.60881-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 5N3a+0XL40QE

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
index 0c51fbbd49..799e44c047 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -807,3 +807,93 @@ DO_ST(q, _be, MO_128)
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

