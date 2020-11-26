Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1345202lfb;
        Thu, 26 Nov 2020 03:29:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeRd4M1on8Sn77f3E++4EMlGN1b1eVM3kI9oU0s5ejaX8dhobLk7ckNir3UEH/SWxHUVWh
X-Received: by 2002:a25:d305:: with SMTP id e5mr4018976ybf.358.1606390150577;
        Thu, 26 Nov 2020 03:29:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606390150; cv=none;
        d=google.com; s=arc-20160816;
        b=IYDhPbvjdYgX0ovHhtate8EMsiSTXaWGGv9g/LkYZz7H5MRaYEVAEiyJP8lPzFQqJv
         xY2Hn6Tk3bTP5EOPUXB2vdSt3lic9S6PoKsMm7dT+WSEiXym6bVKnAwmNGzaBiCyZDub
         s7e+R7hiM4s4/zB5CiSL6nkVbFKG/pEYF/TXYfwp2cx7+KL9O3gSh6tXa7BYrt0xYh1J
         Sj28rhLxp/hK+qq3Fjcla64PTU4/VEn1XU/cvQD+zBIgkmmm7QIga65diZlBXN0Vth8Q
         UTtZpZYmfVvuf5VYuWf/6tSVXRF7S6Ne8OEipXJzi8lq9AHyKy6mMGVlsjjxEsXjZ5ox
         AZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=4yrXxFL0ia2WhaG37JBUzU/3wWg03iUreRnUeoVbuL0=;
        b=0IsVa5Om6rFtY3MOgUGeaHdacQDoyUrJ4SfG8EeUfn7vXfZOW4Q6MH0+Ne6vVM7ijL
         y7v4JzcYWFPDvD9UIhZLC0fRYqeYDnVW/wr//0OKf7BFw5P5J3knhGY8DerqoqCNL2wO
         WXWErwXZ+/OPDEz62vCRhXKUcLYMNGxXuRDCZVsnbRaPKb8xBr1vmFRYWnQ4GgY2xRgw
         U1HoNJM/FNPNZHVAk6qiLmDPqfkjAePvDitjx51rJM/lKs7NcL55rSaWjlfkHVjJx2/x
         YAHMYNdhaihHfeJzVkrtoswriaCaqwI5LnOEBIwGDivsj9m2Q0vMC1MZwrp0Su7pCNO+
         epvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5si3906619ybk.75.2020.11.26.03.29.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 03:29:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiFSX-0001wE-Oq
	for alex.bennee@linaro.org; Thu, 26 Nov 2020 06:29:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kiFNO-0004Zk-5a; Thu, 26 Nov 2020 06:23:50 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kiFND-0003rD-45; Thu, 26 Nov 2020 06:23:49 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Chb3D2tWRzkbpC;
 Thu, 26 Nov 2020 19:23:04 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Thu, 26 Nov 2020
 19:23:25 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <peter.maydell@linaro.org>, <jcd@tribudubois.net>,
 <peter.chubb@nicta.com.au>
Subject: [PATCH 3/5] i.MX6: Fix bad printf format specifiers
Date: Thu, 26 Nov 2020 11:11:07 +0000
Message-ID: <20201126111109.112238-4-alex.chen@huawei.com>
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
X-TUID: pZv6LftqTc2k

We should use printf format specifier "%u" instead of "%d" for
argument of type "unsigned int".

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 hw/misc/imx6_ccm.c | 20 ++++++++++----------
 hw/misc/imx6_src.c |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
index 7fec8f0a47..cb740427ec 100644
--- a/hw/misc/imx6_ccm.c
+++ b/hw/misc/imx6_ccm.c
@@ -96,7 +96,7 @@ static const char *imx6_ccm_reg_name(uint32_t reg)
     case CCM_CMEOR:
         return "CMEOR";
     default:
-        sprintf(unknown, "%d ?", reg);
+        sprintf(unknown, "%u ?", reg);
         return unknown;
     }
 }
@@ -235,7 +235,7 @@ static const char *imx6_analog_reg_name(uint32_t reg)
     case USB_ANALOG_DIGPROG:
         return "USB_ANALOG_DIGPROG";
     default:
-        sprintf(unknown, "%d ?", reg);
+        sprintf(unknown, "%u ?", reg);
         return unknown;
     }
 }
@@ -263,7 +263,7 @@ static uint64_t imx6_analog_get_pll2_clk(IMX6CCMState *dev)
         freq *= 20;
     }
 
-    DPRINTF("freq = %d\n", (uint32_t)freq);
+    DPRINTF("freq = %u\n", (uint32_t)freq);
 
     return freq;
 }
@@ -275,7 +275,7 @@ static uint64_t imx6_analog_get_pll2_pfd0_clk(IMX6CCMState *dev)
     freq = imx6_analog_get_pll2_clk(dev) * 18
            / EXTRACT(dev->analog[CCM_ANALOG_PFD_528], PFD0_FRAC);
 
-    DPRINTF("freq = %d\n", (uint32_t)freq);
+    DPRINTF("freq = %u\n", (uint32_t)freq);
 
     return freq;
 }
@@ -287,7 +287,7 @@ static uint64_t imx6_analog_get_pll2_pfd2_clk(IMX6CCMState *dev)
     freq = imx6_analog_get_pll2_clk(dev) * 18
            / EXTRACT(dev->analog[CCM_ANALOG_PFD_528], PFD2_FRAC);
 
-    DPRINTF("freq = %d\n", (uint32_t)freq);
+    DPRINTF("freq = %u\n", (uint32_t)freq);
 
     return freq;
 }
@@ -315,7 +315,7 @@ static uint64_t imx6_analog_get_periph_clk(IMX6CCMState *dev)
         break;
     }
 
-    DPRINTF("freq = %d\n", (uint32_t)freq);
+    DPRINTF("freq = %u\n", (uint32_t)freq);
 
     return freq;
 }
@@ -327,7 +327,7 @@ static uint64_t imx6_ccm_get_ahb_clk(IMX6CCMState *dev)
     freq = imx6_analog_get_periph_clk(dev)
            / (1 + EXTRACT(dev->ccm[CCM_CBCDR], AHB_PODF));
 
-    DPRINTF("freq = %d\n", (uint32_t)freq);
+    DPRINTF("freq = %u\n", (uint32_t)freq);
 
     return freq;
 }
@@ -339,7 +339,7 @@ static uint64_t imx6_ccm_get_ipg_clk(IMX6CCMState *dev)
     freq = imx6_ccm_get_ahb_clk(dev)
            / (1 + EXTRACT(dev->ccm[CCM_CBCDR], IPG_PODF));
 
-    DPRINTF("freq = %d\n", (uint32_t)freq);
+    DPRINTF("freq = %u\n", (uint32_t)freq);
 
     return freq;
 }
@@ -351,7 +351,7 @@ static uint64_t imx6_ccm_get_per_clk(IMX6CCMState *dev)
     freq = imx6_ccm_get_ipg_clk(dev)
            / (1 + EXTRACT(dev->ccm[CCM_CSCMR1], PERCLK_PODF));
 
-    DPRINTF("freq = %d\n", (uint32_t)freq);
+    DPRINTF("freq = %u\n", (uint32_t)freq);
 
     return freq;
 }
@@ -385,7 +385,7 @@ static uint32_t imx6_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
         break;
     }
 
-    DPRINTF("Clock = %d) = %d\n", clock, freq);
+    DPRINTF("Clock = %d) = %u\n", clock, freq);
 
     return freq;
 }
diff --git a/hw/misc/imx6_src.c b/hw/misc/imx6_src.c
index dd99cc7acf..79f4375911 100644
--- a/hw/misc/imx6_src.c
+++ b/hw/misc/imx6_src.c
@@ -68,7 +68,7 @@ static const char *imx6_src_reg_name(uint32_t reg)
     case SRC_GPR10:
         return "SRC_GPR10";
     default:
-        sprintf(unknown, "%d ?", reg);
+        sprintf(unknown, "%u ?", reg);
         return unknown;
     }
 }
-- 
2.19.1

