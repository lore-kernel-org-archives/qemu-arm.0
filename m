Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1238189lfh;
        Fri, 27 May 2022 12:22:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIVNa9ZMh0II/phzMUOewuSU/aALhNaQUtRFafBHYtGn2byvFIeC6jE3Nfp62xzcJAjntC
X-Received: by 2002:ad4:5e89:0:b0:45a:d9c8:e04b with SMTP id jl9-20020ad45e89000000b0045ad9c8e04bmr36088497qvb.112.1653679341991;
        Fri, 27 May 2022 12:22:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653679341; cv=none;
        d=google.com; s=arc-20160816;
        b=z3eazLGmre4N7euvMYu634lTKoPWKCNCjp1LaW9PMFRsux93SWWoYDQ0dH3AXFz8VX
         6/D71eRlTxThNxoShaNwNvtULPtDFMBXuK5h3RTt56RYcDTG0jml8jggfHUX3/P3f9Zw
         +HpYTtAuB1tcPpFEvcZX/u2q5lyv+w0UZ5iPP1Jh9JGcTG2pWlwLD54JdzgN9FvVXfes
         bBzv3f2pNfvx0MBcb0FXYTyWeit4t40aExzDhqx/txGyZcpmekTKDElqy/ElREaQSaLW
         voD1T0qKPrwLdXlIa0sThZ+cK+YESeiOE2Vr1KIibcbZU5pc/EkAjCIQXTwWQ1ideWYY
         +How==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UI60zrQ64/2PDkzPp3zl7NJRzZp6j+gQ6xmRMfRFklM=;
        b=afCC0bNxtztdI5J+x1cyYMTpEmFKMLBLIqbXQDC/s4BAD90KglW+HpSrnquygqULC1
         /7KWYmu0JcDd7inrNvP/jHiuHQRWGZ0FDfytyVl/1YrneFVi1jTNj0tEzYIKufinL61y
         vhPGVzLraEAw1kExJ44g0Zv4b/VjVNoI4wpFCVAwFj8JPE2S7nm7oyMi5od/lAcczy6N
         +rml2g6T6BAvG90nKi/AmOssVsYeLvz7QqlPcd3dYWprvsc6A53Y6NxrhhGyIGxUuwuc
         H1x3aNaapRByWFeHDXK9rrIHNwMk8CQWlJSIOnBu/K21ZPmihInPV8WV2MO7u3dWuO3R
         s/3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZgFre6cv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10-20020a05620a40ca00b006a33792d392si4308114qko.698.2022.05.27.12.22.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:22:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZgFre6cv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufXP-0006Gd-PU
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecW-0003vs-45
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:32 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecK-0004Uu-Pd
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:31 -0400
Received: by mail-pl1-x62f.google.com with SMTP id c2so4821154plh.2
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UI60zrQ64/2PDkzPp3zl7NJRzZp6j+gQ6xmRMfRFklM=;
 b=ZgFre6cvWH5tuelJy14tOkzXOGrfaDMMsEFUNuwsWdWZDaB32kgLebisOHzoyucdPL
 qTyMGl7E9/EhsyxSCm9A/yzzlrokxUlziqKEZdkwYRJ0zazwI2Wcgq4YAj1iqDkwGUE5
 W/vYFLrg+ZYW+CnSpdFy2Qvj0g1zcApwALdnBB+Z5CfPsK0uY+3szBx6vOJk9xvN72Ds
 y98ptE1gFy76GkPql6PadqIk3UFtEIvZjQGjw9G5D6H17lGv4OBZNW88rMU6gbeBIrvJ
 /XYHHO34H9xOeGBhlDi6NnruOlnA0pip227z2DHd1TC0XpU1gnJdMh/PuqSBSojM/Qba
 I+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UI60zrQ64/2PDkzPp3zl7NJRzZp6j+gQ6xmRMfRFklM=;
 b=fDGiqWCnJhTSnJloFprG2X4b7mPCYHNsbOARoy12AbOEIBO3F0GxRAxY1SUPFUl6rw
 C6AaCw19WmuGdzTncxKIdxCGJNzHdJhJNRNIGwHVwfW9wwSKT/OZnMKdIABO4OCPoB0y
 79aRfdikEmT8MqVmU78t/N2f2mmHLbcTJh2O0jzxVWkyU/qTxiHxAHke1DXTIQK0SOyH
 zsiHNJqymrGm9Ny8jLV+zOAt5K5h88Ic+IV43DFgM+h5vo4cLZsVvZoJXF+AqdxY5ErU
 xe/GwW81JV4rVxEL+851xKQ1MQn9EARnJ+Gkqcmqu4RMflAioKyNomL9lYckI7sAe3lW
 PCFg==
X-Gm-Message-State: AOAM532EX1eaCzuMSmH/BqEVvvPLaJ5US3rgsnpYU6UeMJBdMTW435Wq
 5cZL6+xPbvMMjkulUGtXk5L5mw==
X-Received: by 2002:a17:90b:4c88:b0:1df:c5e1:986e with SMTP id
 my8-20020a17090b4c8800b001dfc5e1986emr9687877pjb.8.1653675797478; 
 Fri, 27 May 2022 11:23:17 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 075/114] target/arm: Use TRANS_FEAT for do_zzi_sat
Date: Fri, 27 May 2022 11:18:28 -0700
Message-Id: <20220527181907.189259-76-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 7lqMZvHnNSmr

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6b2f235e4a..e6434589f4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3313,25 +3313,10 @@ static bool do_zzi_sat(DisasContext *s, arg_rri_esz *a, bool u, bool d)
     return true;
 }
 
-static bool trans_SQADD_zzi(DisasContext *s, arg_rri_esz *a)
-{
-    return do_zzi_sat(s, a, false, false);
-}
-
-static bool trans_UQADD_zzi(DisasContext *s, arg_rri_esz *a)
-{
-    return do_zzi_sat(s, a, true, false);
-}
-
-static bool trans_SQSUB_zzi(DisasContext *s, arg_rri_esz *a)
-{
-    return do_zzi_sat(s, a, false, true);
-}
-
-static bool trans_UQSUB_zzi(DisasContext *s, arg_rri_esz *a)
-{
-    return do_zzi_sat(s, a, true, true);
-}
+TRANS_FEAT(SQADD_zzi, aa64_sve, do_zzi_sat, a, false, false)
+TRANS_FEAT(UQADD_zzi, aa64_sve, do_zzi_sat, a, true, false)
+TRANS_FEAT(SQSUB_zzi, aa64_sve, do_zzi_sat, a, false, true)
+TRANS_FEAT(UQSUB_zzi, aa64_sve, do_zzi_sat, a, true, true)
 
 static bool do_zzi_ool(DisasContext *s, arg_rri_esz *a, gen_helper_gvec_2i *fn)
 {
-- 
2.34.1

