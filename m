Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp86624njb;
        Tue, 24 Sep 2024 20:36:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWUP0Ih3fDKINjvtNga+M929ap7g4d3x8AmOU9K4ujkD7nd0vp/JqSiwCkUuIYY0G2fjx/+E3Ouamo2WQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFFDsde02T8du1C7LoplZEf1NudBop8dOExn5d3CbPwGM0Amwz4W17dZf7kYUuEObXF1a4H
X-Received: by 2002:a05:622a:1812:b0:458:2214:9c88 with SMTP id d75a77b69052e-45b5dece48dmr25759691cf.2.1727235376507;
        Tue, 24 Sep 2024 20:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727235376; cv=none;
        d=google.com; s=arc-20240605;
        b=XYZfyWFpXuQfoc0PmrqnLm8Mfv/zEQ4gMuQzuxEMwXo74lcxCjb/Ep0B7rKqLZsDjq
         Y2pt2INp0mk69BeEBS2v21fI+pne1X3lj8mcCjMAWF6pgyDmsnbbpZcjpuQQ385LpGGR
         NnzKb6FKgtJ9slOIqdPiWfU096are4Qlyps4HAb7P4vdSDOIt2UZHvrZcy7DL/HiiqFf
         lnrVTqDLxAewkTAFXCX2EyDNsFo4NpQoBRauIIomcB0Q+BHo3a1U5qaCyqvJyW2Q6988
         l/c7ZXjxLMtPtzJXJ20ZEaWYAwfOImGAsIGagoJQU2RWFVyDTyV8l/ncQfIQM3dUMusM
         1dBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=9OvADZc0ts0pP6Jed9hSWpXMqOSuZENTAYqygDaRCRU=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=alh/lLKSlswqAli7qZmBnTJufrGhNcWStp1eJ1h3NBuqj0UBPbFpT5cKpramq9VcTp
         +/2Daaa3Gkg87uJV200Zn2SwrY7NJ990hEH91Uc2IO1uHOXeWPQ5Q2KThv8x7FvOSnI3
         bfV4X5RoKlZLtCRfOpYh0YVMmLb6HHwO1sq5dxpl150yLIYXzHpRMyw9S4P4nOmruvfd
         o01YuGWx81qUEHz/Lq6EydzWDVF5NDMoo6SndMKcqqgeMH4PU21dLojWGi48r4x3hNib
         4a0nATP04jEK0yDqzx3i2Hm6RBJoyKnX0e5KIv4mUeYAnDLDvNhmpIszEqpUdvsa0ZJ4
         n4yA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45b5256f9a5si29498691cf.88.2024.09.24.20.36.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Sep 2024 20:36:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1stInz-0003Md-HD; Tue, 24 Sep 2024 23:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1stInx-0003HO-Aj; Tue, 24 Sep 2024 23:35:05 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1stInu-0007FP-Mv; Tue, 24 Sep 2024 23:35:05 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 25 Sep
 2024 11:34:54 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 25 Sep 2024 11:34:54 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 0/6] Support GPIO for AST2700
Date: Wed, 25 Sep 2024 11:34:48 +0800
Message-ID: <20240925033454.4117445-1-jamin_lin@aspeedtech.com>
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
X-TUID: w4+BuP3rA+Im

v1: Support GPIO for AST2700
v2: Fix clear incorrect interrupt status and adds reviewer suggestion

Jamin Lin (6):
  hw/gpio/aspeed: Fix coding style
  hw/gpio/aspeed: Support to set the different memory size
  hw/gpio/aspeed: Support different memory region ops
  hw/gpio/aspeed: Fix clear incorrect interrupt status for GPIO index
    mode
  hw/gpio/aspeed: Add AST2700 support
  aspeed/soc: Support GPIO for AST2700

 hw/arm/aspeed_ast27x0.c       |  18 +-
 hw/gpio/aspeed_gpio.c         | 413 ++++++++++++++++++++++++++++++++--
 include/hw/gpio/aspeed_gpio.h |   4 +-
 3 files changed, 418 insertions(+), 17 deletions(-)

-- 
2.34.1

