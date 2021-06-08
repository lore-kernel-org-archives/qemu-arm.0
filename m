Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4571648lfa;
        Tue, 8 Jun 2021 09:12:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy85IQxc99w1u0uyAChIH8FNmUoo0Z6faTHVK53uZagUMxO/pcqS848PS8uq0gpLentSHD6
X-Received: by 2002:a05:651c:11c7:: with SMTP id z7mr3075632ljo.170.1623168756243;
        Tue, 08 Jun 2021 09:12:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623168756; cv=none;
        d=google.com; s=arc-20160816;
        b=fJhhNedHHRc8jBND5zPNQXR8Us6dSN4eZwWFWQ8hQQ3GCh5LLDsSN9yHHLa4G8y1Cj
         1qSkp0LfusMJ+BNV1g+1GDNtRP+7gLS23Ed+SyEj2aaJL8EHYXlxQEHlB+oA9jlq4YHm
         zLJjv2gpjx83bNxmspw/KzwKxJmOnV5amP/A8t9lLLPr0dnXMWlMujpNJlf2C4GtXjax
         sq/VB2xl2clE6cw/TOIO/LIxXdcxMT7hthH+gjTFkQ9v8QTKBH0XUPo5DpDnV6Uklft6
         c4VB9l9+LrhHtyXCn1QBOABFO+CfUFYqu0hx3J7C7ui1eAP5ay8l1RSEyZvWgXrcfnBp
         u+Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=dOqxhsjlaVDVynNVXP8abi0NtG4+aRwJ9z0V9Un97rU=;
        b=S0MWDi571MCWegkpJL+RmwXV3en9gn/Xl3+olttilMXBCHb3tvCvspHEAO4oR3Pfjr
         lrBqcp1ofIhG+d80PVUxaYzS18URVxEKMlKaYqSTQE2EoeG4J9j8fBVamkcFmJsoymkw
         AsyV2JuQ6nkadmEmwj9uCVWalk7qjsWvoLWMaeCaRDQ0s+wSuSOho/WxStjoHhnwma/9
         9baVcw/T45UFJ+pZIGGQH5aF2/HyvH7Fy9700K0OcXtkTtH2w6kkwayTaPNLZtYzAlFy
         6Dz0jvszdaN3Q6ooZpseWjJJtQcOcL9mQ0I4g1hAikypUJdx/J+yS7fr3yKZfwjY/XLL
         MYOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14si198935ljj.297.2021.06.08.09.12.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 09:12:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=crans.org
Received: from localhost ([::1]:57664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqeLD-0005Sv-6B
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 12:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1lqeJr-0003Ps-Go; Tue, 08 Jun 2021 12:11:11 -0400
Received: from zamok.crans.org ([2a0c:700:2:0:ec4:7aff:fe59:a1ad]:40954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1lqeJn-0004Rs-4P; Tue, 08 Jun 2021 12:11:11 -0400
Received: by zamok.crans.org (Postfix, from userid 11692)
 id 4CF00E0124; Tue,  8 Jun 2021 18:10:54 +0200 (CEST)
From: Alexandre Iooss <erdnaxe@crans.org>
To: qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH 0/2] STM32VLDISCOVERY Machine Model
Date: Tue,  8 Jun 2021 18:10:26 +0200
Message-Id: <20210608161028.4159582-1-erdnaxe@crans.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a0c:700:2:0:ec4:7aff:fe59:a1ad;
 envelope-from=erdnaxe@crans.org; helo=zamok.crans.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 "open list:STM32F100" <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: glWN/7HmUFSl

This patch series adds the STM32VLDISCOVERY Machine to QEMU

Information on the board is available at:
https://www.st.com/en/evaluation-tools/stm32vldiscovery.html

Alexandre Iooss (2):
  stm32f100: Add the stm32f100 SoC
  stm32vldiscovery: Add the STM32VLDISCOVERY Machine

 MAINTAINERS                             |  12 ++
 default-configs/devices/arm-softmmu.mak |   1 +
 hw/arm/Kconfig                          |  10 ++
 hw/arm/meson.build                      |   2 +
 hw/arm/stm32f100_soc.c                  | 182 ++++++++++++++++++++++++
 hw/arm/stm32vldiscovery.c               |  66 +++++++++
 include/hw/arm/stm32f100_soc.h          |  58 ++++++++
 7 files changed, 331 insertions(+)
 create mode 100644 hw/arm/stm32f100_soc.c
 create mode 100644 hw/arm/stm32vldiscovery.c
 create mode 100644 include/hw/arm/stm32f100_soc.h

-- 
2.25.1

