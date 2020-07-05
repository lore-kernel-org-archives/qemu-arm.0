Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4389157lfm;
        Sun, 5 Jul 2020 15:42:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNQemiBfIKP7Ber0obGtrAlJOSCvX5iEedbEZeD/J5M/3jXlk/1eCwQs0xo6FzGS18OBmE
X-Received: by 2002:a25:3a87:: with SMTP id h129mr63762499yba.232.1593988932797;
        Sun, 05 Jul 2020 15:42:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593988932; cv=none;
        d=google.com; s=arc-20160816;
        b=HgYVKBs5PoVlXq+7dEn7w4DXMs0mIvafua8hR2WO/AFH1pEA4cBT7gtKnx9O1rEdBR
         meCH9K8BvcSUhR/kyQ76asJuhjEeSQLn4/Vm/T/f9+WEoK7JneUlZQz4NpErO9C7R08W
         gJiB3iTbgS/3SZyHMDmGtrQP80Xhz0ZDXDyntZnpvuzsW2EK/G3sUy4VpyYciQwEdVxq
         iZzheulRdiWSo2+unQp8Ukp703OT6mgk9uLAQbMALJl96MLtql3i8Yn49CraU5XxPiKr
         XgECD1oVM6Z89r59vd/NUkA0YyTbdWrhI/8Mj6TuWvB2B5tY3V5FTdhxeJk4nyHwWMzn
         NUmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ehwRSFQGbul2713ne007jhYfeW7ho7isnAn84wqa/OM=;
        b=eeEHHgWf8/np5kvUAR6+teehafkjTMo5ocVcm3iXLTOnCMRaECsalrg/oK1v7TA7mN
         LekTlR8H6X/zx4omO/e+XbttAs7c145tZBhw7hmU+mWT7IBYTTfI5kAO9oRYju9LNz0q
         xPo9aNK6zXdp+nmT8AzPt3xWgXnl+C2mCk/6MLExlOj+JljfEZZvnErqfAOExOSkVSEU
         G0h31/CTLz3U86+KRg2WQbEY1O8THlwsf7ZejwRrfhGOcEo/xPV+LEDV9LWh0ckL7Gcc
         xbmUmIdfSN09advfEUCey6sG6yCUUh4oVtS234EPxEzAvKA204Gn1toGyweaVfA02V/F
         y4nA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CORyJxFU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 130si17835807yba.347.2020.07.05.15.42.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jul 2020 15:42:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CORyJxFU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:40208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsDKu-0004HR-30
	for alex.bennee@linaro.org; Sun, 05 Jul 2020 18:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsDKj-0004Fh-Ur; Sun, 05 Jul 2020 18:42:02 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:34248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jsDKi-0002gW-1a; Sun, 05 Jul 2020 18:42:01 -0400
Received: by mail-wr1-x441.google.com with SMTP id f7so35933348wrw.1;
 Sun, 05 Jul 2020 15:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ehwRSFQGbul2713ne007jhYfeW7ho7isnAn84wqa/OM=;
 b=CORyJxFU70lpQxXAXsTOsr3Kt/xvnQr1cKeRAdlE5BSh2LQw5mgcStbCEIgnI3dsg7
 9HDe0+KH4Vc+cVbwCfjt6BXR3IHSthoe05+2YV8F53vWLxhDsyz0wUxgamE0sD9f+eyR
 pZkjbClj79etwCzM9KAQFP+xqKP+LgoSu+Pe34ECWsl2MwEQbmDCdeY/z5TitY+RKDRS
 5adXnntAENT/FjlsMrsuu4nZil71cygGTTtZ8GMbGF6YmyGDswDaFuDPPUHEDXWYNFxJ
 Mc8VGDRluNZ8rRMl2gHqvYXMEiDT3LXZY9RVwkhxNAg8tQuodXJS69jEnmb4e+OXK4rS
 q0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ehwRSFQGbul2713ne007jhYfeW7ho7isnAn84wqa/OM=;
 b=FnRoJ6T4Z5YbCqtTSMQ7tlIhAjMFQPIdYCh4rSLmnvgOxxDeXBmgLfzyqcBMF0Zc8p
 bvFGSVV1q/OeStClaGuDWM/Z2Y3rPjkw9oxi+ulwteH1s1qlsW+xs3+Xc2VDtfKd9k5/
 yL6IjtimGnsZNE7JUm7WdgNubJdSnFmPxkQU4nXpnjajcNeQy/cgBM55+xhUD4LIVXia
 lTO1Xd4aAIfSgp1w4xfxZDGAncvYl9NyHHgNpyoMQtSMGXGGLueHfmrD9OU/b+MgUyn/
 iYzT1mP2KPlNxdZtF0DA4l44SeSPlTNND/qNKDoBhagGHIYIPcuZF62Grn85vcsSgQdA
 /sTQ==
X-Gm-Message-State: AOAM530udnIxc5CdMXqbUPSPkpbCjvtH9ec7zPtJRtJH6TbViCcIXdeZ
 +LHY+yckoxKOwvG1Y9MXL3IowCXMY9c=
X-Received: by 2002:adf:f546:: with SMTP id j6mr45390722wrp.167.1593988917445; 
 Sun, 05 Jul 2020 15:41:57 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id v6sm9151467wrr.85.2020.07.05.15.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 15:41:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] hw/i2c: Rename method names for consistency and add
 documentation
Date: Mon,  6 Jul 2020 00:41:49 +0200
Message-Id: <20200705224154.16917-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Jan Kiszka <jan.kiszka@web.de>, David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UgYNwhTO5y1E

In commit d88c42ff2c we added 2 methods: i2c_try_create_slave()
and i2c_realize_and_unref().
Markus noted their name could be improved for consistency [1],
and Peter reported the lack of documentation [2]. Fix that now.

Since v1:
- Addressed Markus review comments
- Added Markus/Corey R-b tags

[1] https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg07060.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg08997.html

$ git backport-diff -u -v1
Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/5:[----] [--] 'hw/i2c/aspeed_i2c: Simplify aspeed_i2c_get_bus()'
002/5:[0006] [FC] 'hw/i2c: Rename i2c_try_create_slave() as i2c_slave_new()'
003/5:[0004] [FC] 'hw/i2c: Rename i2c_realize_and_unref() as i2c_slave_realize_and_unref()'
004/5:[0006] [FC] 'hw/i2c: Rename i2c_create_slave() as i2c_slave_create_simple()'
005/5:[0012] [FC] 'hw/i2c: Document the I2C qdev helpers'

Philippe Mathieu-Daudé (5):
  hw/i2c/aspeed_i2c: Simplify aspeed_i2c_get_bus()
  hw/i2c: Rename i2c_try_create_slave() as i2c_slave_new()
  hw/i2c: Rename i2c_realize_and_unref() as
    i2c_slave_realize_and_unref()
  hw/i2c: Rename i2c_create_slave() as i2c_slave_create_simple()
  hw/i2c: Document the I2C qdev helpers

 include/hw/i2c/aspeed_i2c.h |  2 +-
 include/hw/i2c/i2c.h        | 54 ++++++++++++++++++++++--
 hw/arm/aspeed.c             | 82 +++++++++++++++++++------------------
 hw/arm/musicpal.c           |  4 +-
 hw/arm/nseries.c            |  8 ++--
 hw/arm/pxa2xx.c             |  5 ++-
 hw/arm/realview.c           |  2 +-
 hw/arm/spitz.c              |  4 +-
 hw/arm/stellaris.c          |  2 +-
 hw/arm/tosa.c               |  2 +-
 hw/arm/versatilepb.c        |  2 +-
 hw/arm/vexpress.c           |  2 +-
 hw/arm/z2.c                 |  4 +-
 hw/display/sii9022.c        |  2 +-
 hw/i2c/aspeed_i2c.c         |  3 +-
 hw/i2c/core.c               | 15 ++++---
 hw/ppc/e500.c               |  2 +-
 hw/ppc/sam460ex.c           |  2 +-
 18 files changed, 123 insertions(+), 74 deletions(-)

-- 
2.21.3

