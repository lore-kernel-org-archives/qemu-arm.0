Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp586047njb;
        Thu, 5 Dec 2024 19:13:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUiFVFmGVlQxtvzt+kxMdyP8F9cwK6CUoaSJYCHpihZOvwgmi+EgCxm7C02oeux9lSP+psGye4/OZIpqg==@linaro.org
X-Google-Smtp-Source: AGHT+IE4sKbyPkD9iZEyS8A2DSAchCisTBEDWndslk0lHVJ+bNVaL233ga6HFpb5NtfTwatlZiON
X-Received: by 2002:a05:620a:6009:b0:7b6:77f3:b1b0 with SMTP id af79cd13be357-7b6bcadf28amr276148985a.24.1733454783457;
        Thu, 05 Dec 2024 19:13:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733454783; cv=none;
        d=google.com; s=arc-20240605;
        b=KPAGpy9X3HvjpEXlKH0Nf0wJBLgZ/FmVkMoUH97hQ2aj332d4eUTqJh+i8R1V4kfRQ
         uZgDu/yL1VKsxhQtvnvM9scDe+5qts9efTdcF1fFoVaPO95wxP8dFDpwLFZ7WoCgj+tN
         eA1BqucxziNrW2m4tH83LVLzSzBODpoTkRXvijxfU1HZ6IdG/4AiXb3u0k8m5/8jxnKP
         SIVv1IL87hNUsrgL/dvmFzD0r2g+hXKVAGpjqx4TfmRSBKxGNFgJOiYOXgFF7qBMxduv
         aIvm2yhEr28olLuLf5lADvwQL0EOhgQylD9GoDpGFQnYuCG5GeKKGxjhaojFFz1pjfUi
         dX5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=E0jKLOU5UZBplVg49+yB8JnyalOGaPnD33fBMrjs59A=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=DWpLVyq01xitfKWQOlGV647liog5snLcxZBqgw0NLzWl3r3L4oz5/X400uhWbPuEEI
         9tPyEWqTxZ2R1jsYKy7hP+Vge7voqAaqltY2ufokh6/vsqF4KbNpS/H3aPxdzBoL2IIx
         Tgtcu0KqnusHOoISWEl4kMjy6yKp2qRONEZqRXhz7bmqXfDHtHP+4vzI670piSYHm9Ok
         cf3Gg6WOM3NHEaKq2W6YW7w3h83xPDU0B7Ho9F7cvKuzPzVADYyAm6+TFIgsG2qVOBqs
         Xp4baBLY1s1xbJBQ6J5G63lelBUIIR2EwuVJrY3076vDTVHLpU3vuTPwoV6BQukQjAzY
         oz7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DFYheKuv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5aaab3fsi221663185a.377.2024.12.05.19.13.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 19:13:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DFYheKuv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJOll-0006p7-VQ; Thu, 05 Dec 2024 22:12:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJOli-0006nd-Ta
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 22:12:38 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJOlh-0004Rq-1J
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 22:12:38 -0500
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-71d4fceec9aso413446a34.3
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 19:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733454756; x=1734059556; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E0jKLOU5UZBplVg49+yB8JnyalOGaPnD33fBMrjs59A=;
 b=DFYheKuve0FNnZxOsaQz53EvEEtuPSQlCy3Xtul4Ub3IhxPyvoKJtUiXLQq3wTXUQO
 z5OFbjpc3C4jHANVvM9ox/JgYyd3qAoAkGVobuxulZgQcyzD4E4RWdHsGd6rnOSgAlJx
 8KN6/BdcmiDdXs1sF0t4Rn5ySdxMUzozOiPFcIjJFQP2YLNXLnsPNkQIo3K7KSLe7gXx
 8mw54aG6e1lE0sqXuswHNyQTLilaQU2bmNnfTL0M9GaA7WH00/C433RvSP7sN79+LlHm
 MPyy5r6wbw5aV64pHC3JVoiw01bmC9c429/NHX5x/ddM0dLhjG4A90qQLe6b4Dl23a40
 Gw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733454756; x=1734059556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E0jKLOU5UZBplVg49+yB8JnyalOGaPnD33fBMrjs59A=;
 b=WPqIyJf6as0Qvy/o/Irp3nLhgRQJL9cEkOvCFK6fbHwMrY55mq0pwUSUMjbHm9+qsd
 KVzSNTi7MfUEwNVC/sFHueBfTg7eY3dh/MNz9HGnHQIgr2XOt/YSqoSDRr3f+0Jei+Sl
 CMSWeDbuR1luzStD2YuIv2XFSpGG68iONc4vKFLSZpLbNc+RrNNBG3NIK16d3EM0FNeg
 trE5igyQngPhPR9MUI3kDlLDUJNfM0TMz1N8eMjBwzzy8HC2G7fVjN5ZBqqmeJxAxUwi
 UpzNB4WnAyjWSG4BPvHldytQVAjgBkXAUyIlnwZg0SZEFZEHWfYibERLkV1uhWtakT0+
 oDDw==
X-Gm-Message-State: AOJu0YxdfOYQQ1YRQkJHxEjd39p5voZz8n08jE1Ik91Kv1WnOYqy4RN8
 pR4P6RLHT1TmVQuGmMOtPRkxLTYT/RC7W2B14wjYpxw00hw1G3V3ZVw//9+f/GkaXayT1ZaoRzn
 pRTmTdsjw
X-Gm-Gg: ASbGnctZun/2h70s8a28xNcVPOQTr9I5i8iO0zCv63Clc54A4vHczwPlJSgZIx0pfkZ
 JEHZnJ3fRHdqq6jwJEyivtEYBbODnMWJAWNHd/YGH1XIlI10a8cilbDkPAvgFnYA034CfZFdjid
 Ul8NzlGebxl/+4oVkDyuQSH5n55gNm31hDhmN6xhFIMn4c4qYF5wu7jit7EHkqj0MR6S94tLsG4
 Tx+fkMCoZCtJDKc2SI+hDbaGugTzEG6V8piaivNh4It0dTYc2ihfWGmYCZvQtNzs+FE9si6bIlS
 ajbfe+BV6WGLjbRBqYrUipb7NETlVYVJJJ9j
X-Received: by 2002:a05:6830:2a06:b0:703:7827:6a68 with SMTP id
 46e09a7af769-71dcf4f54a1mr838502a34.6.1733454755982; 
 Thu, 05 Dec 2024 19:12:35 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71dc493b2dfsm596442a34.9.2024.12.05.19.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 19:12:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 5/9] target/arm: Convert neon_helper.c to fpst alias
Date: Thu,  5 Dec 2024 21:12:20 -0600
Message-ID: <20241206031224.78525-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241206031224.78525-1-richard.henderson@linaro.org>
References: <20241206031224.78525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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
X-TUID: v2vmhtLjQhYn

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h          | 14 +++++++-------
 target/arm/tcg/neon_helper.c | 21 +++++++--------------
 2 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 3e78b90658..db8b8dc748 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -428,13 +428,13 @@ DEF_HELPER_FLAGS_2(neon_qneg_s16, TCG_CALL_NO_RWG, i32, env, i32)
 DEF_HELPER_FLAGS_2(neon_qneg_s32, TCG_CALL_NO_RWG, i32, env, i32)
 DEF_HELPER_FLAGS_2(neon_qneg_s64, TCG_CALL_NO_RWG, i64, env, i64)
 
-DEF_HELPER_3(neon_ceq_f32, i32, i32, i32, ptr)
-DEF_HELPER_3(neon_cge_f32, i32, i32, i32, ptr)
-DEF_HELPER_3(neon_cgt_f32, i32, i32, i32, ptr)
-DEF_HELPER_3(neon_acge_f32, i32, i32, i32, ptr)
-DEF_HELPER_3(neon_acgt_f32, i32, i32, i32, ptr)
-DEF_HELPER_3(neon_acge_f64, i64, i64, i64, ptr)
-DEF_HELPER_3(neon_acgt_f64, i64, i64, i64, ptr)
+DEF_HELPER_3(neon_ceq_f32, i32, i32, i32, fpst)
+DEF_HELPER_3(neon_cge_f32, i32, i32, i32, fpst)
+DEF_HELPER_3(neon_cgt_f32, i32, i32, i32, fpst)
+DEF_HELPER_3(neon_acge_f32, i32, i32, i32, fpst)
+DEF_HELPER_3(neon_acgt_f32, i32, i32, i32, fpst)
+DEF_HELPER_3(neon_acge_f64, i64, i64, i64, fpst)
+DEF_HELPER_3(neon_acgt_f64, i64, i64, i64, fpst)
 
 /* iwmmxt_helper.c */
 DEF_HELPER_2(iwmmxt_maddsq, i64, i64, i64)
diff --git a/target/arm/tcg/neon_helper.c b/target/arm/tcg/neon_helper.c
index c687e882ad..99fbebbe14 100644
--- a/target/arm/tcg/neon_helper.c
+++ b/target/arm/tcg/neon_helper.c
@@ -1180,51 +1180,44 @@ uint64_t HELPER(neon_qneg_s64)(CPUARMState *env, uint64_t x)
  * Note that EQ doesn't signal InvalidOp for QNaNs but GE and GT do.
  * Softfloat routines return 0/1, which we convert to the 0/-1 Neon requires.
  */
-uint32_t HELPER(neon_ceq_f32)(uint32_t a, uint32_t b, void *fpstp)
+uint32_t HELPER(neon_ceq_f32)(uint32_t a, uint32_t b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
     return -float32_eq_quiet(make_float32(a), make_float32(b), fpst);
 }
 
-uint32_t HELPER(neon_cge_f32)(uint32_t a, uint32_t b, void *fpstp)
+uint32_t HELPER(neon_cge_f32)(uint32_t a, uint32_t b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
     return -float32_le(make_float32(b), make_float32(a), fpst);
 }
 
-uint32_t HELPER(neon_cgt_f32)(uint32_t a, uint32_t b, void *fpstp)
+uint32_t HELPER(neon_cgt_f32)(uint32_t a, uint32_t b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
     return -float32_lt(make_float32(b), make_float32(a), fpst);
 }
 
-uint32_t HELPER(neon_acge_f32)(uint32_t a, uint32_t b, void *fpstp)
+uint32_t HELPER(neon_acge_f32)(uint32_t a, uint32_t b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
     float32 f0 = float32_abs(make_float32(a));
     float32 f1 = float32_abs(make_float32(b));
     return -float32_le(f1, f0, fpst);
 }
 
-uint32_t HELPER(neon_acgt_f32)(uint32_t a, uint32_t b, void *fpstp)
+uint32_t HELPER(neon_acgt_f32)(uint32_t a, uint32_t b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
     float32 f0 = float32_abs(make_float32(a));
     float32 f1 = float32_abs(make_float32(b));
     return -float32_lt(f1, f0, fpst);
 }
 
-uint64_t HELPER(neon_acge_f64)(uint64_t a, uint64_t b, void *fpstp)
+uint64_t HELPER(neon_acge_f64)(uint64_t a, uint64_t b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
     float64 f0 = float64_abs(make_float64(a));
     float64 f1 = float64_abs(make_float64(b));
     return -float64_le(f1, f0, fpst);
 }
 
-uint64_t HELPER(neon_acgt_f64)(uint64_t a, uint64_t b, void *fpstp)
+uint64_t HELPER(neon_acgt_f64)(uint64_t a, uint64_t b, float_status *fpst)
 {
-    float_status *fpst = fpstp;
     float64 f0 = float64_abs(make_float64(a));
     float64 f1 = float64_abs(make_float64(b));
     return -float64_lt(f1, f0, fpst);
-- 
2.43.0

