Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1670577lff;
        Fri, 13 Dec 2019 18:46:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqxa7N+cYvDSgDO8oJ83eI714bSRR5ZBjyX2K/OyF3fLKNy7wR/adSg6/CLMQdAhjgytAdl9
X-Received: by 2002:aed:2344:: with SMTP id i4mr15629837qtc.136.1576291570779;
        Fri, 13 Dec 2019 18:46:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576291570; cv=none;
        d=google.com; s=arc-20160816;
        b=FlvWpuUt1ftk3CCxuOVGzKPruWbTDddHN0zvk26AnZwgiXxzD4WDFB+QAA/JmcYINA
         0MmE/NqCgIuCga9ChGOCCKBQhnjy7C4Fe5b5CIUGotoZfuUXqXtYFj9AuOidEk9JaT3U
         8hDBPzlDh6se+ahf1pXJ9AGy0A5AwYKsYi2yaUCVD8khraBamQT9p8Rq04G2huRRcX/m
         Wx+vtsNBIXnIFChJoiqHb1j4EtGUHmqDQHOpLpwPTHZN2v7LJFaqDsRR12xDheMj6A92
         GEnqJ7AfQAY4LEsimBaWbt5Sw7d+TGOSsIgKBQHjmGOIRUPkieiS8rfmxItVg8qBW6iq
         MdUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature
         :dkim-signature;
        bh=NrkT0Bf96hpTUP4A7dCfRMzsYsUhcjmd2DZMl2Q/4Cs=;
        b=GT/Faf9NWLgyJ0Vmche2V/w7jiyJLnDpl455sXcH4RN2kLLM23A5oPyTpVzqY5xgGL
         x+ZZRMWh4iaUXxpmaHhNjgC7fusaUJawRFjr3qSnAuE4J48wJB7XkFpVS3Jo3c4x1Iu2
         YVme88PNWPP0nZc/1ONmp/c13mD80wdeT0YC3lTC2ZHWilvV2RIRFSBJckZeohmbhMwd
         3YpzkJ08A0OP59Kmq39W2YQLt4wGyRtP3QUFaLHjRNUgKPKWdTTpdEjPetdOy6RjmHVa
         bBQswdfgxiV7WlxKla3VPlRPQkeArWMlLwIQ8KPGzLnCA4H3x/4BZDmvPySwO57bSqwn
         05Mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@alistair23.me header.s=fm2 header.b=MIw5L06f;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=pLtyoae1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v34si5638452qtb.211.2019.12.13.18.46.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2019 18:46:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@alistair23.me header.s=fm2 header.b=MIw5L06f;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=pLtyoae1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ifxRZ-0005K8-0P
	for alex.bennee@linaro.org; Fri, 13 Dec 2019 21:46:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55882)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair@alistair23.me>) id 1ifxPr-0004D3-JI
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 21:44:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair@alistair23.me>) id 1ifxPq-0000eJ-Ek
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 21:44:23 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:34275)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alistair@alistair23.me>)
 id 1ifxPn-0000Rh-5I; Fri, 13 Dec 2019 21:44:19 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 8D01D2243F;
 Fri, 13 Dec 2019 21:44:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 13 Dec 2019 21:44:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=NrkT0Bf96hpTUP4A7dCfRMzsYs
 Uhcjmd2DZMl2Q/4Cs=; b=MIw5L06fz+tyB9cNCuJpzFCPEjQ3Yn4ZEIONPSvMyy
 BIKT2VrFu5spkh0TAvN0etm1v7LAXQ6QgdoluzIPAkADs2rQzFGvRFwFaMQRifd0
 2xoIyZZUxm378sy5iSvomWuGx1gZc3qq+K3v2OtX5JyPIu9DqhKjzNXQ/p+gqoFR
 pMRLg2t7gptsXDZJWSsuTMMjzlDV/c9TBvTU1RGdKPBN9Wsvi0ByW0OIx4S+RWyz
 ajYwKuKZBN/G9k16JQCd5+lM7NhMPBBx6FsJgV3fV5at0Xv6bNt8SF2RxXZ0K+Sz
 yv6AOw4ToRv7ZI3EayITCbskF/zioY5dP3g1r0Hj6ONA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=NrkT0Bf96hpTUP4A7
 dCfRMzsYsUhcjmd2DZMl2Q/4Cs=; b=pLtyoae1dRqgjU3UzyxuQC94yw5HW5Ms4
 WTrzx3DrblYi32UlG469jVZty45S2mjoSpHyuij0Tv8A2cscfuaRuczCTuAJ5nXk
 JdOXksikNUA7pXhhkQt+R1asMMV5RWZ1Q/43+KfHvrMwEIvlwzE2AtstbGENaWtU
 5mv67ZgzhknNweKTxMM/uDvF5vbDgPmYwfB63TcOL+wEwaWCJn8v4YoVdB8XzWU8
 KbhIf0MT15y1pquNhVIKOURHZIoxB3j6CpgbIt235VRL3xSD/+pUVoh+Ux2uLnUN
 SNaErOqwbVHb+t7WTBk1VOG7LE25a6uIZVLNQ3ZiTNIRZMcEsdbIg==
X-ME-Sender: <xms:gEz0XbrE-2K4tjkmnKIky7DmeMC0FY6jJj5FiTWw_HpFAoInuDDE3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddttddggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhr
 segrlhhishhtrghirhdvfedrmhgvqeenucfkphepjeefrdelfedrkeegrddvtdeknecurf
 grrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhm
 vgenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:gEz0XXJ7S8Kxczt1a5UIZ4QtgCvf3QBjPAS5FI5h_9jAPrxPFNBL0w>
 <xmx:gEz0XV3UyVYwnzgHD42abuHBEsYuO4CIc6UkNz3ZK_JMDYtcERPTdg>
 <xmx:gEz0XWWsNsFHhMXTrzfShJtX5qYJ47ut5b26GMdfvWM3CbI3CIHU6g>
 <xmx:gEz0XWIJDSZFgCesLJ9B395pehVupF2-NA1YDLGUq6maQoeN2s5rSw>
Received: from alistair-xps-14z.alistair23.me
 (c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
 by mail.messagingengine.com (Postfix) with ESMTPA id 82A5680061;
 Fri, 13 Dec 2019 21:44:15 -0500 (EST)
From: Alistair Francis <alistair@alistair23.me>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v6 0/4]  Add the STM32F405 and Netduino Plus 2 machine
Date: Fri, 13 Dec 2019 18:44:14 -0800
Message-Id: <cover.1576227325.git.alistair@alistair23.me>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 66.111.4.29
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
Cc: alistair23@gmail.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FhTZimol7YI4

Now that the Arm-M4 CPU has been added to QEMU we can add the Netduino
Plus 2 machine. This is very similar to the STM32F205 and Netduino 2 SoC
and machine.

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
 hw/arm/Kconfig                     |  16 ++
 hw/arm/Makefile.objs               |   2 +
 hw/arm/netduinoplus2.c             |  52 +++++
 hw/arm/stm32f405_soc.c             | 302 +++++++++++++++++++++++++++++
 hw/misc/Kconfig                    |   6 +
 hw/misc/Makefile.objs              |   2 +
 hw/misc/stm32f4xx_exti.c           | 189 ++++++++++++++++++
 hw/misc/stm32f4xx_syscfg.c         | 171 ++++++++++++++++
 hw/misc/trace-events               |  11 ++
 include/hw/arm/stm32f405_soc.h     |  73 +++++++
 include/hw/misc/stm32f4xx_exti.h   |  60 ++++++
 include/hw/misc/stm32f4xx_syscfg.h |  61 ++++++
 14 files changed, 960 insertions(+)
 create mode 100644 hw/arm/netduinoplus2.c
 create mode 100644 hw/arm/stm32f405_soc.c
 create mode 100644 hw/misc/stm32f4xx_exti.c
 create mode 100644 hw/misc/stm32f4xx_syscfg.c
 create mode 100644 include/hw/arm/stm32f405_soc.h
 create mode 100644 include/hw/misc/stm32f4xx_exti.h
 create mode 100644 include/hw/misc/stm32f4xx_syscfg.h

-- 
2.24.0

