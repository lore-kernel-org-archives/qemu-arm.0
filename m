Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp338303lft;
        Fri, 8 Jul 2022 08:28:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uP+dN2Djvfqdn8q0BdKZ4xoD4Qf+zoamgZpMYu15S72thzBfJgLC0/HNK/am1lbSWRKcTH
X-Received: by 2002:ad4:576b:0:b0:473:322c:4f6 with SMTP id r11-20020ad4576b000000b00473322c04f6mr3160741qvx.70.1657294138101;
        Fri, 08 Jul 2022 08:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657294138; cv=none;
        d=google.com; s=arc-20160816;
        b=RTRP7+b8TKQZJsaiFfGnMQjUGOEajsXs352DaGsR2tFhOK3mgCYJtaeGCBPBLxXcVt
         qcdsC4w+UdXj15KwjBd0PKMkTmTjA5E6HdK6CSoYyC5Ax88ToMjLZ8H6AEodyIOVTf7B
         nTlviT0msN1DY/2J9KuYnNOaoftbJ6v3HDleBUcFDrSu9ZAVxwJxyJmHGTRVwkgrLzGV
         sEwilbfxJVYil+YP+BGBU5P13xm2Ci5MEwzJKo5SHkHRLU+hvVjM1dxS8ilLdAkNlKxb
         UgLf6TzcM9o9+IU6papxnsWB6w+t05RChvZyDuqKEAbXabwFgw2JdiisS9fNHQ5yYpOF
         bPRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hXhGi/aw89RWj52AXFgmx3W0yCI8A/e6P49IWgiTRQs=;
        b=c8bstRYdI+OY9nStrtvrQD8R1Df/1g7uEQ/FVQoNf5k7Cs0Ce4VNHBtL2neKNUFA9S
         MR3PeyfILPOjArIVmRS+DCPM0Vu1Io0lyu+cJLkwwKCuU6kku/eV4zaQWmGwjwQCVvQ/
         uYtpOjv+VYMkYuP0njz7z+9ZJ9ZH8wKcflCK0sVLaC4mGoTWnKHZM2hUx9K72DT8tUjC
         wD01dHu1HXxEjcZKCU+RgyuqRPmNzYFV9ra4PqIIlvkh+WMw1y4DimZFeAeqHhLFKSxR
         fsundxjMJa+4jOGS9+KROfFn/YETK8RFCpSz6JwTyllRiDyMYgDOBlqmJU+qMmnbKrWj
         Ro6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gycKuKBN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4-20020a05620a0d8400b006a68d8b7b93si31655491qkl.684.2022.07.08.08.28.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:28:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gycKuKBN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9pub-0003iP-Iz
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjD-0003yp-R0
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:17:11 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:41571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjB-0002PD-RK
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:17:11 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 o31-20020a17090a0a2200b001ef7bd037bbso2080131pjo.0
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hXhGi/aw89RWj52AXFgmx3W0yCI8A/e6P49IWgiTRQs=;
 b=gycKuKBNDGdn/L/F+HJe7jaTxLzUgscs6OKVzhsE2VIAwLCRcFcxJG8OKcgt0kcuoh
 cXAUCSQRAQl1XUprJxk6YaHjXYUpBWuF1Ldbb7w1cTgEFUxj+dCkjQwi6QwwlwO2dL9z
 0L27mU6wdBHGZ210ArakrbGj7puC3LoJBvS0rqPxmxtjq99oQuGX5CilkAakAdiVkjtS
 QrZGtqJg4mjh1J9nyYb79n0rSii4nUWJAriQR9LkBrTmwfKFhJLIpQkZ5uR/R6FhbtSP
 qjB49pJq1sVrQt9jvjE9OSlkIds00GbxJirSRYKsvA+/piqnSr9Gi5ZjTDceHuzP/ETc
 1/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hXhGi/aw89RWj52AXFgmx3W0yCI8A/e6P49IWgiTRQs=;
 b=dmljTXQZbbYyaKVBPTDaKIcwGyeKx+sv06/uI/hfCEENbAk98L1jCCMI/X0roan/cW
 oY/AUGFibDtrK0xBOs3gCte50ld//l2oOH751RU2hlAYNJyiNUHwDjbMlPMH/8Rg6Dcd
 QEiYFbqdXQTWc6eoAgyoiBkdxfgY3lhQcLzUprCpNY3bD2930y5tbEe6ZL7NhDvj5agP
 LyMN25JybrkCkUoQMTF91gr7911ir4VIifZjc2RiIPsHFW8jNrWl6RdlsoS5ffnoP16F
 jyy/DlK1jHMZ09uvX5AmsICHsLTDRZrFW7J7psRJZ3FyYNDijzbkxIXZGXUTo4EtzNPj
 VVfA==
X-Gm-Message-State: AJIora/7GIsOh6iiVba8Kg4v4yxGj+NP2Ge/3cwNYq01zqhVNI0ijNpb
 UqwD9SAqzYx634Jk+DLYVb1PRaKq0WkOLufe
X-Received: by 2002:a17:902:d542:b0:16c:8ac:f471 with SMTP id
 z2-20020a170902d54200b0016c08acf471mr4387311plf.39.1657293428558; 
 Fri, 08 Jul 2022 08:17:08 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:17:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 27/45] target/arm: Implement SME integer outer product
Date: Fri,  8 Jul 2022 20:45:22 +0530
Message-Id: <20220708151540.18136-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-TUID: 2Pv6CyO5lP4p

This is SMOPA, SUMOPA, USMOPA_s, UMOPA, for both Int8 and Int16.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sme.h    | 16 ++++++++
 target/arm/sme.decode      | 10 +++++
 target/arm/sme_helper.c    | 82 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c | 10 +++++
 4 files changed, 118 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 4d5d05db3a..d2d544a696 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -129,3 +129,19 @@ DEF_HELPER_FLAGS_7(sme_fmopa_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sme_bfmopa, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_smopa_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_umopa_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_sumopa_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_usmopa_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_smopa_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_umopa_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_sumopa_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme_usmopa_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index e8d27fd8a0..628804e37a 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -76,3 +76,13 @@ FMOPA_d         10000000 110 ..... ... ... ..... . 0 ...        @op_64
 
 BFMOPA          10000001 100 ..... ... ... ..... . 00 ..        @op_32
 FMOPA_h         10000001 101 ..... ... ... ..... . 00 ..        @op_32
+
+SMOPA_s         1010000 0 10 0 ..... ... ... ..... . 00 ..      @op_32
+SUMOPA_s        1010000 0 10 1 ..... ... ... ..... . 00 ..      @op_32
+USMOPA_s        1010000 1 10 0 ..... ... ... ..... . 00 ..      @op_32
+UMOPA_s         1010000 1 10 1 ..... ... ... ..... . 00 ..      @op_32
+
+SMOPA_d         1010000 0 11 0 ..... ... ... ..... . 0 ...      @op_64
+SUMOPA_d        1010000 0 11 1 ..... ... ... ..... . 0 ...      @op_64
+USMOPA_d        1010000 1 11 0 ..... ... ... ..... . 0 ...      @op_64
+UMOPA_d         1010000 1 11 1 ..... ... ... ..... . 0 ...      @op_64
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index 302f89c30b..f891306bb9 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -1117,3 +1117,85 @@ void HELPER(sme_bfmopa)(void *vza, void *vzn, void *vzm, void *vpn,
         } while (row & 15);
     }
 }
+
+typedef uint64_t IMOPFn(uint64_t, uint64_t, uint64_t, uint8_t, bool);
+
+static inline void do_imopa(uint64_t *za, uint64_t *zn, uint64_t *zm,
+                            uint8_t *pn, uint8_t *pm,
+                            uint32_t desc, IMOPFn *fn)
+{
+    intptr_t row, col, oprsz = simd_oprsz(desc) / 8;
+    bool neg = simd_data(desc);
+
+    for (row = 0; row < oprsz; ++row) {
+        uint8_t pa = pn[H1(row)];
+        uint64_t *za_row = &za[tile_vslice_index(row)];
+        uint64_t n = zn[row];
+
+        for (col = 0; col < oprsz; ++col) {
+            uint8_t pb = pm[H1(col)];
+            uint64_t *a = &za_row[col];
+
+            *a = fn(n, zm[col], *a, pa & pb, neg);
+        }
+    }
+}
+
+#define DEF_IMOP_32(NAME, NTYPE, MTYPE) \
+static uint64_t NAME(uint64_t n, uint64_t m, uint64_t a, uint8_t p, bool neg) \
+{                                                                           \
+    uint32_t sum0 = 0, sum1 = 0;                                            \
+    /* Apply P to N as a mask, making the inactive elements 0. */           \
+    n &= expand_pred_b(p);                                                  \
+    sum0 += (NTYPE)(n >> 0) * (MTYPE)(m >> 0);                              \
+    sum0 += (NTYPE)(n >> 8) * (MTYPE)(m >> 8);                              \
+    sum0 += (NTYPE)(n >> 16) * (MTYPE)(m >> 16);                            \
+    sum0 += (NTYPE)(n >> 24) * (MTYPE)(m >> 24);                            \
+    sum1 += (NTYPE)(n >> 32) * (MTYPE)(m >> 32);                            \
+    sum1 += (NTYPE)(n >> 40) * (MTYPE)(m >> 40);                            \
+    sum1 += (NTYPE)(n >> 48) * (MTYPE)(m >> 48);                            \
+    sum1 += (NTYPE)(n >> 56) * (MTYPE)(m >> 56);                            \
+    if (neg) {                                                              \
+        sum0 = (uint32_t)a - sum0, sum1 = (uint32_t)(a >> 32) - sum1;       \
+    } else {                                                                \
+        sum0 = (uint32_t)a + sum0, sum1 = (uint32_t)(a >> 32) + sum1;       \
+    }                                                                       \
+    return ((uint64_t)sum1 << 32) | sum0;                                   \
+}
+
+#define DEF_IMOP_64(NAME, NTYPE, MTYPE) \
+static uint64_t NAME(uint64_t n, uint64_t m, uint64_t a, uint8_t p, bool neg) \
+{                                                                           \
+    uint64_t sum = 0;                                                       \
+    /* Apply P to N as a mask, making the inactive elements 0. */           \
+    n &= expand_pred_h(p);                                                  \
+    sum += (NTYPE)(n >> 0) * (MTYPE)(m >> 0);                               \
+    sum += (NTYPE)(n >> 16) * (MTYPE)(m >> 16);                             \
+    sum += (NTYPE)(n >> 32) * (MTYPE)(m >> 32);                             \
+    sum += (NTYPE)(n >> 48) * (MTYPE)(m >> 48);                             \
+    return neg ? a - sum : a + sum;                                         \
+}
+
+DEF_IMOP_32(smopa_s, int8_t, int8_t)
+DEF_IMOP_32(umopa_s, uint8_t, uint8_t)
+DEF_IMOP_32(sumopa_s, int8_t, uint8_t)
+DEF_IMOP_32(usmopa_s, uint8_t, int8_t)
+
+DEF_IMOP_64(smopa_d, int16_t, int16_t)
+DEF_IMOP_64(umopa_d, uint16_t, uint16_t)
+DEF_IMOP_64(sumopa_d, int16_t, uint16_t)
+DEF_IMOP_64(usmopa_d, uint16_t, int16_t)
+
+#define DEF_IMOPH(NAME) \
+    void HELPER(sme_##NAME)(void *vza, void *vzn, void *vzm, void *vpn,      \
+                            void *vpm, uint32_t desc)                        \
+    { do_imopa(vza, vzn, vzm, vpn, vpm, desc, NAME); }
+
+DEF_IMOPH(smopa_s)
+DEF_IMOPH(umopa_s)
+DEF_IMOPH(sumopa_s)
+DEF_IMOPH(usmopa_s)
+DEF_IMOPH(smopa_d)
+DEF_IMOPH(umopa_d)
+DEF_IMOPH(sumopa_d)
+DEF_IMOPH(usmopa_d)
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index c2953b22ce..7b87a9df63 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -361,3 +361,13 @@ TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst, a, MO_64, gen_helper_sme_f
 
 /* TODO: FEAT_EBF16 */
 TRANS_FEAT(BFMOPA, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_bfmopa)
+
+TRANS_FEAT(SMOPA_s, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_smopa_s)
+TRANS_FEAT(UMOPA_s, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_umopa_s)
+TRANS_FEAT(SUMOPA_s, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_sumopa_s)
+TRANS_FEAT(USMOPA_s, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_usmopa_s)
+
+TRANS_FEAT(SMOPA_d, aa64_sme_i16i64, do_outprod, a, MO_64, gen_helper_sme_smopa_d)
+TRANS_FEAT(UMOPA_d, aa64_sme_i16i64, do_outprod, a, MO_64, gen_helper_sme_umopa_d)
+TRANS_FEAT(SUMOPA_d, aa64_sme_i16i64, do_outprod, a, MO_64, gen_helper_sme_sumopa_d)
+TRANS_FEAT(USMOPA_d, aa64_sme_i16i64, do_outprod, a, MO_64, gen_helper_sme_usmopa_d)
-- 
2.34.1

