Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp460489lfc;
        Thu, 27 Aug 2020 04:06:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/58XyQXruusvWSl9lYTenQt171My97uPDOpQhgDOdhG6xUKEtoxryv3hgWmTal5JPguFZ
X-Received: by 2002:a25:d98f:: with SMTP id q137mr26746345ybg.182.1598526387981;
        Thu, 27 Aug 2020 04:06:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598526387; cv=none;
        d=google.com; s=arc-20160816;
        b=qjWyullX5XE1jvsrgJWFnVaGCagtrO4JYEkQSotRITt+bTcQkCbc3q7V1fKGXLr5g3
         E+6YgwC95BU9ykKfxJC0VGPsBK9pJNt/caQNQgMbVA3pD8+hTqAGRPEz9g2/+BAlYKLy
         OaI794HCtFBInmSmFBeLF4Klq78vgFV8NEogQZKWVCjf9PVuKvoPkwJQIT7YSqAIevs+
         CqhB4V/Qv6hU8yBmEjU7xnySD1PnTBrHw6GmRyJBU/V9JssLfu7FVkUviUxhCua0PGx3
         LNLiTFqM/BNRledJA0jZchrqokhV3JL7YTjJvTkd1Ce3fRM2+e04Uc218GBLUNI8Whxw
         JUMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=53yy+2zpRIoQ3n3m/P42TrDw08grpiqw5i/ZO5Hnook=;
        b=OIWQq2y4M+zOJ3C6iP1XfuOoxnaAq/jW4SMoWZZY9l/pFKz/47SHhvHru8jxojBH1w
         99vxgVAR1BpezdAynuffNzPZHv19ee4+wC3R6RrLnP0gMD328CZL77oaZe8RFTu3UlLC
         lwYcH7BWquqyGA4+my6gBrPnhF6jbLbc2x0EP8rA1D7O649y9/3nRnUUpRHxvDj7bF3P
         Gsjn4DlPv6d0Axnz2H0eU5r27YcBTCPttpkfqtFm/Kw5+IrM+knoifde5tfhueTOqbFM
         n50nf6Uth/tnmOK9HbQk3ut7KZFq5A9gVY21V1rLuwXC24uA6hZWTbeYwWzPLSPEqojv
         5G2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z3si2256231ybo.258.2020.08.27.04.06.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Aug 2020 04:06:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBFjf-0007H0-B1
	for alex.bennee@linaro.org; Thu, 27 Aug 2020 07:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kBFi9-0004T4-S1; Thu, 27 Aug 2020 07:04:54 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4279 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kBFi7-0007YZ-Rg; Thu, 27 Aug 2020 07:04:53 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id AFB2A7BCA8D9987C4F8C;
 Thu, 27 Aug 2020 19:04:46 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Thu, 27 Aug 2020
 19:04:36 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v3 02/10] hw/arm/omap1:Remove redundant statement in
 omap_clkdsp_read()
Date: Thu, 27 Aug 2020 19:03:03 +0800
Message-ID: <20200827110311.164316-3-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200827110311.164316-1-kuhn.chenqun@huawei.com>
References: <20200827110311.164316-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=kuhn.chenqun@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 02:09:23
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, zhang.zhanghailiang@huawei.com,
 pannengyuan@huawei.com, Li Qiang <liq3ea@gmail.com>, qemu-arm@nongnu.org,
 Euler Robot <euler.robot@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2+hZQSKaofdT

Clang static code analyzer show warning:
hw/arm/omap1.c:1760:15: warning: Value stored to 'cpu' during its
initialization is never read
    CPUState *cpu = CPU(s->cpu);
              ^~~   ~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
---
 hw/arm/omap1.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 6ba0df6b6d..02c0f66431 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -1774,7 +1774,6 @@ static uint64_t omap_clkdsp_read(void *opaque, hwaddr addr,
         return s->clkm.dsp_rstct2;
 
     case 0x18:	/* DSP_SYSST */
-        cpu = CPU(s->cpu);
         return (s->clkm.clocking_scheme << 11) | s->clkm.cold_start |
                 (cpu->halted << 6);      /* Quite useless... */
     }
-- 
2.23.0

