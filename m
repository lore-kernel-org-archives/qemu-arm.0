Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp33877njb;
        Wed, 4 Dec 2024 00:07:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXHBTH17BkZqQW87uChMFB6fiOwnu82oNoOjpT1rmUDIcFi3G2I1TJZwjeq+lOutkEF9wR2xo1YEeUM8w==@linaro.org
X-Google-Smtp-Source: AGHT+IFsFZulZ/sme6/zrZObmniWKdTqp6MrBIygaTTCFQXZEIkaNQI84a+Rv+h99Ke3qxYxOuqP
X-Received: by 2002:a05:622a:109:b0:461:6613:18ac with SMTP id d75a77b69052e-466c1be41e0mr467225991cf.17.1733299647036;
        Wed, 04 Dec 2024 00:07:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733299647; cv=none;
        d=google.com; s=arc-20240605;
        b=YliPjuNJEks2csH8GmHBTk+wY4OGjDDjZmIcQAQzdq2H5gmq9blCsKaBVHcjZW9Tf7
         30uMsZ0Lc3W4wVkP1qt+S2r6Z0lTn0QPPOXjnid2ZE8yoTL4chwpF2yLzoDYXulKaENW
         gl7T9tXyaNTpcuA2190A/FjhgkBd0iG1MUHJvNq7UOuoywUP63l50kmX9M2NmjTVI//c
         XKWTzx6FU9NLFb7zb8+rBxGYueBvNq6EwrMmKpg9VP+3bN65EfhB0PDH81/qUosoSm4v
         AJrBHFOjAwJFnT/IPvamqTj8NhwqUBYtecec1ds8XgKytuJg4BKsxCBa+ryWR4H1R0mf
         LMVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=iUCubCKrk1ofsgKy0DbIWvTAgFLIs9MQVXZdhO+xwqI=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=LHYZHNetV3Mlo+i9unUZZIDVcnrUARQNmwHzG6b3QcFNq6P43cc6il9R37b8APyNRA
         AlOHnLAiTwo6Tak5m3m6eLRxLKSuRdfcZYksqDbIZtRuA3N/DNkYIggkCnIRmMAl5rQJ
         cfwy0U8rhqXVP935fD7aZxYrZ05xhwR8XyqCaRfq5AnVelz7/kwX//uG5+MvIFEFtida
         vHfcQxPgNU3uesY5gx3zaGh6GtDa00itPkpisu+O7ZWB4+z4C1EeqJ5NyYRSWXlJD5EX
         qca61G2De7NEcHHF0hlmi8/Q7+1xmPwzioSfSxnT/yt1bLlOJGqztYPrjOy01tamdOOQ
         TrTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c425846csi151886851cf.590.2024.12.04.00.07.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 00:07:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tIkOP-0004Fh-Iw; Wed, 04 Dec 2024 03:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIkOJ-0004Dc-Rw; Wed, 04 Dec 2024 03:05:48 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIkOH-00082v-DR; Wed, 04 Dec 2024 03:05:46 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 4 Dec
 2024 16:05:24 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 4 Dec 2024 16:05:24 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v3 4/7] hw:sdhci: Directly set sd_spec_version instead of
 property
Date: Wed, 4 Dec 2024 16:05:20 +0800
Message-ID: <20241204080523.4025780-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241204080523.4025780-1-jamin_lin@aspeedtech.com>
References: <20241204080523.4025780-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: q/eBfw0+iGKg

Directly set sd_spec_version instead of property and remove
unused local variable.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/sd/aspeed_sdhci.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
index ccaeefa75b..4e64e2537a 100644
--- a/hw/sd/aspeed_sdhci.c
+++ b/hw/sd/aspeed_sdhci.c
@@ -160,13 +160,9 @@ static void aspeed_sdhci_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &sdhci->iomem);
 
     for (int i = 0; i < sdhci->num_slots; ++i) {
-        Object *sdhci_slot = OBJECT(&sdhci->slots[i]);
         SysBusDevice *sbd_slot = SYS_BUS_DEVICE(&sdhci->slots[i]);
 
-        if (!object_property_set_int(sdhci_slot, "sd-spec-version", 2, errp)) {
-            return;
-        }
-
+        sdhci->slots[i].sd_spec_version = 2;
         sdhci->slots[i].capareg = asc->capareg;
 
         if (!sysbus_realize(sbd_slot, errp)) {
-- 
2.34.1

