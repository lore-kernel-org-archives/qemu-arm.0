Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp600720njc;
        Tue, 25 Jun 2024 00:08:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXdJtlE4DIr/5U+XCKSdAn+6ODS8yrjpCHttU8CeCi80Cz7t64D/h8s8XKw8mFpn18fepaYz6dM2TOtQFdVRfMzS7jSjNpS
X-Google-Smtp-Source: AGHT+IGqdXDHF1M8qmlbtsNXRLQdyLCA7fGl0wLbuMPFiN2Nlz6EOvIGG/q7PDj/a7UfxaL9pUYg
X-Received: by 2002:a05:620a:4503:b0:795:be11:c626 with SMTP id af79cd13be357-79bded4d5f0mr1288744185a.26.1719299307709;
        Tue, 25 Jun 2024 00:08:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719299307; cv=none;
        d=google.com; s=arc-20160816;
        b=MKVgfpR+TCr4ZI0jvIlvcd9pvZucrJ7VltwbJxmr/0eHsSykEnm447hPmO3DEETcwE
         rvZ0VVvUbmZ2lJzZixhehARMj7HtEyU211HAyktDtoTum7xwCnEUB89v98binY/CukZK
         xKnt6/xvUFOyRCPt3nQE3y8rlFQVjpwhMWYrF1XPJfszJGTa2AXeFRq9E+Wb6lJ7fO27
         QNUZzWvdiK4znGhkKjUB+trqZlvJI3Jg073n5dJY0KFHrbzbu1BuGwHWsrOv9LjVLSeJ
         yuAZX5pyJgsGtwvXRd1409RT95fGUKdjD7JipS9zujl11yjDClND+tUMzTncsiOk7ReW
         N1YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=556UwNOCEDY73+YmleRjNcS5ZeHYfcHgGnyyh9gKb5o=;
        fh=HrGJUFnZHz7hWxi+LYnD6UY3P1PFtgkIHq6jddVMKYw=;
        b=BlQ8Aetux79971Xr49wp8DygKdpnWHQVYZxnn1XKlxyqBh7WVr25KXBvRLdObf2EpG
         dudx/flUgmq30oWry+JYOMUBifi9uzRWrwOuF7ilFY3PNM2WOBZqeMBjavKCvOS2MaMK
         hlIeXewB9wB+pRF+oq0P/Lbh2JnrRDFYZ14mq4glCPiPi+rKsAULYCJd0XxFRXxNtqQE
         425t6+VfoagB25XJhQZ+HVFlpF7cH3JW+ulKu/D8xvovf65Wt/WkTCXAfC8N/ic2gT1K
         DP49T7RSMFpsPvl8AIXZ64uOLiaWKP5Ts04rouCS8AYckFZQ1cj7A0qCWnYtQU9K6DXE
         vG7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce92c01csi1037975085a.445.2024.06.25.00.08.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 00:08:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM0HR-00011r-Nj; Tue, 25 Jun 2024 03:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sM0HR-00011Z-5i; Tue, 25 Jun 2024 03:07:53 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sM0HP-0007Jh-PU; Tue, 25 Jun 2024 03:07:52 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 25 Jun
 2024 15:07:41 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 25 Jun 2024 15:07:41 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v3 2/2] aspeed/sdmc: Remove extra R_MAIN_STATUS case
Date: Tue, 25 Jun 2024 15:07:40 +0800
Message-ID: <20240625070741.2852946-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240625070741.2852946-1-jamin_lin@aspeedtech.com>
References: <20240625070741.2852946-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: +jmq3kmK0OG9

Coverity reports that the newly added 'case R_MAIN_STATUS' is DEADCODE
because it can not be reached. This is because R_MAIN_STATUS is handled
before in the "Unprotected registers" switch statement. Remove it.

Fixes: Coverity CID 1547112
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
[ clg: Rewrote commit log ]
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/misc/aspeed_sdmc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 93e2e29ead..94eed9264d 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -589,7 +589,6 @@ static void aspeed_2700_sdmc_write(AspeedSDMCState *s, uint32_t reg,
     case R_INT_STATUS:
     case R_INT_CLEAR:
     case R_INT_MASK:
-    case R_MAIN_STATUS:
     case R_ERR_STATUS:
     case R_ECC_FAIL_STATUS:
     case R_ECC_FAIL_ADDR:
-- 
2.25.1

