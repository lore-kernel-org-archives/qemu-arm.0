Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp691324ejx;
        Tue, 22 Aug 2023 05:42:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxJ4lAKddPR4WWSfJyuV3C09Q+f1NKZSCAPOTVJ7kOwy1V+Alh+Cbw+h8VcLxhakdH8lWh
X-Received: by 2002:a05:6214:ca:b0:647:12c2:fbff with SMTP id f10-20020a05621400ca00b0064712c2fbffmr9681925qvs.29.1692708157953;
        Tue, 22 Aug 2023 05:42:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692708157; cv=none;
        d=google.com; s=arc-20160816;
        b=X+6sa8WMe6QB/z7K85oXvYWE0kLHmfWAx8e0FaacsYaBblrsBWUX2Kqu6hXa18NvjT
         ATKgDr6jisGGJDWLnzXKkIE2Ksqq1c+idYLUTO8Fsri8XMLUmX0GnZ7x+OZLuv334h9V
         K1lEHdWK0rba1tCPWKFsvOzUFeswTDfnUh8Hrk3jI/V9pAmEq49WcM4E741TGeLBRbdS
         L46cZYoTjAFuPEWeFgw9S5x8LP0uHs+lB1idPLmZJVmYsyfaPSD+N75I5qRnag6//oww
         Bpcaaiqfe8CBV6+tGA+uay1PHVaWlLRM7EDQ16XgzkmoBQ7qSDmeHpLhKpuHy4qmBA+j
         qpzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9tgWMGPDbie9fGcPGgyVFDHFkfBvE8l4uEI9SosXl90=;
        fh=wXqw6aajGBSP4OKAgbWKHj3BSg7Yrdz+j0I8chPJZNc=;
        b=Ezqbtq7u8KURMzAOU65g7KP6mLl8GvPOqwtPedj97Q/KX6RBZHSGGlT8hHrbMt5IKh
         rLWD0s14YB4JS0tz2ri7s1HxH2ksmeEOLM8BB3ahG3Y/xUenzovzxkT8IRB5l+l/3jMF
         kNGTNoL+RYzY4SzghBdIewn0Tcgc2yecL2jtMVPAbAvv5PO4GICxsLvFGXADMf1NIZVq
         y3pXkYiNtDrC8laGfF+mG7lhlPeJ49XakMcobt0V49pVGRtyu1xS6Pe2tNrtDiDKHpli
         Xxg2cXjaGUH1f+LgNPUVEvrKa88A0lu/qrtLsd0lcrZkjYPUroQc5jSHc25vUJDwHKZX
         YFWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J2KXBdxW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qr14-20020a05620a390e00b0076da7964f53si2630429qkn.753.2023.08.22.05.42.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 05:42:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J2KXBdxW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYQhL-0006RQ-Tf; Tue, 22 Aug 2023 08:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYQhI-0006P3-1z
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 08:41:25 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYQhF-0005hq-Oi
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 08:41:23 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4ff91f2d7e2so6291423e87.0
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 05:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692708080; x=1693312880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9tgWMGPDbie9fGcPGgyVFDHFkfBvE8l4uEI9SosXl90=;
 b=J2KXBdxWDWdANzQcdikqJUwhVtE7/Nllc+n7/YFoh3p0JuFSWJQopQndpCNIwd1VoQ
 CI/ijojr4tMS8Q3f966G9CFxyR5PJ8nApvFVWpmf0c2LE2FYcTZDaC0h5HAlj/ti0b3L
 SH5oHa1fXTjiwpGjI/u0aTVSR7z5hi3SPLtdRIxtUBL468SEU9xtBL7yJadl8JHy5FI7
 nHMSMGePSDsAoNbZNEE6GUZ7vUlGI0NCI1yAN9Q5ZL47THjZ7DZVPDmKc7tGxl0qNuL3
 9kzSzVy8w56R6irL44cQsgJoV26s7viCHY9YLks8OZFwHPLn1Wj+0lHYOtFCQZwkwcdT
 5kPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692708080; x=1693312880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9tgWMGPDbie9fGcPGgyVFDHFkfBvE8l4uEI9SosXl90=;
 b=fxyrrXQNXChyfBl3GxiydklfXVyuvE5q5mNloqWtW7VZRqInurFrzbhrYpLycAOadr
 rz9h0AFf/2gxdGExFli7GicNhuZY5yVRL6adremtgqy0FqCiAtA3SGyjVGTANoZPyofG
 GaiwF9DRcVISlH540jWr7dybNHBMJCFsk7TF3HQ2UBK4LiLEEIzK8IDPTCske6/wGuOZ
 egnCtrm2BgoJ80XdlQpkXFjhaZ4UrLSr50nOYAUqHEicBVvq3PRVcPrr1dmv8DRugUal
 aTMQMbkzcNVSDmikm/FC1jjpX5EzopTnwAWrjkt0iT3DTT1Gjf7I7FaQocLDWt8Vbg70
 DtVA==
X-Gm-Message-State: AOJu0YxvG9ElhsN/+DfFwIbpHFjTq+fyRR6jCDOGTWKS4IZ/LGBSa+1U
 BxaUrPHy6FPQz/aTjDUd67znRg==
X-Received: by 2002:ac2:4db9:0:b0:500:8723:e457 with SMTP id
 h25-20020ac24db9000000b005008723e457mr2168739lfe.30.1692708079891; 
 Tue, 22 Aug 2023 05:41:19 -0700 (PDT)
Received: from localhost.localdomain ([37.19.214.4])
 by smtp.gmail.com with ESMTPSA id
 u24-20020a05600c00d800b003fbe791a0e8sm15956575wmm.0.2023.08.22.05.41.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Aug 2023 05:41:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
Subject: [PATCH 04/12] target/rx: Use generic hrev32_i32() in REVW opcode
Date: Tue, 22 Aug 2023 14:40:34 +0200
Message-ID: <20230822124042.54739-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822124042.54739-1-philmd@linaro.org>
References: <20230822124042.54739-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12e.google.com
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
X-TUID: ZIQWrgAHm/XM

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/rx/translate.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index f552a0319a..75590ae05e 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -1513,13 +1513,7 @@ static bool trans_REVL(DisasContext *ctx, arg_REVL *a)
 /* revw rs, rd */
 static bool trans_REVW(DisasContext *ctx, arg_REVW *a)
 {
-    TCGv tmp;
-    tmp = tcg_temp_new();
-    tcg_gen_andi_i32(tmp, cpu_regs[a->rs], 0x00ff00ff);
-    tcg_gen_shli_i32(tmp, tmp, 8);
-    tcg_gen_shri_i32(cpu_regs[a->rd], cpu_regs[a->rs], 8);
-    tcg_gen_andi_i32(cpu_regs[a->rd], cpu_regs[a->rd], 0x00ff00ff);
-    tcg_gen_or_i32(cpu_regs[a->rd], cpu_regs[a->rd], tmp);
+    tcg_gen_hrev32_i32(cpu_regs[a->rd], cpu_regs[a->rs]);
     return true;
 }
 
-- 
2.41.0

