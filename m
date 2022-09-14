Received: by 2002:a05:7108:5790:0:0:0:0 with SMTP id cd16csp5196852gdb;
        Wed, 14 Sep 2022 05:53:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7jEi8NXWX43k6PLQ+NZejXJvdACuJL09THqJVSQizDXszXOwzgCpf+LFXNagGipapCHc3R
X-Received: by 2002:ac8:7089:0:b0:35b:b5fa:5e35 with SMTP id y9-20020ac87089000000b0035bb5fa5e35mr12206631qto.449.1663160010347;
        Wed, 14 Sep 2022 05:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663160010; cv=none;
        d=google.com; s=arc-20160816;
        b=MSip9oSDO89h4mnHAAaNXRtE9ZIrz5R2fj5F209mSyjexN1qSmfA30DKF9K/Q7ic5N
         9Z/qZFXht2onkMg3Mv/zJVEmoqIPK1yVjcFPkrMb62v26qOV6mgXxamVYneiDEbDgAoT
         rnjohUkBooXqxq0ybEVsndNmJgJsbywo9SedBUOPSM+2FA6KJEyJpzBKClb4dcNKbQ41
         8TrW17YccW+VDLUHuBTOeYOODEUbO+lEMt1HdFHrCmFRXae68bTkvN/Nno+48yjKC1Zr
         XV7PHmZlMVD5DByDMiRafuAk3cTmpUfFg8UEtTB85vX9EzaZPZoO7tuuhFgsRSZW3jz5
         +u7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qOPgZQfrYCWtQ8zu7EPZvXBeloIFRKQ7km3wKGm16Wg=;
        b=wuZw/Du49zjrMX9GcoB9H9Spk82FBMYiKydBJ0B7JCWR8Cpag2hLItj/z3cTx+wogD
         EBNGG+U1zbozADkwmBAgqbMcEF0BGTS+5iNTFWzvRk9lT8dzIR20jIgkAHlCvMPHLIy8
         Ug2bJrjuTTbryp3609qPoSvyDfokLA7039k4LpeUU6daT/x21VbUWdR+uXPRxbzn7XcJ
         cBM3hEVfsII/l/GWV95C3tm5kII7vmpCU7O1o+fwn1xZVb6FH0rZ3Oa6kBwKY3RraTMs
         TSkmPsmBmuaIRmX2iLy3UNoJ3Ct7O7Y33uaixdjMztwHOJgHw8FdhUeWShxh832wgCc5
         35fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hiWRiw8l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ff9-20020a05622a4d8900b0034302879293si1246967qtb.151.2022.09.14.05.53.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Sep 2022 05:53:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hiWRiw8l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oYRtR-0002Ov-Th
	for alex.bennee@linaro.org; Wed, 14 Sep 2022 08:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwX-0000Lp-JL
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:37 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwO-0008WB-IJ
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:37 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 bg5-20020a05600c3c8500b003a7b6ae4eb2so15307968wmb.4
 for <qemu-arm@nongnu.org>; Wed, 14 Sep 2022 04:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=qOPgZQfrYCWtQ8zu7EPZvXBeloIFRKQ7km3wKGm16Wg=;
 b=hiWRiw8l/5B06BWVhbksE0YXKLWhimXpe739azEsmST16Hx1h2qMhaVhrVpPvGQuVh
 G89n+nR8SI6vKM2ZXTzYDt9CzPzN3803uQTrZ0hIjbFJSBobF7JQyGLs7AgCq4MaawGV
 6WlTLrZl20TjEHTJAAupL0JF1GxCbdOa1krcpjOQdoqfYz3Oc8Uslaetr4w6z40h9/8g
 PzvA0RYt3woljsip3jseGMZJ+WUHemFpJl+8BCOV5OYyH8I8hlboWEU/O74+ghM6wvh8
 0R43b7RzByma3KWSSmk11OCgiKL1dNRoMwZYI4h03V880dpQIND6SAqHgflrsfw023dw
 bZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qOPgZQfrYCWtQ8zu7EPZvXBeloIFRKQ7km3wKGm16Wg=;
 b=gjzuzA8sRo60TlkiEmZN8pLCsFS96lxNTJSvFFw6R6bGSoJsnRSNRxHCM8h70GH4rZ
 nhmU4Jvb4y2Fxe0+fWV6lhj3Ld3/dctMyoteiC8OdF/94vly2zh0XlxR5zCauHkzOhbp
 YhWyIELa3iLxfClrVf1KSJ9/E1IUz3f4L+OvuK97qahKE5DFHMewI/MzIuXfvihwcItU
 EoCy2Arq7Uqdr04aJuHZ/Ns04ljm9o2VpYQKFnPYCMnaQTvGL+xrJfLbcdVgN8O+CYTX
 W0UqDmL4yfEwUp3zoQxbKVNw/PDDIY8cHG4nqD//67H6EGQFjuy03tGalZ6B5W+P6kBf
 8GtQ==
X-Gm-Message-State: ACgBeo36NuHq49Xn+ar5SgEXADDE82A8mz8AodRc1iBMJAgg9eHnsNCP
 GuJOth6D2LqAw2si0iaiHTDDxQ==
X-Received: by 2002:a05:600c:4fc4:b0:3a5:c9ed:ca2 with SMTP id
 o4-20020a05600c4fc400b003a5c9ed0ca2mr2869254wmq.73.1663156346690; 
 Wed, 14 Sep 2022 04:52:26 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/20] target/arm: Add missing space in comment
Date: Wed, 14 Sep 2022 12:52:05 +0100
Message-Id: <20220914115217.117532-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: B3Ju2pFyiSFx

From: Peter Maydell <peter.maydell@linaro.org>

Fix a missing space before a comment terminator.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220819110052.2942289-7-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu_tcg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index f63f8cdd95..b714c61d94 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -64,7 +64,7 @@ void aa32_max_features(ARMCPU *cpu)
     t = FIELD_DP32(t, ID_MMFR4, HPDS, 1);         /* FEAT_AA32HPD */
     t = FIELD_DP32(t, ID_MMFR4, AC2, 1);          /* ACTLR2, HACTLR2 */
     t = FIELD_DP32(t, ID_MMFR4, CNP, 1);          /* FEAT_TTCNP */
-    t = FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX*/
+    t = FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX */
     cpu->isar.id_mmfr4 = t;
 
     t = cpu->isar.id_mmfr5;
-- 
2.34.1

