Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3788940lfa;
        Mon, 2 Nov 2020 02:05:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybj8MWd3dGAfWg13jWRwbn2cPVLeVjoOcN38XYhcUchCd3vSTz2o3vs6jfBG08m6dXCcuu
X-Received: by 2002:a0c:fac6:: with SMTP id p6mr21529694qvo.5.1604311515239;
        Mon, 02 Nov 2020 02:05:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604311515; cv=none;
        d=google.com; s=arc-20160816;
        b=k01en7WLHjAhsxF1n3PKKoCttZBva1gQiVqWMq+21DoFpIfivZeKI/1ydK0s33bqbu
         XvTCFyA9EnJoqoMAfP69ARt2WxnW6dVAw6Qqo0l2xNR2UIkyU0UaKn9lxN+VAuZK4cZ9
         Mr7DZqvYb2sXXeh/TCHOlcdVW+A9qn0QGmbS+7d5bw7wxXmLmqg+1M88zxOfInTjfoVg
         WtQGGmBmpM//QCU5taik1P89w3ZuDV3sgWT3JhVlQjmaxWsmWL0wvSpneicNvLlZSTZA
         9tbHS+vvlH/KKSA2t3ueOHrdNkoYGNI63PEvyDaIYzut2S7JYlk4264ykJZOdtjdWqSu
         Fw9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :subject:to:mime-version:user-agent:from:date:message-id;
        bh=4bxYag7XEIAuLOynTmhaeeG3+B00EZGfqXCB1b2dEt0=;
        b=di2e88bpcy4YM73+2zTJgL3tU+RFR77hqbh5fmphwP/YFEbT0E4CDOBo+DIXU0oHI9
         0PjApxybB9ecjklbkcwvA3YVOmIo3P6dx6XSL6/z8y1Wujcm193j0n78SosfB6cmUBK0
         AU5sh91yaAKOiWzvCAuFNhZBlRHDlH7mVlHse17gOQAf9RGLY0KA2UKT1OhjV6CBsu1k
         gLNI/cmkSD81wfWnLpc6bdnXCrDhSKI8+f42kTS4JXT1LbopjASZSs+W+QLB78O16Rr8
         +zovZFc2iL3jZsLX+sl0Q3SDYx3I8k2oBiZm3yxWygRMYJwCWurrANE1Mioua9N1VJ2l
         134w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8si8403621qtt.260.2020.11.02.02.05.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 02:05:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZWi9-0005al-HC
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 05:05:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kZWYz-0008JF-LL; Mon, 02 Nov 2020 04:55:45 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kZWYw-0000dR-MW; Mon, 02 Nov 2020 04:55:45 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CPpFH1lyGzLpPM;
 Mon,  2 Nov 2020 17:55:31 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 17:55:23 +0800
Message-ID: <5F9FD78B.8000300@huawei.com>
Date: Mon, 2 Nov 2020 17:55:23 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <balrogg@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] hw/arm: Fix bad print format specifiers
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 04:55:35
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm@nongnu.org,
 QEMU <qemu-devel@nongnu.org>, zhang.zhanghailiang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pIrlFlZ+1lQA

We should use printf format specifier "%u" instead of "%i" for
argument of type "unsigned int".

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 hw/arm/pxa2xx.c | 2 +-
 hw/arm/spitz.c  | 2 +-
 hw/arm/tosa.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 591776ba88..1a98f3bd5c 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -675,7 +675,7 @@ static void pxa2xx_ssp_write(void *opaque, hwaddr addr,
         if (value & SSCR0_MOD)
             printf("%s: Attempt to use network mode\n", __func__);
         if (s->enable && SSCR0_DSS(value) < 4)
-            printf("%s: Wrong data size: %i bits\n", __func__,
+            printf("%s: Wrong data size: %u bits\n", __func__,
                             SSCR0_DSS(value));
         if (!(value & SSCR0_SSE)) {
             s->sssr = 0;
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 32bdeacfd3..772662f149 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -586,7 +586,7 @@ struct SpitzLCDTG {
 static void spitz_bl_update(SpitzLCDTG *s)
 {
     if (s->bl_power && s->bl_intensity)
-        zaurus_printf("LCD Backlight now at %i/63\n", s->bl_intensity);
+        zaurus_printf("LCD Backlight now at %u/63\n", s->bl_intensity);
     else
         zaurus_printf("LCD Backlight now off\n");
 }
diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index fe88ed89fe..66b244aeff 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -150,7 +150,7 @@ static void tosa_gpio_setup(PXA2xxState *cpu,

 static uint32_t tosa_ssp_tansfer(SSISlave *dev, uint32_t value)
 {
-    fprintf(stderr, "TG: %d %02x\n", value >> 5, value & 0x1f);
+    fprintf(stderr, "TG: %u %02x\n", value >> 5, value & 0x1f);
     return 0;
 }

-- 
2.19.1
