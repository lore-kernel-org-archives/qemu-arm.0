Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp242001njg;
        Tue, 25 Feb 2025 06:15:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVVN29hmEyAsZChAAsW5Qtrzqw0CCpPbumOv6/IfDSkLdr/vMRZZaE4uVDoYThqsnsXG+MHwkeDjGhUIA==@linaro.org
X-Google-Smtp-Source: AGHT+IFCUPHj6xnl8T/gZoNwedSyeb/UpsiS5XAKdi5uM5Dc9gpkp3Ru7fchSjOwE3L8H6LDXK7V
X-Received: by 2002:ac8:574c:0:b0:472:6c9:3741 with SMTP id d75a77b69052e-4722289f2a5mr202546061cf.9.1740492920509;
        Tue, 25 Feb 2025 06:15:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740492920; cv=none;
        d=google.com; s=arc-20240605;
        b=bxXsoaBR+2hb1LVvXxItWNg67ngBW2OnMpE/enALl0vJYHMQ7/G0iUHtk9T3XukKE0
         CVeE1wq6ouTk6HYPQPyuOBxUPquKHTMu+8s74pxeFqTi9wbqU0hhHZCg/0G1geojJHYe
         0PbUFnnS8qWRkb/hDi74hQfUFgOQ4oIzAcgdvAqJEU9wifHjsEpe6Qod9+Hj8fbMo9nh
         2DmIMWg3wcikVWLEnRc7drGodZZZPF001aLcL0HEFF+7KS1TCiyxj7eWz/F97DTeed+w
         39/9BvEgibVMmDVJloMeSRmJVzjMgWqugdxUvYaWBdl4VHwTNDud/pUBh9M4rd1wJd8p
         ITWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:to;
        bh=jgRNEFWGA9dBYaLSLVYR+sma+ham3tlV1KoBqRQje4c=;
        fh=5JL7mqVb0xJPQxAe5ZtlV0oPd81juhKpcMs9GAwoilE=;
        b=gVBR88rkcov8YFAIQ3qlGfkgSdd/4h9Z1X4raRLxDZsvZuAeJG0ykbOM5pJJtV0E7f
         KWr4bmuyboAQaa1OWurNz5dkWk1ATR73ez5rheTjgTSXyUwyIekpYalL3gNMcreVX0px
         Gkft3jKpDNWe0+W0tqyquYhjfMCJDcQBJrwMNkf4LhszfhClU/pViBiW0F8vwXmFEwCy
         ssCOAX+QAJ0C/Otd1M7WFA85H2kajHNlM5gSfCzW2Fydbyaklewkxwq6Ku3lIqXSXd1k
         2F/WRYGe3awJ/Lgb/Yu+3OGAWwLsKTGUe0xD6chPeaT7s5MgA0fbZiJs/egKFRmCIKKw
         Ohbw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-473780b4e4esi15672111cf.610.2025.02.25.06.15.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 06:15:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmviC-0007Ba-VS; Tue, 25 Feb 2025 09:15:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cy_liu@aspeedtech.com>)
 id 1tmpWp-0006b6-Fx; Tue, 25 Feb 2025 02:38:55 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cy_liu@aspeedtech.com>)
 id 1tmpWn-0008HP-4I; Tue, 25 Feb 2025 02:38:55 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 25 Feb
 2025 15:33:42 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 25 Feb 2025 15:33:42 +0800
To: <cyliu0926@gmail.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v4 0/4] Support HACE to AST2700
Date: Tue, 25 Feb 2025 15:33:37 +0800
Message-ID: <20250225073342.2960966-1-cy_liu@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72; envelope-from=cy_liu@aspeedtech.com;
 helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 25 Feb 2025 09:15:03 -0500
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
Reply-to:  cy_liu <cy_liu@aspeedtech.com>
From:  cy_liu via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TpCDpnz3pSJ3

From: Jamin Lin <jamin_lin@aspeedtech.com>

This patch series is from https://patchwork.kernel.org/project/qemu-devel/cover/20250213033531.3367697-1-jamin_lin@aspeedtech.com/. 
To expedite the review process, I have separated the HACE patches portion from
the https://patchwork.kernel.org/project/qemu-devel/cover/20250213033531.3367697-1-jamin_lin@aspeedtech.com/ patch series into this new patch series.

v4: Support HACE to AST2700

Jamin Lin (4):
  hw/misc/aspeed_hace: Fix coding style
  hw/misc/aspeed_hace: Add AST2700 support
  hw/arm/aspeed_ast27x0: Add HACE support for AST2700
  hw/misc/aspeed_hace: Fix boot issue in the Crypto Manager Self Test

 include/hw/misc/aspeed_hace.h |  2 ++
 hw/arm/aspeed_ast27x0.c       | 15 ++++++++++
 hw/misc/aspeed_hace.c         | 55 ++++++++++++++++++++++++++++++++---
 3 files changed, 68 insertions(+), 4 deletions(-)

-- 
2.34.1

