Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146E7CAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 09:42:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0d0t-0004mx-CL; Mon, 22 Sep 2025 05:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czi-0002UJ-9i
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 05:38:06 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czC-0000fh-Dv
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 05:38:01 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45f2c9799a3so30982225e9.0
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 02:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758533844; x=1759138644; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1iOqbIE2K4YSn24nejTWVSAedyV/jyzH66EOGDnjiAU=;
 b=C6RdRDhhZjUh8/0q/UifG+yJmpMyFxPToMKDssfXrAcXBu4qzMVaGr7xqNAwuQ1L57
 6iBBcD3xluqjxxgyr1uGFa5OyNd48yNCYpNRNUZezseNELGVCRknGpPt8Re3KChzpIfa
 81VCqpkt5dIyTDKB0/APHBpmKyh+kIw9ccfav4PNpETa/MvOWcBHl18t5H05SYi2Hgv7
 LED7dY+Q094d74kG8vdccHJk+JiMpPlhfkv4gBGwlACDvoEEvpeOcVkw2E33NDcbBbGO
 /w2Kz+rkTQ+g8XdNKBuBC0t6HVtpSi5Ee4ll7CvRCZeKAhCh/S7GipQSmRjnL7Jffh7p
 mBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758533844; x=1759138644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1iOqbIE2K4YSn24nejTWVSAedyV/jyzH66EOGDnjiAU=;
 b=q8etoUYY8CLUvn0gWu+1A9SE3f8vjBi3Juh0JWwUzk7w8dztnwkJfqm+K6bKhKKv4R
 7yBkBAmIy/Okzj+wQl3h6wU/bHROMZGC0MrMgBtF8zQL/w/z3KIVxfH+7BuMO4xhQFoO
 2wDlrc1X4dAsXCGfl+OcFAW2lGpsXdhJUSLF/oKJzU9AuvOtTkPVSA6kBCjWlN9b2Gj5
 MYYYdGb9+ZFrlz5niW5m+K2nmYeVIjTwdCR9OEOUeTTMQgsojXMjnrjy1QYt1qIqyn9+
 poFl7DWuaC57rEEqsynAWiOMj/H5jUE/vISPAQK6qG3bxN6nPKo/h7QnEvgbKEEvcaZ1
 aNRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWivtV+I3iQ6HNfiDmJ8nbEnMxoNSAoc4TPd+va+isGbLn884vtQ6wqsCP1mhCmVaACcSerm5J+VA==@nongnu.org
X-Gm-Message-State: AOJu0YztpfpNAJ6c33b5wBRbKBOdIrWvR//0RKhEyrVBs1ur8kQNUubv
 drKj/6nLVgZl6YCFA8s9csWqbgWLmNbzclYuZJt5BWT6Y4f2qjpCHxbU6aWUbiNlqZM=
X-Gm-Gg: ASbGncsp6NkuCSMQnBYR4tMbr0KFAIG5Wnk47O8lfVzCrzdof4CyCYz20yL7MXIoTI0
 HylC/R3XNZzvTWIDvaCQgdNb9HiqAfDfCX7W/nENLR52HlsrAvSwQWpOSgE8SAmzRejgH/UuVLU
 I73pBv6SnsAojmmWEiQCS5qq5UE0Tm5BuZWLl6uyngmN58KG/84MGayp6hDmXgoOtO6zzaYRHuN
 WHlkivl7nThW9cacqiFoEPWtM6OLV1rcK22WwJtHv/Gbucze2oHsrz2KMlA9K3TptAm1mNmKfZz
 lif6XnbA++D3T2sPuFYVKPyYSjoNesNeZNdOa9wHa+iMVT2MNz7xlB5SpfCCHdKSZgvT8W+kEZM
 Bk5D/L2y7wGHCBSC4tW5B/Tg=
X-Google-Smtp-Source: AGHT+IFkZwvxSmVDmxgSasMbzlLFLbhVkG8wbrFW9ZSpxWsVrcMe5RBVXVH9Wp5gPkJf08/UW7+0Xw==
X-Received: by 2002:a05:600c:3b11:b0:45d:d5fb:185b with SMTP id
 5b1f17b1804b1-467eaf51178mr99398715e9.20.1758533844252; 
 Mon, 22 Sep 2025 02:37:24 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613d42bee6sm241384845e9.15.2025.09.22.02.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:37:17 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3896B5F9F7;
 Mon, 22 Sep 2025 10:37:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 07/25] semihosting/arm-compat-semi: change
 common_semi_sys_exit_extended
Date: Mon, 22 Sep 2025 10:36:52 +0100
Message-ID: <20250922093711.2768983-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922093711.2768983-1-alex.bennee@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

We now check only is sys_exit is extended.
This allows to break dependency to TARGET_SYS_EXIT_EXTENDED which will
not be available anymore from this code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20250822150058.18692-5-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/common-semi-target.h   | 4 ++--
 target/riscv/common-semi-target.h | 4 ++--
 semihosting/arm-compat-semi.c     | 3 ++-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/arm/common-semi-target.h b/target/arm/common-semi-target.h
index da51f2d7f54..7bb442f24ca 100644
--- a/target/arm/common-semi-target.h
+++ b/target/arm/common-semi-target.h
@@ -34,9 +34,9 @@ static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
     }
 }
 
-static inline bool common_semi_sys_exit_extended(CPUState *cs, int nr)
+static inline bool common_semi_sys_exit_is_extended(CPUState *cs)
 {
-    return nr == TARGET_SYS_EXIT_EXTENDED || is_a64(cpu_env(cs));
+    return is_a64(cpu_env(cs));
 }
 
 static inline bool is_64bit_semihosting(CPUArchState *env)
diff --git a/target/riscv/common-semi-target.h b/target/riscv/common-semi-target.h
index 7c8a59e0cc3..ba40e794dcc 100644
--- a/target/riscv/common-semi-target.h
+++ b/target/riscv/common-semi-target.h
@@ -25,9 +25,9 @@ static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
     env->gpr[xA0] = ret;
 }
 
-static inline bool common_semi_sys_exit_extended(CPUState *cs, int nr)
+static inline bool common_semi_sys_exit_is_extended(CPUState *cs)
 {
-    return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 8);
+    return sizeof(target_ulong) == 8;
 }
 
 static inline bool is_64bit_semihosting(CPUArchState *env)
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index a239cfc5a9d..26263a06b7a 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -755,7 +755,8 @@ void do_common_semihosting(CPUState *cs)
     {
         uint32_t ret;
 
-        if (common_semi_sys_exit_extended(cs, nr)) {
+        if (nr == TARGET_SYS_EXIT_EXTENDED ||
+            common_semi_sys_exit_is_extended(cs)) {
             /*
              * The A64 version of SYS_EXIT takes a parameter block,
              * so the application-exit type can return a subcode which
-- 
2.47.3


