Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp4075077lfq;
        Wed, 20 Jan 2021 01:29:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBnjAEu/1NQeH0kr6JcRL1VltAbu6ac+AkJB2yyT76iPyjNnFsu6tmkGTW6c4LC5Ro2OHd
X-Received: by 2002:a25:f30e:: with SMTP id c14mr11058139ybs.251.1611134999626;
        Wed, 20 Jan 2021 01:29:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611134999; cv=none;
        d=google.com; s=arc-20160816;
        b=ZV8TcdjeoxiRBRTeamYzLq1sNUUoz0TEOlF0yvGdWojaYbkj3vUcT9gTFf2cckGQcr
         YkLYCNLZAbf7OZMtNB1F0tnECVtCDEgCVgtErZM1zwcukupMIk9Dej4Aazv/oVoavpyx
         W3yAtJ2CBhZJuZPNgXsKcBNVzT6yaMDG75MgZjq8SXlZIy7a6LrcU7FQFUZPumIwoqwb
         z8hVbXapPXvNqbHXSiihVSG49D490mJyQZZY/UUODquKin09F9qon53zfjpSSX6fS0A4
         ZIx6GwsR9dJw/CTrlR4pV9Rzal/RB3CdKN8q31Arq1jhV34PaZ7eEizBxNA8H7WnGmaf
         UYbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=EBGOBlbBtO/dbxctd0HuQeQZa7qOrzfcGEX+G2MkXNo=;
        b=zAc6uvyKYWti9KvW4CvOdNpq7HaouXVJAiI7dZRgOe/tK5tpIRpDksaPx6b6q0LqZs
         6wgm+UEzznyXVK+Y90Xkmkev7pHKF5HJoeV4G/YWsXg8+zA8uw/GcxDCGs4KyKReTrQP
         UsG6Q5Qv/CC3FIJQ6sszd4Fyz3wNTouiJ32XYF+nHDgCM6igVYdC4YbgL2ce5QSvC67G
         FJzHYP9Ms9xSdIG6ZLLzpyuw9xux5l42fFEMHKBPtNXrnD11M2pHKN8N3hjOrmfr0hIX
         sBepd3MPCzUZu2Luq33eZXLbu8RuVsxhL9L1Zox8gYHt4dJh6m6rQYZgW8VkyjP0JpWn
         /tlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JN46kY24;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d34si1504650ybi.135.2021.01.20.01.29.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jan 2021 01:29:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JN46kY24;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l29oN-0002AR-0l
	for alex.bennee@linaro.org; Wed, 20 Jan 2021 04:29:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l29mQ-0000rm-MW
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:27:58 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:39326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l29mO-00055L-R8
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:27:58 -0500
Received: by mail-lf1-x134.google.com with SMTP id h7so3958049lfc.6
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 01:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EBGOBlbBtO/dbxctd0HuQeQZa7qOrzfcGEX+G2MkXNo=;
 b=JN46kY24Ces71pTPLAp1wdyWGh9w4KVU6hBL2wZKDb2rcSyYMP97Psd9SZW22gHsok
 zlz2bLf174D4EoeNg/61lAVTTf0I6f/bj+r3pevvWLS9pBguyy52BJOVq6MBqVltapUL
 Qe4H3z8UJ38ZfT6m2KQZKZOr6uWsJGXRSh4HRB/H1K8BmEUCZKxVXRkyrsRj3cO/Pynb
 tgVSWjoFYJST2/adXJeNMdbzUtKGtT8xdlHtQ2IP2Hzul0ljnpW2PihqLJU7182yOvik
 7sQapikhfmBQtAs77FcztcElaLRu7QdzCQAf4m6K+yTX6bNX9Ouy7+L5fDIdlLFcyoB/
 j8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EBGOBlbBtO/dbxctd0HuQeQZa7qOrzfcGEX+G2MkXNo=;
 b=G/eak9JbuTaI+IYRbQ7YHC22ss16eogTH4ZDZrm/cUPkDAN4XbAlDghGr/0aLycbkr
 dxrH9D0rLpf7hy9AOenvy3hxiIPX5JjaGGD8lZVoOAgq25r1xJj8xGKlXrphwJdJUMzZ
 HGaMprS5Bi2fRc5bcTCQECmA337iFL1a5OsrovDzW4itNP5QypTUhejJRp2RdGHwIu6d
 P/52q+UcnT+P04ocndZPajsErp5CFgLVbWa9D4E0S3iTt5j+a7a3tMU22GCz9nIxFtgI
 EoVIIhUotUvVq5CDG/yojqf0eVLfj6JpV6xOSirvIOwry2wsA07aEio7NlTdBbIxA3ix
 8IYw==
X-Gm-Message-State: AOAM533K5r92hWx9DSfBqICRW4r8/eVLMWi8rx+RLz4IY6ESRJ7GT3cL
 8cjf3J03JPzGbMJPWsBtQcP3rQ==
X-Received: by 2002:ac2:5145:: with SMTP id q5mr3510903lfd.626.1611134872351; 
 Wed, 20 Jan 2021 01:27:52 -0800 (PST)
Received: from localhost.localdomain ([2.92.195.184])
 by smtp.gmail.com with ESMTPSA id r81sm147479lff.215.2021.01.20.01.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 01:27:51 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv8 0/3] arm-virt: add secure pl061 for reset/power down
Date: Wed, 20 Jan 2021 12:27:45 +0300
Message-Id: <20210120092748.14789-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 Maxim Uvarov <maxim.uvarov@linaro.org>, Jose.Marinho@arm.com, f4bug@amsat.org,
 tf-a@lists.trustedfirmware.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QJ/AyXEa28pC

 v8: - use gpio 0 and 1, align dtb with kernel gpio-restart, gpio-poweroff,
       change define names, trigger on upper front. (Peter Maydell).
 v7: - same as v6, but resplit patches: patch 2 no function changes and refactor
	gpio setup for virt platfrom and patch 3 adds secure gpio.
 v6: - 64k align gpio memory region (Andrew Jones)
     - adjusted memory region to map this address in the corresponding atf patch
 v5: - removed vms flag, added fdt  (Andrew Jones)
     - added patch3 to combine secure and non secure pl061. It has to be
       more easy to review if this changes are in the separate patch.
 v4: rework patches accodring to Peter Maydells comments:
	- split patches on gpio-pwr driver and arm-virt integration.
	- start secure gpio only from virt-6.0.
	- rework qemu interface for gpio-pwr to use 2 named gpio.
	- put secure gpio to secure name space.
 v3: added missed include qemu/log.h for qemu_log(.. 
 v2: replace printf with qemu_log (Philippe Mathieu-Daudé)

This patch works together with ATF patch:
	https://github.com/muvarov/arm-trusted-firmware/commit/886965bddb0624bdf85103efb2b39fd4eb73d89b

Maxim Uvarov (3):
  hw: gpio: implement gpio-pwr driver for qemu reset/poweroff
  arm-virt: refactor gpios creation
  arm-virt: add secure pl061 for reset/power down

 hw/arm/Kconfig        |   1 +
 hw/arm/virt.c         | 111 ++++++++++++++++++++++++++++++++++--------
 hw/gpio/Kconfig       |   3 ++
 hw/gpio/gpio_pwr.c    |  70 ++++++++++++++++++++++++++
 hw/gpio/meson.build   |   1 +
 include/hw/arm/virt.h |   2 +
 6 files changed, 167 insertions(+), 21 deletions(-)
 create mode 100644 hw/gpio/gpio_pwr.c

-- 
2.17.1

