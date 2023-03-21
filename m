Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp3887994ejb;
        Tue, 21 Mar 2023 03:26:50 -0700 (PDT)
X-Google-Smtp-Source: AK7set/92Ycp53UTCJfEuwnbJhMHZurftKYri4kiOAT/YyNSlguFGrrQj8UECsxThpvFivxZrryT
X-Received: by 2002:a05:622a:20c:b0:3da:e3a8:b01a with SMTP id b12-20020a05622a020c00b003dae3a8b01amr3649914qtx.0.1679394409794;
        Tue, 21 Mar 2023 03:26:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679394409; cv=none;
        d=google.com; s=arc-20160816;
        b=lOUCVz3naqQvMqP3N7NsDVUx3ghhOwzKrxzXE4CBHNTnwlkrk3m5/5BWNmRAdjMyOC
         XbX4HUK+D/JDg1YZ0p5/CKG1GrBbBr5AQP0BUpUEcc/43fLtkdM5U0bDIYMFsoRwkXze
         pWZdoNTxZsrh3w5DCqI42wL0lM/XpOwz8JzaGeGfIFVfYIPD2uetqq8Z4N+RJTMeV630
         7h/syLy5yjDVHJb1p3y7jM+38b0Q2IV1Dw26zmqOj5X+NotOeU5XJW/84emZxIyzrwlJ
         rPeK1J9YFwYQVhmQLh+2iiIafbN3QI1L2mgyM1H5E5bpQvSTYDi5rQjHuX8tAtBvBElb
         q+vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Q7IctvYEntp8REioPeWzSgXU06FNaS+arlTH5Xz6zgg=;
        b=Z3PV1o1B8OJRpDx7isOnc5nvBAWlULWBnTn25d7pb8DCzteU5xMVu9gSLyXF/ZdwSt
         HbAkWANUdZzOA6XEHBGB8EnN4BrznfZl86nO3HA2QDiOgFVpy3XrrpNUwb+xq+tEugsK
         rqZRzhDevZq0d1fjc36gAQWZMVaqPmlt2I3GSTTSKbs4lJDWcIRH7K2lrR7aSeATW700
         ugr5/M5Q/kMfMjENVyPVkW47NxLOgmxv5i/Mxr3rWiulSAHQfQAlEQ7yc9BMxs2VAFpH
         NDuiT1wsaTntKnwrYFsNwYUI0B2GhF28NCgkMQ8bti2nA62t4twuUDUy+vY6HsBH5uTf
         D8ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b="MN7e9v/I";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u20-20020a05622a14d400b003b69dd120b1si4538892qtx.312.2023.03.21.03.26.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Mar 2023 03:26:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b="MN7e9v/I";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peZBW-0000TX-PY; Tue, 21 Mar 2023 06:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1peZBP-0000PP-OI; Tue, 21 Mar 2023 06:25:35 -0400
Received: from m12.mail.163.com ([220.181.12.197])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1peZBK-0008NJ-He; Tue, 21 Mar 2023 06:25:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Q7Ict
 vYEntp8REioPeWzSgXU06FNaS+arlTH5Xz6zgg=; b=MN7e9v/Ig7F0+Ki0WatUI
 p+/eSndJyrppLHs5GZrtd1cZ0FDD5S8FGJ1NIx1TIvyxQpHlDCmg2DtPMk15ux9v
 UQPxwhK+0Ij8VuBEDj1INfw9nQu2GY9mma5khmOynXSk5iUPkgl/WI03r9METDCV
 0CgeS1IX7ejrGZWTMlJeZ4=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [218.201.129.19])
 by zwqz-smtp-mta-g5-1 (Coremail) with SMTP id _____wBnznIHhhlk7VIWAA--.11160S2;
 Tue, 21 Mar 2023 18:25:13 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v1 00/11] *** add allwinner-r40 support ***
Date: Tue, 21 Mar 2023 18:24:59 +0800
Message-Id: <20230321102510.16754-1-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnznIHhhlk7VIWAA--.11160S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw4rJFyDWw1rtw45Cw15Arb_yoW8KrWrpa
 n0k345Kr1rAa13JFWaqFs7JFyrJa4kGr4Utrn2vFy7AryfKa1Yvr1UK3ZagrWfGFZFqw47
 ZrZIqFy3Ww45taDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRAbbiUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXQc57VWBo+uC8QACsj
Received-SPF: pass client-ip=220.181.12.197;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZBxC2ExNlqSN

From: qianfan Zhao <qianfanguijin@163.com>

*** history ***

# v1: 2023-03-21

The first version which add allwinner-r40 support, supported features:

+ ccu
+ dram controller
+ uart
+ i2c and pmic(axp221)
+ sdcard
+ emac/gmac

Also provide a test case under avocado, running quickly test:

$ AVOCADO_ALLOW_LARGE_STORAGE=yes tests/venv/bin/avocado \
    --verbose --show=app,console run -t machine:bpim2u \
    ../tests/avocado/boot_linux_console.py

qianfan Zhao (11):
  hw: arm: Add bananapi M2-Ultra and allwinner-r40 support
  hw/arm/allwinner-r40: add Clock Control Unit
  hw: allwinner-r40: Complete uart devices
  hw: arm: allwinner-r40: Add 5 TWI controllers
  hw/misc: AXP221 PMU Emulation
  hw/arm/allwinner-r40: add SDRAM controller device
  hw: sd: allwinner-sdhost: Add sun50i-a64 SoC support
  hw: arm: allwinner-r40: Fix the mmc controller's type
  hw: arm: allwinner-r40: Add emac and gmac support
  tests: avocado: boot_linux_console: Add test case for bpim2u
  docs: system: arm: Introduce bananapi_m2u

 configs/devices/arm-softmmu/default.mak |   1 +
 docs/system/arm/bananapi_m2u.rst        | 138 ++++++
 hw/arm/Kconfig                          |  10 +
 hw/arm/allwinner-r40.c                  | 558 ++++++++++++++++++++++++
 hw/arm/bananapi_m2u.c                   | 131 ++++++
 hw/arm/meson.build                      |   1 +
 hw/misc/Kconfig                         |   4 +
 hw/misc/allwinner-r40-ccu.c             | 207 +++++++++
 hw/misc/allwinner-r40-dramc.c           | 499 +++++++++++++++++++++
 hw/misc/axp221.c                        | 196 +++++++++
 hw/misc/meson.build                     |   3 +
 hw/misc/trace-events                    |  19 +
 hw/sd/allwinner-sdhost.c                |  70 ++-
 include/hw/arm/allwinner-r40.h          | 148 +++++++
 include/hw/misc/allwinner-r40-ccu.h     |  65 +++
 include/hw/misc/allwinner-r40-dramc.h   | 108 +++++
 include/hw/sd/allwinner-sdhost.h        |   9 +
 tests/avocado/boot_linux_console.py     | 173 ++++++++
 18 files changed, 2337 insertions(+), 3 deletions(-)
 create mode 100644 docs/system/arm/bananapi_m2u.rst
 create mode 100644 hw/arm/allwinner-r40.c
 create mode 100644 hw/arm/bananapi_m2u.c
 create mode 100644 hw/misc/allwinner-r40-ccu.c
 create mode 100644 hw/misc/allwinner-r40-dramc.c
 create mode 100644 hw/misc/axp221.c
 create mode 100644 include/hw/arm/allwinner-r40.h
 create mode 100644 include/hw/misc/allwinner-r40-ccu.h
 create mode 100644 include/hw/misc/allwinner-r40-dramc.h

-- 
2.25.1

