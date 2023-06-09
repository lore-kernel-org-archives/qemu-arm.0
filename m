Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp105302ejb;
        Thu, 8 Jun 2023 19:31:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ663woIw1DRrnOdCEX84BCcBfjA6n6GVBvz0zQKG4wK+0VQXXOCdmV1PZujA36RRlTz3ZZ4
X-Received: by 2002:a05:620a:8b0f:b0:75b:23a1:3678 with SMTP id qw15-20020a05620a8b0f00b0075b23a13678mr6619756qkn.57.1686277868767;
        Thu, 08 Jun 2023 19:31:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686277868; cv=none;
        d=google.com; s=arc-20160816;
        b=xwphqDGhx1B5912uaxfyOJcX+btigBgLoH7RjhSaNi8p6LycVZCV/Ai8FilKAUB/7K
         oY+p7ttsB13TbQZATnn5GjI2fpakIsag5BvJtHwphZDio5MW+mnQbxhfleGShw0wP9ta
         TtZWGkxwEIJnnYsIm3GfnEBY3emvv/HV6WWVb4U9Om47nvBAI0nCPhzlgwx68p53wm5i
         MOjMs99+RUdd+D2+bnmTk00Of3ZNdFuBvgCwIv25+4odukrLivT02VCzAfDqaj0yq7xJ
         w1EvoSrKYcEb8SAhxszqxgt/YpRyrZkNm34/FNh4PE+Y/i+yKxmhiiJoXpaFXM7Xe4DG
         JYfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GHeF3JWLCWlD48DcYvVGojmVS0x5PfQCVoIO1xTMCXo=;
        b=zzTGI1zjg7IofGa2BMWmSM/Hj98n9RGjad0jWw8180ObwR/QDVVejxPKIEJ9H+zr6N
         NK8832s8eTq/QfGDbJnJT7s2JcAGjdbC5ZIjAWtjgca+hpzOSEl093EpsGKpAdKmXwew
         2afx5P9hbHB6f4P+/QxPVoCjJ/bIU4ntw4uZ+aT9rLb4NDQovnMUsnToLsZif+vyW1uy
         UdwN4Hz5sOhxHwg88rksJbWNHHm16yOMtrv6A+AvULzJhppps3Hb8rqKTDgu86FphZrX
         KJ92Bq87M8jxIUYiJ0r/NJZA+lTktW+33brXM5tleOI8H4s1vVYgC+JuZKbf68K6lByi
         jYWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ezDLsu1v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15-20020a05620a15ef00b007594a88de3esi1565152qkm.27.2023.06.08.19.31.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 19:31:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ezDLsu1v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q7RpL-0006uv-IL; Thu, 08 Jun 2023 22:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RoX-0003NR-Pp
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 22:25:21 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rnm-0005nj-M3
 for qemu-devel@nongnu.org; Thu, 08 Jun 2023 22:25:21 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-650352b89f6so989087b3a.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jun 2023 19:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277473; x=1688869473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GHeF3JWLCWlD48DcYvVGojmVS0x5PfQCVoIO1xTMCXo=;
 b=ezDLsu1vdM8a71QXEj0oFRJcSZ+yNmxoRzb2rgxmfuncQv3t0Aae5KM0OUuQXbYk0g
 5WOgvP3Ykw7zOdu/x3ywuZsCdWlhXhZQxx2jqHz9/7FTdVF2XjdfzkE3fE4c41B/zWfQ
 Z1ZE63+kroLKrxygolLrErXZaK1XKTmKABPVvtQ7mbRmZT7GqRNkMhiSF8k0Ca6y8LnF
 MkbnGMhde2rL3im3uBd0eYnwPP+NE008LcEntHkoYjhNGGiWNn6yOnfajJqydtQDlVlA
 oU8tNrIMzMYe5Itj42nJSTT/m4pYWr6eG1PsiQSwfhf+g1Om/Q+arvr6vHyjoUoG3fAY
 B0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277473; x=1688869473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GHeF3JWLCWlD48DcYvVGojmVS0x5PfQCVoIO1xTMCXo=;
 b=itzRUs/xMyLTEicYNraTljIyJnhI/XdZZ9C8yXbty6yqYDjJ8zgGANX0nXW/7CQpof
 PQ234K2wrVRqqRoyAS4tMo2daOILg/UAnSCKr/6Bbj5yF1aLQmiCLQfb6y+wLbJo6h3z
 uV5onr793EmwM6NIGhML8XEN/+Q0/b563uCekQ645nfcCe7FBSkO5qrrixpoXFbEfqaj
 Vx4LgELInVKClaxnZp6gV55ElnTUxw9nfzcVXhNEvuBP7CycwFBnI+cga+WYguAr0/z+
 STH4EDWx603eDOHoElbUmvIPPjO6kDYyEWM1f+hDaFBvQ5nYBQ5yLss9NpwEly17cm9U
 3Ivg==
X-Gm-Message-State: AC+VfDxaI3BUFLTJNLLqNK9Qf0jEJI/Uyt65d3kOGLYoIrhkp3WX6Rck
 LH5EqW4uawQCskLbHQI4AQ7t6bJekTcXwkCXYvo=
X-Received: by 2002:a05:6a00:22d1:b0:65b:351a:e70a with SMTP id
 f17-20020a056a0022d100b0065b351ae70amr7707542pfj.29.1686277473382; 
 Thu, 08 Jun 2023 19:24:33 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 33/38] crypto: Implement aesdec_IMC with AES_imc_rot
Date: Thu,  8 Jun 2023 19:23:56 -0700
Message-Id: <20230609022401.684157-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: +9DrnEnjdAiZ

This method uses one uint32_t * 256 table instead of 4,
which means its data cache overhead is less.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 crypto/aes.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/crypto/aes.c b/crypto/aes.c
index 7b8a22fe3e..4da2cd7077 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -1446,39 +1446,39 @@ aesdec_IMC_swap(AESState *r, const AESState *st, bool swap)
     bool be = HOST_BIG_ENDIAN ^ swap;
     uint32_t t;
 
-    /* Note that AES_imc is encoded for big-endian. */
-    t = (AES_imc[st->b[swap_b ^ 0x0]][0] ^
-         AES_imc[st->b[swap_b ^ 0x1]][1] ^
-         AES_imc[st->b[swap_b ^ 0x2]][2] ^
-         AES_imc[st->b[swap_b ^ 0x3]][3]);
-    if (!be) {
+    /* Note that AES_imc_rot is encoded for little-endian. */
+    t = (      AES_imc_rot[st->b[swap_b ^ 0x0]] ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0x1]], 8) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0x2]], 16) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0x3]], 24));
+    if (be) {
         t = bswap32(t);
     }
     r->w[swap_w ^ 0] = t;
 
-    t = (AES_imc[st->b[swap_b ^ 0x4]][0] ^
-         AES_imc[st->b[swap_b ^ 0x5]][1] ^
-         AES_imc[st->b[swap_b ^ 0x6]][2] ^
-         AES_imc[st->b[swap_b ^ 0x7]][3]);
-    if (!be) {
+    t = (      AES_imc_rot[st->b[swap_b ^ 0x4]] ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0x5]], 8) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0x6]], 16) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0x7]], 24));
+    if (be) {
         t = bswap32(t);
     }
     r->w[swap_w ^ 1] = t;
 
-    t = (AES_imc[st->b[swap_b ^ 0x8]][0] ^
-         AES_imc[st->b[swap_b ^ 0x9]][1] ^
-         AES_imc[st->b[swap_b ^ 0xA]][2] ^
-         AES_imc[st->b[swap_b ^ 0xB]][3]);
-    if (!be) {
+    t = (      AES_imc_rot[st->b[swap_b ^ 0x8]] ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0x9]], 8) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0xA]], 16) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0xB]], 24));
+    if (be) {
         t = bswap32(t);
     }
     r->w[swap_w ^ 2] = t;
 
-    t = (AES_imc[st->b[swap_b ^ 0xC]][0] ^
-         AES_imc[st->b[swap_b ^ 0xD]][1] ^
-         AES_imc[st->b[swap_b ^ 0xE]][2] ^
-         AES_imc[st->b[swap_b ^ 0xF]][3]);
-    if (!be) {
+    t = (      AES_imc_rot[st->b[swap_b ^ 0xC]] ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0xD]], 8) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0xE]], 16) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0xF]], 24));
+    if (be) {
         t = bswap32(t);
     }
     r->w[swap_w ^ 3] = t;
-- 
2.34.1

