Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4989218lfp;
        Mon, 17 Feb 2020 03:47:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqyNtanOF29N/losSHsOe5dcIlccAzQp4DPxNIyU+6azwt1U4fV0hlr+R7T9EL9vPKd5quj3
X-Received: by 2002:a37:4e94:: with SMTP id c142mr12484102qkb.13.1581940039444;
        Mon, 17 Feb 2020 03:47:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581940039; cv=none;
        d=google.com; s=arc-20160816;
        b=B4034VsMvG0is0mRiQF3I/pvK1lSYIvAj7RoBkPHOHQtD2z92wIsMmAQS8WoL5iZf9
         PNo0OnIqbwANOJ0ez6bx/YU3L+XG1vMY/C6WF9R2aRNZvC7k8bYU32J4pZsmuKLk0iqi
         Jw5hK9NkxHv6d8sF3M8NEy6YnXn3ZRYy0/QLMHj9oJATpbigrRXYWC6ZtaNSUBbC7EDW
         E1VAl4aF9ON6kTfXgFTyXEjj4Q/oCZC3W+5mMtZgC/R+vSpUwTarmXB8ayUPwZsyLcb6
         HQHckzxRnUBvMSJPpjNpKOa+7RCUarul9ilkd1Nu+sLZ+I9iB0cJWlc/G6TJnled6zWL
         BeBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=OKKON3O0UkDeBGXdhe/eMG38enuW1oN2XE70v4ZaC5c=;
        b=uFiroCrHdlBg5m0G845IHCbPDldgGp5F7ghbAO+p6xEvqbdsyZnGYJ1JJYyWb4zcN+
         InvF/aPWCKpLMg8kml103BycJ04GCnkG4+aTUZemeQJ1Uk/DRHcsXZCkEI0kWFoBHi49
         tvps6j9KaoMjnnkM/LDtGzmA8VLxjLDWSuwrzOFofn+wmKLQrgJZhoAhHc8lSJGKJYXv
         +VqKMob63rpnhzZ3MeZq4XyHVBP1MunBMH4AcFI3CnJoCXWikKyTCBpwv83HvKWjpLIu
         Ur+UrBOMH/VgkNPIHuPWYNqz0lLZ7b6EEYcWb9ccTiQaitQvSNLH0rZDroBorAOMgFmC
         XWFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pIgkCyxK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c76si179258qkb.176.2020.02.17.03.47.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 03:47:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pIgkCyxK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3eru-0008Cv-O3
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 06:47:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40545)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqI-0006Pq-Gk
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 06:45:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqH-0002IJ-FO
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 06:45:38 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41983)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqH-0002Hc-9E; Mon, 17 Feb 2020 06:45:37 -0500
Received: by mail-wr1-x42f.google.com with SMTP id c9so19351269wrw.8;
 Mon, 17 Feb 2020 03:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OKKON3O0UkDeBGXdhe/eMG38enuW1oN2XE70v4ZaC5c=;
 b=pIgkCyxKcIOZYxi7YzrAu60SEKzKBROAMl1AZkI8RExOI1AfJb7Oyh2/iAUxS09PQN
 oJcGTpPxpIcYSGoVK0MIq6czedW5D8CyQ4L1zZLaS3TbhQ7kaUqC+vkZRcJ9U1hMOxqk
 yXbCzMul3cSf8rgxDyD12tQbq4dedIpGNi6pHxDStDLto8EfgDBE6Qbjz12Wd7j0IK9P
 w9SGdhKySoXgSDHZ597c1qS2b4+mVOEO74CoAF6mHLoqJ/LDKvcYEfaLdm0rCP8avGGX
 qw/vn2VGQM0ZQEZsjSsMXo0zHeXod5rr9IZn1jliNdHIVGTSmneOzwzr1ijwOdzxvsJI
 u8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=OKKON3O0UkDeBGXdhe/eMG38enuW1oN2XE70v4ZaC5c=;
 b=KmR79k1Yq0iymixHBYn2bjez8aimnBqQnZo8BuCvnIYQQP+J5Xl+AN8ey9BircZ+xQ
 TXlHi+OX/vXyuD1vCjvVakvbqq7q2Yy4UxSeMzkvYwZIKWFmataak8r+6EXiJ571IvGA
 De2nSr31DaW3cG+4sMeaBtBp0rU8yow6Bsm84KVJpBOs9c1xWefIbqjipEvBAhlJ77yn
 ruCFXnHgnahwO645AW7fe/a05vnjkoO8e38+puw2C71yuYFAWJ/V/mhWdkbvktKS8FGV
 zB8BS0O1FZvhn4A2K0Yvb1Ij+QR0uESB5F2Z3gqqrie7i/XyMGotT3ZletiHnin76PgI
 Lnhw==
X-Gm-Message-State: APjAAAUsFrpBQD0yMnPnNgablFTCizw1G/OmfNPZ4t3BZCXsovQZotRv
 BX8N+SKLrZez45l1e+1I28x2NSRM+sM=
X-Received: by 2002:adf:e6cb:: with SMTP id y11mr21883714wrm.59.1581939935803; 
 Mon, 17 Feb 2020 03:45:35 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id i2sm268149wmb.28.2020.02.17.03.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 03:45:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/13] hw/arm: Add raspi0 and raspi1 machines
Date: Mon, 17 Feb 2020 12:45:20 +0100
Message-Id: <20200217114533.17779-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42f
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SNAaltvvOTUV

This series addresses suggestions from Igor and Peter on the
raspi machines, then add the raspi0 and raspi1.

Since v1:
- Use more specific machine names

Philippe Mathieu-Daudé (13):
  hw/arm/raspi: Remove ignore_memory_transaction_failures on the raspi2
  hw/arm/raspi: Avoid using TypeInfo::class_data pointer
  hw/arm/raspi: Use more specific machine names
  hw/arm/raspi: Introduce RaspiProcessorId enum
  hw/arm/raspi: Remove use of the 'version' value in the board code
  hw/arm/bcm2836: Restrict BCM283XClass declaration to C source
  hw/arm/bcm2836: QOM'ify more by adding class_init() to each SoC type
  hw/arm/bcm2836: Introduce BCM283XClass::core_count
  hw/arm/bcm2836: Only provide "enabled-cpus" property to multicore SoCs
  hw/arm/bcm2836: Split out common realize() code
  hw/arm/bcm2836: Introduce the BCM2835 SoC
  hw/arm/raspi: Add the Raspberry Pi B+ machine
  hw/arm/raspi: Add the Raspberry Pi Zero machine

 include/hw/arm/bcm2836.h |  13 +--
 hw/arm/bcm2836.c         | 192 ++++++++++++++++++++++++++-------------
 hw/arm/raspi.c           | 153 +++++++++++++++++++------------
 3 files changed, 226 insertions(+), 132 deletions(-)

-- 
2.21.1

