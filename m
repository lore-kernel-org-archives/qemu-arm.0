Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1276668lfm;
        Wed, 17 Jun 2020 21:57:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+rSAMoQzXaRGMPyXDLcBna7wb/AFBp6uQzIZdbKioZi1JB/1LSOa/B58PUZXNdVVjR19b
X-Received: by 2002:a25:4f44:: with SMTP id d65mr3792092ybb.175.1592456225381;
        Wed, 17 Jun 2020 21:57:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592456225; cv=none;
        d=google.com; s=arc-20160816;
        b=bMOBlqtONcuh6SZ8oEFX7t7it014jFRnn5iJgVyl3tqx8GWwob18Zsvt6wVElEONuR
         2Yqj7/D6Bs4pnKJfKi6JqKJl4oG/4paufF7RxYtItc7IneflvqfL6npWT1gOAHeaY6qm
         xsxC4PH6omw7lwPPVR2YC6tuhprKoYPS6FxPtpAsXkDOjbb86l/MTJGJVdopU2nCz/c4
         2uFExzfI/P1sg4z5Ktm2KKYuDCmx13U/3k1ErmpwwH0FDJ+BEkfe7EoDYRzteQiro4dV
         ISqxiebNQUeIeXwzgZCRF/Ynnb0jLBjbVMoYyjqmljgOR9In3Ksgmv2hzYzM5go98OFB
         U5zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wVuoJXJWITnHAtP39+83jdlpwTgBqSqRmsHoBoDMk4Y=;
        b=bumiH5/jgor6ZuG7xpKQv8FkOndZy+/mThg/uNAdPZSEg5mAcMUMyW1/Q2LtiakJ0q
         sac5TUAk+o5gZ39jin7P8Pu6lQhC1N8PUgDI9342+ADAN+mzBBZh6hFuwd5p8TKgvwh+
         vlxQ/U5+Kw7cOiXIhYCdlB3ees6bXIYwU2q/dTKzTVfoptxwodmfTqRzp8/TCn2XKcrv
         CNcNE6Tfc0hJumJ4U+MeI4Mnuvg1xSeoCP4XZ74vWuYt9LuFKtQEXTMWlQIOLCEL/YmB
         YYxEaqWUJ3IEFjGQjf1Y6pobstylGvx3TTnfn3tZOojz6uq5ztxEafBje65oEEJvCVJB
         P+eQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="j/dpTu+A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c203si1452823yba.431.2020.06.17.21.57.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:57:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="j/dpTu+A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmbo-0004mI-Ob
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmCE-00023A-JE
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:30:39 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmCB-00039X-TL
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:30:38 -0400
Received: by mail-pl1-x62f.google.com with SMTP id x11so1908176plo.7
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wVuoJXJWITnHAtP39+83jdlpwTgBqSqRmsHoBoDMk4Y=;
 b=j/dpTu+AX8ekcaTBx9hpIozG4qYyAw7HdlQoxkIZcvPJ2r2tAjNVl/haRYF6+gGuJo
 VABuI6KJFtcCT0I9gpJEWZQK81p2NoCUOeurz/tKuOjZxa9UnDwaZ51BkPNstUyKZzy1
 qYJpWywVBjOB0/YcgmaX08SKnb1cu1mdBa7CLkPHv8c6dxhs5np0wOaW9lGW+5V+GcqC
 9bixC3EzY/HggD92BF6+rl5cmTGPoH0vQJnekDGclwhlnN3pxs9a1AFGv8WQ9NVJRhZ5
 E/s77stE7heT0UEswDoeGnf9+4MyGAM4CouixPGGsyToggrkgD2sM7uhJ2Q/tw8mMPsJ
 AvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wVuoJXJWITnHAtP39+83jdlpwTgBqSqRmsHoBoDMk4Y=;
 b=X6wmU65qLcvQMujjsCcxdBIIURj3gzEkAzCMD7GIl5aRsCYxIN4pn+YVJfKFoFh4AU
 nMXCj2y89+sbyFdyapvTwhQdmM+cgOdOe6Bq3tCdqzb+z/2VkNA+u7XJ/WUbsbBUp2sG
 IBR9uKk/73qLMiej6cgq3VxJPXYsGb+U2fLfvd/ohAiFxDlZwuFD9nrBVw/h5ho2sD4E
 Ndo6jyijQq4kLBcl0HyFJuASCRIPQbcyIcoiE7S+uaYpwL6EhDgxWe0tpYwUWdPlCHKy
 PEI2lazkrqAxBF5q8yGRGOfpWIluTxIt8NHWg4RT50vZWgXbweMoaDc8JG1KeVLlXyz+
 P4Tw==
X-Gm-Message-State: AOAM530l7Ipt4T8eNpZOQLyOy9iervxZclrrt0fE9kQZ2mGjsRHflvBi
 w3I7qVonc+ppJsDDGv+i+YJxew==
X-Received: by 2002:a17:902:bc82:: with SMTP id
 bb2mr2065410plb.225.1592454634481; 
 Wed, 17 Jun 2020 21:30:34 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id i191sm1298861pfe.99.2020.06.17.21.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:30:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 056/100] target/arm: Implement SVE2 SUBHNB, SUBHNT
Date: Wed, 17 Jun 2020 21:26:00 -0700
Message-Id: <20200618042644.1685561-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bmJ7sc8mxYRZ

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200417162231.10374-4-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  8 ++++++++
 target/arm/sve.decode      |  2 ++
 target/arm/sve_helper.c    | 10 ++++++++++
 target/arm/translate-sve.c |  3 +++
 4 files changed, 23 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 7627e0cd5f..82e23d6470 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2037,6 +2037,14 @@ DEF_HELPER_FLAGS_4(sve2_raddhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_raddhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_raddhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_subhnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_subhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_b, TCG_CALL_NO_RWG,
                    i32, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a33825066c..8ad2698bcf 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1326,6 +1326,8 @@ ADDHNB          01000101 .. 1 ..... 011 000 ..... .....  @rd_rn_rm
 ADDHNT          01000101 .. 1 ..... 011 001 ..... .....  @rd_rn_rm
 RADDHNB         01000101 .. 1 ..... 011 010 ..... .....  @rd_rn_rm
 RADDHNT         01000101 .. 1 ..... 011 011 ..... .....  @rd_rn_rm
+SUBHNB          01000101 .. 1 ..... 011 100 ..... .....  @rd_rn_rm
+SUBHNT          01000101 .. 1 ..... 011 101 ..... .....  @rd_rn_rm
 
 ### SVE2 Character Match
 
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 281a680134..0b490e8de6 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2115,6 +2115,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
 
 #define DO_ADDHN(N, M, SH)  ((N + M) >> SH)
 #define DO_RADDHN(N, M, SH) ((N + M + ((__typeof(N))1 << (SH - 1))) >> SH)
+#define DO_SUBHN(N, M, SH)  ((N - M) >> SH)
 
 DO_BINOPNB(sve2_addhnb_h, uint16_t, uint8_t, 8, DO_ADDHN)
 DO_BINOPNB(sve2_addhnb_s, uint32_t, uint16_t, 16, DO_ADDHN)
@@ -2132,6 +2133,15 @@ DO_BINOPNT(sve2_raddhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_RADDHN)
 DO_BINOPNT(sve2_raddhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_RADDHN)
 DO_BINOPNT(sve2_raddhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_RADDHN)
 
+DO_BINOPNB(sve2_subhnb_h, uint16_t, uint8_t, 8, DO_SUBHN)
+DO_BINOPNB(sve2_subhnb_s, uint32_t, uint16_t, 16, DO_SUBHN)
+DO_BINOPNB(sve2_subhnb_d, uint64_t, uint32_t, 32, DO_SUBHN)
+
+DO_BINOPNT(sve2_subhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_SUBHN)
+DO_BINOPNT(sve2_subhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_SUBHN)
+DO_BINOPNT(sve2_subhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_SUBHN)
+
+#undef DO_SUBHN
 #undef DO_RADDHN
 #undef DO_ADDHN
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7e3ba2e4f7..f584e06d87 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7038,6 +7038,9 @@ DO_SVE2_ZZZ_NARROW(ADDHNT, addhnt)
 DO_SVE2_ZZZ_NARROW(RADDHNB, raddhnb)
 DO_SVE2_ZZZ_NARROW(RADDHNT, raddhnt)
 
+DO_SVE2_ZZZ_NARROW(SUBHNB, subhnb)
+DO_SVE2_ZZZ_NARROW(SUBHNT, subhnt)
+
 static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
                                gen_helper_gvec_flags_4 *fn)
 {
-- 
2.25.1

