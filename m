Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3014129lfc;
        Mon, 18 Oct 2021 06:34:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6NDEjKvN6JD7BknxWaOuHkRn1hpryEPI9CpLPt/0vDn0YMCB8lJGRsyzGaYbRhQtE/aEV
X-Received: by 2002:a1f:264a:: with SMTP id m71mr24683432vkm.5.1634564042947;
        Mon, 18 Oct 2021 06:34:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634564042; cv=none;
        d=google.com; s=arc-20160816;
        b=JbzeauyJbFegrvqMYMihdizjozoMjqkoRN3KtmgfCoLGrUtYEkJZ4FZYNtwG39Lsll
         2qMQY5Fg3E45dkSIME1eD4ssA6e0RuCom/xxJ2O1dPCpr2VCbmY/8nZTIhIjPn+fAp8l
         flcb6IZ7WEqLSm8dbsaka1fg0HEMxtgqU1cC7xgUbTBa68ZBJgtu/I+1FmLFvipe697S
         qV+nYUPUA+SEFQBk1rtLdjHDGyJvqvS5/SkORjkEyrX9r0Rudyeu/Q6I8lHbFPCzLVks
         jtPTMRRrmST1BgcmqPYs/w88SYNGdSf8sFJpH/AANBzNoGZAC86d0NdKJA9z9/7R7x9a
         WOlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=aRrPCFqbBinI8r5Z5NWLuOrn/HPPoQZ8c6+zMAQRqy0=;
        b=MJHX1Krp79Q+LYrbIPiponIeMAOHHDKtowp/RjPZyKgdgppVcRYuD2Xwguup1WQd9M
         L/AlVkSqGSKj9FPl5pWoH6nAW9qI2SZ0EeU8NrqSCvZGlolXgpj9wQqeVSVr3gY97j3C
         VRZOJ3VauofopIUB3D4geVXoidEP0hhVqiO4TG5Vq7vE6PSicmjLDF7MzfLePlYk1/oU
         fIDWWKJ7SfyiFToXaq6d5fcpQrbgvo5rzXei42xEYwlgezxu4BmflaZiAzUvY2d7cgxI
         4fOBROI3o+E5IKVf8p5JEmjvmRnEq7S0XwpvBCawq06kKzNaIfTpa1w1KteO6tKHgsli
         QOFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22si8542584vsu.215.2021.10.18.06.34.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Oct 2021 06:34:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mcSmA-0006Fv-95
	for alex.bennee@linaro.org; Mon, 18 Oct 2021 09:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcSeg-0002ui-9p
 for qemu-arm@nongnu.org; Mon, 18 Oct 2021 09:26:19 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:60585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcSec-0006BF-Qj
 for qemu-arm@nongnu.org; Mon, 18 Oct 2021 09:26:18 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.252])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 6D08AC5612F8;
 Mon, 18 Oct 2021 15:26:11 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 15:26:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0012a4832d6-a55c-4b98-942b-0fdd0e9ce36f,
 F07B6F3C357710E32BAB16EB0BBFA04B60198819) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 0/5] aspeed/smc: Improve support for the alternate boot
 function
Date: Mon, 18 Oct 2021 15:26:04 +0200
Message-ID: <20211018132609.160008-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d9398f34-3763-46d6-b254-b05ae8708909
X-Ovh-Tracer-Id: 8499136925199272809
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvtddgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedvuedtvdeikeekuefhkedujeejgffggffhtefglefgveevfeeghfdvgedtleevnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jOXtAlreQcad

Hello,

The Aspeed SoCs have a dual boot function for firmware fail-over
recovery. The system auto-reboots from the second flash if the main
flash does not boot successfully within a certain amount of time. This
function is called alternate boot (ABR) in the FMC controllers.

On the AST2600, the ABR registers controlling the 2nd watchdog timer
were moved from the watchdog register to the FMC controller. To
control WDT2 through the FMC model register set, this series creates a
local address space on top of WDT2 memory region.

To test on the fuji-bmc machine, run :

    devmem 0x1e620064
    devmem 0x1e78504C 

    devmem 0x1e620064 32 0xffffffff
    devmem 0x1e620064
    devmem 0x1e78504C
    
Thanks

C.

Changes since v2:

 - introduce a container region for the WDT2 register address space
 - introduce a container region for the flash mmio address space

Cédric Le Goater (5):
  aspeed/wdt: Introduce a container for the MMIO region
  aspeed: Initialize the watchdog device models before the FMC models
  aspeed/smc: Improve support for the alternate boot function
  aspeed/smc: Use a container for the flash mmio address space
  speed/sdhci: Add trace events

 include/hw/ssi/aspeed_smc.h      |  5 +-
 include/hw/watchdog/wdt_aspeed.h |  1 +
 hw/arm/aspeed_ast2600.c          | 38 +++++++-------
 hw/arm/aspeed_soc.c              | 36 ++++++-------
 hw/sd/aspeed_sdhci.c             |  5 ++
 hw/ssi/aspeed_smc.c              | 89 +++++++++++++++++++++++++++++---
 hw/watchdog/wdt_aspeed.c         |  6 ++-
 hw/sd/trace-events               |  4 ++
 hw/ssi/trace-events              |  1 +
 9 files changed, 141 insertions(+), 44 deletions(-)

-- 
2.31.1

