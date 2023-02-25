Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2636461ejc;
        Sat, 25 Feb 2023 01:19:11 -0800 (PST)
X-Google-Smtp-Source: AK7set8Wl2x9t2wao/JTDTwul9I56nExG3FB5Hk6FT0MOW5rkmx1mVWr+hrxHYjRkIuyTt1Kc/6h
X-Received: by 2002:ad4:5ccf:0:b0:56f:37a:4563 with SMTP id iu15-20020ad45ccf000000b0056f037a4563mr38566800qvb.42.1677316751297;
        Sat, 25 Feb 2023 01:19:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677316751; cv=none;
        d=google.com; s=arc-20160816;
        b=bWf5xs9F1MwzaulHW+xMOUX5xSiu5eFBrHCvmfL07Em25Lm47H5hKlK8xohplSesF+
         nc3llUiPGpFFGveuP+SxqvE0rnpp+R7YCzRcC1DdUMzF2ytQ8b+B4RhfRopqmlbxRPRA
         1R+5d7Exc+ZM7D+r63pfq0OTgg4zxT2SWOYVcBrn/0/uCVqamXxFR3XF7TuCDQKedYwT
         JEHVBfa0dBL+oZWW2vU/3HzEdbxnoJnFgmVuwu3QrfbvR5L6x7ejWyEAXyKs3nRwi9n/
         lLpz39B/52XPLlm0PaphI44fIuXcYWhRSnP8GofonsxsXDRqVMfPoAYO35HH09Gbi1XL
         TEJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Gk4H/gx5fzfdthfB0AF4cgfQbvoN/h/04Yaxfs06mIY=;
        b=wxPzcjPfSGuIOyWydOIS5rw4eJg3xfTKW3TxdpEP5oD+QeMlil3u3+Dh0z3tBvFXQ7
         MMvTdHkxsFw2YEzhEvicb3zrYs+wzJLKiOK7G/K8sjp9H3KD9ZrrFdhNZMiFkMBwEgJD
         LhgOmjH1L9TL/L3MijKDUvghaCmox4+tjMapRHlwahrGKtngqGuPhxEHO9D8ShAzmN91
         xoU6fai5c31FrjAO+fT0ImkobhyjIcl1uUoZOKnDxZ+us9kybKdPOgabcJ/qIohpY6Rp
         /ZDO1BcdgDHhtetvD6irJD+BDwjzlW838lEnVRRzn0V9L5lv8wgWyna/3cvVLAu9WG+V
         VDkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=suNpt0pD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6-20020a05620a290600b007427fb5c96dsi1531175qkp.422.2023.02.25.01.19.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:19:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=suNpt0pD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVqeM-0005X4-1W; Sat, 25 Feb 2023 04:15:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeJ-0005PH-4K
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:15:23 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeH-0001oq-7V
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 04:15:22 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 gi3-20020a17090b110300b0023762f642dcso1564355pjb.4
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 01:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gk4H/gx5fzfdthfB0AF4cgfQbvoN/h/04Yaxfs06mIY=;
 b=suNpt0pDQTMGF2fMldFl0FlVEjPl5/R4AMUOdUWP/WBXW+X1gTEyBndsufG6P+hWNB
 j5blJpSYmU96kRlwOMApWzjVOAX2uuPr8Z79ZRJlxepdac/7C1q7UgMK7dx/Rfll+eZ4
 kI3X+aT6/e+ZmAsAVjfTGxiu2JeUD4o4SKjy4Ig91c3i8hsZNp53vReOi9u3pucT0VoP
 osrXciR1CmjYxOUObtxvaHFmeV4PKdSleSB6tviP5Dj6P/lWGZrh2lcNxHz4oCYwUFyR
 5DTFngbNNULSF2DQcG6hIBARPaLz39B3bqDhQjVGAkP8SBzMhFhIe/MdQeNQsHAKklL+
 WHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gk4H/gx5fzfdthfB0AF4cgfQbvoN/h/04Yaxfs06mIY=;
 b=RuvW/V1pi3BHl7WN7W0rhiQlsZzkURGwKzUfHaDW/zX4V8EeIR81ANMTln+wfVwJ93
 /qEw9URCZHzdPeZhBGgLOqGAXUjjmAKMAG9oFhAzPUmO5EUiiidT9AGcJ0keNeaLSNC3
 9HT1svuYVoQn8w0bdBzGzi9Di1m/2Xu6ZyA1YTWdphZDv+mF2zFRq7TDNbD1puZ6MYa1
 WkwsUzuOc3bk+SiLE5iZd1lnzeEI9R1/GK6yA4POKJMWSvOq5RDHg958GxEUPQKB9DFA
 SzoPwGbKOidT6u6gg/b1859vXrlGIx3tUxIj+M1b2Y+vcxV5NlwteMGdi8d36OZQBCRO
 X4Hw==
X-Gm-Message-State: AO0yUKUgGHmDLdyX6hmfsh0mQPUhETVDza35hlh57+d75hG6tHPTAUI0
 Wti8lZ3PufKvmAhu1Cd1Dbt7eA==
X-Received: by 2002:a17:903:187:b0:196:5d8d:2d6f with SMTP id
 z7-20020a170903018700b001965d8d2d6fmr22917111plg.13.1677316519706; 
 Sat, 25 Feb 2023 01:15:19 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:15:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 18/76] target/avr: Drop DisasContext.free_skip_var0
Date: Fri, 24 Feb 2023 23:13:29 -1000
Message-Id: <20230225091427.1817156-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
X-TUID: K3eLY6DkP0zg

Translators are no longer required to free tcg temporaries,
therefore there's no need to record for later freeing.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index e40d8e9681..e7f0e2bbe3 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -107,11 +107,6 @@ struct DisasContext {
      *     tcg_gen_brcond_tl(skip_cond, skip_var0, skip_var1, skip_label);
      * }
      *
-     * if (free_skip_var0) {
-     *     tcg_temp_free(skip_var0);
-     *     free_skip_var0 = false;
-     * }
-     *
      * translate(ctx);
      *
      * if (skip_label) {
@@ -121,7 +116,6 @@ struct DisasContext {
     TCGv skip_var0;
     TCGv skip_var1;
     TCGCond skip_cond;
-    bool free_skip_var0;
 };
 
 void avr_cpu_tcg_init(void)
@@ -1375,7 +1369,6 @@ static bool trans_SBRC(DisasContext *ctx, arg_SBRC *a)
 
     ctx->skip_cond = TCG_COND_EQ;
     ctx->skip_var0 = tcg_temp_new();
-    ctx->free_skip_var0 = true;
 
     tcg_gen_andi_tl(ctx->skip_var0, Rr, 1 << a->bit);
     return true;
@@ -1391,7 +1384,6 @@ static bool trans_SBRS(DisasContext *ctx, arg_SBRS *a)
 
     ctx->skip_cond = TCG_COND_NE;
     ctx->skip_var0 = tcg_temp_new();
-    ctx->free_skip_var0 = true;
 
     tcg_gen_andi_tl(ctx->skip_var0, Rr, 1 << a->bit);
     return true;
@@ -1410,7 +1402,6 @@ static bool trans_SBIC(DisasContext *ctx, arg_SBIC *a)
     tcg_gen_andi_tl(temp, temp, 1 << a->bit);
     ctx->skip_cond = TCG_COND_EQ;
     ctx->skip_var0 = temp;
-    ctx->free_skip_var0 = true;
 
     return true;
 }
@@ -1428,7 +1419,6 @@ static bool trans_SBIS(DisasContext *ctx, arg_SBIS *a)
     tcg_gen_andi_tl(temp, temp, 1 << a->bit);
     ctx->skip_cond = TCG_COND_NE;
     ctx->skip_var0 = temp;
-    ctx->free_skip_var0 = true;
 
     return true;
 }
@@ -2886,10 +2876,6 @@ static bool canonicalize_skip(DisasContext *ctx)
         ctx->skip_cond = TCG_COND_NE;
         break;
     }
-    if (ctx->free_skip_var0) {
-        tcg_temp_free(ctx->skip_var0);
-        ctx->free_skip_var0 = false;
-    }
     ctx->skip_var0 = cpu_skip;
     return true;
 }
@@ -2944,7 +2930,6 @@ static void avr_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
              * This ensures that cpu_skip is non-zero after the label
              * if and only if the skipped insn itself sets a skip.
              */
-            ctx->free_skip_var0 = true;
             ctx->skip_var0 = tcg_temp_new();
             tcg_gen_mov_tl(ctx->skip_var0, cpu_skip);
             tcg_gen_movi_tl(cpu_skip, 0);
@@ -2956,10 +2941,6 @@ static void avr_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
                               ctx->skip_var1, skip_label);
             ctx->skip_var1 = NULL;
         }
-        if (ctx->free_skip_var0) {
-            tcg_temp_free(ctx->skip_var0);
-            ctx->free_skip_var0 = false;
-        }
         ctx->skip_cond = TCG_COND_NEVER;
         ctx->skip_var0 = NULL;
     }
-- 
2.34.1

