Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3384909njk;
        Mon, 2 Dec 2024 18:15:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVyXIIiggavVuqbJkUpLbx1xmqnbevjWKtXk9PajR9ZHGmwNJZ0MBJW3aIkNoLDwJzSNoTGdTSOHASzDQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGUkMcIkNj+VpNrHrGVbPmOnrNXRSNDos6CT3VBcl5jpfKKy2k9AEptOWNJrbKowP+IdkYg
X-Received: by 2002:a05:6214:3305:b0:6d8:8e57:59f with SMTP id 6a1803df08f44-6d88e5708bcmr228644106d6.20.1733192132783;
        Mon, 02 Dec 2024 18:15:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733192132; cv=none;
        d=google.com; s=arc-20240605;
        b=kweAEZ5WIYfPwFmVxg49Cte0W/Fl/KPay5e+5B6pKUGMnw07gbCRh5lJ7nR0kMm7Md
         un1c+t3lRi3i1BVTwVbWgrDJrrNF+EwYoJEyniH+0zUBu0CfrqTKq/ATACM8ln8RTSq1
         kgQW84OcA0v4AvXrfoz+Xhwp1TveszXZD2rZCP1BNAGZsEIecQ8xTLGtYPl0qew8hmRs
         YYdiY2NVu8m+5l5cBQB7FL43WQkZxXr9TNqrFb4aVVlLp+LAcc2bJ9l3mEz4jW29nC69
         6UAuVwqOtYsj2a9QLZcx4JRuRDGfQBo0Jz/d9Z3dVUXuDA+GvyRDwo3qYHkSGa4+VGRa
         znAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=jO42toIGBNA1FNHWWQjT8bnKPQOzXb4hXfNJTqCM80E=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=fb9o/t6p8Zl1XkskXgUieC3APqb3LbBFOEJWLjtkFalZmUMTjgMMApgynsR2VULr5+
         VnFqHoQz3IRr4b5+flKD2JfpfiyAxUbTNYH7esCeiAX3eevKfZTBzzuPEf5tI3ZluE86
         PkQUh0Xsx/ZqfCgCJYsotqhivcD01bkD52MXpH3SkkRby37JJmYAPAAfchdMT/nG8DzA
         FbqWgRxoC5/9tnzZU/j9fPF/BVVge0dRnjbZP9pcw8QG7wz6DBok3kmTdT90UlV+xJQ+
         N8kxsv1sdWPf11H1IrWLfCL49+xN5fuf17QNDwPoNjwN+QzVP+hfOxzIlp/qpkCoJsVj
         vuuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8751ac08bsi124883536d6.33.2024.12.02.18.15.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 18:15:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIIRd-0005RK-Kx; Mon, 02 Dec 2024 21:15:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIIRR-0005P4-1s; Mon, 02 Dec 2024 21:15:15 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIIRO-0003dt-UE; Mon, 02 Dec 2024 21:15:08 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 3 Dec
 2024 10:15:00 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 3 Dec 2024 10:15:00 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 0/6] Support SDHCI and eMMC for ast2700
Date: Tue, 3 Dec 2024 10:14:54 +0800
Message-ID: <20241203021500.3986213-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
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
X-TUID: uFeMockAO4uD

change from v1:
This patch series do not support boot from an eMMC.
Only support eMMC and SD Slot 0 as storages.

change from v2:
- Add hw/sd/aspeed_sdhci: Fix coding style patch

Jamin Lin (6):
  hw/sd/aspeed_sdhci: Fix coding style
  hw/arm/aspeed: Fix coding style
  hw:sdhci: Introduce a new "capareg" class member to set the different
    Capability Registers.
  hw/sd/aspeed_sdhci: Add AST2700 Support
  aspeed/soc: Support SDHCI for AST2700
  aspeed/soc: Support eMMC for AST2700

 hw/arm/aspeed_ast2400.c      |  3 +-
 hw/arm/aspeed_ast2600.c      | 10 ++--
 hw/arm/aspeed_ast27x0.c      | 35 ++++++++++++++
 hw/sd/aspeed_sdhci.c         | 94 +++++++++++++++++++++++++++++++-----
 include/hw/sd/aspeed_sdhci.h | 13 ++++-
 5 files changed, 136 insertions(+), 19 deletions(-)

-- 
2.34.1

