Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1011858ejb;
        Mon, 5 Feb 2024 01:20:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJVY6Td9YTEzAluu/uguz1zEHCTn7fpEkuSKre/adVzcYGcqTY0v6vPWP8DVVPr7hE4VeF
X-Received: by 2002:a05:620a:22e7:b0:783:3823:4d4a with SMTP id p7-20020a05620a22e700b0078338234d4amr11093564qki.62.1707124842093;
        Mon, 05 Feb 2024 01:20:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707124842; cv=none;
        d=google.com; s=arc-20160816;
        b=g/6IN02yiqW/RAPUxZW4p6+Ife0H8+JhxoZXO8oOsDhk+dAo5DMduoNXKMc29Fza2p
         6xt0+k3uUQb+6IQIzpDcEGoaEpi4PAcA1XfeES5qIV3hOx216H18UkNXO8CPSUbzpmJs
         VTlplUlY+qm8LlKUAUi0TOkFUsjk//HCd0qfZlyEjYLR4orydkRJzn2MSGk+ea+QrZI5
         CIQGz8CAgok9UXZwiE0pBgm0xfbq9m2uSfwWf21GuStVLxXDRCZOIrcfScq1Knul52bf
         AOdYUSXmlCAJb+bhz3yE74eW8F36JVWy/3T9+wyVAU7q5C0cU1pnE2Fjc97ZPbeM+TPn
         mO2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=DFK/c48VDzMmaNbEdKjUCymDMXgLUGYiyfLd3/R7R+w=;
        fh=oyIZ0SHe7fiqNZ6g5AkE1p5keQExM97RcDuSs0hEJg0=;
        b=GzeSOafsePG+LdvRkXZ5pu32BHL9OZ8wNYUQQbNGu/bEspLkxOgQRPn7mDmT+scd+r
         kyJq6NCGFRf/09qQNvp2Yb/MAEWIkU4eEc86odE8E/eT4sBJN+H0YUMbkC+DQcbUhDoh
         ZrpPWUlNWcfaWLufIqcnx20I6pIg5ALsh7atI2sxDh9MNJzLfeF0w96XjRODPxBsR5CN
         NRDvXDx4AsN2rSuwaajsuouqIUgtL0jZeS8EY2CuBF7wDqqbCLlDJ8PbgNNEpLqxWQ4M
         lBpcZHtNVZ2K0JtrIXt1CE1qSb1zc6jQPPp5zr7u34lxR7qz9AL3l2UwZUkwEcxhstf6
         3Sdw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
X-Forwarded-Encrypted: i=0; AJvYcCVWyMvDPEZl8RssuOJbcLqCsiFL5Ko2OT8w5NchBDeRgyT/FGL7eIn37PHrdgVAONfQI0F82erArRngGlFM+5TafWL+P1EJ
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i10-20020ae9ee0a000000b007837f71c062si7960600qkg.56.2024.02.05.01.20.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Feb 2024 01:20:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rWv9M-0004Gs-Bf; Mon, 05 Feb 2024 04:20:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rWv9A-0004EC-NW; Mon, 05 Feb 2024 04:20:14 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX02.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rWv92-0008Gf-S9; Mon, 05 Feb 2024 04:20:12 -0500
Received: from TWMBX02.aspeed.com (192.168.0.25) by TWMBX02.aspeed.com
 (192.168.0.25) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 5 Feb
 2024 17:14:16 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 5 Feb 2024 17:14:16 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [v0 0/2] uart base and hardcode boot address 0
Date: Mon, 5 Feb 2024 17:14:12 +0800
Message-ID: <20240205091415.935686-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=twmbx02.aspeed.com;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX02.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.001,
 SPF_HELO_FAIL=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: z7/9jBo1r97M

v0:
1. support uart controller both 0 and 1 base
2. fix hardcode boot address 0

Jamin Lin (2):
  aspeed: support uart controller both 0 and 1 base
  aspeed: fix hardcode boot address 0

 hw/arm/aspeed.c             | 12 ++++++++----
 hw/arm/aspeed_ast10x0.c     |  1 +
 hw/arm/aspeed_ast2400.c     |  2 ++
 hw/arm/aspeed_ast2600.c     |  1 +
 hw/arm/aspeed_soc_common.c  |  4 ++--
 include/hw/arm/aspeed_soc.h |  1 +
 6 files changed, 15 insertions(+), 6 deletions(-)

-- 
2.34.1

