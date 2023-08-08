Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1877359ejb;
        Mon, 7 Aug 2023 20:14:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX7/w/o+KrmaxCjrcIlwjX+hu+3N9A7QrkxMifA66e8UPErYPT9sH/9wvQusSOtqTWi0Gh
X-Received: by 2002:a05:620a:29d3:b0:76c:999d:c500 with SMTP id s19-20020a05620a29d300b0076c999dc500mr15133391qkp.32.1691464454158;
        Mon, 07 Aug 2023 20:14:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691464454; cv=none;
        d=google.com; s=arc-20160816;
        b=iX4X1OoxHjIqsPXi8tbbmVlgSf3nQM6XhPLSkrWr1M7OfNGx4kzgqJrExfXKWIlhiE
         sQkPfCivPQEFLkFBLf11WTtvA2KLwrHRUmmPEvYgnaw0qIb0TEXGqPAO5yIj1JlMCpRx
         9YxmcaTZ3Luk1j6LfKu5/Zb0djboj6Z51PtLRNMwSqwI9qweHOn7TiswaDRvDTLtoHgu
         lq6if6JnnR108WyHNfDm+tWitVFDuHtZgvfrAt4sswSfE1dEVjDUz5wabjSRVW751VOn
         I9MbyixyOt7rQ739zf/lNmebIzU3psN6zf8aYGpqXa6QMfKxLvjNxsSpnkWGfUAi/GAu
         /zXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5bAv2VkeF2nF/Nch+eWToS5kdoZdnIAW3FmjUUhtDDU=;
        fh=hqs26moy805PsHbwd88lUczy2QdlfF59ojSMxj/DeWg=;
        b=kSAx0N3w+f6L9yFXzkI436us+48uoC/2Cy6poUwlErbAn7aNW82+lPZmu966t9fDDh
         mWkzDcIJK0RA9aO3XD5YuCpx8yQGMQdLa5G1aACWP/fT1HqmG/0H3G46GQ07v1pS1r+D
         tucoQiHlwsnVVFFvMsPZADuR34G8nRSTIy2pmpTFYgCI++9J/40gOATgeY0CBtwG0qGJ
         ni2MI5Jgr6sMovrVyGvneiNn5d44cb+wCPpreEYN3ENJdQUYmNTE95bD373sFWLuIhlq
         k8i8ZVvRcQXbUIollqERCl6cgpkTvGEiB6eABPDAAdQIeAiTUJ1zTwtMcxptFq0XTz1N
         sAdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SUUPWgh+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g2-20020a05620a40c200b0076c37e2c5bdsi6103029qko.304.2023.08.07.20.14.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 20:14:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SUUPWgh+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qTD9T-0003gL-F8; Mon, 07 Aug 2023 23:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8s-0001bX-Uh
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 23:12:21 -0400
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8c-0000Jf-Dd
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 23:12:18 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-56ce1bd7fc4so3610444eaf.2
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 20:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464321; x=1692069121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5bAv2VkeF2nF/Nch+eWToS5kdoZdnIAW3FmjUUhtDDU=;
 b=SUUPWgh+XIMAPs7bvA4YCksr0dMjMZVJDkI9hzC6Ku7umWLcpE/uAZT4Tnq97H48lD
 TTj/Fy9BFJPnjcGwBwaG6sdZg/cSqnSb61KEDIV6rTSioQ6woN049qJkFFaP79jEDh8I
 kKSKLM2FETsJfq/xAOvMDMboIKQXPXs/YUs9JIPI1emJaE2cAYiajzKEBqIUjsV/PzqM
 j1fV3dRwxR3KT/gW6lZZ1m6OTt/iXkaTAj1rTla/FZoeKkmCdm50AOrfjDFE8VvpsJeD
 nt0bDeaFRSdMeDfFDzD/lTJy1EeChsJI47M0GzOJxxHV1p71WSpgsWHQJmqmtpxPZobn
 EYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464321; x=1692069121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5bAv2VkeF2nF/Nch+eWToS5kdoZdnIAW3FmjUUhtDDU=;
 b=I37kjpu++iyDx/qdKJ+TbfUGVITVLfyQk230vu+oUiHywBO/wMa3zPjlwZI1q1QuWJ
 XwKvbY8sJ6Hhv/KWepgUZUucc3zlLQ1Xwlby1waHmB4iV4DxUvvYM1lKLjJHVsWIsXaD
 Ml9tw+hGATA7KqYwQriG2jrWdM+oQg5n/A2MeBTWoLXDkmMc6CqVvpxDaSetR/hEbpTh
 7M6dJn+wPJYpPsy941fxnmc++ujrCPzAEWHTnmJY8D+G7GWyc3z1o7I57JR4F0/QTZRr
 Xgj/Uvor4GY2hD6FjafM9+b/cSZk7jinuQ0fVMQOY8Wk213IL2P0akGOIpJFK4G3BDQ+
 oPqA==
X-Gm-Message-State: AOJu0YzaFdL+LlBxRSN6HpDu5pPe2URZZBRv95JsqI691Gec6sv+5wur
 qTcB+GgCHwR3VhMw22f1xZkOwQ==
X-Received: by 2002:a05:6358:7250:b0:134:e777:c78b with SMTP id
 i16-20020a056358725000b00134e777c78bmr9986135rwa.5.1691464320876; 
 Mon, 07 Aug 2023 20:12:00 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:12:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 18/24] tcg/i386: Merge tcg_out_setcond{32,64}
Date: Mon,  7 Aug 2023 20:11:37 -0700
Message-Id: <20230808031143.50925-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: wNTw5yLA0hV5

Pass a rexw parameter instead of duplicating the functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index b9673b55bd..ec3c7012d4 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1524,23 +1524,16 @@ static void tcg_out_brcond2(TCGContext *s, const TCGArg *args,
 }
 #endif
 
-static void tcg_out_setcond32(TCGContext *s, TCGCond cond, TCGArg dest,
-                              TCGArg arg1, TCGArg arg2, int const_arg2)
+static void tcg_out_setcond(TCGContext *s, int rexw, TCGCond cond,
+                            TCGArg dest, TCGArg arg1, TCGArg arg2,
+                            int const_arg2)
 {
-    tcg_out_cmp(s, arg1, arg2, const_arg2, 0);
+    tcg_out_cmp(s, arg1, arg2, const_arg2, rexw);
     tcg_out_modrm(s, OPC_SETCC | tcg_cond_to_jcc[cond], 0, dest);
     tcg_out_ext8u(s, dest, dest);
 }
 
-#if TCG_TARGET_REG_BITS == 64
-static void tcg_out_setcond64(TCGContext *s, TCGCond cond, TCGArg dest,
-                              TCGArg arg1, TCGArg arg2, int const_arg2)
-{
-    tcg_out_cmp(s, arg1, arg2, const_arg2, P_REXW);
-    tcg_out_modrm(s, OPC_SETCC | tcg_cond_to_jcc[cond], 0, dest);
-    tcg_out_ext8u(s, dest, dest);
-}
-#else
+#if TCG_TARGET_REG_BITS == 32
 static void tcg_out_setcond2(TCGContext *s, const TCGArg *args,
                              const int *const_args)
 {
@@ -2565,8 +2558,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_brcond(s, rexw, a2, a0, a1, const_args[1],
                        arg_label(args[3]), 0);
         break;
-    case INDEX_op_setcond_i32:
-        tcg_out_setcond32(s, args[3], a0, a1, a2, const_a2);
+    OP_32_64(setcond):
+        tcg_out_setcond(s, rexw, args[3], a0, a1, a2, const_a2);
         break;
     case INDEX_op_movcond_i32:
         tcg_out_movcond32(s, args[5], a0, a1, a2, const_a2, args[3]);
@@ -2718,9 +2711,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
-    case INDEX_op_setcond_i64:
-        tcg_out_setcond64(s, args[3], a0, a1, a2, const_a2);
-        break;
     case INDEX_op_movcond_i64:
         tcg_out_movcond64(s, args[5], a0, a1, a2, const_a2, args[3]);
         break;
-- 
2.34.1

