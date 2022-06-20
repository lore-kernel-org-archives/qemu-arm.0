Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp616032lft;
        Mon, 20 Jun 2022 11:29:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u+GNw/z7mSCLpuvccbwiStoBfwO6ZVhk+ve+5YNEHzc9AN5H4rCRLe+awPKrpkvMoPLume
X-Received: by 2002:ac8:7f08:0:b0:305:14d2:63f5 with SMTP id f8-20020ac87f08000000b0030514d263f5mr20931162qtk.82.1655749745163;
        Mon, 20 Jun 2022 11:29:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655749745; cv=none;
        d=google.com; s=arc-20160816;
        b=Ccvsmqa2KgUbkgZxZ2Vx8eV1HgeVTixjjiASQ6ryLfdIzUklZKlX8jAJHzUN2kyvea
         0kB70KEX+rgsA54X+JoRP/uvAH91EAiigAs6qocAVgQSr5ebGeBS2gSUFFo/Pj8cXm4W
         GNf4DVOuoatX/PZKtz0YcDLaZ9LPJyoiZYe7WydS+kXrGs36/RWiPey3Yqj3HdHSawF1
         9lK3liXrz324VZOPmZpSVhUYV28aek2X0CG5dqnMGDL0yNNTe41zcfpvfSBBlOOGmlAo
         MvTzZfxaBcLkjoxJT8/mSF7Y+2TyYi/XIjlGsHTaK1rnkLVAT1Yf0iT86WiLcDRAvSV1
         flDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=w1qDsNqtAYsqFMj9Fwput0WMc3FMZUJZQ8uirWnPffc=;
        b=oOR8jb5qUNkE3+N6x+axRrfiCI61aG7yVn3QJoB0ZPFcwBP9WtbE+9y3AIBctQlI0I
         afuESj63086fLKJ2cDPpLBmZU20VZyGy7XoYcrO7OUbOKj2mICMev8oZf4soB8rKEOFy
         n8jzqkfMvPmUr4DkAnDWsKNa0HGMKPSBzJ0M8bzK8/SIohqrXGIBzMcVJ3jdBI08r4pN
         bdVf+xzXmrpBPRhkexJg5Gnd1vdLRvDoDqvF62SjScc81RFJrOFJeLWkG8rQR7wGLScY
         EhP/4LDmqE/6l5XJUIb7BJbADAi5gnZaH//9nE7XIcdoHtn13xrptaeJmvaNO7vZjeD7
         S5gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EeyfLagm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9-20020a05620a29c900b006a726c11e8fsi9455422qkp.582.2022.06.20.11.29.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 11:29:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EeyfLagm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3M92-0002iX-Ho
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 14:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaI-0006Nk-Ci
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:53:15 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:50713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LaD-0001Sg-N3
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:53:10 -0400
Received: by mail-pj1-x102a.google.com with SMTP id go6so6037296pjb.0
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w1qDsNqtAYsqFMj9Fwput0WMc3FMZUJZQ8uirWnPffc=;
 b=EeyfLagmKabtleRQ8QR9zYUJvAw34E88yWdQ6QuginV6g5uPnTXCLfg4F/wCb3s3C/
 NPkVHdaEzXyJRtBLcOMAV3AsKuU4sXEENv0QAOrOzXG2wcRUJYg37Sa84+uB1LRacsw9
 0/cXNPFAK5sFgLRi5FxcavRUiiN6yPhORdhlQWlQfN1Aij+P0I3hZ0mskBUZ5KzAaYlI
 hU/4/Lv0T0RC60ELBYXY1I8QOdrmcAti5chUtpsPWviJFQGy1vh5JBM74IEmYcmBNs6Y
 zQKz7naIXuuYKFmLJOngXnOLcc+jUoMleHHHHQUzScW1K1Nxlz5LnieQPfTldvAyO0hz
 r3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w1qDsNqtAYsqFMj9Fwput0WMc3FMZUJZQ8uirWnPffc=;
 b=yQiHrikHmuBIR1y6PUF9gSgMFV3NWLFhIU7YrXLHtizqzorKZXfQoIlnM2VHFu8Rnd
 4Ruxf/V36+885IUdJnbjwvuYTFobIOOd1YLSerAdWbAgmKb5uzt5yKF+JJZrGoP+4+l0
 WMyzfc2ktGMr+OTGqvrXG5Cp2W/Xtmuk0gUtScgp4p/+tkYytF/s+QL+9/J8KQ+0SgDD
 jTZZaKGIFcAEIe+cMeM43kb2TlzG5V7RuylUOg/DDZGSvOx+EJkoBOUcyKlSrpbIry4m
 vBzqYzLubQQus2ESHy06gZS/wN2A8HFctjYhY7f5IlO5VdUitqb8dh//9/5N8I+DtqSn
 EkLg==
X-Gm-Message-State: AJIora9w/UQrVFI/7EtkncAqh/tJD9IJz2we3uMGv4mUzFKezJCrwpLG
 ei0lCnJBZnAmQyvqtDiBuAu1Ng==
X-Received: by 2002:a17:902:bb95:b0:169:4d7:fee with SMTP id
 m21-20020a170902bb9500b0016904d70feemr22930753pls.80.1655747584933; 
 Mon, 20 Jun 2022 10:53:04 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:53:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 33/51] target/arm: Implement SME integer outer product
Date: Mon, 20 Jun 2022 10:52:17 -0700
Message-Id: <20220620175235.60881-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
X-TUID: JP/STJs/n6NW

This is SMOPA, SUMOPA, USMOPA_s, UMOPA, for both Int8 and Int16.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sme.h    | 16 ++++++++
 target/arm/sme.decode      | 10 +++++
 target/arm/sme_helper.c    | 82 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c | 14 +++++++
 4 files changed, 122 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index ecc957be14..31562551ee 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -128,3 +128,19 @@ DEF_HELPER_FLAGS_7(sme_fmopa_d, TCG_CALL_NO_RWG,
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
index 6863a204d4..f1c7e6ae56 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -1090,3 +1090,85 @@ void HELPER(sme_bfmopa)(void *vza, void *vzn, void *vzm, void *vpn,
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
+        uint64_t *za_row = &za[row * sizeof(ARMVectorReg)];
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
index 847f2274b1..4aa0aff25c 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -337,3 +337,17 @@ TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst,
 
 /* TODO: FEAT_EBF16 */
 TRANS_FEAT(BFMOPA, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_bfmopa)
+
+TRANS_FEAT(SMOPA_s, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_smopa_s)
+TRANS_FEAT(UMOPA_s, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_umopa_s)
+TRANS_FEAT(SUMOPA_s, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_sumopa_s)
+TRANS_FEAT(USMOPA_s, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_usmopa_s)
+
+TRANS_FEAT(SMOPA_d, aa64_sme_i16i64, do_outprod,
+           a, MO_64, gen_helper_sme_smopa_d)
+TRANS_FEAT(UMOPA_d, aa64_sme_i16i64, do_outprod,
+           a, MO_64, gen_helper_sme_umopa_d)
+TRANS_FEAT(SUMOPA_d, aa64_sme_i16i64, do_outprod,
+           a, MO_64, gen_helper_sme_sumopa_d)
+TRANS_FEAT(USMOPA_d, aa64_sme_i16i64, do_outprod,
+           a, MO_64, gen_helper_sme_usmopa_d)
-- 
2.34.1

