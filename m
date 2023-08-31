Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5082058ejc;
        Thu, 31 Aug 2023 06:10:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+Hnwl5AEpj1gS6OFc13Q/3xg4/cjiIX4X9rbvSQrKiUGntMufGJk0lV32g6ICnw39KPiT
X-Received: by 2002:ac8:584f:0:b0:410:7ba7:3820 with SMTP id h15-20020ac8584f000000b004107ba73820mr2989163qth.13.1693487403931;
        Thu, 31 Aug 2023 06:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693487403; cv=none;
        d=google.com; s=arc-20160816;
        b=O0n6x0OWjZ0Eu5P4RIZGIfzGp8xVCqI/nd9FQXcWz43sqjjuB+OYQ50enZwS4mypSY
         Rfg+wFqaOw/4qce8e/y5hTktRpa510DMHTYeIRHHuaVA+vdA2lxoCnieKQxyqwnzkqUC
         475T99N2dXwvT4/OUcsoc9IaracMvWu/Lxc37wEKwxdc1NTr2OyVbU9+Ad1f+huISdMV
         VykePf5kLR7GIhRZrS7RJWhGXE4tCW6ORHyes29fxglW3ykvSXqc9XjDGM+JuDETCfs1
         wWMK6rgV97Po2HAgxXE79nDeX45TcbImUrNw6mnXZIXaq2C8C7aCxu3fxRyd9Iw8xKmm
         M/Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AOY5lhScsDUk1SrUusOZvTotnRVyQlmmyNHy+CfjkrE=;
        fh=yEaAeg9XL4aRWN1JcMvhdlU3mF7OCYXc6iioPF52zLM=;
        b=vzpI3b9P/5DCinffC+SxVN1MKQcWK8s0oRBN7Y1ECZsoqGXXKku9SgoMhaoXnUP5my
         wukLOiYFYrzD+8fWsA+l+doj40/pFvhl9n5DxHAjrBuT15WASCCAWkaGCJBX0Oxh13ty
         L5VZ6pSKDeTT3SAeU/EPe99KcTTEFmMWwCIq2co26Y7xeIiqV7gatw6WkqDMobvC6q9e
         Jst1KErP9Qs8/KfD9rTaZStKwbl/+VupRRt74WiaXqS/2weTrz0ZMMzdgzO1QJJtFF8V
         ZvbZF3dMjhXDbnFgppu4L1MPoBmGTEJd0SR46L9j7t1Wp5jQoBuX6VuNIn+IyuwksI+2
         pi7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eOW4g3wM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r8-20020a05622a034800b0041364fcbeb1si814541qtw.636.2023.08.31.06.10.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 06:10:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eOW4g3wM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qbhLD-0007oW-SS; Thu, 31 Aug 2023 09:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhHB-0005AD-J9
 for qemu-devel@nongnu.org; Thu, 31 Aug 2023 09:00:01 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhH4-00069n-33
 for qemu-devel@nongnu.org; Thu, 31 Aug 2023 08:59:56 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-401b3ea0656so7222545e9.0
 for <qemu-devel@nongnu.org>; Thu, 31 Aug 2023 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486784; x=1694091584; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AOY5lhScsDUk1SrUusOZvTotnRVyQlmmyNHy+CfjkrE=;
 b=eOW4g3wMK8FPQEb7fC5G9DmYgQb56ynK2grxYReUbTFHyuA7IQsRsefLGXfI3ekAyp
 1HlcSahHoj6RLWTzvVfOBp+5sqq5nJG/0PWcb525Ds3MYYgGMxIsBkvGeIn85Wx+EECi
 efAPkLpMMHKI3o8bmbiOn6SfLiB8O61v13Tw7UGbnab+MvFoM51P9b9TFLER49NDzRDW
 /iKfeWQUY9pggNFWRSKcFZCmMQyy+v4Np+uq52njn4grBvnkgAcR1KhEWyAGwloF4lU9
 zNrZAUh5es7Pn9fhKA8OqHf5QUCId6x1SMDFCOlbl1XzoXSWGhwb+HJ47zjB+z7HX8Ta
 Ac0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486784; x=1694091584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AOY5lhScsDUk1SrUusOZvTotnRVyQlmmyNHy+CfjkrE=;
 b=ARYpFj3DQ2OOl6Ov8o8b5qhmRJciMkZYNkNAwTIRXBXDcKcmbUeCNPuueDsyX5q3Rn
 FB8fGu7iw8X0PtwPjApAx7aozGGj8Vyc7zcSVFE9RVUzxnosOqvTtbWZviu/u39p53Fy
 HAgcSCPvlkOJqeiFUYy+IeDgO+SF1ARgnd6e/JxpUu79kaUsHKIvfQ/zrBoySklFkUI+
 pTfRRAKsuHCQAmyedBun9SOqdWNlTrxExj7tgk1g7brsfJZOQE5gb/9tm3e7LTYbiKjJ
 01ecgRPFtfuLhf82LQozqNoM5aZ9Vzw0xSU2HGFC8gS4vJtnAuvj0DBxBJnyDYvLuQ/V
 djSg==
X-Gm-Message-State: AOJu0YxTNpOGMh2fWYPvGiihYU//OAO6b6Pe5SijtPz0Ff9dmtn/Lt1P
 lgregCZLMbCRFJYBLT4kJBhUyf8Xc8jig5M9D7E=
X-Received: by 2002:a05:600c:2182:b0:3fd:1cfa:939e with SMTP id
 e2-20020a05600c218200b003fd1cfa939emr4481116wme.4.1693486784445; 
 Thu, 31 Aug 2023 05:59:44 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c299000b00400268671c6sm1916994wmd.13.2023.08.31.05.59.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:59:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PULL 29/41] hw/mips: spelling fixes
Date: Thu, 31 Aug 2023 14:56:31 +0200
Message-ID: <20230831125646.67855-30-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: RZRF15CwkEXy

From: Michael Tokarev <mjt@tls.msk.ru>

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20230823065335.1919380-7-mjt@tls.msk.ru>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/malta.c                 |  2 +-
 target/mips/tcg/msa_helper.c    | 12 ++++++------
 target/mips/tcg/mxu_translate.c |  6 +++---
 target/mips/cpu-defs.c.inc      |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index f9618fa5f5..16e9c4773f 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -627,7 +627,7 @@ static void bl_setup_gt64120_jump_kernel(void **p, uint64_t run_addr,
         10, 10, 11, 11 /* PIIX IRQRC[A:D] */
     };
 
-    /* Bus endianess is always reversed */
+    /* Bus endianness is always reversed */
 #if TARGET_BIG_ENDIAN
 #define cpu_to_gt32(x) (x)
 #else
diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
index c8597b9e30..c314a74397 100644
--- a/target/mips/tcg/msa_helper.c
+++ b/target/mips/tcg/msa_helper.c
@@ -803,9 +803,9 @@ void helper_msa_bset_d(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
  * | HADD_S.H      | Vector Signed Horizontal Add (halfword)                  |
  * | HADD_S.W      | Vector Signed Horizontal Add (word)                      |
  * | HADD_S.D      | Vector Signed Horizontal Add (doubleword)                |
- * | HADD_U.H      | Vector Unigned Horizontal Add (halfword)                 |
- * | HADD_U.W      | Vector Unigned Horizontal Add (word)                     |
- * | HADD_U.D      | Vector Unigned Horizontal Add (doubleword)               |
+ * | HADD_U.H      | Vector Unsigned Horizontal Add (halfword)                |
+ * | HADD_U.W      | Vector Unsigned Horizontal Add (word)                    |
+ * | HADD_U.D      | Vector Unsigned Horizontal Add (doubleword)              |
  * +---------------+----------------------------------------------------------+
  */
 
@@ -3452,9 +3452,9 @@ void helper_msa_mulv_d(CPUMIPSState *env,
  * | HSUB_S.H      | Vector Signed Horizontal Subtract (halfword)             |
  * | HSUB_S.W      | Vector Signed Horizontal Subtract (word)                 |
  * | HSUB_S.D      | Vector Signed Horizontal Subtract (doubleword)           |
- * | HSUB_U.H      | Vector Unigned Horizontal Subtract (halfword)            |
- * | HSUB_U.W      | Vector Unigned Horizontal Subtract (word)                |
- * | HSUB_U.D      | Vector Unigned Horizontal Subtract (doubleword)          |
+ * | HSUB_U.H      | Vector Unsigned Horizontal Subtract (halfword)           |
+ * | HSUB_U.W      | Vector Unsigned Horizontal Subtract (word)               |
+ * | HSUB_U.D      | Vector Unsigned Horizontal Subtract (doubleword)         |
  * | SUBS_S.B      | Vector Signed Saturated Subtract (of Signed) (byte)      |
  * | SUBS_S.H      | Vector Signed Saturated Subtract (of Signed) (halfword)  |
  * | SUBS_S.W      | Vector Signed Saturated Subtract (of Signed) (word)      |
diff --git a/target/mips/tcg/mxu_translate.c b/target/mips/tcg/mxu_translate.c
index e662acd5df..cfcd8ac9bc 100644
--- a/target/mips/tcg/mxu_translate.c
+++ b/target/mips/tcg/mxu_translate.c
@@ -2977,14 +2977,14 @@ static void gen_mxu_Q8ADD(DisasContext *ctx)
  *    to another one in XRc, with zero extending
  *    to 16-bit and put results as packed 16-bit data
  *    into XRa and XRd.
- *    aptn2 manages action add or subract of pairs of data.
+ *    aptn2 manages action add or subtract of pairs of data.
  *
  *  Q8ACCE XRa, XRb, XRc, XRd, aptn2
  *    Add/subtract quadruple of 8-bit packed in XRb
  *    to another one in XRc, with zero extending
  *    to 16-bit and accumulate results as packed 16-bit data
  *    into XRa and XRd.
- *    aptn2 manages action add or subract of pairs of data.
+ *    aptn2 manages action add or subtract of pairs of data.
  */
 static void gen_mxu_q8adde(DisasContext *ctx, bool accumulate)
 {
@@ -4056,7 +4056,7 @@ static void gen_mxu_s32sfl(DisasContext *ctx)
 
 /*
  *  Q8SAD XRa, XRd, XRb, XRc
- *    Typical SAD opration for motion estimation.
+ *    Typical SAD operation for motion estimation.
  */
 static void gen_mxu_q8sad(DisasContext *ctx)
 {
diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index 03185d9aa0..c0c389c59a 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -1045,7 +1045,7 @@ static void mvp_init(CPUMIPSState *env)
         return;
     }
 
-    /* MVPConf1 implemented, TLB sharable, no gating storage support,
+    /* MVPConf1 implemented, TLB shareable, no gating storage support,
        programmable cache partitioning implemented, number of allocatable
        and shareable TLB entries, MVP has allocatable TCs, 2 VPEs
        implemented, 5 TCs implemented. */
-- 
2.41.0

