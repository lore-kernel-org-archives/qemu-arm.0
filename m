Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp1363503ejo;
        Sat, 6 Jan 2024 08:40:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEomJ6IqvYEZZjstDaCACDj1zYfZ/aLCJCtCMAmjOR8k6h9OpujkPLxQSfcwsc/jS0BKlwK
X-Received: by 2002:a05:620a:4151:b0:783:13e0:3297 with SMTP id k17-20020a05620a415100b0078313e03297mr821291qko.78.1704559221209;
        Sat, 06 Jan 2024 08:40:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704559221; cv=none;
        d=google.com; s=arc-20160816;
        b=lx1zPCYSDnCm4/C8sC00PVsoBO7WxVKm6E+JneHTn+4ZIervMWsHFRbBrLs/pnWH8K
         lQ1Cg9kN58UvTqfKkS75zpKiuvwxB+qznQTNGUKesUVS9t/BeisOvYCiaqXNoYZV0nFj
         07ikCZoa2LYGKDgcCKfj+ii/y6JbjJdWOey2oEgrC69LEYKduJTLNiGx5zeT2MS2uWZh
         p6j5fBTthiNnUPIh5h8ko+lfWUzc39XxAGGN4KMRq+vXXfAOLslGWs11tZ32lAYU+Dlk
         KhVpGFuhkQx+SCTjUM8zIP8cNEzyeRqzh9H5iZGT2qoMQwYJxJsEzx6MXMp7gpew6xtz
         yOOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=bTJgsQGuWSR9753C2pJ/CrFSw7ymAq7Pqwu6CUOai7I=;
        fh=7PA+vUGXkkjAcZvk/H80lUiJ0SZWtswN2qIXn6r4OtE=;
        b=aGUy67Bi2ShVjryVXTIi5E3+n0jI5lOf3WCHJJs5XfjJGrtSvkwReQEep+9iIIM8NB
         zFrBfuhu9PD891zwlwpazv6WNhBddnr9Q+jaG00bRMQD/aWWLoykv8gpO1wy85gHB+n4
         DEPV4RPvfatJ8EWgAv+TYD0EuWW7rbG9By5e6BiO5ySwVEkrx4bUwqw7K9hwA4heAbAV
         Sw7VjQCJ9ItBoQ34YHDRr0TwX83kP4do9OvCzkJYRrYuU16ihcc7DO2RMB7qJyws/fo+
         OiWGzVx2nOr+ebQJtldZ+fjiRIQEuu8zz3EoyoEZP2F3ZfweQ+31XuBcpNhn96b2uIBk
         FPDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=M6nyDpXS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dz22-20020a05620a2b9600b00781be7d3a60si4452393qkb.763.2024.01.06.08.40.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 Jan 2024 08:40:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=M6nyDpXS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rM9hj-0002sm-WC; Sat, 06 Jan 2024 11:39:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rM9hi-0002sS-Ud; Sat, 06 Jan 2024 11:39:22 -0500
Received: from zproxy2.enst.fr ([137.194.2.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rM9hf-0007Ar-Vx; Sat, 06 Jan 2024 11:39:21 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy2.enst.fr (Postfix) with ESMTP id A2015808A5;
 Sat,  6 Jan 2024 17:39:15 +0100 (CET)
Received: from zproxy2.enst.fr ([IPv6:::1])
 by localhost (zproxy2.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id TNJxrIF19rGO; Sat,  6 Jan 2024 17:39:14 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy2.enst.fr (Postfix) with ESMTP id 57FCE80893;
 Sat,  6 Jan 2024 17:39:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy2.enst.fr 57FCE80893
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1704559154;
 bh=bTJgsQGuWSR9753C2pJ/CrFSw7ymAq7Pqwu6CUOai7I=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=M6nyDpXSgf7TiZuPkd1vKnHi0OCB2yHWweQlovsTo0HmmOs7gvLzvvfhDxYNmWdaO
 BdsRhd2FRw4X+dvsBn/kDiuB4TukojYKNN42DJlF1hvomfIz4x+pZn1FIYlQW2cua9
 Ea6CQdZ1CCVKtWzHgiE6tzku5Agh0pp80jDY+hMQ=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy2.enst.fr ([IPv6:::1])
 by localhost (zproxy2.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id oBTCS6aV5d2w; Sat,  6 Jan 2024 17:39:14 +0100 (CET)
Received: from localhost.localdomain (74.0.125.80.rev.sfr.net [80.125.0.74])
 by zproxy2.enst.fr (Postfix) with ESMTPSA id E93CB807DC;
 Sat,  6 Jan 2024 17:39:13 +0100 (CET)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Alexandre Iooss <erdnaxe@crans.org>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Samuel Tardieu <sam@rfc1149.net>
Subject: [PATCH v5 0/2] Add minimal support for the B-L475E-IOT01A board
Date: Sat,  6 Jan 2024 17:38:39 +0100
Message-ID: <20240106163905.42027-1-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=137.194.2.221;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy2.enst.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: 0Dt2NRUvgxyu

This patch adds a new STM32L4x5 SoC, it is necessary to add support for
the B-L475E-IOT01A board.
The implementation is derived from the STM32F405 SoC and NetduinoPlus2
board.
The implementation contains no peripherals, only memory regions are
implemented.

Changes from v5 to v4:
- in `b-l475e-iot01a.c`: adding missing machine/SoC parentship relation
- in `b-l475e-iot01a.c`: renaming `SYSCLK_FRQ` macro
to `MAIN_SYSCLK_FREQ_HZ`
- in `b-l475e-iot01a.c`: fixing coding style issue
- in `stm32l4x5_soc.h`: removing unused imports

Changes from v3 to v4:
- adding a documentation file for the B-L475E-IOT01A board

Changes from v1 to v3:
- changing the MIT license to GPL.

Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>

In=C3=A8s Varhol (2):
  hw/arm: Add minimal support for the STM32L4x5 SoC
  hw/arm: Add minimal support for the B-L475E-IOT01A board

 MAINTAINERS                             |  15 ++
 configs/devices/arm-softmmu/default.mak |   1 +
 docs/system/arm/b-l475e-iot01a.rst      |  46 ++++
 docs/system/arm/stm32.rst               |   6 +-
 docs/system/target-arm.rst              |   1 +
 hw/arm/Kconfig                          |  11 +
 hw/arm/b-l475e-iot01a.c                 |  72 +++++++
 hw/arm/meson.build                      |   2 +
 hw/arm/stm32l4x5_soc.c                  | 268 ++++++++++++++++++++++++
 include/hw/arm/stm32l4x5_soc.h          |  57 +++++
 10 files changed, 477 insertions(+), 2 deletions(-)
 create mode 100644 docs/system/arm/b-l475e-iot01a.rst
 create mode 100644 hw/arm/b-l475e-iot01a.c
 create mode 100644 hw/arm/stm32l4x5_soc.c
 create mode 100644 include/hw/arm/stm32l4x5_soc.h

--=20
2.43.0

