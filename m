Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp1585214njn;
        Sun, 12 Jan 2025 22:45:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUf/hJgDFv/SPO5LOym2eOFichiJTUA6mJs0Hc0suGHQE1IbYfRBStfVtuFaXN4kc8BsbSCAS/U/2hNsg==@linaro.org
X-Google-Smtp-Source: AGHT+IGeq+JKHYVe0Q3sjei2jhsylawSJhXB3Zyelr1s+a+p1DLhKByhcWM4FRzCqFxxawUxZbOQ
X-Received: by 2002:a05:620a:2b96:b0:7b6:deaa:3189 with SMTP id af79cd13be357-7bcd97d5661mr3651919285a.54.1736750729637;
        Sun, 12 Jan 2025 22:45:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736750729; cv=none;
        d=google.com; s=arc-20240605;
        b=YapFD1d7Qh6FDPj3LFCVyhZtFWsfWEVNK+JY2gZOQFW6qV6Iy4JVRuZzkAneFHSCLG
         KjIeGzt8fJp2ZE7/GCRksreIiZvbcsfqVSHbek+OfmrnN09PNDS2J0uQmcOvU/f7S4Jk
         t+sDdFnNoWJrNKivpAQOzLR3oz7cEQ5ZO3K6cmtrTJIRfcf161zjmnq7T5OVIUucusvO
         beH0lNcoDuFLruWTZYaxU3Z+oeorRcm4RFrxxYSDnFqoAEbUr2Jpe7n1m6kJwX64NmMw
         MUQhoZ1TtJ+Vr6ttoL6qSZ8PzmViClUcb9meNIyxS955X5orUYJa0GK2qCjyNqK1T/T/
         t6yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=1xM93LutQfjfRwYIxZnffr0h+9JQ3/THDkC4oZTyg+o=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=IEjy0MEKJUR2xEB+pCdrq+03raYBOSyKi5P9TgjU4MB5PDWAGzukpKzbQJoO7TUmu8
         qMhMaMOMZuTXQqOSihxoEvawGC1e0ncwTHG+3+Mm2JpwOqgCRqh+WAi720mlY4fTf9bN
         Bo+2mXktlHRpKLRDkfgMAy7/z3NN0XZz5VVbhammH77FC5rubkDsjP1ePt1QuZDtszoU
         uRvPq+wKlORDuFC+bFHKq/XjaJ1OIo3cm/jgoAz7I/jBhWtwsyBqwjXwN8jPFNh4SP3U
         T+XrJUegrzgpm81QVikmcwUj1p0a/NbuSSRmORvCVJqAOmwjhGeKvufk0pXgZP2C9GJ4
         11bw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce34fe98esi1011600485a.475.2025.01.12.22.45.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2025 22:45:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tXECF-0001sm-9a; Mon, 13 Jan 2025 01:45:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tXECD-0001sG-KR; Mon, 13 Jan 2025 01:45:09 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tXEC9-0003zU-Qe; Mon, 13 Jan 2025 01:45:07 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 13 Jan
 2025 14:44:55 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 13 Jan 2025 14:44:55 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 0/3] Support timer for AST2700
Date: Mon, 13 Jan 2025 14:44:52 +0800
Message-ID: <20250113064455.1660564-1-jamin_lin@aspeedtech.com>
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
X-TUID: cZCwLZ5o3Pp5

v1:
  - Support timer for AST2700
  - Introduce new "aspeed_2700_timer_read" and "aspeed_2700_timer_write"
    callback functions and "aspeed_2700_timer_ops" memory
    region operation for AST2700.
    Introduce a new ast2700 class to support AST2700.
    
v2:
  Refactor Timer Callbacks for SoC-Specific Implementations

Jamin Lin (3):
  hw/timer/aspeed: Refactor Timer Callbacks for SoC-Specific
    Implementations
  hw/timer/aspeed: Add AST2700 Support
  aspeed/soc: Support Timer for AST2700

 hw/arm/aspeed_ast27x0.c         |  17 +++
 hw/timer/aspeed_timer.c         | 263 ++++++++++++++++++++++++++++++--
 hw/timer/trace-events           |   2 +-
 include/hw/timer/aspeed_timer.h |   1 +
 4 files changed, 267 insertions(+), 16 deletions(-)

-- 
2.34.1

