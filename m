Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2257196dye;
        Sun, 29 Jun 2025 22:17:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVS/HF1dltY9Tn5xrcZRU/q5no1HMezX9KyfwKiKgq+VmqydJuqNBgakP8bAeIb/B5tjB07Ca/HfBiUqA==@linaro.org
X-Google-Smtp-Source: AGHT+IHD9hsbDnMK1N6FInn3sAQtgLVvtd4gFKd0iH1gUJ2kAVd52y2J6k9CoRBpwfwnPRzuIEV/
X-Received: by 2002:a05:620a:394f:b0:7d4:6153:d6e7 with SMTP id af79cd13be357-7d46153da50mr54980185a.25.1751260674025;
        Sun, 29 Jun 2025 22:17:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751260674; cv=none;
        d=google.com; s=arc-20240605;
        b=BGrex4lkukyeui6l8V9H9SCC4c+d8eVcp3XoN0rrHW8ao6VMVwbxfveO3n7OdwZuAE
         iouvNOcYaYQQA7h3z/YWFHrtDakXUxjTfHIdzOliAYpc2VaUtiskJAS6wfpQlOsHO+qN
         JBk4q02e3KOrOPCw7ARyHd0Ri+StICvqU/JxbIJ9gaJN113JAzM7Yzh3g/B3bEfz+Xzj
         vQfA5Q1CxW7x5IYy3Vwd2d8wBAEreYE3PnnEnNLRzLfaHV1Va9KkUZYGAo0HGU8y8EoA
         bYMZ6WLYrVkMKq3KL9r5nNielVuX337iU8nh9IIBTT781fniszMtr37O7LZB2ZGF5Bf4
         0X7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=+q7rb/x/isWfHAo59/Mp3YYX9hCj/oLz87gTkPfo7fM=;
        fh=3E+GgkJ59sv88GyUpaKWpV4DoJlJz+B5Ev7H4uQXan0=;
        b=OZusIzB1VWl0et18iYT5XST25tgwobdlOvSzWU5IiG2R7XLlJ/HYMGLsFH3BUhlfDL
         AUy00k47aGC1HvhrJr56hGRKZ+3aJtGaQUdeWTdY8PRkXNACN9f33G8BTUeZ7Yr+iKwW
         IEskVMnSbrvo/FIhEj/HtwTyj0BO5bhvpbUjzVKhvBO+lpchw4UpuIoOBfF5fp/i0vI8
         70+hzhSIR4OF1ejjwsZvqbjy8p69K/sDnRG1PPFrz9McKROaqzJ++fdGkgRi8TBnG/da
         22KwrBfuWW754QXFh19bclt7VEd6GP/Pf4wWeFxT2azP8zmjL9C4hBJHelcL49HDcR+h
         iiqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc576752si75363701cf.591.2025.06.29.22.17.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Jun 2025 22:17:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uW6tg-0005WE-2L; Mon, 30 Jun 2025 01:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uW6tc-0005VL-9W; Mon, 30 Jun 2025 01:17:37 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uW6tZ-0003fn-Ty; Mon, 30 Jun 2025 01:17:36 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 30 Jun
 2025 13:17:21 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 30 Jun 2025 13:17:21 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>
Subject: [PATCH v3 0/3] Add QEMU model for ASPEED OTP memory and integrate
 with SoC
Date: Mon, 30 Jun 2025 13:17:17 +0800
Message-ID: <20250630051721.254207-1-kane_chen@aspeedtech.com>
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
X-TUID: yXkHv3ankaAK

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
v3:
- Switched to object_property_set_int() for setting "size"
- Simplified qdev_realize() error handling by passing errp directly
- Added "drive" property to OTP model for future extensibility

v2:
- Rename device from 'aspeed_otpmem' to 'aspeed_otp' and move it to hw/nvram/
- Move OTP device realization from instance_init to the realize function
- Improve error logging with qemu_log_mask() and remove unused error propagation

v1:
- Initial version

---

Kane-Chen-AS (3):
  hw/misc/aspeed_otp: Add OTP device model with fallback RAM storage
  hw/misc/aspeed_sbc: Connect ASPEED OTP memory device to SBC
  hw/arm: Integrate ASPEED OTP memory support into AST2600 SoCs

 include/hw/misc/aspeed_sbc.h  |   5 ++
 include/hw/nvram/aspeed_otp.h |  33 ++++++++++
 hw/arm/aspeed_ast2600.c       |   2 +-
 hw/misc/aspeed_sbc.c          | 113 ++++++++++++++++++++++++++++++++++
 hw/nvram/aspeed_otp.c         | 113 ++++++++++++++++++++++++++++++++++
 hw/misc/trace-events          |   5 ++
 hw/nvram/meson.build          |   4 ++
 7 files changed, 274 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/nvram/aspeed_otp.h
 create mode 100644 hw/nvram/aspeed_otp.c

-- 
2.43.0

