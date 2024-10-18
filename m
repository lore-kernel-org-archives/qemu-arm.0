Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp611868njb;
        Thu, 17 Oct 2024 22:32:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXrLoSXyw+0p1+8kMsx3NOVSoFbFhSsj9ecO9XIFnOgdz8x1o/bxD9wHbRh6p0Mh54TnftcfwG3rJ32lg==@linaro.org
X-Google-Smtp-Source: AGHT+IH8RLQ/VmzAx7xYHURQqTkUX6P+HN6RMBbanzpW6ikAzSooWBRpzBdY/mt+oCGnkpbSkmh4
X-Received: by 2002:a05:6214:3115:b0:6cb:ba3c:80f0 with SMTP id 6a1803df08f44-6cde14c2cf2mr13699406d6.5.1729229551136;
        Thu, 17 Oct 2024 22:32:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729229551; cv=none;
        d=google.com; s=arc-20240605;
        b=E0PUI/G0Dc/RdxvTQyy0ptNnsDYyV9D5/MgMxO/GYODgaFLr6tixYvv0uLsMo+d+uh
         4eJ8ugLgCN1+mqpn1f27BLOUKNIXKmsgE7rKPE6k6ux5hWUXaEo57aw3+jGNs/Zhat6I
         Gn8tBnksaXpTX7EAW5A0X9iN00lI75RjUOuRglkXOD409Q4yVoMUtkmKLMQUtHLVuUlQ
         g/n67lcojxTQYyyDCt2SvLGNfmP6DUWmiYi+x6f5sYr9L/8KEPZsm30g7B6GlgbLFf2k
         JRJMMHjxxYAX3PMJDED1IlWsewzUdgQAwDp1lCy28OVaaXcIERMv7RprzvAs4tLvJQzm
         EtaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=fwcUepWsMgOS0CLvt7/d9v5WRUbMQnuuw5B4T9IggpE=;
        fh=RVX+uUL/oYxgKlLpNyiQfzI75/ka+93kXvmeIy2Oap4=;
        b=Zcu/FWFIoSgsO09HK7ZquRVsz72wSxNxyfQFF27sOVYjcIX6drHXPxaxe6rlQQE5C+
         Q9db8mQ5KD6OWo0tQam8icUuPs/aS0YZ20o8zHjvzZhHQYCPcWp1e0NH+SM8L35pay1+
         mocC0PjdwH58bwIFk0FCfJuCTjeLVqWmw2/W4z7fvUNpAT/1LxpFr/5+O21Q74DIX5lV
         ZrkA71M8eF+ULqF8Q9Ya7/I9Gt6pAKvq7gph0xij9GV1uV324FaDxEGlnj17xf/ToKh6
         Oquf7y534zMSoiH4xDHPZw2QCkyL+ZgKz0GnqCSlGOmsUArN4rH/qn9YMLlA2EBgvn+X
         zUww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cde12427dcsi9515646d6.246.2024.10.17.22.32.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 22:32:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t1fab-0008TA-Pb; Fri, 18 Oct 2024 01:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t1faY-0008OM-FP; Fri, 18 Oct 2024 01:31:50 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t1faV-00089Y-6E; Fri, 18 Oct 2024 01:31:49 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 18 Oct
 2024 13:31:14 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 18 Oct 2024 13:31:14 +0800
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
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 07/16] test/qtest/aspeed_smc-test: Fix coding style
Date: Fri, 18 Oct 2024 13:31:03 +0800
Message-ID: <20241018053112.1886173-8-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241018053112.1886173-1-jamin_lin@aspeedtech.com>
References: <20241018053112.1886173-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vqCmuwL4ND5U

Fix coding style issues from checkpatch.pl

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
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

