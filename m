Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2295768ejo;
        Mon, 8 Jan 2024 06:00:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPP5E43Ts5T/Y/bYkeV0Ekj7Jp2IV2cK2wYlIAXoA0w3Yk+3Zduu7pGJgy8hKKiWWWrjh5
X-Received: by 2002:a05:6102:94a:b0:467:d508:515a with SMTP id a10-20020a056102094a00b00467d508515amr662927vsi.19.1704722436117;
        Mon, 08 Jan 2024 06:00:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704722436; cv=none;
        d=google.com; s=arc-20160816;
        b=DyxdPrqCMhT30q2QQVLkcwZUYsn3UnmO9eJ8QyUduxVGn7rWXK/dFszSwZo8XCHJVA
         2K3QcSyQNsiRT/LHMbYtnug1Yu9lFtImubKZa9tkVbwYE2yftg2UIkla9y5tei1AicjR
         VcZTnH0YaoaOs6E8fchE65kwyogKfnktNBSH17l56LSDAKPLyxgyUaQIQ7xr/UcuQt77
         evMMoyeokZqLNGq1oqMh14sKBIfKjg1AoZpeneqJDk4UOmbrIU2ygHUpwkRXt7BpZtx0
         fK9gRmmc+FG4zQPyD2c6JNFQ+KtUDeYB2p7IcMFXNQ9WaiRLzq1QOrKbLLem3O5ypAXJ
         72gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=B0/YhQWcQBx7EmShbzqiqD9jFUU6McRZiKkR9+V2i9s=;
        fh=Qq+h7cUB2O1Q1Im6X2pGsFTH+Cp+sJOBIbQeU5PbNrc=;
        b=eiacxTUOE5tyn8hVP9OR0QjM3TfMzJBM18GjmQf3/u+GsOyD2Pt37jT7JysyU0i4lI
         DCvhaIYpmPAf+rdWN+80RdJrcbQb8qYU5y87ZLCoOEUEUw4wpGtcEprtGDno3wRLhWiK
         PRgdtnwnWhz6CIQ3N09CGjvBz+RvVJCDXkR81W0WC3ne77yciUywTCKcyErfsYtNPWxD
         BcfYw9L0e4sxTrdORj3LLfoIGi9p6ozd+AGC9kYU6JUaUSoLXw9sdw0/mPGCKwsVZcYk
         9SZbyFgfkGvrmYwMCARlV0Gke007BuoHzSHxZMmQqLYsRUvR507SBKXwzjc1QIMAcJse
         Zd4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=4I3ED294;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u22-20020a67f656000000b00466e356dd09si569850vso.521.2024.01.08.06.00.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 06:00:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=4I3ED294;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMq9p-0002r2-Bv; Mon, 08 Jan 2024 08:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rMq9n-0002po-Gc; Mon, 08 Jan 2024 08:59:11 -0500
Received: from zproxy2.enst.fr ([137.194.2.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rMq9i-00053s-LJ; Mon, 08 Jan 2024 08:59:11 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy2.enst.fr (Postfix) with ESMTP id 6EB3C806EB;
 Mon,  8 Jan 2024 14:58:59 +0100 (CET)
Received: from zproxy2.enst.fr ([IPv6:::1])
 by localhost (zproxy2.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id AGI5SoaeByTy; Mon,  8 Jan 2024 14:58:58 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy2.enst.fr (Postfix) with ESMTP id 9294780705;
 Mon,  8 Jan 2024 14:58:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy2.enst.fr 9294780705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1704722338;
 bh=B0/YhQWcQBx7EmShbzqiqD9jFUU6McRZiKkR9+V2i9s=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=4I3ED294YGPMOfVz/96iJJDA94pPb2ytjD4ZQdUw9PurnS4smSwRDNVn2QXFHki3g
 4KCkEhY1azW+jz3XWzirYQND29XW4CySUj3/1aOnhkvtPq2/8QC5D6VgWg31l75652
 3Cct5okQRMkjcWKri2VPER7lk3nCJV5ALR/mN2JE=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy2.enst.fr ([IPv6:::1])
 by localhost (zproxy2.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id en5WBTNRUayr; Mon,  8 Jan 2024 14:58:58 +0100 (CET)
Received: from inesv-Inspiron-3501.enst.fr (unknown
 [IPv6:2a04:8ec0:0:240:f2a4:b1b:1eac:479c])
 by zproxy2.enst.fr (Postfix) with ESMTPSA id 4D0B5806EB;
 Mon,  8 Jan 2024 14:58:58 +0100 (CET)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Samuel Tardieu <sam@rfc1149.net>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 0/2] Add minimal support for the B-L475E-IOT01A board
Date: Mon,  8 Jan 2024 14:58:27 +0100
Message-ID: <20240108135849.351719-1-ines.varhol@telecom-paris.fr>
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
X-TUID: bfZvtt2haxRV

This patch adds a new STM32L4x5 SoC, it is necessary to add support for
the B-L475E-IOT01A board.
The implementation is derived from the STM32F405 SoC and NetduinoPlus2
board.
The implementation contains no peripherals, only memory regions are
implemented.

Changes from v5 to v6:
- in `stm32l4x5_soc.c`: use boolean returned by `memory_region_init_rom()=
`
and `memory_region_init_ram()` instead of checking `errp`

Changes from v4 to v5:
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
 hw/arm/stm32l4x5_soc.c                  | 265 ++++++++++++++++++++++++
 include/hw/arm/stm32l4x5_soc.h          |  57 +++++
 10 files changed, 474 insertions(+), 2 deletions(-)
 create mode 100644 docs/system/arm/b-l475e-iot01a.rst
 create mode 100644 hw/arm/b-l475e-iot01a.c
 create mode 100644 hw/arm/stm32l4x5_soc.c
 create mode 100644 include/hw/arm/stm32l4x5_soc.h

--=20
2.43.0

