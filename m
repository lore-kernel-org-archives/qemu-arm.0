Received: by 2002:a17:907:78c2:b0:a23:4dac:818 with SMTP id kv2csp493120ejc;
        Thu, 21 Dec 2023 13:39:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1L7QRx/Z0IzrCoBqaxCGECCQ2U/q1iXasq0YXRhNkcjFVL5XwZFvbADVUi8ChFpLaVEN0
X-Received: by 2002:a05:6214:412:b0:67f:4ecb:f864 with SMTP id z18-20020a056214041200b0067f4ecbf864mr440777qvx.65.1703194768087;
        Thu, 21 Dec 2023 13:39:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703194768; cv=none;
        d=google.com; s=arc-20160816;
        b=Q/EQfa+LkRXyz8dWoU2cKf0T9mFYzrIWwcoYXcBPnl5qD0VxSmVIvnLyd7b7uuzTDN
         Be+yebJFUSkeaLJJbRJwt2xdtFs2fEyhduyY/cm2T96bfdQezC0iG2U4n2etaJ8Gr4F7
         bRkfMiBaCly/Gg9ZohnfB+SARAskII7ZPIJy5uo5B3W7Rv9ylPHfA2oILm1k5PiX16Ng
         hdvcq0G0J+5wHG0hVYybH4R999Ky+qgDcXMrFQr8ojmXvbULBNKtw9Pc2EMpkBdQJAv0
         cvH92XU8fk3obIJDo2a5SPCsZjHItz6BFCFmKdbaBsl3C+AlPmU2eO0hPV9PFa0jWgg2
         STZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=MYnvFA7HY2sWD1PE8VVPG+sy4BknwXjFgWoc8oIrIcw=;
        fh=x5iJdebZDDzpjV8lDBNlSI54UMs6fnXtqQjNqUpLDAQ=;
        b=DwAieZJP4kAUmOfLqOIC/uavFo3jeOc4XkMACfkVXEUmGf3rbfO+JUnIy3BFDAfDo7
         7lOMKo1s/vxaH90GIBQzaVXFh2qAh0wnCGLl1beraUdetTNoH6gYsnS73DorxDx77lEC
         2AX1SMHyq4hrwVWS6P/8cVW+bUErkoQBXK5PaKa2eu6patRnDdldf2xIP8AM1O7n0caB
         Cpj46KIHFVvuFOvzhLQqt4YS97KFz+RJ+4HwLkoKj0J2SXpCzhIb1189ctLo9NVatcBp
         QTigQHWYHpLGqO8ZQmNxe+9Aps1B+yncgUeo0ccV56euiws3/UQJBeyzutXXoKmT7wpf
         1RMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b="Pz/wCb5D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t29-20020a05620a005d00b0077eff300011si3022716qkt.16.2023.12.21.13.39.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Dec 2023 13:39:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b="Pz/wCb5D";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rGQko-0008KA-2f; Thu, 21 Dec 2023 16:38:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rGQkm-0008Jc-MC; Thu, 21 Dec 2023 16:38:52 -0500
Received: from zproxy3.enst.fr ([137.194.2.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rGQkk-0005IM-RP; Thu, 21 Dec 2023 16:38:52 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id BF899A07CB;
 Thu, 21 Dec 2023 22:38:46 +0100 (CET)
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id EusemgAXboNC; Thu, 21 Dec 2023 22:38:46 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 31A56A07CF;
 Thu, 21 Dec 2023 22:38:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy3.enst.fr 31A56A07CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1703194726;
 bh=MYnvFA7HY2sWD1PE8VVPG+sy4BknwXjFgWoc8oIrIcw=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=Pz/wCb5DZWkydfq08lKtJfyAEBScQU1z+J4+QSp2OvgwiGLzOCtDMtKMq1n9TWMgy
 jDzcRkhlgnK8SjQWoBWnS/b+7DveiC78Xg+YvOsXwz2dmyxd+8/eewA4WpntuvL5Zf
 35okNQaDgzvaJcThqlWrctO4ITq2h3RVFoWTGZ0c=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id UfMSXx6BEn9F; Thu, 21 Dec 2023 22:38:46 +0100 (CET)
Received: from localhost.localdomain (74.0.125.80.rev.sfr.net [80.125.0.74])
 by zproxy3.enst.fr (Postfix) with ESMTPSA id DE136A074D;
 Thu, 21 Dec 2023 22:38:45 +0100 (CET)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alistair@alistair23.me, philmd@linaro.org,
 peter.maydell@linaro.org, arnaud.minier@telecom-paris.fr,
 ines.varhol@telecom-paris.fr
Subject: [PATCH v4 0/2] Add minimal support for the B-L475E-IOT01A board
Date: Thu, 21 Dec 2023 22:32:19 +0100
Message-ID: <20231221213838.54944-1-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=137.194.2.222;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy3.enst.fr
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
X-TUID: JSiK4ACm5CCt

This patch adds a new STM32L4x5 SoC, it is necessary to add support for
the B-L475E-IOT01A board.
The implementation is derived from the STM32F405 SoC and NetduinoPlus2
board.
The implementation contains no peripherals, only memory regions are
implemented.

Changes from v3 to v4:
- adding a documentation for the B-L475E-IOT01A board

Changes from v1 to v3:
- changing the MIT license to GPL.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
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
 hw/arm/b-l475e-iot01a.c                 |  70 +++++++
 hw/arm/meson.build                      |   2 +
 hw/arm/stm32l4x5_soc.c                  | 268 ++++++++++++++++++++++++
 include/hw/arm/stm32l4x5_soc.h          |  59 ++++++
 10 files changed, 477 insertions(+), 2 deletions(-)
 create mode 100644 docs/system/arm/b-l475e-iot01a.rst
 create mode 100644 hw/arm/b-l475e-iot01a.c
 create mode 100644 hw/arm/stm32l4x5_soc.c
 create mode 100644 include/hw/arm/stm32l4x5_soc.h

--=20
2.43.0

