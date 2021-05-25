Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4034047lfm;
        Mon, 24 May 2021 18:37:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy68LyyG0XKWXtgdXKE8wWZL8XRUHpp+hPAkA4uHwlSOIc5jLUio+9ZwBuP1sA12esHh/lM
X-Received: by 2002:a92:cec5:: with SMTP id z5mr18727313ilq.110.1621906622618;
        Mon, 24 May 2021 18:37:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621906622; cv=none;
        d=google.com; s=arc-20160816;
        b=imH55xwJka4InSPbfAm9AK8NeYmEitMI2k6oL+/Cs+Rg5vztR1kAdkGQleycRnRUAT
         jPQ4gOofnnWwjV+bBvRR3w29ji3GUpGtJS9MDEYo61P0ONyuS8tgQrHaA6sXSDVjYryS
         5kGC81fUdzfFoV3IPP2WV+FJf3AnlQ+lwTqPZ9nrKDOPUtCx/fTzr8jTISafUm1WVPDx
         DirHcedDKVQKuP+gjwFKiFO9/GlaH1tXSPu+H6sXLm4NbSNcHuH2glKtO6/e+LghQnVU
         Ch2tjr9W1e/kwdBbVZGipna0L9AdHRdIBnMoX+b0rCi4BZF7oOQQiH5OZxHPYPSWl7gH
         7Uig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WNvi/8XipqAB06HT1oOFYrRXluBK7WBz7cq2x3atlxo=;
        b=s7OZ+8arOor0GEHoDF/hJlCthLm2/Gs3Zionpvav9v1+oqQB5ie1ZQlDaclnr33hQu
         nOskxj/EvRrj8Zc/h6dL38kbrn/28sWtelu5YLMBlzWjFn2MX1m7yQcSsy9G/R15fsmq
         iFN5YunvWn28JzaOVVFx8mZvfpZEXUggzGUQ7YyBAD712Su4Ubuir/tngviZHAN7h7YJ
         RJ+Hc8s7L2j6YJ+g9pW9mzgcwBRNHtKCeeursGVk1OK3+fnMns+SUHNrqNtXY2VeBT3s
         EJTc3ISMvUmmpEFML4BdwZ4KjRppSOk02V5hwRSj9R8u9fJ8di+EkZpKZ5uuKHob5sXh
         lFAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k+x4ZPDo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w17si13720281jad.108.2021.05.24.18.37.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:37:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k+x4ZPDo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llM0D-00023l-Rb
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXr-0007oD-W8
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:07:44 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXb-0003zV-5m
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:07:43 -0400
Received: by mail-pg1-x530.google.com with SMTP id 29so10305387pgu.11
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WNvi/8XipqAB06HT1oOFYrRXluBK7WBz7cq2x3atlxo=;
 b=k+x4ZPDo5A5XB76ECuUnIkSdTI/TQleEU4lv6KzdmIOp66rL88Fp48zCnM40ecCv1E
 tIDDmki/7REd8+xx9HpOZ6K1mvoQYHX7BqDkO8IpjPJ+3pfJopKhtUz/QmUCBNYK7UWt
 H10E9FuNX6riRvYBs/5sUu/lPjWgLZzBg9G0rLIDPKTtGIOHHR7WYdnsus/k6EBJbUVe
 +qOA5X6R3DNKhEDcNAzuRtV9oRtSegtApNIekmez3YBwcnHiF5qrTABbKSojz3uuNryf
 DFXzX7wng4WvuDKfrXpLt4r/7kj00OkC8efLdzfeFg8sa/8lQjO+Pqdmzyw9y4v9mEgq
 8g6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WNvi/8XipqAB06HT1oOFYrRXluBK7WBz7cq2x3atlxo=;
 b=mTLzY+tsRQWnH0zEOfg/vxBYMIvcitqDk5+PsxTbp8QDOwiP9DR4yuqx9We5frVgCf
 7oWueoiU6+9boS5A1k/JdPAT4D4CB9zD+TbczpnDtulPhW7gxLB1SJpqNcyaZx5NBmls
 ZkXyejxqS/A2MZmrs2NSrT+nUxM9ZYmmn2p8tCOUxYxbaJQmVE6zS0Lh/chz6jG4TsKO
 lbtKF3Tcj1K1f3R2wkZwXPHxZQQmCkeFIbv7HB96zcOvn/S+yRDyPQJYV4LSVUUHzrkp
 I2Alt6VoYLbGB94jRWLL1oGASGp25l7HvCkmJNPk+YhdSpTKAvm1+KAMSQTjLHKl/aII
 NaPA==
X-Gm-Message-State: AOAM532zVMK6YbaKatmQnJVHWz9jegACGX7zxQzhssYpJ9Smo0FP+wOO
 i+SMBsIeC+F44ddzamiBb3b3R8o26ujJhg==
X-Received: by 2002:a63:7703:: with SMTP id s3mr16386215pgc.339.1621904845161; 
 Mon, 24 May 2021 18:07:25 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 41/92] target/arm: Implement SVE2 RSUBHNB, RSUBHNT
Date: Mon, 24 May 2021 18:03:07 -0700
Message-Id: <20210525010358.152808-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lCsE0AmPPCa7

From: Stephen Long <steplong@quicinc.com>

This completes the section 'SVE2 integer add/subtract narrow high part'

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index 3642e7c820..98e6b57e38 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2533,6 +2533,14 @@ DEF_HELPER_FLAGS_4(sve2_subhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
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
index c68bfcf6ed..388bf92acf 100644
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
index 922df9575a..891f6ff453 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2146,6 +2146,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
 #define DO_ADDHN(N, M, SH)  ((N + M) >> SH)
 #define DO_RADDHN(N, M, SH) ((N + M + ((__typeof(N))1 << (SH - 1))) >> SH)
 #define DO_SUBHN(N, M, SH)  ((N - M) >> SH)
+#define DO_RSUBHN(N, M, SH) ((N - M + ((__typeof(N))1 << (SH - 1))) >> SH)
 
 DO_BINOPNB(sve2_addhnb_h, uint16_t, uint8_t, 8, DO_ADDHN)
 DO_BINOPNB(sve2_addhnb_s, uint32_t, uint16_t, 16, DO_ADDHN)
@@ -2171,6 +2172,15 @@ DO_BINOPNT(sve2_subhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_SUBHN)
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
index 334c57b44f..484d4218b5 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7479,6 +7479,8 @@ DO_SVE2_ZZZ_NARROW(RADDHNT, raddhnt)
 
 DO_SVE2_ZZZ_NARROW(SUBHNB, subhnb)
 DO_SVE2_ZZZ_NARROW(SUBHNT, subhnt)
+DO_SVE2_ZZZ_NARROW(RSUBHNB, rsubhnb)
+DO_SVE2_ZZZ_NARROW(RSUBHNT, rsubhnt)
 
 static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
                                gen_helper_gvec_flags_4 *fn)
-- 
2.25.1

