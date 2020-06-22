Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3429891lfm;
        Mon, 22 Jun 2020 11:36:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx23uU5yVwkkQszK3RUrwh+B+zcL65JSVq/iztBoIwLajIPn3+O0demomWQJNWom7cbt3Xf
X-Received: by 2002:a25:e08d:: with SMTP id x135mr29102441ybg.482.1592850973938;
        Mon, 22 Jun 2020 11:36:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592850973; cv=none;
        d=google.com; s=arc-20160816;
        b=pe/cN9CYNhgCyRiZtN/gpIWTFGHXDj/JEL4LyzWoysh/iAhQy9sQDIENsQWuHWKy1N
         XdIKsdteagudt9IEifh/qPO1A4OAfLOPDusAwm3CN1eS4Z4Fc3CaIfBz6AJ6FIxDAZZE
         5Zj8NCmwnmZL5qcJKXYfi8tX2eIvZkJZMahZ7GnmRwK8QNNDoHT4LtrBu7U2Tfv5JH55
         rn0gTYQgpZlpJDJspEICL4ttB1CPa2bu3GZXqiWGUSLf2KfqzUZGhnuBd0zgR1YtRwCo
         8+ZIjwOqQDC3/SBY2GB7k4cgvkEe8kUaH8ZCaGuCFa9PhDMByfffUaX5qEAvmCRhq5s1
         Lctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=WQVzrJo0+uFvQubjyJAfLAob8SKpXhhqZW9uXjPLrsI=;
        b=YK6fbLyadsIa9fRz/NWP2Q9UzHBNQAG9uuoxPtTVcTIsh6D+lp7oItidtWKOAxGt3W
         cSnBGw5dkX35l+NdiY60GQ78ScSjMtEpDqphmUg1zx3tDov7ExzYxw6L9/CQ6JXGpG7K
         DHPD8xeUX6QbJ/hBPw55VFNf7F66k3cac5lMONHhnslaWiweLiIhXyg0MCp6x0u58PrJ
         wwykWA7Q99dIoqt1DDGtuL2EgDyqlZIVg2t5nOvsuvii6JFit6A2h2VzUOSrSU3jEfNe
         WpNDEMurxvw1KkCsizuebt+d3xhtCqsC8Q1b7SGpII8UZO3Zp/12LVuaBglbLpuJ2vGU
         mbqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Dg19kbUH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5si15471106ybi.459.2020.06.22.11.36.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 11:36:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Dg19kbUH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:39546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnRIj-00074q-7k
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 14:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jnRH9-0005It-94; Mon, 22 Jun 2020 14:34:35 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:38582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jnRH7-00080Z-Gu; Mon, 22 Jun 2020 14:34:34 -0400
Received: by mail-wm1-x344.google.com with SMTP id f18so539718wml.3;
 Mon, 22 Jun 2020 11:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WQVzrJo0+uFvQubjyJAfLAob8SKpXhhqZW9uXjPLrsI=;
 b=Dg19kbUHxMYzqYNmJs2uygUQc9xRCVbNlPrPKyxryL5XrIK1dj1P/IWqD5Vtct1ved
 85pI7y0gx0sh4WpDDbd4EN8DklkErmmqjmpY/ZvV+EJx9ud31gsksMRnUurj7KVpyeiI
 bx2owmtLyXiR8SCMDa5utgxH9E90OJCeZ1vkVQoXvhKvy0eHtvqHAn+3vklMC94e71zn
 DZ9kAvnatqH5Zxzj20ujxEJYp4rZqmCmrXf1GBCfD2TlpmVb5OTEUTzWww/PPXSD3O03
 hyDEOV6eKkKOQO2TljVfXwdGUqkgVZu1beOOwoI6FkWXiHbl/7zuV8BxQ5Hr4rmBVqwP
 KX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=WQVzrJo0+uFvQubjyJAfLAob8SKpXhhqZW9uXjPLrsI=;
 b=ocjh5WSr5tGNZtS4xpKZXzwaAs8Hy7EK9LygxT6I1uJ7VoxTxb91VU/6Ul/GEvzFQp
 OxVp+Q/VH8EckNr/uyNuQw3Ads3i8GhOx4///PMaO8KihvShdaAZgoX9NmJHfLkqJqjC
 70Dd4oSvWik76IU1KaW5Qb06ENmEPKBnUdxCyCKnpvUhIAekCN3cC+e4M8es7kiLez2o
 1Wg5MsmAMDel2fuZHb6H2XvXNQO0FJ/wbSYWgTUkFxk7Pi2UoO88IEWpIxn7J2RrLz2h
 tECxEcGT2lUqajaDM7k8uGbfqhs8XcRd5tRVy7X9OdJwY0oP8uYo/R3rQP4niVrnRL4Q
 VNxg==
X-Gm-Message-State: AOAM531d+u1ebdZ1EqH/convc3PS2W9ejCZEn1TU32eAhnZabJmpMRPV
 P0IHgnfX3NDpJFLxB0cQN1wuQWXd
X-Received: by 2002:a7b:c186:: with SMTP id y6mr20795169wmi.82.1592850870763; 
 Mon, 22 Jun 2020 11:34:30 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id h29sm20286161wrc.78.2020.06.22.11.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 11:34:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/9] hw/misc/pca9552: Trace GPIO change events
Date: Mon, 22 Jun 2020 20:34:19 +0200
Message-Id: <20200622183428.12255-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z2XTIJK0IcOS

This series add trace events to better display GPIO changes.
We'll continue in the following series by connecting LEDs to
these GPIOs.

This helps me to work on a generic LED device, see:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg711917.html

Since v4: Addressed Cédric review comments
- Extract PCA955xClass
- Add/use pca955x_pins_get_status() method instead of keeping
  cached value in PCA955xState

Example when booting an obmc-phosphor-image, we can see the LED #14
(front-power LED) starting to blink.

- ASCII LED bar view:

  $ qemu-system-arm -M witherspoon-bmc -trace pca955x_gpio_status
  1592689902.327837:pca955x_gpio_status pca-unspecified GPIOs 0-15 [*...............]
  1592689902.329934:pca955x_gpio_status pca-unspecified GPIOs 0-15 [**..............]
  1592689902.330717:pca955x_gpio_status pca-unspecified GPIOs 0-15 [***.............]
  1592689902.331431:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****............]
  1592689902.332163:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........*..]
  1592689902.332888:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........**.]
  1592689902.333629:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........***]
  1592690032.793289:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........*.*]
  1592690033.303163:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........***]
  1592690033.812962:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........*.*]
  1592690034.323234:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........***]
  1592690034.832922:pca955x_gpio_status pca-unspecified GPIOs 0-15 [****.........*.*]

- Only display GPIOs which status changes:

  $ qemu-system-arm -M witherspoon-bmc -trace pca955x_gpio_change
  1592690552.687372:pca955x_gpio_change pca1 GPIO id:0 status: 0 -> 1
  1592690552.690169:pca955x_gpio_change pca1 GPIO id:1 status: 0 -> 1
  1592690552.691673:pca955x_gpio_change pca1 GPIO id:2 status: 0 -> 1
  1592690552.696886:pca955x_gpio_change pca1 GPIO id:3 status: 0 -> 1
  1592690552.698614:pca955x_gpio_change pca1 GPIO id:13 status: 0 -> 1
  1592690552.699833:pca955x_gpio_change pca1 GPIO id:14 status: 0 -> 1
  1592690552.700842:pca955x_gpio_change pca1 GPIO id:15 status: 0 -> 1
  1592690683.841921:pca955x_gpio_change pca1 GPIO id:14 status: 1 -> 0
  1592690683.861660:pca955x_gpio_change pca1 GPIO id:14 status: 0 -> 1
  1592690684.371460:pca955x_gpio_change pca1 GPIO id:14 status: 1 -> 0
  1592690684.882115:pca955x_gpio_change pca1 GPIO id:14 status: 0 -> 1
  1592690685.391411:pca955x_gpio_change pca1 GPIO id:14 status: 1 -> 0
  1592690685.901391:pca955x_gpio_change pca1 GPIO id:14 status: 0 -> 1

For information about how to test the obmc-phosphor-image, see:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg712911.html

$ git backport-diff -u v4
Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/9:[----] [--] 'hw/i2c/core: Add i2c_try_create_slave() and i2c_realize_and_unref()'
002/9:[down] 'hw/misc/pca9552: Rename 'nr_leds' as 'pin_count''
003/9:[down] 'hw/misc/pca9552: Rename generic code as pca955x'
004/9:[down] 'hw/misc/pca9552: Add generic PCA955xClass, parent of TYPE_PCA9552'
005/9:[0007] [FC] 'hw/misc/pca9552: Add a 'description' property for debugging purpose'
006/9:[0031] [FC] 'hw/misc/pca9552: Trace GPIO High/Low events'
007/9:[----] [--] 'hw/arm/aspeed: Describe each PCA9552 device'
008/9:[0008] [FC] 'hw/misc/pca9552: Trace GPIO change events'
009/9:[0005] [FC] 'hw/misc/pca9552: Model qdev output GPIOs'

Based-on: <20200620162818.22340-1-f4bug@amsat.org>

Philippe Mathieu-Daudé (9):
  hw/i2c/core: Add i2c_try_create_slave() and i2c_realize_and_unref()
  hw/misc/pca9552: Rename 'nr_leds' as 'pin_count'
  hw/misc/pca9552: Rename generic code as pca955x
  hw/misc/pca9552: Add generic PCA955xClass, parent of TYPE_PCA9552
  hw/misc/pca9552: Add a 'description' property for debugging purpose
  hw/misc/pca9552: Trace GPIO High/Low events
  hw/arm/aspeed: Describe each PCA9552 device
  hw/misc/pca9552: Trace GPIO change events
  hw/misc/pca9552: Model qdev output GPIOs

 include/hw/i2c/i2c.h      |   2 +
 include/hw/misc/pca9552.h |  16 +--
 hw/arm/aspeed.c           |  13 ++-
 hw/i2c/core.c             |  18 +++-
 hw/misc/pca9552.c         | 216 ++++++++++++++++++++++++++++----------
 hw/misc/trace-events      |   4 +
 6 files changed, 202 insertions(+), 67 deletions(-)

-- 
2.21.3

