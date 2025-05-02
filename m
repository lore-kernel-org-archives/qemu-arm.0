Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp748576njj;
        Fri, 2 May 2025 03:36:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW98upM9KG/dwUYt6lHpP0F5gmbi3XLYMCajLhbmikQjb2iWxZRUP/qN0aCOmiHeIp3yBu8MsOumlcDtw==@linaro.org
X-Google-Smtp-Source: AGHT+IGBKenYnDzSJfkD9qoju7KcAInHZYP7hyv9vz8FFO4eWvDut2yuienOnKiY5Iivno1wPuti
X-Received: by 2002:a05:600c:37ce:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-441bbea1268mr20196265e9.2.1746182162426;
        Fri, 02 May 2025 03:36:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746182162; cv=none;
        d=google.com; s=arc-20240605;
        b=Ue/7O+aQT9yYqrhNq68HQeiWWdNkPwjjacCqZQvStsfJmkljyVuSdXAyBrUlH2cheK
         Tpm+sSRjaazZhic5hV4bs+LcUtv3w3ahvZktUNg6Xf+vqSITXN+SzllQoUm9ZJy/S9in
         xLpGZ3MZZjJBUjfpwVenN4BGAnzUoEgk4zN0nw6TTJDsO6B8/NiAVxp/+6xBhqlaQm/J
         bcMubjXy9wR3qhGSlYhfz8xr+ivZuOz3KppkI0z98LuQUB4LbN5IKqtQcr1l0bj/3xz5
         X0V+oKyIBsBin+NxCShkqwErW0zQGpMmjBBn+tUAtfXU2JVwiSoci4NdUNyOiDOUkUjj
         YyHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=+RX+KdR2LwWCTUOjHedr+qfkGp85+gI/fI49X4p5jqk=;
        fh=Yg1QA3CYCa2LdK3Mf8oXZ+DbfQ0OHIFsuQO5E7pFx2w=;
        b=YY50l20s6Rh+6jU5LxBF9ouXR2iGbA7FPdUaGl3CWJdXlc5DeSwukRJN7p0b+WR9Vp
         /LxILVphqvmC3Vm52slxuqsClIzx0e5LZt05qZBV1HS8VZYsrs/nZQa795pN0SkLMw9S
         6vabgrq6vjwnWyMwdfgcl0sn9XJDDkvtTCIUBs2QIMwNJjLZN+YVo0InlQIOkWa35fza
         M6gz/cZxgcj5u95NuDEqe85fbO5UBkX/7dt3WX5Mc3AKdJJXRLVsatCpulieRh5voq1S
         TaYfUlEn10jmc71jv+5Tlb2Ama1tJL/dSxQCGG5BavKhU+g5KrV/6LwRhZQSTaXygkVm
         dEYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a099ae2a88si935920f8f.183.2025.05.02.03.36.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 May 2025 03:36:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uAnjU-00080v-Vf; Fri, 02 May 2025 06:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uAnjQ-0007xo-El; Fri, 02 May 2025 06:35:01 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uAnjN-0005yi-Ee; Fri, 02 May 2025 06:35:00 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 2 May
 2025 18:34:49 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 2 May 2025 18:34:49 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v4 0/9] Introduce AST27x0 multi-SoC machine
Date: Fri, 2 May 2025 18:34:36 +0800
Message-ID: <20250502103449.3091642-1-steven_lee@aspeedtech.com>
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7Gty2yNu2eKC

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

v3:
  - Remove A0 SoC support

v4:
  - Rebase on upstream QEMU.
  - Remove the redundant abstract class.
  - Simplify the functional test for AST2700FC.
  - Fix the document formatting issue.

Steven Lee (9):
  aspeed: ast27x0: Map unimplemented devices in SoC memory
  aspeed: ast27x0: Correct hex notation for device addresses
  hw/intc/aspeed: Add support for AST2700 SSP INTC
  hw/intc/aspeed: Add support for AST2700 TSP INTC
  hw/arm/aspeed_ast27x0-ssp: Introduce AST27x0 A1 SSP SoC
  hw/arm/aspeed_ast27x0-tsp: Introduce AST27x0 A1 TSP SoC
  hw/arm: Introduce ASPEED AST2700 A1 full core machine
  tests/function/aspeed: Add functional test for AST2700FC
  docs: Add support for ast2700fc machine

 docs/system/arm/aspeed.rst              |  69 +++-
 include/hw/arm/aspeed_soc.h             |  32 ++
 include/hw/intc/aspeed_intc.h           |   5 +
 hw/arm/aspeed_ast27x0-fc.c              | 192 +++++++++++
 hw/arm/aspeed_ast27x0-ssp.c             | 295 +++++++++++++++++
 hw/arm/aspeed_ast27x0-tsp.c             | 295 +++++++++++++++++
 hw/arm/aspeed_ast27x0.c                 |  80 +++--
 hw/intc/aspeed_intc.c                   | 416 ++++++++++++++++++++++++
 hw/arm/meson.build                      |   6 +-
 tests/functional/test_aarch64_aspeed.py |  83 +++++
 10 files changed, 1448 insertions(+), 25 deletions(-)
 create mode 100644 hw/arm/aspeed_ast27x0-fc.c
 create mode 100644 hw/arm/aspeed_ast27x0-ssp.c
 create mode 100644 hw/arm/aspeed_ast27x0-tsp.c

-- 
2.34.1

