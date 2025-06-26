Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp83287dye;
        Thu, 26 Jun 2025 00:57:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXBGDviMlDdddbOQUTsp0dcIrTO8vaa71R2e77OiisQb5WPlWQ8GpCY8QUOJbK4BtD+MfBublVvs1hX0A==@linaro.org
X-Google-Smtp-Source: AGHT+IFlDG+M4IMdme2NZyjhxqW2HNM+ytk9Ube0JzoUfToJbiC6Tl4lJgdZfidJ3RvYha+EIvY7
X-Received: by 2002:a5d:5f92:0:b0:3a4:d722:5278 with SMTP id ffacd0b85a97d-3a6ed646577mr5474765f8f.39.1750924676807;
        Thu, 26 Jun 2025 00:57:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750924676; cv=none;
        d=google.com; s=arc-20240605;
        b=EhZ4qJLbla+6QXcOddPJJdsIH+WruSf4as76i5VBETRwkcmMOhpAOUxUT4ymZ3fwL8
         Jb/3uzQN2XYNSWa2SAXOwnbPAwgCtL+B6gvOg3rTN3/6wc7psps6CDsJ5BX5eP3i7vuP
         ofLhOWwmgEqaa+ra5sixsJ0M3uF3ecmkjiCRMEMnAc4peWkuRpMwwDUYNdF1ZRQvHBNg
         AxFyPyyvji+gN74fE9QDJvOC5/1HstHpzuW/3Z4Ysz6RtyaEKOvrJeoP0bRvPIOG3Jk5
         NL/fgCSSJEPq1P+lBniw2hoxrT1BWp7OWnE9ZoBq4wrE377x8cvxfBa54ZdspJTJdRAG
         UpXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=+YKRshLD9V8k58+A2nYhZXZ0t+0h+ZDr+Gms4dHKIvo=;
        fh=3E+GgkJ59sv88GyUpaKWpV4DoJlJz+B5Ev7H4uQXan0=;
        b=TiPKcWBOhSHdsaOH3sbbEbwnNuE3/mI7FjCivg/okxZepIbYcimZKYxvEHeMVHNCEv
         Hp+xmHRHOTpGEmxhAtBqgWU3eVCJgsAUt0TeVeTQdOSUxSM5Is2Vo7sjzztHuL5NwBHM
         48cSbsRQ+Y+Jaa9G+a9aKKu/tgd00JDCye8DdzJdtFG6fD37fYmiJOqBcLkOpHjoNAsI
         XDEQ/zrp0jIh2gAQwEU95XyUDlEwku6PyfHFi3SQVLYVKCwE+ywylQmu3HMHkXA3fi78
         Eji1WZuFKsF6pLMCtnPbrU+MwQcg1YtCiqHVjIwMZ/ay6uX+XeXttgVL/JtTFnaEFXCG
         T5Uw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6e8111432si4607830f8f.818.2025.06.26.00.57.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Jun 2025 00:57:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uUhUA-0003wC-Es; Thu, 26 Jun 2025 03:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uUhU6-0003rT-RK; Thu, 26 Jun 2025 03:57:26 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uUhU3-0003xl-QM; Thu, 26 Jun 2025 03:57:26 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 26 Jun
 2025 15:57:11 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 26 Jun 2025 15:57:11 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>
Subject: [PATCH v1 0/3] Add QEMU model for ASPEED OTP memory and integrate
 with SoC
Date: Thu, 26 Jun 2025 15:57:07 +0800
Message-ID: <20250626075711.1589039-1-kane_chen@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=kane_chen@aspeedtech.com; helo=TWMBX01.aspeed.com
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
Reply-to:  Kane Chen <kane_chen@aspeedtech.com>
From:  Kane Chen via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: E77fl+8kjOPo

From: Kane-Chen-AS <kane_chen@aspeedtech.com>

This patch series introduces a QEMU model for the ASPEED OTP (One-Time
Programmable) memory, along with its integration into the Secure Boot
Controller (SBC) and supported SoC (AST2600).

The OTP model emulates a simple fuse array used for secure boot or
device configuration, implemented with internal buffers; external
file/device support not included in this version. It exposes an
AddressSpace to support transaction-based access from controllers
like the SBC.

This series includes:
  - OTP memory device implementation
  - SBC integration with command decoding (READ/PROG)
  - Direct integration in AST2600 SoC without requiring user parameters

Any feedback or suggestions are appreciated!

---

Kane-Chen-AS (3):
  hw/misc/aspeed_otp: Add ASPEED OTP memory device model
  hw/misc/aspeed_sbc: Connect ASPEED OTP memory device to SBC
  hw/arm: Integrate ASPEED OTP memory support into AST2600 SoCs

 include/hw/misc/aspeed_otpmem.h |  33 +++++++++
 include/hw/misc/aspeed_sbc.h    |   5 ++
 hw/arm/aspeed_ast2600.c         |   2 +-
 hw/misc/aspeed_otpmem.c         |  91 +++++++++++++++++++++++++
 hw/misc/aspeed_sbc.c            | 115 ++++++++++++++++++++++++++++++++
 hw/misc/meson.build             |   1 +
 hw/misc/trace-events            |   5 ++
 7 files changed, 251 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/misc/aspeed_otpmem.h
 create mode 100644 hw/misc/aspeed_otpmem.c

-- 
2.43.0

