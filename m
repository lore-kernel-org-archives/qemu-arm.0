Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp693598ejx;
        Tue, 22 Aug 2023 05:46:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8zjVAjEvwCEeNoBkiGaN6J726bbOiIlUi4wJGqH3i2E5pLvU6Z/V9fkbbSs0RfrtsJjK9
X-Received: by 2002:a05:622a:11cc:b0:40f:d021:b0cc with SMTP id n12-20020a05622a11cc00b0040fd021b0ccmr14004056qtk.22.1692708405537;
        Tue, 22 Aug 2023 05:46:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692708405; cv=none;
        d=google.com; s=arc-20160816;
        b=0r9Zbw2/W9sHpW5CaTn0i7iRjFfw4aDvqXksiBneJ5BeICxXSlXXAtxAs3BvjP7mcI
         v0uphs3dHMyz7jmhMajgImwsDUov9gHTMurus9hpYLlxl7prNy+cflcIkoP0qO8peF32
         inJ5zVyb9uZw9AF6BEYUkF+nF4AbnEgzXrb2jeMEvLSf9AuibDAfTJmbqWZ2pFJcODbZ
         kW3QEJXA31Ii9oJvvBVqGtlCpqM2W24CwtTxTW9JGlld+zQE2UHa5koGRaxWb5S1RuSO
         EVXJOs8Vy/DMx+3TltUFWBPhAooRDSWeXca6/XFNM7JbbcDK58s9KI+GgIxcoHAiZQQ4
         3YfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3CvejP1SPWKY/vo0PkTSUlRcOk/R6PHI3gbd8lW0JWk=;
        fh=WTNzBzBWhI6YyLjiFd1Gx/+Ggetq/7tfVgf3EfLcLKA=;
        b=LW5+auhdk96Dj2/jlhTQPMAm9z39GM4hpQqU5aWcPjcWSweWFeXpCsrnmLikCQ0mCB
         9G+hMvJvRPORPKoTBbUKEmlUqBmFpiXO4Z5/wnsJIqnIOymft8X2G4VAVP2AqsaX7+jc
         6sYX9OXrmoEXbk30v7IDblrYQF4pWAJWg1awR5Gt+VsMa1s0Yb3DEiPWs83trUgOABfJ
         flGgz6ASGd1l8mGj3Th6xBxCGLunlD8F50K0d16CLkSTbZ/QirMydr0lbUD+gm1dd2Z6
         arjwYZ5/Mk5+9uXHqhbUroDziDnZV/W5oXtsVNtusM6DcOFQwYDMa1hn2kIU0vnWDoU+
         fxRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F9aGn+Mc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4-20020ac87d44000000b0040349c011cfsi6126852qtb.259.2023.08.22.05.46.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 05:46:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F9aGn+Mc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYQmO-0005Nw-C6; Tue, 22 Aug 2023 08:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYQmK-0005Lz-R6
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 08:46:38 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYQmD-0007J8-B6
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 08:46:35 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5008faf4456so807598e87.3
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 05:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692708386; x=1693313186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3CvejP1SPWKY/vo0PkTSUlRcOk/R6PHI3gbd8lW0JWk=;
 b=F9aGn+McmTleL0Oc26hFNmWY8lYtYrL/tLJ3J8c2prORtmV7052GRh0OnHCKIy3XpF
 f+V/8ibJ6xAXPhSUKA0y746fcWfpRdYvm1et+zDXrgcGSDqANDYOKgKY7bXHN9c6cqRN
 tNo/uHuqGPsyJ7tvvlck9rBH/t1Zw450N+phEbF9SMfSuRTxesJDRS9jTMmpxbBXEUwh
 6i8S2yMa+U8t4rEr4LWm9q2tBQ+6gJ2qB1Z8OUV+Otoj74Z/5jZ5R9jF+zlJBnyBH5N4
 vcQk42X9Z9L34SyPQjiv2fyL0rbCnuDyUx0tdf9CwN/K3uqE93EBh+l/5YequWE8OGBH
 GFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692708386; x=1693313186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3CvejP1SPWKY/vo0PkTSUlRcOk/R6PHI3gbd8lW0JWk=;
 b=Zx6pB9K+X2W7Htof+rhxTvTTn4bR5nnhKve8+dJnx77MKisQgSj3m15XxXgMEZLXX9
 pV1lgKVu/ASjHpGGAjTICcYKGtaObT8xL9YSHQo6pCVaFZTv3bUoviHPl5CLe20YwK6H
 cvUL0BvDq7BIb9lemOiDk32EupjAH1nbPPJHNQgc0Ml9QGrioZ+jSFZ3mahPv1Q4/j/+
 xGff7PbVCCma1EbvjPlrjpTKpc1PiqA2oS6NEdl9TGY6Ng/lbpELdCuZetGnHZkW0jAA
 kit8CbymIwTAxqMOVJZhiEVFtMVsyhXPiW7UtHByUeV4BVGDYbpudnfSbaSPLgjr1y2F
 kvfg==
X-Gm-Message-State: AOJu0YxuWGd4GApOaBBcjhxfXyvS+9E9NQoxmyGBF/8ymCBpvJpQvDQl
 RenPgUfM8Tj7Je1yBl26SAUs2w==
X-Received: by 2002:a05:6512:340c:b0:4fb:7592:7e03 with SMTP id
 i12-20020a056512340c00b004fb75927e03mr7569000lfr.20.1692708385982; 
 Tue, 22 Aug 2023 05:46:25 -0700 (PDT)
Received: from localhost.localdomain ([37.19.214.4])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a1c4c0a000000b003fef5402d2dsm3982597wmf.8.2023.08.22.05.46.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Aug 2023 05:46:25 -0700 (PDT)
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
Subject: [PATCH 10/12] target/arm: Use generic hrev_i64() in Aarch64 REV16
 opcode
Date: Tue, 22 Aug 2023 14:46:18 +0200
Message-ID: <20230822124618.54873-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822124042.54739-1-philmd@linaro.org>
References: <20230822124042.54739-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12f.google.com
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
X-TUID: 2uch189RKTGQ

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/translate-a64.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 5fa1257d32..2973831b38 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5040,16 +5040,7 @@ static void handle_rev32(DisasContext *s, unsigned int sf,
 static void handle_rev16(DisasContext *s, unsigned int sf,
                          unsigned int rn, unsigned int rd)
 {
-    TCGv_i64 tcg_rd = cpu_reg(s, rd);
-    TCGv_i64 tcg_tmp = tcg_temp_new_i64();
-    TCGv_i64 tcg_rn = read_cpu_reg(s, rn, sf);
-    TCGv_i64 mask = tcg_constant_i64(sf ? 0x00ff00ff00ff00ffull : 0x00ff00ff);
-
-    tcg_gen_shri_i64(tcg_tmp, tcg_rn, 8);
-    tcg_gen_and_i64(tcg_rd, tcg_rn, mask);
-    tcg_gen_and_i64(tcg_tmp, tcg_tmp, mask);
-    tcg_gen_shli_i64(tcg_rd, tcg_rd, 8);
-    tcg_gen_or_i64(tcg_rd, tcg_rd, tcg_tmp);
+    tcg_gen_hrev_i64(cpu_reg(s, rd), read_cpu_reg(s, rn, sf), sf);
 }
 
 /* Data-processing (1 source)
-- 
2.41.0

