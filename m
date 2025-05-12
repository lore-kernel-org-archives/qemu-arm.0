Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp2587369njb;
        Mon, 12 May 2025 02:11:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxD4Wp/aF7aDQENz8pAjJTvgXIZGVyr8qfV4NOFzAW7/6UWCK5rIMZwdW69Ip66WKobdL85lL9fNr6rA==@linaro.org
X-Google-Smtp-Source: AGHT+IFS0V60QlAtDtOmuAab0S7frQ4hs6sn1Yoplt3zWODOz0Y/Sj5tM7NjDOb6KXIdeSQROPeF
X-Received: by 2002:a05:620a:1b98:b0:7c5:5794:3e66 with SMTP id af79cd13be357-7cd01118cfbmr2617972385a.31.1747041066114;
        Mon, 12 May 2025 02:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747041066; cv=none;
        d=google.com; s=arc-20240605;
        b=AKgOdEZ5ESYOLbckmJZcQbSKK6wLhFrCwm6pZCv0mH2uOuqO/Dq/xQnQ4+mQNXfT5f
         AMv1ZF9AbBwLt8wn9va99VIlcWBGblP47u+1JJBG08KwJQnsq7EFP1xrsD2jhfLUGucu
         IBTqDUNQeaeQ6DPJZNJJSQBZ2Oe1P4dnvh7KeXmIMjEEN3Aew4Xa+TuxiI7SRgX9Eq7m
         wrMqSwBZNLTv/vK1y+4UhA3QMm/mCEUNXLdddYX+u3H6kZZMpHNespQ4SbQaxYrZezwv
         8wJOlqySyiFeqgkQpcyL7NH8FHPalSTPd45LA1Vy1DrpngjWW2LV1IanwiTF42PPOMRh
         1JYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=msP644NlZxMFQgv3SxDPqxLCzhC3FmFvahK+H7/H+EQ=;
        fh=3E+GgkJ59sv88GyUpaKWpV4DoJlJz+B5Ev7H4uQXan0=;
        b=flO46ZeR8+t3SaZkGPjH/Fq46N0QR3tOxA7bFVnS3lVVGf+S7B+fLt4UBCB/wCQ64Z
         ukbN9dBYrApR7rNqEcX1lSU1M2f/mBKcEU+rVs0pBAOoAsVAUAKFvzHqrG9Wrmzxh6v3
         aAl6Pf5WOl5XlwsCmj+XnUOr25/sWHpMgZq1CvygbVdWrWs1o0/MchJFt3anBuXPS4Cq
         nsSfDh/wHcC5r0VAAKPaNwDKU8JvT9ojwLUGqydN7zkGxFJ3fcNn7uYjICGum2EXu17X
         okFieOyqs7+qKOK5eMGY2M4JWfV0qtwF30iH9DXMFYQMVroe5WyND38HZe2B6LeUvvAb
         Ifbw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fe26c6si871914085a.387.2025.05.12.02.11.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 May 2025 02:11:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEPBB-0005QF-Py; Mon, 12 May 2025 05:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uEPB7-0005PR-46; Mon, 12 May 2025 05:10:30 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uEPB3-00056F-3F; Mon, 12 May 2025 05:10:28 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 12 May
 2025 17:10:14 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 12 May 2025 17:10:14 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>
Subject: [PATCH v4 0/3] hw/misc/aspeed_otp: Add ASPEED OTP memory model and
 SoC integration
Date: Mon, 12 May 2025 17:10:10 +0800
Message-ID: <20250512091014.3454083-1-kane_chen@aspeedtech.com>
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
X-TUID: H1JO5dQEych+

From: Kane-Chen-AS <kane_chen@aspeedtech.com>

Dear reviewers,

This series introduces the ASPEED OTP (One-Time Programmable) memory model
and connects it to the SBC controller and AST10x0/AST2600 SoCs.

The OTP model supports irreversible bit programming, file-backed content,
and tracepoints for program conflict debugging.

Patch 2 links the OTP device to the SBC controller and enables command
handling. Patch 3 exposes the machine parameter and updates the SoC tree.

Any feedback or suggestions are appreciated!

Thanks,
Kane

---

ChangeLog
---------
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
  hw/misc/aspeed_sbc: Connect ASPEED OTP memory device to SBC controller
  hw/arm: Integrate ASPEED OTP memory into AST10x0 and AST2600 SoCs

 hw/arm/aspeed.c                 |  20 ++++
 hw/arm/aspeed_ast10x0.c         |   2 +-
 hw/arm/aspeed_ast2600.c         |   2 +-
 hw/misc/aspeed_otpmem.c         | 198 ++++++++++++++++++++++++++++++++
 hw/misc/aspeed_sbc.c            | 197 +++++++++++++++++++++++++++++++
 hw/misc/meson.build             |   1 +
 hw/misc/trace-events            |  10 ++
 include/hw/misc/aspeed_otpmem.h |  39 +++++++
 include/hw/misc/aspeed_sbc.h    |   6 +
 9 files changed, 473 insertions(+), 2 deletions(-)
 create mode 100644 hw/misc/aspeed_otpmem.c
 create mode 100644 include/hw/misc/aspeed_otpmem.h

-- 
2.43.0

