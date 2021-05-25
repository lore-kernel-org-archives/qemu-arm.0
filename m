Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4032930lfm;
        Mon, 24 May 2021 18:34:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTvwk2xsFmo3G0qW97+Rd/3sAr2HPVIEbVlOdkon3F3VL4yhKZ6Ie+947yST6mzJbuQWz7
X-Received: by 2002:a05:6e02:4af:: with SMTP id e15mr17557029ils.131.1621906490877;
        Mon, 24 May 2021 18:34:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621906490; cv=none;
        d=google.com; s=arc-20160816;
        b=yX80FY3wixJHANUEQFXQ0lwTs9yaob8febTET9895OtY5WSqSVyfW2eHpg3mZsySJB
         dNecLbuvdr1kWOEkRc4NtM3Bme7QOyoh24yTbICcF+n3/A+PEc/41kwjokePsX6lFkGZ
         +zGZYDTJ//QH9zLRe2H0aEAXcl1yGqohoEpVJKJ7/XOxm94ljnNRWjAZncz33gEuDNsw
         NTy5wWfteVl8wN07lxGhhtJEHBzuRMt+TC7iiZBSk3D1raBwPQMX6DvlnFBOozllq+0I
         9o6b5IuBcSVFw52tauabgY9PUC/X0sBV3QTErBCieDwCQ9xqF35ucI2z938cWGcWyIcQ
         thiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lC4zcBHCZT2FFT1aqghsZIqg78m2BlLe2zTnfBW+FyI=;
        b=0VYZMzsEHUlnp+OtblKO6owdc6mY4k+vQzL5rpuSslbLK1KosLqdnNus1LXl7oXlwB
         4c8C8HU6TpFs5svOjzeaCYfhTHohHOP32PQVkJqi+f/Ze8WF0Mmyt8MB/UGYr6PbG079
         r3FzaAn4fKRhQoM/s7axzc7UZT6aSG+RHr//uO/RkeMyDRh7+SMkmmW7b8pFMFMCp4mF
         xi/OOokmQj5W9apX9HPksx0Tz/QhvAMe0EJcDyDbAxK4fYox2i7tIKm/0DxoistmZmBK
         Av04yY0sf/wU8vIOjNjjtAb8fRBGh/6G4BGa8z7K817O4cWXLfJNhR2wBZJx0mfq5hDf
         bkxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xrDA6ApM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si16098972jad.109.2021.05.24.18.34.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:34:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xrDA6ApM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llLy6-0007mR-4N
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLVC-0002XR-Hr
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:58 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:39537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUf-0001tY-Jm
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:58 -0400
Received: by mail-pf1-x435.google.com with SMTP id c17so22279841pfn.6
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lC4zcBHCZT2FFT1aqghsZIqg78m2BlLe2zTnfBW+FyI=;
 b=xrDA6ApMfb5CJmh0Y31wn+PqNX1gNIs/kSxzTps1zZrNH4UgztDwtLKIC/mI8I6cld
 AJOLwY6VDI3DazLWB7/TZ1rbmbApHG9UOf87ZmJtvYzwPmfD3G61ZL4nVzNioXSTSxyr
 JrAeJJ8cnIap4G9J8j+CdXRZwD/+BfsVwEfMvfWRhZ3MUq4/H7FXXy0vO1yYFTa0Gdfa
 dDIpCHsKuuv9LhG1zWiVXmvjV5lurJhF2l93AeteN5VuMZxukkZkVMEWxDMQBxiQYC8d
 ZLNoXjSNfJVdKLXtM9OL8YZ1e+CDtyubhW8OZ5/IyWgOaHeD4gaap8XeDWjMEgmTb8CV
 8ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lC4zcBHCZT2FFT1aqghsZIqg78m2BlLe2zTnfBW+FyI=;
 b=JcjXqHt5F27G6oyoMSr3xVthvc4l6635vlJMlvePCKYdhEI5vIYcXZrBk9OOU3A4IU
 83UTsed+ACBkCTb2EtdiXp6JHIO8ngVzbWPY5WXbH3QyHJXWbF+/zcN5cHCciJ2egeKy
 kMorV7oM/vgQWQjbKTys0zTrpIR+7r7frH4iFrOl/8WRnQDhZ5pAdBIVshE9QbbRdGql
 Q9/oglHGMHGFr8xSiQQhbahjk7CNk1ZSxevKXWdKREgVscpmZFSWiPQQOr1eFsAkNth1
 Vs/82YywQWRW+b2xICkAeRrrp97NKgLMyyklwVOkWrwglAfeKaXloIoKcYrHBeYLkBNc
 1UHw==
X-Gm-Message-State: AOAM533XH7EVGfCuxHkLFBv4EeETgj9nszNVHeM6fqB1nDhVccIXB71K
 VYrGtu7HsYH75Ze1LlI6qSd0EQ==
X-Received: by 2002:a05:6a00:16c9:b029:2df:c620:8156 with SMTP id
 l9-20020a056a0016c9b02902dfc6208156mr27283162pfc.40.1621904662866; 
 Mon, 24 May 2021 18:04:22 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 38/92] target/arm: Implement SVE2 ADDHNB, ADDHNT
Date: Mon, 24 May 2021 18:03:04 -0700
Message-Id: <20210525010358.152808-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
X-TUID: Dv66nHt2R6LQ

From: Stephen Long <steplong@quicinc.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200417162231.10374-2-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  8 ++++++++
 target/arm/sve.decode      |  5 +++++
 target/arm/sve_helper.c    | 36 ++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 13 +++++++++++++
 4 files changed, 62 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index d154218452..a369fd2391 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2509,6 +2509,14 @@ DEF_HELPER_FLAGS_3(sve2_uqrshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_uqrshrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_uqrshrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_addhnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_addhnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_addhnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_addhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_addhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_addhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_b, TCG_CALL_NO_RWG,
                    i32, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 936977eacb..72dd36a5c8 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1320,6 +1320,11 @@ UQSHRNT         01000101 .. 1 ..... 00 1101 ..... .....  @rd_rn_tszimm_shr
 UQRSHRNB        01000101 .. 1 ..... 00 1110 ..... .....  @rd_rn_tszimm_shr
 UQRSHRNT        01000101 .. 1 ..... 00 1111 ..... .....  @rd_rn_tszimm_shr
 
+## SVE2 integer add/subtract narrow high part
+
+ADDHNB          01000101 .. 1 ..... 011 000 ..... .....  @rd_rn_rm
+ADDHNT          01000101 .. 1 ..... 011 001 ..... .....  @rd_rn_rm
+
 ### SVE2 Character Match
 
 MATCH           01000101 .. 1 ..... 100 ... ..... 0 .... @pd_pg_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 263663cfc4..df7413f9c9 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2121,6 +2121,42 @@ DO_SHRNT(sve2_uqrshrnt_d, uint64_t, uint32_t,     , H1_4, DO_UQRSHRN_D)
 #undef DO_SHRNB
 #undef DO_SHRNT
 
+#define DO_BINOPNB(NAME, TYPEW, TYPEN, SHIFT, OP)                           \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
+{                                                                           \
+    intptr_t i, opr_sz = simd_oprsz(desc);                                  \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {                           \
+        TYPEW nn = *(TYPEW *)(vn + i);                                      \
+        TYPEW mm = *(TYPEW *)(vm + i);                                      \
+        *(TYPEW *)(vd + i) = (TYPEN)OP(nn, mm, SHIFT);                      \
+    }                                                                       \
+}
+
+#define DO_BINOPNT(NAME, TYPEW, TYPEN, SHIFT, HW, HN, OP)                   \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
+{                                                                           \
+    intptr_t i, opr_sz = simd_oprsz(desc);                                  \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {                           \
+        TYPEW nn = *(TYPEW *)(vn + HW(i));                                  \
+        TYPEW mm = *(TYPEW *)(vm + HW(i));                                  \
+        *(TYPEN *)(vd + HN(i + sizeof(TYPEN))) = OP(nn, mm, SHIFT);         \
+    }                                                                       \
+}
+
+#define DO_ADDHN(N, M, SH)  ((N + M) >> SH)
+
+DO_BINOPNB(sve2_addhnb_h, uint16_t, uint8_t, 8, DO_ADDHN)
+DO_BINOPNB(sve2_addhnb_s, uint32_t, uint16_t, 16, DO_ADDHN)
+DO_BINOPNB(sve2_addhnb_d, uint64_t, uint32_t, 32, DO_ADDHN)
+
+DO_BINOPNT(sve2_addhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_ADDHN)
+DO_BINOPNT(sve2_addhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_ADDHN)
+DO_BINOPNT(sve2_addhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_ADDHN)
+
+#undef DO_ADDHN
+
+#undef DO_BINOPNB
+
 /* Fully general four-operand expander, controlled by a predicate.
  */
 #define DO_ZPZZZ(NAME, TYPE, H, OP)                           \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 05d9edead4..442bf80b82 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7462,6 +7462,19 @@ static bool trans_UQRSHRNT(DisasContext *s, arg_rri_esz *a)
     return do_sve2_shr_narrow(s, a, ops);
 }
 
+#define DO_SVE2_ZZZ_NARROW(NAME, name)                                    \
+static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)                 \
+{                                                                         \
+    static gen_helper_gvec_3 * const fns[4] = {                           \
+        NULL,                       gen_helper_sve2_##name##_h,           \
+        gen_helper_sve2_##name##_s, gen_helper_sve2_##name##_d,           \
+    };                                                                    \
+    return do_sve2_zzz_ool(s, a, fns[a->esz]);                            \
+}
+
+DO_SVE2_ZZZ_NARROW(ADDHNB, addhnb)
+DO_SVE2_ZZZ_NARROW(ADDHNT, addhnt)
+
 static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
                                gen_helper_gvec_flags_4 *fn)
 {
-- 
2.25.1

