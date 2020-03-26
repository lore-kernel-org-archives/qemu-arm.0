Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2511007lfi;
        Thu, 26 Mar 2020 16:18:49 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvMhU3pK1+8doDSf9cYbi0Ivrn3BvKk8l9lSBTbjKqGPiKAeyFfzabpf1Sulayge6ZEc3YG
X-Received: by 2002:ac8:16b8:: with SMTP id r53mr11563095qtj.7.1585264729094;
        Thu, 26 Mar 2020 16:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585264729; cv=none;
        d=google.com; s=arc-20160816;
        b=bkcnNa3GkroFt7+eUpp/mMdYIoxZzzfKV5HPcYIBg+AzEnZMHraLiCI08uQC4urVrJ
         JgngS2MEjuzS67lyr84JN+4ZTWZFXeVBnFUsTHTrJLK5votgTKlavBRebvKCO9CnOPdw
         +4jeNWwN/Y0QQWdc0uXtoNJod9pozvWZRF5b5fxQqL6zigXIYYmMN40c4ca3K+aaZHbm
         +VJ90GhQsZfQNfjaCL01vmaDtloFbBT+YM+aPTYWF6Qu3d3Q3AsciYTsUQVarv6hi2Fh
         lDXUIio9R/GlCiGjbp7QjotEy8PsXwHJL35tGfatqGH/uEXOyDPenbYWxx7drXVK3jmq
         u6DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=j4qfax2U5xHz9yKRRnJ0t4mZCcpGgQcdv9vkX7WKX8I=;
        b=bx2r6poQ3yUB7hVS0TMtZiJ9xfxwcVFr/qsWp4xowB7ZuOiNwTVuUyJEvmSTLpXAK9
         GqIPWDXgnErzV+WYVfSKJ0w7cGe4FD0lKIZq13xMISd2L0V5sEaf23mPprXU7zela55j
         mN+AsbZkvFNRWsEVXIWOFvLH2nMb44zBmBuGBuWdL/2SJ3FasQIQP+mdvW6skBERZwY4
         WI6fgdFjYbzRi6tKRstJc1UtRjJm9DjXBnhWpHw1Zj1c00rYiDIb1DMwaqswKNHtrlf1
         XqMACLlQpu7DPNhgTs46NYchD2h9H9CDgNuyxB9UIQBIGLPnQC8JnMr1g6n6UGWJJOwk
         5mWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SaqlsuX5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id di10si2259903qvb.152.2020.03.26.16.18.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 16:18:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SaqlsuX5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHblw-0001Ga-D9
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 19:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58472)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcS-0002Pn-LP
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:09:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcR-0001Wl-Cc
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:09:00 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:40041)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHbcR-0001Vm-5W
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:08:59 -0400
Received: by mail-pj1-x1041.google.com with SMTP id kx8so3020354pjb.5
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 16:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j4qfax2U5xHz9yKRRnJ0t4mZCcpGgQcdv9vkX7WKX8I=;
 b=SaqlsuX5Nr9AGr9lWM0Bg3tTu5mQu0H/31bW/Ih5/q/4+oWIN93BxUBpAJ0DQHdTiT
 TG/DhHGc0PDhvQcZUzv2xGay40RDtb9dtbcIcdUd0WIEppJqYh+LAPW7fMZ+Ass/3lQ1
 uu4Ua4cK+Wpsa8RPUDovOMNqP4EXmj8+mf1DpskvrIfQTpYU2IynMH4Ylr6xlTRiFYdm
 C8aXto4AhQgDlUVriiUvp5HSr0AzhFL2YvQIA7sUdRUSKMg/K068e/ghBBQoj9rnpaZz
 T3yR12eCQzDZBazdejtfDe65SS/dS5dnhlvt9l2mgz1cD9dMs5sXw3RG5KSGuyu/DUUB
 yTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j4qfax2U5xHz9yKRRnJ0t4mZCcpGgQcdv9vkX7WKX8I=;
 b=JeBCopYTVBZOQ4K5hnla4SWANoGDEqW7GaRO7lpy1iTwY9zTZklSe88kMF3mq/1WXH
 41C0Hyl98z2nyYmM1c8bQFwLzTd8VCiJ9eF4FK2ZhZiw48kl189/8vtl0+xATW3YK6kA
 pPZ8F2Zg52H1DnyjJOdozyMp36XwaW+2bJ+e038MGUN16IqfQFTPkCbhwTYk3DlhKtSs
 bZlTt+LTp5MeN6gjtQaKVUJmUJypM8yCGe3iS2TNglZ6WjQEZ4BgJFsGNzbDSYXON+A9
 Vzl/upGYzw861d7YQuknuVZjKWLR9IEpLbCuOArnEidoqUsSatdnfV8QfLVEpOUr1fbl
 OrSA==
X-Gm-Message-State: ANhLgQ1IUKrFc2lkt7lnj5wFxsJ29Pr+FlBVYkfnKStXsQGaDBChr608
 svZVyxyEH7VVdvzWuKC9iISRO5XAnyE=
X-Received: by 2002:a17:902:a9cc:: with SMTP id
 b12mr10337563plr.177.1585264138249; 
 Thu, 26 Mar 2020 16:08:58 -0700 (PDT)
Received: from localhost.localdomain (174-21-138-234.tukw.qwest.net.
 [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id i187sm2530037pfg.33.2020.03.26.16.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 16:08:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/31] target/arm: Implement SVE2 integer multiply long
Date: Thu, 26 Mar 2020 16:08:21 -0700
Message-Id: <20200326230838.31112-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326230838.31112-1-richard.henderson@linaro.org>
References: <20200326230838.31112-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
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
X-TUID: e8KEbAdSeLk2

Exclude PMULL from this category for the moment.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 15 +++++++++++++++
 target/arm/sve.decode      |  9 +++++++++
 target/arm/sve_helper.c    | 31 +++++++++++++++++++++++++++++++
 target/arm/translate-sve.c |  9 +++++++++
 4 files changed, 64 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 6a95c6085c..c4784919d2 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2355,4 +2355,19 @@ DEF_HELPER_FLAGS_6(sve_stdd_le_zd_mte, TCG_CALL_NO_WG,
 DEF_HELPER_FLAGS_6(sve_stdd_be_zd_mte, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
 
+DEF_HELPER_FLAGS_4(sve2_sqdmull_zzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmull_zzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmull_zzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_smull_zzz_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_smull_zzz_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_smull_zzz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_umull_zzz_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_umull_zzz_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_umull_zzz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve2_pmull_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 9994e1eb71..2410dd85a1 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1199,3 +1199,12 @@ SSUBWB          01000101 .. 0 ..... 010 100 ..... .....  @rd_rn_rm
 SSUBWT          01000101 .. 0 ..... 010 101 ..... .....  @rd_rn_rm
 USUBWB          01000101 .. 0 ..... 010 110 ..... .....  @rd_rn_rm
 USUBWT          01000101 .. 0 ..... 010 111 ..... .....  @rd_rn_rm
+
+## SVE2 integer multiply long
+
+SQDMULLB_zzz    01000101 .. 0 ..... 011 000 ..... .....  @rd_rn_rm
+SQDMULLT_zzz    01000101 .. 0 ..... 011 001 ..... .....  @rd_rn_rm
+SMULLB_zzz      01000101 .. 0 ..... 011 100 ..... .....  @rd_rn_rm
+SMULLT_zzz      01000101 .. 0 ..... 011 101 ..... .....  @rd_rn_rm
+UMULLB_zzz      01000101 .. 0 ..... 011 110 ..... .....  @rd_rn_rm
+UMULLT_zzz      01000101 .. 0 ..... 011 111 ..... .....  @rd_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 44503626e4..130697f3d9 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1129,6 +1129,37 @@ DO_ZZZ_TB(sve2_uabdl_h, uint16_t, uint8_t, DO_ABD)
 DO_ZZZ_TB(sve2_uabdl_s, uint32_t, uint16_t, DO_ABD)
 DO_ZZZ_TB(sve2_uabdl_d, uint64_t, uint32_t, DO_ABD)
 
+DO_ZZZ_TB(sve2_smull_zzz_h, int16_t, int8_t, DO_MUL)
+DO_ZZZ_TB(sve2_smull_zzz_s, int32_t, int16_t, DO_MUL)
+DO_ZZZ_TB(sve2_smull_zzz_d, int64_t, int32_t, DO_MUL)
+
+DO_ZZZ_TB(sve2_umull_zzz_h, uint16_t, uint8_t, DO_MUL)
+DO_ZZZ_TB(sve2_umull_zzz_s, uint32_t, uint16_t, DO_MUL)
+DO_ZZZ_TB(sve2_umull_zzz_d, uint64_t, uint32_t, DO_MUL)
+
+/* Note that the multiply cannot overflow, but the doubling can. */
+static inline int16_t do_sqdmull_h(int16_t n, int16_t m)
+{
+    int16_t val = n * m;
+    return DO_SQADD_H(val, val);
+}
+
+static inline int32_t do_sqdmull_s(int32_t n, int32_t m)
+{
+    int32_t val = n * m;
+    return DO_SQADD_S(val, val);
+}
+
+static inline int64_t do_sqdmull_d(int64_t n, int64_t m)
+{
+    int64_t val = n * m;
+    return do_sqadd_d(val, val);
+}
+
+DO_ZZZ_TB(sve2_sqdmull_zzz_h, int16_t, int8_t, do_sqdmull_h)
+DO_ZZZ_TB(sve2_sqdmull_zzz_s, int32_t, int16_t, do_sqdmull_s)
+DO_ZZZ_TB(sve2_sqdmull_zzz_d, int64_t, int32_t, do_sqdmull_d)
+
 #undef DO_ZZZ_TB
 
 #define DO_ZZZ_WTB(NAME, TYPE, TYPEN, OP) \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index fb214360bf..c66ec9eb83 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6055,6 +6055,15 @@ DO_SVE2_ZZZ_TB(UABDLT, uabdl, true, true)
 DO_SVE2_ZZZ_TB(SADDLBT, saddl, false, true)
 DO_SVE2_ZZZ_TB(SSUBLBT, ssubl, false, true)
 
+DO_SVE2_ZZZ_TB(SQDMULLB_zzz, sqdmull_zzz, false, false)
+DO_SVE2_ZZZ_TB(SQDMULLT_zzz, sqdmull_zzz, true, true)
+
+DO_SVE2_ZZZ_TB(SMULLB_zzz, smull_zzz, false, false)
+DO_SVE2_ZZZ_TB(SMULLT_zzz, smull_zzz, true, true)
+
+DO_SVE2_ZZZ_TB(UMULLB_zzz, umull_zzz, false, false)
+DO_SVE2_ZZZ_TB(UMULLT_zzz, umull_zzz, true, true)
+
 #define DO_SVE2_ZZZ_WTB(NAME, name, SEL2) \
 static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)       \
 {                                                               \
-- 
2.20.1

