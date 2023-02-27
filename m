Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4399484ejc;
        Mon, 27 Feb 2023 00:16:11 -0800 (PST)
X-Google-Smtp-Source: AK7set+P4dzpL7oeEDSdvoE2sQa5zsG3mUMaIdIRyT2i7b5ZThDKps3FwP5OovSuQq9NpyJq5Zo9
X-Received: by 2002:a05:6214:da5:b0:56e:a9c6:d2c6 with SMTP id h5-20020a0562140da500b0056ea9c6d2c6mr44525955qvh.6.1677485771612;
        Mon, 27 Feb 2023 00:16:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677485771; cv=none;
        d=google.com; s=arc-20160816;
        b=TWk4xy0FlkMEFlr2N4HjrseODWo873ugc1D3oZ5Ub8wnm/AjzUwL4v/m5e5m2rUs3D
         xondGvTNC+AbfKiRZkd1mcQXRQLMTjGCUQIzkZREKSAOZsURU6RE1l5/AeZ0erF11BoS
         mQHe1RvIbLgAhBg4b+zBs2RCAhjynBFAVJTdMP69pbZ8uO6Oiy+G5g7l81M3px+abCOv
         dCDqd7RTsldwaMAiWzxmCWCClA5i/7Pu9aeplJKPZmLE9eIbiRvUnX8EAJnuXhwfQ32w
         idyfO4KtdvS/7Gh8PvQD9wgvggMVTBCucGUaXxPgtlpPptwo3qcFdQdfpCfKIfJRrIXP
         st7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sYsgaqBrBGiI3+Jh2WZEiCq4q19WvUz6hEnSof98BJo=;
        b=R5LqKD6tf6CiFBVhL/qEm5U1juelYtIBDPUeEBMf3q3Wwt3nnSvVtPvTVwibjrw9yQ
         CxY5b6oFQnZM7TW0ccNS1U77nHP15rPCTb6Jlr09IrPpwn1EblmwkdDkwoZJD8lOqOPG
         sZQkXSHp44NaeHjqkB4TSGp46A6Xibo1Zm2R9RIMqArIKRL0sY8RMziEL2WVtlYkxzOD
         e+zgjdhPDfEpFqe6OUBXccxFmvJyJLGzWK+Q39aJeGEnTjrEL8vUcTweIIJaHwNOiY4W
         5tqxnDjxbD2mrMmL6uu/eaunMubR/Acsi+2+htdk/Ze0Bay8RhinBU1qg+sDl8ySn7f+
         7OLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FSrTyzh5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b18-20020a0c9b12000000b0056eb35b2b4csi6307610qve.151.2023.02.27.00.16.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 00:16:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FSrTyzh5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWPA-0004rb-CD; Mon, 27 Feb 2023 00:50:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNk-0005qj-7D
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:49:05 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNh-0007kD-IO
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:49:02 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so5081952pjp.2
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sYsgaqBrBGiI3+Jh2WZEiCq4q19WvUz6hEnSof98BJo=;
 b=FSrTyzh5bK28sB/luozKktwrAKm3kgVnjqPE8wFy6dO/K9ex6XKsTUfZPWliw3b6KG
 rGo/RYFt5GhajQKl90pAq8mqK9dv+dW8DgtTWt4CgZkbeKEHbV+yN0vhxKwRBhf95vEI
 EnXKnyKv3SsR+nOkp/kh2qp9cJF2ONolJ5keSYEk/l9k6VKebaRbNLnu+odihfZVH1K+
 ob8yC8PkLGj3PM/w+IqJRWY+8+0uKJtlGWe+Fwc51E3dGobJGs03XwRfSfRuuzX5ENjY
 jX6DY0JyRXToAmgLWalysPHeX509mkNLmiTAU97bbEke2W1lkulA8zfbvRqywzx9FDjK
 M10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sYsgaqBrBGiI3+Jh2WZEiCq4q19WvUz6hEnSof98BJo=;
 b=lw5tOCCfK3uBX3nnrbhWFb769Cim+VkcoIwAx87gLfDL1sxWiSAN+3ukIlmkB+uFQs
 oihhLJyf7jo0DctxO0dQw4hZRltIm2dKgxtdo332p0xy8nV7SASGSlZyL9jEzbNyZyGg
 rby7kAC9r5Dt5JFVI/VpLS77Pjd/5cMXozUP4LUwerQRG00tT6VWkrw5GdhrJNSkBGSc
 bb2qBK+3mYO2lTwhz/oK86RboUpk9aM3d4FvSBJBnJfsh16w9mRt64EKSVYZmtWDGrcI
 yf9Fs1uWQ58V99Qe0y87cqPmTjYWOGu0Is/b3iS79gAphCQIEWZ2PJXjU1DbcUxGoaes
 3YPA==
X-Gm-Message-State: AO0yUKXSwMtz8nqYDdir9Zq7kghqNUN3YFTdrC3otrE162l4Y6ochb6T
 362Aq4xEhgdu7Gozap4X8DAH5Q==
X-Received: by 2002:a17:902:e812:b0:19b:da8:1ce6 with SMTP id
 u18-20020a170902e81200b0019b0da81ce6mr30069146plg.55.1677476929962; 
 Sun, 26 Feb 2023 21:48:49 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 70/70] tcg: Drop tcg_const_*
Date: Sun, 26 Feb 2023 19:42:33 -1000
Message-Id: <20230227054233.390271-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: e9gUGHO8X8ZB

These functions are no longer used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h |  4 ----
 include/tcg/tcg.h    |  6 ------
 tcg/tcg.c            | 16 ----------------
 3 files changed, 26 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 353d430a63..1d682d0b0a 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -1094,9 +1094,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_extract_tl tcg_gen_extract_i64
 #define tcg_gen_sextract_tl tcg_gen_sextract_i64
 #define tcg_gen_extract2_tl tcg_gen_extract2_i64
-#define tcg_const_tl tcg_const_i64
 #define tcg_constant_tl tcg_constant_i64
-#define tcg_const_local_tl tcg_const_local_i64
 #define tcg_gen_movcond_tl tcg_gen_movcond_i64
 #define tcg_gen_add2_tl tcg_gen_add2_i64
 #define tcg_gen_sub2_tl tcg_gen_sub2_i64
@@ -1210,9 +1208,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_extract_tl tcg_gen_extract_i32
 #define tcg_gen_sextract_tl tcg_gen_sextract_i32
 #define tcg_gen_extract2_tl tcg_gen_extract2_i32
-#define tcg_const_tl tcg_const_i32
 #define tcg_constant_tl tcg_constant_i32
-#define tcg_const_local_tl tcg_const_local_i32
 #define tcg_gen_movcond_tl tcg_gen_movcond_i32
 #define tcg_gen_add2_tl tcg_gen_add2_i32
 #define tcg_gen_sub2_tl tcg_gen_sub2_i32
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 80a2597293..a1b41c1728 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -989,10 +989,6 @@ void tcg_remove_ops_after(TCGOp *op);
 
 void tcg_optimize(TCGContext *s);
 
-/* Allocate a new temporary and initialize it with a constant. */
-TCGv_i32 tcg_const_i32(int32_t val);
-TCGv_i64 tcg_const_i64(int64_t val);
-
 /*
  * Locate or create a read-only temporary that is a constant.
  * This kind of temporary need not be freed, but for convenience
@@ -1014,10 +1010,8 @@ TCGv_vec tcg_constant_vec(TCGType type, unsigned vece, int64_t val);
 TCGv_vec tcg_constant_vec_matching(TCGv_vec match, unsigned vece, int64_t val);
 
 #if UINTPTR_MAX == UINT32_MAX
-# define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i32((intptr_t)(x)))
 # define tcg_constant_ptr(x)     ((TCGv_ptr)tcg_constant_i32((intptr_t)(x)))
 #else
-# define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i64((intptr_t)(x)))
 # define tcg_constant_ptr(x)     ((TCGv_ptr)tcg_constant_i64((intptr_t)(x)))
 #endif
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 4d3fb6aee2..3ba0bdaaba 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1444,22 +1444,6 @@ TCGv_vec tcg_constant_vec_matching(TCGv_vec match, unsigned vece, int64_t val)
     return tcg_constant_vec(t->base_type, vece, val);
 }
 
-TCGv_i32 tcg_const_i32(int32_t val)
-{
-    TCGv_i32 t0;
-    t0 = tcg_temp_new_i32();
-    tcg_gen_movi_i32(t0, val);
-    return t0;
-}
-
-TCGv_i64 tcg_const_i64(int64_t val)
-{
-    TCGv_i64 t0;
-    t0 = tcg_temp_new_i64();
-    tcg_gen_movi_i64(t0, val);
-    return t0;
-}
-
 /* Return true if OP may appear in the opcode stream.
    Test the runtime variable that controls each opcode.  */
 bool tcg_op_supported(TCGOpcode op)
-- 
2.34.1

