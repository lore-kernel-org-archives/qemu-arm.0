Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp111518lfg;
        Wed, 24 Mar 2021 00:10:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAQaD3s74b2ow396+lXWKrZGsQPR6kzDo3lABRoLQdPNHClrmTGVDe1DywEf+gHqiYLkZW
X-Received: by 2002:a25:6610:: with SMTP id a16mr2565535ybc.339.1616569856592;
        Wed, 24 Mar 2021 00:10:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616569856; cv=none;
        d=google.com; s=arc-20160816;
        b=FmE1cjhOQnnBuknoIs7A/qgNmCu8UvtnVv4rjX0v8hse1+eKGVtwfL/mihEyLh3rTy
         H47poaBgfHiHIraYYhh+l3iyW3QNIMqi1/qJ/HiabQqRYl2F02p93MGugGBORR02eMMm
         TgNq0nfka+uqlDUmXxvf0cWXNlutnI9ab7actvPtDzfidBKklC8ihb+8Tg5qsU3olOzM
         6hRrnwniUwanKV3c4wTEzmupOTVnrah8Kv1nL8GiML7O8n4TqpgVJk2WEgxrdoiJ/PjF
         5fM1LQ/PxkyL39oFLlfRsdmqRYWipUdiVAyIPkEtWcivQJhMneVEvmP9eA49FyBEGmu1
         a7Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=3/o7dxIJvo+wY+R5e6q/EE3dKUI5sEW9NHgjAowAggU=;
        b=JhjPLw44HYaArUy2AQ4eS/aqtUDYgem7nC/AWID3LHA2pbwnlt4+Il/bCwKO0fkF20
         g0khx6eKDzp3evrxUpWM/I3TDm2npDLb8onoBOdVUe1pW+m7VxqanB6QebkQd/sEAQyu
         WwJUduc61rATiyTi7g14an+6U8bcNQ0IFnp4pTV6ehhZx5WYUsRBuvOTvOrvkeK8JKmX
         5WTd9vJZi4oCmQ40ziR+8dP69SWpVhBGRmiTwFYgeAvDx+1Api5Q+P8GflaWsIBmt7Sg
         8GLblyueGWc6O2ldZOcvhL+tdfgfOZjcd3jzZplGbop4BJkQFQzW8KqMa7wO5SxaUbj4
         H5dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Sqzsam3i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16si1488975ybc.168.2021.03.24.00.10.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Mar 2021 00:10:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Sqzsam3i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lOxfL-0002I2-Rs
	for alex.bennee@linaro.org; Wed, 24 Mar 2021 03:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lOxei-0002Hr-NO; Wed, 24 Mar 2021 03:10:16 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:42598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lOxeg-0008MG-M3; Wed, 24 Mar 2021 03:10:16 -0400
Received: by mail-pl1-x630.google.com with SMTP id v23so7425853ple.9;
 Wed, 24 Mar 2021 00:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3/o7dxIJvo+wY+R5e6q/EE3dKUI5sEW9NHgjAowAggU=;
 b=Sqzsam3iQNhxwjdlssfCWuNkuPf2hSnt1XEY4HslD7U0eTUvCjbVXueCN2DMAa//l/
 XyZGxCMTyVoMWZaN0Y1zK5UonRpJkPQcnumMK6FW/tjoQA0gxVgnGTy9SrcqsBbF6dbd
 vhYTs6VW6Mfelm7xMB3+2CR8Zs+IXqUnERcxx/+6AIobl0cHGUI7qZIoYcAr2iDh27JZ
 NIQMS34CLc3Dkh2w0QfFsrshb+13RzlctZqoyQldkjQPmEVeaaJDM2GqbumQNGCOXOZK
 W2PSSV7aGKRoeedi3Cb1cYO1PMPT9RmwJCrb9Ah+dW1r+EIW/8yy/t8DtFF36lsj2+qB
 RCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=3/o7dxIJvo+wY+R5e6q/EE3dKUI5sEW9NHgjAowAggU=;
 b=QSMS2APhMDab82Lnu7V7Fc5e+xFpgBtbrkA1jmEBOXBrmfwHCSg/aCXbofb/HDuL+Y
 LZPWxfSJIVZ09c66Fv1EPJfD3A107ZTOEnyra8y1ABKYC8wKfAnT/DacQy117OB30T/B
 105aZ5vLVAnEgYDaABtrPm7/jR2azomNCcHfWvQKd3B/ZBRT2Xjt36Xf0yvBvgLfGGGP
 DUtvIDw8Cv5kzgBu2S7M6JojbIAO4gq4ln9qbuRHvvjuElJz3xU3183z/F4Ke19pHK7J
 G3PiqP3QWjbZ9ERHW3lGPd0ZrmHJFBa6BmA/6h+REPD8F+PAi6sORzAnKcSFylb3i/bi
 zEsA==
X-Gm-Message-State: AOAM533E7mkOTuts+6zAgHEslSb9nwRxGT2+a1v6b1yXrfuee6pEG+uv
 zSYjTSMZmQIHx7ABp9yfuH0=
X-Received: by 2002:a17:90a:f0d4:: with SMTP id
 fa20mr2011528pjb.220.1616569811746; 
 Wed, 24 Mar 2021 00:10:11 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id y22sm1297116pfn.32.2021.03.24.00.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 00:10:10 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v4 0/3] hw/misc: Model ASPEED hash and crypto engine
Date: Wed, 24 Mar 2021 17:39:52 +1030
Message-Id: <20210324070955.125941-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4lPgO8ZKLZWI

v4: Rebase on Philippe's memory region cleanup series [1]
    Address feedback from Cédric
    Rework qtest to run on ast2400, ast2500 and ast2600
v3: Rework qtest to not use libqtest-single.h, rebase to avoid LPC
conflicts.
v2: Address review from Andrew and Philippe. Adds a qtest.

[1] https://lore.kernel.org/qemu-devel/20210312182851.1922972-1-f4bug@amsat.org/

This adds a model for the ASPEED hash and crypto engine (HACE) found on
all supported ASPEED SoCs.

The model uses Qemu's gcrypto API to perform the SHA and MD5 hashing
directly in the machine's emulated memory space, which I found a neat
use of Qemu's features.

It has been tested using u-boot and from Linux userspace, and adds a
qtest for the model running as part of the ast2600-evb, ast2500-evb and
palmetto-bmc (to test ast2400) machines.

Note that the tests will fail without Philippe's series.

Joel Stanley (3):
  hw: Model ASPEED's Hash and Crypto Engine
  aspeed: Integrate HACE
  tests/qtest: Add test for Aspeed HACE

 docs/system/arm/aspeed.rst     |   2 +-
 include/hw/arm/aspeed_soc.h    |   3 +
 include/hw/misc/aspeed_hace.h  |  43 ++++
 hw/arm/aspeed_ast2600.c        |  15 ++
 hw/arm/aspeed_soc.c            |  16 ++
 hw/misc/aspeed_hace.c          | 358 +++++++++++++++++++++++++++++++++
 tests/qtest/aspeed_hace-test.c | 313 ++++++++++++++++++++++++++++
 MAINTAINERS                    |   1 +
 hw/misc/meson.build            |   1 +
 tests/qtest/meson.build        |   3 +
 10 files changed, 754 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/misc/aspeed_hace.h
 create mode 100644 hw/misc/aspeed_hace.c
 create mode 100644 tests/qtest/aspeed_hace-test.c

-- 
2.30.2

