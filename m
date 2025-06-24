Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2925690dyb;
        Mon, 23 Jun 2025 19:23:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJLKQyv1TVyQoQiIAZhTxignLqGqM2mhUc+pPqiGMJwSfLkzKYCZJwVWAn9OKOJD/g2B3+daacmy+xFg==@linaro.org
X-Google-Smtp-Source: AGHT+IGmjq4FN3W2Jm+emA38P5MkQ9OqCAU9l8ZyVLzgGZNnTL9S65nF0h/clYHjeaIh3bnsAaTj
X-Received: by 2002:ad4:5aee:0:b0:6fd:3a4d:3638 with SMTP id 6a1803df08f44-6fd3a4d38aamr16964846d6.18.1750731799262;
        Mon, 23 Jun 2025 19:23:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750731799; cv=none;
        d=google.com; s=arc-20240605;
        b=hoxnBQfljbLy6NHAYrynt4nbfdPbxkIijRUrRZGHsoBbz2Y4T+NoT5aOHrVzDXbUop
         73VbiwlOvYMsYfH/MeX1Xf81ST5NCUpFlZegtdqvEUcD/f4Ycn8/AlYZfG8iuanv4XmU
         jM+58j/5+7yRNh/yc/ryUDCxQC4W4lW9uw0AJyCR+2MZQcSFNWFuzLWxC+ryg2ozJo7U
         0KsOGuInFXGW4gCYXMI5fKepvqX1r1ej0qKdvJK1PfvnubaS49FBHQXAOk5QUFnUOn5q
         AhmgNhmvED4QVSeRCxSJFdjcF/KPYypWBnEnx7iKW95SpRAFgTcDW9DpALQsmsdJF17Y
         Z1KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=x0Dy42tUHybqgPWMwIBhqvrQkd2xXQOXyl5ILw9SOvI=;
        fh=3E+GgkJ59sv88GyUpaKWpV4DoJlJz+B5Ev7H4uQXan0=;
        b=ivjj9+Ew89Du1FTzOWc63lPha/2sxO6Baqb8EHm8Zvnh++9IKYlNe9oyIb7P2s5Iv6
         Bv9BqV+0tDMr/A9QfcGPRXmTunQR/xWcXEAnEu+lQSqjB8kosgOPfI1F6nmobJbfkXib
         SZp3xp8x7LUDOUnCtKJs1NFaJaip+CSZsERe7gTt6AJTsK/0yjuaK+ECRt+dOpvAc0/i
         Mp+jPTfONCAXQQ+VnS9HutJsllwevOtcc2/nKv9HouGW/7brzAdpcE6+Zu54ogHNcavf
         160HiJiFC0oyzcDuZ+B2ibDh4wpKEtBERJiH6a2KgIDIfnIctvNa3m9N0RNvhis3xSsF
         24Lg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd1a8ad4b2si65449916d6.474.2025.06.23.19.23.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jun 2025 19:23:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uTtIz-0006c9-Lg; Mon, 23 Jun 2025 22:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uTtIw-0006Wr-B4; Mon, 23 Jun 2025 22:22:34 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uTtIt-0005OR-NY; Mon, 23 Jun 2025 22:22:34 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 24 Jun
 2025 10:22:19 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 24 Jun 2025 10:22:19 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>
Subject: [RFC v6 0/3] Add QEMU model for ASPEED OTP memory and integrate with
 SoC
Date: Tue, 24 Jun 2025 10:22:15 +0800
Message-ID: <20250624022219.3704712-1-kane_chen@aspeedtech.com>
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
X-TUID: 2IZwxWQZb2UU

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

**[RFC notice]**
This is an RFC submission. This version is primarily intended to
gather feedback on how the OTP instance is created, connected, and
integrated in the SoC structure.

A more finalized version with any requested changes, documentation,
and test refinements will follow after review.

Any feedback or suggestions are appreciated!

---

ChangeLog
---------
v6:
- remove machine parameter 'otpmem' and BlockBackend
- remove alias relationship between machine parameter and BlockBackend
- simplify to static internal OTP instance with direct connection in SoC
- Submitted as [RFC] to gather feedback on QOM integration approach

v5:
- Switched to notifier-based late binding between SBC and OTP
- Exposed 'otpmem' as a machine parameter using QOM alias mechanism
- Added fallback support when no backend is provided
- Introduced functional test suite covering multiple init configurations
- Submitted as [RFC] to gather feedback on QOM integration approach

v4:
- Replaces blockdev backend with memory-mapped AddressSpace access
- Switches from `-drive` CLI option to `otpmem` machine parameter
- Restructures the OTP device under the SBC in the QOM tree

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
  hw/misc/aspeed_otp: Add ASPEED OTP memory device model
  hw/misc/aspeed_sbc: Connect ASPEED OTP memory device to SBC
  hw/arm: Integrate ASPEED OTP memory support into AST2600 SoCs

 hw/arm/aspeed_ast2600.c         |  2 +-
 hw/misc/aspeed_otpmem.c         | 85 +++++++++++++++++++++++++++++
 hw/misc/aspeed_sbc.c            | 94 +++++++++++++++++++++++++++++++++
 hw/misc/meson.build             |  1 +
 hw/misc/trace-events            |  7 +++
 include/hw/misc/aspeed_otpmem.h | 33 ++++++++++++
 include/hw/misc/aspeed_sbc.h    |  5 ++
 7 files changed, 226 insertions(+), 1 deletion(-)
 create mode 100644 hw/misc/aspeed_otpmem.c
 create mode 100644 include/hw/misc/aspeed_otpmem.h

-- 
2.43.0

