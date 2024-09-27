Received: by 2002:a17:504:5f68:b0:1be9:327d:8ee3 with SMTP id gl8csp167394njc;
        Fri, 27 Sep 2024 00:32:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWH+ECHSyBUECmRXhew9N/MqUFibun0K5gFTyJukTeGKrV+dRnGVrTvCkuI8y1gszMLN3cwpKLgHoA7cw==@linaro.org
X-Google-Smtp-Source: AGHT+IGQFgev5T7Uazgzwrk6qNk5FSkHWAya9NS/YO7ALgq33+5vLLcAqQlcYXmAY4ULcn4NAl5Q
X-Received: by 2002:a05:622a:15cf:b0:458:1def:72ba with SMTP id d75a77b69052e-45c9f2829bbmr34530741cf.46.1727422366193;
        Fri, 27 Sep 2024 00:32:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727422366; cv=none;
        d=google.com; s=arc-20240605;
        b=O1+vT2yeE/luL7eugp2fzpTdzPU5Hg08eQP+Cu65PAwpLKpXuw3Pni+wSXVYDV0AS0
         tLaV+kCZehSJOLheJoIpazUOBB53gB93I8r0QF7CkeH+Gufc2PSKr+UiJYl+kv/nl9Qy
         I/ahn5nlWOWW2rPC/sZp0cGFvnSiQ2s1KAvYXAlnBjx9wWIFwI+wa4FUSXwglPsROFyg
         IctNyb5hAWDT9YPOY5RDfch+u22eZexgxRWEdrUPwoNg1+FdvvnRNNH1vx4SlAuqTUKg
         NYe6+NrEQzDZV73U0nlV/1zLriGAfKHcCDNv6BoqAP1xNB+LNPFF2S82I6q+b+0iGc70
         Uj0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=oDLyVsnvHSN6sRPmJqp4zBQWmgj851qMbl0uUlAECGo=;
        fh=bfdvnURtAD34fQ77QeZnvwdM4/zSvHk1Doa+KIkv0v8=;
        b=EPgz261wYWf8u4R4U83r4hMlJpYN6sqZUJ7eST8sCVMZ9MHRODUBIWkCOwIPrf/06c
         APra0Gho0pssQfDAx+b4xOUd5BUCCeyUBITfiX102b2/Cc9YV3D+tbApIbvd7rm4vA69
         uZ0Zp1Ij1O1prbZYHIBIdoXEUfXuOF6+2IJKh7UoBeUE7e6kraF5Kv+rdazytHBsiiTw
         5nRwYMmST5/i8Wh6yhZWrvUozzEoHZChXeEwYkumAL7HlwVIBOrQDHdZ9K6GBCgFw6Dr
         u5nD7A4qoE6HAY7fFiF3LoCoObjzKmBt7HI/AXKfkva+1Ylg+GDv5s5x5xQhg1Za324v
         uWYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45c9f3ac0e8si15762461cf.804.2024.09.27.00.32.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2024 00:32:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1su5SO-0001Kg-4h; Fri, 27 Sep 2024 03:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1su5SJ-0001Hh-E7; Fri, 27 Sep 2024 03:32:00 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1su5SE-0004DY-Gd; Fri, 27 Sep 2024 03:31:58 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 27 Sep
 2024 15:31:44 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 27 Sep 2024 15:31:44 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v4 0/7] Support GPIO for AST2700
Date: Fri, 27 Sep 2024 15:31:37 +0800
Message-ID: <20240927073144.2303522-1-jamin_lin@aspeedtech.com>
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
X-TUID: QagJtDIXpXEc

v1: Support GPIO for AST2700
v2: Fix clear incorrect interrupt status and adds reviewer suggestions
v3: remove nested conditionals and adds reviewer suggestions
v4: add test cases to test GPIO for AST2700 and update commit messages

Jamin Lin (7):
  hw/gpio/aspeed: Fix coding style
  hw/gpio/aspeed: Support to set the different memory size
  hw/gpio/aspeed: Support different memory region ops
  hw/gpio/aspeed: Fix clear incorrect interrupt status for GPIO index
    mode
  hw/gpio/aspeed: Add AST2700 support
  aspeed/soc: Support GPIO for AST2700 and correct irq 130
  hw/gpio/aspeed: Add test case for AST2700

 hw/arm/aspeed_ast27x0.c        |  18 +-
 hw/gpio/aspeed_gpio.c          | 427 +++++++++++++++++++++++++++++++--
 include/hw/gpio/aspeed_gpio.h  |   4 +-
 tests/qtest/aspeed_gpio-test.c |  64 +++++
 4 files changed, 494 insertions(+), 19 deletions(-)

-- 
2.34.1

