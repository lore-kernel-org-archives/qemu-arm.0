Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp697426ejx;
        Tue, 22 Aug 2023 05:54:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFL75ymACUky5VzUcem+1RF8t3cKt2L7oJhQdEuCYd4dDu8YbDCIEz1GsneXfzZd9Tam+T5
X-Received: by 2002:a05:622a:2cf:b0:410:a39d:767e with SMTP id a15-20020a05622a02cf00b00410a39d767emr2771673qtx.25.1692708841845;
        Tue, 22 Aug 2023 05:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692708841; cv=none;
        d=google.com; s=arc-20160816;
        b=Oc3tjyt2JBIrZ4K3ieZXcnPMrRPmpQzwXxtn7fiRwsKXfb4xVA/t4Zc7+ppfwEVWGt
         iaMhKM6dmX1XQvZpPegImLhyjKNYDZmiZH3tfohnCPwHWyBm6xbscgNmzDpl8Nzen8i/
         eRNa1oLv7u7pY5F2ZgsHArALxq9R+2CVR+ouF+K1K1UAtpwsByzLX3EaSr0kNq+L3zAa
         nn8onq0b6DKndyyiiBcWcbj4fzHJkZkHYLow9zGGp3XkDEwBtndrBJyUrHCBu23UKYpJ
         acdBP6wqr2YY9iE3dDqsEOfqmicMJlEp0vLkdL5+M3Pi2FkhAEmJI35mnoXLBq8PuKUA
         v8cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Icl2oC8GOqjO24t8EWhlRVld/KcOgjsSN5YvmxZ62js=;
        fh=WTNzBzBWhI6YyLjiFd1Gx/+Ggetq/7tfVgf3EfLcLKA=;
        b=J66wAbgOBhImpsqWeZDd4P5Jr065x8zgGYECfsNtUZxB9I5SPpv7lCOBai5LfpaaAD
         FfLuvj4kLojdohKCBB5uViudRgi+LOQih44QzCRsWv9duf5fnZE3GRVcYyA+aczf0NiX
         2Q/7/a4w3NxoFYpUDrmKcvkJB+gmsh2psE8UYkqkLF6mNurufqqKQdJljWY+BixCARC/
         nS37CjA6X31WetKf5GZeIwFZTLl5fxuvYw4EdHUsSwbeMqZItbZF3l6fPKb1O8pXzx9F
         5qhuFmDUIB3wIxhwIragmKh+5mLGdDn9lUO8HWdYaPeM2JXZ9rCbUgtUul4KgiGsDhBN
         Xx3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gp9lX3VD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u22-20020a05622a011600b004037afac769si6094540qtw.303.2023.08.22.05.54.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 05:54:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gp9lX3VD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYQtE-0002Zv-8D; Tue, 22 Aug 2023 08:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYQtC-0002Yw-AT
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 08:53:42 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYQtA-0001x1-0c
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 08:53:42 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fef56f7222so13242365e9.2
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 05:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692708818; x=1693313618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Icl2oC8GOqjO24t8EWhlRVld/KcOgjsSN5YvmxZ62js=;
 b=Gp9lX3VDoXX35GM5xyhu2PCd9ow6FOVUajl8oZz8OU/Dsya/BMC4kUvSTeAE/VS5II
 ftoxjDg2l5GvP0Va7K9DJefDdfD3F0TVxt+BN9Jx+qf4lUi0KrZQIzognPu81wg9docv
 uBwmQb2BWFweD+vKAWBxftuv1CJaWRE/cMxeb/Xk2r7els4pEa+xOdcifHReIgDqQEhk
 rrvx89ojQyr0UxWmm5XSUQIIZLPI0huQMYJw6AREQDC6oF0U6jn3MnK2pH4myMbn2RFm
 /IkqfVm3etK8Y/p2xgBsGU7jKJGbditWvzQvjWlALqayN+dooyUGYG7dEOVdsSztUPr7
 KKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692708818; x=1693313618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Icl2oC8GOqjO24t8EWhlRVld/KcOgjsSN5YvmxZ62js=;
 b=ZqN45hN6s2wabUiNbkntfnLkALnyZ/xQQ1Fhl05k2TsWhDjpLNMbr1DPKbWnhbGOjI
 RKaHWQbybK2vvc60BuZWAQAtZCjH5l+d9DGkAziCzv4hD39u+qZH8ngnaTQG0yUhbXOo
 5XCQiMGsnNZvMfDrYSg1EYaZT9viH14fTsIooOH70hUox18e0s5lJIu3ym5iHvE7LWGM
 sD4zCB8uQDZUdgqvyaWGNIzE9wTiJ4KUu48rjquk8akSMaHkqI8abUYaAp6U6oC1FsZP
 6awDrHPUFk9G+K448g9e67wyrHNr1HeDbovU+19p+hJ8vNWpQ58wGdxqtZUKeudGHQhB
 8laA==
X-Gm-Message-State: AOJu0YyNalLuS+3ZldsSm2paD9ByW5aYCzgZKTS812KRLUaFgjR5hqYB
 PT0hIbNKF5CMTVSwDDZ6sOSVUw==
X-Received: by 2002:a05:600c:20a:b0:3fe:603e:7fd2 with SMTP id
 10-20020a05600c020a00b003fe603e7fd2mr7165320wmi.0.1692708818329; 
 Tue, 22 Aug 2023 05:53:38 -0700 (PDT)
Received: from localhost.localdomain ([37.19.214.4])
 by smtp.gmail.com with ESMTPSA id
 x20-20020a05600c2a5400b003fef60005b5sm3426261wme.9.2023.08.22.05.53.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Aug 2023 05:53:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/12] target/ppc: Use generic hrev64_i64() in BRH / BSWAP16x8
 opcodes
Date: Tue, 22 Aug 2023 14:53:31 +0200
Message-ID: <20230822125332.55086-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822124042.54739-1-philmd@linaro.org>
References: <20230822124042.54739-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: lRTCKrkT2aOI

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/translate.c              | 10 +---------
 target/ppc/translate/vsx-impl.c.inc | 19 ++-----------------
 2 files changed, 3 insertions(+), 26 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 74796ec7ba..91a9ec2d1c 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6435,15 +6435,7 @@ static void gen_brw(DisasContext *ctx)
 /* brh */
 static void gen_brh(DisasContext *ctx)
 {
-    TCGv_i64 mask = tcg_constant_i64(0x00ff00ff00ff00ffull);
-    TCGv_i64 t1 = tcg_temp_new_i64();
-    TCGv_i64 t2 = tcg_temp_new_i64();
-
-    tcg_gen_shri_i64(t1, cpu_gpr[rS(ctx->opcode)], 8);
-    tcg_gen_and_i64(t2, t1, mask);
-    tcg_gen_and_i64(t1, cpu_gpr[rS(ctx->opcode)], mask);
-    tcg_gen_shli_i64(t1, t1, 8);
-    tcg_gen_or_i64(cpu_gpr[rA(ctx->opcode)], t1, t2);
+    tcg_gen_hrev64_i64(cpu_gpr[rA(ctx->opcode)], cpu_gpr[rS(ctx->opcode)]);
 }
 #endif
 
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 0f5b0056f1..639ab7f1bc 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -154,23 +154,8 @@ static void gen_lxvdsx(DisasContext *ctx)
 static void gen_bswap16x8(TCGv_i64 outh, TCGv_i64 outl,
                           TCGv_i64 inh, TCGv_i64 inl)
 {
-    TCGv_i64 mask = tcg_constant_i64(0x00FF00FF00FF00FF);
-    TCGv_i64 t0 = tcg_temp_new_i64();
-    TCGv_i64 t1 = tcg_temp_new_i64();
-
-    /* outh = ((inh & mask) << 8) | ((inh >> 8) & mask) */
-    tcg_gen_and_i64(t0, inh, mask);
-    tcg_gen_shli_i64(t0, t0, 8);
-    tcg_gen_shri_i64(t1, inh, 8);
-    tcg_gen_and_i64(t1, t1, mask);
-    tcg_gen_or_i64(outh, t0, t1);
-
-    /* outl = ((inl & mask) << 8) | ((inl >> 8) & mask) */
-    tcg_gen_and_i64(t0, inl, mask);
-    tcg_gen_shli_i64(t0, t0, 8);
-    tcg_gen_shri_i64(t1, inl, 8);
-    tcg_gen_and_i64(t1, t1, mask);
-    tcg_gen_or_i64(outl, t0, t1);
+    tcg_gen_hrev64_i64(outh, inh);
+    tcg_gen_hrev64_i64(outl, inl);
 }
 
 static void gen_bswap32x4(TCGv_i64 outh, TCGv_i64 outl,
-- 
2.41.0

