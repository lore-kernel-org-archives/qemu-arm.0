Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4022950lfm;
        Mon, 24 May 2021 18:16:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDet/4SIVvXaO0UX/wouHqfOLWSsHlvKJ+fytdi0VCvb++I7HUdGOGIK+TA4/Wtzo9QcJ0
X-Received: by 2002:a9f:2084:: with SMTP id 4mr25099601uaa.139.1621905377693;
        Mon, 24 May 2021 18:16:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621905377; cv=none;
        d=google.com; s=arc-20160816;
        b=Ip6fB2qP6cS9SaGu966E4zfb3HbZAwvw4xQ+BFQ2cSksRk9F7VDkksuI43bx20z/FQ
         rr2Xef/Y7UPCXYwWLAbb2p6owsncLl7ZDu5sCGawj5d6kjv+j5QkdU+3nCqpbhQL5UiE
         TWbsw4xxV6fwATrcseW/ISoEEak8XyhBOSHQwZR/ujSOPHw29NQxo/2wBJSZ+wKu/oOM
         gaf4FUkLRp8wzP6LtVN8qCCfkJKCHCNigWyX3dxDvCFzXWwy6uLQjcT/MVXPzicLXUFL
         uQW/hVOgZGC2D2Cw955YjtP2bir0k/iHu4zk7EFRXnvT1HMbXjp6L1RTO435o2wzNIRK
         1hDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2FEqaGXGRGG/h3UifaZhFAnj1R1ao5X9aq13b4ZOWhE=;
        b=VP4wj99qMUo700M8kSjqANMcLZRvCGWiinW0uMZY9VDJRlx2NEC4Mbh3q2SbBUk01g
         7Qbk/Kl3PoUpk4da3ZMSXqflBg7//CHuMIIl+XrJ7RbxhiBTspnS+WTdC0IQzjfiqcEv
         lTk4pzbloLvv9XZH0iKrJMrWjTVg+Fg9W7czNpSRQkF+bDIb5LnsCx0nOFDH4BExRYJJ
         BUS8SUm7oGF/vwG4ZnpvIYOhtcY9OgSW3SrOxC2kdybrqkzY2G1Sbekmy5qGPsCp1IWc
         QLAtV2WmZA/E73xjQoCXHCWHLFMiSKxCxSg6RAFKPxmeaKxypX7lpZrYUFsDrP5oTZn7
         h/2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sh70RDBY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b21si3514870vsr.59.2021.05.24.18.16.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:16:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sh70RDBY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llLg8-0006lt-Jz
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUX-0001dK-VE
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:19 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:45837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUO-0001i2-Hh
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:17 -0400
Received: by mail-pg1-x52d.google.com with SMTP id q15so21391307pgg.12
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2FEqaGXGRGG/h3UifaZhFAnj1R1ao5X9aq13b4ZOWhE=;
 b=Sh70RDBYxjZcnB+E1Op8OmAgUh8KFzZH01bogekBB1a7yZPs2tOwJ3lQfe4lzYkD4Q
 MvH749Bxx1xkZ5AilJThIBWeKm2zlzffDPXIxBACBugbVndEHxglhCFhmerkD6Sg6BlB
 PxDl0BOdPTiPczkSFk1HfydaB2QPARs97cIp7r6VwUxT22TM8YMAqE5fXbB6Y4ihiHvg
 qznVG0GfMrFJq7a1qWUJDnXsVV51/lFqJGPVy4TrVaImXfGJtRO6pNbnLb0nliX9b+cx
 Y++epXzdvSDATE/G6C8BxIIrLq3UIVF+V73JKfkdKy3JWSj4giGV0DTsQoz5X/YF2Ukh
 uNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2FEqaGXGRGG/h3UifaZhFAnj1R1ao5X9aq13b4ZOWhE=;
 b=Loyoos9TcgdqPVYFGd1xuwuDrMDnSlYx/iBg79tAdBSO89R8uQeaMF/4Vggu07l8/Y
 fVJlS6n8jW0vsRDiweG5Tf+iSyTgEAyx5/3G5ensxaWlvYX83YHuwvZESzAnLeoZYcyY
 XBjpcZ8jQ1juzVBMWmwZva2E1vSfVvRENuUOIemMRwtdVgbVWGv4GSssEKiYLLXfmgiz
 cmuoir01W9vvsY5yI4z41cKIsjaZTuam1yrZFaCBy9fOD/WcJy6IcNIHydY+H/q02O+s
 qcbyJCf4v4M3bqCiu1Sa8EzOb945HO+rvm2/r3zaQw+QveGS4MlEXqYEXYFObYCpMxPq
 braw==
X-Gm-Message-State: AOAM531CofVpx6A7/eig1aqpJAlpT5ap416JKMPCthQYRm6jgdwzYCw9
 /x0uOCmHW3/UalHJ6q+GLD2SQA==
X-Received: by 2002:a63:7204:: with SMTP id n4mr16452938pgc.78.1621904647073; 
 Mon, 24 May 2021 18:04:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 12/92] target/arm: Implement SVE2 integer add/subtract wide
Date: Mon, 24 May 2021 18:02:38 -0700
Message-Id: <20210525010358.152808-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
X-TUID: +dTwYXeY9pay

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix select offsets (laurent desnogues).
---
 target/arm/helper-sve.h    | 16 ++++++++++++++++
 target/arm/sve.decode      | 12 ++++++++++++
 target/arm/sve_helper.c    | 30 ++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 20 ++++++++++++++++++++
 4 files changed, 78 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index a81297b387..3286a9c205 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1391,6 +1391,22 @@ DEF_HELPER_FLAGS_4(sve2_uabdl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_uabdl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_uabdl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_saddw_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_saddw_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_saddw_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_ssubw_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_ssubw_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_ssubw_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_uaddw_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uaddw_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uaddw_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_usubw_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_usubw_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_usubw_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve_ld1bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld2bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld3bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 12be0584a8..f6f21426ef 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1184,3 +1184,15 @@ UABDLT          01000101 .. 0 ..... 00 1111 ..... .....  @rd_rn_rm
 SADDLBT         01000101 .. 0 ..... 1000 00 ..... .....  @rd_rn_rm
 SSUBLBT         01000101 .. 0 ..... 1000 10 ..... .....  @rd_rn_rm
 SSUBLTB         01000101 .. 0 ..... 1000 11 ..... .....  @rd_rn_rm
+
+## SVE2 integer add/subtract wide
+
+SADDWB          01000101 .. 0 ..... 010 000 ..... .....  @rd_rn_rm
+SADDWT          01000101 .. 0 ..... 010 001 ..... .....  @rd_rn_rm
+UADDWB          01000101 .. 0 ..... 010 010 ..... .....  @rd_rn_rm
+UADDWT          01000101 .. 0 ..... 010 011 ..... .....  @rd_rn_rm
+
+SSUBWB          01000101 .. 0 ..... 010 100 ..... .....  @rd_rn_rm
+SSUBWT          01000101 .. 0 ..... 010 101 ..... .....  @rd_rn_rm
+USUBWB          01000101 .. 0 ..... 010 110 ..... .....  @rd_rn_rm
+USUBWT          01000101 .. 0 ..... 010 111 ..... .....  @rd_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index d88fab9865..374e02dbf8 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1165,6 +1165,36 @@ DO_ZZZ_TB(sve2_uabdl_d, uint64_t, uint32_t,     , H1_4, DO_ABD)
 
 #undef DO_ZZZ_TB
 
+#define DO_ZZZ_WTB(NAME, TYPEW, TYPEN, HW, HN, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
+{                                                              \
+    intptr_t i, opr_sz = simd_oprsz(desc);                     \
+    int sel2 = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPEN); \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {              \
+        TYPEW nn = *(TYPEW *)(vn + HW(i));                     \
+        TYPEW mm = *(TYPEN *)(vm + HN(i + sel2));              \
+        *(TYPEW *)(vd + HW(i)) = OP(nn, mm);                   \
+    }                                                          \
+}
+
+DO_ZZZ_WTB(sve2_saddw_h, int16_t, int8_t, H1_2, H1, DO_ADD)
+DO_ZZZ_WTB(sve2_saddw_s, int32_t, int16_t, H1_4, H1_2, DO_ADD)
+DO_ZZZ_WTB(sve2_saddw_d, int64_t, int32_t,     , H1_4, DO_ADD)
+
+DO_ZZZ_WTB(sve2_ssubw_h, int16_t, int8_t, H1_2, H1, DO_SUB)
+DO_ZZZ_WTB(sve2_ssubw_s, int32_t, int16_t, H1_4, H1_2, DO_SUB)
+DO_ZZZ_WTB(sve2_ssubw_d, int64_t, int32_t,     , H1_4, DO_SUB)
+
+DO_ZZZ_WTB(sve2_uaddw_h, uint16_t, uint8_t, H1_2, H1, DO_ADD)
+DO_ZZZ_WTB(sve2_uaddw_s, uint32_t, uint16_t, H1_4, H1_2, DO_ADD)
+DO_ZZZ_WTB(sve2_uaddw_d, uint64_t, uint32_t,     , H1_4, DO_ADD)
+
+DO_ZZZ_WTB(sve2_usubw_h, uint16_t, uint8_t, H1_2, H1, DO_SUB)
+DO_ZZZ_WTB(sve2_usubw_s, uint32_t, uint16_t, H1_4, H1_2, DO_SUB)
+DO_ZZZ_WTB(sve2_usubw_d, uint64_t, uint32_t,     , H1_4, DO_SUB)
+
+#undef DO_ZZZ_WTB
+
 /* Two-operand reduction expander, controlled by a predicate.
  * The difference between TYPERED and TYPERET has to do with
  * sign-extension.  E.g. for SMAX, TYPERED must be signed,
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ae8323adb7..70900c122f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6020,3 +6020,23 @@ DO_SVE2_ZZZ_TB(UABDLT, uabdl, true, true)
 DO_SVE2_ZZZ_TB(SADDLBT, saddl, false, true)
 DO_SVE2_ZZZ_TB(SSUBLBT, ssubl, false, true)
 DO_SVE2_ZZZ_TB(SSUBLTB, ssubl, true, false)
+
+#define DO_SVE2_ZZZ_WTB(NAME, name, SEL2) \
+static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)       \
+{                                                               \
+    static gen_helper_gvec_3 * const fns[4] = {                 \
+        NULL,                       gen_helper_sve2_##name##_h, \
+        gen_helper_sve2_##name##_s, gen_helper_sve2_##name##_d, \
+    };                                                          \
+    return do_sve2_zzw_ool(s, a, fns[a->esz], SEL2);            \
+}
+
+DO_SVE2_ZZZ_WTB(SADDWB, saddw, false)
+DO_SVE2_ZZZ_WTB(SADDWT, saddw, true)
+DO_SVE2_ZZZ_WTB(SSUBWB, ssubw, false)
+DO_SVE2_ZZZ_WTB(SSUBWT, ssubw, true)
+
+DO_SVE2_ZZZ_WTB(UADDWB, uaddw, false)
+DO_SVE2_ZZZ_WTB(UADDWT, uaddw, true)
+DO_SVE2_ZZZ_WTB(USUBWB, usubw, false)
+DO_SVE2_ZZZ_WTB(USUBWT, usubw, true)
-- 
2.25.1

