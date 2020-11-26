Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1342654lfb;
        Thu, 26 Nov 2020 03:25:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycFO9FNKCUu7nqCaofVqeWuLcYyTYmHAKhXnm5qEwezXr5fXhA+qMeY4NZddw2pFeOgR2H
X-Received: by 2002:a25:6851:: with SMTP id d78mr3703723ybc.408.1606389955915;
        Thu, 26 Nov 2020 03:25:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606389955; cv=none;
        d=google.com; s=arc-20160816;
        b=UNkjMCajOyeqRMgjz5xgGMblZ1ICdlpNliPy6UoI1OaavxM/peQnI/oD8qB5IHoqYE
         Emk6xD/dnkEjsVGjBLLyIdBhSw15lTkRgNvSlL0v11Mea2DOIOagRM1tpYsBuPjr3xv+
         Y2sdKuoVoNkCvM8uu6GI3OdIbXQvCmSdpuEHMIYjxicScHPxz2LDtyLxP6ZDC8sLLE/O
         HC+3bRn+Z6AdzfLVXk3GRcFf3llWRH3uuvsWKsuslMCdSIOYG3N1XnhRwdFkg/gdk7Iw
         3VwNgXH3mxcRSwJVyYXAfDs/acQakHIPermz50IBNe7sxy/nqsYEMYtjiWs6lA+YWWGc
         //1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=GKWprHIayoN2tVphNAPQKkpY+FC31hxsvhemmYj1bN4=;
        b=kCvoGR3Ucdsh6fOH8Ib3iyQ/QPpW66dKBU7vxfY2eh2yN4d7hsFfJvaPRNDpgfHzmS
         /mp/df1nKOFQ3fx9V/J8Lq9fzUdt9qk7DzmceuXUNQfrqRaWXEJNSw/KFbmRKibqMAUp
         vseNIEAODQOMz0Y3GMN8F42ulEwVMnSEupqHzVgLl0IfkMMCdxiozGNE0XgwThwfphiw
         sNonDlX9Ay9vhtpOtotZLeCrqeWxa2o4Kp+QOCHvYQPxbx4kOfAQBqMGpsnOR/0vkQNl
         RpPRQ0rmKZMOE0GTT3aWEU/HcUKFn4l2w+HTHe1rVR8jr2FxiRABDWy3HgSLK9WG2r1P
         BsUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e73si6703225ybc.179.2020.11.26.03.25.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 03:25:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiFPP-0006aA-5m
	for alex.bennee@linaro.org; Thu, 26 Nov 2020 06:25:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kiFNJ-0004WS-9D; Thu, 26 Nov 2020 06:23:45 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kiFNF-0003sm-Qj; Thu, 26 Nov 2020 06:23:44 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Chb3R4d0Fzhhfx;
 Thu, 26 Nov 2020 19:23:15 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Thu, 26 Nov 2020
 19:23:25 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <peter.maydell@linaro.org>, <jcd@tribudubois.net>,
 <peter.chubb@nicta.com.au>
Subject: [PATCH 4/5] i.MX6ul: Fix bad printf format specifiers
Date: Thu, 26 Nov 2020 11:11:08 +0000
Message-ID: <20201126111109.112238-5-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20201126111109.112238-1-alex.chen@huawei.com>
References: <20201126111109.112238-1-alex.chen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: IuXVHtDPE/eW

We should use printf format specifier "%u" instead of "%d" for
argument of type "unsigned int".

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 hw/misc/imx6ul_ccm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/imx6ul_ccm.c b/hw/misc/imx6ul_ccm.c
index 5e0661dacf..a65d031455 100644
--- a/hw/misc/imx6ul_ccm.c
+++ b/hw/misc/imx6ul_ccm.c
@@ -143,7 +143,7 @@ static const char *imx6ul_ccm_reg_name(uint32_t reg)
     case CCM_CMEOR:
         return "CMEOR";
     default:
-        sprintf(unknown, "%d ?", reg);
+        sprintf(unknown, "%u ?", reg);
         return unknown;
     }
 }
@@ -274,7 +274,7 @@ static const char *imx6ul_analog_reg_name(uint32_t reg)
     case USB_ANALOG_DIGPROG:
         return "USB_ANALOG_DIGPROG";
     default:
-        sprintf(unknown, "%d ?", reg);
+        sprintf(unknown, "%u ?", reg);
         return unknown;
     }
 }
-- 
2.19.1

