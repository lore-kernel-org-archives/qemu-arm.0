Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2889397lft;
        Mon, 27 Jun 2022 21:37:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t/sc0iPwkrPvXwiZyPLqVQZvPnTEBaUitaGZt8SjLxjRGyssi0bHZWHFabbUizj9+mkedB
X-Received: by 2002:ad4:5e8a:0:b0:470:57b4:33e2 with SMTP id jl10-20020ad45e8a000000b0047057b433e2mr2148337qvb.66.1656391026154;
        Mon, 27 Jun 2022 21:37:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656391026; cv=none;
        d=google.com; s=arc-20160816;
        b=vSBDHlheTQHyiQ72B9YOyp3H071/mKhb3dIP0DoLDcn/DgnvMae4ynQructAKl/sMq
         c10jh+Wt/tZnpkzcObeGrGuFC4oWHUBjY4zlXptTakZGhokGKb/BiirgF+CSIX+2hqfK
         tWcpfqlNaiP+q/a/2V/cWsPIfiN2WLqnxXby7TuWB98e6HX3M1kO8ghPaXZf9PKB0x4q
         YQgaKfCZ5TE2XQgFZ8fe6vSpe1TkpM16ryTvcuNkyREoGAHOZu9fZtqxrwNl7pUR/HlQ
         RUqjLRYs7VYExVBJoA6M7OfFG1JUW9qDXbFbAt0bra4lWS+FiSuXkJc4QSw4D4lqHV+8
         lggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Af6qRCYpulQvR5KIq4+AnYQ9eO1hRhb3VIlbqOHrtoM=;
        b=wiCLZvAwrOI+SYDxjA9Ix6bIPHiRC4DXtXsMpO4sw3lL69LWMcYpVpWMqPVxmzu/ox
         MmUrjtPZXfNPoVjQ/7+HmIbaR6gnz5VCA7wWqOEnpFMlU/sOCQ3H2I9QhNyeocpO5/lP
         ao6rSRtMaLT67ihRgf8SZSe/kqHTKjltTBBJwEC4L189Ng8k9V8ONvDF9liPRytsrtun
         mAN9jRiSEavmzHgU2gJS5Ah90WgTmAJWssqRCMFYd40KICsF4BQ4honLARQJeaseVZB1
         vSSEWtRAItJaKIOzMk/qPiu54wb26QdByGmlHCkM5qWFydiqiX5KS04XV9l59Huv0YfC
         2MWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zr+aUzUL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fw13-20020a056214238d00b004705b0eeceesi7010684qvb.174.2022.06.27.21.37.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:37:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zr+aUzUL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o62yH-0007ie-LL
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62k6-0002El-8S
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:26 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62k3-0003lQ-FC
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:25 -0400
Received: by mail-pl1-x635.google.com with SMTP id l6so9955415plg.11
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 21:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Af6qRCYpulQvR5KIq4+AnYQ9eO1hRhb3VIlbqOHrtoM=;
 b=zr+aUzUL1YttUP66WDsL5N1sqjnU7NfJLUzEK3GmNPBYwKhTX0tcaG6KK5ai1Li0ST
 /2ZCqxqMjHCEOI+0bhn9gEfKi+bMZOgv5xgPeV90z0BscHILq2yFTdkhURevx5FpxQ65
 uPEa/9BEH6t+GVRtiQEiFBfRg59EvlQEQMKHBUXd4TO9g9LQWei+du/GwLoywMooSHFi
 /hHaPy7nj3638kaqW72CyWLzKsCuGnMHbUprVhKqcij97l0OfkmwJngWbTHU4vrm7Sqs
 ZEXDQRCviMtfMOYPsmHMUAtLKH3Sk60MJi1JH/scGwbwe2bzU6c9DxzA8M6cvc1QJ3Ze
 s7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Af6qRCYpulQvR5KIq4+AnYQ9eO1hRhb3VIlbqOHrtoM=;
 b=zqvuWPV3EfKbDLqB7wQqo0Kn75AdrEkVyKvLk5Lz4Bzk/cFW3qmxEYrDoJKTTloy7h
 0JhkkMszk1zNfwwbRFXd1bQGUgqit4RVy+TR4p2GantQSqr5w1kkVnBAfb1xYphj5b8e
 KzeUdvSq2KKZR/MLYoCJ+dD8pGYiAWrdweECzWhp/cb0Iiuy8kChjgrpGK/dzYm0vn/c
 t82y0Mahu9/7athSa9e7hhepLr/XjZFo+QSBa+6HHqd7KuqwHCz5QkMMKvoIxQnatZg2
 R7AHEmPrcFAA5cZoSYBYpMsiPHrj4p+w248wRr6LcgM6tj8LO46nlv+uA+ivL5XKTBvt
 Ztiw==
X-Gm-Message-State: AJIora9ngcRkVPuxp1bnlgtp/RR8rjOqwtNcI1/0+i1Nmsr3mNH9mHTa
 d6x24SIntzW5Fft4AeuCnCvc4A==
X-Received: by 2002:a17:90b:4d81:b0:1ed:50e2:8547 with SMTP id
 oj1-20020a17090b4d8100b001ed50e28547mr15288243pjb.169.1656390141742; 
 Mon, 27 Jun 2022 21:22:21 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 25/45] target/arm: Implement BFMOPA, BFMOPS
Date: Tue, 28 Jun 2022 09:50:57 +0530
Message-Id: <20220628042117.368549-26-richard.henderson@linaro.org>
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
X-TUID: YfSh8KDUC+ac

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sme.h    |  2 ++
 target/arm/sme.decode      |  2 ++
 target/arm/sme_helper.c    | 52 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c | 30 ++++++++++++++++++++++
 4 files changed, 86 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index f50d0fe1d6..1d68fb8c74 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -125,3 +125,5 @@ DEF_HELPER_FLAGS_7(sme_fmopa_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_7(sme_fmopa_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_bfmopa, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index ba4774d174..afd9c0dffd 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -73,3 +73,5 @@ ADDVA_d         11000000 11 01000 1 ... ... ..... 00 ...        @adda_64
 
 FMOPA_s         10000000 100 ..... ... ... ..... . 00 ..        @op_32
 FMOPA_d         10000000 110 ..... ... ... ..... . 0 ...        @op_64
+
+BFMOPA          10000001 100 ..... ... ... ..... . 00 ..        @op_32
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index 31c53ad896..d2e1057124 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -961,3 +961,55 @@ void HELPER(sme_fmopa_d)(void *vza, void *vzn, void *vzm, void *vpn,
         }
     }
 }
+
+/*
+ * Alter PAIR as needed for controlling predicates being false,
+ * and for NEG on an enabled row element.
+ */
+static inline uint32_t f16mop_adj_pair(uint32_t pair, uint32_t pg, uint32_t neg)
+{
+    pair ^= neg;
+    if (!(pg & 1)) {
+        pair &= 0xffff0000u;
+    }
+    if (!(pg & 4)) {
+        pair &= 0x0000ffffu;
+    }
+    return pair;
+}
+
+void HELPER(sme_bfmopa)(void *vza, void *vzn, void *vzm, void *vpn,
+                        void *vpm, uint32_t desc)
+{
+    intptr_t row, col, oprsz = simd_maxsz(desc);
+    uint32_t neg = simd_data(desc) << 15;
+    uint16_t *pn = vpn, *pm = vpm;
+
+    for (row = 0; row < oprsz; ) {
+        uint16_t pa = pn[H2(row >> 4)];
+        do {
+            void *vza_row = vza + row * sizeof(ARMVectorReg);
+            uint32_t n = *(uint32_t *)(vzn + row);
+
+            n = f16mop_adj_pair(n, pa, neg);
+
+            for (col = 0; col < oprsz; ) {
+                uint16_t pb = pm[H2(col >> 4)];
+                do {
+                    if ((pa & 0b0101) == 0b0101 || (pb & 0b0101) == 0b0101) {
+                        uint32_t *a = vza_row + col;
+                        uint32_t m = *(uint32_t *)(vzm + col);
+
+                        m = f16mop_adj_pair(m, pb, neg);
+                        *a = bfdotadd(*a, n, m);
+
+                        col += 4;
+                        pb >>= 4;
+                    }
+                } while (col & 15);
+            }
+            row += 4;
+            pa >>= 4;
+        } while (row & 15);
+    }
+}
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 1117a61f62..e537a14b6d 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -302,6 +302,33 @@ TRANS_FEAT(ADDVA_s, aa64_sme, do_adda, a, MO_32, gen_helper_sme_addva_s)
 TRANS_FEAT(ADDHA_d, aa64_sme_i16i64, do_adda, a, MO_64, gen_helper_sme_addha_d)
 TRANS_FEAT(ADDVA_d, aa64_sme_i16i64, do_adda, a, MO_64, gen_helper_sme_addva_d)
 
+static bool do_outprod(DisasContext *s, arg_op *a, MemOp esz,
+                       gen_helper_gvec_5 *fn)
+{
+    int svl = streaming_vec_reg_size(s);
+    uint32_t desc = simd_desc(svl, svl, a->sub);
+    TCGv_ptr za, zn, zm, pn, pm;
+
+    if (!sme_smza_enabled_check(s)) {
+        return true;
+    }
+
+    /* Sum XZR+zad to find ZAd. */
+    za = get_tile_rowcol(s, esz, 31, a->zad, false);
+    zn = vec_full_reg_ptr(s, a->zn);
+    zm = vec_full_reg_ptr(s, a->zm);
+    pn = pred_full_reg_ptr(s, a->pn);
+    pm = pred_full_reg_ptr(s, a->pm);
+
+    fn(za, zn, zm, pn, pm, tcg_constant_i32(desc));
+
+    tcg_temp_free_ptr(za);
+    tcg_temp_free_ptr(zn);
+    tcg_temp_free_ptr(pn);
+    tcg_temp_free_ptr(pm);
+    return true;
+}
+
 static bool do_outprod_fpst(DisasContext *s, arg_op *a, MemOp esz,
                             gen_helper_gvec_5_ptr *fn)
 {
@@ -333,3 +360,6 @@ static bool do_outprod_fpst(DisasContext *s, arg_op *a, MemOp esz,
 
 TRANS_FEAT(FMOPA_s, aa64_sme, do_outprod_fpst, a, MO_32, gen_helper_sme_fmopa_s)
 TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst, a, MO_64, gen_helper_sme_fmopa_d)
+
+/* TODO: FEAT_EBF16 */
+TRANS_FEAT(BFMOPA, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_bfmopa)
-- 
2.34.1

