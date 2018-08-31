Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1083112wrd;
        Fri, 31 Aug 2018 15:11:39 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbCrL1tfGQqmtEWwwcsIGSocbAa9TwtBIb9Mr3qUY2neoDY2N6UCHz1i6TYUz2E/7t85/n5
X-Received: by 2002:a0c:fa4e:: with SMTP id k14-v6mr17223748qvo.35.1535753499574;
        Fri, 31 Aug 2018 15:11:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535753499; cv=none;
        d=google.com; s=arc-20160816;
        b=R0wkiIK6kAZh/3pTzg1W//gr7fVvCf+hm+h/v9H0Y07MNd29jMagOokfYeayByZN9E
         WBvCHyjJgMLFBb5crlf3SkD09MVT+kQh4ACT5RlN0wYfbdR+CAuyOV5Zqoldc2KHqiqn
         lT82b1Sc9ImQtEc+Qrm3GkpqRMzKnsPmHnhi8S9d+cIU1MHPoT/2NQboouLIVKBS+Rb2
         NsdA2o5y/s6m80k1SFJSjyrHXKIIOYe/RIgzneOlB4DzpIX/1HWLpXhGMt7s7zg+L+XB
         BC8VhOkoBHODQf5nWqsFvMgrCxHWqZHEfb8AuvE8fSKpCMkuFX/JRC4qVhFC8Jo7pQjA
         e6nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=WWFcMZUmUGvGnlYxzq9bu4z8gpsdBYJe2bnRqpgfzKY=;
        b=ucb+5/pjvyI7KWO4P5ohNtIljfbkU9XfNGsC3QMsnk7y82eVXX6TiGvA4X7C6WqzVa
         bHC8JuCgYyNBGo7WoyPD/d55x7EMBo4cCw+peNEP2nNBng0oLfdMlgbNtLN4Xq3KQUpe
         okJadrbG2oR1y/OstRrg08sNc4razK4e+iBPgo+Q21oJsUWW76uX7o7slLsOZL4aePDG
         msFvSBdU9TdewJcHtju1nECHZAXErCLUdzx7HG+Gz5GKRwGVDNvokRcobDkUVbZDfRmT
         FaxuPoqNYBfdg7i+5PyXSOmg4KN4fvdoh3ZLrgFgY7CVh3qNrnuHxVP5H/k8SUl8G7Hw
         GYcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZZVdhhR4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c24-v6si3245752qtm.92.2018.08.31.15.11.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Aug 2018 15:11:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZZVdhhR4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58644 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fvrdj-0005cC-1z
	for alex.bennee@linaro.org; Fri, 31 Aug 2018 18:11:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fvrbh-0004Z9-Oc
	for qemu-devel@nongnu.org; Fri, 31 Aug 2018 18:09:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fvrbd-0004fo-9o
	for qemu-devel@nongnu.org; Fri, 31 Aug 2018 18:09:33 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:44969)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fvrbc-0004dU-UM; Fri, 31 Aug 2018 18:09:29 -0400
Received: by mail-pl1-x644.google.com with SMTP id ba4-v6so6028398plb.11;
	Fri, 31 Aug 2018 15:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=WWFcMZUmUGvGnlYxzq9bu4z8gpsdBYJe2bnRqpgfzKY=;
	b=ZZVdhhR4gmL60lkYGBa79+igC+1wDIh/O/HVozp55YQB8zd87z5CINfNHU3INIRwrs
	lEhCtCnnhDIFavq5zugNny5BzKQFxdlCmqe2IP93tzT0i2j7dX2PN1duLsZkbsvTgPLg
	z9ZZpwt0iAD/kCTkSMPTC3zwP93uMa61EWVbSwM1jLrJ48f8WrXZhyBrGUI5hl1ueAij
	AmxrqBu0dMCFNFUyB8n2c47In0g1qWwkzO9B4096ZSwO82nZmq+e1egSlyEUiV9/3WOD
	UeWNsOUt9/UvoSwMeQ+y8gMvffhVplhYBmtDsoQbhvtw3Jqw0TQ/wEEMjc94m/BMz/dl
	r5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=WWFcMZUmUGvGnlYxzq9bu4z8gpsdBYJe2bnRqpgfzKY=;
	b=mjeAp7atyR8gxAimz9zgKto71/CHHvLT4tCRl0dvyWujcE95i+QvgIlByNh8SvKnag
	nFQ2LMIsq2gcMylhbi3hSdpluHPN7TwV7amoQOqy7DmcH0js47lj30XmXAJrhXDyAOfp
	K5szHYB+S2xJkDvP05LpMWWO90LHHR/XqJoSFYkU+e9Rms2DVKKjNyDgzHp7R0XmfMa8
	GnZhOU1fY+nc+5b+ZHEyY6yDUDHPgl8YIV1kVimlKtweYKJ07DFLaAZ1K6y1sUPfgbV2
	O58sp/EfLTWPk4Bawqg3tCSIfvpYg4z3+x6ZvNxPqVhqjElTfyE9OTL4Ky85rTKp3Nz3
	Zuxg==
X-Gm-Message-State: APzg51CWPvCh4pn32MBhQiifGlT9orv5LXAC4Pu2/5q6dAHUE+jZog/N
	3Ppo/S+Ys/+PqoiRx6w5R1M=
X-Received: by 2002:a17:902:e088:: with SMTP id
	cb8-v6mr17354104plb.189.1535753367456; 
	Fri, 31 Aug 2018 15:09:27 -0700 (PDT)
Received: from aurora.jms.id.au ([72.28.92.217])
	by smtp.gmail.com with ESMTPSA id
	b21-v6sm21632173pfe.148.2018.08.31.15.09.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 31 Aug 2018 15:09:26 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Fri, 31 Aug 2018 15:09:25 -0700
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Aug 2018 15:09:17 -0700
Message-Id: <20180831220920.27113-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-devel] [PATCH v6 0/3] arm: Add nRF51 SoC and micro:bit machine
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UHtXQdP6UF82

v6: Rework based on Peter's review
v5: Change back to ARMv7M from ARMMProfile
v4: Fix number of IRQs
v3: Rebase on Stefan's cortex-m0 series
v2: Addresses review from Peter and Stefan

This short series implements a minimal definition of the Nordic
Semiconductor nRF51, a Cortex-M0 ARM SoC, and the BBC micro:bit, a
machine that will use this SoC.

Joel Stanley (3):
  MAINTAINERS: Add NRF51 entry
  arm: Add Nordic Semiconductor nRF51 SoC
  arm: Add BBC micro:bit machine

 MAINTAINERS                     |   8 ++
 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/microbit.c               |  67 ++++++++++++++++
 hw/arm/nrf51_soc.c              | 130 ++++++++++++++++++++++++++++++++
 include/hw/arm/nrf51_soc.h      |  41 ++++++++++
 6 files changed, 248 insertions(+)
 create mode 100644 hw/arm/microbit.c
 create mode 100644 hw/arm/nrf51_soc.c
 create mode 100644 include/hw/arm/nrf51_soc.h

-- 
2.17.1

