Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1426706njb;
        Thu, 6 Feb 2025 01:53:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVhx7fXljzPdFJtnyUApY73Uzqc/WoF1bi2OLheygwGEndxAi9ejDPTkkI2GBBwGpsM06yr5Ph1Ms0lQQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEheYcPCKVgUnzioETXrLZWLKgo6gC6mI6k+rrJz4UQxPECBNjedhWzV5rXxZPiQIhVWMGd
X-Received: by 2002:ac8:7fc4:0:b0:46f:d6c3:2de9 with SMTP id d75a77b69052e-47028168d36mr61287841cf.7.1738835614035;
        Thu, 06 Feb 2025 01:53:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738835614; cv=none;
        d=google.com; s=arc-20240605;
        b=Rpa8KibmxHPf7LjPFuVn/VTOVNm+mJtYWpdP9Z86ZgsENhkBu+7ICUAd/L59raDNN3
         a66P7KPZ2qLB9233nnjZIGq7m7RpHSjlxHTDh08EBnD+WB1SdYa1RVOGNOawkwqnwjoU
         wgH4kHUmIOFn4ZLGXGRC8cc/+l2S9yQ/cSu9aDUSHJk8CN43JyprHwgoDcZ/Vl4G2gH1
         2pUhQexlxexgVXV2VfvxxFHciZgQpY/Il9bqwu3KP1f5B1YYewPUmUs3Z90Kimg+qe3N
         8ctulinmN4MTyhpMyUmKKEVTx2GKTN55EdEamF8v9kFkBl82wxsIoPWl41mMVVhvsJ7R
         zymg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=/5a4zQCoMdiELl+Bzw+RaXISePSq4G2dscc5x4PAVjs=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=Qvd2K3FcmiisfT4nSaEl/VavOf+3q8ZOB8HSRptJQr46LyRmvGxhZJzLYab81DLocT
         5Kom1bNM/KCFMLfdQi22JssmINE96S0aNJGiPrpsIcqiyfNCHARps/C3Lx4QKK1aN+v7
         ckax8TBZCCM0Jltt1kmxuTSyt4V73ofQCJfS5eB6TCy62jZtPm1igIKjT3/j6v8r7YYB
         rU06i44gIxGJL4YrfR9RuUrQUogye19LykIQVQoApxykrY2bkrptOgHAuHRn+pHDXLTE
         xYdVXh+Co0gj5JXX2GJ49KV8KUlUF6RJlrq3huGVn+iJdry8NTt2GK0Q9fx8YawC9XH5
         9d4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153b926a3si7952701cf.435.2025.02.06.01.53.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 01:53:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfyZN-0001yB-6O; Thu, 06 Feb 2025 04:53:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tfyZC-0001wy-71; Thu, 06 Feb 2025 04:53:04 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tfyZ9-00051a-O3; Thu, 06 Feb 2025 04:53:01 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 6 Feb
 2025 17:52:53 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 6 Feb 2025 17:52:53 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 0/6] INTC model cleanup
Date: Thu, 6 Feb 2025 17:52:46 +0800
Message-ID: <20250206095253.928308-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Jj1KtdEMnmoE

v2:
  To streamline the review process, split the following patch series into
  three parts.
  https://patchwork.kernel.org/project/qemu-devel/cover/20250121070424.2465942-1-jamin_lin@aspeedtech.com/
  This patch series focuses on cleaning up the INTC model to
  facilitate future support for the INTC_IO model.

Jamin Lin (6):
  hw/intc/aspeed: Support setting different memory and register size
  hw/intc/aspeed: Introduce helper functions for enable and status
    registers
  hw/intc/aspeed: Add object type name to trace events for better
    debugging
  hw/arm/aspeed: Rename IRQ table and machine name for AST2700 A0
  hw/arm/aspeed_ast27x0: Sort the IRQ table by IRQ number
  hw/intc/aspeed: Support different memory region ops

 hw/arm/aspeed.c               |   8 +-
 hw/arm/aspeed_ast27x0.c       |  58 ++++-----
 hw/intc/aspeed_intc.c         | 227 ++++++++++++++++++++--------------
 hw/intc/trace-events          |  24 ++--
 include/hw/intc/aspeed_intc.h |   5 +
 5 files changed, 183 insertions(+), 139 deletions(-)

-- 
2.34.1

