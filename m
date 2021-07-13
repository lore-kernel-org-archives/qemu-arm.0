Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp597371lfc;
        Tue, 13 Jul 2021 06:41:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy80zyAxB90BbP6QR5igRiUcHeMz0doYl1H0zuHe+YgpI6dJjbnJ0UzMDSimkvHlLTrzL/b
X-Received: by 2002:a05:6402:10cc:: with SMTP id p12mr5901130edu.328.1626183667031;
        Tue, 13 Jul 2021 06:41:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626183667; cv=none;
        d=google.com; s=arc-20160816;
        b=GEgawAWimX0R/34sARNsOKhtVGKoOBeE1rdt2HDIj4vsNB9/LYNJfe3PYymkTfQgeN
         8pjzRr2yw9I0bVyYU6dGTiYjhA14oCRJoibErTSO3r2q7eGrZiUXwBgMK3FUPzldUVPR
         /4le6ESlgriMhbBI7Mb/cOCcCj2CsQUU5f96o2GlmygvQNYrzJXm9y+tbuSJDtXFByY2
         vex18srQG9FEcVHp6XRkEnKfqAS7LpVMHtK+5XBaBs1XUc6gk7FZhJM1mHVTUj0ZE/BC
         FIwzbIOlsVNtQz2R0LieE4Z+IFnKw8dS+3qYr3zPOeZHRNQ8UwU0sLBLm0Gd9Sj0P35j
         nFqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=k6grFFqHPB3tF2ojR0KuBO/NFzUsEvLnrBSRggUNVfs=;
        b=fTZxpvvFM0L8b3urD4Piqb5BYuOgl93uuphB3OMzhaPoVT9OPFsUUviBvYT1gVoPKB
         BRHrrufvoR1SPZUFywii1GlUyUYY2HZAX1dzWU9Khy882mwCAruz5fAn+TwbGcBIUm+j
         5VDwGjHBEJkJfyMaimhScKfe0MudIacwCMj/dprolfQb5fsB7rV8uaD9A4kk/QqSYt5q
         uA/2j/eyIwCoCl1RIRHAELu4/Dxu9h6zxYSW37ivwIKjL/2wM2YL1speu7KHvCX0nMME
         7XzBJvvDLwZlMmYlGavIIMs8DrBXH1W+NXv3X1NJkcVseoca9YJwW+gQvhV/WJrG7lCl
         9uzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jN1Sbx1V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id mm28si10440970ejb.598.2021.07.13.06.41.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 06:41:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jN1Sbx1V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3Ieo-0006Bu-5r
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 09:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbV-0008Q5-7Z
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:41 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbQ-0003dP-Cx
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:40 -0400
Received: by mail-wr1-x432.google.com with SMTP id i94so30500749wri.4
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 06:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=k6grFFqHPB3tF2ojR0KuBO/NFzUsEvLnrBSRggUNVfs=;
 b=jN1Sbx1VY9KoDtcdpRFKvgdmKxbzlK32P+heZlXMenNUzJaIIYmthJkFo2AqBd27xa
 mlbsFs/Wice4pEIlCSNEc3CT7GTRxOu/CchTGAOlfeaGi7cYTQGSE/AAmEXFsNJeTOPs
 zpDda8v1mvRdElHuEvayjttRDcDPfczPrF2Gm/sp4NovMv2ob9pHKOBdJkm5Znwi+47y
 TDv2mXhq//qnX9WC4+MOlfxPP/NZOdmyVuCMIOwKU+56yOewEqUGCZZh2y2LrR3EePVn
 JQe1bKbOrA+hJHMwLHpbiuraagoQM5LdutRoneYzVo8fw/liP6Re6hr05lsWx25dqboo
 7HvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k6grFFqHPB3tF2ojR0KuBO/NFzUsEvLnrBSRggUNVfs=;
 b=cjjVPGuHgVXDUKiDXwiQiRm1LtyEOluwUgAernsIPef+gaIeii14IxcoWmKfdBi7/e
 bNsao0s7tjiN9aG+OzH/aAZvHOw63Hn2XCaAz5H7afXgJValuOwR3k+wxZOj4D1UNvkZ
 CYNFng9szfZ8IDV+4g9If2UbMBBMXwRUTN5jqzYV6uBMqcjCCqLB1QREytHYETf3jTKd
 dcwY/14gFclNN+JB4gz5IppFJ19rwnjAfUDGEd+BPHZb6+crhCnR90IEI8sFj4bpg2/k
 W+2xCRcmzAk0Hx/S3q87AJa5cPtedg17V96GKVR2hPvi6opUBYsJ+dXLFBLws0hkFyLH
 HX+Q==
X-Gm-Message-State: AOAM530pM4wB+pZJo+RWGqGxTrNF8Pzykd/1eWcb320525CWLeGdoirn
 xf6QbyhLF+3+KSxFUIoUKgQnNj80rS6kjits
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr5853166wrq.210.1626183454587; 
 Tue, 13 Jul 2021 06:37:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 07/34] target/arm: Fix calculation of LTP mask when LR
 is 0
Date: Tue, 13 Jul 2021 14:36:59 +0100
Message-Id: <20210713133726.26842-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
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
X-TUID: D+rVAhfM6GDM

In mve_element_mask(), we calculate a mask for tail predication which
should have a number of 1 bits based on the value of LR.  However,
our MAKE_64BIT_MASK() macro has undefined behaviour when passed a
zero length.  Special case this to give the all-zeroes mask we
require.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mve_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index f17e5a413fd..c75432c5fef 100644
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

