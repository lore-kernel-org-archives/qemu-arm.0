Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2517685lfi;
        Thu, 26 Mar 2020 16:26:38 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvfHcRYyBpB92xYZ2QJyGp2NdHh8CME5PhEaoaOgAOdfCGX6pDjW2jmy/AspwpJ8DNBI9v6
X-Received: by 2002:a37:a0d6:: with SMTP id j205mr11450188qke.455.1585265198723;
        Thu, 26 Mar 2020 16:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585265198; cv=none;
        d=google.com; s=arc-20160816;
        b=DflEL/dDXGW5FiT4t/YEqzvaVV6R2npi+NixkgzRL208Ns/f0AY3ikuZFMBG2VKQX4
         fOXV6XNgX1cm3p1Hwov+LY4VzDwIZRlUSyrV2QblAtGEi7B0xo27wbWZxJNc76OVpO7U
         97dPfAul/gVSjCdwZGqcI1aQE3feNrynPA5XMzihKQ7yXFcukghOBC4rHjtfEFyMieR8
         Zy3n/7sEZPkkZwOSbWddmq0r5zw0fCFbLyrlW6njJoQkWSUP5p9bxO+JLK226j0Kpx7+
         gjNSB6XUwcorvI3ODYied1gK6h7D8RrCXyLGg8VgwpS4Gn05aQP8fJI+5+l8VoJ+JTTT
         C7kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wrW/Tw+fzY4lh5Sk9yEJSGX1ZVgOSoYBH6s+EdHCLNI=;
        b=ygZk5PbD4D2jFRbANs7wMLO4ml5L0Z31456lQxGxGfcrTd+OaAECkJ4xR/LfGMcdRF
         gJILNykCl/eSqOeuChr13f0iEZGV7A0DHpx3ARK9XnSodTxy/kdmlMiqHY76JQJLwRXP
         CA9jo29s56ACmdKQK7qOIBOF5wfUoTn433/uaWHpWNRR4pORTsjesV0oczOYRrNFNSMT
         GD3iSx0al6NfaupH3+kWmQheNR1ub8xs/7SMJrTqsT8/11ZIR6jPnASQM5RwwQ4Z6jFQ
         InuijtV3t8nQ3rYSz9s4vweG9Z/nk0ePgOA9X2LMn/kNNc2OQWHxYuohehy1dY8WZYr2
         RBCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BrEbMv9x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 84si2529633qko.183.2020.03.26.16.26.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 16:26:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BrEbMv9x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHbtW-0004qU-5i
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 19:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58782)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcX-0002en-VT
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:09:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcW-0001fp-Hd
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:09:05 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:34053)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHbcW-0001em-AV
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:09:04 -0400
Received: by mail-pf1-x430.google.com with SMTP id 23so3567317pfj.1
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 16:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wrW/Tw+fzY4lh5Sk9yEJSGX1ZVgOSoYBH6s+EdHCLNI=;
 b=BrEbMv9x6I4UYjjt578PfVTp5NTnY4KulJP7eMueszsSXLHs4JDW+q4ZAyAKMqjTvF
 puiyrdvzPlBAiwdmNIIW1JgZLQmwqpf1HQKpYe4XIxCo3h9yH+fI7WwaV+24LQbbvXKC
 Cf5caroStFOxthkkauY/DLdJ8IMtUoSB5P6dBHYvMcLzDBtEiNN2lmQLmLRgNHnZDPF4
 pUrvZXk3D9HSnOqtg2j8GE6Tay3hCT9rwg++eGWXhJvY+mPa8diiJOPxO7ndFZY8E4HX
 FOT4oD8TMq52Ue57ktHpOuzDAYRTLU1prnFWQ80j78ucP0Sz1Anr6S18LF5vQSXNtL/2
 Qgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wrW/Tw+fzY4lh5Sk9yEJSGX1ZVgOSoYBH6s+EdHCLNI=;
 b=s6pC1hm7BBs9H85CRyTQLmZh1xwzIjKkalYUQV403BU9QkbFAnaeDHPHQp4eQYZu8K
 l/9+mWkYcydT0fS1pHbyPLrY+N01kRY+3d2/2hDD6Sx9qVlY9SgDnGh/m16/Fkwqrf2R
 sBvIZ3cf5dsJFKcI7LCzQDl5aXsJ2cCVJi3WyAKp6ns5WfE2388iY8AWHUuuddcbP+R+
 eNIKZ0WGN0rsI2FxXWO2/fBEq93ZjU99Lx5P7o3cOegnbQoZyViV5axi0PuSxHnR113h
 3Md9x+jyrWAlDSUk36VXRw1YhLQt4OnbVgcxG+rSL1vwLf9ROz+xdCP2vmJHR03q+8Xv
 lYYg==
X-Gm-Message-State: ANhLgQ2Sb3cOk7xWhyvJMW6wWdwiQHbwn1eVqskYJRk6/GiLXql4Wv3X
 MR/DfmK+sP1BP4vaf/zvxGZQLA==
X-Received: by 2002:a62:3305:: with SMTP id z5mr11968336pfz.297.1585264143340; 
 Thu, 26 Mar 2020 16:09:03 -0700 (PDT)
Received: from localhost.localdomain (174-21-138-234.tukw.qwest.net.
 [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id i187sm2530037pfg.33.2020.03.26.16.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 16:09:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/31] target/arm: Implement SVE2 bitwise exclusive-or
 interleaved
Date: Thu, 26 Mar 2020 16:08:25 -0700
Message-Id: <20200326230838.31112-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326230838.31112-1-richard.henderson@linaro.org>
References: <20200326230838.31112-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::430
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
Cc: rajav@quicinc.com, qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0pInS/CtcGIG

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      |  5 +++++
 target/arm/sve_helper.c    | 20 ++++++++++++++++++++
 target/arm/translate-sve.c | 19 +++++++++++++++++++
 4 files changed, 49 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 9c0c41ba80..9e894a2b55 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2380,3 +2380,8 @@ DEF_HELPER_FLAGS_3(sve2_sshll_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_ushll_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_ushll_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_ushll_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_eoril_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_eoril_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_eoril_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_eoril_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 36ef9de563..8af35e48a5 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1215,3 +1215,8 @@ SSHLLB          01000101 .. 0 ..... 1010 00 ..... .....  @rd_rn_tszimm_shl
 SSHLLT          01000101 .. 0 ..... 1010 01 ..... .....  @rd_rn_tszimm_shl
 USHLLB          01000101 .. 0 ..... 1010 10 ..... .....  @rd_rn_tszimm_shl
 USHLLT          01000101 .. 0 ..... 1010 11 ..... .....  @rd_rn_tszimm_shl
+
+## SVE2 bitwise exclusive-or interleaved
+
+EORBT           01000101 .. 0 ..... 10010 0 ..... .....  @rd_rn_rm
+EORTB           01000101 .. 0 ..... 10010 1 ..... .....  @rd_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index e0a701c446..15ea1fd524 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1196,6 +1196,26 @@ DO_ZZZ_WTB(sve2_usubw_d, uint64_t, uint32_t, DO_SUB)
 
 #undef DO_ZZZ_WTB
 
+#define DO_ZZZ_NTB(NAME, TYPE, H, OP)                                   \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)          \
+{                                                                       \
+    intptr_t i, opr_sz = simd_oprsz(desc);                              \
+    intptr_t sel1 = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPE); \
+    intptr_t sel2 = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(TYPE); \
+    for (i = 0; i < opr_sz; i += 2 * sizeof(TYPE)) {                    \
+        TYPE nn = *(TYPE *)(vn + H(i + sel1));                          \
+        TYPE mm = *(TYPE *)(vm + H(i + sel2));                          \
+        *(TYPE *)(vd + H(i + sel1)) = OP(nn, mm);                       \
+    }                                                                   \
+}
+
+DO_ZZZ_NTB(sve2_eoril_b, uint8_t, H1, DO_EOR)
+DO_ZZZ_NTB(sve2_eoril_h, uint16_t, H1_2, DO_EOR)
+DO_ZZZ_NTB(sve2_eoril_s, uint32_t, H1_4, DO_EOR)
+DO_ZZZ_NTB(sve2_eoril_d, uint64_t,     , DO_EOR)
+
+#undef DO_ZZZ_NTB
+
 #define DO_ZZI_SHLL(NAME, TYPE, TYPEN, OP) \
 void HELPER(NAME)(void *vd, void *vn, uint32_t desc)           \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 9873b83feb..3eaf9cbe51 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6064,6 +6064,25 @@ DO_SVE2_ZZZ_TB(SMULLT_zzz, smull_zzz, true, true)
 DO_SVE2_ZZZ_TB(UMULLB_zzz, umull_zzz, false, false)
 DO_SVE2_ZZZ_TB(UMULLT_zzz, umull_zzz, true, true)
 
+static bool do_eor_tb(DisasContext *s, arg_rrr_esz *a, bool sel1)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_eoril_b, gen_helper_sve2_eoril_h,
+        gen_helper_sve2_eoril_s, gen_helper_sve2_eoril_d,
+    };
+    return do_sve2_zzw_ool(s, a, fns[a->esz], (!sel1 << 1) | sel1);
+}
+
+static bool trans_EORBT(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_eor_tb(s, a, false);
+}
+
+static bool trans_EORTB(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_eor_tb(s, a, true);
+}
+
 static bool do_trans_pmull(DisasContext *s, arg_rrr_esz *a, bool sel)
 {
     static gen_helper_gvec_3 * const fns[4] = {
-- 
2.20.1

