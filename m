Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp49129njb;
        Wed, 4 Dec 2024 00:45:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXpSPRrVOYdXptYl9xB/9/k7QYEjS/x3yzLmh8fpcDKQCZ+rmoiccvC4MpmQ9OZyFiwJJJLru1CFx0b/w==@linaro.org
X-Google-Smtp-Source: AGHT+IGKv9K7JF0I5G45mHUdRrsl5spI35+efttTwEYnkriJ1pLkHG/1hIUxMgTm/BYmaUBWYeQE
X-Received: by 2002:a05:620a:4551:b0:7b6:740f:a535 with SMTP id af79cd13be357-7b6836dc212mr4971876385a.0.1733301945237;
        Wed, 04 Dec 2024 00:45:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733301945; cv=none;
        d=google.com; s=arc-20240605;
        b=MRjgODFe3MymcWzOztSEY66LeXmas76lpPkl2lzgyabEVoobngB2seV5pkLj+L/F1H
         5ut3369VeXWkIXIb3DdNBHuACpuFo1cyqUcemMEza0HFSKQpr3ywYpJQkoiN6HlTeHTT
         i4P9sKwbnr26arBoA2cH9/ArM89f+BQeaXevYibhaSiq5F4jUOycu1162UBQ5y8ZogJc
         A3DJVG1KOWzFjuRQ2Jr8WkfEJ4QULY+EMzNQBKejUDF5Z3LPeL+RLEbFfV5JbLtIviNu
         X31rb9aumEg1usJTaWNxWJaD/If87LSbUP3QKc/ZJz40eFCaPjAyw7Ykxig1XfHGOoTS
         u57Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=5GnuPHVB2+MTAdC/0mclZ6XJVJGilRFe1XHUSyZ4ZXM=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=QC5bLL+0yxXCdHQLELiWzPWNYpegsTOCoGqsURG4R9fGxJtSV12s1pdBvkbCE+fud/
         JZqSXc2cUQOa3y/863NCc6et+r3o9rzFbdYb1MGjdE54hi7UkYKeoHo+Ie55uNwzMgHf
         flIQvPMmT10VoZAB7Qs74XeLXv5FrEx/F8ueGWpET4cPqhntmty/pp0A2MOIL5RX1u7m
         x660ZH5qunp8EmcFONuUIduHEYPHRgZDYXW5pHUMmY7QuM9pqE/Y/oxu8d/D61ZQl8sJ
         8UeNUX4G8x4cp0aGf08fBm99rghLnzJPkGq23JeWccoYPwXgUHETxemYjFBKNQgrnzZv
         2COw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849bfb66si214386585a.357.2024.12.04.00.45.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 00:45:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tIl0K-0002ub-OL; Wed, 04 Dec 2024 03:45:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIl0I-0002t0-Ec; Wed, 04 Dec 2024 03:45:02 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIl0G-0006xz-4b; Wed, 04 Dec 2024 03:45:02 -0500
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
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v4 0/6] Support SDHCI and eMMC for ast2700
Date: Wed, 4 Dec 2024 16:44:47 +0800
Message-ID: <20241204084453.610660-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
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
X-TUID: fctL1DQQLTA5

change from v1:
This patch series do not support boot from an eMMC.
Only support eMMC and SD Slot 0 as storages.

change from v2:
- Add hw/sd/aspeed_sdhci: Fix coding style patch

change from v3:
- Directly set capareg and sd_spec_version instead of property
- Keep DEFINE_TYPES

change from v4:
- Keep to set capareg and sd_spec_version by property

Jamin Lin (6):
  hw/sd/aspeed_sdhci: Fix coding style
  hw/arm/aspeed: Fix coding style
  hw:sdhci: Introduce a new "capareg" class member to set the different
    Capability Registers
  hw/sd/aspeed_sdhci: Add AST2700 Support
  aspeed/soc: Support SDHCI for AST2700
  aspeed/soc: Support eMMC for AST2700

 hw/arm/aspeed_ast2400.c      |  3 +-
 hw/arm/aspeed_ast2600.c      | 10 +++---
 hw/arm/aspeed_ast27x0.c      | 35 +++++++++++++++++++
 hw/sd/aspeed_sdhci.c         | 67 ++++++++++++++++++++++++++++++++++--
 include/hw/sd/aspeed_sdhci.h | 13 +++++--
 5 files changed, 117 insertions(+), 11 deletions(-)

-- 
2.34.1

