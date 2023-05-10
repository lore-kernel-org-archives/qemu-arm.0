Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp3299428ejq;
        Wed, 10 May 2023 03:30:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ444uMcU6+DEcifFCyLcdVTEyWXsFxdU3rgzDbiBUzN4oaVvEQ2egTCQ/PUsoxJhV1DHFBc
X-Received: by 2002:a05:622a:13ce:b0:3f3:8976:9d3f with SMTP id p14-20020a05622a13ce00b003f389769d3fmr17343198qtk.24.1683714649195;
        Wed, 10 May 2023 03:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683714649; cv=none;
        d=google.com; s=arc-20160816;
        b=BjDTv01B/YoGSqo6c6OaT3LKoyM699jCBBIXnLch7hYirLrg7ZZX9Z2Pp/Y753+ZWa
         GT7tleyBmpaq+lvDRYXLv0ETW5Nm37WN1j45wp0+KZymxSthDwlpX/83hIMxgsxL1Fld
         x683Z5j4mgIIt6lnNFv/WUv8eF4QFlmIIGCJVb4AIcRZop58/iHgjnfI6rD0iBto6V8H
         0bBaLVcKu72P0d4t7VorNnRB/Xtc1hffxz+uwhXBVjyaaiaNuRIKHaScSWakjGnKLKbb
         K8qd26enNhxP3D6LSWxLpdlBOzsuV+qxIjmVg8uRYjvfCnm+3CPWwOtv5CdMIGygCsMf
         JQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=K5v3/qwGgrVngUDrZEa3feNReC7KwjGqmcNDHIC4Qyg=;
        b=huu0n+byd78ce/JH+n4wuA2DXAvqDmM6JG5oV8dBqYRYGO6Q/0rV8k4Pi9gmpvfhhR
         mgfLMR00Opi0Ft7nPv5ReUzEI25rfMbdY78tAfE6dCsD/fUp8MxHlTrB9ee+uZ4A/qBp
         gw9DNLCgZI0SMjG8ULKyLvoOZN+XnVW7qcYroXy0MNhLXX6uWfdVgeftcRfXPM2w/EZz
         DjtiDVlHZvqPpwKF/U9/u8+dbqMWjkamBw866OIl4IsbKE/lGYuBC6m8xZoUGR03vjnk
         KfOurXKfg6ZKejBShmUSWlSTHc1+/HyS+lDCtUrZnciKVIPTpxD7bKO0tMm+SUX/nMRN
         DyvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=Be6vdnO0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6-20020ac85986000000b003b9bf110a36si1475076qte.719.2023.05.10.03.30.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 May 2023 03:30:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=Be6vdnO0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pwh5c-0003XD-PZ; Wed, 10 May 2023 06:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1pwh5b-0003Vt-E1; Wed, 10 May 2023 06:30:31 -0400
Received: from m12.mail.163.com ([220.181.12.197])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1pwh5W-00080N-Uk; Wed, 10 May 2023 06:30:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=K5v3/
 qwGgrVngUDrZEa3feNReC7KwjGqmcNDHIC4Qyg=; b=Be6vdnO0+pnVJDYRfaUwh
 UfinRiWZ3WayhAENkqLDVAJspeTZQmKAfBIOAqVehma0UfQHsRMOSxutuypsrwYg
 zWnqqzP1MN0lx+q0PvOElUd3TF2UyBfYQVEoC+/+lQwvJM96BhiLxwPwI9UTSfmf
 1o4oVmI6aTdtbs5ouoK2KY=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [218.201.129.19])
 by zwqz-smtp-mta-g4-4 (Coremail) with SMTP id _____wBnkgAvcltk0WrrBQ--.23956S2;
 Wed, 10 May 2023 18:30:08 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v4 00/11] *** Add allwinner r40 support ***
Date: Wed, 10 May 2023 18:29:53 +0800
Message-Id: <20230510103004.30015-1-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnkgAvcltk0WrrBQ--.23956S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr4DZFWDKF4Utr1DXFW8WFg_yoW5CFW3pa
 n8K343Kr1rta43AFWaqFnrJFyrJa4kGr4Utrn7ZryxAry3ta1Yvr1UK3WfKrWrGFy2qwsr
 ZFZIqF13Ww4YqaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRNo7JUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/xtbBzhVr7WI0ZI07awAAsy
Received-SPF: pass client-ip=220.181.12.197;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hO5u5A70eTIV

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

# v2: 2023-03-28

1. Fix the waring and error reported by checkpatch.pl
2. Remove the other i2c controllers except that i2c0
3. Use an array to register mmc and uart devices
4. Rename axp209 to axp22x and add axp221 support
5. Add a basic SRAM controller

# v3: 2023-04-18

1. Update some commit messages
2. Squash those two commit about sdcard
   hw: sd: allwinner-sdhost: Add sun50i-a64 SoC support
   hw: arm: allwinner-r40: Fix the mmc controller's type

# v4: 2023-05-10

1. Rebase to master

qianfan Zhao (11):
  hw: arm: Add bananapi M2-Ultra and allwinner-r40 support
  hw/arm/allwinner-r40: add Clock Control Unit
  hw: allwinner-r40: Complete uart devices
  hw: arm: allwinner-r40: Add i2c0 device
  hw/misc: Rename axp209 to axp22x and add support AXP221 PMU
  hw/arm/allwinner-r40: add SDRAM controller device
  hw: sd: allwinner-sdhost: Add sun50i-a64 SoC support
  hw: arm: allwinner-r40: Add emac and gmac support
  hw: arm: allwinner-sramc: Add SRAM Controller support for R40
  tests: avocado: boot_linux_console: Add test case for bpim2u
  docs: system: arm: Introduce bananapi_m2u

 docs/system/arm/bananapi_m2u.rst      | 138 +++++++
 hw/arm/Kconfig                        |  14 +-
 hw/arm/allwinner-r40.c                | 526 ++++++++++++++++++++++++++
 hw/arm/bananapi_m2u.c                 | 145 +++++++
 hw/arm/meson.build                    |   1 +
 hw/misc/Kconfig                       |   5 +-
 hw/misc/allwinner-r40-ccu.c           | 209 ++++++++++
 hw/misc/allwinner-r40-dramc.c         | 513 +++++++++++++++++++++++++
 hw/misc/allwinner-sramc.c             | 184 +++++++++
 hw/misc/axp209.c                      | 238 ------------
 hw/misc/axp2xx.c                      | 283 ++++++++++++++
 hw/misc/meson.build                   |   5 +-
 hw/misc/trace-events                  |  26 +-
 hw/sd/allwinner-sdhost.c              |  70 +++-
 include/hw/arm/allwinner-r40.h        | 143 +++++++
 include/hw/misc/allwinner-r40-ccu.h   |  65 ++++
 include/hw/misc/allwinner-r40-dramc.h | 108 ++++++
 include/hw/misc/allwinner-sramc.h     |  69 ++++
 include/hw/sd/allwinner-sdhost.h      |   9 +
 tests/avocado/boot_linux_console.py   | 176 +++++++++
 20 files changed, 2679 insertions(+), 248 deletions(-)
 create mode 100644 docs/system/arm/bananapi_m2u.rst
 create mode 100644 hw/arm/allwinner-r40.c
 create mode 100644 hw/arm/bananapi_m2u.c
 create mode 100644 hw/misc/allwinner-r40-ccu.c
 create mode 100644 hw/misc/allwinner-r40-dramc.c
 create mode 100644 hw/misc/allwinner-sramc.c
 delete mode 100644 hw/misc/axp209.c
 create mode 100644 hw/misc/axp2xx.c
 create mode 100644 include/hw/arm/allwinner-r40.h
 create mode 100644 include/hw/misc/allwinner-r40-ccu.h
 create mode 100644 include/hw/misc/allwinner-r40-dramc.h
 create mode 100644 include/hw/misc/allwinner-sramc.h

-- 
2.25.1

