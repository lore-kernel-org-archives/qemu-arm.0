Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp2392465ejx;
        Sat, 3 Dec 2022 15:21:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4c3vCL7CKTHfKI7DJMRjkhLJi58m9rrFuTBjX4F3tfdEZxJOUPfCpzHJ8VKVU17JnmBLTI
X-Received: by 2002:ac8:4e33:0:b0:3a5:269e:3b3d with SMTP id d19-20020ac84e33000000b003a5269e3b3dmr71690366qtw.222.1670109683114;
        Sat, 03 Dec 2022 15:21:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670109683; cv=none;
        d=google.com; s=arc-20160816;
        b=noQf3E79JojcPakDAqYS+bE3Cx32Ifx1BI4tOYyc0/Xf1G7Kb+jL3uy0BkImApWs4m
         zdq5xAbwlNzpDRUmeGoA9PNN3G4T7qjWScM3NOnwQKsLTmjG4c0GKOfQqUIu4RPKTXG5
         CNkxKJXZ/gcnfrmsUlwoY+GaOWZ/k+cNVzptfCb7X6aCDz6tLREzG+fy85Jxh5/IhuIh
         fumZqsp/Cw4cMHfJAHEwKWyDJhpi2so09ITShupHQTf6zuz9YKdo/eQtS3FSSQuRjW9g
         W57wCpHLyxr40PLt+oMTodGSSs0TjMawsdWfHZxEZd2LRHQwBQHXG1/alNjqW6XmBFbC
         iXtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ua3HtEc/TdfM1Wt5fqcGOrhTM0H6ueiZCckFhuAwBNM=;
        b=t81ou+4TzGUI9Rm7OM53Qgu2kKQislvhDBpdy1DzfvXsKIMGsiIe74OFWhvRbt86Da
         LIp56XWNMUMnxjycwCCGQjf9QoSvTVRD8SYc6dIjyeXOSk34hKG8mDbhslV90laxBAIJ
         qlQc5ojl11uj3sEQuI3OnMh6UUziJo73UOEo8PcS0kg++cFjgR4qsChx4Ks3AMCJ74di
         zWXb+slq16iCkneF9ajRno5yiK2GyqMSINDZEJgyrjI5aFg+vr7wTp+vFSE7QXQF6kQk
         olvjIYFCQS8XO0GI1vRUbejLk20NrFsTa4sOvZKVRTOCBbIjEYTa4q3V8tdIC6FQQjk0
         sfeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ejimAuME;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18-20020a05620a111200b006ef0e65bca7si5294629qkk.629.2022.12.03.15.21.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Dec 2022 15:21:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ejimAuME;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1bnR-0000A8-KC; Sat, 03 Dec 2022 18:19:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p1bnQ-00009e-Ly; Sat, 03 Dec 2022 18:19:48 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p1bnC-0001ZP-Gq; Sat, 03 Dec 2022 18:19:48 -0500
Received: by mail-lf1-x134.google.com with SMTP id b3so12939579lfv.2;
 Sat, 03 Dec 2022 15:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ua3HtEc/TdfM1Wt5fqcGOrhTM0H6ueiZCckFhuAwBNM=;
 b=ejimAuMEcveu15JUDkXW25QmMu+ZddfAz2EoaV6cBR/lZhL67K3UaVLdeOn72Xpbdo
 fVsw2lY0bCR3qzQWlDIvgZJBef148QCumc/8xlOuiOwgSPyVQzqwYYjJOPQP3OBz76ij
 u4BewCX41M0CteSkzUHAlneETfaKYMdyCe4vr309TjRE00OvnFqqeBd5zKjQEgFcWWYk
 4xVeq1GKY4ldezKUbNAciAlKh9+9jSRVqXpF44Q8EGteGEHlLfhTMUp+s/NGQX70yDh9
 lZz5p1je/O7y/hcLZAKD4itE2JppySNyCNrARpMD68A16Csa6Hq3edM6lvbWmni0fYs/
 PZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ua3HtEc/TdfM1Wt5fqcGOrhTM0H6ueiZCckFhuAwBNM=;
 b=kjmsSAxdNzyDv14xHneHSvIQNzC5nnNwvni4KBI6iylUWHgQLlXO5M1QvMfYS+WRnD
 Meh/JF8LBhftpjn9q13m4YUgVfuMzlZ4tbWhXm/KsCxyKT34H/pD4DTpmmvqGjYHbhVM
 vvEc5PYod/O8t4uCfcAs+6H9LQGn49xhWn5v60ZK1SaEi/s8KotNe0v2w6I/U4vKvrTT
 lTNV1ry3cxCPI52QDMuwUyJxAEE8aiYbby8HoODTnG3wRT6B/lrjy+C/FXk7KR+XdJJk
 N4/dgeIK6oXkmlXDwJpy5a2vIZMpWyxQhQXIntWG97l5tfNGq/BuTpXsinNl9FmMwT/2
 RWeQ==
X-Gm-Message-State: ANoB5pnRDg+PvhcnGuos3Pg3EVAigmbu351xgV1SmfpBom/WBIiubQyC
 JSXmzC74VOk6cmxeqOoH8J4=
X-Received: by 2002:a05:6512:258b:b0:4b5:c8f:2b59 with SMTP id
 bf11-20020a056512258b00b004b50c8f2b59mr12624007lfb.536.1670109571183; 
 Sat, 03 Dec 2022 15:19:31 -0800 (PST)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 b27-20020a05651c033b00b002770e6c620bsm22623ljp.106.2022.12.03.15.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 15:19:30 -0800 (PST)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH 0/6] Enable Cubieboard A10 boot SPL from SD card 
Date: Sun,  4 Dec 2022 00:18:58 +0100
Message-Id: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: oErLJ2ZtUwIi

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


Strahinja Jankovic (6):
  hw/misc: Allwinner-A10 Clock Controller Module Emulation
  hw/misc: Allwinner A10 DRAM Controller Emulation
  hw/i2c: Allwinner TWI/I2C Emulation
  hw/misc: Allwinner AXP-209 Emulation
  hw/arm: Add AXP-209 to Cubieboard
  hw/arm: Allwinner A10 enable SPL load from MMC

 hw/arm/Kconfig                        |   5 +
 hw/arm/allwinner-a10.c                |  40 +++
 hw/arm/allwinner-h3.c                 |  11 +-
 hw/arm/cubieboard.c                   |  11 +
 hw/i2c/Kconfig                        |   4 +
 hw/i2c/allwinner-i2c.c                | 417 ++++++++++++++++++++++++++
 hw/i2c/meson.build                    |   1 +
 hw/misc/Kconfig                       |  10 +
 hw/misc/allwinner-a10-ccm.c           | 224 ++++++++++++++
 hw/misc/allwinner-a10-dramc.c         | 179 +++++++++++
 hw/misc/allwinner-axp-209.c           | 263 ++++++++++++++++
 hw/misc/meson.build                   |   3 +
 include/hw/arm/allwinner-a10.h        |  27 ++
 include/hw/arm/allwinner-h3.h         |   3 +
 include/hw/i2c/allwinner-i2c.h        | 112 +++++++
 include/hw/misc/allwinner-a10-ccm.h   |  67 +++++
 include/hw/misc/allwinner-a10-dramc.h |  68 +++++
 17 files changed, 1444 insertions(+), 1 deletion(-)
 create mode 100644 hw/i2c/allwinner-i2c.c
 create mode 100644 hw/misc/allwinner-a10-ccm.c
 create mode 100644 hw/misc/allwinner-a10-dramc.c
 create mode 100644 hw/misc/allwinner-axp-209.c
 create mode 100644 include/hw/i2c/allwinner-i2c.h
 create mode 100644 include/hw/misc/allwinner-a10-ccm.h
 create mode 100644 include/hw/misc/allwinner-a10-dramc.h

-- 
2.30.2

