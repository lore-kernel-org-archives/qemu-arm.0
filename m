Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1277737lfm;
        Wed, 17 Jun 2020 21:59:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySb6qRTOq5gOFIlMMEh4rPgB3H0R6HVK3VKhefhwGD8lTsyXgZsXd+ix1nUxWYXq6klvRc
X-Received: by 2002:a25:9d0f:: with SMTP id i15mr3566419ybp.508.1592456344934;
        Wed, 17 Jun 2020 21:59:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592456344; cv=none;
        d=google.com; s=arc-20160816;
        b=DW1WPj4a8P0zqSXfBPccPt9C1yobGXhYRMn23rQ6TKTnoZfUvP5F2HbipXFgaG30UN
         V6hscRBP+KIrqRzQ2Cq6zKT56XbqhHYSzPjGJbreLRheQFqBXjb2VCaUkfVkBU1uxjmI
         lFCcFMEZtLfNO8ToAtlYPbpw+v75mcLh1uo+uQYBbn6HXzPVSpItGkeYeOEoWf9YeLKy
         B65agB4gcHDo6lG/L3kMUVBEJBylLmlPUBjHGl8p3F00MIT4dLPFMuHsToWVudhGl6i4
         U1Z/L5/7xttDWxbg31R3OKlyy3Lhg1nCoY/ktseWrCqPZuaC74ulAEPC3ghC9XLirs52
         WT3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=P+kkin3xeBMcaEbQDnJQqDnSvZBy61C8Rb6KEh2sOL4=;
        b=TM2lSavsYvm165QE5/hV3BHvJm20O1/sI0uh4hrLWqDaeFypym0GTK6LnDEVIYhjv+
         f8NBfu23ShHL+ubReddsUTzuxQpXr3PhKEsmjLfBQrW/LM03/KfhlKGRND1lS8Y1aX75
         IUUmdTRvBJjSw2ketrwro0sgJpfnkdjJUXy9sSnVLUaQB6HtqPBshvKqnY26Hyg53pDH
         qNFiAL6I/Pkk8u4648Kw/RIQZZnPvkVikOdwWat5+yQHVjhLdXS4D0fjlVYBdB0luYdj
         gY3/EblG5aGu7IDpC5xAgu9W8I51NiA2gL8fSQbQ2oVaWSPFhFpzKo3EwaGcJvLdM9Rw
         ol+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JtamSaVK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l18si1390499ybl.255.2020.06.17.21.59.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:59:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JtamSaVK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmdk-0000jI-9j
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmCF-00025O-BM
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:30:39 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:39527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmCD-00039u-F7
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:30:39 -0400
Received: by mail-pj1-x1044.google.com with SMTP id h95so2080026pje.4
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P+kkin3xeBMcaEbQDnJQqDnSvZBy61C8Rb6KEh2sOL4=;
 b=JtamSaVKsohGHRxqZBPZaNFJgCTb8o4pUGKmiORn8KPevMW7eKfS6LJzgiXMg1NwX6
 4SCOMUtqSHTAG1UA5Ylj5oMmdxuG5u4ek2r/ztnM5sQrlNVnlHhBdf2W/tcETckdEjVa
 xX2t3eCy6C+G0IYMcjekl0crpwYLKlWMxmLDg9U6M6gT1bhqOWtP6wZkrrTqL6l2V0E3
 az4lfR7L62U3W7zN9+Wgam72KYxbQXCN4XeblUCTXBfydnHkhZd3dbeX3BC10X3RTeqt
 Mctmrhw/0/HbaJAedHU287Z4cq39EDXBy/PIdnjOgE1WAHfaOO3/VQ4Xb/LeH7nq/Ax5
 901Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P+kkin3xeBMcaEbQDnJQqDnSvZBy61C8Rb6KEh2sOL4=;
 b=YJcbLW8pqZEKoclFr/lxOccpOiJorWD0NIti/kEcYodQg0XAUMyAJUTwnulVli/jrM
 CKWqtDlBNCpwQ9Or3j3ZWuCK6Pketnl3kFDBdI3El+BmygrIOcgCSpHu3To04LmqUW4C
 e2MB2YaIJVPgg2aQjCd0+mTqZI0f3fDwPGMTxKY4ej0hcOhKyH6RPI564K8ltdRKDmbJ
 6tGDHhuPf231Ohfsd5U3YT4wBfbBQb/n4eQjl9jT0pCH1QlSpuJSoLrukMWOo5oKjRzs
 kSHeAw3hzyQ0Av67hmpwETMSxy5gvnKqYeWRwC+FVr6ZVCc4Bttaaij7VuFl8bJu7/CC
 e4Vg==
X-Gm-Message-State: AOAM531MiZTvCI3K4gAqJUl11KqDYdbiKncU2pUa654YQ3VAucX03oK9
 pBDYeC7NS2Wg1emOjj4rh47OHw==
X-Received: by 2002:a17:90a:7785:: with SMTP id
 v5mr2455353pjk.31.1592454636256; 
 Wed, 17 Jun 2020 21:30:36 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id i191sm1298861pfe.99.2020.06.17.21.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:30:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 057/100] target/arm: Implement SVE2 RSUBHNB, RSUBHNT
Date: Wed, 17 Jun 2020 21:26:01 -0700
Message-Id: <20200618042644.1685561-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
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
X-TUID: szBm0WTok44U

From: Stephen Long <steplong@quicinc.com>

This completes the section 'SVE2 integer add/subtract narrow high part'

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200417162231.10374-5-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix round bit type (laurent desnogues)
---
 target/arm/helper-sve.h    |  8 ++++++++
 target/arm/sve.decode      |  2 ++
 target/arm/sve_helper.c    | 10 ++++++++++
 target/arm/translate-sve.c |  2 ++
 4 files changed, 22 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 82e23d6470..c47dea5920 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2045,6 +2045,14 @@ DEF_HELPER_FLAGS_4(sve2_subhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_subhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_subhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_rsubhnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_rsubhnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_rsubhnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_rsubhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_rsubhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_rsubhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_b, TCG_CALL_NO_RWG,
                    i32, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 8ad2698bcf..3121eabbf8 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1328,6 +1328,8 @@ RADDHNB         01000101 .. 1 ..... 011 010 ..... .....  @rd_rn_rm
 RADDHNT         01000101 .. 1 ..... 011 011 ..... .....  @rd_rn_rm
 SUBHNB          01000101 .. 1 ..... 011 100 ..... .....  @rd_rn_rm
 SUBHNT          01000101 .. 1 ..... 011 101 ..... .....  @rd_rn_rm
+RSUBHNB         01000101 .. 1 ..... 011 110 ..... .....  @rd_rn_rm
+RSUBHNT         01000101 .. 1 ..... 011 111 ..... .....  @rd_rn_rm
 
 ### SVE2 Character Match
 
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 0b490e8de6..4464c9af52 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2116,6 +2116,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
 #define DO_ADDHN(N, M, SH)  ((N + M) >> SH)
 #define DO_RADDHN(N, M, SH) ((N + M + ((__typeof(N))1 << (SH - 1))) >> SH)
 #define DO_SUBHN(N, M, SH)  ((N - M) >> SH)
+#define DO_RSUBHN(N, M, SH) ((N - M + ((__typeof(N))1 << (SH - 1))) >> SH)
 
 DO_BINOPNB(sve2_addhnb_h, uint16_t, uint8_t, 8, DO_ADDHN)
 DO_BINOPNB(sve2_addhnb_s, uint32_t, uint16_t, 16, DO_ADDHN)
@@ -2141,6 +2142,15 @@ DO_BINOPNT(sve2_subhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_SUBHN)
 DO_BINOPNT(sve2_subhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_SUBHN)
 DO_BINOPNT(sve2_subhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_SUBHN)
 
+DO_BINOPNB(sve2_rsubhnb_h, uint16_t, uint8_t, 8, DO_RSUBHN)
+DO_BINOPNB(sve2_rsubhnb_s, uint32_t, uint16_t, 16, DO_RSUBHN)
+DO_BINOPNB(sve2_rsubhnb_d, uint64_t, uint32_t, 32, DO_RSUBHN)
+
+DO_BINOPNT(sve2_rsubhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_RSUBHN)
+DO_BINOPNT(sve2_rsubhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_RSUBHN)
+DO_BINOPNT(sve2_rsubhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_RSUBHN)
+
+#undef DO_RSUBHN
 #undef DO_SUBHN
 #undef DO_RADDHN
 #undef DO_ADDHN
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f584e06d87..c8c4822d9e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7040,6 +7040,8 @@ DO_SVE2_ZZZ_NARROW(RADDHNT, raddhnt)
 
 DO_SVE2_ZZZ_NARROW(SUBHNB, subhnb)
 DO_SVE2_ZZZ_NARROW(SUBHNT, subhnt)
+DO_SVE2_ZZZ_NARROW(RSUBHNB, rsubhnb)
+DO_SVE2_ZZZ_NARROW(RSUBHNT, rsubhnt)
 
 static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
                                gen_helper_gvec_flags_4 *fn)
-- 
2.25.1

