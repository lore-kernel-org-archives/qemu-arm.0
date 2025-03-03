Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2503473njb;
        Mon, 3 Mar 2025 01:55:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU10VTLtJXKrPspNj1TiFt7snv4SeDrHRMg0eoNqEIkNrg3sJhG6/3+srY99685lgURqKa0coDk7zNyBA==@linaro.org
X-Google-Smtp-Source: AGHT+IERHdk7ey0QeF0/g4sz7OIRYpndYKbc6TTjX+B1SCtc/ZsY59fPEmcpZeuDEBo+P+0XfnGQ
X-Received: by 2002:ac8:7d0a:0:b0:472:1ee7:d3f with SMTP id d75a77b69052e-474bc0518b9mr148716201cf.10.1740995730965;
        Mon, 03 Mar 2025 01:55:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740995730; cv=none;
        d=google.com; s=arc-20240605;
        b=CPWw/CGvl1JKGEKFTun2EJSKIG6XMTlsgonDaoKZRSSzZPPjRjuYPnpcSqwiWz61pT
         o8dz20SlSVcz8tNYZ1rn96S/NSWZsLXwP63eF9Bkom1+J5NzNfE1xx/CqwPCYwdHGUwm
         IQ9gjLNqfdFCx4wtdDRjm+09KafqG49vYzVgKxKf/GN5+BGOItKQDHIGG/X5XDOMymSE
         vfU75dDHfrYRS3pAFCwEwg8uM/RLdHbph1SOSMrM4BEBBb5ap1b7YMIGVbhbagSSKsR5
         jc1rVp0XRTznay95JjMa1p34aXnKyWaH4ewSI9S9/3C8lFDH+b3s3HhW2wu3J0+kouRy
         S74w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=ml79pGbdB7IDNsKeXvxrMWODt51JknhlBcs1sQwZXsQ=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=PGyx5rdjCaFyAgmLUPXnbwMag9s5EP/r93HrnvpdUSoPJk7rylwcqtOPa9+jgnm2bD
         Gqmr9NEyN77uRmqjlQvMv8l9PEIyrx5xEvBsl/CtlYO32iZJZo9pKyH6X7BVvfEDevid
         1+EWh8TD57jFZOsosLvEtESUlqhf5sFmZpQgDuuPwz+2jC9bYOSEwDZeZfQ3JBF6JE8g
         XwRGqvfkbtkbjdtHJFkWMC/myuX6FiQIbH0p+KRqqdPxoFlY6MMxU+5E66He4VyL4rt7
         K6HQBydm9W9YVZCTY6aleI4sA7x8FDR5NewEJueYtwAO9LFzBtRRe2uA+aF01SedqG2m
         EYXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-474691acf55si85985971cf.147.2025.03.03.01.55.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 01:55:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tp2Vy-0007pA-CN; Mon, 03 Mar 2025 04:55:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp2Vw-0007oY-5W; Mon, 03 Mar 2025 04:55:08 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp2Vt-0001gH-HD; Mon, 03 Mar 2025 04:55:07 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 3 Mar
 2025 17:54:58 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 3 Mar 2025 17:54:58 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v4 00/23] Support AST2700 A1
Date: Mon, 3 Mar 2025 17:54:28 +0800
Message-ID: <20250303095457.2337631-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
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
X-TUID: gZD7/01OEFZG

v1:
 1. Refactor INTC model to support both INTC0 and INTC1.
 2. Support AST2700 A1.
 3. Create ast2700a0-evb machine.
 
v2:
  To streamline the review process, split the following patch series into
  three parts.
  https://patchwork.kernel.org/project/qemu-devel/cover/20250121070424.2465942-1-jamin_lin@aspeedtech.com/
  This patch series focuses on cleaning up the INTC model to
  facilitate future support for the INTC_IO model.

v3:
 1. Update and add functional test for AST2700
 2. Add AST2700 INTC design guidance and its block diagram.
 3. Retaining the INTC naming and introducing a new INTCIO model to support the AST2700 A1.
 4. Create ast2700a1-evb machine and rename ast2700a0-evb machine
 5. Fix silicon revision issue and support AST2700 A1.

v4:
 1. rework functional test for AST2700
 2. the initial machine "ast2700-evb" is aliased to "ast2700a0-evb.
 3. intc: Reduce regs array size by adding a register sub-region
 4. intc: split patch for Support setting different register sizes
 5. update ast2700a1-evb machine parent to TYPE_ASPEED_MACHINE

With the patch applied, QEMU now supports two machines for running AST2700 SoCs:
ast2700a0-evb: Designed for AST2700 A0
ast2700a1-evb: Designed for AST2700 A1

Test information
1. QEMU version: https://github.com/qemu/qemu/commit/50d38b8921837827ea397d4b20c8bc5efe186e53
2. ASPEED SDK v09.05 pre-built image
   https://github.com/AspeedTech-BMC/openbmc/releases/tag/v09.05
   ast2700-default-obmc.tar.gz (AST2700 A1)
   https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast2700-default-obmc.tar.gz
   ast2700-a0-default-obmc.tar.gz (AST2700 A0)
   https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.05/ast2700-a0-default-obmc.tar.gz
   
This patch series depends on the following patch series:
https://patchwork.kernel.org/project/qemu-devel/cover/20250303073547.1145080-1-jamin_lin@aspeedtech.com/
https://patchwork.kernel.org/project/qemu-devel/cover/20250225075622.305515-1-jamin_lin@aspeedtech.com/

Jamin Lin (23):
  hw/intc/aspeed: Support setting different memory size
  hw/intc/aspeed: Support setting different register sizes
  hw/intc/aspeed: Reduce regs array size by adding a register sub-region
  hw/intc/aspeed: Introduce helper functions for enable and status
    registers
  hw/intc/aspeed: Add object type name to trace events for better
    debugging
  hw/arm/aspeed: Rename IRQ table and machine name for AST2700 A0
  hw/arm/aspeed_ast27x0: Sort the IRQ table by IRQ number
  hw/intc/aspeed: Support different memory region ops
  hw/intc/aspeed: Rename num_ints to num_inpins for clarity
  hw/intc/aspeed: Add support for multiple output pins in INTC
  hw/intc/aspeed: Refactor INTC to support separate input and output pin
    indices
  hw/intc/aspeed: Introduce AspeedINTCIRQ structure to save the irq
    index and register address
  hw/intc/aspeed: Introduce IRQ handler function to reduce code
    duplication
  hw/intc/aspeed: Add Support for Multi-Output IRQ Handling
  hw/intc/aspeed: Add Support for AST2700 INTCIO Controller
  hw/misc/aspeed_scu: Add Support for AST2700/AST2750 A1 Silicon
    Revisions
  hw/arm/aspeed_ast27x0.c Support AST2700 A1 GIC Interrupt Mapping
  hw/arm/aspeed_ast27x0: Support two levels of INTC controllers for
    AST2700 A1
  hw/arm/aspeed: Add SoC and Machine Support for AST2700 A1
  tests/functional/aspeed: Introduce start_ast2700_test API and update
    hwmon path
  tests/functional/aspeed: Update test ASPEED SDK v09.05
  tests/functional/aspeed: Add test case for AST2700 A1
  docs/specs: Add aspeed-intc

 docs/specs/aspeed-intc.rst              | 136 +++++
 docs/specs/index.rst                    |   1 +
 include/hw/arm/aspeed_soc.h             |   3 +-
 include/hw/intc/aspeed_intc.h           |  35 +-
 include/hw/misc/aspeed_scu.h            |   2 +
 hw/arm/aspeed.c                         |  33 +-
 hw/arm/aspeed_ast27x0.c                 | 276 +++++++---
 hw/intc/aspeed_intc.c                   | 636 ++++++++++++++++++------
 hw/misc/aspeed_scu.c                    |   2 +
 hw/intc/trace-events                    |  25 +-
 tests/functional/test_aarch64_aspeed.py |  47 +-
 11 files changed, 942 insertions(+), 254 deletions(-)
 create mode 100644 docs/specs/aspeed-intc.rst

-- 
2.34.1

