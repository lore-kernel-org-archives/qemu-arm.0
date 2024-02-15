Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp412952ejb;
        Wed, 14 Feb 2024 23:59:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCURpCKuEYmECNZfLbi3xNoLG4fznmCjAR7dgYIcJ8kBnWUezENGfXNtSFmM6o7sMkKOcMh02J34/NFYRV/MzF6RkJs8fZdN
X-Google-Smtp-Source: AGHT+IHZurCXhHWdQPiAe4NxaVboEeJHz1f13cahFLyQlHKRqruLrWmp6KyHZhzv1d2xyy40X2j5
X-Received: by 2002:a05:620a:a14:b0:787:351d:558e with SMTP id i20-20020a05620a0a1400b00787351d558emr1217262qka.36.1707983978936;
        Wed, 14 Feb 2024 23:59:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707983978; cv=none;
        d=google.com; s=arc-20160816;
        b=drWz/TrqTTHgn7rgX2jNnSFW906P0im5DXJyceGLGM1SXxx6aP4/3U3QVAD3EOjGBH
         RbDNjZyn1FwSbfQv8YUfOv8n/8CoFg7t9I8rRHqIquZpLJUufeFzBvZ1KczEclLM0NJo
         BWWBn/Insb4uA41BWgP1uWPK4FvpLORFtRpwlIeKQZJdc5QgvCWqFDkeFE4m4ZVw7MC0
         hjsFLDueBMIbzLEiFsKbY2SKFSSevKp+nQ4MvZm0Yl5C5EpUH3ZTOpQYSQ6ld5ul8IoZ
         mMOTmeQabH0XybMaP2oHHUDOJaAmjbJYYrzySW5Q8RzmbyntC+kumZZO1xyWkoofWte+
         mrjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=t922iIJRagU2vtOxd4ULdiM32t+BdrRFloOXC4JlIpI=;
        fh=jkt7ehUcUSTQBo264eWmsavDvXA1+0nMupSr24pggQ4=;
        b=ix+VEnq86Cn2bXmAj/o+4dqwSimY5lI2EHkloczMh/9VvN7yWlhE5MDw6bNZpX6Hxk
         FLe7J/Evon0/0dVMEbCRgugDCjculVSY8F8dN0kHpch2Vj13n0Qz8PJckKBKp3pFZ4Ww
         lmaNQ2fF5gOqnr0V5tKaknnRPPeH5NCDy/5XBjFEbFiFGURjmAz5TXkAjhzsyzUo/OCa
         7LEWORu3oC2w29A/IvfQTs49UaLf+N7x9b0JDaS0MUaUjf8+rR795rIrjCuCL2x9Jy/V
         MhgdpvwkmYlOt1TJSsv74SqKqqPHOoQi6eEjIy80CQziVvV2bcp1pTlp9qa9vuJ9eejb
         a6gg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1-20020a37e301000000b007871947002esi955618qki.177.2024.02.14.23.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Feb 2024 23:59:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raWea-0007aC-8p; Thu, 15 Feb 2024 02:59:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1raWeY-0007Zr-B7; Thu, 15 Feb 2024 02:59:30 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX02.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1raWeW-0006Sm-BT; Thu, 15 Feb 2024 02:59:30 -0500
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 15 Feb
 2024 15:59:15 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Feb 2024 15:59:15 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v3 0/2] UART0 device name and fix hardcode boot address 0
Date: Thu, 15 Feb 2024 15:59:12 +0800
Message-ID: <20240215075914.2544262-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=twmbx02.aspeed.com;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX02.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mici8kZSpTB7

v1:
1. support uart controller both 0 and 1 base
2. fix hardcode boot address 0

v2:
1. introduce a new UART0 device name
2. remove ASPEED_SOC_SPI_BOOT_ADDR marco

v3:
1. add uart helper functions to get the index, start and last.
2. add more description in commit log

Jamin Lin (2):
  aspeed: introduce a new UART0 device name
  aspeed: fix hardcode boot address 0

 hw/arm/aspeed.c             | 17 +++++++++++------
 hw/arm/aspeed_ast10x0.c     |  1 +
 hw/arm/aspeed_ast2400.c     |  6 ++++--
 hw/arm/aspeed_ast2600.c     |  3 ++-
 hw/arm/aspeed_soc_common.c  | 10 ++++++----
 include/hw/arm/aspeed_soc.h | 19 +++++++++++++++++--
 6 files changed, 41 insertions(+), 15 deletions(-)

-- 
2.25.1

