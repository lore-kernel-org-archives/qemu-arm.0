Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1248615lfh;
        Fri, 27 May 2022 12:43:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypSUiuc9fybAvNXg3vN2hy83wdOqz5/a+b+2KHj+6I6GKYBi2KSoyWQj+QJ6z4AjeN+xda
X-Received: by 2002:a05:622a:5ce:b0:2f9:1745:ec66 with SMTP id d14-20020a05622a05ce00b002f91745ec66mr32165542qtb.298.1653680636056;
        Fri, 27 May 2022 12:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653680636; cv=none;
        d=google.com; s=arc-20160816;
        b=09lIl6auqeDSf63MlZ9LV6g0QtWgzfGVkVtlJwg7wjVSmvRWUvY0p1CQDIPQwRD52I
         T0bcbz9gFkRqUdwSGYrjRC4pjK4COeNau3SBVk32+n4aQjUC5gfVTagkKl8VJMpXXfgm
         lgN0PUpjt0/CNlAvGMzzkdt36Zvwh0Q+A1R90v31APdm72ZsFKVw2CYJxFbVgCIoa4OG
         YydTmcOaJ5gpGZfddSr9SEPFtdfAsuH5aWtvOEysU6ts8zpnQ1yva6N8DM0FlcVO5qhe
         vCoZwrPex9MQPSlAB0NTW/jhe0iTcghWqp8iywds9MB3+eNseJdB0QtzuR8e1+55dqNG
         JKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=O+m+Vc/siQJ7yTH12TUx9KUDSpT55djNcEX7+B2WPkY=;
        b=SYhF82Pw7wxbw8EE/VMhHMLQt6toW2Rjb96B8Su+GVxTLfi2qxJynCOu17DAaMH29u
         i58ySgeWEMscGCw9HMF+qotP1V3gZ7tOIHojaPD1/qyaaNc2xANYJJFj5A3LsVuKeTeo
         cy9PQuqBLKFqSFByXk173nCDG6d963FWn96fEwsAp7o/OI0re5G1vF6gK29HIg+H+hqH
         lrU0HHwZtbMZVcK+g1zLMY1LfJuHdjeFVr0eiDBfWytz0Yap4Xjr6ABkfI+igApue1L3
         WWMXc4QYlrJwMfQYZsOSMaKTyg7X/2G1Loi57wQY2RhDzJot3g2DIGEVoBlQeHmhLeiJ
         t8Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a0uL40S3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6-20020a05622a14c600b002f92f2da8e4si3069916qtx.373.2022.05.27.12.43.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:43:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a0uL40S3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufsJ-0003JX-Fz
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecL-0003c5-VQ
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:22 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:41482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec9-0004Ry-Hw
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:21 -0400
Received: by mail-pg1-x529.google.com with SMTP id e66so4561272pgc.8
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O+m+Vc/siQJ7yTH12TUx9KUDSpT55djNcEX7+B2WPkY=;
 b=a0uL40S359Qjy4KuCpJh5ZEMJbbcZqHxrDNUwE0ewZt83bNUmF/NCsVAjd8TR6moYj
 muZN9JsMw2nIN5A8BCIl8iLFgApw5mw3MQCqujG3IfYULnAsOqA0bEhFs5LEd/NHANSl
 5D1XDdFOZ6kFpSUQsy+4BgSdyKq568m0YIECGU/lQdjFOmUPdifeYsRZiiw7NXnCawxC
 NSURoQawacbI2h0S7zcLnQdvfN8jtIkbBgaZQpW3ADGviEAvRQSAQML/i61n2W5KAXCU
 1OENHBT6qgdAJGOT02DePXEZb+BwioC8OCcrBfDHKn10m6gHmkTlddCaJOz4cURk6gj7
 QbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O+m+Vc/siQJ7yTH12TUx9KUDSpT55djNcEX7+B2WPkY=;
 b=XzxoAkLVEgwDbwqkS/w8D2SpqGzcKsvaXJzXGNUBE00vzCaV4hq5EhDFEdF0A+Qfag
 SxUg/WuDGKlnZ+YlM0otwedFQ2RhV65eToklNrqvym6Q0wCYC7IUuYNyXVIEZfIdpPQP
 63XJTBNRGIAchwM4SbIYhLMyY+E8grpT+tU4glV0vm+BbecuPXV/DYZm1bRZnAUSbS6m
 +1S2lHaZ3AiIbDi6gG3atj3/e9yp9MIMg7uY8nJ43eBAVQtDXgvhXa2svru3226kZI/c
 DdLJYoLFgZIM4AZIpDfgedaABKtCQs9id49IRTXAcoUnBQIsJOeR2Iv3fBoMz9VjuPWQ
 6Lyw==
X-Gm-Message-State: AOAM532K95oqLkBCtUYgYpoIkdnxSBDHiJi776mtfux+bvY8xpuAjLGY
 bLuoSX8lPpKFjKO0ApjkpqTft5hXYLCkFA==
X-Received: by 2002:aa7:8141:0:b0:518:425b:760e with SMTP id
 d1-20020aa78141000000b00518425b760emr42583890pfn.27.1653675787167; 
 Fri, 27 May 2022 11:23:07 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 063/114] target/arm: Use TRANS_FEAT for do_last_fp
Date: Fri, 27 May 2022 11:18:16 -0700
Message-Id: <20220527181907.189259-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /7XTmo0DUCX4

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f5453e99e1..841c1b5644 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2608,15 +2608,8 @@ static bool do_last_fp(DisasContext *s, arg_rpr_esz *a, bool before)
     return true;
 }
 
-static bool trans_LASTA_v(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_last_fp(s, a, false);
-}
-
-static bool trans_LASTB_v(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_last_fp(s, a, true);
-}
+TRANS_FEAT(LASTA_v, aa64_sve, do_last_fp, a, false)
+TRANS_FEAT(LASTB_v, aa64_sve, do_last_fp, a, true)
 
 /* Compute LAST for a Xreg.  */
 static bool do_last_general(DisasContext *s, arg_rpr_esz *a, bool before)
-- 
2.34.1

