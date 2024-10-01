Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp208985njl;
        Tue, 1 Oct 2024 07:12:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWb09s/cRktxK7p2QJr/wOOIG2TXLpBYGYxUGh+woKU3vv0CMtoxi/YLDPgG9et3Am036BhYXEdJBAHXA==@linaro.org
X-Google-Smtp-Source: AGHT+IFjEFYq6B8as3exPfHR6CFlJIZbfIMNjc5fiVCdzdAP9gLZjgnP0xNB5jl4I5whED7/tTGv
X-Received: by 2002:a05:620a:4490:b0:7a9:ad11:9feb with SMTP id af79cd13be357-7ae3783f830mr2220272185a.24.1727791977161;
        Tue, 01 Oct 2024 07:12:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727791977; cv=none;
        d=google.com; s=arc-20240605;
        b=c58iK99z2UNf6sZ/7rFEECq7lRGAq4a/NlH6lZNiugD1MmZHy90H1sP2CZ7SKBsBCZ
         bl03CDU/B7EAppIcOaZNnNOHZ6J6wXYK+vu6rM/WEEx/y3/veqkETQPqZbN0j+WphOK3
         N2J6bJBd3zTMvhj5n7oeQ3KNvHufcrQ0BMerpV1WQHDki62WFg+1O7/23O3C83GliirQ
         PFdsTlsnTdvEHRESGj7A9gMWfQ8pPFwc0bF6oPQ3nIV6tz5qxvgmXsLuhyNI1KSuKqB2
         pq/Pgm6CdQDeVnU2ohCPuQfjOlMjN1He1Qur7tbBhS5GRf4l+ypPH/CCmXDWMwesJwMQ
         Stdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=q2Od+U0pFkpjLzfgS/Gu1wc2yxHAAOA7Xe5tnX0NDSE=;
        fh=bfdvnURtAD34fQ77QeZnvwdM4/zSvHk1Doa+KIkv0v8=;
        b=IogB4XTQdaVLZsCqtfm/UjfCk97uXmXnFnxYuPqND8GASoSMsVo9LNQz7q00PttX/k
         iPFF0G834Zz7rrT/PM7IgHSeopk54Yf/LBiP4u1tHuAcYGpZCa5tr9cTcDJL1RHPGThq
         qRGLE4d9zrY+IrJxbbLJNh3DWO2YcAuKxBZsBlID9CzA8m3a9qzDiKhd/O26nOqVcI4x
         4BPt228cHAYbPL3iTd7uiItvF0JexJOazSnuKOAnzvzwhP0hnKe2186ABl+bs/BmV5gi
         tEdog1YrEyix8dl4luPhPxzEEwwHMFXDH4rKvQGDhno/ptqTyOJStz/ZQYCzN/kmXxPS
         O75A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae37854c5bsi1087845685a.477.2024.10.01.07.12.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2024 07:12:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svdc9-00085f-S9; Tue, 01 Oct 2024 10:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1svdbi-0007XU-1Q; Tue, 01 Oct 2024 10:12:06 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1svdbe-0002zy-So; Tue, 01 Oct 2024 10:12:05 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 1 Oct
 2024 10:43:34 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 1 Oct 2024 10:43:34 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v7 0/8] Support GPIO for AST2700
Date: Tue, 1 Oct 2024 10:43:26 +0800
Message-ID: <20241001024334.834807-1-jamin_lin@aspeedtech.com>
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
X-TUID: jRPkBf4wY/2H

v1: Support GPIO for AST2700
v2: Fix clear incorrect interrupt status and adds reviewer suggestions
v3: Remove nested conditionals and adds reviewer suggestions
v4: Add test cases to test GPIO for AST2700 and update commit messages
v5: Fix aspeed_gpio-test test failed if arch is arm
v6: Add to test aspeed_gpio-test for aarch64
v7: Move GPIO testcase for AST2700 to ast2700-gpio-test.c

Jamin Lin (8):
  hw/gpio/aspeed: Fix coding style
  hw/gpio/aspeed: Support to set the different memory size
  hw/gpio/aspeed: Support different memory region ops
  hw/gpio/aspeed: Fix clear incorrect interrupt status for GPIO index
    mode
  hw/gpio/aspeed: Add AST2700 support
  aspeed/soc: Correct GPIO irq 130 for AST2700
  aspeed/soc: Support GPIO for AST2700
  tests/qtest:ast2700-gpio-test: Add GPIO test case for AST2700

 hw/arm/aspeed_ast27x0.c         |  18 +-
 hw/gpio/aspeed_gpio.c           | 427 ++++++++++++++++++++++++++++++--
 include/hw/gpio/aspeed_gpio.h   |   4 +-
 tests/qtest/ast2700-gpio-test.c |  95 +++++++
 tests/qtest/meson.build         |   3 +
 5 files changed, 528 insertions(+), 19 deletions(-)
 create mode 100644 tests/qtest/ast2700-gpio-test.c

-- 
2.34.1

