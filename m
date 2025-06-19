Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp75766njc;
        Wed, 18 Jun 2025 23:41:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVi7QMlFPK6laqp7hR8gnPIq8MqQ8fz9eotuH1pmfy13gBgGr30IMQWSk34SVI9U54H6L8FnKeh22KNMQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG+cBKpx9BSJuoH+9/dGLwoONRpkkGc3hH2FtwJ3qZITsdZtDGnYAlKlw3uZfO2VJ/0ET4S
X-Received: by 2002:ac8:7d03:0:b0:48e:9e05:cede with SMTP id d75a77b69052e-4a73c696091mr338080181cf.52.1750315317418;
        Wed, 18 Jun 2025 23:41:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750315317; cv=none;
        d=google.com; s=arc-20240605;
        b=kSQP6pl0owZ0cG64ynkrfEcx8W5KcbFWSLHTsp01baXuHT9Rz47zG63bjJM3FqKNLK
         odtF3lrVVt5HX0VnOcylBpV6B3TvMIzKpiWGnz1Wmcvgl9fW4yfmRGtWiQOjTdQ0R7a9
         8Mdd7iPeL2jKxP/bxa+Rl7U9H1GkL5MazyUlcIa6bVw5OAStjnbzqFFLxmsdHoFkA9F0
         EyvmDEfctI1a9yaK/e9cvsa/SgaXSHlQ/ETZdS5SAt3lARf9M5Aadgku0xzanj4H/xOJ
         1MA+BF0Y3tJU7/tDr2NWGCBvWOyw1vncMuD8b5DDcwtSgSqLIkPJGleMMlPuV2FX5+i7
         vrmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=xgl/K23FsoJnZa120IodUCXe8C+p+TKe8LhI9VNug+s=;
        fh=3E+GgkJ59sv88GyUpaKWpV4DoJlJz+B5Ev7H4uQXan0=;
        b=HIQ/CzjYo3DpybvBe2au88zeAH29OVQ2jAk+WHigjNnAYNeGczTnhmMDvOGaJl6+Ew
         8WxUBye7+AGM3KogCtfE7AY1LOkoVGoMbVjxpM4hVC00/UwkOZnJqDPqSsQMPxSAwEoP
         QrvSTG4u+qj6Vc1QV0FwEdsOhlrNuNzpCv0SG+0TI0bj6BvDD6VN1Fs1iklWlR1Lm0BG
         lp9Dobpxpj41l6b+msPaOf+4DjaINK4Otm6B+CT1drS5q9niNk8zXcZAgyQrGOFsjwwz
         gatYKefTTI8VDSrH1hRT5/TxOSttjbpRdIVCjSEPFwHjc90dKXdMVRPPdWDIJ4hdnwrx
         VzRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a4d49b9si158076121cf.412.2025.06.18.23.41.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jun 2025 23:41:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uS8xn-0002Tj-Lb; Thu, 19 Jun 2025 02:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uS8xk-0002Sk-P9; Thu, 19 Jun 2025 02:41:28 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uS8xg-0001s1-F6; Thu, 19 Jun 2025 02:41:28 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 19 Jun
 2025 14:41:15 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 19 Jun 2025 14:41:15 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>
Subject: [RFC v5 0/4] Add QEMU model for ASPEED OTP memory and integrate with
 SoCs
Date: Thu, 19 Jun 2025 14:41:09 +0800
Message-ID: <20250619064115.4182202-1-kane_chen@aspeedtech.com>
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
Reply-to:  Kane Chen <kane_chen@aspeedtech.com>
From:  Kane Chen via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: l+od1S1JzpDi

From: Kane-Chen-AS <kane_chen@aspeedtech.com>

This patch series introduces a QEMU model for the ASPEED OTP (One-Time
Programmable) memory, along with its integration into the Secure Boot
Controller (SBC) and supported SoCs (AST2600, AST1030).

The OTP model emulates a simple fuse array used for secure boot or
device configuration, with support for both file-backed content and
internal fallback buffers. It exposes an AddressSpace to support
transaction-based access from controllers like the SBC.

This series includes:
  - OTP memory device implementation
  - SBC integration with command decoding (READ/PROG)
  - Machine property wiring (via "otpmem" alias)
  - A functional test suite covering various initialization paths

**[RFC notice]**
This is an RFC submission. While the OTP model itself is mostly
complete, this version is primarily intended to gather feedback on the
device initialization flow-specifically how the OTP instance is created,
connected, and exposed via machine properties. Any comment on QOM 
integration style, late binding via notifier, and fallback behavior are
welcome.

In particular, I am seeking input on:
  - Whether the current notifier-based connection from SBC to OTP is
    appropriate, or if there is a preferred QOM idiom for linking
    peripheral devices post-realize.
  - The use of "optmem" as a drive alias and machine parameter handling.

A more finalized version with any requested changes, documentation,
and test refinements will follow after review.

Example usage:
```bash
qemu-system-arm -machine ast2600-evb,otpmem=otpmem-drive \
  -blockdev driver=file,filename=otpmem.img,node-name=otpmem \
  -device aspeed.otpmem,drive=otpmem,id=otpmem-drive \
  ...
```

Any feedback or suggestions are appreciated!

Thanks,
Kane

---

ChangeLog
---------
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

Kane-Chen-AS (4):
  hw/misc/aspeed_otp: Add ASPEED OTP memory device model
  hw/misc/aspeed_sbc: Connect ASPEED OTP memory device to SBC
  hw/arm: Integrate ASPEED OTP memory support into AST10x0 and AST2600
    SoCs
  tests/functional: Add integration tests for ASPEED OTP memory model

 hw/arm/aspeed.c                        |  20 +++
 hw/arm/aspeed_ast10x0.c                |   2 +-
 hw/arm/aspeed_ast2600.c                |   2 +-
 hw/misc/aspeed_otpmem.c                | 117 ++++++++++++++++
 hw/misc/aspeed_sbc.c                   | 179 +++++++++++++++++++++++++
 hw/misc/meson.build                    |   1 +
 hw/misc/trace-events                   |   7 +
 include/hw/misc/aspeed_otpmem.h        |  35 +++++
 include/hw/misc/aspeed_sbc.h           |   8 ++
 tests/functional/meson.build           |   1 +
 tests/functional/test_aspeed_otpmem.py |  82 +++++++++++
 11 files changed, 452 insertions(+), 2 deletions(-)
 create mode 100644 hw/misc/aspeed_otpmem.c
 create mode 100644 include/hw/misc/aspeed_otpmem.h
 create mode 100644 tests/functional/test_aspeed_otpmem.py

-- 
2.43.0

