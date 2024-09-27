Received: by 2002:a17:504:5f68:b0:1be9:327d:8ee3 with SMTP id gl8csp190886njc;
        Fri, 27 Sep 2024 01:35:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVX8fUjWj6OCsWJJiKIm674nmaUk1eu13PgjBMC4gAD2SLeNbrsMIH0SnCbH0Dpoepf0Fl41+YDdkLemg==@linaro.org
X-Google-Smtp-Source: AGHT+IFqbEIAx/67EAJrCtkZi5GUH/dkC9JqDOK7iP3iFIcfcAL3wj6eHDI6kpDicEwEsnvrPa/F
X-Received: by 2002:a05:620a:4415:b0:7a9:b739:3747 with SMTP id af79cd13be357-7ae378c0d8amr316892985a.41.1727426158864;
        Fri, 27 Sep 2024 01:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727426158; cv=none;
        d=google.com; s=arc-20240605;
        b=k2QVxa0NUmilexTdeAIpiMngOIYGB353hMnI0g/E70mZUDaYu3Rb0w3DE8uHkk2ijx
         wDY1FBJrkEXGWUgigrHr8il4Yx5txt7a4fFtyrkyMrT+jOXCkn3pjf/8FUzB43We2QFQ
         8yHBXUnkAT/d7bqr4EKcZ03+tq9I+MCsOTSwwxMRfGXVZw0fb/gE3VHhuRDr8S4FnQ5A
         VUh7JUHjfy6UNMgAmgr2IJD9Ek7Ac+3v4FjJtS21yikVeWbW42nHdPgizG6MIU6HVxBT
         phU6IMo5eyP0dZZDdMSu35+ce3MPzNy6cZsOe2LR7cO1VGjcs0HA+W7b8oNz4ee9JALe
         Y4xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=eV8WsQ0T0WY0wE1mu0kT3ulUHHCexHmpnTe/n6zIAbY=;
        fh=bfdvnURtAD34fQ77QeZnvwdM4/zSvHk1Doa+KIkv0v8=;
        b=DBuYGFsLdrlDo3oCHii/+N0Vf+j50zAwYAXjejTl6FSWlgVousKosTdSicBZo6unwE
         9E5GO4v4vkyPrc9Pd2/wInzf5M08wDN3O2g+RF0CNXObdCr5dSM17MLNp/9JIW1wE4Nl
         RaNm+fIX4Vc2Lr3GxjhxhgFPf/On/jmTVo/apOz2IrjM02MeSfzdkdTxKkGe2pRKLdpN
         rzt2/kZbAOVcQmcHLIhFcSMYW66ifDuI1dS2MbeUbRcbTRWo4iNLGTKG4Nz/f+fimb9P
         RLS5XBRz9lN6vBmjWNxokZy2RJLG35NtPZveEY8YoV3YMdeRo+rwjk8JAf++g49tSlze
         U1dA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae3789ffa1si169602085a.725.2024.09.27.01.35.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2024 01:35:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1su6QN-0006bz-MA; Fri, 27 Sep 2024 04:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1su6QM-0006b6-0p; Fri, 27 Sep 2024 04:34:02 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1su6QJ-0003ff-SA; Fri, 27 Sep 2024 04:34:01 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 27 Sep
 2024 16:33:51 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 27 Sep 2024 16:33:51 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v5 0/7] Support GPIO for AST2700
Date: Fri, 27 Sep 2024 16:33:44 +0800
Message-ID: <20240927083351.2637798-1-jamin_lin@aspeedtech.com>
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
X-TUID: 9l7m/l8uo/3W

v1: Support GPIO for AST2700
v2: Fix clear incorrect interrupt status and adds reviewer suggestions
v3: remove nested conditionals and adds reviewer suggestions
v4: add test cases to test GPIO for AST2700 and update commit messages
v5: fix aspeed_gpio-test test failed if arch is arm

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
 tests/qtest/aspeed_gpio-test.c |  68 ++++++
 4 files changed, 498 insertions(+), 19 deletions(-)

-- 
2.34.1

