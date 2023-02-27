Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4301249ejc;
        Sun, 26 Feb 2023 21:50:53 -0800 (PST)
X-Google-Smtp-Source: AK7set+dlAP8fPND7NO0t/alPhHo6qjsvRrWrTDRlq1Nh7zeZ/cJqcoKMIOlHBu8ErBbG7omeUeY
X-Received: by 2002:ac8:4e49:0:b0:3bf:a8cf:3096 with SMTP id e9-20020ac84e49000000b003bfa8cf3096mr33683332qtw.33.1677477053479;
        Sun, 26 Feb 2023 21:50:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677477053; cv=none;
        d=google.com; s=arc-20160816;
        b=FyjsgOYQ0vONXTENFvdf9AoRVJ+zJVpdSoLBKyl63XyXZSwzhh/XgLSRO6ooc9L8gI
         xyRgtqLQUKw50Gk+oF66larZCn0D73UZJ99gzK20tu7gvixNcSQuclJCw5nKMk0q5yTs
         b/NJ8ATR91V3+/+J/s7Z0uDWjdxzovwdvoG1AOfr4tqNR9zEdgsRwfyLHPKpp1zBMk/4
         ksown6XxB4ElW6eYJbVfNS7xiBrv/Xtkq7V8Aj+KlFJ3lwSmO4jqBdgORVuvDgBMsqyh
         WnZxacZIM7eVZjqcQfs0qRCsmje5IB7PoUYeK/SGq/lwW8mCBsNthIqgWtehyTNsWkTo
         x3pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fXCMxBWQmLHmmqt1iKjCO3RiwtMJobhj4kTdr9q0fJo=;
        b=cDkMm2uBGCNVgHF6MZ/mKKROaCi9p1eH0HUz78o43uFYszBeTBKXPLmx6vH8o+3HKM
         Mmlm4qq1WeZaBIpnqZgbXcyFupokbDt5nQp1wrrnCbyatZOmIi73c7NLnd2Gcnbo7xRw
         7PNhHehP9VFCVJKW3BbrmLiG7/qrld4bmZMTxjJoPA1YmMBqCo2x5uRGx/Fpz1wB3LxJ
         pjfXQbRfq0Qeh9km9yxlC9t8es7cQ44TAkPu3dI9arTv/o9mAQSuXBqMB2bAJTsWRoWX
         2XeEeEQNKtHPBcIRpmjWRupm0rXlqYDTre67lVrKKNT8Em1LgWoXHP0mAVvlWweraVVq
         xELg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Iytrot8C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i8-20020ac85e48000000b003bd0adc66e9si6044315qtx.244.2023.02.26.21.50.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:50:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Iytrot8C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWJT-0007iR-Lv; Mon, 27 Feb 2023 00:44:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJM-00075n-4U
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:44:32 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWJC-0005Zm-Uq
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:44:31 -0500
Received: by mail-pg1-x531.google.com with SMTP id 16so2831615pge.11
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fXCMxBWQmLHmmqt1iKjCO3RiwtMJobhj4kTdr9q0fJo=;
 b=Iytrot8CZ+x91sOgJ81SvVKzTnlb4e5C49eQ32YhiCL1b6jIwY6hVlmR5fRsxMR+1c
 QOq1fBVAA9EgKhCd516whjlNxq7oRQ3RMhA7FVVCcfY+F1vOiMXEDHTPY6q7hn+bMR8X
 wNIbm+UDhTavVxC8EBJT9L3Sk+YtgqQD4PeABJUnuPO6lYSgOT1nAMwpFEj4gAFZEN2r
 wc4pxQ6lgyxvzTfj0mh0FySJt8/vbIdh/pYRVx9Lm18lYUdP02stRIJINu5UE36T3lGv
 l9RnVpbyxcr9yv5yl2j6dPLjqyKBk+Z0DSuqdQC7YFUzLgciBo8PCSsPY0Io9+Q72Oyy
 YZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fXCMxBWQmLHmmqt1iKjCO3RiwtMJobhj4kTdr9q0fJo=;
 b=sc99wE8QvO6Kn656PoGaRGKxy3SR0IHFITATYAHR57Lx4dk1z64/hXIybuXHdu2hYV
 GD7mZ4ERJQMZSLjAXeMp41/CQM2MHZwcvcLQ6jmCPTaSsFxM7B89hjj+eeHqLfQaB57n
 sjui6no2USKLUSOFiKNHsVTcMho3RBHsMqeRRmjCDC7WF47YLrStA7J90t9DLJB3LeXq
 z9OJmRjw18jtq0Ltpu0Srwnb4rIZGUAmD3Yo5Onsr+JFUSK2bH4tJviBqm2rlUGPMYC1
 mYNvfTR+1IIZ6hXv0wKsDKjCdhrZkOprtv97lPDagbx+XKU6VQrS75B6vFspOXZyjKvw
 LkWg==
X-Gm-Message-State: AO0yUKUSscCuTIrNRXTdM3Tis8O/DMKKdqcQc8fulEoUgZ5U+Q/BKEac
 IOISJVoJRwajI2YUXEKu2zTROw==
X-Received: by 2002:aa7:9597:0:b0:5a8:4b27:5db2 with SMTP id
 z23-20020aa79597000000b005a84b275db2mr20400884pfj.1.1677476661484; 
 Sun, 26 Feb 2023 21:44:21 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:44:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 37/70] target/ppc: Avoid tcg_const_* in vmx-impl.c.inc
Date: Sun, 26 Feb 2023 19:42:00 -1000
Message-Id: <20230227054233.390271-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
X-TUID: vF+IDnm4sD2F

All remaining uses are strictly read-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate/vmx-impl.c.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index ca27c11d87..112233b541 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1624,7 +1624,7 @@ static void glue(gen_, name)(DisasContext *ctx)                         \
             gen_exception(ctx, POWERPC_EXCP_VPU);                       \
             return;                                                     \
         }                                                               \
-        uimm = tcg_const_i32(UIMM5(ctx->opcode));                       \
+        uimm = tcg_constant_i32(UIMM5(ctx->opcode));                    \
         rb = gen_avr_ptr(rB(ctx->opcode));                              \
         rd = gen_avr_ptr(rD(ctx->opcode));                              \
         gen_helper_##name(cpu_env, rd, rb, uimm);                       \
@@ -1965,7 +1965,7 @@ static void gen_vsldoi(DisasContext *ctx)
     ra = gen_avr_ptr(rA(ctx->opcode));
     rb = gen_avr_ptr(rB(ctx->opcode));
     rd = gen_avr_ptr(rD(ctx->opcode));
-    sh = tcg_const_i32(VSH(ctx->opcode));
+    sh = tcg_constant_i32(VSH(ctx->opcode));
     gen_helper_vsldoi(rd, ra, rb, sh);
 }
 
@@ -2575,7 +2575,7 @@ static void gen_##op(DisasContext *ctx)             \
     rb = gen_avr_ptr(rB(ctx->opcode));              \
     rd = gen_avr_ptr(rD(ctx->opcode));              \
                                                     \
-    ps = tcg_const_i32((ctx->opcode & 0x200) != 0); \
+    ps = tcg_constant_i32((ctx->opcode & 0x200) != 0); \
                                                     \
     gen_helper_##op(cpu_crf[6], rd, ra, rb, ps);    \
 }
@@ -2594,7 +2594,7 @@ static void gen_##op(DisasContext *ctx)             \
     rb = gen_avr_ptr(rB(ctx->opcode));              \
     rd = gen_avr_ptr(rD(ctx->opcode));              \
                                                     \
-    ps = tcg_const_i32((ctx->opcode & 0x200) != 0); \
+    ps = tcg_constant_i32((ctx->opcode & 0x200) != 0); \
                                                     \
     gen_helper_##op(cpu_crf[6], rd, rb, ps);        \
 }
@@ -2726,7 +2726,7 @@ static void gen_##op(DisasContext *ctx)       \
     }                                         \
     ra = gen_avr_ptr(rA(ctx->opcode));        \
     rd = gen_avr_ptr(rD(ctx->opcode));        \
-    st_six = tcg_const_i32(rB(ctx->opcode));  \
+    st_six = tcg_constant_i32(rB(ctx->opcode));  \
     gen_helper_##op(rd, ra, st_six);          \
 }
 
-- 
2.34.1

