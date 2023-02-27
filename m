Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4297603ejc;
        Sun, 26 Feb 2023 21:43:59 -0800 (PST)
X-Google-Smtp-Source: AK7set+hnTXxWEyA4LAGalGAXtvzTdq6Qf0j4tRjUXdMWjbDm2LnQ5YYhl5oRTChPejf39g4fJTs
X-Received: by 2002:a05:622a:138e:b0:3ba:1d8d:f6d0 with SMTP id o14-20020a05622a138e00b003ba1d8df6d0mr43849195qtk.23.1677476638949;
        Sun, 26 Feb 2023 21:43:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476638; cv=none;
        d=google.com; s=arc-20160816;
        b=iW3kp7XCsTJKM7nh/SEERtDRrw77g0yMqLoCIDmJMQxjkx5x/T3mdDMERCLKhzfWk/
         50QDESoWn8dqVQSTU84foSvfWlTpwkR1b55y2axXm0M2AkvK+NNerlKZ0DSg36OJQe1W
         2KTliLA4F+6jEFDPvG903M0k2i/nCHdPKpyRUEKBOcQ62qwDXTiJ7n43PhY2Xvrjt81l
         z6u8Uhrc8pARN3IgLulgSn9NsNunZXZJQISZX6GBDy3GDy6oMQuXSHUfK54hBN6qwWbK
         ddGFqshr9X5fcaKyOTdX2yzzyRrKeZihebevo0TzV9vlCiYli8r8tLGvtgcAJ8NLbZLA
         Bsiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=L/CRGrAXoy0I0U2f47XrfnXHSDepPYdq71QllQBa+J0=;
        b=GgRQcJiJnb8XCFV9UKbXZ4eUVAVbPtzYRViFfN5TxQkQWOKalTuzjPbQNzx67b3eHK
         M3yh09JLJggTFvNYe/xkQW70ZuVtIdDWZbfmPEzgdDXWDtayk6r/MjhYGCjlszz/Q3y9
         Bn/sOSD7hV9G3i8scXLU6E1MzrzGDNkZGQC6taqj8qoF+avOxrAjXHuQVfFBi5YMN+HA
         EjoA23dDGllqo9QWn3wljiWNFOPFcIkvxPubJec47Xb90awu7pAJW91DA0vB4qlrHIOT
         aEVHWr0+EqzGNoWZmxVi33FyQmUvV05q0InsKWev/mh/EYrvcH1X0QX5SWBNInHGmHtH
         nRGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=APeUmnXj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14-20020ac858ce000000b003ba3a9cc8acsi6244765qta.598.2023.02.26.21.43.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:43:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=APeUmnXj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWDe-0004by-EH; Mon, 27 Feb 2023 00:38:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCc-00030V-FS
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:37:35 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCa-0002d0-L8
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:37:34 -0500
Received: by mail-pf1-x434.google.com with SMTP id cp12so2040411pfb.5
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L/CRGrAXoy0I0U2f47XrfnXHSDepPYdq71QllQBa+J0=;
 b=APeUmnXjAlY0e2CqjOWX8gyHiMa1eO7N6QHsURoMZV9NudwO9oNRw0WauqcE+S3xmm
 EBGiRS82imydy2eGZy4FFSbe3ySBsycyJOfguVkog7ljp9Mof9HnEAlzw3m81JKmX3bA
 eFIyW0GswcMA/+Z9kwu2dHH2fkPqVN4ciri/NlW5Q5TXQlp3Kupp4On3+Q+WQCIqClld
 m6O8T84zH+UIn/brVmuCfEO8ZExZuyEWYnYYJbozaF/GnUA3g06pu04tKJrFn+dmpaX6
 s54in6LuK0uWYgAvfHQDUfuLAa7l0Zv+Ncs8SPwDH6uWJbhFNmF2CzV6OZpbGa8dRGGe
 X2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L/CRGrAXoy0I0U2f47XrfnXHSDepPYdq71QllQBa+J0=;
 b=g4f0FQUBB7M6KyObnvWSh7/37SEQgPDhukMduzQGc5oqMA6UaK7O/IeA+9nZTDS4Cz
 kJuLzs66yezVBHL7R3Pr+ffmK+f+4dhLcMyA9DoEkfo2q3ArlwfeqQ4Hnb4ITluQFO0X
 rksyu6Nb8QqLX6FdmkVyIf3wHJ/cvB42sF0A/+I+0nSq32T4hpm4+cOc84zL+ylRUwHm
 00N1OdcvP9mJF/PNTv5iJjP45Yja1/d+vdRIW38zKYRwOeHMyE7GwW90RllGc+B4fp/L
 bWY4m9X1vPA9jaPQpfRMilQY0C08tmabf25dI60N0hLog3gA+pzzvJPWQszAaxl21c47
 KziA==
X-Gm-Message-State: AO0yUKWfyvzM/uUs+SRUwahk+I5U2CE8OTxFBhGy3g0yzbVT/9dk7TBW
 W+5GGrIFvhPqtPMrCNv0swPstT/XCbL2nR/2tdM=
X-Received: by 2002:a62:38d3:0:b0:5a8:d987:d012 with SMTP id
 f202-20020a6238d3000000b005a8d987d012mr21898463pfa.11.1677476251059; 
 Sun, 26 Feb 2023 21:37:31 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 09/31] tcg: Pass TCGTempKind to tcg_temp_new_internal
Date: Sun, 26 Feb 2023 19:36:39 -1000
Message-Id: <20230227053701.368744-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IZG6DGc1Qo6T

While the argument can only be TEMP_EBB or TEMP_TB,
it's more obvious this way.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 18 +++++++++---------
 tcg/tcg.c         |  8 ++++----
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 02d5cfc049..8d896bcbf4 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -855,7 +855,7 @@ void tcg_set_frame(TCGContext *s, TCGReg reg, intptr_t start, intptr_t size);
 
 TCGTemp *tcg_global_mem_new_internal(TCGType, TCGv_ptr,
                                      intptr_t, const char *);
-TCGTemp *tcg_temp_new_internal(TCGType, bool);
+TCGTemp *tcg_temp_new_internal(TCGType, TCGTempKind);
 void tcg_temp_free_internal(TCGTemp *);
 TCGv_vec tcg_temp_new_vec(TCGType type);
 TCGv_vec tcg_temp_new_vec_matching(TCGv_vec match);
@@ -894,13 +894,13 @@ static inline TCGv_i32 tcg_global_mem_new_i32(TCGv_ptr reg, intptr_t offset,
 
 static inline TCGv_i32 tcg_temp_new_i32(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, false);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
     return temp_tcgv_i32(t);
 }
 
 static inline TCGv_i32 tcg_temp_local_new_i32(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, true);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_TB);
     return temp_tcgv_i32(t);
 }
 
@@ -913,25 +913,25 @@ static inline TCGv_i64 tcg_global_mem_new_i64(TCGv_ptr reg, intptr_t offset,
 
 static inline TCGv_i64 tcg_temp_new_i64(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, false);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
     return temp_tcgv_i64(t);
 }
 
 static inline TCGv_i64 tcg_temp_local_new_i64(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, true);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_TB);
     return temp_tcgv_i64(t);
 }
 
 static inline TCGv_i128 tcg_temp_new_i128(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, false);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_EBB);
     return temp_tcgv_i128(t);
 }
 
 static inline TCGv_i128 tcg_temp_local_new_i128(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, true);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_TB);
     return temp_tcgv_i128(t);
 }
 
@@ -944,13 +944,13 @@ static inline TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t offset,
 
 static inline TCGv_ptr tcg_temp_new_ptr(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, false);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
     return temp_tcgv_ptr(t);
 }
 
 static inline TCGv_ptr tcg_temp_local_new_ptr(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, true);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_TB);
     return temp_tcgv_ptr(t);
 }
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 7ffd4a4f28..e09ef46b85 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1255,10 +1255,10 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
     return ts;
 }
 
-TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
+TCGTemp *tcg_temp_new_internal(TCGType type, TCGTempKind kind)
 {
     TCGContext *s = tcg_ctx;
-    TCGTempKind kind = temp_local ? TEMP_TB : TEMP_EBB;
+    bool temp_local = kind == TEMP_TB;
     TCGTemp *ts;
     int idx, k;
 
@@ -1341,7 +1341,7 @@ TCGv_vec tcg_temp_new_vec(TCGType type)
     }
 #endif
 
-    t = tcg_temp_new_internal(type, 0);
+    t = tcg_temp_new_internal(type, TEMP_EBB);
     return temp_tcgv_vec(t);
 }
 
@@ -1352,7 +1352,7 @@ TCGv_vec tcg_temp_new_vec_matching(TCGv_vec match)
 
     tcg_debug_assert(t->temp_allocated != 0);
 
-    t = tcg_temp_new_internal(t->base_type, 0);
+    t = tcg_temp_new_internal(t->base_type, TEMP_EBB);
     return temp_tcgv_vec(t);
 }
 
-- 
2.34.1

