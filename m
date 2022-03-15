Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2691649lfo;
        Tue, 15 Mar 2022 00:59:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvYOKIhByIu9eO2cTkEZyrl7t0wBSu5RNp0M96Y5sLMrdvUk8sJ58uhJC9MQt0336ZWxS9
X-Received: by 2002:a37:9e43:0:b0:67b:312d:50e0 with SMTP id h64-20020a379e43000000b0067b312d50e0mr17574313qke.549.1647331145091;
        Tue, 15 Mar 2022 00:59:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647331145; cv=none;
        d=google.com; s=arc-20160816;
        b=pkD9G1U+XIhjo2W4hQei3ZLowiR5z/4oeHhLnuYjxCsxNNV3JKIPNy1kAhft8v4u8D
         5KMj87muzXnKsMda419ZUDUkctB7aB3m3MKHBEhZOoU5dNhU8YY3ccI/13JA1KwxP5vC
         hx9cfEaRbWKbVOvBkEdW6NyqyoXYmYdMZR2O+k7rbjLJ3V2UhfQeaAHb98/zUYGyvfgC
         C0luD36a2BdMZdo79WI6uv365ROgVK2Ma07XC2CoZLmayTMEuOkFSBBgR6YqFfoEdvIv
         yaRA8oUS+WFJZIcrhIS9w0FbVxUmimXJdD4uCNq8ExdNbtNNvd/H6ZCeA/W9CZr12MXs
         rjIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=4o9trgrlIElvRjiGQFP4XYM2yIPWspMxkKntFYMYuBM=;
        b=x9tJGocugspk8iYeAb+FmIWfVo4+Nznh2v/8cwS7Hscxyd7y9OPR/QMPXVAFlbdPaN
         euygsq967fdBHA7V6rYtII0MsnacQZSFzOByjcz8ejQP2R1jqExiRK8KtRn803QNFstv
         v3LFuClzaYQ5MzbGxo5DaaNxdum9aLj+uvbBh94XmAJGR07dAFsw5DTkfbq5Qt3Cn9pa
         IAFbP1ixBsON7u8cSRaRCmHVboZAKchCU1/aHM7Rxyv+9T+JhZOFBzAYRSb1spwCMa5F
         nkRAxSh/n0b6N8Rj2U1q7EcDesZAc56FyLaAuGFq4u9wTCJOWn6uXc+k+G0qVxR+rRum
         u8Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x24-20020ac87318000000b002e1a91ed3b0si5903670qto.597.2022.03.15.00.59.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Mar 2022 00:59:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nU25A-0000h1-A3
	for alex.bennee@linaro.org; Tue, 15 Mar 2022 03:59:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nU24q-0000dx-EO; Tue, 15 Mar 2022 03:58:44 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:26132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nU24n-0003kf-K0; Tue, 15 Mar 2022 03:58:44 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22F7loYq061296;
 Tue, 15 Mar 2022 15:47:50 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.100) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 15 Mar
 2022 15:57:56 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v2 0/2] hw: aspeed_scu: Add AST2600 hpll calculation function
Date: Tue, 15 Mar 2022 15:57:51 +0800
Message-ID: <20220315075753.8591-1-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.100]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22F7loYq061296
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=steven_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +XBx/376u58g

AST2600's HPLL register offset and bit definition are different from AST2500.
The patch series adds a hpll calculation function for ast2600 and modify apb frequency
calculation function based on SCU200 register description and note in ast2600v11.pdf.

Changes since v1:
- introduce ast2400 and ast2600 get_apb_freq class handlers.
- introduce clkin_25Mhz attribute.

Please help to review.

Thanks,
Steven

Steven Lee (2):
  hw: aspeed_scu: Add AST2600 apb_freq and hpll calculation function
  hw: aspeed_scu: Introduce clkin_25Mhz attribute

 hw/misc/aspeed_scu.c         | 45 ++++++++++++++++++++++++++++++++++--
 include/hw/misc/aspeed_scu.h | 19 +++++++++++++++
 2 files changed, 62 insertions(+), 2 deletions(-)

-- 
2.17.1

