Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1761320lff;
        Wed, 18 Dec 2019 21:22:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqxXk5WTw8urOJHw3fFVR80s13vG4Zo/KGeC1U5aZW1wFxC0g1sIZSZVPSPlAKT7yjrJgmwI
X-Received: by 2002:ac8:2b86:: with SMTP id m6mr5532594qtm.190.1576732976233;
        Wed, 18 Dec 2019 21:22:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576732976; cv=none;
        d=google.com; s=arc-20160816;
        b=TtgWuUVnx6EJjwi16AWv6yeI2ay7YnQBjMooScNtfV0B4gTJRQJi5XKb0e3PDuQ7b7
         ffcGxG32Lj2xnOHfZGO/vWcVBYvc0cXEqb00Wp2PoAAX2nw2X/45hDBD4OFKXAB0xwVg
         GAkG4ODI3THVZ2t8MrOsSASu375UwTOUEh7GF+8eFuVslcz09HeFe8mA7oEkvqTy2Ktv
         Mk+mxOf0XG55YXLPLU8nb2XwJgPGFa+VWt/2UtVZ2uvZPP8WggAsOJjCarACJKEmoprU
         DbKZclyTyWx1Cp9kDf/4GKWiXruMeLWOBfp5OSm99Iw+Hcm1VGlcO6cD18Xbiy6DIxks
         Br2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature
         :dkim-signature;
        bh=zuKq+gd9kj0a7Z5OXk24TRnL90uej/6n5NSnAPMTh4c=;
        b=ppk91HyCLDYM8DR9ijK0tLkw3Z4zKkhTEy/DPq8vpjB+l17fw5gE7RcpRCv7uaonOb
         Z0b+JsUvcuy0YrzC2+krch2zqMbUi4o0L9qyYZyekHLUqUG6e0CW0KcbV7cx+XuVgUAP
         zBII2rwpQn1qdKVZlZhRlxipTOTNtwjfdU98I9vwPX9ePyolFDqr9jV/MLayuyVILr0x
         rqDVaAp4fpXRWNLm9g36BZ8rnq43WQ1DNiDUyyaBJfKi2WDiTyficQRpcYwBrrpk3H6O
         4mLqe7x8Zoj8dNlHULVoHkvhJvI4G+kd4RIsCOVqMEwZkMgNHxaGj2j9MLuy+ZYcpP/b
         5TaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@alistair23.me header.s=fm2 header.b=1dfiysmA;
       dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=r3gMZ47k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21si2570978qtm.404.2019.12.18.21.22.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2019 21:22:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@alistair23.me header.s=fm2 header.b=1dfiysmA;
       dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=r3gMZ47k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihoH1-0004R9-Mg
	for alex.bennee@linaro.org; Thu, 19 Dec 2019 00:22:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55366)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair@alistair23.me>) id 1ihoGt-0004R3-Hu
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 00:22:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair@alistair23.me>) id 1ihoGs-00026V-GF
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 00:22:47 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:34549)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alistair@alistair23.me>)
 id 1ihoGr-0001qh-W4; Thu, 19 Dec 2019 00:22:46 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 484BA48A;
 Thu, 19 Dec 2019 00:22:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 19 Dec 2019 00:22:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=zuKq+gd9kj0a7Z5OXk24TRnL90
 uej/6n5NSnAPMTh4c=; b=1dfiysmAdVuiW+H66a6TqaGgwVWjvabLUNhHHumdEb
 /9ayqvF2MNj6IBKpPYPv0rc/NhVPsGDkFCJmGLxNsdgZkqUdHTRFbNHupccMKlsu
 KHl9N4vp0sjkSjLcABgJ0neOsUiD6SVaLbMJzo9AwkyInY5RaB6IbEUUx6VYhYDI
 dQaegEovgEtllR6NDETrnT1s682eG7dhpbCfk6XQ8bZmcF+mBzKJ/9baF6/JWKS0
 bdQUnxF5RNfwFJiRUThrbP8A2gRCjcum5rWi6O/1mYt737rB5HIL2h/Rgpq38Sm4
 5pARGrI3KfHxe+Fl5mvW3aQMTQfpjQSv7j/yypT8wcMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=zuKq+gd9kj0a7Z5OX
 k24TRnL90uej/6n5NSnAPMTh4c=; b=r3gMZ47kv3tQrmEtcnaNIYTYgmhp2ulM2
 IHKyA5K1lU5Cf8coVGSIRfhmM461VKMhJwFqXE3wy5JAirp0ljJ55tcY3sdxJyWN
 02uhoNIi/Exep7/8VYiOEzW9NKhVlo94SZwen/4DsWJZrpt0r1cmYqDcqAEadRby
 TvSM/sV9QZw1iV/S0QZkEEXzY81ADoTKG71rtJP7YclHsa77W4Amp9PCpf+jsR3S
 9Aum2jerrZeysMvZN7tcC/4wrPRcrL9jMy1LGehMjLOCBcxmcyAtQCV1jURMstdW
 ZbKMmMjHcEQ+v0YMhu7E/aB47OYmLCSen6/mQkuMyLQdM0VC/F3TQ==
X-ME-Sender: <xms:Ign7XXIyXBQwFZ_NELCMiIuuuCdmqBqJwKJ7OdwIR-Y9PUUOqoTdfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddutddgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhr
 segrlhhishhtrghirhdvfedrmhgvqeenucfkphepjeefrdelfedrkeegrddvtdeknecurf
 grrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhm
 vgenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:Ign7Xfbb0H71SLmHnMVVMJPZZw4MSW54M2AR3c6nKCCKJT7fjncXgQ>
 <xmx:Ign7XauY_4CcWk8R8aW7BuggLo1PxECHbVjx1Od4Ba0MG2rgAb1goQ>
 <xmx:Ign7XUusoKZdNYGg89sNuBSXqgqhjg8PV1qe5jC9_uxzMwcZ-ur3QQ>
 <xmx:Ign7XcYUJC6UGH0rvLE3yVQei7mhyNSHEOZgac_KA6RiQ-TBLQoNmg>
Received: from alistair-xps-14z.alistair23.me
 (c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
 by mail.messagingengine.com (Postfix) with ESMTPA id AAF028005C;
 Thu, 19 Dec 2019 00:22:41 -0500 (EST)
From: Alistair Francis <alistair@alistair23.me>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 philmd@redhat.com
Subject: [PATCH v7 0/4]  Add the STM32F405 and Netduino Plus 2 machine
Date: Wed, 18 Dec 2019 21:22:40 -0800
Message-Id: <cover.1576658572.git.alistair@alistair23.me>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 64.147.123.20
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
Cc: alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PCTmeMFDMlPo

Now that the Arm-M4 CPU has been added to QEMU we can add the Netduino
Plus 2 machine. This is very similar to the STM32F205 and Netduino 2 SoC
and machine.

v7:
 - Fix the EXTI IRQ
 - Remove the duplicate configs
v6:
 - Remove machine specific reset code
 - Rebase on master
v5:
 - Fix checkpatch failures
 - Add mising includes
v4:
 - Rebase on master
v3:
 - Remove custom reset handler
 - Add init-entry and init-sp properties
 - Rebase on master (including Kconfig changes)
v2:
 - Reorder patchset
 - Return the kernel entry point instead of using a pointer
 - Address Peter's comments

Alistair Francis (4):
  hw/misc: Add the STM32F4xx Sysconfig device
  hw/misc: Add the STM32F4xx EXTI device
  hw/arm: Add the STM32F4xx SoC
  hw/arm: Add the Netduino Plus 2

 MAINTAINERS                        |  14 ++
 default-configs/arm-softmmu.mak    |   1 +
 hw/arm/Kconfig                     |  10 +
 hw/arm/Makefile.objs               |   2 +
 hw/arm/netduinoplus2.c             |  52 +++++
 hw/arm/stm32f405_soc.c             | 302 +++++++++++++++++++++++++++++
 hw/misc/Kconfig                    |   6 +
 hw/misc/Makefile.objs              |   2 +
 hw/misc/stm32f4xx_exti.c           | 188 ++++++++++++++++++
 hw/misc/stm32f4xx_syscfg.c         | 171 ++++++++++++++++
 hw/misc/trace-events               |  11 ++
 include/hw/arm/stm32f405_soc.h     |  73 +++++++
 include/hw/misc/stm32f4xx_exti.h   |  60 ++++++
 include/hw/misc/stm32f4xx_syscfg.h |  61 ++++++
 14 files changed, 953 insertions(+)
 create mode 100644 hw/arm/netduinoplus2.c
 create mode 100644 hw/arm/stm32f405_soc.c
 create mode 100644 hw/misc/stm32f4xx_exti.c
 create mode 100644 hw/misc/stm32f4xx_syscfg.c
 create mode 100644 include/hw/arm/stm32f405_soc.h
 create mode 100644 include/hw/misc/stm32f4xx_exti.h
 create mode 100644 include/hw/misc/stm32f4xx_syscfg.h

-- 
2.24.0

