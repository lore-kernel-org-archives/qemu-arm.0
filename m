Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp686125lfh;
        Tue, 24 May 2022 22:58:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXmmTD3o5xY11aHaju4mdP12PiakvLPZXLbJcq9tPFUxQhIXsv2WkkiODFl6mJgmm/cDDd
X-Received: by 2002:a05:6214:2305:b0:432:f1d4:6177 with SMTP id gc5-20020a056214230500b00432f1d46177mr24431091qvb.107.1653458296431;
        Tue, 24 May 2022 22:58:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653458296; cv=none;
        d=google.com; s=arc-20160816;
        b=HpjQ53VwkeX1QvC8APSqdQt+0af6U4swQR1Uk51oRWvXoc4Yd9Irx7gGDWkSNxdbds
         oYNZZLt+3y+vnPUIuh47NyDxfbH1Q0p/7278emvQBqER2anvIVyAQZ+R9mFeJODqaWDi
         jLEUlJF8cx+mUP05KKIpoQeLbHRUx4ICnleb4M9TsjD5nGvR84Sg2aGyHkrJiLPoik8h
         6D9KJIP2f82E3Pp5KgXQBDdRh/1VMa+Z2qcfTp4rGHHgwobCxSz0oUBT5Tu5CI9mEOIx
         IiyHftF+0D8b7JZfi4WMiaeaQh4m1IjS1NSkI46hhKsW71O6Gdm+zoKMGlzqUmAjeIUg
         NX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:cc:to:from;
        bh=YlSfNo9VMZW5mygsFh2RgiXCOS9dkKHTk5rfP+CH5UU=;
        b=IAfJorrYkUrVV8fN7Th/4mP/YNO3TMuklPckfFgsebiYtNJPUi+ED/kBmH0HOB0hEh
         zWNJffxFbtSDVJ7TuKVi+ddKqv//6xwqAcBjNCz4GHjmz8ObK1lS82zmqt5CCllq6SCa
         Ouu/bfY0B8jx+9r7KJbZdGGhrKcn5mYTgNM3lRnwjalAFBOUEaPVSc7rpKD3eQp8OUWE
         /SXI6wnpWpnLXmDGMV+yfuFn7WZYcxg+cHxMPLTyyJaLYwPlr/JcNbHGe0feDB8rEoNX
         uWfCtKP5qC49pQu0NVpy+Jv914KTp1K8sOdN2DGrBl6ihi+EyfSHr0OVEkM2sc3HoS71
         24FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13-20020ac8588d000000b002f3db75589dsi824586qta.501.2022.05.24.22.58.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 May 2022 22:58:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntk2B-0008K8-Tg
	for alex.bennee@linaro.org; Wed, 25 May 2022 01:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ntjgT-0001AE-Sf; Wed, 25 May 2022 01:35:49 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:52379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ntjgR-0003xq-Nl; Wed, 25 May 2022 01:35:49 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 24P5Kg9i022843;
 Wed, 25 May 2022 13:20:42 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.123) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 May
 2022 13:34:47 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
CC: <steven_lee@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <jamin_lin@aspeedtech.com>
Subject: [PATCH v2 0/4] hw/gpio Add ASPEED GPIO model for AST1030
Date: Wed, 25 May 2022 13:34:40 +0800
Message-ID: <20220525053444.27228-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.123]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 24P5Kg9i022843
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QcelA1gmpfCa

-v2 changes

Create separate patches to support the following features

1. Add GPIO read/write trace event.
2. Support GPIO index mode for write operation.
It did not support GPIO index mode for read operation.
3. AST1030 integrates one set of Parallel GPIO Controller
with maximum 151 control pins, which are 21 groups
(A~U, exclude pin: M6 M7 Q5 Q6 Q7 R0 R1 R4 R5 R6 R7 S0 S3 S4
S5 S6 S7 ) and the group T and U are input only.
4. replace HWADDR_PRIx with PRIx64

Jamin Lin (4):
  hw/gpio Add GPIO read/write trace event.
  hw/gpio: Add ASPEED GPIO model for AST1030
  hw/gpio support GPIO index mode for write operation.
  hw/gpio: replace HWADDR_PRIx with PRIx64

 hw/arm/aspeed_ast10x0.c       |  11 ++
 hw/gpio/aspeed_gpio.c         | 257 +++++++++++++++++++++++++++++++---
 hw/gpio/trace-events          |   5 +
 include/hw/gpio/aspeed_gpio.h |  16 ++-
 4 files changed, 269 insertions(+), 20 deletions(-)

-- 
2.17.1

