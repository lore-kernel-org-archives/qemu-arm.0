Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp476222lfg;
        Fri, 30 Apr 2021 13:40:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTa1S2TwmoyfMZmMGrha4n88bbj2S0/4tmkYRx3F9sGLbW4xesYdv0gt2L0h+AjBWjics8
X-Received: by 2002:a5e:930d:: with SMTP id k13mr5304874iom.61.1619815217436;
        Fri, 30 Apr 2021 13:40:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619815217; cv=none;
        d=google.com; s=arc-20160816;
        b=aC9bZ+CLInCOmaGHJaO0kXmzy5vu0mL4uTFUhP4TDqjz4oGZlLoCw14jrNQuEqIzpU
         2WKWxuN/nAkFZV5lNnNSdLFWlaRLP4hlo/R7jGGrEEnt2RLI5nIrrEgJcGE6+SvH8IKm
         TASqGNV9yDDAt1pjoRDkeVXuR6aecEn7Nh4Cl009kzV+c4wY/trAnA2yQ34Q5gSN5zbB
         3HbUsEADr9QapC/uW2n7l5mHZKtH2dhk/yRcOwt8wOi6EjPpssBtMuMWJ1+OaaWEjFsB
         fKQIBDkulFT5laZur3XuDoNlTbzQ5xDM5qRhiOMoyvhVD51MwJ9/xH/nl87vlSrZzGGj
         rU9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BNoITf8uwrxbb0GnHYmFR2vb1nVzSKvKz1i47CoRknE=;
        b=hCz962eZ5dT9gWDSdChu6fvjM6Fq1pErqgW80NRTO4alz3Y42LUl0uRGPGi93UPCNi
         8G9xRjsKwL+wtACaSgfFKg2y8QvU2qxLESGPcMQyGmH+gjIo7FNXXrORQtVWdGcU2TuO
         3ALYvOnAd8gk/BtgBRYBmZbNwb3DoaFqVisGc/eEEM+EinDUB3TULDfm218xHnysIDw+
         qN97bphnm05UgQ34fucsNZCh1WTqTK8GmBCsvUCQxiR6c9FMveI8i0W3MjnP65SBNlje
         +M4YGmlw1jYKkl7ZAfl88Ppb2KpM/zHuLaj08nKDlJLEu6gDz3CrnEeS4EZ9/mJ3EWyp
         vfwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ctmbQ+sS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5si3143254ilk.19.2021.04.30.13.40.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 13:40:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ctmbQ+sS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcZvs-0007Jz-Nd
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 16:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZid-0008V4-Vu
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:36 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:33598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiQ-000646-SD
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:35 -0400
Received: by mail-pg1-x52b.google.com with SMTP id t22so14924806pgu.0
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BNoITf8uwrxbb0GnHYmFR2vb1nVzSKvKz1i47CoRknE=;
 b=ctmbQ+sSkl910W6FVbVWBDeyucXx6d3Giv+Tvmdsx61I5gbVX6vBXeCFUX0X4EJCDo
 zVYlv2/lWpG74YIW1km02mQjgGtGaikwDGIBqT7/Pp0iGNuycL/r2+ngiOl8ofdtDBFz
 6CDglC6ugYWlXgDPqDRKNRpek0ZBM+pK8YjzLIGeXsgsSE7XxU1/8cDJtDBcEhiN/t6o
 CdDfr2EJKXJk6ShSabyzY6dDVavIlC6uSDjQFGFuUdDryG0RTj/cWI6pLwbUtaGcnGY0
 6HvNiY7oMqDvQOTw0mZEjL6kEHPD0aPgvT2apBZ/ZIn3uWBJEL2/Kmb8I2IpUexbg14N
 XOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BNoITf8uwrxbb0GnHYmFR2vb1nVzSKvKz1i47CoRknE=;
 b=QHbScLzMA8ma6CF5soq1XyeEAvg5h0+2v9hUSy9h/oI9EfeQ3ynOiBP4Qp4y7sZXRR
 L76M58vvu+5mlMXGpMKGlMEVGpZnb4yCi/uAk7Zuk7u4qlYXer8ZV9D1Z9UAotH1SL5o
 5761Uhn0JEId5MiGYLjv34249Nkp4UmpgNXPcHdEB8dxJ6qc/neGopoh5rvc600z7zBW
 fVkZrPAPU0eVMNhTUzRbXFi76amzpMbbDKrjo+0wruEiLZbOEgDjW/LrDTJ3AmQEbYX2
 Brj+FdIMd9D89/03mhO+jG3isjhtuq6yMMnyY89gBX55I5dMNuQRM/x0ic29jChy0r7Q
 kQpA==
X-Gm-Message-State: AOAM533uBcQ/95DURju3UfqVdrDPLKZQvb/IgPpg8+tijp8LYYMTNbS/
 SrdpnREPNT5CP4GNPYWnmxImsXMMpH/uCQ==
X-Received: by 2002:a62:2a14:0:b029:263:20c5:6d8c with SMTP id
 q20-20020a622a140000b029026320c56d8cmr6569177pfq.23.1619814381375; 
 Fri, 30 Apr 2021 13:26:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 17/82] target/arm: Implement SVE2 bitwise permute
Date: Fri, 30 Apr 2021 13:25:05 -0700
Message-Id: <20210430202610.1136687-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
X-TUID: DOyaXQrTCnFi

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++
 target/arm/helper-sve.h    | 15 ++++++++
 target/arm/sve.decode      |  6 ++++
 target/arm/sve_helper.c    | 73 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 36 +++++++++++++++++++
 5 files changed, 135 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 902579d24b..ae787fac8a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4241,6 +4241,11 @@ static inline bool isar_feature_aa64_sve2_pmull128(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, AES) >= 2;
 }
 
+static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BITPERM) != 0;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index f65818da05..4861481fe0 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2377,3 +2377,18 @@ DEF_HELPER_FLAGS_4(sve2_eoril_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_eoril_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_eoril_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_eoril_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_bext_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_bext_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_bext_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_bext_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_bdep_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_bdep_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_bdep_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_bdep_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_bgrp_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_bgrp_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_bgrp_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_bgrp_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 0922a44829..7cb89a0d47 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1220,3 +1220,9 @@ USHLLT          01000101 .. 0 ..... 1010 11 ..... .....  @rd_rn_tszimm_shl
 
 EORBT           01000101 .. 0 ..... 10010 0 ..... .....  @rd_rn_rm
 EORTB           01000101 .. 0 ..... 10010 1 ..... .....  @rd_rn_rm
+
+## SVE2 bitwise permute
+
+BEXT            01000101 .. 0 ..... 1011 00 ..... .....  @rd_rn_rm
+BDEP            01000101 .. 0 ..... 1011 01 ..... .....  @rd_rn_rm
+BGRP            01000101 .. 0 ..... 1011 10 ..... .....  @rd_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 1de0a9bdc3..d692d2fe3d 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1241,6 +1241,79 @@ DO_ZZZ_NTB(sve2_eoril_d, uint64_t,     , DO_EOR)
 
 #undef DO_ZZZ_NTB
 
+#define DO_BITPERM(NAME, TYPE, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
+{                                                              \
+    intptr_t i, opr_sz = simd_oprsz(desc);                     \
+    for (i = 0; i < opr_sz; i += sizeof(TYPE)) {               \
+        TYPE nn = *(TYPE *)(vn + i);                           \
+        TYPE mm = *(TYPE *)(vm + i);                           \
+        *(TYPE *)(vd + i) = OP(nn, mm, sizeof(TYPE) * 8);      \
+    }                                                          \
+}
+
+static uint64_t bitextract(uint64_t data, uint64_t mask, int n)
+{
+    uint64_t res = 0;
+    int db, rb = 0;
+
+    for (db = 0; db < n; ++db) {
+        if ((mask >> db) & 1) {
+            res |= ((data >> db) & 1) << rb;
+            ++rb;
+        }
+    }
+    return res;
+}
+
+DO_BITPERM(sve2_bext_b, uint8_t, bitextract)
+DO_BITPERM(sve2_bext_h, uint16_t, bitextract)
+DO_BITPERM(sve2_bext_s, uint32_t, bitextract)
+DO_BITPERM(sve2_bext_d, uint64_t, bitextract)
+
+static uint64_t bitdeposit(uint64_t data, uint64_t mask, int n)
+{
+    uint64_t res = 0;
+    int rb, db = 0;
+
+    for (rb = 0; rb < n; ++rb) {
+        if ((mask >> rb) & 1) {
+            res |= ((data >> db) & 1) << rb;
+            ++db;
+        }
+    }
+    return res;
+}
+
+DO_BITPERM(sve2_bdep_b, uint8_t, bitdeposit)
+DO_BITPERM(sve2_bdep_h, uint16_t, bitdeposit)
+DO_BITPERM(sve2_bdep_s, uint32_t, bitdeposit)
+DO_BITPERM(sve2_bdep_d, uint64_t, bitdeposit)
+
+static uint64_t bitgroup(uint64_t data, uint64_t mask, int n)
+{
+    uint64_t resm = 0, resu = 0;
+    int db, rbm = 0, rbu = 0;
+
+    for (db = 0; db < n; ++db) {
+        uint64_t val = (data >> db) & 1;
+        if ((mask >> db) & 1) {
+            resm |= val << rbm++;
+        } else {
+            resu |= val << rbu++;
+        }
+    }
+
+    return resm | (resu << rbm);
+}
+
+DO_BITPERM(sve2_bgrp_b, uint8_t, bitgroup)
+DO_BITPERM(sve2_bgrp_h, uint16_t, bitgroup)
+DO_BITPERM(sve2_bgrp_s, uint32_t, bitgroup)
+DO_BITPERM(sve2_bgrp_d, uint64_t, bitgroup)
+
+#undef DO_BITPERM
+
 #define DO_ZZI_SHLL(NAME, TYPEW, TYPEN, HW, HN) \
 void HELPER(NAME)(void *vd, void *vn, uint32_t desc)           \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 509b3bc68c..da2f67fb67 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6249,3 +6249,39 @@ static bool trans_USHLLT(DisasContext *s, arg_rri_esz *a)
 {
     return do_sve2_shll_tb(s, a, true, true);
 }
+
+static bool trans_BEXT(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_bext_b, gen_helper_sve2_bext_h,
+        gen_helper_sve2_bext_s, gen_helper_sve2_bext_d,
+    };
+    if (!dc_isar_feature(aa64_sve2_bitperm, s)) {
+        return false;
+    }
+    return do_sve2_zzw_ool(s, a, fns[a->esz], 0);
+}
+
+static bool trans_BDEP(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_bdep_b, gen_helper_sve2_bdep_h,
+        gen_helper_sve2_bdep_s, gen_helper_sve2_bdep_d,
+    };
+    if (!dc_isar_feature(aa64_sve2_bitperm, s)) {
+        return false;
+    }
+    return do_sve2_zzw_ool(s, a, fns[a->esz], 0);
+}
+
+static bool trans_BGRP(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_bgrp_b, gen_helper_sve2_bgrp_h,
+        gen_helper_sve2_bgrp_s, gen_helper_sve2_bgrp_d,
+    };
+    if (!dc_isar_feature(aa64_sve2_bitperm, s)) {
+        return false;
+    }
+    return do_sve2_zzw_ool(s, a, fns[a->esz], 0);
+}
-- 
2.25.1

