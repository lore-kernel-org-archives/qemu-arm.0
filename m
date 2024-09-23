Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp2115132njb;
        Mon, 23 Sep 2024 02:42:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV6m0FgKtJ79QrX5Mm0Nl2P7XppeqdBw9ZVtaWVVIORrronKbMrUscarKDrn+X6VYcvXdpdcQ+TXxlgSQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHqCgbI0jikaDOJpElfbQSwSarF14o2w0OYz2gYg/jPzoEKeL3KYAy2DvsDc58r/cEMz2Ze
X-Received: by 2002:a05:620a:19a1:b0:79f:148:d834 with SMTP id af79cd13be357-7acb8e1e800mr1985377385a.59.1727084554503;
        Mon, 23 Sep 2024 02:42:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727084554; cv=none;
        d=google.com; s=arc-20240605;
        b=Pdg97Di+nz6YwfcEjT1dhEPIUwQ8EbeVekELit31rNCRfXs1kWA9qzLCm0Bj16zZ9g
         BaMlm1wDITGx7E6tPRorupF5hA6tH1IscyMj5jeTDmyPhO0Loag1E3DVWiftJUQgExA+
         /PS0nKwHvb4/u5AXna3f8eJ0aGs/pTGnLHpPFb1XMnEaapFBNv3b2Mm1Mpc00RtkycIH
         U3+bd5acSLOWt8/sp8/b2Aj4c0FhFcgdfeeBSdL/yRul3vPYpcnxrpHPQIWfzLCwDfid
         67UZYtytxLg5/yJW/XgUPEPxs3WGCfYZ693B7NMWoqVlQQ3NCXpDlhXIgvrBArS1aHKY
         /2lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=gbGHdvaZ7rwU62t1y2MpfP5ApxA9TcS2qxLJkhqd3BY=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=ZUmmLqZAyzVZTLlC9hq1pZL35fAiU7wKcZJVfPsFKwkPdit4A7cqvR7KTH+/T7thu4
         sn42uhnvuxbJsFqtkDCSdWFZEcpe+Hxaj5S6jid6RYi3XroRg6NIVBhge9j2/kohixIg
         K+jewmnRMWZQGXPaFqdx9yMy8Q8XpvrDdAXHx0VUbC+paTLGHrwh+yMYv2gxR1+lNxN9
         CGeRYTtVbtX9RgsIOhDTlcL0mtRR2F/mEOhxr62ge4d+ZjStuUK0xuTTh8kRj8nexdFw
         m30kwKS9SG3ICDUWjgqheRY/ntvGaX/QfpGZw2iGg7HPVsM7C5PfpHd0jbxBcApsxUV+
         kxlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7acb08f4a24si1026180085a.553.2024.09.23.02.42.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2024 02:42:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ssfaK-00004z-Gi; Mon, 23 Sep 2024 05:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ssfaI-0008NQ-6n; Mon, 23 Sep 2024 05:42:22 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ssfaE-0008C9-UH; Mon, 23 Sep 2024 05:42:21 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 23 Sep
 2024 17:42:06 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 23 Sep 2024 17:42:06 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH 0/5] Support GPIO for AST2700
Date: Mon, 23 Sep 2024 17:42:00 +0800
Message-ID: <20240923094206.1455783-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
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
X-TUID: 6UY7Ej8TBP13

v1: support GPIO for AST2700

Jamin Lin (5):
  hw/gpio/aspeed: Fix coding style
  hw/gpio/aspeed: Support to set the different memory size
  hw/gpio/aspeed: Support different memory region ops
  hw/gpio/aspeed: Add AST2700 support
  aspeed/soc: Support GPIO for AST2700

 hw/arm/aspeed_ast27x0.c       |  18 +-
 hw/gpio/aspeed_gpio.c         | 390 +++++++++++++++++++++++++++++++++-
 include/hw/gpio/aspeed_gpio.h |   4 +-
 3 files changed, 405 insertions(+), 7 deletions(-)

-- 
2.34.1

