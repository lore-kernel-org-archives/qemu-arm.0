Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4449540wre;
        Wed, 30 May 2018 00:50:29 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIjWwFKdQfQoMB0MYNvQ4BjUfOGqLAzbic4HQPmmMhOvE+g5ELBBp7Jf98Fn9HYT42ZFxPm
X-Received: by 2002:ac8:2e25:: with SMTP id r34-v6mr1430097qta.341.1527666629142;
        Wed, 30 May 2018 00:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527666629; cv=none;
        d=google.com; s=arc-20160816;
        b=dRzVLe7SirEpcqI+JQEg57KxCFvSqq9sEGKGm8ooWAro6x73OT3s+MHtHlb8tEiumT
         MgTfUf2cd7VuRBWi/7nGbtjTnAlXZXe/fUBRHahWMhT79tDpukIEonO0wNt4ez59XWtq
         CH9KdwiMIqye6RlJ8rmx4MEt7uSsojFTu5GOs3YU+CXUy2oYWhsDvgJcdVV+nLEOYSgA
         9RmPFMHgU3+0Rdy8A9fAm6yvrSNh8tG1xANu2DU+Yv6f29w6JSrJrmnhwvwnudmD86tb
         G26RcTLZA1xj/7aca7+lwkzGvqN7K/ShczaZgRzpqaUIkYRSXoi9xLEEX71zgljqMzoq
         GlhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=uKZbM4FRbmm/mxPghBn5dJHkkpYVxSadHm6f7N/zo3Q=;
        b=t3xFSYqxkgMqO8P9VlhBdBCFx3vo6NSi9hPAB4xnYJXVee8e8wDR7Gw3gJOzI10Q4c
         bpKMpkSmds//cq48JlFP+C8ejCIspulVtreloqzl3KcAI/p6SX08EMUauH6Rx4cnHVXb
         G8eBcp5nD+gZkbHxHWcBbvKvAkHqaNbUnuDByUVdHcpG8z3lMwNrewFnZQ5yfAxSsIz5
         L9iHYXtlasj/DuHXFSSxh+6KURIchshQw5Yt0cnTHP0Wq5yAI4+R3TLPpOYNRqjp/izI
         et2fUeWM7RgGpxap/q/Seh/YNEoCMSFQv/pkEAFxIEHPMcMCD8r/fmdnzE3tS5V+2s+Z
         s9DA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c20-v6si1283431qvi.235.2018.05.30.00.50.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 00:50:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36844 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNvsK-00061o-KU
	for alex.bennee@linaro.org; Wed, 30 May 2018 03:50:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNvsA-00060Z-UQ
	for qemu-arm@nongnu.org; Wed, 30 May 2018 03:50:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNvs6-00018j-NO
	for qemu-arm@nongnu.org; Wed, 30 May 2018 03:50:18 -0400
Received: from 4.mo2.mail-out.ovh.net ([87.98.172.75]:36772)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNvs6-00018E-H0
	for qemu-arm@nongnu.org; Wed, 30 May 2018 03:50:14 -0400
Received: from player770.ha.ovh.net (unknown [10.109.105.101])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 94DCF13A40A
	for <qemu-arm@nongnu.org>; Wed, 30 May 2018 09:50:12 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player770.ha.ovh.net (Postfix) with ESMTPSA id 6B2A5C0078;
	Wed, 30 May 2018 09:50:05 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 May 2018 09:49:58 +0200
Message-Id: <20180530075002.4618-1-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6319394703731428113
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheelgdduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.172.75
Subject: [Qemu-arm] [PATCH 0/4] aspeed: add MMIO exec support to the FMC
 controller
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wm8ojjRIH+N/

Hello,

When MMIO execution support is active, these changes let the Aspeed
SoC machine boot directly from CE0. As there is still some
issues, the feature is disabled by default and should be activated
with :

	-global driver=3Daspeed.smc,property=3Dmmio-exec,value=3Dtrue

Thanks,

C.

C=C3=A9dric Le Goater (4):
  aspeed/smc: fix HW strapping
  aspeed/smc: rename aspeed_smc_flash_send_addr() to
    aspeed_smc_flash_setup()
  aspeed/smc: add a new memory region dedicated to MMIO execution
  hw/arm/aspeed: boot from the FMC CE0 flash module

 include/hw/ssi/aspeed_smc.h |   7 ++
 hw/arm/aspeed.c             |  41 +++++++----
 hw/ssi/aspeed_smc.c         | 161 +++++++++++++++++++++++++++++++++++++-=
------
 3 files changed, 172 insertions(+), 37 deletions(-)

--=20
2.13.6

