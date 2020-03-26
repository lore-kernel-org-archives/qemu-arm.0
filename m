Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2510460lfi;
        Thu, 26 Mar 2020 16:18:06 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtX1JeBGebQapsueUm7PAokgQceuQOe1zmNeDj2LKi8EPqf8i7kS88SyV92zWPFn8SM5ANf
X-Received: by 2002:ac8:326d:: with SMTP id y42mr11692097qta.272.1585264685903;
        Thu, 26 Mar 2020 16:18:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585264685; cv=none;
        d=google.com; s=arc-20160816;
        b=R/ZPPm7M4sWOretp/b57pE8nCHE62jIcGJGCxB4cjsBhNkVPx0IBED2ZoQrXQDM3GB
         LVxXSd3M1dhqjQ78Qd+etEJc2nUKrkx4Ji6cNh/iq2QBfDo9QqeKCepJv1qDJAbOzMJf
         ol6J3nIIUamGu1XMvdu7i/Vmcp4ULBC8V5UQW+RzpfQ3cExvZez0j3uetJmVVwKffcFA
         jd4rtYNWjWsw3591qXe/MHMMXZh5HPfOzApmwmFg/IYp6IlQ15oI6meAQY3Vih06Ma5g
         IPyJywhzdff71k4XeQ0agiHJTz0ioluJGdlXNM1ZWP/lGE/SNs+oJHVgQveGWCMS+dA1
         Jitg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mMKWgjpLavmbt56//ygtC6ZwR2NAPw0rAnQXI9rkvA8=;
        b=pZ5Fl8x1886YeuRm4yVDJTjXvOSzwf+G3KNxJyT7VZXJdGQo/gNtPNA6HWIhqZto2Q
         4mhIa1mgk7slQ9mlWSuojvJ/ZTZLyZ1dWQQ0ladx+45oLDWeD/TdZz0Wo5aSg6cC3y98
         3mQ1orBjjgVvWz8aRHoDd5X5ItbBhn8Q/FXUQUJVqmaezhDRiep1e5t2DWFD5loXiZbC
         1t0MRhH6zKy94j5GO10vjc6vjbcEfJggfPGb9NltPbu1IdZOqJXEErIBefnapXTBrJhT
         V+oiktOvlUJTTuXS+tLEV4Fabe4anDEwkYdLgQmEQmmqGMkxkfRO8j1PUou9D4t37g65
         91pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hhI8h5Pi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v2si2618251qki.218.2020.03.26.16.18.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 16:18:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hhI8h5Pi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHblF-0007rp-8E
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 19:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58430)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcR-0002O1-UX
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 19:09:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcQ-0001VK-Fu
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 19:08:59 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:33612)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHbcQ-0001UG-9C
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 19:08:58 -0400
Received: by mail-pl1-x643.google.com with SMTP id g18so2752886plq.0
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 16:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mMKWgjpLavmbt56//ygtC6ZwR2NAPw0rAnQXI9rkvA8=;
 b=hhI8h5PirpzeUyHGeWw5TyAz80KK5mgR5DlmLdJ2ACyl0WdBE2lwA+HxEqrAlstXvQ
 2LTJSsfkSCDt+nDl10GmcP6aJijm8dzs3keJexTrj9J8Ef5kMdW7UAJTD7R0Dw4BOj9G
 YV/B/qxQhh7bRnEdENfUNlRdzMaYHKJ+SE30yGk4dsILc5RQUt1XRsR7i1l5yoYmEEb9
 fPhxknTMAKFCA0WN59UwLJCC0wcblfgSPM39Oc0DI7UnYgw9xKZYhqeoGiun44p+PzxO
 uYzl1afbw/Z3tvQjbT2Z8BpXl/n3GWZUViXp0BqN/gJKfFDyEJMHxSh/s9602LKOZaWc
 49UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mMKWgjpLavmbt56//ygtC6ZwR2NAPw0rAnQXI9rkvA8=;
 b=rynQJnmg3ol28yMEWnrHz31bwu4GK5iZwL1vEBNw7RuaASCDZLQMlhWt1o1YpH3dxT
 TGgYvvm/ciKcxamJzJCLQCuLgmFCxeorYHfpYjGUmowP2Kn6AKQGmdEK/mD1+RFE/+Gy
 UWoFvKwtf2f30WWkyUS136yoRmJTvdg+M+tua/2colwa4gyHqPpsFehh6kCAXQhSDiD/
 LVJtkQVWiv2u15HBLu9hMKL7cFRNQ0oq3SD6DCpAX4Gb4dajOaCHUEBHfDZK3V0X2DQM
 rOCMoI/ylsNS94L474gdoa5bnWKmDjXMOh9hLaWD5SYZ0n/bRORq1of3wigUSd35NFfC
 LuPA==
X-Gm-Message-State: ANhLgQ0EFle4NjvudgJEyFl3O/3tQ3DUewSPX8KTn5az12b+kA1NF0q4
 f8Szgu3UufpmAbsi7OyiaiYdkkInX+k=
X-Received: by 2002:a17:902:a517:: with SMTP id
 s23mr10766321plq.125.1585264136950; 
 Thu, 26 Mar 2020 16:08:56 -0700 (PDT)
Received: from localhost.localdomain (174-21-138-234.tukw.qwest.net.
 [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id i187sm2530037pfg.33.2020.03.26.16.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 16:08:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/31] target/arm: Implement SVE2 integer add/subtract wide
Date: Thu, 26 Mar 2020 16:08:20 -0700
Message-Id: <20200326230838.31112-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326230838.31112-1-richard.henderson@linaro.org>
References: <20200326230838.31112-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
Cc: rajav@quicinc.com, qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iFEgz4lwS2VN

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 16 ++++++++++++++++
 target/arm/sve.decode      | 12 ++++++++++++
 target/arm/sve_helper.c    | 30 ++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 20 ++++++++++++++++++++
 4 files changed, 78 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 475fce7f3a..6a95c6085c 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1396,6 +1396,22 @@ DEF_HELPER_FLAGS_4(sve2_uabdl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
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
 DEF_HELPER_FLAGS_4(sve_ldr, TCG_CALL_NO_WG, void, env, ptr, tl, int)
 DEF_HELPER_FLAGS_4(sve_str, TCG_CALL_NO_WG, void, env, ptr, tl, int)
 
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 8d5f31bcc4..9994e1eb71 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1187,3 +1187,15 @@ UABDLT          01000101 .. 0 ..... 00 1111 ..... .....  @rd_rn_rm
 SADDLBT         01000101 .. 0 ..... 1000 00 ..... .....  @rd_rn_rm
 SSUBLBT         01000101 .. 0 ..... 1000 10 ..... .....  @rd_rn_rm
 SSUBLBT         01000101 .. 0 ..... 1000 11 ..... .....  @rd_rm_rn # SSUBLTB
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
index 7d7a59f620..44503626e4 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1131,6 +1131,36 @@ DO_ZZZ_TB(sve2_uabdl_d, uint64_t, uint32_t, DO_ABD)
 
 #undef DO_ZZZ_TB
 
+#define DO_ZZZ_WTB(NAME, TYPE, TYPEN, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
+{                                                              \
+    intptr_t i, opr_sz = simd_oprsz(desc);                     \
+    int sel2 = (simd_data(desc) & 1) * sizeof(TYPE);           \
+    for (i = 0; i < opr_sz; i += sizeof(TYPE)) {               \
+        TYPE nn = *(TYPE *)(vn + i);                           \
+        TYPE mm = (TYPEN)(*(TYPE *)(vm + i) >> sel2);          \
+        *(TYPE *)(vd + i) = OP(nn, mm);                        \
+    }                                                          \
+}
+
+DO_ZZZ_WTB(sve2_saddw_h, int16_t, int8_t, DO_ADD)
+DO_ZZZ_WTB(sve2_saddw_s, int32_t, int16_t, DO_ADD)
+DO_ZZZ_WTB(sve2_saddw_d, int64_t, int32_t, DO_ADD)
+
+DO_ZZZ_WTB(sve2_ssubw_h, int16_t, int8_t, DO_SUB)
+DO_ZZZ_WTB(sve2_ssubw_s, int32_t, int16_t, DO_SUB)
+DO_ZZZ_WTB(sve2_ssubw_d, int64_t, int32_t, DO_SUB)
+
+DO_ZZZ_WTB(sve2_uaddw_h, uint16_t, uint8_t, DO_ADD)
+DO_ZZZ_WTB(sve2_uaddw_s, uint32_t, uint16_t, DO_ADD)
+DO_ZZZ_WTB(sve2_uaddw_d, uint64_t, uint32_t, DO_ADD)
+
+DO_ZZZ_WTB(sve2_usubw_h, uint16_t, uint8_t, DO_SUB)
+DO_ZZZ_WTB(sve2_usubw_s, uint32_t, uint16_t, DO_SUB)
+DO_ZZZ_WTB(sve2_usubw_d, uint64_t, uint32_t, DO_SUB)
+
+#undef DO_ZZZ_WTB
+
 /* Two-operand reduction expander, controlled by a predicate.
  * The difference between TYPERED and TYPERET has to do with
  * sign-extension.  E.g. for SMAX, TYPERED must be signed,
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index accb74537b..fb214360bf 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6054,3 +6054,23 @@ DO_SVE2_ZZZ_TB(UABDLT, uabdl, true, true)
 
 DO_SVE2_ZZZ_TB(SADDLBT, saddl, false, true)
 DO_SVE2_ZZZ_TB(SSUBLBT, ssubl, false, true)
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
2.20.1

