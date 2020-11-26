Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1341457lfb;
        Thu, 26 Nov 2020 03:24:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzj02JsuxUI59HcyUmq0KELnMmOFjHLGHV7RUmHVtksw48dpOr0ffQSB16Go4e5cyH3YvNr
X-Received: by 2002:a25:4dd5:: with SMTP id a204mr3100175ybb.191.1606389866186;
        Thu, 26 Nov 2020 03:24:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606389866; cv=none;
        d=google.com; s=arc-20160816;
        b=vaN8tobPZddvRj/n0YvpTaUMgGx++l8PRoGglzZLGL9Y7VZzWylmPrm2rmYjvYs3s7
         5bEnD/VClzmj/u+Kd50hhQn2ex2xarfIYpJNn5s6oydR9oY9mFqKGMGKenX41wLhRkdv
         ufI29+f9u+/I7WI+Ymj9XbNeXa9pGeSrQRxbp/mmFWRmfhKoMKwwrjLGo5ZxW6/xRjQh
         lQIk3BBz5CdFDCJtJ2xl7AGodBPdrLhP0rGw6pIkM6hdcJwS3MBO2uB8rl2gn3qoxKzU
         IlBHFGvo5Xt+AlShXI4uQeHGOQq26WY98skk5bqADuzxkf2HpjjyKNt/TNBYDhUzCJ+r
         RQxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=1HNvQJzZ33kIOpNPPrPXAv7J6Ex37wSprHS2moRr4+M=;
        b=oLZmlN4AE+84+sLI+3Gr7dfLq9NvUko6mzi4Nx8hTCJDmAsT37sMuDdoZY6mCDs56l
         qkU4gy3VbiROqItPgYkpowHjjiibUlU97UnCUAcE0n9Spu6lyQW3XFVur5pvfxR7o+q9
         0hyzomQhcUjGF1zj5U9UC7kkWS0+C1qx/urWFC4P0Kc3FCLVzZ548Hr+HftjAezh4eAS
         Nm2NGqUTHMtHJbKubXRjP8L12iTjE4sN5pD/37K7E2rmg5PLkphAJUKiUXSwmY7IwZmr
         xXfpZBwXgwv+yD7EVLDrmZaA5D+mDnR0y51NNFYrnQVQGVELu+wZOYM63LUhqvAybSPJ
         0jWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11si5000444ybl.404.2020.11.26.03.24.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 03:24:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiFNx-00053K-Ic
	for alex.bennee@linaro.org; Thu, 26 Nov 2020 06:24:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kiFNI-0004V0-Bj; Thu, 26 Nov 2020 06:23:44 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kiFND-0003rA-2z; Thu, 26 Nov 2020 06:23:44 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Chb3L5nMJz73Mk;
 Thu, 26 Nov 2020 19:23:10 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Thu, 26 Nov 2020
 19:23:24 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <peter.maydell@linaro.org>, <jcd@tribudubois.net>,
 <peter.chubb@nicta.com.au>
Subject: [PATCH 2/5] i.MX31: Fix bad printf format specifiers
Date: Thu, 26 Nov 2020 11:11:06 +0000
Message-ID: <20201126111109.112238-3-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20201126111109.112238-1-alex.chen@huawei.com>
References: <20201126111109.112238-1-alex.chen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=alex.chen@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: alex.chen@huawei.com, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: buFzxJDy3XZT

We should use printf format specifier "%u" instead of "%d" for
argument of type "unsigned int".

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 hw/misc/imx31_ccm.c | 14 +++++++-------
 hw/misc/imx_ccm.c   |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/misc/imx31_ccm.c b/hw/misc/imx31_ccm.c
index 6e246827ab..ad30a4b2c0 100644
--- a/hw/misc/imx31_ccm.c
+++ b/hw/misc/imx31_ccm.c
@@ -89,7 +89,7 @@ static const char *imx31_ccm_reg_name(uint32_t reg)
     case IMX31_CCM_PDR2_REG:
         return "PDR2";
     default:
-        sprintf(unknown, "[%d ?]", reg);
+        sprintf(unknown, "[%u ?]", reg);
         return unknown;
     }
 }
@@ -120,7 +120,7 @@ static uint32_t imx31_ccm_get_pll_ref_clk(IMXCCMState *dev)
         freq = CKIH_FREQ;
     }
 
-    DPRINTF("freq = %d\n", freq);
+    DPRINTF("freq = %u\n", freq);
 
     return freq;
 }
@@ -133,7 +133,7 @@ static uint32_t imx31_ccm_get_mpll_clk(IMXCCMState *dev)
     freq = imx_ccm_calc_pll(s->reg[IMX31_CCM_MPCTL_REG],
                             imx31_ccm_get_pll_ref_clk(dev));
 
-    DPRINTF("freq = %d\n", freq);
+    DPRINTF("freq = %u\n", freq);
 
     return freq;
 }
@@ -150,7 +150,7 @@ static uint32_t imx31_ccm_get_mcu_main_clk(IMXCCMState *dev)
         freq = imx31_ccm_get_mpll_clk(dev);
     }
 
-    DPRINTF("freq = %d\n", freq);
+    DPRINTF("freq = %u\n", freq);
 
     return freq;
 }
@@ -163,7 +163,7 @@ static uint32_t imx31_ccm_get_hclk_clk(IMXCCMState *dev)
     freq = imx31_ccm_get_mcu_main_clk(dev)
            / (1 + EXTRACT(s->reg[IMX31_CCM_PDR0_REG], MAX));
 
-    DPRINTF("freq = %d\n", freq);
+    DPRINTF("freq = %u\n", freq);
 
     return freq;
 }
@@ -176,7 +176,7 @@ static uint32_t imx31_ccm_get_ipg_clk(IMXCCMState *dev)
     freq = imx31_ccm_get_hclk_clk(dev)
            / (1 + EXTRACT(s->reg[IMX31_CCM_PDR0_REG], IPG));
 
-    DPRINTF("freq = %d\n", freq);
+    DPRINTF("freq = %u\n", freq);
 
     return freq;
 }
@@ -201,7 +201,7 @@ static uint32_t imx31_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
         break;
     }
 
-    DPRINTF("Clock = %d) = %d\n", clock, freq);
+    DPRINTF("Clock = %d) = %u\n", clock, freq);
 
     return freq;
 }
diff --git a/hw/misc/imx_ccm.c b/hw/misc/imx_ccm.c
index 52882071d3..08a50ee4c8 100644
--- a/hw/misc/imx_ccm.c
+++ b/hw/misc/imx_ccm.c
@@ -38,7 +38,7 @@ uint32_t imx_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
         freq = klass->get_clock_frequency(dev, clock);
     }
 
-    DPRINTF("(clock = %d) = %d\n", clock, freq);
+    DPRINTF("(clock = %d) = %u\n", clock, freq);
 
     return freq;
 }
@@ -65,7 +65,7 @@ uint32_t imx_ccm_calc_pll(uint32_t pllreg, uint32_t base_freq)
     freq = ((2 * (base_freq >> 10) * (mfi * mfd + mfn)) /
             (mfd * pd)) << 10;
 
-    DPRINTF("(pllreg = 0x%08x, base_freq = %d) = %d\n", pllreg, base_freq,
+    DPRINTF("(pllreg = 0x%08x, base_freq = %u) = %d\n", pllreg, base_freq,
             freq);
 
     return freq;
-- 
2.19.1

