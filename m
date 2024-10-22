Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2943077njb;
        Tue, 22 Oct 2024 02:43:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWcxDSIH/yeVM8QRIjCMm73bilBrSaZyR62dfBIqxZARtCXMmBb/zB+onhXJQyavxYskBzetyXHg80MrQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHRXn/E8MPrhf9GkKjXon31rzcO8tCuzO0VFDTk24PQmES9OmHirAytXCod9fc1F5erpcM7
X-Received: by 2002:a05:622a:40b:b0:460:ad52:aafd with SMTP id d75a77b69052e-460aed0241dmr183628691cf.6.1729590183741;
        Tue, 22 Oct 2024 02:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729590183; cv=none;
        d=google.com; s=arc-20240605;
        b=eqliEa5KIjsINd5IoiR8wDNnM0OfobLzO8COTWvI9+mKpRrfJY36IdXSLCOnqMPZCq
         R02B2tXANlQxLWmlXLRdASRr9NtIDpp2Dw+ZhI+4SwdSRNgB62jZw6lerOnXx7IEzmtu
         Q0Cski+bVtlbswa7ncjwXCIP8B+k1cxuRQBkOTi9Oo1AODRctUQ+KNd12aniRGtF6h91
         sJ+rU71pUbYnbn2OKpzHsi5X0y5Icg1GjLPNoQT5ma9TJJxO36jFkqrSPj2XiauY9yv+
         p4Ns6mK0RROHlr1n+rq5I84ejem7fYZaJcRh/XaQHUg+OVMGDlWXsXpmm7G6vVGtdJEI
         DEGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=KF9+RibDh8xUDqrP+t2VTBoWATe92qvO709pNsMb6Ts=;
        fh=tJ6TeM8XDKi6I9LERy0ves/+1WFn5YJhFzDAan5mwNk=;
        b=KyXmma2o0PtwkGppWj190WDM4c2do6FMhMEVSmvoutGY7uaCY0y0k8kSvQj2Qw3l6a
         pe6zitiJrYGpTrtkd8e/bqKfPPYXyAN2VJgSe8UuBgazxY7AVkPPzEHTGSCrLuY/YkLc
         gP8rJP82SRyvya0TjgzMxnLzhbEG34deMm8DqmN536AXBPi/UgiOvzuFlmEJaj5PHyTB
         oON3KtWDyRolyxCkE7hukBh7JqRxpHQuWRof9qElnrM2+B5YUYV80RXWgFvGlyJZocJ7
         VPnZjDNC4dDYRJ9DwaSI3Wk/8AKpK7E6C8WpR0ZtsRalJTG7ObG11ohXgHGrZvcEVeco
         e+DQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460d3ce5b78si64866731cf.274.2024.10.22.02.43.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2024 02:43:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t3BOl-0002wN-SH; Tue, 22 Oct 2024 05:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t3BOi-0002t3-OS; Tue, 22 Oct 2024 05:41:52 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t3BOh-00015E-Dt; Tue, 22 Oct 2024 05:41:52 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 22 Oct
 2024 17:41:14 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 22 Oct 2024 17:41:14 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "Kevin
 Wolf" <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>, "open list:Block layer
 core" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v2 08/18] test/qtest/aspeed_smc-test: Fix coding style
Date: Tue, 22 Oct 2024 17:41:00 +0800
Message-ID: <20241022094110.1574011-9-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241022094110.1574011-1-jamin_lin@aspeedtech.com>
References: <20241022094110.1574011-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YMysDUf+LuNV

Fix coding style issues from checkpatch.pl

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 tests/qtest/aspeed_smc-test.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index c713a3700b..4673371d95 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -353,7 +353,8 @@ static void test_read_page_mem(void)
     uint32_t page[FLASH_PAGE_SIZE / 4];
     int i;
 
-    /* Enable 4BYTE mode for controller. This is should be strapped by
+    /*
+     * Enable 4BYTE mode for controller. This is should be strapped by
      * HW for CE0 anyhow.
      */
     spi_ce_ctrl(1 << CRTL_EXTENDED0);
@@ -394,7 +395,8 @@ static void test_write_page_mem(void)
     uint32_t page[FLASH_PAGE_SIZE / 4];
     int i;
 
-    /* Enable 4BYTE mode for controller. This is should be strapped by
+    /*
+     * Enable 4BYTE mode for controller. This is should be strapped by
      * HW for CE0 anyhow.
      */
     spi_ce_ctrl(1 << CRTL_EXTENDED0);
-- 
2.34.1

