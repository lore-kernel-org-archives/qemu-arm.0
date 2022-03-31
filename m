Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1598066lfb;
        Thu, 31 Mar 2022 00:50:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG/6Tmy5JKDZ+GnVd+DUhf+AosKVghe+urQGTKGXgau3i5LcwBLxwupbwbSGfpdhP1VLCc
X-Received: by 2002:ac8:7d50:0:b0:2e1:c3a2:74da with SMTP id h16-20020ac87d50000000b002e1c3a274damr3032748qtb.318.1648713039674;
        Thu, 31 Mar 2022 00:50:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648713039; cv=none;
        d=google.com; s=arc-20160816;
        b=qA+iIwepJYwWu66zm/46GewsY2UN4BeROV8h35koy7Fkvv3tQylohRK+7TVnzWYMSd
         3LCAzRbP6+WsRV7nmGPn7DomjLqG4gPFGzzVG0qcuFf6pNXUkBw52HDiuwUAVcg30mRz
         780IOKf3INJeEv+RsQ7SkPgPfoJZ+0XOLj/H5EFb77lsG086vwUhneUYdxYTWrVqDVrZ
         Hz/8U49QAT/PPWJAjBi7X2/r1vsZJCRbGeztGhpjf0gZP+x2GGzmfQn2jXwPgrmSsNQ4
         z/p1b7qfqscLnyliqTGqKE0lr5ZYeIOjFrMfNKoQxep7aRNnvKpwcZOitSoUncBbQGj0
         DDaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=D4S+KzCN1u7CzPl19pDqkTHufLUYwYc+FJd7qhSXkGY=;
        b=F5b5vK/U8OtHp4mFhADy8oYMBt1W8n0p23iMNt6Bz6iDwxMDwoZU8O+K0hmWjI05/x
         0fAhXAyIs7ARzZBoeJg3GSBzk8tpqYph1v2VI24z4Uibq7aqkt8PT6c44aimRracTjof
         lLPSMm0eAhalNAT3NxBAtXtKl0Gj5ky9gZeQMnkYJ2hWciW2wd7lk6u6t+soWY43kM7V
         9pxz/C/N4Ngl8Vvw+xA0wu7zoMsAYOphGCsFpQ6jvnFSAoZL4t2LNqIguAJkLzaqf8qa
         4VWozPlUPIPaD+LP8KbRHviiVOOZxH8gtbXB24ilF+XPeX2+k/ZoRDBKUZVSlrioaQ+H
         vfEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17-20020a05620a291100b0067ece88df0bsi17318474qkp.34.2022.03.31.00.50.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 00:50:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nZpZn-0004q2-6z
	for alex.bennee@linaro.org; Thu, 31 Mar 2022 03:50:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nZpYo-0004Iq-5X; Thu, 31 Mar 2022 03:49:38 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:5808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nZpYm-00046Q-37; Thu, 31 Mar 2022 03:49:37 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22V7blSB051493;
 Thu, 31 Mar 2022 15:37:47 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.100) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 31 Mar
 2022 15:48:45 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v4 0/3] aspeed/hace: Support AST2600 HACE
Date: Thu, 31 Mar 2022 15:48:41 +0800
Message-ID: <20220331074844.30065-1-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.100]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22V7blSB051493
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=steven_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OSTzJDd/iytO

This patch series implements ast2600 hace engine with accumulative mode
and unit test against to it.

Verified with following models
- AST2600 with OpenBmc VERSION_ID=2.12.0-dev-660-g4c7b3e692-dirty
  - check hash verification in uboot and check whether qemu crashed
    during openbmc web gui login.
- AST1030 with ASPEED zephyr SDK v1.04
  - run `hash sha256` command in zephyr shell to verify aspeed hace.

Please help to review.

Thanks,
Steven

Changes in v4:
- Separate HACE28 support to another patch.
- Refactor acc_mode message handling flow.

Steven Lee (3):
  aspeed/hace: Support HMAC Key Buffer register.
  aspeed/hace: Support AST2600 HACE
  tests/qtest: Add test for Aspeed HACE accumulative mode

 hw/misc/aspeed_hace.c          | 147 ++++++++++++++++++++++++++++++++-
 include/hw/misc/aspeed_hace.h  |   1 +
 tests/qtest/aspeed_hace-test.c | 145 ++++++++++++++++++++++++++++++++
 3 files changed, 289 insertions(+), 4 deletions(-)

-- 
2.17.1

