Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4034678lfm;
        Mon, 24 May 2021 18:38:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzt8kjr9k6gwBurRm3UtFSc+iIjKs9nYtAM+khdiscEOhP/G1tQpxz79DDtZ3eYoBt6zpBM
X-Received: by 2002:a92:1901:: with SMTP id 1mr10404681ilz.237.1621906694771;
        Mon, 24 May 2021 18:38:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621906694; cv=none;
        d=google.com; s=arc-20160816;
        b=rwlLjc7R0WmyrraYBuMYaueVyPTfNzrmUWTWD5HWF/BpHJSJlsRRrKazjtE+1HNc9c
         zZn36CL5hZXzLzz1aAL/R8oOxuqKFeSK4gkPaH/Ht+uO8x+ULzB+wtyAOcc6FzEHmTqC
         B54wxwjO4Lag0RaTLPLw/7d71O8H8FUZyYvmEuaZwzJyGB+L3bCkHLJhXZEwsZ42pZAt
         mDgJMO7sdfaa/xJB29AptOjKmjzbpXk7mGC3Kdo8Q876Oku3ep3W7k+iFChH7RgTHwmN
         DWxrObu6piGzmIeAAw5/Unu8tvL2GFUuueFWQndfLUKtA7oBiNOhuzIDeRtjRNJl9dyt
         IXGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nCF/nrD5OThI63JZjNx8Fj9vXwhS+t24cYrOO6DKU1E=;
        b=s19cimdIKO+jYumVsjYro9N8te+xRfw4eeYbdPWWqeanqcb1lwfIp90OchHLdCqjL9
         Au1PBchLpEnO56S1SVOpke89OInp8EYfOve+Ol90/9mf/OkCkUX0cjXBRmhQczykw2Ye
         Nzqkvoy45KrF3cK5R90aPMP4xfkVpen1QcSUyr2bIeDPbzFCLIm6jPY3C7fue9ElVX/p
         XnxQANcd5ZQquN8wCilPsEz7XtoGk5vJDMOuBtPijUqg/NFnt2yx+QggJr7eRP1keT7d
         S+n9Oc0TR107DBWdfHhVWCoyusspgJTPPdhFAwXOtBU7WN1/iadU8nCDEGa/QbO9q6hm
         8e5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vEG6iI83;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18si16296328ilh.102.2021.05.24.18.38.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:38:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vEG6iI83;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llM1N-0005un-SR
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXj-0007lz-SG
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:07:36 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:41877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXb-0003z8-1v
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:07:32 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 b15-20020a17090a550fb029015dad75163dso12203344pji.0
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nCF/nrD5OThI63JZjNx8Fj9vXwhS+t24cYrOO6DKU1E=;
 b=vEG6iI83wA+gwH4XanBvOHLC4sNnIb1aDYdejc026lQCAcKgTHX8O86esJrrpAFTsK
 g+kLkZoPKMSBeOjueaTDGjmsLNnX+9JQutDp7LZxzJ6lrR6gfjyct0bY8WdYUf2m+FLO
 H4b87KV6lWzMgVNTbcT4adcbZb7IBA2Buz3h3A8DlK/HlfE3h/H5+56VTRtD21sm8Kyc
 rU6TvQD5AUuE/FCRzfVQwq90owjrCetPfjjqKKcUeSsjIoK9w5NKGeen28b6PeatXj8E
 1ibNFjwDL4eiawXDcx3VoM+kkAAiwD5OcCM9Gfl81ZavITu+Uiyv8OjU/QoQC3DTkCN8
 JHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nCF/nrD5OThI63JZjNx8Fj9vXwhS+t24cYrOO6DKU1E=;
 b=DY/kVxlRppdDtH0CTrImdVwvw15E6GzJAyS+zWGhiEQWpAxqUsAaDDGgmIOHpWYo8G
 uIguClQoaQ8TkCucTwTyS5ZuC1CXDDUOBujrg3fHn7VXVGaQcajAuSUNCIsBLlSaW3PP
 cesovtFaVCgH8EvU+ftunakSY6BRh3AK+BP55LUz2tSMCFrUphbtYIHjQiGPZcDEDVd3
 JUQQcDLD8LTFTirIDD7VxSjOf4DgPJwtK3XTKsKEyegKsl0cvoQRg2mo27LzcengladB
 7O2EwWUsBH3T84UUhmpLADFxh7ADtt2HirynKGAdHw0kGydF5oWvSmahaHx7BCPLYLLr
 GA5g==
X-Gm-Message-State: AOAM5336iOtGzMownCi6N9qnwNspjXccCqcBsqXqgqTVXi7/q4XKlmzM
 8awgzgUexZUcmEuHRCA7XncgCg==
X-Received: by 2002:a17:90a:55c5:: with SMTP id
 o5mr27482147pjm.169.1621904844541; 
 Mon, 24 May 2021 18:07:24 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 40/92] target/arm: Implement SVE2 SUBHNB, SUBHNT
Date: Mon, 24 May 2021 18:03:06 -0700
Message-Id: <20210525010358.152808-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KOMkimPxyAQX

From: Stephen Long <steplong@quicinc.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index 8d95c87694..3642e7c820 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2525,6 +2525,14 @@ DEF_HELPER_FLAGS_4(sve2_raddhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
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
index dfcfab4bc0..c68bfcf6ed 100644
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
index 8b450418c5..922df9575a 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2145,6 +2145,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
 
 #define DO_ADDHN(N, M, SH)  ((N + M) >> SH)
 #define DO_RADDHN(N, M, SH) ((N + M + ((__typeof(N))1 << (SH - 1))) >> SH)
+#define DO_SUBHN(N, M, SH)  ((N - M) >> SH)
 
 DO_BINOPNB(sve2_addhnb_h, uint16_t, uint8_t, 8, DO_ADDHN)
 DO_BINOPNB(sve2_addhnb_s, uint32_t, uint16_t, 16, DO_ADDHN)
@@ -2162,6 +2163,15 @@ DO_BINOPNT(sve2_raddhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_RADDHN)
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
index e7bf8cd9cc..334c57b44f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7477,6 +7477,9 @@ DO_SVE2_ZZZ_NARROW(ADDHNT, addhnt)
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

