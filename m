Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp5013096lfr;
        Tue, 13 Apr 2021 09:11:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjRHXpJaAU1rzGnY51SLMi0QXm5+gOyoNMr0d3D3UX8LGbnVbmIzsJLzSWA6ktgNVVfiaf
X-Received: by 2002:a6b:f301:: with SMTP id m1mr10030980ioh.181.1618330303000;
        Tue, 13 Apr 2021 09:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618330302; cv=none;
        d=google.com; s=arc-20160816;
        b=kj9x9KgkFwSOuWxtR1oip/MlXNzG1KlUF09jPUsegPsDXrxh2gpvONEeQsntIFzv5i
         LUC89SNly3RxFsD2tt3KPRJta/aILSK7I03WrIwZTsagGQbCF8Nwo0yNey7uicok44DF
         /xOw9l4q0ySN6IrIsFBNQEyPO4s1RCf0IrMPO4g0D92zQo69l/j4l04BSM0ie/mpLbre
         LZVcAH0VkUBIspretmqGZhi7H3vPCcOtkLjlgYKtjDQdfX+esBCmyb/+2iUnY0DqrOhX
         MwI6+Ocu01YCX4og0bqZOlyPAZlgIY/TnCfGYLdKvjP3tLdExR75tp7HT2iRiDzndVa/
         TufQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=g4qCQc75rsmkzr/XssyrfWmcfdb7+wxGK/gMHPLyx+s=;
        b=iLQ2gd7eYAnEzJsxj7pLOGCYSFFNpRcdnv51WW4RatLULV5IPpUJYloC8E+z4l3SmH
         jRT1tMPFfVKQgLQpI2iXmp+oHVPbkK8nos3g7T8TvvKpwxWigTb0efkUQyyejZLta2mJ
         i/zYI/NN5TK7Gq32OHCSg8p5fgSbxrGsOV398LLVj0O+CeYY69uVt2peet0B7nkjbF5/
         FVi+EVGBcsSUFiWXwwetLRiw5zZ/c3Vl3nlCXajwF+RkpB0LHTnCXIf/J7qUeZFhQPio
         HQ/L2seCc1Vd6hVNU5W3AvP0FGX1nmzx/fe3/LiIkQ3sT9TiUplEaPORvguID/O1t+dZ
         a/pA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jhtb2qHR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y5si18675482ilu.35.2021.04.13.09.11.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 09:11:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jhtb2qHR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWLde-0002cZ-88
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 12:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaW-0006KN-1n
 for qemu-arm@nongnu.org; Tue, 13 Apr 2021 12:08:28 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:54846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaR-0006w8-2V
 for qemu-arm@nongnu.org; Tue, 13 Apr 2021 12:08:27 -0400
Received: by mail-wm1-x32b.google.com with SMTP id k128so9045784wmk.4
 for <qemu-arm@nongnu.org>; Tue, 13 Apr 2021 09:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=g4qCQc75rsmkzr/XssyrfWmcfdb7+wxGK/gMHPLyx+s=;
 b=jhtb2qHR4ADttgh/wF2WORnU6WtNlBLjyCLGybQ7+jQYM9AcH3caBDuDtKfN49XT5+
 ++0FstMDW7xAFRW1aT3UKGnzIZrvxknGDGMsd9ZEEbQoQbps4qFmZKbmC3TZ6/XS+YTA
 qXsINvCOybsNk3Irgf9srzr0mZzYNQ34kA9SiN3mOGDhllthmvjul4IRs8xcQlWGZQ0g
 go1gTv5d3w/p6Iy2A3WOVOiib3RJnPZM0dGp3Bz/jpKj68P3DTzjvWcvbRh4PtfFMCAz
 f7JMV/eYUl6eA11IYtyeZ01NOAUOCPGREEMFRH/BJAi8YREnvL9eqhV4ozLH2pPn8iAy
 35VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g4qCQc75rsmkzr/XssyrfWmcfdb7+wxGK/gMHPLyx+s=;
 b=sfNMlxlaFGxvUMYtcAWTsR+WxP6E89RGD362d3gzsn3K89zN1y0D9hRIFAxr6T6NnX
 B2XoEN3pctioH/33ORmFZKkdqURvAEQU2cfDzP8D25SlSNEY3sB+yaUx1faiqx+2irwu
 4czlNb3LcsIbjTii1ruTl3oPjrS574XOcOYj3fsWqX7n04yZE4XTKmkpZT07EFfjTcHk
 jrgg1f3v5CYiIMS02S4tnfkJ4V4CoP4zsB0Gxo5iTtxlLe9qsUutlSucCWZvhBlWBTo/
 RRSO7bIlGz7sjOypKBxXpgUDJm1HgsE7yZd3l4iqHsR6pkp7fw76k/2odF2YVKHLbxZa
 LLAQ==
X-Gm-Message-State: AOAM533D6tX0z+qBnuEa6evxj5ARQ62fxn6IfyuzZSQZM086y8DA+Dlq
 I3wr996Z6CtXL35A1WIaMF71lQ4J3dt5YkoM
X-Received: by 2002:a05:600c:4b92:: with SMTP id
 e18mr748083wmp.150.1618330100961; 
 Tue, 13 Apr 2021 09:08:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b1sm20810888wru.90.2021.04.13.09.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 11/13] target/arm: Move NeonGenThreeOpEnvFn typedef to
 translate.h
Date: Tue, 13 Apr 2021 17:07:57 +0100
Message-Id: <20210413160759.5917-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413160759.5917-1-peter.maydell@linaro.org>
References: <20210413160759.5917-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: a6iOUkDtsDWw

Move the NeonGenThreeOpEnvFn typedef to translate.h together
with the other similar typedefs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.h | 2 ++
 target/arm/translate.c | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index a9f90e3ed4c..ad3dbc0e8dc 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -406,6 +406,8 @@ typedef void NeonGenOneOpFn(TCGv_i32, TCGv_i32);
 typedef void NeonGenOneOpEnvFn(TCGv_i32, TCGv_ptr, TCGv_i32);
 typedef void NeonGenTwoOpFn(TCGv_i32, TCGv_i32, TCGv_i32);
 typedef void NeonGenTwoOpEnvFn(TCGv_i32, TCGv_ptr, TCGv_i32, TCGv_i32);
+typedef void NeonGenThreeOpEnvFn(TCGv_i32, TCGv_env, TCGv_i32,
+                                 TCGv_i32, TCGv_i32);
 typedef void NeonGenTwo64OpFn(TCGv_i64, TCGv_i64, TCGv_i64);
 typedef void NeonGenTwo64OpEnvFn(TCGv_i64, TCGv_ptr, TCGv_i64, TCGv_i64);
 typedef void NeonGenNarrowFn(TCGv_i32, TCGv_i64);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7439c56d34b..7f95ab16613 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -66,9 +66,6 @@ static const char * const regnames[] =
     { "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",
       "r8", "r9", "r10", "r11", "r12", "r13", "r14", "pc" };
 
-/* Function prototypes for gen_ functions calling Neon helpers.  */
-typedef void NeonGenThreeOpEnvFn(TCGv_i32, TCGv_env, TCGv_i32,
-                                 TCGv_i32, TCGv_i32);
 
 /* initialize TCG globals.  */
 void arm_translate_init(void)
-- 
2.20.1

