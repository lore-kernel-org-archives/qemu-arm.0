Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp48967njb;
        Wed, 4 Dec 2024 00:45:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXTD/74efN3XjxAWcXYbLQpgQuUHam7aeCcd8mN6+dI0hiDExpr7WnWUN3jDeJPa7UQk1YFdfzUTDpFdQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHWpPYQKDsbZ5irDhFXg/+0rP4hMl/5NQfNW/5Hi3c67UrDT196QXKB1/ZTyITet7mxfmXY
X-Received: by 2002:ad4:5ced:0:b0:6d4:8ef:1514 with SMTP id 6a1803df08f44-6d8b7411279mr86761016d6.47.1733301915409;
        Wed, 04 Dec 2024 00:45:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733301915; cv=none;
        d=google.com; s=arc-20240605;
        b=lRUzyoiDWPBaf5ikhy5igY/yR1y0bZYVJ2OwcU5QrYEDkFINzkSM/9AyCsHqCBV/eu
         BjTUAm1xdjfjaaruTZ3ADI2KXUIl5W6BPvyk6eaWejlV5FzlnGnQHlz+/G7CS6qP9k9m
         IJboec62pK5MHOzzytA/SyteJBC6UcwUOgienOrVB+NtUpNXrZPDB2iXrxNzLJD+9Xnw
         vSCmI3mBzzhzystkBMOaNsHqOsZv6qb/164jkp6bJfoKxkspusZWjK5B3H30VTavCXBP
         PpuwXqS9ojmw1Pw0Lq65F+dj+mgq5O6QxrmjRsxou7oETwye0kBh8pcJE2/lFSCHo8xU
         0nWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=sZKn8njYPHOBNLhPakBwGu9bE59Y2qCHW1MOPFfOp0k=;
        fh=oHzELYP6xEldnfh1elECkRDXzq+40wADKO/d7kYb8Lg=;
        b=HPw9LA2dLqD/SqvIXEyXFykJnejJVK8t5BgMJqydgGgtvk/fPE0xBw3YM+eamgGzaW
         t/LiVGbvlGCi3PKdPtMUYQVF6UKMmF5L5nDtZpuz/jAb/w1het7UU9reEKDEP8GcNXm4
         L8cMNJvK+yXOkljZ9xoZF9po6oQZiN0EXsnCZMXVwspA1jajUtDIAwFPyrhfVJ+NLMUj
         CHv4bVtSorAHMKZKbpSgBFOpK3AA7Z5o8gu64emEUmK2L35Yx6isNEn37VFCSqu60V/k
         NqMsf5W53Du2Cx8gHZ4y3dsNFRMF7rqLg/Ig1HRY0sXqKn/1vzX36HjfQRW7vy5AC7fA
         Y6qA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d87dcc0dbesi147859106d6.517.2024.12.04.00.45.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 00:45:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIl0L-0002wT-A2; Wed, 04 Dec 2024 03:45:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIl0K-0002vJ-Lh; Wed, 04 Dec 2024 03:45:04 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIl0J-0006xz-Av; Wed, 04 Dec 2024 03:45:04 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 4 Dec
 2024 16:44:53 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 4 Dec 2024 16:44:53 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v4 1/6] hw/sd/aspeed_sdhci: Fix coding style
Date: Wed, 4 Dec 2024 16:44:48 +0800
Message-ID: <20241204084453.610660-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241204084453.610660-1-jamin_lin@aspeedtech.com>
References: <20241204084453.610660-1-jamin_lin@aspeedtech.com>
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
X-TUID: Tzt86TphIu3L

Fix coding style issues from checkpatch.pl.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/sd/aspeed_sdhci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
index 98d5460905..acd6538261 100644
--- a/hw/sd/aspeed_sdhci.c
+++ b/hw/sd/aspeed_sdhci.c
@@ -87,10 +87,12 @@ static void aspeed_sdhci_write(void *opaque, hwaddr addr, uint64_t val,
         sdhci->regs[TO_REG(addr)] = (uint32_t)val & ~ASPEED_SDHCI_INFO_RESET;
         break;
     case ASPEED_SDHCI_SDIO_140:
-        sdhci->slots[0].capareg = deposit64(sdhci->slots[0].capareg, 0, 32, val);
+        sdhci->slots[0].capareg = deposit64(sdhci->slots[0].capareg,
+                                            0, 32, val);
         break;
     case ASPEED_SDHCI_SDIO_144:
-        sdhci->slots[0].capareg = deposit64(sdhci->slots[0].capareg, 32, 32, val);
+        sdhci->slots[0].capareg = deposit64(sdhci->slots[0].capareg,
+                                            32, 32, val);
         break;
     case ASPEED_SDHCI_SDIO_148:
         sdhci->slots[0].maxcurr = deposit64(sdhci->slots[0].maxcurr,
-- 
2.34.1

