Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp728746njc;
        Wed, 12 Mar 2025 22:46:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUI9sbQWRROudqbEcNbgC76jV/Ve2zvOJJ/nUOHsActHSwn2G2D2xXQevkd43dKLg0X5q3lGQk573UfGA==@linaro.org
X-Google-Smtp-Source: AGHT+IHCVl+FR/YvTu3ezNxk3fJeL6HoLBBLzc05yAJyeSQs4GaA/4E3mx5jA8KXgcoADWiNZqGX
X-Received: by 2002:a0c:fc46:0:b0:6e8:fee2:aadf with SMTP id 6a1803df08f44-6e9006752ebmr274993516d6.31.1741844779436;
        Wed, 12 Mar 2025 22:46:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741844779; cv=none;
        d=google.com; s=arc-20240605;
        b=UUDKm/V7xRW3qEO46rGuWsA8xByt5vqXK8H50nkiq6hN8jprG1srEZX8AzYaoyKx72
         aavsNwpmx/99DFLEVRPc6692I85q7twSr8NTTx2xX2YCSIVM10pns84cmccwZXZBxYyo
         X10ciuxqvtNTOAWz+D5KV5ALo3rrLR6KkhoFGJWRPaUhqRiEDizCTRziJhQh8nsL0tz+
         ZZlRraXVPeN6EU61UbDQNRDATDt32wrlSUtPxgHkRXQuhXk8+HtybFYLnnIxmjwMatF3
         8+d0L8XmcmZTePcbx4siIgvHpcDwlxj8fmjFvkDnCPSyGrt6YS+FndGSGxVKpI1Q7cCt
         li4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=U2FM7Hm1bUEc9b14H78qFeBQ8j3hgqfxDBjDvcL/KuE=;
        fh=NwMdySSevMv+4zB5gT5UiU9uLqpwDS+7odbjbNLg6yI=;
        b=HUe0urwg2COK/m6HYNu6Abzu1UKQ3O0nT/BvQAwe8ecDrkxSEmiIQTlgzVM4/9l9/l
         D+YlU8n7aXsDtUMlWhJ16oP7vP2/0Al2SOSjKa+zoW3lMqTAtfMIOAPg9MsaO/i5O4aE
         OS02bhR5PRD89/4vJijfv0kRQMYqQDZEYi0h87bBgadueDjLSzM4eT3IuMTthXtDBjYc
         +vAsJXI5PXWN/MTuvsEs6/+oCm+suymgFpUctODUm8dQ8nUd/lhlUSuPemlKIumQJNNB
         AjxD887GSLJcQwZBId0j2PcHO8DVXuDxnTbkWDzL+zbyieYpDRlyPbJ6b13wMJv2nUKe
         hGhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c573caa773si89180385a.324.2025.03.12.22.46.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Mar 2025 22:46:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsbOM-0004om-LC; Thu, 13 Mar 2025 01:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1tsbNz-0004mp-CT; Thu, 13 Mar 2025 01:45:47 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1tsbNv-0005Ve-C3; Thu, 13 Mar 2025 01:45:37 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 13 Mar
 2025 13:40:20 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 13 Mar 2025 13:40:20 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 00/13] Introduce AST27x0 multi-SoC machine
Date: Thu, 13 Mar 2025 13:40:04 +0800
Message-ID: <20250313054020.2583556-1-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Tg+YC7YWmcsB

This patch series introduces full core support for the AST27x0 SoC, along with necessary updates to the ASPEED AST27x0 SOC.
The AST27x0 SoC is a new family of ASPEED SoCs featuring 4 Cortex-A35 cores and 2 Cortex-M4 cores.

v1:
  - Map unimplemented devices in SoC memory
  - Intruduce AST2700 CM4 SoC
  - Introduce AST27x0FC Machine

v2:
  - Remove unused functions
  - Correct hex notation for device addresses in AST27x0 SoC
  - Add AST2700 SSP INTC and AST2700 TSP INTC
  - Split AST27x0 CM4 SoC to AST27x0 SSP SoC and AST27x0 TSP SoC
  - Add AST27x0 A0 SSP SoC and AST27x0 A1 SSP SoC
  - Add AST27x0 A0 TSP SoC and AST27x0 A1 TSP SoC
  - Add functional tests for AST2700FC A0 and AST2700FC A1
  - Add Documentation for AST2700FC

Steven Lee (13):
  aspeed: ast27x0: Map unimplemented devices in SoC memory
  aspeed: ast27x0: Correct hex notation for device addresses
  hw/intc/aspeed: Add support for AST2700 SSP INTC
  hw/intc/aspeed: Add support for AST2700 TSP INTC
  hw/arm/aspeed_ast27x0-ssp: Introduce AST27x0 A0 SSP SoC
  hw/arm/aspeed_ast27x0-ssp: Introduce AST27x0 A1 SSP SoC
  hw/arm/aspeed_ast27x0-tsp: Introduce AST27x0 A0 TSP SoC
  hw/arm/aspeed_ast27x0-tsp: Introduce AST27x0 A1 TSP SoC
  hw/arm: Introduce ASPEED AST2700 a0 full core machine
  hw/arm: Introduce ASPEED AST2700 a1 full core machine
  tests/function/aspeed: Add functional test for AST2700FC
  tests/function/aspeed: Add functional test for AST2700FC A1
  docs: Add support for ast2700fc machine

 docs/system/arm/aspeed.rst                 |  61 ++-
 include/hw/arm/aspeed_soc.h                |  32 ++
 include/hw/intc/aspeed_intc.h              |   5 +
 hw/arm/aspeed_ast27x0-fc.c                 | 340 +++++++++++++++++
 hw/arm/aspeed_ast27x0-ssp.c                | 400 +++++++++++++++++++
 hw/arm/aspeed_ast27x0-tsp.c                | 400 +++++++++++++++++++
 hw/arm/aspeed_ast27x0.c                    |  79 +++-
 hw/intc/aspeed_intc.c                      | 424 +++++++++++++++++++++
 hw/arm/meson.build                         |   6 +-
 tests/functional/test_aarch64_ast2700fc.py | 161 ++++++++
 10 files changed, 1884 insertions(+), 24 deletions(-)
 create mode 100644 hw/arm/aspeed_ast27x0-fc.c
 create mode 100644 hw/arm/aspeed_ast27x0-ssp.c
 create mode 100644 hw/arm/aspeed_ast27x0-tsp.c
 create mode 100755 tests/functional/test_aarch64_ast2700fc.py

-- 
2.34.1

