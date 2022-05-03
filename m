Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1125691lfj;
        Mon, 2 May 2022 19:28:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpMDbvRV76liayYNAKZ3NIX6t+OSX8MZO6DNhJhswPAScekS+6YtsNAzzF82b/sqD5SRF9
X-Received: by 2002:a05:6214:3006:b0:444:2fa9:9849 with SMTP id ke6-20020a056214300600b004442fa99849mr12152838qvb.101.1651544900435;
        Mon, 02 May 2022 19:28:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651544900; cv=none;
        d=google.com; s=arc-20160816;
        b=O8iY0DCe/mOD9l1ED01Mf5g3XY+fAPivOelH2/iXdsQC6PfoZgOecUqQcogTlZ4WVY
         m8ByGo2ay3w0n9Lmv6wxiwKirN88eqkFDf48JhIi57F+RLsVbeNmVqbinKvkCBx9H4Sb
         B7Yvr1k0Zv0OQ9WopPOUz45cv5HjwFdn8TDpGRll+3iJrJZpPAExg2goC8pU6IHMiSud
         Rja963jR21F6xNMfsNNf+qMAqqWMF6r1HrPjb8n1MRBn1ZeNRIj/3XV45pc0zLpVYFrK
         Hzf129CPMCiVklhUvq+YAT2oZogYLrB3SMGj/QMiYzMEg7E/02ItQGOcQYTDSiEbDj5v
         2aiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:cc:to:from;
        bh=G4KG4L3569ruMGPJXECCANfjLKTX3rvLYk8xjGN9Rwg=;
        b=tQ4I/XYzm3a+So51zLMG8EtkPryuelkr9ItuXJaEg5DwzxQ4tBzK909Gej9Y+x42iD
         u9iMB4GjUFs5HqBBaUB63yfLJG8Qyy6DMe5KFVx+MJg2oFTVbcqX6N47VjdVR8cpvMI7
         zlsBJ52ALABRY47TVqEfdsIHY0bliWcZeEQY3E6JJgPhhZvRv2QVQ3D7h42RwHDuXPvy
         BBEIuLDxdN8j1ixfTi6NWiWFevE2hs2E774iDkdBUuJGeKls9FlucPMEbS4fFtddj/yG
         V7ZMIAiSJYWBGymd53DSztKM8ZfR0jBI1DOdNbgj8luhx8ANtE8hVxPIW54i9iXvEUAs
         GIrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p139-20020a37a691000000b0069f9e8cc370si5842720qke.367.2022.05.02.19.28.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 May 2022 19:28:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nliGx-0005pb-V2
	for alex.bennee@linaro.org; Mon, 02 May 2022 22:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nliGn-0005kY-4B; Mon, 02 May 2022 22:28:09 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:36817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nliGl-0007Ph-AM; Mon, 02 May 2022 22:28:08 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 2432ENFG014087;
 Tue, 3 May 2022 10:14:23 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.100) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 May
 2022 10:27:13 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
CC: <steven_lee@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <jamin_lin@aspeedtech.com>
Subject: [PATCH v1 0/1] aspeed/hace: Support AST1030 HACE
Date: Tue, 3 May 2022 10:27:09 +0800
Message-ID: <20220503022710.4119-1-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.100]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2432ENFG014087
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=steven_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N6rpE9GvEgka

Per ast1030_v7.pdf, AST1030 HACE engine is identical to AST2600's HACE
engine.

Please help to review.

Thanks,
Steven

Based-on: 20220426021120.28255-3-steven_lee@aspeedtech.com
([v6,2/3] aspeed/hace: Support AST2600 HACE)

Steven Lee (1):
  aspeed/hace: Support AST1030 HACE

 hw/misc/aspeed_hace.c         | 20 ++++++++++++++++++++
 include/hw/misc/aspeed_hace.h |  2 ++
 2 files changed, 22 insertions(+)

-- 
2.17.1

