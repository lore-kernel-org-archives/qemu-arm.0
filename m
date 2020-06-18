Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1266876lfm;
        Wed, 17 Jun 2020 21:39:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyu62VCA2mcSpSZctI1bC4/6xvEVF3e9iHzGvLCFxvZJX3iuHxVliYxCJQIAxYU8cx9NDB
X-Received: by 2002:a25:3189:: with SMTP id x131mr3326700ybx.25.1592455199246;
        Wed, 17 Jun 2020 21:39:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592455199; cv=none;
        d=google.com; s=arc-20160816;
        b=dkhVDTB8bSkKX40/JVudeR4nBbCPG5OazDBk+w6HDym+jhPdbA66PlXbWy7W24nF3h
         O2ok09WqLXIMfkzMmZtKVHDsBZHY9DS1sdpUZFyqg5d0zjWEqFuQK0IKdOJJPVL4xy3u
         MRqo59kuejkvhy33iCQk7cdK6sqXQQPMPB3EuCI724Xv9eZ5SZAhX6j9jzm8c5tKmpKT
         0OMXzdtJ/PZNfcHoMs7imSrDTLsjRghFsqDYjXRivq8O8DED9FgZrJLnAd/IlwMyHMJz
         7TZjpLV8GTzuny89EUcI0XQA4rlybvh+wmXz+DCwn5D8Ul16g0wTIPXjwhP7tByWEbNM
         FDYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=T9tLcCKTkbNmDxAyHgl5RsUu/R3CyNcD6tukvru2LMk=;
        b=g0jzOTg9m+zMVMVjv2MvssFGV5DR8TXkTXzi4P0UnQQV4R9wLse4qNU/4H4yR/MM1Z
         Vf/LY2K1DiaR+CKzLjOi7rFieoDQn49gN3YfwCyUyP+XegnOlQagbI4N9Ip6Qc18b4bY
         nWT0qXfZ4xfAc31Cr0n25XxY/HHDkDy/P777gDrwcf1Iv12NYFjF9mlB2x6k8Gvyjfen
         TBwEpiF/fJrDynSmBYk6V0g1oZ+AmHFoUzjfaczr1+sCrTz7S6kpvBkXzAn8fPZ0BZM3
         0r7XOfPOPA7Clzur0tzZh1PzVc0o7LDmMf+qaMD9Yz9RPsW+WVEUH5vG6gq83iwbdv2y
         fx0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Vdm4H0wq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v203si1547165ybv.150.2020.06.17.21.39.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:39:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Vdm4H0wq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmLG-0001uc-KA
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmAC-0004vH-Dk
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 00:28:32 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:42308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmA7-0002Yt-QS
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 00:28:32 -0400
Received: by mail-pl1-x642.google.com with SMTP id k6so1900891pll.9
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 21:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T9tLcCKTkbNmDxAyHgl5RsUu/R3CyNcD6tukvru2LMk=;
 b=Vdm4H0wqKKiZ4w7S2ofpvB1QEYef8yfg1tZiXMrcTILATiQ6JBunqtaKlzbQfA/LTG
 1bYb1q06UeunxPx6L8Hb1KudfOA0hbEebKsXrFYCJb4Sef7m126/iMZwCmeTRUDo+Pha
 x2vfwK6J/CA0ZR70aCAYtlnYoOwTvsu00PVrFqa/o3ho99gr4xFUM3GEXFxNmEU7Dl03
 LH1trZxNMBOwX51YkzvAA6xadOKjBAQ8+psmEhVJr9drVp+8cLcllhZnRGMug//+sL4A
 waFB0zgCNWhbI35mqbf4J2OjtI0UQkpiKl2wJ3hdkGhDNDuRN0UqeAoVGrQ5ogz2E/Rb
 eELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T9tLcCKTkbNmDxAyHgl5RsUu/R3CyNcD6tukvru2LMk=;
 b=kCpKGkLuiq4cyjWt9MT2xXe7+81ZwDyoBKh8SBIEiUjGSA5ohzUwYmrELTzVwrL8Gr
 CvQIdFOuD7NT6ai+5SgVF/KbCTHRHgWATBhX5Y7mRk9LZkfgnJRbltoyU86kTula9qba
 xL3YhSE09cHcDLlTjYXCo5SPhC7mVGeYwXRZio4NUolWizEJ5b8jxRxxl9uua8P2mSk/
 iVvY9fUub6PHFZqEt8yQaAKCTk+wBP3vln62dJIgV4/2mBIb/trj3d92ekktikvYh77l
 VffQWj7XhJyURg8sukTdwNAh9quWJaFvIzHo8LpLTQN4Wk7vWU+6uLJDh5NToAmo9pYE
 YxqQ==
X-Gm-Message-State: AOAM5319jGj8gkhy0kc11LQ03Ye5NQoL6GBB0EHiUOAkZNuSJZiY5695
 X7m6cuS5Xq33cWB4yKdTMa0h8Ie4nNA=
X-Received: by 2002:a17:90b:1013:: with SMTP id
 gm19mr2333056pjb.231.1592454505303; 
 Wed, 17 Jun 2020 21:28:25 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id l134sm1154412pga.50.2020.06.17.21.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:28:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 028/100] target/arm: Implement PMULLB and PMULLT
Date: Wed, 17 Jun 2020 21:25:32 -0700
Message-Id: <20200618042644.1685561-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eG0BKHIw4rlR

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 10 ++++++++++
 target/arm/helper-sve.h    |  1 +
 target/arm/sve.decode      |  2 ++
 target/arm/translate-sve.c | 22 ++++++++++++++++++++++
 target/arm/vec_helper.c    | 24 ++++++++++++++++++++++++
 5 files changed, 59 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e9f56e67c7..f7574cb757 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3862,6 +3862,16 @@ static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
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
index cb1d4f2443..e7b539df21 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1875,3 +1875,4 @@ DEF_HELPER_FLAGS_4(sve2_umull_zzz_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_umull_zzz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(sve2_pmull_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_pmull_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 32370d7b76..079ba0ec62 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1204,6 +1204,8 @@ USUBWT          01000101 .. 0 ..... 010 111 ..... .....  @rd_rn_rm
 
 SQDMULLB_zzz    01000101 .. 0 ..... 011 000 ..... .....  @rd_rn_rm
 SQDMULLT_zzz    01000101 .. 0 ..... 011 001 ..... .....  @rd_rn_rm
+PMULLB          01000101 .. 0 ..... 011 010 ..... .....  @rd_rn_rm
+PMULLT          01000101 .. 0 ..... 011 011 ..... .....  @rd_rn_rm
 SMULLB_zzz      01000101 .. 0 ..... 011 100 ..... .....  @rd_rn_rm
 SMULLT_zzz      01000101 .. 0 ..... 011 101 ..... .....  @rd_rn_rm
 UMULLB_zzz      01000101 .. 0 ..... 011 110 ..... .....  @rd_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0712a25de7..db2081130d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5596,6 +5596,28 @@ DO_SVE2_ZZZ_TB(SMULLT_zzz, smull_zzz, true, true)
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
index cd58bfb84f..32b1aace3d 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -1378,6 +1378,30 @@ void HELPER(sve2_pmull_h)(void *vd, void *vn, void *vm, uint32_t desc)
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

