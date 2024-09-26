Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp777478njb;
        Thu, 26 Sep 2024 00:46:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUpqv2MsXGlqbWGNKJmBtcB11N4CfrupKmmRofiYIJ5Ogf5YeMbo3Dr0tC/caY3kGoog9f0N8FdCuaW0A==@linaro.org
X-Google-Smtp-Source: AGHT+IHqIcGpaXCgi/JJ1/b5VLzdEih0x5+y8SH6pyM+oyqLRaLpwhFy7e/WAVHlAwQdWylp00O3
X-Received: by 2002:a05:6214:5345:b0:6c5:62e5:f348 with SMTP id 6a1803df08f44-6cb1ddcb205mr67303826d6.29.1727336783662;
        Thu, 26 Sep 2024 00:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727336783; cv=none;
        d=google.com; s=arc-20240605;
        b=X0CPJfAe8HmYeW3xDKtd5KEo058zrbGaV6fWuVNS7Zq9TjKtTION4COKTz/AFZ2FIS
         MFzKPYumV9Tu5a/qrrShYJzgfMIBoOZaGk/+SMAA8YYTJAoYC6jZGoBSCnIDRrEBEoQI
         ruxKNBwpirL1m7cnuytyC9Wna5DEWicXoek0R7TLjgKffNCzBo1GimndhnBgQPREvUBR
         ZLV45QuD41endAMZZ1P9rP479xSpWTfEp92j1Hj9nHlhwZNNV08ae4bPYcxG2T5Qyud0
         tUHefC6PmCvO1Ab+iJ+5EqB3qBqkEflZCr1q1pCeBHTYJCbbX8vTGN2qosi4ygNzJSVf
         9nZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=Xwv1riscYUA1xv+c4SKODgsAJHAAtItIv1Ennoa10XQ=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=Ut1fQOrjxtF5rGVBzJxCqYqb/Gin8nVqpBC4o1ArNLKWSk2+IpHovsn/ZPAGv+qzYY
         EGQfm8wU2XVH69KiJa6/DFuTHOZEiYiYnZh/ZquPGIoz7MCKGebzZXePlCeX7Puhr5LF
         r9yppCjTj4CfH6X6fPiLL1z6vyazguAEe1Y8f4oG8sfeWUdvB2ukBa1n5XC8GIU9SKQa
         rn09aRS9B+ZY/S2IymPEr410Ftt4dTfE4osDcB1G9AqqN8FUOWZtT+qR+BII03olzopw
         aKVm+W1grkXeUzJXNQEtXxQlAh3flmkR6FttQcClmQmDfhhYPukWCCm7skZr473MKZzm
         IxmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb2e0ad1ddsi19707736d6.20.2024.09.26.00.46.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2024 00:46:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1stjCD-0001HG-5m; Thu, 26 Sep 2024 03:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1stjC6-0001G5-BC; Thu, 26 Sep 2024 03:45:47 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1stjC4-0006Ef-4G; Thu, 26 Sep 2024 03:45:46 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 26 Sep
 2024 15:45:36 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 26 Sep 2024 15:45:36 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v3 0/6] Support GPIO for AST2700
Date: Thu, 26 Sep 2024 15:45:29 +0800
Message-ID: <20240926074535.1286209-1-jamin_lin@aspeedtech.com>
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
X-TUID: 6levmJXz4KMD

v1: Support GPIO for AST2700
v2: Fix clear incorrect interrupt status and adds reviewer suggestions
v3: remove nested conditionals and adds reviewer suggestions

Jamin Lin (6):
  hw/gpio/aspeed: Fix coding style
  hw/gpio/aspeed: Support to set the different memory size
  hw/gpio/aspeed: Support different memory region ops
  hw/gpio/aspeed: Fix clear incorrect interrupt status for GPIO index
    mode
  hw/gpio/aspeed: Add AST2700 support
  aspeed/soc: Support GPIO for AST2700

 hw/arm/aspeed_ast27x0.c       |  18 +-
 hw/gpio/aspeed_gpio.c         | 427 ++++++++++++++++++++++++++++++++--
 include/hw/gpio/aspeed_gpio.h |   4 +-
 3 files changed, 430 insertions(+), 19 deletions(-)

-- 
2.34.1

