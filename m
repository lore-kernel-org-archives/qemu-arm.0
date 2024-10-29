Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp106482njj;
        Tue, 29 Oct 2024 02:18:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCViM/YnwR3SSuEESiPPNZtDGEl5uhV7MXt/WcwS99D5xFdJdyC4aVULkDDtST38fSe2mio0kGPR3qxPuA==@linaro.org
X-Google-Smtp-Source: AGHT+IE0GnvJbPGQLxK1HCZ75xyeTYlVQDC9Tmr3LGSbp05d8CgHVd8S6znEOVJ0i0eLW3UKbdAv
X-Received: by 2002:a05:620a:4249:b0:7b1:49cf:6460 with SMTP id af79cd13be357-7b193f5ca49mr1820356285a.59.1730193513905;
        Tue, 29 Oct 2024 02:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730193513; cv=none;
        d=google.com; s=arc-20240605;
        b=etXtC0JNFDutIDK/5wdUWtwe0jF/ZpKFH4ULst8our1PWU5S7PRlr7RhW5/qKaHTz5
         0dilqreMNE9PJIMDQrrGWBpTIvUtqMUDELnQacVnsd59bXf0Yih1Z5xNAkxYtQWdpKkV
         H5TPeYbjN8YM+aXkt+7fSiD1i3q2poK0PAVrzEI6U+3szFwYCCZJh7cuc0ChLODyg1xu
         WSnOQwHkKCud82UIZPft92PboKBlyiBI4/Cn2GQqNm2JruHKBZdexlELsL/iAqNwl+S7
         0NOVu2j04W8WCLifWi8Udek/dLPxzvX2NvgUnsJSffsvrghcJ09MSjVKqWt/4r7XaTV9
         NbYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=20i3bUTzICHqdmFZs68jAJNk+SMoDbwSndl27h52WiQ=;
        fh=4rHsaFhVkVMXk5u1IVZO4usPBujjRbqK1KMv0eZ+6CI=;
        b=juwFgPjitEPR50BUBpvctCiC8MaP9KMQ4hmORQThIiim6pzt7KDJX33C3v02NvBQ9x
         +HHBdryLTyiFubaqCxRE1aqU8l79PEfQzPPYX9omUQVjZ5VOnuXpUKjaFir//7ek4oF2
         JbDPYSh4M9DgFcCaJg1dgcEycPSdeS5y4iYY6eEC5pPFKnHnf1t/Fg6pg3SGlouhaDQW
         QuIhS7rWYKAZ0Vy9rHYdTaeGkeVeOYrI2De93Yo9W6QesB3xEwAw7QRr2QYsf1MPEkvD
         Cw1EVmM20r0VqvxTXKHBBq/v/R8ixacHJc+EM4IZiEik6HX2maqWBgLcC4byWfkuuORO
         iRmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b18d36268dsi1079702185a.651.2024.10.29.02.18.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 02:18:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t5iMB-0000WO-OY; Tue, 29 Oct 2024 05:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t5iM8-0000V9-Ff; Tue, 29 Oct 2024 05:17:40 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t5iM6-0003A3-Au; Tue, 29 Oct 2024 05:17:40 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 29 Oct
 2024 17:17:29 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 29 Oct 2024 17:17:29 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Bin Meng <bmeng.cn@gmail.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:SD (Secure Card)" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 0/8] Support RTC for AST2700
Date: Tue, 29 Oct 2024 17:17:21 +0800
Message-ID: <20241029091729.3317512-1-jamin_lin@aspeedtech.com>
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
X-TUID: 7wLy+8ICGydf

change from v1:
1. Support RTC for AST2700.
2. Support SDHCI write protected pin inverted for AST2500 and AST2600.
3. Introduce Capabilities Register 2 for SD slot 0 and 1.
4. Support create flash devices via command line for AST1030.

Jamin Lin (8):
  aspeed/soc: Support RTC for AST2700
  hw/timer/aspeed: Fix coding style
  hw/timer/aspeed: Fix interrupt status does not be cleared for AST2600
  hw/sd/sdhci: Fix coding style
  hw/sd/sdhci: Introduce a new Write Protected pin inverted property
  hw/sd/aspeed_sdhci: Introduce Capabilities Register 2 for SD slot 0
    and 1
  hw/arm/aspeed: Invert sdhci write protected pin for AST2600 and
    AST2500 EVBs
  aspeed: Support create flash devices via command line for AST1030

 hw/arm/aspeed.c         | 30 ++++++++++++------
 hw/arm/aspeed_ast27x0.c | 11 +++++++
 hw/sd/aspeed_sdhci.c    | 40 ++++++++++++++++-------
 hw/sd/sdhci.c           | 70 ++++++++++++++++++++++++++++-------------
 hw/timer/aspeed_timer.c | 15 +++++----
 include/hw/arm/aspeed.h |  1 +
 include/hw/sd/sdhci.h   |  5 +++
 7 files changed, 123 insertions(+), 49 deletions(-)

-- 
2.34.1

