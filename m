Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp472314lfg;
        Fri, 30 Apr 2021 13:34:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+qJY3LK3vhMn8zjSKy/KPje1NqVPHsQNq+3RC+/Jl8HwMscx2giR7aISipRMSQxRjhJKa
X-Received: by 2002:a5d:8712:: with SMTP id u18mr5440416iom.10.1619814895258;
        Fri, 30 Apr 2021 13:34:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619814895; cv=none;
        d=google.com; s=arc-20160816;
        b=GkdTNGrxAw8O9OlTQZDzirDuTL1FgBjFE7A1oAEclHC2aNUWwQL4GLLIvjsVXdWwLX
         jInvo+Tklf/+GwF0b/BHq4qLojkhM0j1aA9ftOhuzA4AHoFwb2KGa2u2p/HcU73Ib8B0
         z2md0yOdsCv/N4k5u4V/ieBRBeD8BolmkbTBVwWvTX/wRf9wJaWVHBPxm9RwVgj8mqjk
         3SWWskiDYX4jbk0fJeAbry0jND/y7JYvhlKmZXI76bSTubcP7q07gxVOUYZQOMKN8xob
         RcOljTW1HxZDe79RdYiaoadZjcxbjRc7SONM8tgb/z+wtuDgVWDjEtmJeyVAXJVqQFNP
         BF6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TFy/ivv1KJ7f/BHQOtAUnbXQPt7AVG5AmrGqJKBkDA4=;
        b=hvmZDdAhE2gdwROFstJE4OCL4fiOuWzIZ70pvA5Ri0IB9JZPtSrioBJ0Gq9xJePxff
         +16OJ680BUCj6b0ITXZbrVu1wbkTzofAFwKQ8bUvxQTFiIS2x2FmLxvuBgMqBeRwGZFh
         l2c3++O5+L82sWmQQX8ipSYVqsKNQZwhji3iJSogIuZi6GcGGkfxwVduGovWKA5VdgqH
         CaEy3/Ee9WCT9W9uhjlfzgvy0Md8l6q1kkdRQlPKg1aN5Klm7T/RE196Agkos7eS6+la
         22jeSCWU1LzszJCcwJAgtycTenQslwlnlDBZUhEDAQi9FXRUCHtbboFdM5ffwHgwr5bJ
         kRJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=trRNhIVg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si3081248ilv.5.2021.04.30.13.34.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 13:34:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=trRNhIVg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcZqg-0000EW-Hl
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 16:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZia-0008RK-Ci
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:32 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiP-000613-9E
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:32 -0400
Received: by mail-pl1-x633.google.com with SMTP id 20so33283641pll.7
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TFy/ivv1KJ7f/BHQOtAUnbXQPt7AVG5AmrGqJKBkDA4=;
 b=trRNhIVgi69kJghI+oxB01zCsaQSUlulS9UUZnDOOpjN4x4dJ3brJIVXezJicq3X1f
 A1mQGoXPzGBIviVgnxAEAOTQnbjTWtaBkGDbpP7a8Ev9U4/BiMWRzNmiaShe89q3WDRd
 vHwRVNbD30dEoRxunYSsi0H4floc/efje7xR2xWDYUMeqTzEUKnH3+Y/hJxAI5LfH9Pc
 +9ZyMIwWm/wN1I0w4Gai5RHc0zvrepaGfwDqoiecoWsFaai0ZW7A+K8GSiotTQuarVuH
 Wf/hWY3JgDNhkPhjOPDCcnSCuPRo1fpDkqELL8DMNztmiBAuLTJnCdDEqvSrzjEVf9X3
 6qmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TFy/ivv1KJ7f/BHQOtAUnbXQPt7AVG5AmrGqJKBkDA4=;
 b=BrcC6Mr6eJTS1RJgOJJHouZXgGCZfLRm3JAVP8zy61RXYBMQTxdogt5id5Ys/DOrBQ
 wz9WRKcKyoEbnTSrJ+sq+C3n0Ns1Fm977mtJP3Jy9S2FWfZU93pCluZQ43RisSGHtuUF
 PBOJWmZMMHDL7NOQXLW5sCRGaWd0nNP4cn1VqlvkcbDXMSUBTNKOB894nDgZ24rIaJ0j
 +qWTfF7+BOOyyPXv7mQPVMpHV9vmGOlOsA/f9gu1yhHVd8F2K5DvuoLxlMYWl07uALGx
 rziR5jkfNIVNld8w5kq6/yItCHqhoyRtVEBAqrM2l9Lu9LmRqMBbjY16c2VRSz00xKkV
 ovzQ==
X-Gm-Message-State: AOAM533Q+alCZDf7RVMoFQ0hfiuM6DS42o+NiWbPqKURvILa9NjP0WL5
 9Y949k0UAFzBp7RdQkVN5rcW86Mwlzln6g==
X-Received: by 2002:a17:90a:488a:: with SMTP id
 b10mr7086548pjh.2.1619814379613; 
 Fri, 30 Apr 2021 13:26:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 14/82] target/arm: Implement PMULLB and PMULLT
Date: Fri, 30 Apr 2021 13:25:02 -0700
Message-Id: <20210430202610.1136687-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e3G8Ocg5AVTh

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

