Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3987825lfp;
        Mon, 4 Oct 2021 08:51:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwj6tpbLoWodmxliHw3mRuwjO+ZWcoi1BC9Q4pqeegqgM17xhhfLK4+l74fWYxcl8ULgQd6
X-Received: by 2002:ae9:e897:: with SMTP id a145mr10505366qkg.297.1633362692478;
        Mon, 04 Oct 2021 08:51:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633362692; cv=none;
        d=google.com; s=arc-20160816;
        b=xFU/4khXoRKXkYRMclTKeIC+CUgaUqOWx8emxCNAS2uSNRH7P03zwowXtc/fp0+IcO
         bCcbA/H4TiVcFG9kMWPt7zbSANzNQaFojOsA2JoJnr1P7ZcQ75N7UO14rWf/FvuQqqir
         x7y0ZoT0Ba4lkzlTNysxXnSmhPcf7+aXHA3jMapP9gRVY5PjN4Mq7vkVgJXAvoXXJe8F
         y6QgrqjHRVuMTfJtUxJ6zAg//5OvcmVCdXk1lkkdP9lr4vZ/QSrfw66AOJRjNjSPU0Bs
         FGhFAnLgF8qLl2nYvGK1riaW4xO3q2dpfC2liMij72W63I+Pp3rs35Z1d62zRyvPruhu
         6VUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=Zt1CZN8GKp0F5OJm8XtQVToB3ZtiI1TIP69orl50sQg=;
        b=nLy/H+/DGSZOocunq3qsIeidgHilrkLflYFS2e84s/B3GzXYgUiue3UTwKvFYXOZZb
         inf8pYwrqQft+aVG7YlBq+up2yzVx9PP2FW1qFRBkoIslkqftZAjcSU3xAaLG+8pTW52
         Gesj7k7YZwFju+XB+76oxqEBsQNGF2Sxam/tOjBC9ERGecqPNGmbcG3FAd8IZ3bPq2KC
         nms9Vzhi3QbJcqnnGAxAcjj36DBjY5Se7/E+ysL1cO/oAHLnzkq1vfoFV0CPeaxqnb5S
         KK3rGrflaJKnIb0VMkUlMYtcA1wjwoyknm+dSps+5NY7y/9H3voP46lVbM8HVhZ6c8Cs
         bKWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17si10199703qtb.311.2021.10.04.08.51.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Oct 2021 08:51:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXQFX-0006Uo-RT
	for alex.bennee@linaro.org; Mon, 04 Oct 2021 11:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXQB0-0001B9-UJ
 for qemu-arm@nongnu.org; Mon, 04 Oct 2021 11:46:50 -0400
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:39439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXQAy-0001CZ-1u
 for qemu-arm@nongnu.org; Mon, 04 Oct 2021 11:46:50 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.17])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id D414321ABC;
 Mon,  4 Oct 2021 15:46:36 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 4 Oct
 2021 17:46:36 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002a91b2e3d-af22-4da8-8225-9874c57d7b9a,
 32296DFA07ABF8CFA5B750E6C0B5925FEAD98EF4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 0/4] aspeed/smc: Improve support for the alternate boot
 function
Date: Mon, 4 Oct 2021 17:46:31 +0200
Message-ID: <20211004154635.394258-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b76390c4-a03e-4caf-a19e-0f37c5433b23
X-Ovh-Tracer-Id: 2439825100510563110
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudelvddgledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedvuedtvdeikeekuefhkedujeejgffggffhtefglefgveevfeeghfdvgedtleevnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mBbaCU4oZwqt

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


Cédric Le Goater (4):
  aspeed/wdt: Add trace events
  aspeed/smc: Dump address offset in trace events
  aspeed/wdt: Add an alias for the MMIO region
  aspeed/smc: Improve support for the alternate boot function

 include/hw/ssi/aspeed_smc.h      |  3 ++
 include/hw/watchdog/wdt_aspeed.h |  1 +
 hw/arm/aspeed_ast2600.c          |  2 +
 hw/ssi/aspeed_smc.c              | 84 ++++++++++++++++++++++++++++++--
 hw/watchdog/wdt_aspeed.c         | 20 ++++++--
 hw/ssi/trace-events              |  1 +
 hw/watchdog/trace-events         |  4 ++
 7 files changed, 107 insertions(+), 8 deletions(-)

-- 
2.31.1

