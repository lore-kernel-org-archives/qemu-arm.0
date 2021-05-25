Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4020607lfm;
        Mon, 24 May 2021 18:12:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4oxpEuAMlGkoLGI9aRR5b0+mOhCjVFWb4oefkCO//NFBl/Nv7JQktBOdTS2MIYoQMvraK
X-Received: by 2002:a05:6e02:e51:: with SMTP id l17mr19888436ilk.107.1621905128306;
        Mon, 24 May 2021 18:12:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621905128; cv=none;
        d=google.com; s=arc-20160816;
        b=UJ1TceVWQ4h6hO/BVig4DZxt1KSEOzS6HN2G1QT9CRZ1gwtyFZ4B+K7GcxZcAhIyhX
         x4oDbEqbf7qkTFy3i0Fu2fe5sBpb+X8wf6zKe35v5wuHndRIP4rq979UeTPFC7cQcy64
         Ro8nAVc1GXgvAEKp92bfoLVmrsZl9mLxKl3exfIJ73eqptCOa7wTBzL+9kiXZJeMWz/b
         yzo/yBNxwFIk/eKFTq5FtuDshN17UaRg8xRDrBG2zz5rxvaEh3Kd6aqOcmLlTLaOC87Q
         6SidwEwqty4+hPegrqzUID1UTFAqf8EPPjmztYIQqQazmojolm5vASRQu1lvD2oJMg/d
         OV/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/IR73sJZl9/5Rj7aH7uFBFILgqJUCpPjkqDLQZz1N3o=;
        b=c0ivgni9XUUoif6gbt7/+LNhdWK5q3jVKPJr39AeNzzGATLxZjRUAa+KI77MG5HHeo
         /AosElyPoMEUVG7w3WFNTZZqXgmUqOItmpRwYgmLeY+n4lBzhr2kTM45gPpiXIOK5kJh
         gjdU13nXvhq1tr8gMBwzYesF4Ic1+9asr/2Rcj5CEFhN69P0tILP5bgE3jzUZs4MHFna
         rnAaDCIDiWqn7Hf8p5VDQXgpjLxe1Wm3DDLn3Fp6mtIOQdQ9nQbR7KlwsnYfhpPOlovV
         P58GPZdlQY+6ecos48BjQbHaLF+g2wFzsaAlESOhj0m3pT4FGzGTji4IMhUB42rCuYL8
         +Juw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PJzQEKjP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9si16570079ilj.58.2021.05.24.18.12.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:12:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PJzQEKjP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llLc7-00087u-I5
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUc-0001if-3i
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:23 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:35613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUP-0001iz-Sq
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:21 -0400
Received: by mail-pg1-x536.google.com with SMTP id m190so21407585pga.2
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/IR73sJZl9/5Rj7aH7uFBFILgqJUCpPjkqDLQZz1N3o=;
 b=PJzQEKjPXXvyWTGkbK1J8g238xwAvEEAHlpYnDH8cTCoaGOme5tsmpAvFCoFTyK3D1
 30VPozPq7fmemk/0PAhbnsCzlKmvZFiMvf4+C6B0qZ1tTl27wooFOGj3YyAFDEfkw/0z
 0WSz5hZAdkZrUazznxTUZYf5qb2aByLyWotMaBwMEBYDqr2Yfm5j3PmpCN4EFoBMvXGp
 y1MU8xX9n+Mb6pfgzDi+5frkq6b2n71OOjv8431yGfJEzNiKmNbJTuydLbFDlYlWapKO
 75iUABr0cUZbORfWosSJH360JPxPYnMcroB7PLJf+3uzT6jKJ465IpZY2O9UWBYR7IKv
 MSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/IR73sJZl9/5Rj7aH7uFBFILgqJUCpPjkqDLQZz1N3o=;
 b=UnmCWKpKCbudtafQFpY7huODL7cvozAP/ndaXPPe+rL4JyhCIctVZy2q4E+IMyTmH3
 moLiuukUUUj6foNAOG2u/p49riNlsWbARc9aj8CleurEu8FdqRGcFBsH87kXrM0wkj/4
 qD8gV1C4V+RWfkZQkTt6H+9zGFCQe5l7YzeQ2TRfqA+67mZc+VFaCfFBb3WFdRGoF60A
 x3guP3dTKzQYXSVJg4x1RCprV2MtPhIgqRs7ngMzb1CGntTP8PhZqDYNC7taNzXvhyjd
 ZokbzASzpA4URhBZ0EQwTkBdhVhrfI07zZ+DFgaaf/cThzLEIS978w6GRakcgxVinm4O
 pa8g==
X-Gm-Message-State: AOAM530UmD0PtSrkc2P12qgmWStc7JF6GY4j9w3nl9eqNRhlAxTYHAW+
 f77Zf9R/cpdA1TftHE4DlGfGmQ==
X-Received: by 2002:a62:1b97:0:b029:24e:44e9:a8c1 with SMTP id
 b145-20020a621b970000b029024e44e9a8c1mr27562420pfb.19.1621904648270; 
 Mon, 24 May 2021 18:04:08 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 14/92] target/arm: Implement SVE2 PMULLB, PMULLT
Date: Mon, 24 May 2021 18:02:40 -0700
Message-Id: <20210525010358.152808-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VFrLK0MYlJsW

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 10 ++++++++++
 target/arm/helper-sve.h    |  1 +
 target/arm/sve.decode      |  2 ++
 target/arm/translate-sve.c | 22 ++++++++++++++++++++++
 target/arm/vec_helper.c    | 24 ++++++++++++++++++++++++
 5 files changed, 59 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a6e1fa6333..902579d24b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4231,6 +4231,16 @@ static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SVEVER) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2_aes(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, AES) != 0;
+}
+
+static inline bool isar_feature_aa64_sve2_pmull128(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, AES) >= 2;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index ad8121eec6..bf3e533eb4 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2363,3 +2363,4 @@ DEF_HELPER_FLAGS_4(sve2_umull_zzz_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_umull_zzz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(sve2_pmull_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_pmull_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index d9a72b7661..016c15ebb6 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1201,6 +1201,8 @@ USUBWT          01000101 .. 0 ..... 010 111 ..... .....  @rd_rn_rm
 
 SQDMULLB_zzz    01000101 .. 0 ..... 011 000 ..... .....  @rd_rn_rm
 SQDMULLT_zzz    01000101 .. 0 ..... 011 001 ..... .....  @rd_rn_rm
+PMULLB          01000101 .. 0 ..... 011 010 ..... .....  @rd_rn_rm
+PMULLT          01000101 .. 0 ..... 011 011 ..... .....  @rd_rn_rm
 SMULLB_zzz      01000101 .. 0 ..... 011 100 ..... .....  @rd_rn_rm
 SMULLT_zzz      01000101 .. 0 ..... 011 101 ..... .....  @rd_rn_rm
 UMULLB_zzz      01000101 .. 0 ..... 011 110 ..... .....  @rd_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 19a1f289d8..fbdccc1c68 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6030,6 +6030,28 @@ DO_SVE2_ZZZ_TB(SMULLT_zzz, smull_zzz, true, true)
 DO_SVE2_ZZZ_TB(UMULLB_zzz, umull_zzz, false, false)
 DO_SVE2_ZZZ_TB(UMULLT_zzz, umull_zzz, true, true)
 
+static bool do_trans_pmull(DisasContext *s, arg_rrr_esz *a, bool sel)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_gvec_pmull_q, gen_helper_sve2_pmull_h,
+        NULL,                    gen_helper_sve2_pmull_d,
+    };
+    if (a->esz == 0 && !dc_isar_feature(aa64_sve2_pmull128, s)) {
+        return false;
+    }
+    return do_sve2_zzw_ool(s, a, fns[a->esz], sel);
+}
+
+static bool trans_PMULLB(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_trans_pmull(s, a, false);
+}
+
+static bool trans_PMULLT(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_trans_pmull(s, a, true);
+}
+
 #define DO_SVE2_ZZZ_WTB(NAME, name, SEL2) \
 static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)       \
 {                                                               \
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 40b92100bf..b0ce597060 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -1750,6 +1750,30 @@ void HELPER(sve2_pmull_h)(void *vd, void *vn, void *vm, uint32_t desc)
         d[i] = pmull_h(nn, mm);
     }
 }
+
+static uint64_t pmull_d(uint64_t op1, uint64_t op2)
+{
+    uint64_t result = 0;
+    int i;
+
+    for (i = 0; i < 32; ++i) {
+        uint64_t mask = -((op1 >> i) & 1);
+        result ^= (op2 << i) & mask;
+    }
+    return result;
+}
+
+void HELPER(sve2_pmull_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t sel = H4(simd_data(desc));
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    uint32_t *n = vn, *m = vm;
+    uint64_t *d = vd;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        d[i] = pmull_d(n[2 * i + sel], m[2 * i + sel]);
+    }
+}
 #endif
 
 #define DO_CMP0(NAME, TYPE, OP)                         \
-- 
2.25.1

