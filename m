Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4024532lfm;
        Mon, 24 May 2021 18:19:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAnvpR1yjB3hecw1rkIoIceKpLTXHvuRO68qChWQVFVUJdRWmgxa3PTrhxaFvOxthyoudE
X-Received: by 2002:a92:ad07:: with SMTP id w7mr16473271ilh.98.1621905559280;
        Mon, 24 May 2021 18:19:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621905559; cv=none;
        d=google.com; s=arc-20160816;
        b=T0lko6E59P8IycUpIgOYenumKeSD8FXqhQCvL+9BGe92+YiNBH7Mw1rFUYb4rf6rcG
         eX3tlDe70d4UBCaDhGIIgirqIL938nIChlcNDCoNV7u8u4ozWaE2jhH+/zM8XEqDeu66
         cu7CWXwR9P8BY5Sp1pW5esiwQOZAZ2c6i52Ql0Sa4yfjl7KmYA4qoU3HoJDXs7Z+eIdV
         m5Hlw5GT47x3utQoGOR5Wv3TfzXjLjNLbhOLY2psmwnYPgh5D2i9OALY6ewioPO5NCcY
         NN506UVxuSwGio7ankKkjgjoiv3jrGLjfmDKMMt5udyTZTGFRF+4u+1U3awlxcXUtDV8
         3hAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YllsSn3S6mr37hNRRlPTvuttEfJ5beXx1HU7uDK21Ag=;
        b=pTsdr5x2OqpW5vzMXecPFSQFRuZan0rXgofhNbifvySeY/NX/tpzbxjTA08Gjn14/y
         vq1k1zop6y9mR6g9Wc6gHKTDnaq8pE6MOzCrWaYcBtzuiOno5KNMBt1/Yv1PVwz0X7Sq
         g9GHSIpSA0HIw9yOKPePfepIIiiNaPcG0cdOMGn+yS3cbtSiF736FEOCNmo95EzJtChY
         Rsgy7vwu3Q0NFWjBYORNc9dpxKrMBz7g6OVL8f+aD/brYYez051tXr0wAhRGD40rdN/4
         P4MRSTprS7d9ukg1hENni8bygk9EM+uzNgdFCjrFh7lbsPmSZgMNdIWhmURV5Vwo8Q6g
         W5og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rp+hciFR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10si2610074jaf.62.2021.05.24.18.19.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:19:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rp+hciFR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llLj4-0001qQ-IF
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUj-0001ny-Qa
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:31 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:39532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUR-0001kO-Fv
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:29 -0400
Received: by mail-pf1-x431.google.com with SMTP id c17so22279487pfn.6
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YllsSn3S6mr37hNRRlPTvuttEfJ5beXx1HU7uDK21Ag=;
 b=Rp+hciFRaKWsSpihlN7vSuYBp+e2uaKMx9Wb4/5fi/4StlwzMOiFDrpol72FK/6BiJ
 E+5htJonrf8/S14vVnKcNj6lSD27CiNjY5g2bYi1kh6QHRjy+ZbJEHbpwVo7LuCAW0T3
 VS7Dx8lBjhUBDam5G5SADAxIKfzsJHGEotRV4cx2yst8CAwIu8e5HpmrfS8FsQ9uG/2C
 xk2OYzRVEqOxgQCdvI2zBpQZGGQlaqLfdYipY+qfyyU9apUOHZkWqA05bZ2zixnqN15V
 zZRfDA6pJ4KRoSI4/hsDCLSc90QHZmRCj66y9EXgIle8HAxQBGi14NAdtYFt2GbJ+PPs
 bAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YllsSn3S6mr37hNRRlPTvuttEfJ5beXx1HU7uDK21Ag=;
 b=dkUqf4j5mnW8he2BGkSl+KwNDIA5HZtJcgHQKSYWJZNn90hI2EiVgWEZzRmz5wx3Kt
 0PzgeXqurP24JG5ZEYbz1kHzUVN8M8cfWuWY56RkEhh2ubauDUaw0umkkkaWkJpWuTHk
 s0TssiwvWo7ic3OvaaA41EJ/nlYtK3L+pott0ZgBHpo0gUWet/2aRmrFWUraO3mqkWjf
 bBuFZp8nVK0q8LHNggSz7/FZqIa7yL79lcqtBV+FdRI9PFVWvOb03+xyXQh3oYqAjW8x
 JAmG/DcBTk4//CMSwfQ7FUasEdOhMlNWvhL+RqVIF/jP3tLRTviqbnpn7ETkofm5ACrT
 /6tQ==
X-Gm-Message-State: AOAM530NS6pLLNjIO+559tboWGffUCPq/OClmITVamCTqxsvcJ2zEd9e
 BgOevaxitRFzziT+gL709BUKTVrryw0F2w==
X-Received: by 2002:a63:585:: with SMTP id 127mr16172839pgf.322.1621904650039; 
 Mon, 24 May 2021 18:04:10 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 17/92] target/arm: Implement SVE2 bitwise permute
Date: Mon, 24 May 2021 18:02:43 -0700
Message-Id: <20210525010358.152808-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jV9NxNmJRRAs

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index 1af6dfde8e..3cb256e4a5 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1246,6 +1246,79 @@ DO_ZZZ_NTB(sve2_eoril_d, uint64_t,     , DO_EOR)
 
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
index d2c1fafc5f..3ea42758fc 100644
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

