Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2774027njd;
        Tue, 22 Apr 2025 19:57:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCAw1uaGpRochLJM9Q4jEKlSaE8kwyiNdRVIPvBNG8R496jRI/KfDsnKfs8/kC42P8LtzKWLmdxaqf6Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHcr1GAACDNYNas8ib4goSXFjAzqpztbugMXOi6ABb9T9JLymcEf0SAc1UT/0p1qXmBbFzx
X-Received: by 2002:a05:620a:178f:b0:7c7:a5c1:8247 with SMTP id af79cd13be357-7c927f633c4mr2669269285a.9.1745377057048;
        Tue, 22 Apr 2025 19:57:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745377057; cv=none;
        d=google.com; s=arc-20240605;
        b=RgpSBimSK6qQD23/VakX2A3LO3D0cG2W3Us//pU3E1SgWaq3YHVZICTkWyzDjxmNCY
         +pwyXfVQCWi4jny0cpwnzWjJAJB8YdI1cQyn1xIs+LDIrcO2cogdDinbfeZYt+b4831W
         IbP/c8qh/xrcaT12QwJ5+qUGjTuSATU8fEjRe0/XbfPU/LoXAaVJj5E854AboVF7AXh6
         kcf6RxI1J6uW5+4GnseNjv0ZVKwznyVXyCUmDRGQWMpaAoe+KnoNs/vwWFGhHIS1Mv04
         cO3h7ASpo/ZKCw4S//tfhyG0x3va8BZELllL6HpaYzUH9UtfSYRF5vNc3EU+rE7YHCqf
         oSWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=FGrX+zw2u40xmlWvevVVxrXcwGAiDbNqL8Dc2meH+gg=;
        fh=3E+GgkJ59sv88GyUpaKWpV4DoJlJz+B5Ev7H4uQXan0=;
        b=UKSE7bHjE6fi/L1vxgrpzJfEBHgT43MRquEcnjGphPzMsUdr2ip3M0JF1KCW/kWn4Z
         ccOnQEhL+m3oyIZnYMAGMRmzBySEwz1/FegTNwd0f5e/zqsB8lyrI7RCQ8PfExetlfUi
         IlbNdS1bYeBrROBKG4ksW/M6dPXAidYhogrMVcWVIlVxV2KOIc1xATTnbsZ0sYJ3iTc4
         K58a3HgEEQssTZGAnUvfYKLywkhkuzCX1Zw/NBmMHT0ujjQfeOgpp/XUYl1cyyRaBShY
         xy/3mRUSLyWP51faslABkZtEgfj+UwBpjJiZpoGmR+p/+Bw0dwk6B9dDJYR0VFBiQIhU
         8/lg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c92770d42bsi1187033485a.381.2025.04.22.19.57.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Apr 2025 19:57:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7QIV-0007Bt-2A; Tue, 22 Apr 2025 22:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1u7QIL-0007Ax-9c; Tue, 22 Apr 2025 22:57:05 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1u7QIH-00043I-Vl; Tue, 22 Apr 2025 22:57:05 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 23 Apr
 2025 10:56:51 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 23 Apr 2025 10:56:51 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>
Subject: [PATCH v3 0/3] hw/misc/aspeed_otp: Introduce OTP memory and integrate
 with SBC
Date: Wed, 23 Apr 2025 10:56:48 +0800
Message-ID: <20250423025651.189702-1-kane_chen@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=kane_chen@aspeedtech.com; helo=TWMBX01.aspeed.com
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
Reply-to:  Kane Chen <kane_chen@aspeedtech.com>
From:  Kane Chen via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4TMU2/7/wdpn

From: Kane-Chen-AS <kane_chen@aspeedtech.com>

Dear reviewers,

This patch series introduces a new model for the ASPEED OTP (One-Time
Programmable) memory and integrates it with the ASPEED Secure Boot
Controller (SBC) and SoC models such as AST1030 and AST2600.

The OTP memory is implemented as a QEMU device (`aspeed.otpmem`) and is
designed to simulate fuse-like behavior using a block backend. Programming
is restricted by irreversible bit-flip rules (e.g., 0->1 or 1->0 depending
on address parity). The memory content is persistent and can be passed via
`-drive id=otpmem`.

The SBC device (`aspeed.sbc`) accesses the OTP device through a QOM link
property. This decouples OTP handling from the SBC logic and allows
future extensibility such as secure configuration or key provisioning.

The SoC integration connects the OTP memory to the SBC and provides
device-tree-style infrastructure for future firmware use.

Any feedback or suggestions are appreciated!

Thanks,  
Kane

---

ChangeLog
---------
v3:
- Minor fixes and refinements on top of v2 content

v2:
- Separated the OTP memory into a standalone QEMU device (`aspeed.otpmem`)
- Replaced ad-hoc file handling with standard `-drive` backend integration
- Linked OTP to SBC via QOM property for cleaner abstraction
- Improved memory bounds checking and irreversible programming logic

v1:
- Embedded OTP logic in the SBC model and created the backing file internally.

---

Kane-Chen-AS (3):
  hw/misc/aspeed_otp: Add Aspeed OTP memory device model
  hw/misc/aspeed_sbc: Connect Aspeed OTP memory device to SBC controller
  hw/arm: Integrate Aspeed OTP memory into AST10x0 and AST2600 SoCs

 hw/arm/aspeed_ast10x0.c         |  19 +++
 hw/arm/aspeed_ast2600.c         |  19 +++
 hw/misc/aspeed_otpmem.c         | 211 ++++++++++++++++++++++++++++++++
 hw/misc/aspeed_sbc.c            | 146 ++++++++++++++++++++++
 hw/misc/meson.build             |   1 +
 include/hw/arm/aspeed_soc.h     |   2 +
 include/hw/misc/aspeed_otpmem.h |  40 ++++++
 include/hw/misc/aspeed_sbc.h    |  15 +++
 8 files changed, 453 insertions(+)
 create mode 100644 hw/misc/aspeed_otpmem.c
 create mode 100644 include/hw/misc/aspeed_otpmem.h

-- 
2.43.0

