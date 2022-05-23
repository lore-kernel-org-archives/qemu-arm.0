Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3762180lfh;
        Mon, 23 May 2022 14:06:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxr/AwOGzxLfDH+eJ6P1RUMezGGaw8VoyU9qzHTbh8F4LtImfmKhbUPvNVCNyEqi4K/xFvO
X-Received: by 2002:a05:622a:10d:b0:2f3:cf99:1d29 with SMTP id u13-20020a05622a010d00b002f3cf991d29mr17876561qtw.549.1653339984354;
        Mon, 23 May 2022 14:06:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653339984; cv=none;
        d=google.com; s=arc-20160816;
        b=wO9d3JVVNCsqDUGjCqlse82qWGrWYtPJFbuQEP1P59qcX9LIm1nAMeGfDsdvJgbWJx
         5dInsjAsM/u5rZ4+51acke/flAgKGfDR/Fxm+AdSjboCHhzG6qNaJxoDgrLaIbD0uIa3
         CIUsvLQB1SfUjGQO7h62T+u+DjDVoaAbmCPBH1oqD4imsbQ6HFA0nnqsOgpdUJKF8BRk
         B7VnwjDAUPaGI1PYoxTwmWgQZfaPZp10fBgz5iRE1X2qupDLjHYUgOA0RiCUDSKCr7uB
         6S6IqmjRhXve/O1j9ABydSCsBELoAt6vJqkLlztHQMM1LbWpuPJLy9ibJbkPeqvixXfh
         5G4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XRiK/19DWWGa+NhpLf6AkOpMmSAQF90yzy5A4YWSxoA=;
        b=vZmfl4wZiS4FETYt7yaDekxkd/dS20+D0zisodRVrDsVeiqunag35LZeIyCQ9zg240
         qGB2JhfrMpVOiXRSq9BLRL9B4acVgKiV+TC9dXkfgTf7KMh6yGj6Btvqf9vpwErH8SpB
         Q43bTkHZity/NXfGocsNp/mjuwfokLd2dQa4tkC6XYfKKJVOljRHFAGjPpt14dshAt08
         ORG1+4PGfvo20H8pB8BfQj3UvqGgbUPlbdbujkfL8zhgG0M8Ft43ouB2ozXx0t1gsn+s
         9LvRRIHbuQJnSAfhfqRRGeI8uRFAh28TaIyqy5AMAZigu1uebEyhiFJ8tbQLldrIZFw7
         DvwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bV1DuWmD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z11-20020a05620a08cb00b006a3622a845asi2823528qkz.217.2022.05.23.14.06.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 May 2022 14:06:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bV1DuWmD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntFFs-0006T2-WF
	for alex.bennee@linaro.org; Mon, 23 May 2022 17:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEyE-0000J6-VS
 for qemu-arm@nongnu.org; Mon, 23 May 2022 16:48:07 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:55891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy8-00051m-78
 for qemu-arm@nongnu.org; Mon, 23 May 2022 16:48:06 -0400
Received: by mail-pj1-x102a.google.com with SMTP id n10so15049984pjh.5
 for <qemu-arm@nongnu.org>; Mon, 23 May 2022 13:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XRiK/19DWWGa+NhpLf6AkOpMmSAQF90yzy5A4YWSxoA=;
 b=bV1DuWmDQX1KtqbaHwYK5B8unjJu2sgSW46SqRdrxw1aicb3i+5xmfABZ5X5y4pro+
 F67JlpL8zNt9W6ibowHIaMvHlTxLAurv7+yaSLzemOSp570hBwBUmDnLQJwUKbXzl9/2
 cpVwtNzkjja/GvjS5tnbfpJu2BtZvNtDJ9lnNUBQXJEghxxnqnin2wW8u4dxO9IURHKl
 JXgOLNqEnXMVXoYlLT8XayYcYjt0UvQtgX9QNNjj8TlIJaMmCfEQFgJRIbjbNtVvxRiZ
 vSvvQY28lFzonPHBG1dM7nOEbNCm7dz4pfRg7tjY/0CoyKh7f7yNu+qGXxfKhpAOW2Co
 diiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XRiK/19DWWGa+NhpLf6AkOpMmSAQF90yzy5A4YWSxoA=;
 b=EvcmgCOwXEanOts1PMXTcbKa0MCi1JVicIn1SgSgbaE/i4CjWbGNLZU9FIE0646GZk
 0Q63p1O5aSlRSJie/xFGNZoG6M5VxCJO+8ZZJruGApvjfCBl2196ACeIGJgyvwOlkcS5
 d5SMC8cS5DerNnYQlaG+8Sc8/OovhU4bB9vF0KuWVxmxWXh1oQS5n1Oo2LCBObRClgHT
 UfhLa3rqBUoKczVcG+nFxH9XTgYq6gKXRzC3cS3/qF41fSkB1SwzUrnuADqJ9ygahKTA
 wzPOM6uPW4Nrvp3rsCh6mceGrX7C5EqwWpAqhH8MOR9qwgk2JGocLUz6d3fYm9wu5xLR
 5ywA==
X-Gm-Message-State: AOAM533T4p5+/zRdiuxA66Mqnskal+mM15+WZUdTTt020jWzwyU5RGgk
 aJUfiQmhfbzZBX/igf1U9DEzspIqZ7KpUA==
X-Received: by 2002:a17:902:dad1:b0:161:9abb:fb75 with SMTP id
 q17-20020a170902dad100b001619abbfb75mr24319653plx.135.1653338878604; 
 Mon, 23 May 2022 13:47:58 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 14/18] target/arm: Mark exception helpers as noreturn
Date: Mon, 23 May 2022 13:47:38 -0700
Message-Id: <20220523204742.740932-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AxA1PusIHZi4

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index b1334e0c42..5161cdf73d 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -44,9 +44,9 @@ DEF_HELPER_FLAGS_2(usad8, TCG_CALL_NO_RWG_SE, i32, i32, i32)
 
 DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
                    i32, i32, i32, i32)
-DEF_HELPER_2(exception_internal, void, env, i32)
-DEF_HELPER_4(exception_with_syndrome, void, env, i32, i32, i32)
-DEF_HELPER_2(exception_bkpt_insn, void, env, i32)
+DEF_HELPER_2(exception_internal, noreturn, env, i32)
+DEF_HELPER_4(exception_with_syndrome, noreturn, env, i32, i32, i32)
+DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
 DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
 DEF_HELPER_1(setend, void, env)
 DEF_HELPER_2(wfi, void, env, i32)
-- 
2.34.1

