Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp713063ejb;
        Thu, 19 Oct 2023 11:33:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO2wEk6B3apzWuB5nnldps+m216mgG0j9CMNq+8iO6+qFvCErb1BmrSnoF/h/KsBxayOo0
X-Received: by 2002:a05:600c:19ca:b0:407:5b54:bb0c with SMTP id u10-20020a05600c19ca00b004075b54bb0cmr2639121wmq.19.1697740380138;
        Thu, 19 Oct 2023 11:33:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697740380; cv=none;
        d=google.com; s=arc-20160816;
        b=Vwkd1Q9X7X8ju3e38FinyXS0tjQu1Mb+IJjwGQkltIVFc+OlzAzVSnE5q8Ttl1lFGK
         RUAiRK5JifneZqgNjvThT9xmymX5iPX84sd8cCYlgkeX3Rl0PmVOMQ2X5ujhmnmmgKaV
         IbDOp9/9Qq9mF8yPSXPezIeDu+lSJwi2XjpLoCZm0202tLDSg0sTNf0ExLKzBpljVqJ8
         4C0P/06gqYlAZfxI10paZJLw4vwiB2xcYasWlCEP1qnIOT3UXs8G38mdUBDogJzxIjbF
         i/gwF60DhwgWuiLNtNMHzNPz+eOTQAJ98A4X738Ogta6sLfHCwKoIHAmKv692ppIIBEJ
         YBEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tq79fEqaZfxncWlnhMXIKSET4c6RLRriTWIQt92yq8w=;
        fh=rp4SvMZyvufgLOIbJsYRQQ45Pxd1jVTSEU6q8ruBOWo=;
        b=Z1uSuwSrLt76xJV3uKOHXY4Msjywl803GNaK83PdLbSF1d7EAHU0PlI/V5w/gE+iIe
         uVDA9vpzJutw3asFqieaEVtWgO4q50uVfUJyu0PEnSNAXvtenWAnkmjPsdgMBCmPlKMF
         3x09xhhXXP5TnYunfmLwERoBLnvYd9blkEMLifHDAt5Xp2qHXHFavgYeIm3LzoUFBK9N
         KzB6X1tM8t+1RVq9liyqgnNyjZwgzLNCi4zRK6JJM2rLqVWbkwOTChc+C5D+mSBI+sGL
         wSpkX90mQICALeUZOjKtoG+9zBEwuGC0qwp9CAeoGXNW+jRgI7Q2jr744MpucH8/QLBr
         Oe2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JtyS7KTy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 22-20020a05600c229600b00406495edb62si2792672wmf.154.2023.10.19.11.33.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 11:33:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JtyS7KTy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtXmG-0001wS-9D; Thu, 19 Oct 2023 14:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qtXm3-0001EZ-O5
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 14:29:36 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qtXm2-00070J-0F
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 14:29:35 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-692c02adeefso27526b3a.3
 for <qemu-devel@nongnu.org>; Thu, 19 Oct 2023 11:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697740172; x=1698344972; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tq79fEqaZfxncWlnhMXIKSET4c6RLRriTWIQt92yq8w=;
 b=JtyS7KTy1ie5zGUkNihJrRy7pnfBos5uFWe9HAFkObkiPzUNGw2gC+m0x5Ppq5vBwC
 Xj86FldBqC9pt5ExlfNZ7BRTLTBir+vVOSbmvu+bj4NT8L1x09YFikRVMTVBrrq1VKVY
 TOVkhWzy92betSs4FTo+VEatGar7TIG+zzkWmErR2tPAlQ8GCCL69tjH86cy0F8sHOHF
 DChlTAO/HJdQWEYgsbP/q0LxaBOkiqO7Ja9bVvaxoidThHYjEPrdaNjXyBfiHJwRpxAh
 d3QFHKtJ8TvvUv/Xw+NeSM66U2aFHXfypGc5zZ8aqPJT7KSmJ4Wha0LolEU5ti6eMiSx
 yntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697740172; x=1698344972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tq79fEqaZfxncWlnhMXIKSET4c6RLRriTWIQt92yq8w=;
 b=vyN4amfz2khQh+YX6P6fDI5HFCPr62j+3RjtYydUxoVMycpLLXOVGMa5dUIJrLfG4w
 +F2vZ4xrVxZzFvFSYY22mEattWDzrv6oT2VNwCBAbJc6DSeg+m7IeAJgRw0sTJCmUL0m
 KZtWf8nrRvZiS8Fh0U2Rt7HkFVy5nCS7EOvk8L2VjS9ZqtI8hXehS4fW1GGNaMBDad66
 LY29Vs2ttfbr7vjj/xtuz7gde5fTS73wU8xS7v799awlEPGyiR1xucKkzi8SMeoC2eG9
 SChJbKcZV+YIeKDLqoodxvAEmdmVxQ9xVL04isTMvxmcBoMNRDK8kN4TrciHdHta1UZU
 TLGw==
X-Gm-Message-State: AOJu0Ywg+OOXTyaSYbx9CC79QyMGnI5PyhJJgJQutfaeXIIl+k8sV1q5
 0k409o5N+zJ/dF4jD39+VBzFCjHz4X7zypXDTlQ=
X-Received: by 2002:a05:6a00:b91:b0:6be:2e07:5c5c with SMTP id
 g17-20020a056a000b9100b006be2e075c5cmr3153002pfj.20.1697740171802; 
 Thu, 19 Oct 2023 11:29:31 -0700 (PDT)
Received: from stoup.. ([71.212.149.95]) by smtp.gmail.com with ESMTPSA id
 e1-20020a630f01000000b005b856fab5e9sm72216pgl.18.2023.10.19.11.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 11:29:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org, laurent@vivier.eu,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com
Subject: [PATCH 4/7] target/m68k: Use tcg_gen_ext_i32
Date: Thu, 19 Oct 2023 11:29:18 -0700
Message-Id: <20231019182921.1772928-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231019182921.1772928-1-richard.henderson@linaro.org>
References: <20231019182921.1772928-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
X-TUID: RY7V0Kr2wjAR

We still need to check OS_{BYTE,WORD,LONG},
because m68k includes floating point in OS_*.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 4d0110de95..4a0b0b2703 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -520,21 +520,9 @@ static inline void gen_ext(TCGv res, TCGv val, int opsize, int sign)
 {
     switch (opsize) {
     case OS_BYTE:
-        if (sign) {
-            tcg_gen_ext8s_i32(res, val);
-        } else {
-            tcg_gen_ext8u_i32(res, val);
-        }
-        break;
     case OS_WORD:
-        if (sign) {
-            tcg_gen_ext16s_i32(res, val);
-        } else {
-            tcg_gen_ext16u_i32(res, val);
-        }
-        break;
     case OS_LONG:
-        tcg_gen_mov_i32(res, val);
+        tcg_gen_ext_i32(res, val, opsize | (sign ? MO_SIGN : 0));
         break;
     default:
         g_assert_not_reached();
@@ -1072,15 +1060,10 @@ static int gen_ea_mode_fp(CPUM68KState *env, DisasContext *s, int mode,
             tmp = tcg_temp_new();
             switch (opsize) {
             case OS_BYTE:
-                tcg_gen_ext8s_i32(tmp, reg);
-                gen_helper_exts32(tcg_env, fp, tmp);
-                break;
             case OS_WORD:
-                tcg_gen_ext16s_i32(tmp, reg);
-                gen_helper_exts32(tcg_env, fp, tmp);
-                break;
             case OS_LONG:
-                gen_helper_exts32(tcg_env, fp, reg);
+                tcg_gen_ext_i32(tmp, reg, opsize | MO_SIGN);
+                gen_helper_exts32(tcg_env, fp, tmp);
                 break;
             case OS_SINGLE:
                 gen_helper_extf32(tcg_env, fp, reg);
-- 
2.34.1

