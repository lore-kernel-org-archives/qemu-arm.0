Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp2003850njb;
        Sun, 15 Dec 2024 23:54:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXaSkYjW4+Fip3Lfr8Wv4DsiwJgGyX3mAGS1zSZTggjkL1WFqREA/2SI9gzafNmM0p34Kuy8ex91i2h5A==@linaro.org
X-Google-Smtp-Source: AGHT+IFVfR8G8XlrWUaCr4+DGgwQ6Ww0/AJj46pKEJWp17aKG71M+Pef2chj12wQI1u+wWJl3nba
X-Received: by 2002:a05:620a:7204:b0:7b6:d631:266f with SMTP id af79cd13be357-7b6fbee8970mr1518935185a.14.1734335660822;
        Sun, 15 Dec 2024 23:54:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734335660; cv=none;
        d=google.com; s=arc-20240605;
        b=UuzfDasYQQZGsFs8jnbELJe486KlOMej+Rg49iHNzwadmBAgFYEgHUCxyCNcJyqIWA
         4/r0CslI8sh1jMpG59E4KEyngyN2rzXLTO7dvVR22PF4O/BIhvA4bX7ompw7ilHLhcUz
         SKQp1kMxGZCPe1UFP9BOKkd+XhC9uSm0B/NwIKJkrLzHcEKHNddO5QfZxixBkPk2vJPi
         9XNdqDDKk9OS9Xmm0X9C6NOSetyDoNrdOsRjKlCwqHqUUJZbX4XCILd0mk3s/2xZcecU
         uxveVceMjwsl9M4N+BIKfLtbs0qclQnLoITWpeAWPvZVV3/TPPY0gTvSmrV3ytolxg10
         f8Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=/O1XUJxgfhuVd0rRcOnreTnhG1HaLo/nD7eMlfS87eU=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=dn1q2Z0LYsv4WiOjUTrnRP15Ev7lltXJ2iSkGOHXP8i93DrcL65a8ZvUGbl3j6abyg
         Xtds6d18KZr64FqnrB6c2eEZG+QCjQhwZQFpdvkEsLxUCq4nTuPWKAAkbeNs4kucIonC
         0OQcl1EUA3pbNTqhQV2RQgCFAMOyEpcp6OzfPsGqevjEXY7o0tDlWGfNkUVOgrzUvs+z
         OtVtcPEmP31nUcYICYcWFVqLWdu45pwE9Z1DncRCkv1Gfxh1hGcVw9Jx6rjPgQSCOaqI
         vh8GgPgPMDHt2EekNy3ikg0qzMJUziZnPVKZhrYKV/mgPKJUpKmIir2Ij38O6WDQ7Ha+
         T/JA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b7048c0208si603654685a.257.2024.12.15.23.54.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2024 23:54:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tN5vg-0004Tq-Tp; Mon, 16 Dec 2024 02:54:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tN5ve-0004T5-Ah; Mon, 16 Dec 2024 02:54:10 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tN5vZ-000791-US; Mon, 16 Dec 2024 02:54:09 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 16 Dec
 2024 15:53:53 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 16 Dec 2024 15:53:53 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 0/3] Support timer for AST2700
Date: Mon, 16 Dec 2024 15:53:49 +0800
Message-ID: <20241216075353.1308043-1-jamin_lin@aspeedtech.com>
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
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: +Spk3LSKgPMD

v1:
  - Support timer for AST2700
  - Introduce new "aspeed_2700_timer_read" and "aspeed_2700_timer_write"
    callback functions and "aspeed_2700_timer_ops" memory
    region operation for AST2700.
    Introduce a new ast2700 class to support AST2700.

Jamin Lin (3):
  hw/timer/aspeed: Support different memory region ops
  hw/timer/aspeed: Add AST2700 Support
  aspeed/soc: Support Timer for AST2700

 hw/arm/aspeed_ast27x0.c         |  17 +++
 hw/timer/aspeed_timer.c         | 231 +++++++++++++++++++++++++++++++-
 include/hw/timer/aspeed_timer.h |   2 +
 3 files changed, 249 insertions(+), 1 deletion(-)

-- 
2.25.1

