Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp639175dye;
        Thu, 26 Jun 2025 19:56:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUoRYryoc9w0emEszAGH55z6GBlSO1Cs9uKGA2z6c6yTN6l4jK35kPhy4yciGsJweVC3H9r1hIPalYyIA==@linaro.org
X-Google-Smtp-Source: AGHT+IG2n3FR44/3bv/lmADleYioq9pjsjpkEEI1aySwa8CkjJCTypkmoRv1rKO/cTDIsHOHJIvn
X-Received: by 2002:a05:6214:459a:b0:6fb:51f6:1fe8 with SMTP id 6a1803df08f44-7000233c973mr27843576d6.30.1750992990130;
        Thu, 26 Jun 2025 19:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750992990; cv=none;
        d=google.com; s=arc-20240605;
        b=cZQIreJs7seeJhJC338+b2rMDF6UqUH+n9LhwRKSkoX1GxU3EPC7QaVovQvo9jaO8/
         /WAmIqBxZdwPPNRlkW7fbwMbAXQT2UigRPMK63zltRrcuakSMwyGbf/xCTXWUiyrtWFB
         cKcW3HoVZ9fhcFRF2WR3yIgQTXKxSqO/e/rZ39TjqtlSvtVKkYc4YKiX4pb0dFwvAIzX
         wc4f8RCLnkM+AiMSD9XVKWMysOj6zW+Xj0Zw8WHJJJ6AWquWmH1NkoDTd3sehSUttWKE
         OOt9lBcz+q+00i5ItIH+qu+bxemW0gjzr9yf6RaibHWwGJ6uo3GTWh6TWRMtvek8bCgI
         GoMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=gdv3UuMMELub+MpDod02DdFuUUY9oOuJjO8kCAbejYc=;
        fh=3E+GgkJ59sv88GyUpaKWpV4DoJlJz+B5Ev7H4uQXan0=;
        b=KmE/6mV8HH/43OhWV3OyEga68VziHYbPZqsKAHry2s9kE6RL0rswmDBq6fhCgV4Cmx
         9SnV21EUrUayoCP/Bx2bAGrkimaXmYKsvsQo87gRh74K02KPXkObgPN8TcFFokTf3QcL
         CAMo90oIoQpxJlxrfyBiipdIr+r/tU7WoLPUvURmhrfCZGyNc3GVicS3XkyZBRDcaOfB
         9fq2p6uTH+YRElmNrjgbxAeMOf5mdsArf++r0ypq/waK29GBqNIEWKKH+eAXKSqkh3Y0
         HPzRFh3fUnOG8m9LQzw38+jdyT/6s3AfIg0nv8h7UldBRonecdvQ6otenqObGDqxJ8Be
         54Sw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd773aea09si32527356d6.500.2025.06.26.19.56.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Jun 2025 19:56:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uUzGE-0007dn-TW; Thu, 26 Jun 2025 22:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uUzGC-0007dX-Ug; Thu, 26 Jun 2025 22:56:16 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uUzGA-0006B6-Gd; Thu, 26 Jun 2025 22:56:16 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 27 Jun
 2025 10:56:06 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 27 Jun 2025 10:56:06 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>
Subject: [PATCH v2 0/3] Add QEMU model for ASPEED OTP memory and integrate
 with SoC
Date: Fri, 27 Jun 2025 10:56:02 +0800
Message-ID: <20250627025606.631167-1-kane_chen@aspeedtech.com>
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
X-TUID: tGFmiAxmp/63

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

Kane
---

ChangeLog
---------
v2:
- Rename device from 'aspeed_otpmem' to 'aspeed_otp' and move it to hw/nvram/
- Move OTP device realization from instance_init to the realize function
- Improve error logging with qemu_log_mask() and remove unused error propagation

v1:
- Initial version

---

Kane-Chen-AS (3):
  hw/misc/aspeed_otp: Add ASPEED OTP memory device model
  hw/misc/aspeed_sbc: Connect ASPEED OTP memory device to SBC
  hw/arm: Integrate ASPEED OTP memory support into AST2600 SoCs

 include/hw/misc/aspeed_sbc.h  |   5 ++
 include/hw/nvram/aspeed_otp.h |  30 +++++++++
 hw/arm/aspeed_ast2600.c       |   2 +-
 hw/misc/aspeed_sbc.c          | 119 ++++++++++++++++++++++++++++++++++
 hw/nvram/aspeed_otp.c         |  94 +++++++++++++++++++++++++++
 hw/misc/trace-events          |   5 ++
 hw/nvram/meson.build          |   4 ++
 7 files changed, 258 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/nvram/aspeed_otp.h
 create mode 100644 hw/nvram/aspeed_otp.c

-- 
2.43.0

