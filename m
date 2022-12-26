Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp2496689ejb;
        Mon, 26 Dec 2022 14:03:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsU7K2X/ZqTA2QPJtWa1mzrEdlNttIt65EPYRt5MfBZacnhM+iWDYcU8OLPfgqHwANyAtJ0
X-Received: by 2002:ad4:4e83:0:b0:531:8cdb:ce7a with SMTP id dy3-20020ad44e83000000b005318cdbce7amr2328500qvb.9.1672092223385;
        Mon, 26 Dec 2022 14:03:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672092223; cv=none;
        d=google.com; s=arc-20160816;
        b=YPKq8e4Bc6/ue09mWONnjJCzaHpkWzV/PsxUvLuj0BcOMnZFdeC8VfKan71DEkHH7L
         +iBQrO7AclS5TKmLzKAUX4RBKOiSqqlycS8unff7vI/9TV5FXL/ZQLgkdeAwuPDxponr
         Iiu/I75CdJYH4+lQ3CBcoevjzWWxlPtWAceecj2PMEj1LOaedq4rbZ9h3IkXxBZxQaBh
         UX0E2edPn27/NJ/46FdXSYO4xfHWpc5zHreVTxjE8Rj/iUFJh4HgI/G4n2fadFhBrbF5
         VOJZ8E9Uh5ZuogPlkwP2Ow0jSbgvUgoa7oZ74B+4Ye6VeqZl6GibLmmT2DTa+kR+AwXP
         SaDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=E0CNKufWJ9cgOLvsHBLXpX8GKTQDW5GWzj/kJv3Ez5w=;
        b=IP/CLZrEomiX9cI1QcJ99ZY4ky8Gziv2jj0HmN/Eox7V8kHEP2VEsuKAEIoqtC2sOe
         RQm8H3znbGwkcFgVBi4z3Jc6X9Xn/Z9RmS7oZ/Hsb+HpTZVOQEPrMsSAwGKo4d8bDNYW
         F72vcM/mLaEFAdvvayey55EnhrANx/6Jg5npe/GIvtCCZTgJB0dhQmTYBhKGRZ0m0J3I
         TkBdLmm7AvFS8OQYPL6F3RjZVRYwMeE3+iK7IYphEiIM4y78ALhznHQhEV3dDz9sr+q7
         xxLHXn9zZy6kvIMV7WtWRer8I5giY9jBdVF7ygt0yR+V5APs+Im5Nj8ujMh82YDL2sPh
         IWgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=AqZHmj72;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4-20020ad45ae4000000b004738a5034c5si4573145qvh.528.2022.12.26.14.03.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Dec 2022 14:03:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=AqZHmj72;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p9vZC-0004mK-Db; Mon, 26 Dec 2022 17:03:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p9vZ4-0004kj-Ol; Mon, 26 Dec 2022 17:03:22 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p9vZ2-0003X0-RY; Mon, 26 Dec 2022 17:03:22 -0500
Received: by mail-ed1-x531.google.com with SMTP id u28so12018269edd.10;
 Mon, 26 Dec 2022 14:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E0CNKufWJ9cgOLvsHBLXpX8GKTQDW5GWzj/kJv3Ez5w=;
 b=AqZHmj72DquJ4PFgjFXSkabeaDolQyZ8zHefd1Q9h1LR+jatX1jN6txFb+cYCLaoqT
 covXd8Dqe4vCZpzWy/5dLiN0nte+1NGzmFM7S40jWoEn7jDyHcSE3njwGFgaV+50zM7j
 /6fF/TDp1da1bJQ8T5Q44ukbulyA/jW5+hf7nt8PXEml1EHDM94DUmoskt2oTpoQ+ZpS
 IDPsV3zLQwKlKZXmC69pH2ITKEcqGPqUELwfrZEDj7YDOHk+OwID0wzhZh8wgg92XplC
 lXpQC35xPREWHIGNwDqmJv0TOYfeyDZWg3VSWXLdFJOl1rRDNSrjI6URm7PEYtU9x6kA
 t/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E0CNKufWJ9cgOLvsHBLXpX8GKTQDW5GWzj/kJv3Ez5w=;
 b=r9Dd9nBHO+bRcPYuuPt8uYHRW7CwhFzeJetgHObCxfWDos0R+X4KJbXSWgSMkLHKd1
 RtB6jgnOV4MVidxX5CFXqlsEMxISXMQqvWNkwW3lGfpXK7gGWK4+737sDu6e8EbET/bW
 +CypIpXjbr37NN/PScB1bhfLf8syQoiPidmnXJagRBRpae1x1fV7IjYH2i8pj7vwMnbP
 K8Y2qXq4m+GQgYCH0M+BWNu1qyyVhcf9/5JxOAZGJDwi2SenPBJKu5ybzAAZYQKZLSNt
 lzenJG1klAYFEx4JR0NfYKiQzXQ1FPM2yY53UtjlnsxyYJT3I0rzoSs7NHL3bOPMzT0B
 Js1Q==
X-Gm-Message-State: AFqh2kr80qUwi3y2ZCkyJSpr0uRmT0BKD7IpXInGDMr12QNR84ZSaL3I
 +YK2fR2cyHeUCSlNCqF4KBE=
X-Received: by 2002:a05:6402:548e:b0:479:8303:dc1c with SMTP id
 fg14-20020a056402548e00b004798303dc1cmr15320838edb.7.1672092197052; 
 Mon, 26 Dec 2022 14:03:17 -0800 (PST)
Received: from penguin.lxd ([87.116.176.120])
 by smtp.googlemail.com with ESMTPSA id
 u1-20020aa7d541000000b0046951b43e84sm5111467edr.55.2022.12.26.14.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Dec 2022 14:03:16 -0800 (PST)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH v3 0/7] Enable Cubieboard A10 boot SPL from SD card
Date: Mon, 26 Dec 2022 23:02:56 +0100
Message-Id: <20221226220303.14420-1-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: tqGsXYakvKky

This patch series adds missing Allwinner A10 modules needed for
successful SPL boot:
- Clock controller module
- DRAM controller
- I2C0 controller (added also for Allwinner H3 since it is the same)
- AXP-209 connected to I2C0 bus

It also updates Allwinner A10 emulation so SPL is copied from attached
SD card if `-kernel` parameter is not passed when starting QEMU
(approach adapted from Allwinner H3 implementation).

Boot from SD card has been tested with Cubieboard Armbian SD card image and custom
Yocto image built for Cubieboard.
Example usage for Armbian image:
qemu-system-arm -M cubieboard -nographic -sd ~/Armbian_22.11.0-trunk_Cubieboard_kinetic_edge_6.0.7.img

v3:
* new avocado test for SD card boot for Cubieboard with OpenWrt image 
* renamed file and functions for AXP209 so there is not allwinner prefix
* replaced cast with I2C_BUS in AXP209 instantiation for Cubieboard
* squashed commit with Cubieboard and OrangePi-PC documentation update
with actual code changes
* added myself as Designated Reviewer to the Allwinner-A10 section in
MAINTAINERS file and added hw/misc/axp209.c to the same section.

v2:
* replaced DB_PRINTF with tracing functions
* removed .init function in AXP209 since .reset covers functionality
* moved defines to allwinner_i2c.c from header file
* updated docs with information about TWI
* minor code style fixes


Strahinja Jankovic (7):
  hw/misc: Allwinner-A10 Clock Controller Module Emulation
  hw/misc: Allwinner A10 DRAM Controller Emulation
  {hw/i2c,docs/system/arm}: Allwinner TWI/I2C Emulation
  hw/misc: AXP209 PMU Emulation
  hw/arm: Add AXP209 to Cubieboard
  hw/arm: Allwinner A10 enable SPL load from MMC
  tests/avocado: Add SD boot test to Cubieboard

 MAINTAINERS                           |   2 +
 docs/system/arm/cubieboard.rst        |   1 +
 docs/system/arm/orangepi.rst          |   1 +
 hw/arm/Kconfig                        |   5 +
 hw/arm/allwinner-a10.c                |  40 +++
 hw/arm/allwinner-h3.c                 |  11 +-
 hw/arm/cubieboard.c                   |  11 +
 hw/i2c/Kconfig                        |   4 +
 hw/i2c/allwinner-i2c.c                | 459 ++++++++++++++++++++++++++
 hw/i2c/meson.build                    |   1 +
 hw/i2c/trace-events                   |   5 +
 hw/misc/Kconfig                       |  10 +
 hw/misc/allwinner-a10-ccm.c           | 224 +++++++++++++
 hw/misc/allwinner-a10-dramc.c         | 179 ++++++++++
 hw/misc/axp209.c                      | 238 +++++++++++++
 hw/misc/meson.build                   |   3 +
 hw/misc/trace-events                  |   5 +
 include/hw/arm/allwinner-a10.h        |  27 ++
 include/hw/arm/allwinner-h3.h         |   3 +
 include/hw/i2c/allwinner-i2c.h        |  55 +++
 include/hw/misc/allwinner-a10-ccm.h   |  67 ++++
 include/hw/misc/allwinner-a10-dramc.h |  68 ++++
 tests/avocado/boot_linux_console.py   |  47 +++
 23 files changed, 1465 insertions(+), 1 deletion(-)
 create mode 100644 hw/i2c/allwinner-i2c.c
 create mode 100644 hw/misc/allwinner-a10-ccm.c
 create mode 100644 hw/misc/allwinner-a10-dramc.c
 create mode 100644 hw/misc/axp209.c
 create mode 100644 include/hw/i2c/allwinner-i2c.h
 create mode 100644 include/hw/misc/allwinner-a10-ccm.h
 create mode 100644 include/hw/misc/allwinner-a10-dramc.h

-- 
2.30.2

