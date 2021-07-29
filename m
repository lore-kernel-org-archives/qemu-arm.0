Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5538180lfc;
        Thu, 29 Jul 2021 04:17:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFpxUbMAj7bTSpaCz0efDk2w/xJcNava4mtMImov+wMeU1CWSxkV4ejUqlgJNT3Vh55S0H
X-Received: by 2002:a67:7c90:: with SMTP id x138mr3268928vsc.23.1627557429088;
        Thu, 29 Jul 2021 04:17:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627557429; cv=none;
        d=google.com; s=arc-20160816;
        b=iWVlbrtlIFSVyH0vE5tx0YIZ1tQv1zDkm6DfLKDqoiLLsL8rwfEQw8yzT9WJ6WHbTk
         pg+jbx+igNAVskqCf/WRJfnCAbiHHOHYzI9Hd/kMJqM9q6iLCtM7r29bby2vcDetcMeS
         j/KAR0Gff0bMZBub2M36xuXmMNVEOaMIEXmTD2kZSklLYr5Zhk3bm6gf56A0wcZ8LEmo
         NUGoROW5vnxh2/HtE5gqEMfxiweTvJSINOubXovgdBb/fOog3x1G14Qc3OAZZRjo3mQi
         Rsj7nuTVrP7MXl69whKYeGYlaWbTFMYw45cRAyrcCgQXJFW5g7MlgIDAKGg10pE9kGac
         LIDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lutAo5Z1ewFuThzfMPVLqlhd9Ml/H60A8yYUE67fuT0=;
        b=xDBGljo3tlICGazu1TXb2/DdVyl7XULWeVVz14KnPpnWMlPdZ+aNW/rQ6EFhJse3lP
         yUoRIP0geJ+Mg7GgB+GRzoq/OXY3sTJxmlfDgiR+IZYaISekS8AoScewH5Z0HFboiSAN
         BULKxV5bp0nH0FDFa4gxyapIs3LkgrJZV7NS0M7lqKEdf8+eoyYjwuXnjBlqjIAmA21C
         j+Ot8tinhhwIKBJUbznahWp0ycLtSf1/jJ5ko/gFldX6nhm8SlQ9WBiJTCpfdJ7lEz98
         LZa4pjKaF9B8PccbLpuo6gC3PYI7zZGkIaFCcLMirjbZqua+lIi8ipBmp3u63kbcWhth
         OU2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S4g7euqE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s5si1200669vsj.163.2021.07.29.04.17.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:17:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S4g7euqE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m942G-0001wj-9V
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940k-0000Qf-4N
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:37 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940a-000117-53
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:33 -0400
Received: by mail-wr1-x432.google.com with SMTP id j2so6433683wrx.9
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 04:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lutAo5Z1ewFuThzfMPVLqlhd9Ml/H60A8yYUE67fuT0=;
 b=S4g7euqEWzT7bP4rdD2sYvFbBbwSftKuNMyQE+CZ1s+ARt7R9TS3+C6p/2rOJT2HJg
 fEYHxyHOEqppsnGzSzfi6kwZ+0tSKYqQdnQPRfA+0ITUNmrRQmLfmKLAzRSgF3FnaPJf
 rKhPjpt6l+TA72FhplyEOLwY1x8abyO0hdMG1jNnSWFuvIuUgsuNj6rWphl71XXmJnrV
 CSX+UBH6SwsI2o1Oog/UqklRbIHVd28P/8v6MPRqZsNn+F3SZ8mgNx4/k0f7C9BZzEQJ
 RSlZJOFqtShsAJuSXlp3146YPX2up/EAjLeV6fF9/Pg07V8v44hRn+v5Bo882sMevKaw
 dXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lutAo5Z1ewFuThzfMPVLqlhd9Ml/H60A8yYUE67fuT0=;
 b=VQfyY809HGgy066GPOoGRIt0i9WS9cz1EuT/aADMy5MtJTgzP9IYY60MO2sKhkG0vE
 qEpht8/74SnKnX2f+K2UPcVsuG81dLJVp7z753YCfIyy5UJIrkugQDVFqxQN4b3KHX8O
 9gddqAnoLqyb2XzeYgLDsDZCgfUic23R904OgMe7b8XmhDyGMFgDTTFIG2kGtuA5u+Ay
 5iZdwIQZAgVc6noPM1auKdYOm8bb6nq9vakcmZZ0YDQ3aoovH7PyOJyoTaRl5Vm+UxVM
 XmcYJ+i8Fed+PXWFNEMS8JrmBbGhBTpvyYEZuZUBHyA84dxS2xuQB/KKsOjYvGFr/jYw
 pSZg==
X-Gm-Message-State: AOAM532sbRWGaKt6FhVuFgzDFRtiB7XvdigqiyVtFlOLXD75hStIMBm1
 CMziU8QLTGrxVcXEq/s9zKLxitD9YojJCQ==
X-Received: by 2002:adf:e10c:: with SMTP id t12mr4264501wrz.36.1627557321312; 
 Thu, 29 Jul 2021 04:15:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 08/53] target/arm: Fix calculation of LTP mask when LR
 is 0
Date: Thu, 29 Jul 2021 12:14:27 +0100
Message-Id: <20210729111512.16541-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: J9zdtEWfsmtz

In mve_element_mask(), we calculate a mask for tail predication which
should have a number of 1 bits based on the value of LR.  However,
our MAKE_64BIT_MASK() macro has undefined behaviour when passed a
zero length.  Special case this to give the all-zeroes mask we
require.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 1a4b2ef8075..bc67b86e700 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -64,7 +64,8 @@ static uint16_t mve_element_mask(CPUARMState *env)
          */
         int masklen = env->regs[14] << env->v7m.ltpsize;
         assert(masklen <= 16);
-        mask &= MAKE_64BIT_MASK(0, masklen);
+        uint16_t ltpmask = masklen ? MAKE_64BIT_MASK(0, masklen) : 0;
+        mask &= ltpmask;
     }
 
     if ((env->condexec_bits & 0xf) == 0) {
-- 
2.20.1

