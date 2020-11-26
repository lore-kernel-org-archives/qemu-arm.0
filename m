Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1341769lfb;
        Thu, 26 Nov 2020 03:24:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwo58zODhg+3GGqZpAn9hBk5n55tdvfYbTaZLh3sRH07zc5y4Zg9KdE7FM9+X3uhh17BAVe
X-Received: by 2002:a25:aa06:: with SMTP id s6mr2617737ybi.147.1606389893854;
        Thu, 26 Nov 2020 03:24:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606389893; cv=none;
        d=google.com; s=arc-20160816;
        b=D85jkK6j6yIIe2ai7Xp9EC4LIClOUgZzBbBIkze2iGe1be5o0iUMjo/tsuAq9nsOHo
         gT48IU3cbmTCAHKatueE94xdKEXTS0dJE/+ITE/cSDQoCCy9QSL14iapa3QjP4KDXTax
         4a8VgOFWrw43ZntjPiPOY1nIUu9m6oB3bUkPyTKI6WFnoLwk2mv/ZWcXqczerqqiD1eW
         bpUYwBQpL3vcvYkc3O+7nPP3TCu36mOr6lD8MIGCSubU/ttAd6gZ3UQSuz/OT1wh8aWs
         7BQV+DQAJBc5eEIJTOyLa4szqkZOi9bv/VbaE+YXJykLuXBxgjsbHPKIs9R0BZSNwh+B
         2v2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=RpmshZcD63ox29Nh5WoMiUt8CE3LVNwNNrVA5+j4Qho=;
        b=t5iCWBKXrDH6/qAjJA4xJFNgtzMjR0nGSot19slX9T8IPmgBniWHfrCca05kNBp+5J
         MDwdZW4Sr0ZNiFds0RqEtRdwMR9Ty0Ndl96NHHjvqOd+3bcPacS9Nlr+EXWnOCacIHCq
         0Jzyw0Y9gwuINHRzZPwhHDkWCZgqjnK/8ymvgFJ/Zb9OxhvPZKnJmmfvRCDfwoM8829t
         Mw55lbXRjDoHLLEfJofyWbzI6wN6KmasEq4P5JtgcCS+sPXhycqgxd2XZO5f0EP20yDr
         sD0aroNVc0Q2uHBGZgiqXDVApIYzbtFmNK5ZeEl3G6itieGcCZEYb1WbR8KJ51Dl9+bd
         0VQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 188si5111094ybo.326.2020.11.26.03.24.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 03:24:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiFOP-0004a5-73
	for alex.bennee@linaro.org; Thu, 26 Nov 2020 06:24:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kiFNI-0004V4-HQ; Thu, 26 Nov 2020 06:23:44 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kiFND-0003rC-CE; Thu, 26 Nov 2020 06:23:44 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Chb3D36tpzkcb7;
 Thu, 26 Nov 2020 19:23:04 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Thu, 26 Nov 2020
 19:23:23 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <peter.maydell@linaro.org>, <jcd@tribudubois.net>,
 <peter.chubb@nicta.com.au>
Subject: [PATCH 1/5] i.MX25: Fix bad printf format specifiers
Date: Thu, 26 Nov 2020 11:11:05 +0000
Message-ID: <20201126111109.112238-2-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20201126111109.112238-1-alex.chen@huawei.com>
References: <20201126111109.112238-1-alex.chen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=alex.chen@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.chen@huawei.com, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GOoCIC+HtEl+

We should use printf format specifier "%u" instead of "%d" for
argument of type "unsigned int".

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 hw/misc/imx25_ccm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/misc/imx25_ccm.c b/hw/misc/imx25_ccm.c
index d3107e5ca2..ff996e2f2c 100644
--- a/hw/misc/imx25_ccm.c
+++ b/hw/misc/imx25_ccm.c
@@ -91,7 +91,7 @@ static const char *imx25_ccm_reg_name(uint32_t reg)
     case IMX25_CCM_LPIMR1_REG:
         return "lpimr1";
     default:
-        sprintf(unknown, "[%d ?]", reg);
+        sprintf(unknown, "[%u ?]", reg);
         return unknown;
     }
 }
@@ -118,7 +118,7 @@ static uint32_t imx25_ccm_get_mpll_clk(IMXCCMState *dev)
         freq = imx_ccm_calc_pll(s->reg[IMX25_CCM_MPCTL_REG], CKIH_FREQ);
     }
 
-    DPRINTF("freq = %d\n", freq);
+    DPRINTF("freq = %u\n", freq);
 
     return freq;
 }
@@ -136,7 +136,7 @@ static uint32_t imx25_ccm_get_mcu_clk(IMXCCMState *dev)
 
     freq = freq / (1 + EXTRACT(s->reg[IMX25_CCM_CCTL_REG], ARM_CLK_DIV));
 
-    DPRINTF("freq = %d\n", freq);
+    DPRINTF("freq = %u\n", freq);
 
     return freq;
 }
@@ -149,7 +149,7 @@ static uint32_t imx25_ccm_get_ahb_clk(IMXCCMState *dev)
     freq = imx25_ccm_get_mcu_clk(dev)
            / (1 + EXTRACT(s->reg[IMX25_CCM_CCTL_REG], AHB_CLK_DIV));
 
-    DPRINTF("freq = %d\n", freq);
+    DPRINTF("freq = %u\n", freq);
 
     return freq;
 }
@@ -160,7 +160,7 @@ static uint32_t imx25_ccm_get_ipg_clk(IMXCCMState *dev)
 
     freq = imx25_ccm_get_ahb_clk(dev) / 2;
 
-    DPRINTF("freq = %d\n", freq);
+    DPRINTF("freq = %u\n", freq);
 
     return freq;
 }
@@ -186,7 +186,7 @@ static uint32_t imx25_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
         break;
     }
 
-    DPRINTF("Clock = %d) = %d\n", clock, freq);
+    DPRINTF("Clock = %d) = %u\n", clock, freq);
 
     return freq;
 }
-- 
2.19.1

