Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp368586nji;
        Wed, 11 Sep 2024 19:44:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVfA+KxE3xAOSttp74MzycSGs7bKXSsySpL4bJYUnNii2yNQ1rSMWMSgdrZ1071Fru2+yz2u5ARb97pug==@linaro.org
X-Google-Smtp-Source: AGHT+IHrqw4goBHed4USWOyEnCRi9k5UD3LbxnRBmZ1cSiwBeOe6T6umrUHl99MVUAdA0rHyf8RT
X-Received: by 2002:a05:620a:2495:b0:7a9:bfcb:6d86 with SMTP id af79cd13be357-7a9e5ef68cfmr183806285a.25.1726109073746;
        Wed, 11 Sep 2024 19:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726109073; cv=none;
        d=google.com; s=arc-20240605;
        b=fjfoRa4WHfjLC+2b8/jzZgTtOAGL5fEyVEvfGopNhd+EzztwrS/BKUSL1A2tA7ElfS
         Eqn00q9/De+mZocMYzx7j50jHeMSsuAHILxWL0idE23C+GPrIW4SfHSy6YRR35fLwrij
         6EFe8FRO6qE7x6uRbM4yyI+NoYV07dE4yFIhNQ2OV67kFcv5Yv41eoBLfsvfOOiwBNng
         P0Y2FDE0E2F9t7c2PZUai1hz3IVNkBbA9OwvJbQfNndIeweH87456qiMd5ACaHA8raQ9
         oyhIry4mHNGa2xvsvtST6TRh64NoBc/sc76oAJNab9Kml9MAI8f9JAedvxqpwHBHR0js
         2syA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hCg9x0mWGGumEFO2TzIOUcSJLT2z1d9b8LgujqgHrcQ=;
        fh=gQUbKHWxndGeE+DWX4FUU/bGRmGjAJrLFJIkYOi+27k=;
        b=d76K2b1gos5JeDk0svk0HtGbruVv2d4X3Hfgjp3kfabc8Wu9vVt1JwkzyQa1MivYlZ
         e/yu/WvkeLFSozh6KnqnjHnEiR+GpskmjHl3bD+V2xCA7tS+EGiNiXbcAPP/om0MkBc6
         8gEP5TUqZ4Yf8jFGtvoMWYGgkbFDK1Pey24fxAq+CeW1y0h78LB67HYvjaAnvuueptZ4
         rSNNdG/tsU2roFwFAfDAx/cIt3k8ES3I1+40wYpZCloGeMatxziJ0/UKKzMWTfUayEds
         ig+JWi5cuqMk6i5PWG0g57MbEOQ5PdcsWuJ41dlsNXp8+1cGTBlFpevxoeie2MYpZzwO
         idfg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M96BesC8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a7a54739si1212021885a.545.2024.09.11.19.44.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2024 19:44:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M96BesC8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1soZm0-00031A-3E; Wed, 11 Sep 2024 22:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZls-0002WL-Jn
 for qemu-arm@nongnu.org; Wed, 11 Sep 2024 22:41:25 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZlq-00048F-W1
 for qemu-arm@nongnu.org; Wed, 11 Sep 2024 22:41:24 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-20688fbaeafso6174445ad.0
 for <qemu-arm@nongnu.org>; Wed, 11 Sep 2024 19:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726108881; x=1726713681; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hCg9x0mWGGumEFO2TzIOUcSJLT2z1d9b8LgujqgHrcQ=;
 b=M96BesC8+ranaxrZVRoK0ii5RnS7u+2YOJ+twAhaPXPh4Sx07x3CyfX/yupHI1rSZT
 11tFi4/xhpms1gqS/wweCA58rzEUkUgexdSRI29tk9h9pNwjHYUwvDkuOpWAqlyhpYHp
 ScoyjZST5O9fj4pSJ5xS9npDKfWu6bCKDO3vr7rB7tL6p+2iB96bu3yGkgCvsF0Jn7bW
 IyN6BlstV70Phr90MC1a/d6Gm4bcaYKOTE9eoPJWLxTwAliud/N6ZV1vgaOFiuVTNUMq
 QZ/6DUXiEPykLJgygYDnkm9V9fPXXTsBWgFAu9/PFTlhsZL/8B4n9Fi11DVsM+B/ScbI
 tG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726108881; x=1726713681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hCg9x0mWGGumEFO2TzIOUcSJLT2z1d9b8LgujqgHrcQ=;
 b=xLHr5/oDymg2LKHP7GN1k8A6sMhtABZyjovQN/hmBMsOp/+6CwuH0iTBOxvpY2zuOP
 sdoYLzhMnIE1NLed64xka1cuITsx8OGbwUGiTfo2PSL1LoaDk2kvwU60WSP+6vBzK8gZ
 +VRl69gkktxd0LqCT0X+mova35QXNwmetEGQYKf0D8ET0M0tQmL5x+wjMYlOnKOAvmrs
 8oyyWoYcwHRIGjKDvoUNkTYFXIEIzxkQjpbcqM3Uh2dGaq4PVMGL4QAamJ+/BN92oxam
 niC1Uft2ZMNPvpHWXmayaOg0FaUvSm/791/SKpt7Kec1RU4ENz1aOWCNNq7C8BZ236Q+
 1u4w==
X-Gm-Message-State: AOJu0YwMIdLB89+2Au9rXjDlfPvSgVf04ERfSrHNUfCHntkKgXDbzNto
 qta5Yek05wpdqWq95MQ8I5pbr48ZEAtllbkoPcxhLx22lgOTc5q17Utswasg1Aw=
X-Received: by 2002:a17:903:2302:b0:207:20c5:42c with SMTP id
 d9443c01a7336-2076e40be2dmr22874495ad.45.1726108881334; 
 Wed, 11 Sep 2024 19:41:21 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2076afe9c61sm5635915ad.231.2024.09.11.19.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 19:41:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 05/29] target/arm: Use tcg_gen_extract2_i64 for EXT
Date: Wed, 11 Sep 2024 19:40:50 -0700
Message-ID: <20240912024114.1097832-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240912024114.1097832-1-richard.henderson@linaro.org>
References: <20240912024114.1097832-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-TUID: yLLH+Kb/im0y

The extract2 tcg op performs the same operation
as the do_ext64 function.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 6d5f12e8f5..1a0b2bb33b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8890,23 +8890,6 @@ static void disas_data_proc_fp(DisasContext *s, uint32_t insn)
     }
 }
 
-static void do_ext64(DisasContext *s, TCGv_i64 tcg_left, TCGv_i64 tcg_right,
-                     int pos)
-{
-    /* Extract 64 bits from the middle of two concatenated 64 bit
-     * vector register slices left:right. The extracted bits start
-     * at 'pos' bits into the right (least significant) side.
-     * We return the result in tcg_right, and guarantee not to
-     * trash tcg_left.
-     */
-    TCGv_i64 tcg_tmp = tcg_temp_new_i64();
-    assert(pos > 0 && pos < 64);
-
-    tcg_gen_shri_i64(tcg_right, tcg_right, pos);
-    tcg_gen_shli_i64(tcg_tmp, tcg_left, 64 - pos);
-    tcg_gen_or_i64(tcg_right, tcg_right, tcg_tmp);
-}
-
 /* EXT
  *   31  30 29         24 23 22  21 20  16 15  14  11 10  9    5 4    0
  * +---+---+-------------+-----+---+------+---+------+---+------+------+
@@ -8944,7 +8927,7 @@ static void disas_simd_ext(DisasContext *s, uint32_t insn)
         read_vec_element(s, tcg_resl, rn, 0, MO_64);
         if (pos != 0) {
             read_vec_element(s, tcg_resh, rm, 0, MO_64);
-            do_ext64(s, tcg_resh, tcg_resl, pos);
+            tcg_gen_extract2_i64(tcg_resl, tcg_resl, tcg_resh, pos);
         }
     } else {
         TCGv_i64 tcg_hh;
@@ -8965,10 +8948,10 @@ static void disas_simd_ext(DisasContext *s, uint32_t insn)
         read_vec_element(s, tcg_resh, elt->reg, elt->elt, MO_64);
         elt++;
         if (pos != 0) {
-            do_ext64(s, tcg_resh, tcg_resl, pos);
+            tcg_gen_extract2_i64(tcg_resl, tcg_resl, tcg_resh, pos);
             tcg_hh = tcg_temp_new_i64();
             read_vec_element(s, tcg_hh, elt->reg, elt->elt, MO_64);
-            do_ext64(s, tcg_hh, tcg_resh, pos);
+            tcg_gen_extract2_i64(tcg_resh, tcg_resh, tcg_hh, pos);
         }
     }
 
-- 
2.43.0

