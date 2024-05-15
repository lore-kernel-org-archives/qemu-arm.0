Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp709310ejl;
        Wed, 15 May 2024 08:00:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUhCJ+Fwnpw/Aa0NVfeYii02jn428jetwMTAJA5ifqmPjJamMT/MFgDpfL0qOYzAhTQQtB7rtx6a1MAOGkc1PpxF0NpwfTC
X-Google-Smtp-Source: AGHT+IFJGkNMF798zdXAF7i50/p8HjkrVGrOkB3NuUFkYc6CR3kp9G7xs9INv06Nga8Rmay/MHIj
X-Received: by 2002:a05:6808:f03:b0:3c9:714d:cc7b with SMTP id 5614622812f47-3c997039622mr19678718b6e.9.1715785234825;
        Wed, 15 May 2024 08:00:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715785234; cv=none;
        d=google.com; s=arc-20160816;
        b=nJInuDU5c27jhaAins62FkaYkNfev2cNjLM+ubc93U+feB9pQ9Ty4ETZFtq0LW1Pnx
         kK/QD4H6j8Hf7uzm9fZklKO9+ITW2uM9lL4nMocQ8QadiObOgul294aQU2/jS010HtF+
         BYewCMeL4RboRBCYHibC5TSv3bEDBKOPct5F8y5hJutUngZV41ruRgo8Bu27MI4T7Vdk
         yXIoWTFC/LTksK0aaxMwNt3vSIV1r9eo1imfKlVUNrw7PvW9enj5SaNi/E0fB6SsU0Of
         +gdIFHa7cPE+4dSc7nja6tgQJp2SpL61mwZvBOBFhzI10CL0AW1J6I+raGjt2HEokwS6
         Z7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+UEAzmz2yf/FXZrHjq+7bspL7xDnH65PbwwSYmcMRBs=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=LJlNn9VbIs5H4BkMjRq8daZbhpLekOEJ9Bz9oTQ14cBBfxaDectKIS2cFs9UFdNV3w
         3Q0Wu4V2d3Pq36lYY/CIqXC6ozyc0Ccm/ufV+qgS+Irmqp0lRTJ+ZxR6XM2iNazqSYPQ
         9Gdz5kslzk63Mespwzvjla56SD9L74WbafudM86rxZFwz0aIixHdZKPkmaF3vrneCEP9
         rkrLegUI3BmblumkHJH+4T32IvP0xdGmHzMV6zuSbbNGbUEPbXGiHZ+VIbTcdzJoE0y/
         DbF41eM2whjCIQ1n+PImLgklgFb0i+WBVUcGsg3jKI1vUKoI7rK6GeecH/E4ldgYuTJj
         k4Hg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XgfbktcL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792bf361f8fsi1369512385a.579.2024.05.15.08.00.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2024 08:00:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XgfbktcL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s7G68-0005EG-Fk; Wed, 15 May 2024 10:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s7G63-0005D3-Fc
 for qemu-arm@nongnu.org; Wed, 15 May 2024 10:59:11 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s7G5x-000797-IU
 for qemu-arm@nongnu.org; Wed, 15 May 2024 10:59:11 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-51f74fa2a82so8272282e87.0
 for <qemu-arm@nongnu.org>; Wed, 15 May 2024 07:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715785143; x=1716389943; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+UEAzmz2yf/FXZrHjq+7bspL7xDnH65PbwwSYmcMRBs=;
 b=XgfbktcLWc1hDT51tXfzByvy9mfXUHz0MNUc3oP/4M83EDwmGJhRDPHyB7lDnVYPtU
 RmCCRvpG1h0jKUsVb/VL5eSP7v0K6Ma80gcyRn9vGSdJbErEXOqe+cLs4Cjg1m2KFf5C
 Pw7J/NU467lMh8pEfU8I6QXJCHrsqaXgtL7rs9XDWGlDfRxVZO8rjKpacK675SL6tPnh
 b2FXIaYeO0TpBYc4VVCUTv8Ya2t6m4yqXu55sNVTw7yd08TqzXluPRwmYqJjy8kG5W47
 Aw8qkzC3Ju850fhB5Q6p/lJZxadilbUPnBMTvRxZS/p2TETwQrE13tFGx1sCbO/zEE5f
 jSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715785143; x=1716389943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+UEAzmz2yf/FXZrHjq+7bspL7xDnH65PbwwSYmcMRBs=;
 b=vVl70oW01KVi++gh346ijt+QsVOzGMdYQeXp5GHoxSGzCgUYy5o6a7iuP2XJEUb89w
 IW3SauPbE1HkMIU/p/wqPGIC5/IOyh0auRfjwLjx2YtTyPIt5bOEb0wiFHEz0ykpj+we
 IOeqnfJFohyZXC+3esVRS4q+RBdJogFauiaqOvBqjGZDG9C5iTwhFDFIATXUVInYywTx
 /NwTBfivbnf3YMUykhn2gTSEdFQFMbrFESlKnax1VSl7EEkUvlNmXjdigrw33Mb2WdmC
 P3IhFR8Eru13+exnH6RDKA5gnTIWDFFmC/35tTRHdFKZdV9qNBd1QOzs9LRzLgQSA/x1
 rvQQ==
X-Gm-Message-State: AOJu0Yz4koOOdFKL2mheuKE/C5Vy8nKgraCrqpVZrsRFNwLS0bfFDCE0
 SJ9XsB4gWBOsyW81NGAnJTGSbZHFyoSSuSPTUNqzlg1UAmPljq32yduwGoxUepY=
X-Received: by 2002:a05:6512:3294:b0:51b:6366:3459 with SMTP id
 2adb3069b0e04-5221027800cmr13784999e87.67.1715785143330; 
 Wed, 15 May 2024 07:59:03 -0700 (PDT)
Received: from stoup.. ([149.14.240.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f88111033sm272134645e9.34.2024.05.15.07.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 07:59:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 3/5] tcg/aarch64: Support TCG_TARGET_HAS_tst_vec
Date: Wed, 15 May 2024 16:58:58 +0200
Message-Id: <20240515145900.252870-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515145900.252870-1-richard.henderson@linaro.org>
References: <20240515145900.252870-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: DjnA60lkRDIv

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h     |  2 +-
 tcg/aarch64/tcg-target.c.inc | 26 ++++++++++++++++++++++++--
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 138bafb9da..8bd9e6a5eb 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -167,7 +167,7 @@ typedef enum {
 #define TCG_TARGET_HAS_minmax_vec       1
 #define TCG_TARGET_HAS_bitsel_vec       1
 #define TCG_TARGET_HAS_cmpsel_vec       0
-#define TCG_TARGET_HAS_tst_vec          0
+#define TCG_TARGET_HAS_tst_vec          1
 
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_NEED_LDST_LABELS
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 56fc9cb9e0..ffa8a3e519 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -2737,7 +2737,8 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
             TCGCond cond = args[3];
             AArch64Insn insn;
 
-            if (cond == TCG_COND_NE) {
+            switch (cond) {
+            case TCG_COND_NE:
                 if (const_args[2]) {
                     if (is_scalar) {
                         tcg_out_insn(s, 3611, CMTST, vece, a0, a1, a1);
@@ -2752,7 +2753,27 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                     }
                     tcg_out_insn(s, 3617, NOT, is_q, 0, a0, a0);
                 }
-            } else {
+                break;
+
+            case TCG_COND_TSTNE:
+            case TCG_COND_TSTEQ:
+                if (const_args[2]) {
+                    /* (x & 0) == 0 */
+                    tcg_out_dupi_vec(s, type, MO_8, a0,
+                                     -(cond == TCG_COND_TSTEQ));
+                    break;
+                }
+                if (is_scalar) {
+                    tcg_out_insn(s, 3611, CMTST, vece, a0, a1, a2);
+                } else {
+                    tcg_out_insn(s, 3616, CMTST, is_q, vece, a0, a1, a2);
+                }
+                if (cond == TCG_COND_TSTEQ) {
+                    tcg_out_insn(s, 3617, NOT, is_q, 0, a0, a0);
+                }
+                break;
+
+            default:
                 if (const_args[2]) {
                     if (is_scalar) {
                         insn = cmp0_scalar_insn[cond];
@@ -2791,6 +2812,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                     }
                     tcg_out_insn_3616(s, insn, is_q, vece, a0, a1, a2);
                 }
+                break;
             }
         }
         break;
-- 
2.34.1

